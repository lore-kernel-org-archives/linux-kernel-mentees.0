Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3EFEC00142
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Oct 2023 13:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 259808558E;
	Mon, 30 Oct 2023 13:52:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 259808558E
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=No5OfcqT
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zd6BuZu7VTuB; Mon, 30 Oct 2023 13:52:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id B9C468558A;
	Mon, 30 Oct 2023 13:52:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9C468558A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 887E8C0071;
	Mon, 30 Oct 2023 13:52:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 73BF5C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 13:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2751B43333
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 13:52:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2751B43333
Authentication-Results: smtp2.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=No5OfcqT
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rMQLLl9HI1u2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 13:52:10 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::60e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E273F43306
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 13:52:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E273F43306
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F3oOkeF4wWNFVx4maxn5gFDyQznnXvHUQZyUqH9nRDlDxwGuWl7zZ4Qiy9bIOHrzDoXmhnh7Wz/dmfRlLUWcG1dHBrFMLd3d5Q7xW8Z3Ru48Z1MNL3GtrwU1RW9cPzBlqqL/XORkEAepKOJpUDcYi1VOMZUfGnHWLqFCIuXAkKro41OvGIPhni0WwEDgxQCYKkELk/7M3v5ed288qdeJdvYNEwWIHU2XXRPXYjsiCTQrToNbAfkktVjgCYPVVBmyVTVJQEdHD1wUTaRujNgHh6LHcuiijvMv/+JBOaC+13LC6ipSwcrwPgoDhVBMzpqUiQ3FUBuG0qzOdQrntRC5YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WAvYyCUfzFWpmUDh+wAyeZQqRi506s2q/sPelqImZr0=;
 b=dVgcJGN7ylLU9f0aZhwhwP3GpTUtK6uH7oCfNrqYSfEBxHWCNgLHjoC5P0tYidf5RF4U3b2B45451tWGOKNvGJaoCoGfECzamVXhygMfZVR9B8Vtlijh1hCBTv/NIegiuIHM983qTu3rY9sisARiznqI7yqvK2gIw5kCt0y9c4frMQ5otLwe9PgW8ey1QHZAEe5jqscwEbIShGFjRRKSG/fqDTgl2CMCyI359Rh9G0+21ZcT9HjtqnmuE7rzk+g05kLHCjs3MMZDVQGIK0mb5BoIWLq8L8JLrKRZZMiWyTNgv4IEIGO0+3dXZSp4XMAt+T0u391KCS3haQyeo1/JTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WAvYyCUfzFWpmUDh+wAyeZQqRi506s2q/sPelqImZr0=;
 b=No5OfcqTMXdcp0nlY1SuXBiD3NWNRh5zWnAbxnCUeVjakVkvUVjQl3+jxD+HE4F1Ot6Lok+zOACbAlM5uf1c3hub3sdnhnFllXvMCsubzvButAncrJsMsGVRE0Xv6j7rwVilF8oLSQP/KZ9J2aOKkU5cHrptvkgm/Jr5iifGrzM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5284.namprd12.prod.outlook.com (2603:10b6:610:d7::13)
 by MN2PR12MB4533.namprd12.prod.outlook.com (2603:10b6:208:266::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.26; Mon, 30 Oct
 2023 13:52:05 +0000
Received: from CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::33ed:3162:e4ed:3569]) by CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::33ed:3162:e4ed:3569%6]) with mapi id 15.20.6933.028; Mon, 30 Oct 2023
 13:52:04 +0000
Message-ID: <ce1b69e1-fa38-2e12-1ad5-375ac244af42@amd.com>
Date: Mon, 30 Oct 2023 09:52:00 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: remove redundant check
Content-Language: en-CA
To: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 skhan@linuxfoundation.org
References: <20231029124404.16159-1-jose.pekkarinen@foxhound.fi>
In-Reply-To: <20231029124404.16159-1-jose.pekkarinen@foxhound.fi>
X-ClientProxiedBy: YQBPR0101CA0276.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::30) To CH0PR12MB5284.namprd12.prod.outlook.com
 (2603:10b6:610:d7::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5284:EE_|MN2PR12MB4533:EE_
X-MS-Office365-Filtering-Correlation-Id: 2210fe1d-0435-4c48-0248-08dbd94f6653
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TUYzhs0CLnmwr23cS/36s4UeCIRaPBd0wKCFRMpnCEOOqVbnRwuIaZDkv8ftmVqT8yLwThR1HZlbTUE+zOD2oxmQDWAbw24rnmbBdonvTEyQhXzy+aojNuIpO5cu89T5iVKjoMkkaVnyd9dhDoAcJlMubiiEPn3G+GTDpYtWS/xC6+Oq47y4xjIemVbZJCLNTIUInqKu3lwok19Ke+Fq34rT7iY251mtTTznMqPuPUFe0VxSYLTSrjsMHY8G+/E0jfcgmnBy7iHiOTOsdRcSQOnGni/MgcZNEyAkd/bRtfGfR5r6R1g4DWzNLF9wHYmM8XO9OoQBJZRaEtO9YuY+Sqlnn8eIzZbyu6NF2nsDQllKORWPDkKfuleEqLhkl8fXUcda+aguptE3LRC26vD+iaukVoUKHkYiRBf8aOYjqgKCRa3iyh4XymwyRcjvATVQMA0/RjzOxMBmfvltEwerMGzXaMJRXXTjWGZ9kofVlpGVidGPmswLrGkmAmGqFDsfjjMtU97GEgQIo2rqnxVlEmGgWe734iUvtCrHQ5aCjf1ys8ldHMDAPUYubbvWiqYQI2QhvYynyzoK4AifDvNwuMV7pRAAYsp6cb6QUIXpH/9UeqHc7RRNhBtcBkt+R6rXu2x6ngidUN1UiMFT8idvKMyPTeoUsJWPKs1l+Z2LIs+mg2BjBfWHJzgOMC0YPKgf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5284.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(346002)(39860400002)(136003)(230922051799003)(230273577357003)(230173577357003)(64100799003)(186009)(1800799009)(451199024)(6506007)(53546011)(6666004)(6512007)(6486002)(83380400001)(478600001)(26005)(2616005)(2906002)(5660300002)(66946007)(66476007)(66556008)(8936002)(44832011)(8676002)(4326008)(316002)(31696002)(86362001)(36756003)(38100700002)(41300700001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkphMldpTktnbS9La2pVMFFGbGkrcFlwTHZ0aWpaSTRKbHkvVkRwT0JPeUp3?=
 =?utf-8?B?WktuU1ZIOHZveTdHUWRUd29NU29jTEpISDhqNGg5YVBxRHVwY3hLb3hCRmU1?=
 =?utf-8?B?SXJBNW5rdXYrM25Ldm1hbmIyRzRjOXRUeG4wTGdwc21QK2lFWkhmNmhpNURl?=
 =?utf-8?B?ck9WdlA4K0NVcksrYzhESUQ2TnhaaGlrOThDQVJhbjNnL0crSGUrZE1pMkU4?=
 =?utf-8?B?R1RHaWpxNmhvcFJuRDhFV1JVRWs2dHN2Z2VTL01TSjV3R3BpZXovOEt0WjVQ?=
 =?utf-8?B?S0huRUNIWDdwM0hRZzlVMEg5dlhTZkk2eWh3bERrRHh3WTRTV3N3NUlSZDZL?=
 =?utf-8?B?SkhDOGpFMzVJS2NaWVM0MXVBOElMM2hQaFFYU1IyZzBVYmpaVlEwOWVWOUtp?=
 =?utf-8?B?cmw5NTBHRUU5akNFMTdZVTJUc0IvTk1WbkdZcjRDMCtoK0oxWmFrQ1RKdWZX?=
 =?utf-8?B?dzhDb0xzZndub05CekdKOHBYeFJNbXYrZkpBL0xTWk5LS25JS1RJcHZ4NWpZ?=
 =?utf-8?B?R2JRcHVTU1ZtWExPYzVDdWo3YXlsUFVqMDdPTXdpNUdYeVlmUlZ1NWdJZUto?=
 =?utf-8?B?U09HU0IyNC9mbFdsMmZuT2IzVUNzSDFBa0JGc2NoWEJXeFZicG5Pd1V4VWQ1?=
 =?utf-8?B?emJrSi9hcjJZVHN0dDFzZ29yK0lnQkg1WDNWaWRIWVArWURsSmNFMTJMQ3ht?=
 =?utf-8?B?WDB0eWN2bTNSQUpZeEhVMndvS0l0VWEvMWVBSmI1ajRZK09iUmRnY0JobDNq?=
 =?utf-8?B?eE5hMjB3OEFVT3hhWmxlRzdpaGkvSVJuTUhlQ2djbXA3M09jNVFmam4zQnpG?=
 =?utf-8?B?dGZZZlcxRkh0YnFidXFzT01PRXgxNzh4TE5GQk1YYUdxbys2aFo1ZDBxT0oy?=
 =?utf-8?B?RXBLWXFUY0NOMHZGZG01aVlYQU91SjNDR0lEbHRGbWtXQ2pUaXJubnJaUkF4?=
 =?utf-8?B?eXhRaDA4WjlSNUZLQnY1UnZDRE9rY3ZGL0VyaHR4STIwNjJRMDFsNzZXbjVE?=
 =?utf-8?B?RUxua1dGb0huZ2xENEIrY3lvQ0RNMHFVeHp6all0R1hJRE5EZUdlTklJV2Jl?=
 =?utf-8?B?TDZVWHFtWC9MbmlDS3QwSFkycjl2dVMrcTQvSGRSdjA0bG9qSnBFZG1rT2lp?=
 =?utf-8?B?bHdteTBma2dCQTN0MlFnelBIcCt6V0Z4TEpzZ3BqaWJSUXo1ckhvRVZVdTJL?=
 =?utf-8?B?Y1ZSVVBuUzBEK2hNMWxGU05MTzVpUnZORjJUb216cmNGQ1RNakNjaVN5R1RZ?=
 =?utf-8?B?a0tjZFN2Mk1IYXFRZ0tocE9Sd0NrT2xvM3pHQXNuTkFsb0dGMkpvZWZWekhO?=
 =?utf-8?B?TWVZWlhNaWVSeE83WXd6R1RnMUZKZzhEYktKUU53VWZ6MWlsQ0laMEl6K3NQ?=
 =?utf-8?B?NUZyOG05SElucUJoMXdXdzdMcnJRQ1BaWWlXNWtPU2paV2lFMnZIcWc4Y2Fy?=
 =?utf-8?B?R3dVbmpueXVCV1RtYnZPZkM4U3FveWFqS1IzK0RDUnF6SFVLOTh1YnJhL1lV?=
 =?utf-8?B?WDA1dXFTVEtCdXY0RmlzL3ZKV2hYSDBuMnBhdjR0R1Iwa2dhVHBOc2lmeUh4?=
 =?utf-8?B?eHN1ZXBaT3VpK0lvYlJvcEk4YWw1V2tFOFBZM0QyQ0JQTW5JSjdHRXJ1MGpC?=
 =?utf-8?B?QzZ1cUl4R3U2QUMyQ3J2eVlMNExxaTZMRktnMktza25jZVptV0ZMQVFVOFhN?=
 =?utf-8?B?NEZQL0x6VjZVc29VN09rcHMxbExZdXFHM0dBeVZZMFRyVU5vd0h0THhnY0pk?=
 =?utf-8?B?OGpHZlFJdE1oanVXOUV0RDhNMFVvQ1o5VW5aa1ZZWUZibEhkUHhacEgxM3RD?=
 =?utf-8?B?eVhTV3RjU0UvZitGZXBmQ0FmVENDcm9RNG5NdzBTeHVjd0p1d1Bmdmk5d0tI?=
 =?utf-8?B?UU1IelkrNmFEVmN2cE4weDhnSUNlZ0dkK0tsTDErUkVXSzkxQVEzYmpGVGpJ?=
 =?utf-8?B?K21kRWtSc3VWVWl6L05tR2Z0Q1RQNHFON1QvOVNtd3JEVk5YM1FLSUxKZVVm?=
 =?utf-8?B?NHQ3TS9aUms5RjhyS0swK2dNK3JaNnowcmFleDVTT3hrNFNLQlRkUlJzQkFq?=
 =?utf-8?B?NnI1cE1pMW1RRm9ia0RhV20yLzNhQlNMY1YveGpuMkNyQ3FLMWV5R3RVb2Y4?=
 =?utf-8?Q?yfvIuPAiD4UiN6/Dv5t3YAmVA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2210fe1d-0435-4c48-0248-08dbd94f6653
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 13:52:04.7773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: swi3s53oDuxj3i0pQTXhzRYMB20+xKi0Rx5i93JJgTEY2Rvia0WNuwiUAZ3ayQ7neWROSDrdr+3vmGZJKN9cBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4533
Cc: dillon.varone@amd.com, linux-kernel-mentees@lists.linuxfoundation.org,
 dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, samson.tam@amd.com, SyedSaaem.Rizvi@amd.com,
 amd-gfx@lists.freedesktop.org, daniel@ffwll.ch, george.shen@amd.com,
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

CgpPbiAxMC8yOS8yMDIzIDg6NDQgQU0sIEpvc8OpIFBla2thcmluZW4gd3JvdGU6Cj4gVGhpcyBw
YXRjaCBhZGRyZXNzZXMgdGhlIGZvbGxvd2luZyB3YXJuaW5nIHNwb3R0ZWQgYnkKPiB1c2luZyBj
b2NjaW5lbGxlIHdoZXJlIHRoZSBjYXNlIGNoZWNrZWQgZG9lcyB0aGUgc2FtZQo+IHRoYW4gdGhl
IGVsc2UgY2FzZS4KPiAKPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2RjbjMy
L2Rpc3BsYXlfbW9kZV92YmFfdXRpbF8zMi5jOjQ2NjQ6OC0xMDogV0FSTklORzogcG9zc2libGUg
Y29uZGl0aW9uIHdpdGggbm8gZWZmZWN0IChpZiA9PSBlbHNlKQo+IAo+IFNpZ25lZC1vZmYtYnk6
IEpvc8OpIFBla2thcmluZW4gPGpvc2UucGVra2FyaW5lbkBmb3hob3VuZC5maT4KPiAtLS0KPiAg
IC4uLi9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2RjbjMyL2Rpc3BsYXlfbW9kZV92YmFfdXRpbF8z
Mi5jICAgfCA0IC0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2RjbjMyL2Rpc3Bs
YXlfbW9kZV92YmFfdXRpbF8zMi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rt
bC9kY24zMi9kaXNwbGF5X21vZGVfdmJhX3V0aWxfMzIuYwo+IGluZGV4IGVjZWEwMDhmMTlkMy4u
ZDk0MGRmYTVhZTQzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kbWwvZGNuMzIvZGlzcGxheV9tb2RlX3ZiYV91dGlsXzMyLmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2RjbjMyL2Rpc3BsYXlfbW9kZV92YmFfdXRpbF8zMi5j
Cj4gQEAgLTQ2NjEsMTAgKzQ2NjEsNiBAQCB2b2lkIGRtbDMyX0NhbGN1bGF0ZU1pbkFuZE1heFBy
ZWZldGNoTW9kZSgKPiAgIAl9IGVsc2UgaWYgKEFsbG93Rm9yUFN0YXRlQ2hhbmdlT3JTdHV0dGVy
SW5WQmxhbmtGaW5hbCA9PSBkbV9wcmVmZXRjaF9zdXBwb3J0X3VjbGtfZmNsa19hbmRfc3R1dHRl
cikgewo+ICAgCQkqTWluUHJlZmV0Y2hNb2RlID0gMDsKPiAgIAkJKk1heFByZWZldGNoTW9kZSA9
IDA7Cj4gLQl9IGVsc2UgaWYgKEFsbG93Rm9yUFN0YXRlQ2hhbmdlT3JTdHV0dGVySW5WQmxhbmtG
aW5hbCA9PQo+IC0JCQlkbV9wcmVmZXRjaF9zdXBwb3J0X3VjbGtfZmNsa19hbmRfc3R1dHRlcl9p
Zl9wb3NzaWJsZSkgewo+IC0JCSpNaW5QcmVmZXRjaE1vZGUgPSAwOwo+IC0JCSpNYXhQcmVmZXRj
aE1vZGUgPSAzOwo+ICAgCX0gZWxzZSB7Cj4gICAJCSpNaW5QcmVmZXRjaE1vZGUgPSAwOwo+ICAg
CQkqTWF4UHJlZmV0Y2hNb2RlID0gMzsKCldoYXQgdHJlZSBkaWQgeW91IHVzZSB0byBnZW5lcmF0
ZSB0aGUgcGF0Y2g/IE9uIGFtZC1zdGFnaW5nLWRybS1uZXh0LCAKTWF4UHJlZmV0Y2hNb2RlIGlz
IDAgZm9yIHRoZSBzZWNvbmQgbGFzdCBicmFuY2gsIHdoaWNoIGlzIHRoZSBjb3JyZWN0IApvbmUs
IHNvIHRoaXMgcGF0Y2ggaXNudCBuZWVkZWQuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LWtlcm5lbC1tZW50ZWVzIG1haWxpbmcgbGlzdApMaW51
eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMu
bGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWtlcm5lbC1tZW50ZWVz
Cg==
