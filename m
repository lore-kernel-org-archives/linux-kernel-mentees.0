Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EAF2E7E65D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 Sep 2023 18:04:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE60182521;
	Tue, 26 Sep 2023 18:04:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE60182521
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=o8XM9qAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fUrV9Kr-xQZf; Tue, 26 Sep 2023 18:04:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D3A0E82505;
	Tue, 26 Sep 2023 18:04:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3A0E82505
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A91A5C0071;
	Tue, 26 Sep 2023 18:04:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E443FC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Sep 2023 18:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F2FD82512
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Sep 2023 18:04:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F2FD82512
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WKqXR5QNx_Ys
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Sep 2023 18:04:18 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02olkn20803.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe13::803])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A336182505
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Sep 2023 18:04:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A336182505
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zfkkaaqyh6M4MPbEhgl+X+KWv1jSUBI87qzFo5q1f74llCH1ci5A8xfnfEx4LYTvB+mi8xCegvQc4yWCmpfog9gTaUHCeEwDOnO9xyxQ1HEqUTWaMo16S8/oBKwC+DMNwr7wSKeHIb2Oxh1G8CKr1Uq/IEfLWJNNkMETNOJKj70qnwCx4ufeo4abWOqWKNQxBXHmSEJyH/r2x+14IfFBljzqjcXnRFlzNXY9hJqBhBLhpV80HiMUd3JEK/pg1LodkOM6TM06gWwvGMwMF9gaqWr2Lk2v61HoSB+a9i8dz8Cr54eoHSIaniRqzNrIWHKV7R2zmxFoOBiP2GOOyX5NjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RwVWlXQeoym0mywKOq9pNSsKico5ab6LLcX/fLgmsKc=;
 b=jMsaO2cq+EWIbNhYYKNAjQfALFNkFys5/3gMFROa+DqwzkahztB1qkvsg7KjBendDzPjBsCVAAtjIjGmNQSwHWHHssFzr92l2PWDL8Hy2WaMNzdmvtnvGx9vMnMAWXyAysbVf7W98QIHXB4WnFXnbpQipkMTEoTWKK0bs47u5r8OdmoESAaLXk3IzpmAyB13QMjS+5OQ0xHd5SZP7gpKsi9GJAghKl5PNosRAhpRvH9dmBJ0+IxK2zjH8Hy2e1elaJkX39NbX+X8u9u3W2hh7a8xmmnl8KcySKCAPhSmLWbGavN5RxWP+FGcjrW7j49hsRQxDHlA7T4aRr6rTgOhUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RwVWlXQeoym0mywKOq9pNSsKico5ab6LLcX/fLgmsKc=;
 b=o8XM9qAFgMLeT6wtS5rc9bEjU2b/zTnAv4TGY/ypdoPUH94ClDw5w0BgvFJB/mCaa8f0rp6Nmg8CKYOFT9I1EQiz1JdHNF1SsP+aUWr2oLt2duCg6dyluOKuvTiK/xT9v6h8r0n0kWVWHUerf7hfDsECS9+zdOrdJwZ+ZE6C8ZuPFG3Yzwn4Ce8L2Tq1MHvyCvdWtCr4JsPcvSTCGvQCgVUZ0mjlr7bIlAA8DEZFgpaksh1JSkUhOWZl6GYNWVza3ZAwTRRF3JLPKd2l8lLxLY1w7Rq2mby4JEeb2gC2GlWp1yzQlo6JNUHJa1MpVhZdkcyot3LacZPktmbbBu/S7A==
Received: from VI1P193MB0752.EURP193.PROD.OUTLOOK.COM (2603:10a6:800:32::19)
 by PAXP193MB1629.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:13f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 18:04:15 +0000
Received: from VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
 ([fe80::3164:ae5c:78f7:23ad]) by VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
 ([fe80::3164:ae5c:78f7:23ad%4]) with mapi id 15.20.6813.024; Tue, 26 Sep 2023
 18:04:15 +0000
From: Juntong Deng <juntong.deng@outlook.com>
To: shuah@kernel.org, mic@digikod.net, brauner@kernel.org,
 keescook@chromium.org, tony.luck@intel.com, gpiccoli@igalia.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Subject: [PATCH] selftests: Fix wrong TARGET in kselftest top level Makefile
Date: Wed, 27 Sep 2023 02:03:23 +0800
Message-ID: <VI1P193MB0752596147F224B9F921C85199C3A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.39.2
X-TMN: [Ier0yVm8oTt2wRApjFme38b5i3hVTU7C]
X-ClientProxiedBy: AM9P193CA0005.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::10) To VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:32::19)
X-Microsoft-Original-Message-ID: <20230926180323.21921-1-juntong.deng@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P193MB0752:EE_|PAXP193MB1629:EE_
X-MS-Office365-Filtering-Correlation-Id: 61d13663-69a7-4085-66c5-08dbbebafe85
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lihTRgR9Sr4MI15Ka9DYgAztiI6JS8M9R8kNeHHgSiWGOD6CLwjqnPzla3oMZZKHt4gOLIGPynowX7M9Y3BCpscgPGFzp0tK4zMir7UEMkF49/mKgCWANTUDYtIb0HD2dZskXaLlFkusJZYCl3F7NqSt3Tewga9YsJa8BlI/DSoyAIMb3+0YKYZynaWcDvg2hUWvxM0kc0/w+jhHSKRE/el7duglX4+KW2zGEiGEyO1sC0kWTBiohkBtzyO0d3ygY3A5sBw1xheRKp88vvNDKorCbHO5yNVUKSL9izUt+j4OLlhy/aIIiE9BssakyyVL/ArenVV4EJo9zhO7yVjq/5uwiSrnxK40h+H+bNwlErLI5w4TRYZwF0CRAvEOiRihcJA/MQLVqV/t8DPF9l67cdFrMfChgnAwNlr7ZG4iZtU/dO4uDEfy7HaPXIK1zsQj3bvj/pYaJyGVmm+5/jq4DZ1akI1c+LhyJk7beOr2sopS8dsP3GF3pAiXBs5r86HZD6OpVpgsRheQBCZ+BM0Vx9JzF9a76sgJAAn4eZ3Sj7kgxq8VRZjVhndh/mDU2gAR
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pIZEGfMgfEHrNru7pYofKvThXDbVcUzHcsAxbS1Tl+BMhjkpJbjNoyFjaWUu?=
 =?us-ascii?Q?urNluKWZmTzz1yzkstF6pV+6GIL02oU0cCq0xhttsMKpMYzWs0r+LxRDGmBV?=
 =?us-ascii?Q?MRM0Pg0kwbpj8nX3IU6zMhHSFU+puFtmwwkLvg1dukkXtI2P3zUCnpI2WTPT?=
 =?us-ascii?Q?VAtv0t2sg1yd6QZ1o+0OE6QOIL3KkeN3HaBGIfcaZJf6bbbM/xrenp/hOZVz?=
 =?us-ascii?Q?kbnO/bW5Xdce+DjgY0hK7+VNE7Eai9FGOOIP6YQHUHepqEnKL8CA2TafP8E2?=
 =?us-ascii?Q?MNdPRyPSZzf3OoMRB8J9QDGMpwbUy81K0REivp1alXnIYm2ISRZhjJaRSn7l?=
 =?us-ascii?Q?0LW/Q6e2oQkuvGDpZdukTlLhcFYjtZjfs5qsjgx9nN8AUxhnthCacLuXItm/?=
 =?us-ascii?Q?WqWmcgvQMeq6UDL0w8wXzFXZZCQ72DgKHk/D+db2U9KUjzsxeCZh61XMxB73?=
 =?us-ascii?Q?6ZQ/v9CqdiTLvJpnrcU4x5ctXajI++SgNdGI8cfUQEsRdatoU0HcpCktt4z7?=
 =?us-ascii?Q?eOrmE5nPY7EPu9H7Jq3qlnxGpHzCOQNLEvmtcggRGQXyz3AtVLeP5HCsSFtw?=
 =?us-ascii?Q?4Qw0pzYnkG1wZeZFuxeJol/obp6IoO25lCC9KNWOZ9NQ2T8M6SRGvVE/1dqT?=
 =?us-ascii?Q?2u4jYoy0NeXZnj2vdiO9QGMDaRbXtqYhlmxftHcr9GGuF/x/lX1voZB2cYgp?=
 =?us-ascii?Q?01rkuNUKaBFcZCV7VGBe+hl2M8vHeaKNbbCHG2Hs/N2URQzdGY6VlOTWeKAz?=
 =?us-ascii?Q?UsrlsVOKMYs9TfKOCeqmoxcFUZhmiCORbM+XD9Ym2Aii8e0KRs3R/gubU/ia?=
 =?us-ascii?Q?QuE3Zc6upD25PVrJUmUBtNm7f86FaiOXiU9RJt8pvi4boltfTk+wEiqiSNSQ?=
 =?us-ascii?Q?iZrniHoCnq8HwWO/6Jk7SbB5oGDRW54GDJmWganLz9d/VW1ZUeW660xT3jv1?=
 =?us-ascii?Q?rSIFXwpGU7L9UUKYr8/4r5+96zckZlcAgqIMGfOUz9Lqbu5E9SIs7ILUrkVw?=
 =?us-ascii?Q?HuMKyZG0LKAvoBrhKA0/v/thgHZg5rjS/FJ5ivlb8N7cys+UcRygJ1osDQwh?=
 =?us-ascii?Q?oUbBluuObTvkrVqMpWnJdqQzFOlI61pEYAVIg+AUnK82MytVhKIkiA51OcOC?=
 =?us-ascii?Q?TS/0LQk2GobL//W/UMH43YwvMeN8CGA0JZhcwHSt2uK2fBHcPLPfe1+pawkd?=
 =?us-ascii?Q?6stuy16gPMPlT2mOsyaetg0DIz0Ni4esliPHc6a/wDZ8spYTuHizTx1eZkA?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61d13663-69a7-4085-66c5-08dbbebafe85
X-MS-Exchange-CrossTenant-AuthSource: VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 18:04:15.0017 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP193MB1629
Cc: linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-riscv@lists.infradead.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

The 'uevents' subdirectory does not exist in tools/testing/selftests/
and adding 'uevents' to the TARGETS list results in the following error:

make[1]: Entering directory 'xx/tools/testing/selftests/uevents'
make[1]: *** No targets specified and no makefile found. Stop.
make[1]: Leaving directory 'xx/tools/testing/selftests/uevents'

What actually exists in tools/testing/selftests/ is the 'uevent'
subdirectory.

Signed-off-by: Juntong Deng <juntong.deng@outlook.com>
---
 tools/testing/selftests/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 42806add0114..1a21d6beebc6 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -92,7 +92,7 @@ endif
 TARGETS += tmpfs
 TARGETS += tpm2
 TARGETS += tty
-TARGETS += uevents
+TARGETS += uevent
 TARGETS += user
 TARGETS += user_events
 TARGETS += vDSO
-- 
2.39.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
