Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5827C4708E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Oct 2023 17:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6058781FB3;
	Mon, 30 Oct 2023 17:39:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6058781FB3
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=fsbmZH/8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pK9vEF2tfyEz; Mon, 30 Oct 2023 17:39:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4006581D24;
	Mon, 30 Oct 2023 17:39:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4006581D24
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 25018C0071;
	Mon, 30 Oct 2023 17:39:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A088FC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 17:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B9E381EC7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 17:39:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B9E381EC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VuKL90vA6p4H
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 17:39:21 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20610.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8d::610])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5403481D24
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 17:39:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5403481D24
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dv9SOBbIOyhLXsEN5aMwoN7Uupw9y4Cp5GNYfXUZCZAZfYzMNrwSj0zEdizvaqGig50w1CGS65oXa2yaFF8CYMgmOEj7nWzfaEPbolRd99yC9EhESqXquTPm/teUgeVxDGFxkLrCHtD91RQIo/nvYa+4q4Gt3E/Pthf/l3FdSl2rEPbb8OOCKal4MU+6IngiJnhO19yWQNPs3MiLGirMhx4QhVf0XjI07HB4rIDeCnIWuNr3IWzOFQp8G6hyCXKth16/ZxSp3Q0JyP5+wZLixGU9WOeeGz8mLbeFNWGuo0//0ajA/19Tlq2+ke5lxJqs1WnaVt4AFEGLOTHuTEDkSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5EAt8PeKlQaEqmqYVtFlcxOQcpgbeMLP8rhx416CHs=;
 b=BUoactIDz+utPyvA+535MqKpPCRSiH/By9eg445Q2q3NI6MsM0VEIdDv/t3QrrbIOu/KHupONkxpL+IKG6g40XOGKbnI4Yx3MyiVAkNY5DZ/LYU8+5kmOgToMW9GzpBF1vWgN7h3imzSsNedK/r7wh7yo/KTiacZKknPBBdMwr9hEq7i09AQCHpG6wPqDqJH4cZ6cV4693kpnAA6lQdTTMwYL/Ug9CPVGQxSZtUo1kUz9rjVQFmKnzUY4LO7F3yvyJwvHO0kJt10Tg5eOBhr1jdFICi/c9swGxwUAp6dPRhoz45vSPObzwlqspduzXnKp9x2x/A+Tpy+QETmRUznsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5EAt8PeKlQaEqmqYVtFlcxOQcpgbeMLP8rhx416CHs=;
 b=fsbmZH/8IhSF+nYR9yfC0jcfwV+8k8MorTmEkVBb+jjPiF/bcWqJci7TRPqlIhWB5LMDE1kVTXbMG1jIXJqectEBywV3GqdlD+bRvmM2Hp/cE53KI4lgg9jtRUq3DuL6jQbHFITnzv34E7/gLbkjVAQPsbSqPeh62WmrZnn4piQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5284.namprd12.prod.outlook.com (2603:10b6:610:d7::13)
 by PH0PR12MB5608.namprd12.prod.outlook.com (2603:10b6:510:143::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Mon, 30 Oct
 2023 17:39:17 +0000
Received: from CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::33ed:3162:e4ed:3569]) by CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::33ed:3162:e4ed:3569%6]) with mapi id 15.20.6933.028; Mon, 30 Oct 2023
 17:39:17 +0000
Message-ID: <9ca19ca8-d3c6-4789-a9d8-4f1637bfa71e@amd.com>
Date: Mon, 30 Oct 2023 13:39:15 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: remove redundant check
Content-Language: en-US
To: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 skhan@linuxfoundation.org
References: <20231030171748.35482-1-jose.pekkarinen@foxhound.fi>
In-Reply-To: <20231030171748.35482-1-jose.pekkarinen@foxhound.fi>
X-ClientProxiedBy: YQZPR01CA0171.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8b::29) To CH0PR12MB5284.namprd12.prod.outlook.com
 (2603:10b6:610:d7::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5284:EE_|PH0PR12MB5608:EE_
X-MS-Office365-Filtering-Correlation-Id: bc5fd766-c755-403e-e62d-08dbd96f240e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z2F2MJOJ4GcJXEkgGWzK3CPXPe5mdwEmFzHy/Q2Zgs+xhIWRmsY8dsjIre3wCxde8nvPzWCly1Y7qHsqRlKMVrbiJKkh91tU+epeSKI+gjf29p9S/cDU+Zc3zqQoJ7zlKxfvRG/xofXqY6Od0xOyXs3ZKEbNHBEWxOF1R9bS5UtfayFx3BQNekNXlYqiqu2+AEditbmLEAHe5SoKKmVsEgFC2xZKUGnWrFT4zHbSyLioe+aIdfPHV/olLqkrN7z75H3ztUp5jEMyN4gxNGqyo0Y4rHh2+2M1OUyeUdcmVE3inGRy4qkhUDTlxSjhgCbftfY8N0v9rmnfPQ2LRSJEAVv3HW71HeXz4qd4DAFAlruSr7azBKB0exa9OFIu6RNO2xRlqZ+6+HOcMNrzJGVJICPjgnipGkYqE5vKdDB4k4OYEg2oFetEJllE6qSuXy/AeZXZHJNelAIY+x6sozfj8r3trsSneN5HTOt1ohs7AJcI2UQV8FNpOeSenQIrLBMiD71cp6dOLRLaUpqjBMGEdE1F5fhS2FtnDSbngy7vPCXozgDakOIbmaz0YhTO5mGRbIbmD+erV6lcH8xjMXMQctY4mAMXty9rFgVIPQ56bBfcXITWhxLrBS7l/9HUhwNzUp66VBxBgAasvjx9XB9g60tnwNVcEe9fXf6zhTAR+OqN5U7L5O6iCPAmy43fPfd8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5284.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(396003)(376002)(366004)(136003)(230922051799003)(230173577357003)(230273577357003)(186009)(64100799003)(1800799009)(451199024)(83380400001)(26005)(2616005)(38100700002)(66946007)(66476007)(66556008)(316002)(5660300002)(8676002)(8936002)(4326008)(53546011)(44832011)(6506007)(6512007)(2906002)(6486002)(41300700001)(4001150100001)(478600001)(31696002)(86362001)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3FIaGtJZm5xamEzaGRaUHNHdzhkMkZKdWNCOTdsVUF2dFNqNlRFY0NlM1hu?=
 =?utf-8?B?US9CYkZIUmpLZUJ5SXB5OVd1Vlg5U0NmUlhxQnlHWXZEWitLOFdnQTVTalVU?=
 =?utf-8?B?VHhIa0VzbjZLSHNCRllBVU1DaUhHY1hZdEgxRlVHRkZuQnZoOWU2bmVyTk1j?=
 =?utf-8?B?Vzd0WmhFZk5ENlg5UTV0eWlPTkVhdFI4ZjE2QzMvdmxxZG8wU0NuUUZ4T0pj?=
 =?utf-8?B?R1BqZitSVWNyL2Y0UUhYbERqUi9NdmhteVU5S3g4cVcvMEpHZ3pyek1DYTZQ?=
 =?utf-8?B?RzlxQ3VQQTlPbXk5bmkwREprbXc3SnlNK0hIQ1NRMU9TcVQySXU4SG9qcVpa?=
 =?utf-8?B?dDIzMHJkd3gzOUVVZHpINzZ1ZTRxaHlxajB6Vmc2dllHRmZQbmQ4MC9KYTdK?=
 =?utf-8?B?dXJCRTVQb3QrSnFSOEdkVG1WbjVqVW9ZcjlLeGRlUm41a0NrUkV6bU5OT3NO?=
 =?utf-8?B?THJ5Y1EvOTFCZWpKQUVjSkpxU2VXOXJuTWk5eXg0UzJ6L0lBVEhQSWQ0b3VD?=
 =?utf-8?B?d2NhTUcrYjIwMWI3WEwzenZObTBuQWN1MTl2ZGJmQXA4eFJWOWRvR2xaVlRZ?=
 =?utf-8?B?c2JrbGJISnNOdkhVSXU4SUh6VVIvMVp3TzNmbGxITURLU2NSRTQ3T2puTC9j?=
 =?utf-8?B?d25QQzV2SkF1Tm9FTUZ0UU9RaXB3UnZrdE9GVlB4QnBuZ1NsNEVzcGVTOFdE?=
 =?utf-8?B?S1VEVWdwVWRzaHphVlY2RER1NkpQVm1sbGFQVnJrUVdWREoxUVhTaVcvNXFS?=
 =?utf-8?B?T0JMeURnRGdPMkhYMWM3dHJJeEJ2T2R2T3hsVnNsZ1oxTmlLZ0YvM01ZOWNj?=
 =?utf-8?B?VEJFdDgvNDZXdXhqeXhSMVhnL0hWbWZ2Tm1CSmNLUkwxUjBSRDFjYzZObzIy?=
 =?utf-8?B?Y2krMGpxbXNHU3Mwc2M0UXk4TFVyaXF6UUVpRmpWZ09Gc0QrbjUzWEpENVND?=
 =?utf-8?B?NWN3SnBNTTBFV2Y4aTFGSVpubVBOZmZmTEFFcG5EWjkwR25Da2toR2dOT1RF?=
 =?utf-8?B?WXZiWEVsSVR2RUJ5cFA5cXlkV2VHN1ZYYXJUaXB3ajlDOFd1M0RweXlaalo3?=
 =?utf-8?B?a0FOVlUwOENFaUlJb0svcGpROHFUZHdsb3BFQVFpck10Y3ZnbVZyVnBzUkJ0?=
 =?utf-8?B?akMvckU1b2QxbW1Kc2dWUVA5ZkV5U0kraVRSL3hSV21tZFJFUVJkeUtxakEw?=
 =?utf-8?B?NnFrMWRtdm9CSkpYTitIUmkveFJ2S3FrVHFycVVFbS9LNk5IZWg0TndyMW80?=
 =?utf-8?B?dVNBTFhEcEFTQnBJSlorbGZUbkhFY2phMldaQ0pqYnNLTGQ0MHFidnJ2K1Vt?=
 =?utf-8?B?YlNXT1hvaDQ4L0lvUmpKdW1EZTJhVi9ROUdmNGZzT0FFSS9jbnpGK2MvY0xn?=
 =?utf-8?B?UjVpcFFYdWQwVFNWS0c3MUh1S3hXM3htMU5xTTU1SjU5bVpUTUozaXpmeDRC?=
 =?utf-8?B?SDVJdktZdi9FeVZhQ2tsYjFWQ2ZhTmdLaldhSVNWQjJFTThVaEdZNG5ZdkFG?=
 =?utf-8?B?UzVTMDJLckVtWHRnbEIrRXdLUXcwRGhZKzlFNnJGWjJGb1hiRVk2a1Z2TmVS?=
 =?utf-8?B?WHc5ZVBZWTlsMW02N29nVWE1Lzloa0NsSzJ6M2d2WUVKNmFpa3ZXSlVZQU9S?=
 =?utf-8?B?Q3JMTVB0b20rbXVycGtTR25FRG5IK1JvejczU09kdGpXZEtxbE9kbGpPYnZC?=
 =?utf-8?B?eXR4dFVHNldMN29NbE90OE1SblZRcXc3d3pxVi9MS2R1WmkvbTFaQzJ4bzBR?=
 =?utf-8?B?VnV3dmRNb29MbHM1K09HSzNpSjJnNk5RSE8xbEMvTW9YaHZWaFRrVithVFpm?=
 =?utf-8?B?OEFiUzVLZXpDWmx2K0Q0ckI5V0xLNU40REpILzg0UkxIei96MjJCbzV6Z2tU?=
 =?utf-8?B?UzlGejdiS2NXWTVKc2tZWEFSZjZsZmh3eVl4Rm1MM2ZjcnN1Tit4dGV0WjZK?=
 =?utf-8?B?MGI3REhWWG04Z2tNSThyVW5XZkFuVVJ2ZFdWM2RoOFZMbXBvR1JSdlE2WXhY?=
 =?utf-8?B?TkpDR2pDdUZUbFNmdEFvUURHdGZwTjNIaDR4dGl6L0FKS0RzcjVQaU53M2lN?=
 =?utf-8?B?ajVHR2xyanlQVlZMREY5Q1RkVTdNb0JGK05rQXQ2V3pvSllMV3lFMXRoZGhO?=
 =?utf-8?Q?Tc/IxRUXEpCcx9FrO+k9l9eGp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc5fd766-c755-403e-e62d-08dbd96f240e
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 17:39:17.4307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TkAkzrt9Qh5WMdA3bqsD9q+hUNS68Fx5gVZ1MDS/eD/Jq7pA4O5s7ejDgLJ8UnYjVEm+5TE7HPufT/sAuAUpcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5608
Cc: dillon.varone@amd.com, linux-kernel-mentees@lists.linuxfoundation.org,
 dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, samson.tam@amd.com, SyedSaaem.Rizvi@amd.com,
 stable@vger.kernel.org, daniel@ffwll.ch, george.shen@amd.com,
 alexander.deucher@amd.com, Jun.Lei@amd.com, airlied@gmail.com,
 christian.koenig@amd.com
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
From: Aurabindo Pillai via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Aurabindo Pillai <aurabindo.pillai@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

CgpPbiAyMDIzLTEwLTMwIDEzOjE3LCBKb3PDqSBQZWtrYXJpbmVuIHdyb3RlOgo+IFRoaXMgcGF0
Y2ggYWRkcmVzc2VzIHRoZSBmb2xsb3dpbmcgd2FybmluZyBzcG90dGVkIGJ5Cj4gdXNpbmcgY29j
Y2luZWxsZSB3aGVyZSB0aGUgY2FzZSBjaGVja2VkIGRvZXMgdGhlIHNhbWUKPiB0aGFuIHRoZSBl
bHNlIGNhc2UuCj4gCj4gZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kY24zMi9k
aXNwbGF5X21vZGVfdmJhX3V0aWxfMzIuYzo0NjY0OjgtMTA6IFdBUk5JTkc6IHBvc3NpYmxlIGNv
bmRpdGlvbiB3aXRoIG5vIGVmZmVjdCAoaWYgPT0gZWxzZSkKPiAKPiBGaXhlczogOTc0Y2UxODEg
KCJkcm0vYW1kL2Rpc3BsYXk6IEFkZCBjaGVjayBmb3IgUFN0YXRlIGNoYW5nZSBpbiBEQ04zMiIp
Cj4gCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBKb3PDqSBQ
ZWtrYXJpbmVuIDxqb3NlLnBla2thcmluZW5AZm94aG91bmQuZmk+Cj4gLS0tCj4gICAuLi4vZHJt
L2FtZC9kaXNwbGF5L2RjL2RtbC9kY24zMi9kaXNwbGF5X21vZGVfdmJhX3V0aWxfMzIuYyAgIHwg
NCAtLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kY24zMi9kaXNwbGF5X21vZGVf
dmJhX3V0aWxfMzIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbWwvZGNuMzIv
ZGlzcGxheV9tb2RlX3ZiYV91dGlsXzMyLmMKPiBpbmRleCBlY2VhMDA4ZjE5ZDMuLmQ5NDBkZmE1
YWU0MyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2Rj
bjMyL2Rpc3BsYXlfbW9kZV92YmFfdXRpbF8zMi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RtbC9kY24zMi9kaXNwbGF5X21vZGVfdmJhX3V0aWxfMzIuYwo+IEBAIC00
NjYxLDEwICs0NjYxLDYgQEAgdm9pZCBkbWwzMl9DYWxjdWxhdGVNaW5BbmRNYXhQcmVmZXRjaE1v
ZGUoCj4gICAJfSBlbHNlIGlmIChBbGxvd0ZvclBTdGF0ZUNoYW5nZU9yU3R1dHRlckluVkJsYW5r
RmluYWwgPT0gZG1fcHJlZmV0Y2hfc3VwcG9ydF91Y2xrX2ZjbGtfYW5kX3N0dXR0ZXIpIHsKPiAg
IAkJKk1pblByZWZldGNoTW9kZSA9IDA7Cj4gICAJCSpNYXhQcmVmZXRjaE1vZGUgPSAwOwo+IC0J
fSBlbHNlIGlmIChBbGxvd0ZvclBTdGF0ZUNoYW5nZU9yU3R1dHRlckluVkJsYW5rRmluYWwgPT0K
PiAtCQkJZG1fcHJlZmV0Y2hfc3VwcG9ydF91Y2xrX2ZjbGtfYW5kX3N0dXR0ZXJfaWZfcG9zc2li
bGUpIHsKPiAtCQkqTWluUHJlZmV0Y2hNb2RlID0gMDsKPiAtCQkqTWF4UHJlZmV0Y2hNb2RlID0g
MzsKPiAgIAl9IGVsc2Ugewo+ICAgCQkqTWluUHJlZmV0Y2hNb2RlID0gMDsKPiAgIAkJKk1heFBy
ZWZldGNoTW9kZSA9IDM7CgpSZXZpZXdlZC1ieTogQXVyYWJpbmRvIFBpbGxhaSA8YXVyYWJpbmRv
LnBpbGxhaUBhbWQuY29tPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1l
bnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRh
dGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
