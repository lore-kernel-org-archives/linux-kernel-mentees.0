Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB1FCD8C9D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Oct 2023 14:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9401C410A5;
	Tue, 10 Oct 2023 14:43:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9401C410A5
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=bdffpeyK
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xXOteusPVQ5u; Tue, 10 Oct 2023 14:43:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7BD114109B;
	Tue, 10 Oct 2023 14:43:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BD114109B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4A13BC0039;
	Tue, 10 Oct 2023 14:43:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B9DC6C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 14:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8764682291
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 14:43:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8764682291
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256
 header.s=selector1 header.b=bdffpeyK
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KQarRWOE1W9K
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 14:43:31 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02olkn2081a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe16::81a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B51258228F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 14:43:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B51258228F
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mYd4sNjoN3X560NJQyroEBb/jz3rlUlTeokGuhvHztU8reGf7nTR0GE5YRHLUHZks2SA7T9FBfa4Vtp65qK4faidMvcMmPwqXuemlf4ghI3eWV5AN5tKAICUqq+rox4zTZ9V7N+1m7KYubDMXpvel/diXbfD1DyKGCmUmJCdkHlHfShz+bpccwvEpiROq5IUjVwQmvn2lpH5pZarx11QQzKiMXWduP2juhmP+6yYTsjTty9QT73yMHEAr15MJPTSkihNB9/RdNM3umClQnf4KSj/SJUVFByO6fe7yfSRpHqSfMTLogPEeSwHtI5MsE852ZFJk7wNWR5GOiIFxuua/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/CiRzet86M3waOTG6euMILtBzH4M15ba1z4wl7TsSfs=;
 b=YW9iLt/YC81Uaw7xYsSnMje2CizXQNBJghtJ3f4h1KCwHsqlLyAbx7/UYOZCo5LUOzXi8RsdUjJki6X2PeIEZMQaIfK1P5lccDSvmYge8izx56Lwsx+GARFoVpGP1mi2jyZTkLaaM++BytXctEuav6AJDHnb492SgvAVcOG32EgSF5L2wSOwudgshipRR8NK9yRGk4rQLVbScjl0ylrE+mBekxtV/J8XtgBEsXn2w4tO5E1SfmdlKfw7079ZhlxlVvEbdca07zLnCvs7u7tKef7Kq1gavRMcM1Lm9FpDj7bd3AZTlHh6KoPQ7uz1MndKQSeWmbqxaj9XzPlby/flIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/CiRzet86M3waOTG6euMILtBzH4M15ba1z4wl7TsSfs=;
 b=bdffpeyKAqRBxnaEdngsAEAeZl6Kt16gGufFnq7/+FaDNhq9bKmppVTEwCMn+jk8PpoCPyN4+T2Wr9+Ey5vrIDOdZgZ+ZuasDOA2hiHplGSH2oSos0z7nUbw3qboWANl52d2Dtihg4jHNFDejowe/PO7l31+gqFjr06JiYG1B9Ucgo98mzvjykMWlP/a/b6Uqi50O+FiYJIFiCVdo+37CxX65TL7iuVzSbHcUUvTcd89lm5KqGEEB9aNqeeWTe2PEq9onSF1zTftxyd+AWMndbcoIK5qC1v7tIyP0inBp2b5Qh9NDWD5dm0lGvI7mn5wWy3W68tvwFc34mH9DVLX6w==
Received: from AM9P192MB1267.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:3a7::7)
 by PR3P192MB0809.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:42::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37; Tue, 10 Oct
 2023 14:43:27 +0000
Received: from AM9P192MB1267.EURP192.PROD.OUTLOOK.COM
 ([fe80::628d:d050:3672:a203]) by AM9P192MB1267.EURP192.PROD.OUTLOOK.COM
 ([fe80::628d:d050:3672:a203%7]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 14:43:27 +0000
Message-ID: <AM9P192MB1267F74A5B04DBD6115D2CCBE8CDA@AM9P192MB1267.EURP192.PROD.OUTLOOK.COM>
Date: Tue, 10 Oct 2023 20:13:16 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] Bluetooth: hci_conn_failed: Fixes memory leak
Content-Language: en-US
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
References: <AM9P192MB12672AA34A0480B522D23741E8C8A@AM9P192MB1267.EURP192.PROD.OUTLOOK.COM>
 <2023100727-passive-untidy-8df4@gregkh>
 <AM9P192MB1267C58F299DF86A5EEFE39EE8C8A@AM9P192MB1267.EURP192.PROD.OUTLOOK.COM>
 <CABBYNZLA2aTwRFqeDNLaT6Q4cytLB1e-q5oON=KVK1ts-0dz1w@mail.gmail.com>
From: Yuran Pereira <yuran.pereira@hotmail.com>
In-Reply-To: <CABBYNZLA2aTwRFqeDNLaT6Q4cytLB1e-q5oON=KVK1ts-0dz1w@mail.gmail.com>
X-TMN: [4VQ8P45z9/Gal4JTOUIu1jyhzQDyf4Su]
X-ClientProxiedBy: JN3P275CA0029.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:71::9)
 To AM9P192MB1267.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:3a7::7)
X-Microsoft-Original-Message-ID: <6200d327-6084-00d9-7679-759312449e8f@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P192MB1267:EE_|PR3P192MB0809:EE_
X-MS-Office365-Filtering-Correlation-Id: 22406ee8-57b4-4c32-6aaf-08dbc99f42d8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: utpErWo+f9UCahh+xYEFNhirY/5stFEReUJeY1q3ParM2HBhRzZz2Q/89CE7EJZ37B/HZCN5dflKh3EpovruUd5DW6kIpjbDM4PlT8feJ7qsbrTDBpQ4DNzOtcYZONGwsvtbUhXrv+fp42GeqaaOGzNJIAy5WTAbX092BzvfcIekrjh4s/Uo0gLvqYX0E5jQ4R2ohQX8duE3JagQfaOSHrdm6ErwkKZ9JHFr7VqjhBAp7WrO217lNsHspUfKFNS7dOK38zscKW0/v0radyW+93T9jRc+xNEw6ICH+mYW/8DBc+lCUkbE5pkThBFOoxjGLYBwtMkdTcpI/aRuyBmPbfDsoX4NNIm1VKVmP+b0qsXe1VJZjd68cFZA7j+kuZAQEfTHQfrci9a+tVVEHut+0h+8fIonHVAq/S/v8GpsF7PnZA7aX4agZMGeE5cdIicU3/zTT3W2WqcLj/k0X+YhtYxgPgtTH6WzKH53xS+z0sOxeC0BWVYtFi+hKU1yyQ6ylnUcw1MJ1Qfw0geUsmE6WO4QYy2kiOv7dBAufSRN0ktk7Al/zlppSVqWdCmXOMR1
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmppM3hKcTRBV3pxNWl2dDhNdURubU5KOHFDNWh4M2JzUThMOGxveU02dG1F?=
 =?utf-8?B?TGFyWTh0T1ZubkhCSnUxL09Ca093czlBZEN4RFRhMUZhUUtlNkY5ZXdmN2xP?=
 =?utf-8?B?TDhSUU9ZUHNZVkI2aWlXNGxseERncEtTN0pFSmFsUXpQZ2JzZFlYSjk2RW5P?=
 =?utf-8?B?am00SUlrTVgwUXdjeE9FblZyL0ExaE0zRjIyY2NJakF2R3preDMrclZ0WnhC?=
 =?utf-8?B?b0FtbDEzeHZmUmhsUEd1cXN2Q0xFbzMyL2FlMnkzeUo4U3VIOTBRd2ZKSWVZ?=
 =?utf-8?B?SGMrdmtnVTRzNVJWZUtra0RrRUVIejVEd25ucEpIcHB6KzJDZkttV3Q5dmpj?=
 =?utf-8?B?eUIwRFBYeWw2Ym13RThObCtEeDJaSWNzOUszcUFpRjI4MXpZZ1NWTDNWVVdo?=
 =?utf-8?B?eTJCM083L09nYUpRZ0luRGJtR3VWOGFiY3RZZER0N2pxMkw5Y2hPK0dIWWp5?=
 =?utf-8?B?SXJSOEY0QUFYam56MjlORkNTRkd5N0w4enZyK0YxeEw3dm00aXdrM1hFWnQ5?=
 =?utf-8?B?Z3pMMHJ3SHA2dHNQOFgyVzRXeFRWbnV1S0FuUEREeUI1cHM0Vk9JR0E2aHFu?=
 =?utf-8?B?L1I4R3JHaG05TGF3WStXN08vWUtuVVlESzRYbVpkWld5VTB0eTJOWVMxd3ZK?=
 =?utf-8?B?ak1sdVhBN1dRUkRnM2Z4eDZPaGNWazhTWmh3R3J0cHlSeFZ2bXdRT3VvYVlG?=
 =?utf-8?B?Q09EUWdmN2gvanNoYkxLUGdySWlyM3d2NEd4M2dHcUY5OHZNa2tIOGFWWFR3?=
 =?utf-8?B?TjltNDNsMERWaXViTU8wSTNvckFUME04ek5wZ2ltNklrd0VaMFdCWVRUTlR4?=
 =?utf-8?B?TmhFUnl1WWwwTWJlWit5aDhueG1wL2VUamJrMGtKWDVxdGZ2MXdPY3JTYnpt?=
 =?utf-8?B?b1JKc3oyaEVmZGVXUHpnRWdoamRzYlZDaWtzL1FRZXIzK0VmTmFMbThiVlU4?=
 =?utf-8?B?THJpWEFkdlV2N3dRR3RLTzFtWEFlSFNUWFhkUW9rZUpJbkRMMjNLM2NUU2J5?=
 =?utf-8?B?Q2VsU2RkdkxXRXAvRW82ckY1MHZ5SWY3UDh6NTdhZi9wK2tjOUQya1hKWEhm?=
 =?utf-8?B?SEFleElNWFV5aC9LbUt2cmtaUnpHTGdrT3JPKy9pUlpaOVI2ajFIcHQ1Z2pO?=
 =?utf-8?B?bXM4b1RLWGwvcThUKzViMlgvSjlVM0NlWWtPSXUwTHIyQXBQbGh2OTlUdDBK?=
 =?utf-8?B?V0hUdk1MYkJsWjhsalNSajZvcitMN3JSUGtkK2VDYUtrRy92dTB4bjlmeW1R?=
 =?utf-8?B?eUxSV3RSRldGN3VhN2cySUNYb2FnampsRlhVMlVjV2k3WEpnTGpkY0tuTWhM?=
 =?utf-8?B?V2pwRHZTZWN3VVIwV05tOXJsb1Zrckhnb3BRTjJQQlpnaUpwcXBLV1lEK0VF?=
 =?utf-8?B?ZGZZRm16Qnh1V1lma2M4TnNvdmtkK09Kbi8xRWxPM0sxNUxnZWp1STVRZHE2?=
 =?utf-8?B?UzA5MEdKNWlraGhHa1luQzJDQmQ1bnRMTlhCZWdVUzFwVmdZUWMvUnRaTnB6?=
 =?utf-8?B?K3dsNXZlS0NRUDA2UHpsN0Q3UEttcHIremc4QnNHTWFKaXVac0pHaDg4dTFT?=
 =?utf-8?B?YXB2RUVqZ1lqYzZtN0JwRzk0WUhnU3NsYytTMXZtWEFWc0N5bkxZV3AwZjBU?=
 =?utf-8?Q?evL2oiaE31R4OtiH2GcqETRVLlOvuXwXjqOeW5r8HIqU=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-fb43a.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 22406ee8-57b4-4c32-6aaf-08dbc99f42d8
X-MS-Exchange-CrossTenant-AuthSource: AM9P192MB1267.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 14:43:27.4555 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P192MB0809
Cc: "johan.hedberg@gmail.com" <johan.hedberg@gmail.com>,
 "marcel@holtmann.org" <marcel@holtmann.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
 "syzbot+39ec16ff6cc18b1d066d@syzkaller.appspotmail.com"
 <syzbot+39ec16ff6cc18b1d066d@syzkaller.appspotmail.com>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

SGVsbG8gTHVpeiwKClRoYW5rcyBmb3IgdGhlIHJlcGx5LgoKSSBqdXN0IHRvb2sgYW5vdGhlciBs
b29rIGF0IGhjaV9hYm9ydF9jb25uX3N5bmMgd2hpY2ggaXMgd2hlcmUgCmhjaV9jb25uX2ZhaWxl
ZCBpcyBiZWluZyBjYWxsZWQsIGFuZCBhcyB5b3Ugc3VnZ2VzdGVkLCBoY2lfY29ubl9mYWlsZWQs
IAppcyBpbiBmYWN0IGJlaW5nIGNhbGxlZCB3aXRoIGEgc3RhdHVzIDAuIFNvIG15IHByZXZpb3Vz
IHBhdGNoIG1pZ2h0IGluIApmYWN0IGJlIGluYWNjdXJhdGUuCgpCeSB0aGUgdGltZSBoY2lfY29u
bl9mYWlsZWQgaXMgY2FsbGVkLCB0aGUgdmFsdWUgb2YgImVyciIgd2l0aGluIApoY2lfY29ubl9h
Ym9ydF9zeW5jIGNhbiBhbHNvIGJlIDAsIHNvIHVzaW5nIGJ0X3N0YXR1cyhlcnIpIGFzIHN0YXR1
cyBpcyAKbm90IGdvaW5nIHRvIHNvbHZlIHRoZSBpc3N1ZS4KSSBhbSBjb25zaWRlcmluZyB1c2lu
ZyBvbmUgb2YgdGhlIEhDSV9FUlJPUl8gdmFsdWVzIGJ1dCBub3QgZXhhY3RseSBzdXJlIAp3aGlj
aCBpcyB0aGUgbW9zdCBhcHByb3ByaWF0ZSBpbiB0aGlzIHNwZWNpZmljIHNpdHVhdGlvbi4KClBl
cmhhcHMgSENJX0VSUk9SX1VOU1BFQ0lGSUVEID8/PwoKU29tZXRoaW5nIGxpa2U6Ci0gaGNpX2Nv
bm5fZmFpbGVkKGNvbm4sIHJlYXNvbik7CisgaGNpX2Nvbm5fZmFpbGVkKGNvbm4sIEhDSV9FUlJP
Ul9VTlNQRUNJRklFRCk7CgpTbywgd291bGQgeW91IHN1Z2dlc3QgZ29pbmcgd2l0aCB0aGlzIHNv
bHV0aW9uLCBvciBkbyB5b3UgdGhpbmsgdGhlIAppc3N1ZSBtaWdodCBiZSBvcmlnaW5hdGluZyBl
YXJsaWVyIGluIHRoZSBjYWxsIHNlcXVlbmNlIGFuZCBJIHNob3VsZCBwYXkgCm1vcmUgYXR0ZW50
aW9uIHRvIGNvbm4tPnJlYXNvbj8KClRoYW5rcywKCll1cmFuIFBlcmVpcmEKCk9uIDEwLzEwLzIz
IDAxOjIwLCBMdWl6IEF1Z3VzdG8gdm9uIERlbnR6IHdyb3RlOgo+IEhpIFl1cmFuLAo+Cj4gT24g
U2F0LCBPY3QgNywgMjAyMyBhdCAxMDozOeKAr0FNIFl1cmFuIFBlcmVpcmEgPHl1cmFuLnBlcmVp
cmFAaG90bWFpbC5jb20+IHdyb3RlOgo+PiBIZWxsbyBHcmVnLAo+PiBNeSBhcG9sb2dpZXMsIEkg
anVzdCBub3RpY2VkIHRoYXQgbXkgcGF0Y2ggaXMgYmFzZWQgb24gdGhlIG1haW5saW5lIHRyZWUu
IEknbGwgcmUtc3VibWl0IG9uZSBiYXNlZCBvbiB0aGUgQmx1ZXRvb3RoIHRyZWUgYW5kIEknbGwg
ZW5zdXJlIHRvIGluY2x1ZGUgdGhlIGNvbW1pdCBpZCB0aGF0IGl0J3MgZml4aW5nLgo+Pgo+PiBU
aGFua3MsCj4+IFl1cmFuIFBlcmVpcmEKPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPj4gRGU6IEdyZWcgS0ggPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+PiBFbnZpYWRv
OiA3IGRlIG91dHVicm8gZGUgMjAyMyAxMTo0MQo+PiBQYXJhOiBZdXJhbiBQZXJlaXJhIDx5dXJh
bi5wZXJlaXJhQGhvdG1haWwuY29tPgo+PiBDYzogbWFyY2VsQGhvbHRtYW5uLm9yZyA8bWFyY2Vs
QGhvbHRtYW5uLm9yZz47IGpvaGFuLmhlZGJlcmdAZ21haWwuY29tIDxqb2hhbi5oZWRiZXJnQGdt
YWlsLmNvbT47IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcgPGxpbnV4LWtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmc+OyBsaW51eC1ibHVldG9vdGhAdmdlci5rZXJuZWwub3JnIDxsaW51eC1ibHVl
dG9vdGhAdmdlci5rZXJuZWwub3JnPjsgbHVpei5kZW50ekBnbWFpbC5jb20gPGx1aXouZGVudHpA
Z21haWwuY29tPjsgc3l6Ym90KzM5ZWMxNmZmNmNjMThiMWQwNjZkQHN5emthbGxlci5hcHBzcG90
bWFpbC5jb20gPHN5emJvdCszOWVjMTZmZjZjYzE4YjFkMDY2ZEBzeXprYWxsZXIuYXBwc3BvdG1h
aWwuY29tPjsgbGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZyA8
bGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZz4KPj4gQXNzdW50
bzogUmU6IFtQQVRDSF0gQmx1ZXRvb3RoOiBoY2lfY29ubl9mYWlsZWQ6IEZpeGVzIG1lbW9yeSBs
ZWFrCj4+Cj4+IE9uIFNhdCwgT2N0IDA3LCAyMDIzIGF0IDA1OjA5OjAxUE0gKzA1MzAsIFl1cmFu
IFBlcmVpcmEgd3JvdGU6Cj4+PiBUaGUgaGNpX2Nvbm5fZmFpbGVkKCkgZnVuY3Rpb24gY3VycmVu
dGx5IGNhbGxzIGhjaV9jb25uZWN0X2NmbSgpLCB3aGljaAo+Pj4gaW5kaXJlY3RseSBsZWFkcyB0
byB0aGUgYWxsb2NhdGlvbiBvZiBhbiBsMmNhcF9jb25uIHN0cnVjdCBpbiBsMmNhcF9jb25uX2Fk
ZCgpLgo+Pj4gVGhpcyBvcGVyYXRpb24gcmVzdWx0cyBpbiBhIG1lbW9yeSBsZWFrLCBhcyB0aGUg
bDJjYXBfY29ubiBzdHJ1Y3R1cmUKPj4+IGJlY29tZXMgdW5yZWZlcmVuY2VkLgo+Pj4KPj4+IFRv
IGFkZHJlc3MgdGhpcyBpc3N1ZSBhbmQgcHJldmVudCB0aGUgbWVtb3J5IGxlYWssIHRoaXMgcGF0
Y2ggbW9kaWZpZXMKPj4+IGhjaV9jb25uX2ZhaWxlZCgpIHRvIHJlcGxhY2UgdGhlIGNhbGwgdG8g
aGNpX2Nvbm5lY3RfY2ZtKCkgd2l0aCBhCj4+PiBjYWxsIHRvIGhjaV9kaXNjb25uX2NmbSgpLgo+
IEkgc3VzcGVjdCB0aGlzIGlzIG5vdCBxdWl0ZSByaWdodCwgaGNpX2Rpc2Nvbm5fY2ZtIGlzIGNh
bGxlZCB3aGVuIGEKPiBkaXNjb25uZWN0aW9uIGhhcyBiZWVuIHJlcXVlc3RlZCwgaGNpX2Nvbm5l
Y3RfY2ZtIGlzIGNvcnJlY3QgaGVyZQo+IHNpbmNlIGl0IGlzIG1lYW50IHRvIG5vdGlmeSB0aGUg
cmVzdWx0IG9mIGNvbm5lY3Rpb24gcmVxdWVzdCBwcm9jZWR1cmUKPiBzbyBJIGNhbiBvbmx5IGFz
c3VtZSB0aGF0IHRoZSBjdWxwcml0IGhlcmUgaXMgdGhhdCBoY2lfY29ubl9mYWlsZWQgaXMKPiBj
YWxsZWQgd2l0aCBzdGF0dXMgMCB3aGljaCBpcyBpbnZhbGlkIGFuZCBuZWVkcyBmaXhpbmcuCj4K
Pj4+IFJlcG9ydGVkLWJ5OiBzeXpib3QrMzllYzE2ZmY2Y2MxOGIxZDA2NmRAc3l6a2FsbGVyLmFw
cHNwb3RtYWlsLmNvbQo+Pj4gU2lnbmVkLW9mZi1ieTogWXVyYW4gUGVyZWlyYSA8eXVyYW4ucGVy
ZWlyYUBob3RtYWlsLmNvbT4KPj4+IC0tLQo+Pj4gICBuZXQvYmx1ZXRvb3RoL2hjaV9jb25uLmMg
fCAyICstCj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQo+PiBXaGF0IGNvbW1pdCBpZCBkb2VzIHRoaXMgZml4Pwo+Pgo+PiB0aGFua3MsCj4+Cj4+IGdy
ZWcgay1oCj4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNA
bGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
