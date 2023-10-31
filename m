Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 387DCC4332F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Oct 2023 16:41:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE1B241938;
	Tue, 31 Oct 2023 16:41:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE1B241938
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=c3ay50aY
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UzmqQH___i_4; Tue, 31 Oct 2023 16:41:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4493A411A2;
	Tue, 31 Oct 2023 16:41:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4493A411A2
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1EB0BC0039;
	Tue, 31 Oct 2023 16:41:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4A416C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Oct 2023 16:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7BE683DA0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Oct 2023 16:41:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7BE683DA0
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=c3ay50aY
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oiCO6WoPQ40P
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Oct 2023 16:41:25 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A3D5583D9A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Oct 2023 16:41:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3D5583D9A
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OIfwlurT5DsFeNjVDnfWUYInLkbbcR4kU2WvCaXbpcT/UJKG1MrxYXxVm5MABcXfm5WZZhpg4Z4AL1/jriCOYGU7XqK1lKQvVA+Uegt7nmA+VbkUov64J6bb5BT0vI66QuUiUBx9QwCgi6ThP6OoaB7QykndifNcpIp4jhuUhy/FLUqMmvM5OOwUoGOHz698d+6xvjqPEmba7CkYj1aqNQIeMwIXngMXYNyV/f0CZCXely2tnJqDul+ksux0OmdPk1ClkOjJqEh+S71PmtRlF5eRyjmlr5w1t5nfJr/CCySVMObqm4yDJXZU8ocMSy18yUP2J0XrdFduE99NebL2nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ivg1VHKeMyR8bk8r+z18paoC5/e+vJzK29NRBBUnxxU=;
 b=fT26w6fikG9yfC7wJzI8riE0qTYCzDQDoAl7hGVyJOTpDQgm3kHrob8wfFWLwl3X+2QozZe9K81wUionfLsadCk4w1HtLU+L8LVPs6mPYhEerbstzXzjBbYZqeY4h8xx2slDVo/pg6OAObb+FXv+uLuL0gHohNOjGWo9cRkpsrxiSxt+3j/SL+ez82T/bCAlEB5CzG319ginYRmAo0NzNqfgE6cCDwcGjBQR8m4BSiRo3FYA9363br2r4gk15Y4ESp927ezf0OKqYtJppyd/4ScAnBV7IjIpyUd6P0XqoS+CuvyaR3FDGD4bmGT16p7GROt9JINli6dWF2+Yy9wamw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivg1VHKeMyR8bk8r+z18paoC5/e+vJzK29NRBBUnxxU=;
 b=c3ay50aYjWqPXKva/JzT9nw6//V0d1rUN0t09NFszJnpqYhBofU8yUOG1mzI9m7lo2E0vSeApxCBcCzgGtZixMZs4IyQ/dZvqt0lGQ8OFtbekVQoBtZZ9AC0tUjBtG4re3Blfxy8Ja35/MRgx5YrVkmKZW2hmZQoDDXnXlitMrE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5284.namprd12.prod.outlook.com (2603:10b6:610:d7::13)
 by SJ0PR12MB7475.namprd12.prod.outlook.com (2603:10b6:a03:48d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28; Tue, 31 Oct
 2023 16:41:20 +0000
Received: from CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::33ed:3162:e4ed:3569]) by CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::33ed:3162:e4ed:3569%6]) with mapi id 15.20.6933.028; Tue, 31 Oct 2023
 16:41:19 +0000
Message-ID: <9f50181b-15da-44b3-9620-4d3e1e1d8557@amd.com>
Date: Tue, 31 Oct 2023 12:41:16 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: remove redundant check
Content-Language: en-US
To: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>,
 Greg KH <gregkh@linuxfoundation.org>
References: <20231030171748.35482-1-jose.pekkarinen@foxhound.fi>
 <2023103115-obstruct-smudgy-6cc6@gregkh>
 <3ab58c1e48447798d7525e7d2f42f1a2@foxhound.fi>
 <2023103141-clear-scale-897a@gregkh>
 <1175edcbdf0d0a55d39a87f220259528@foxhound.fi>
In-Reply-To: <1175edcbdf0d0a55d39a87f220259528@foxhound.fi>
X-ClientProxiedBy: YQZPR01CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::6) To CH0PR12MB5284.namprd12.prod.outlook.com
 (2603:10b6:610:d7::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5284:EE_|SJ0PR12MB7475:EE_
X-MS-Office365-Filtering-Correlation-Id: e1791961-e28b-4275-3205-08dbda3035a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x579nBsdSPM/Eaeotooo2ol89tZxtoTNNI6CSBQSOiAVRel6yj2Yh0QhRPi0APU8g6LjSxbsHzX7NB1RRC+mMYJ4XbyD5OvyrbWa8mLEpRt5YdQOpJDfo0wRWGepsDzpNDSH4YKnnCU/GlAqOE7EhCbOsxkGYOfdnwgJ7d6PMM7LSfR+aS6E6Y2CsLwM7I8S5zufj+WErVlfviq5HHic33uDs+FyqSAw/t+t54haB27q9HVEyvltZDdtsz3O+VQfR3vyK4Pu32eQslf9nruZiWMei9CXBCm8To2LyKO/j4WltvYMQ8zFMskko/iHwTiDCh54L6Jwsmb4/w8eAzpu6wbmKP42ku98BUbIWV8UfldU4yxa9qqe1pIG7OI7EGr1M6oBt8L9qYhprEpz4gDg9QwWXQE7aIHeQINDb/Td8mIgXZbqZ7DiQdCb7BqF6riaWXvqqQc7KM/FMd3t4Tgy32bgOkH13XiTKOkBSrw0Gsm7cUKQrTqBfd1oRrzgDwkiLjoR+JjT7XtpKvyk/Huas7B9cUx9Dd0v5ZWn0a71ICl619RVICVkRqCIHVHPzbkcdpuAUAj8HpoGTH6/7L6NTOAmhPywrbqaia7fvT3VuBUJ8FcyAmZx0kYHVY23eqx1Vo2uggMYmUV3Kt3TBHtD9v5hX8rd5mAKMHYWsaB7e8bLkjvflbENcDt9H7+54XSI6oAHuJYuKtuLv29LAqdu5Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5284.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(346002)(39860400002)(376002)(230273577357003)(230173577357003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(31686004)(8676002)(86362001)(36756003)(6506007)(6666004)(6512007)(31696002)(53546011)(41300700001)(38100700002)(4001150100001)(66476007)(2906002)(66556008)(8936002)(316002)(66946007)(110136005)(44832011)(5660300002)(966005)(6486002)(478600001)(4326008)(2616005)(26005)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTk0MFJxM1ZmZk50L2JkVEN2cTBTbGVweGlmVGFVbUd2b3pLazFzU2tXblBZ?=
 =?utf-8?B?ME44SUJLSVI4TEhlRC9EWWgyT1gyWHBjd3h0MS84TGpvY2xkeU1KTFlFcmo2?=
 =?utf-8?B?VE01UjFuOEt6SGh3MkZYc0dwamtwTjk4MlUwS3h5WEE3ZmhIVE5pVU16Tkg0?=
 =?utf-8?B?bkFpTkwyRmdCMlBvUDNoNUIwQi8xZ202WEZ1ZUJBS0hoUWZRMDFaZERqV0p0?=
 =?utf-8?B?QmRiVEppQTBnQVVCcDRNYmNtSWkzNmhVYWFCSWp0WHI4cEJTVXkvcE81amo4?=
 =?utf-8?B?ZGNUSVRSSjdHSFpRaEdDWURua3Z4SEI3ZUIwUm9Oc01rYk5GdXlod2lsRTRY?=
 =?utf-8?B?OEx1dERBT3R2UkdXU2d5UTArdUVId080YTVoKzJGdTVqSHVoaXoweFVUTm1M?=
 =?utf-8?B?aElGZnVNREY1M1RtdHVCWlVKMk94UFI5RTdiL2tUZ1VjVkdXNHd2c2dhUDdN?=
 =?utf-8?B?MnpPRTk5eGFzbkw1aUtFYWFGcFg2UTNTV0tPMHhtMFFLOTZMaXZFdC9ZRmRJ?=
 =?utf-8?B?MTZTb2xMRm0zeHpNL1pRblpuZWFuOGNpK3JhQjlReHFsdGExSjAwOGRVTVhh?=
 =?utf-8?B?emZ4VSs2UThkTWtjeFVpcjYyczkvMEJ4NEpHK3p3eFE1b3RpVHl2eGVqZ2Vu?=
 =?utf-8?B?T1JMYWZzdm42di9VNU8rRUEwQTlYRGRQUUJBWVJXTXBTTTAxc1dBV3ZHWU9I?=
 =?utf-8?B?UEZGcno1bGs3UnVHS01kSlM5OWNaSzRvZHFDMFRVQy9tZmRaTE5yVlVIdkc5?=
 =?utf-8?B?ZGRITUQ3Ty95cWQ5Y3hlK0k2QnVEUnRvdSszdEpQL3FRZkpzcGhraHcrOXpp?=
 =?utf-8?B?bEg1amk2QmYzZ2ZTTWRaQWlPc0FGczluUVUrSHZhNk14d09ZYjhnbkorRFdh?=
 =?utf-8?B?YzRNMkZ0cU5rckUweHY0ZjZXOUF1STdPSlN6OWg1TkxBN2RtRE45VFJHSGRm?=
 =?utf-8?B?RFZYSnRDNnRyN3RvU3FsdU9NbW9BbXp3TVZBT1prTWU3a2ZpRVlWOHo2a0Z3?=
 =?utf-8?B?dTJKM0V2WEc3dzZOZnNHMStidXFDQWExY0t0a2NmYVNYTFlNY1g2enNYT1Fx?=
 =?utf-8?B?NSt2TGFrWU96RVM2SXRIY054T3pUOXlReU9hdlI5YUZmdG5JcSt0ck1Zb2hG?=
 =?utf-8?B?VjFrSWluUTRCVUpIZzlidWhUMlM2TkJzcU5HZTV2aHlKT0t3dVplTGkxY3JY?=
 =?utf-8?B?YWlXcjJGNG1jemVXYXdicFQxbmg2SVR1bDB0bVQvR3Z3K05HcWQ3eXVaVUJK?=
 =?utf-8?B?K0tIYi9FZ3puZE1wNWxpOXdqbXcyREdlbEVTcDBvUWZhLzB0STE3dEl1bjds?=
 =?utf-8?B?bnRXOWJwUzdRVHQ5UVRLeVBWRmVtSERDU0hlb1FoRzZyOEFyVHpOOWV6em91?=
 =?utf-8?B?MVFBZGFwSWFuUlJSVWp4SVpzc2tEYzdoamVlZzlmZzFjT1p1VGd6c09YY0Y2?=
 =?utf-8?B?ZDREZEFxRlNnWHNHSzBKUXRpMVk5WkMyZkJBWmZtVWVjZVZEanFpOWpjTUE1?=
 =?utf-8?B?ZGtRYmQwbUs0U09YcW1lc3lkTzl3RUN6UktmaHJMSFNkckp2OFcrWVUvYlpX?=
 =?utf-8?B?cFpEOFNPdzlweDdWZUlMWFJwbTI0MjhWTWJzbUUxdXRtU0pwUUJUb0N6aFB2?=
 =?utf-8?B?RDVaVXlxVzF3c0N4TWxNMEg4REhwbmFGaGZqZUFET3dWZWpxWEFDTDNSaTM2?=
 =?utf-8?B?M2FIbzJkWk5Xdkh0L1o4TGpDclUyMjlQd2V5TE53R2g1MlFhQm1ycE8yUWVl?=
 =?utf-8?B?WmNScTgxWlFrRjkrbWhHOG9zbXk0Yngyb3g2emVOZ0w5blFBdDY1Skp6bFJp?=
 =?utf-8?B?NjdJVm5hMzZkY1dDQ01EbkFkbDl0ZWlScldPYTQ1OG5HWEk4ZElSNlNmQlBZ?=
 =?utf-8?B?eWxtMVRBL0trYXhhR3RiOWlrMHBrdmgvbjVBbElha0xjZnY2SWdIU053YmpP?=
 =?utf-8?B?VU5XSDJXckp3dUxZMmpiSE9jcVdNY2ZubHQ4NGJwWjlKTVhROElWVlN6Z2pB?=
 =?utf-8?B?dm0wbXdYQjNDcmtaY09Pb1JGOHFPWjlhbkxELy8zWGFtY1ZMNWZFNElMcTZG?=
 =?utf-8?B?NWpzWkVYZkZDd2xGaStJZEEwS2FrSXBvOGJ2UWhHVldscitCd0hmUGcybngz?=
 =?utf-8?Q?5ZI5Cyjr8+U650Jsa3npY6xzx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1791961-e28b-4275-3205-08dbda3035a7
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 16:41:19.8582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cy2RXpUWdszPbdiNNPUacJ85uDxcxPdiFIeqz7az7v2TwvcDr7nkSA9xBXJAZQqK+/gsWyrXLgEZK/F4ipuZQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7475
Cc: dillon.varone@amd.com, george.shen@amd.com, sunpeng.li@amd.com,
 linux-kernel-mentees@lists.linuxfoundation.org, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com, samson.tam@amd.com,
 daniel@ffwll.ch, SyedSaaem.Rizvi@amd.com, stable@vger.kernel.org,
 airlied@gmail.com, Jun.Lei@amd.com, harry.wentland@amd.com,
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

CgpPbiAyMDIzLTEwLTMxIDA4OjMyLCBKb3PDqSBQZWtrYXJpbmVuIHdyb3RlOgo+IE9uIDIwMjMt
MTAtMzEgMTQ6MjAsIEdyZWcgS0ggd3JvdGU6Cj4+IE9uIFR1ZSwgT2N0IDMxLCAyMDIzIGF0IDAx
OjQyOjE3UE0gKzAyMDAsIEpvc8OpIFBla2thcmluZW4gd3JvdGU6Cj4+PiBPbiAyMDIzLTEwLTMx
IDA3OjQ4LCBHcmVnIEtIIHdyb3RlOgo+Pj4gPiBPbiBNb24sIE9jdCAzMCwgMjAyMyBhdCAwNzox
Nzo0OFBNICswMjAwLCBKb3PDqSBQZWtrYXJpbmVuIHdyb3RlOgo+Pj4gPiA+IFRoaXMgcGF0Y2gg
YWRkcmVzc2VzIHRoZSBmb2xsb3dpbmcgd2FybmluZyBzcG90dGVkIGJ5Cj4+PiA+ID4gdXNpbmcg
Y29jY2luZWxsZSB3aGVyZSB0aGUgY2FzZSBjaGVja2VkIGRvZXMgdGhlIHNhbWUKPj4+ID4gPiB0
aGFuIHRoZSBlbHNlIGNhc2UuCj4+PiA+ID4KPj4+ID4gPiAKPj4+IGRyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kbWwvZGNuMzIvZGlzcGxheV9tb2RlX3ZiYV91dGlsXzMyLmM6NDY2NDo4
LTEwOgo+Pj4gPiA+IFdBUk5JTkc6IHBvc3NpYmxlIGNvbmRpdGlvbiB3aXRoIG5vIGVmZmVjdCAo
aWYgPT0gZWxzZSkKPj4+ID4gPgo+Pj4gPiA+IEZpeGVzOiA5NzRjZTE4MSAoImRybS9hbWQvZGlz
cGxheTogQWRkIGNoZWNrIGZvciBQU3RhdGUgY2hhbmdlIGluCj4+PiA+ID4gRENOMzIiKQo+Pj4g
PiA+Cj4+PiA+ID4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPj4+ID4KPj4+ID4gV2h5IGlz
IHRoaXMgcmVsZXZhbnQgZm9yIHN0YWJsZT8KPj4+Cj4+PiDCoMKgwqAgSGksCj4+Pgo+Pj4gwqDC
oMKgIEkgd2FzIGFza2VkIHRvIHNlbmQgaXQgZm9yIHN0YWJsZSBiZWNhdXNlIHRoaXMgY29kZQo+
Pj4gbG9va3MgZGlmZmVyZW50IGluIGFtZC1zdGFnaW5nLWRybS1uZXh0LCBzZWUgaGVyZS4KPj4+
Cj4+PiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvYWdkNWYvbGludXgvLS9ibG9iL2Ft
ZC1zdGFnaW5nLWRybS1uZXh0L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbWwvZGNu
MzIvZGlzcGxheV9tb2RlX3ZiYV91dGlsXzMyLmMjTDQ2NjEKPj4KPj4gSSBkb24ndCBrbm93IHdo
YXQgSSBhbSBsb29raW5nIGF0LCBzb3JyeS4KPj4KPj4+IMKgwqDCoCBGZWVsIGZyZWUgdG8gbGV0
IG1lIGtub3cgaWYgdGhpcyBpcyB3cm9uZywgb3IgaWYgSQo+Pj4gbmVlZCB0byByZXZpZXcgc29t
ZSBvdGhlciBndWlkZWxpbmVzIEkgbWF5IGhhdmUgbWlzc2VkLgo+Pgo+PiBQbGVhc2Ugc2VlIHRo
ZSBsaXN0IG9mIHJ1bGVzIGZvciBzdGFibGUgcGF0Y2hlczoKPj4gaHR0cHM6Ly93d3cua2VybmVs
Lm9yZy9kb2MvaHRtbC9sYXRlc3QvcHJvY2Vzcy9zdGFibGUta2VybmVsLXJ1bGVzLmh0bWwKPj4K
Pj4gRG9lcyAicmVtb3ZlIGNvZGUgdGhhdCBkb2VzIG5vdGhpbmciIGZpdCBoZXJlPwo+IAo+ICDC
oMKgwqAgWWVwLCBpdCBpcyBhIHRyaXZpYWwgZml4IHdoaWNoIGNvbXBpbGVycyBzaG91bGQgYmUg
YWJsZQo+IHRvIG9wdGltaXplLCBzbyBubyByZWFsIGJlbmVmaXQgdG8gdGhlIHVzZXIuIFNvcnJ5
IEdyZWchCj4gCj4gIMKgwqDCoCBKb3PDqS4KCkhpIEdyZWcsCgpTb3JyeSwgSSBhc2tlZCBKb3PD
qSB0byBzZW5kIGl0IHRvIHN0YWJsZSBiZWNhdXNlIEkgcmVhbGl6ZWQgdGhlIHBhdGNoIApsaXN0
ZWQgaW4gdGhlIGZpeGVzIHRhZyB3YXNudCBxdWl0ZSBuZWVkZWQgb24gc3RhYmxlLiBQYXRjaCBm
cm9tIEpvc8OpIAplZmZlY3RpdmVseSByZW1vdmVzIGl0LgoKSSBob3BlIHRoYXQgY2xlYXJzIHRo
ZSBjb250ZXh0LiBCdXQgdGhlcmUgaXMgbm8gaW1wYWN0IHdoZXRoZXIgeW91IGFwcGx5IApKb3PD
qSdzIHBhdGNoIG9yIG5vdCwgc28gd2UncmUgZ29vZCBlaXRoZXIgd2F5LgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBt
YWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1rZXJuZWwtbWVudGVlcwo=
