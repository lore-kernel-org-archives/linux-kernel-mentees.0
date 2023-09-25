Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09463CE7A94
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 25 Sep 2023 10:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70AFC417A5;
	Mon, 25 Sep 2023 10:25:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70AFC417A5
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=LZLk4cIi
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KKIXKTNK69T7; Mon, 25 Sep 2023 10:25:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 04E114171A;
	Mon, 25 Sep 2023 10:25:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04E114171A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D6F53C0071;
	Mon, 25 Sep 2023 10:25:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CB8EAC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Sep 2023 10:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 788374171E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Sep 2023 10:25:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 788374171E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id apg2c__xrYeI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Sep 2023 10:25:46 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04olkn0825.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::825])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 81FC44171A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Sep 2023 10:25:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81FC44171A
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tg+p09Huj7fKlM4X1SKtsMI4KM3oiWUJZgq2JAK80Hk51qb4tzqrQZCfY7UaJpCA+OYDfqnPnODvPBMmIg2U4+1TNU6Ei0AC0z5xNA0mXEClldFjb4DDwU//9umY8PHY0+RYQbybGFW7kLdx9aOOLHRd1MZbN73x8VjJKsCXNsRehwUY5f4Q4NV5GakmK3E0vJA5n7bKdMffkWkR7xBa7MK32+UZLLNFjc4lRDfyGVt3Z9jZP2RbRto4kfBiojDvTSfHQp1rl4xuIp+Aaf4yuwFIvR1N4uYdkk1nLLCpkiuoRnIRmFp/6/isMpTKqQi8zgphq8ZR6UAln0NJI7+Uyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efiM11N+arttjvmiaNCAs9ty55wN/pZreGXpV4jhcvg=;
 b=oQdxytt+/0OubG5yefurvvKF7lafIrD4YshGww2FaSHz6XNoRm1lSezQJyJheAp7btTTnadGt/SsI5n8V5gTUOUNNBh1W+coKSwUH1LI5zmW7V0NJkS0YXtK81q4AgSjmlWJ79BvkVH3LjZXefgFV5l7aJiMIo0/fAM47UYmP1dZlrvUapOfvOJnv3v/fSz0hI8fJzwK6RTtfluAh+g+WA23bJZnCgv1hw/I0Looeb9GQVbxPl8DKj+r501s2kZoCJrTOtm/+s8JIScO1k3bSZE5Zk7KmxDhnI2r17QbBYh3gOPJ4w8jKjuAwlgeavTcPS/l1WsieuGQClT88GQSQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efiM11N+arttjvmiaNCAs9ty55wN/pZreGXpV4jhcvg=;
 b=LZLk4cIiTBa7H49CTTVRoANepMdaA6BQ4/3RKMbSmcVHYncQryA6oySy0jXdZlfUgbDfGg3pwBpgeQCZ+iVuIatK6iHxGGPaq5tqOjgOB8cffem5geylXQf0SGD6rZvVsnu/9YnECma75mTpXuYLr28BH6QbISbTSAVp2TJHt7VHCFgVCZ77+5VrteDnOKMd1W6o+iaqIRejrrB5zxHIEgGbBZFIJaGfxgkXgGonnK+3NqI+Hxw3ciFJoXh58GqSxA+1yizWpu/Uxi/DjAeAp8s8JsMhqOKGHTkz8pKBXTuxpuPl0DCgN8CRGL8p7tqzV1sedKmtLszmlqnhs37v3g==
Received: from VI1P193MB0752.EURP193.PROD.OUTLOOK.COM (2603:10a6:800:32::19)
 by GV1P193MB2023.EURP193.PROD.OUTLOOK.COM (2603:10a6:150:27::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 10:25:43 +0000
Received: from VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
 ([fe80::3164:ae5c:78f7:23ad]) by VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
 ([fe80::3164:ae5c:78f7:23ad%4]) with mapi id 15.20.6813.024; Mon, 25 Sep 2023
 10:25:43 +0000
Message-ID: <VI1P193MB0752C18200A14B449C863B1899FCA@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
Date: Mon, 25 Sep 2023 18:25:42 +0800
User-Agent: Mozilla Thunderbird
To: shuah@kernel.org
From: Juntong Deng <juntong.deng@outlook.com>
Subject: [RFC] selftests: Add dependencies information for kselftest
X-TMN: [HQV39rmNPkCNlChnyngT5w951PVCIUfp]
X-ClientProxiedBy: AS4P251CA0024.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d3::16) To VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:32::19)
X-Microsoft-Original-Message-ID: <5a972cd1-0da8-409f-8a61-f4a081ba5808@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P193MB0752:EE_|GV1P193MB2023:EE_
X-MS-Office365-Filtering-Correlation-Id: 72458393-8ac6-4af1-3b02-08dbbdb1c5f8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P04eYQCHpk9T/4f+ZFEKE3aU+sK+5+cJL56O/Lj5LhuwaQzBCEACUC0UXs0Mf/WxvQ/Wih52vdneILD+fMDIrKJmGhDoVi69pDppNIt9fGU8ovBVzu06MguICaqV5XBz2yWT2yPpLv8XTCcOAoDlwmop8pTqy6ciSW5wB3UnmEHlqsF7Js/KLUzoZKCXkUf+mdxRgBAuIelaJrPtM/WFepJivsFvu8kg9mwJF6/m9xQz53xtgn2UwF4HN9QxZIXv1BF9AF1k0RsRAfeFXLtFxsWcfJPWu6aAgWnPa+NfsJErXf2GOg/E3jHJr/vsBefV+dUNcYQny2uYBa3QAkMLLipzxgxgXa2knnWbpAIEt8yEOmcpWb+9wndV4QqASo/cD8B9WnN3h3AvK0o3VCqhHpY4h5bTec4ntdN0kQuw9KCgLRxHfFnIPhYyG10QZ5r4prPkXOuaEjRiF1V/gUgej/qmn+4WmT4xQUB9cIr9M5YzgrX4YgKZjwq8Hpj+LJNGRi2bj3LOJ8emIteQ+4/sV+QQ/ZxlXOoxtA5993SzTuv/A5OKIjPPUVLwMsLXXDul
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEFWV01LSDNVU1M4c2JwQUpYWXh6bmpLam5JWUxMY2drL2o5a1VNWXlBL0I4?=
 =?utf-8?B?bUdMM2dSYUROc3FKZE9RSGdnSEFETTZYa0Z2REM2L3dSSjZVVHByNk1ndEZO?=
 =?utf-8?B?ajQ1emQ4RzBBanlneXdCZjZXTWhndmxMNXdGRjEwMTQ0ekc2UlVWMDdZTW1r?=
 =?utf-8?B?UU5lREw3cWhlaHJaa2JFUUFpbkl4MkFJY2o3TjVKZmU2ZGJ4cjgxSDFDS3VY?=
 =?utf-8?B?aGxvVnRSbVNPa0RFQUFGN3lKMzhTSC9IdURuQlBXajJGWWVLMGZOdE1RWnF3?=
 =?utf-8?B?NTQvV3hqcFppRlN3NWp4UVN0MUN6U2NQYWYvZ1ptQUlDa2d0VDZQRHp6QlVH?=
 =?utf-8?B?ZTIvbkF3cjNTWmw1ZjlmaGl1VXAva3hXcy9OSFFsWDBYRjZOR2plelRoZXBn?=
 =?utf-8?B?Y0JjNnZMVlVxZ09wcFJUOEttMGcydm5ZanI0aWlnUUE4Z00vSHRxZVZJWWVN?=
 =?utf-8?B?UVZ5V0ZHUVVEemJHTE43VzIwaWpYcXpGZlhrb2VRMkNoWi9aeGFMSm9nd0Jz?=
 =?utf-8?B?WDdVcnZzdU1kaHZJL1cxUjNXcVM3eHhGaFMyNnVSbUZ0dDFoeEJ4dkhTK1Vq?=
 =?utf-8?B?YkZ1cGREemtLTGZubmZWN3gzaWpPRXB0QWUzSEp4aXJPNURQV3lwSjRGL09i?=
 =?utf-8?B?eXI3QzRLLy9md3dSTlNWYnlNakdRY0ZUQm54Y3M3ZmpNZ2lySDFnM21LYmZl?=
 =?utf-8?B?ZFM5bGNVT1NRUDcvRXFTVzg1Rm00MlJXdGhoVVRMazZkOUloU1M3cUJMdmM5?=
 =?utf-8?B?S00vRFVMOTNOYVZlWXVibXE5ZG1tdEdkTzlqeW11MEwyU2lFcXBFYUhYOVVB?=
 =?utf-8?B?OXVtZ1I1Q0xCVXNKZlhqdkhxQTlMRTdWcHRPRlVFZlBCWW5HeXVtV21iNmUv?=
 =?utf-8?B?MkxqZ21UaE9BZkRtcDlKTUpGOUFZNXVHMCttVERjSjF0MmdEeXVEV0VoUUxL?=
 =?utf-8?B?VG5aMU5xdzk5YmlhcWtvTjVwVUFZRlR2aDBXUDBFMHAzeTFub25UbWRsaU0z?=
 =?utf-8?B?Q0lmejlVcVQwS0x0REJacWFlNEhlUWZGdm02WHZ2T3k0Q0ZsZm1jWG1Fb0ZT?=
 =?utf-8?B?SEFBcndFelNWaXhPeGJxNDhBWVFJdGdqaUlIZUhMc3k1QnZwNjhxR3RDN0c1?=
 =?utf-8?B?TVBIM0cycERqSVVjVDJUVERmVmN6ck5iS2N1S3RrREZMejFPWGtmS3ZiK3pI?=
 =?utf-8?B?clV1S2dVeTBhelhOaG5yY2JualNhWjlkb3lmMTZweDV6VDhXRjdlYW1hazVr?=
 =?utf-8?B?bHVjSittQUN3TldCYXg3MExscjYzQVNVYWo5a2Z1NEJaUGp5YmpTVjloenBt?=
 =?utf-8?B?WDNjMG40THRPMEdpekRaYUhkNlIxZkxlaHQ5T2RSb20rNXAvMFlzdDAxWlRQ?=
 =?utf-8?B?Y3JFTFlhTEhkY3ZZSysrZVhZM2pqWGJXWlNqbDNHWnlWS0QwQzlubnJ2U1B1?=
 =?utf-8?B?TWQrSTVhNjlpaGgwN2syNjRtTjNJR2hicjFrRkJVa1RCYnE1eEhzMkhoR0Vo?=
 =?utf-8?B?L1dQMjdqTGpXMnpkbWZIcHV2ejZtcFJ4cUovYzZsZ1lMTlJHMXQ3cjBzNzBN?=
 =?utf-8?B?Qm8xRVNTaWNFMWp6a1g5bjN5dkI2T2JjbkEveHBZQVY0eWNMY0tHTEhBRitN?=
 =?utf-8?Q?/C4NZ99Gy1wJQ/s07y5vNpHuyKjSj0UZQd7cE13pBgOg=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72458393-8ac6-4af1-3b02-08dbbdb1c5f8
X-MS-Exchange-CrossTenant-AuthSource: VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 10:25:43.5957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P193MB2023
Cc: "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-kselftest@vger.kernel.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Most of the tests in kselftest rely on external tools and libraries
to run, which means that in order to run the tests effectively we need
to have all the dependencies installed first.

But unfortunately, there is currently no way to know in advance what
tools and libraries the tests in kselftest depend on, and can only be
known when a test run fails.

For example after running the alsa subsystem test I realized I needed
to install the libasound-dev package.

This is inefficient for the test of subsystems that require a long
time to run.

For example, the net subsystem test, which takes more than an hour to
run a complete test.

I can only know that I need to install numactl, libnuma-dev, ethtool,
mausezahn, netsniff-ng, ndisc6, netperf, and other tools after carefully
reviewing the results of the tests.

I think we should add dependencies information to the Makefile for
each subsystem test, either as a comment or as an output target of
the Makefile, it would save a lot of time for the people running
the tests.

I can do this part of the work.

Welcome to discuss!

Juntong Deng
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
