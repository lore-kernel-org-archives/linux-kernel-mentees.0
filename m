Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E04E1C4167D
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 29 Oct 2023 21:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 701914EF75;
	Sun, 29 Oct 2023 21:11:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 701914EF75
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=EITy43bO
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rbHpvFhf2hU3; Sun, 29 Oct 2023 21:11:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 5BF224ED30;
	Sun, 29 Oct 2023 21:11:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BF224ED30
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3201AC0071;
	Sun, 29 Oct 2023 21:11:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D6947C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 21:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 891B484FFA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 21:11:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 891B484FFA
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=EITy43bO
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wkn7F7_tFhKG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 21:11:09 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04olkn0819.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::819])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F1268519E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 21:11:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F1268519E
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H+S2mGO8QCZP6vi82MzkyjcZOphWsx1ucfy8TYifWlwfghG8Q+YUPeJOdjjmXrMoS129zdt2GRH3sO2XjMFLomdTjGM+p2Fsh9vD1fN1752md90kG/duyvFKDwx7tQfRRjkU6JzAg144DADnvrLFCfjjcHoXN+ylbQRb8CiwqJTqNpL0gDuKkRvlpH9uhDxNmJ3YgNsYHrt2aTQ63T7uJobO5Pfl6n+OB+xYLXA6nSFf9fn81BJyBTRbG/3MPWQOc5KJPajwVg6dZWrUaru36p9pTKTxAsyI9Oo4RpHVbw9wI32XKAS1u9+4GqJxJGJ7AMRpBRUOj7sEFPMmn4tXzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EWS9a6o9OZb5RyCggQhsHF0sCptX0lBBExqZHrGQLv0=;
 b=jj0cDwEssPRuTlNX/xooI17Fd+d2B2ez/TEgS59Ltagx6QAulHSqc5Mhk1i1j04KdU5y447VD3VKI3Wa5U60YtgcEa+jz2LdV8uToumqy6FyEddvSfDYzRuoUtJWQ5kHwhKDWbtOt7sDExZEfe7ay2laYREfdDoNIj+Vf5LbZTLM0Qnclpv9NNP6fXUp/UjMEINTZII6PcIRSEP7dC+tgjx8kgS+lFcpn7EslfZyyPmqJI9f6IG3DWRYY69kcxxT7205lAGjB0FqmW+/SpKNmIkv0J6SEmvda5z3FNRVEX6E/cuiz6J+UFaPwa/62ya1P0/tlpJ6AwzYfIyKxz0gvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EWS9a6o9OZb5RyCggQhsHF0sCptX0lBBExqZHrGQLv0=;
 b=EITy43bOOE0aJPw28HXdAL+oDFj6ecEAMQclMJ0ERyVHy95kX8btm6lU2dxQbVtRRvdnm5/CJnHRLEpitxZzbnJPZN+LkjKlVIsJB7FISAKLMpfIRxmRSzFZaVp9OOeeKdAsoTfPoqKvo43x/TVLqd+TTGIpz20PkEl/dxGNFzr3bWz5tHJQeDQAqua5VqQbt1A+J23Pd5UiYEItE+90hTnrhw+YS/f6uz4mLzRjmd4aJN3GW6gAsdIV/qgXvXPslafdZG9qMHw1Pvtda0Q3f+tN4rvnCeZvr95itg6Ee+F3Hg2kQ5aKdmIcemaRaFv4GFHj9vQNS9G7anQkg50yuQ==
Received: from VI1P193MB0752.EURP193.PROD.OUTLOOK.COM (2603:10a6:800:32::19)
 by AS8P193MB2382.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:40f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Sun, 29 Oct
 2023 21:11:05 +0000
Received: from VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
 ([fe80::2db3:2c11:bb43:c6e]) by VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
 ([fe80::2db3:2c11:bb43:c6e%5]) with mapi id 15.20.6933.027; Sun, 29 Oct 2023
 21:11:04 +0000
From: Juntong Deng <juntong.deng@outlook.com>
To: rpeterso@redhat.com,
	agruenba@redhat.com
Subject: [PATCH] fs/gfs2: Fix slab-use-after-free in gfs2_qd_dealloc
Date: Mon, 30 Oct 2023 05:10:06 +0800
Message-ID: <VI1P193MB0752B3C3E2DF69C56BF5D6D199A2A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.39.2
X-TMN: [cTgAdkqDyOAf//uL0uBVdrUumzSNDDy0]
X-ClientProxiedBy: LNXP265CA0052.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::16) To VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:32::19)
X-Microsoft-Original-Message-ID: <20231029211006.165702-1-juntong.deng@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P193MB0752:EE_|AS8P193MB2382:EE_
X-MS-Office365-Filtering-Correlation-Id: 877189a5-e76c-4231-8aab-08dbd8c38fbd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JLayNDF53ErOhwc3RxAOhvbYozSPql1C5cccGRjruhea+eFJWyrzZrTLEyqzRdCmv/LxLwgz7G4pgqono1ofnkIK6e4VGznfQ9zN+UaySB8gu7a3nPvOu23Slwqel9bJMl+N7Y7tBupz3FoxPKduFbZzxIe3T3Bdc8p93uWEE+6S3FtqWBadgyn54ol56psztPqv4PsYIV0WQPSiE9kx5/LMZGxHnUBIqd+yIeD8QdjqmYgjJylizo94GV6VK5VCGodOyGwtqWRmIODk++YtydUQDqciOqNiTAd/8TO68RaJReLRnllh++Qfwlzx8BFFD9iWq88sZYT//Le4gzoRSCnT0MHas/23LjPIKxQqEsREnFLwHK3Su8/0BtrpUBUgwOM89Vnv4mG2MZLnH+nE4tV3BYrKztJi4cxMTbzX1faW1gd81B1GIBGOZmmFeCUQWwLkIiVyJjx+3nEY6JqCjKPOge00dtCqrCqGrrx8h3IgOmP27LxqI62en9S0P17VS5TfkD0K2DRaev5vBxGjKsPPJxyZiAhm1pMXijmFuokv89QbG22h6fXKK84WAkbv0C4u30Aw5XVF6QYeOaQLJPZqIk3k5KKJ4hjGn+N50Qc=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iOwZ1rG9ZydYmdBN/uxvsWXsXD4CaADlGyA72p9QOofHFVxJvf7N7uXpv/NM?=
 =?us-ascii?Q?NCGLnq5PI+jm9gV3fIE1Xa4N5lNzVNlfWWJNMsJcQkeYMKgqgBUCvWyPLiF7?=
 =?us-ascii?Q?k73A9qV/gyrfmvaz89aV7RE6WAwetWf4rfgDYkSXxjfnmXKzmH+xVO9eWJB4?=
 =?us-ascii?Q?1R3Sg6xH9z0qcGFy5W83UbpEwFlSC5JOjKk5dHAUTHHgs7EQqDpellxV/BGG?=
 =?us-ascii?Q?xkejCYaimEzAoo8atFjLy7c/T4q9ZSAFzmssSKSM3DLoSPuxOouz9bXZLbiN?=
 =?us-ascii?Q?bVGhzLyp/xcBZUa8AodxNwKpTvwsAsHhTqjkJ9VHtqa3kUNZKQftyRiDNjNX?=
 =?us-ascii?Q?Ky2A/K+tTihuZERDytMyN19IUuWtjsdq8mS8nrkWdnSrXkyWL74tFfMkhyI3?=
 =?us-ascii?Q?DUtWIrQu8Pev75V8ZuLbokCvzEYpPyDzR5+DHjIGCHRuvJix4F5MdO847eCZ?=
 =?us-ascii?Q?IcbUvPiXmU8ZBGAdxYkOXZ0rW4gzfhyRBJHTEhDWBk2wVmWJSKJ67faY3Ny/?=
 =?us-ascii?Q?U9jXJNxS2Twy/sAr8ZCYEyIlpL9qrdeduNweVtXPm8wKFIyn6eV9CENdBNbA?=
 =?us-ascii?Q?a4DM/l+l8ugdvIGn+971uNLT9lgMFEnXIRvfG2M1LGq/7RScaX0fEcnILkhK?=
 =?us-ascii?Q?1NS6VpuVtSEjYomzxi2DPhgKoT2ADmmCH+soD+28+jYAvaLvX8UE8TePxah2?=
 =?us-ascii?Q?Y/uEjDd4iWkXsfWDW0Rc4omwYsRkh7rYFLs25OMQwjPNgltoIfKy+/1zhBgf?=
 =?us-ascii?Q?Gm473h0brl8kIrjYlz4xd+88p1HaKpIDC+MWfTfCTpUijR/vRahCdrM9Nfqt?=
 =?us-ascii?Q?fFdb/IGiHAqdc27efWB++7DAzRHt9HjgUx0sVyHumwvaXvNona517d81se26?=
 =?us-ascii?Q?Ck8jxuFJqzLKUreaMlVvsUiw293u348fNFAd5tNwE0iURyQ3YNQGAomWXIbP?=
 =?us-ascii?Q?GRLZUsSf9Wd3wwnGCIY3ZS7u0etVwW20DOfh+CjhQ+MUi538Txv04m651Q2Z?=
 =?us-ascii?Q?vAPLSdhKQICKp/qz8wq2AENvIDeMXuxeMFz+Kdkygm1FwMdYtglgzIl5Ug/i?=
 =?us-ascii?Q?ihQQ122KKyuToKz6RSU13xTtFeL20xNRob5hYwDc2xRTaC3yHGn2hjYBtiPw?=
 =?us-ascii?Q?nD68Axh4nuLqsKbtt+Yc3261TrAmAh2nOcAG+uCsj8H0URs9Lqym/esg6bZp?=
 =?us-ascii?Q?xJj/AfjFFki0kFNBFW+rGd30S0yCMkdUqS3JKahNTA9OuNEFID40lQGLbgg?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 877189a5-e76c-4231-8aab-08dbd8c38fbd
X-MS-Exchange-CrossTenant-AuthSource: VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2023 21:11:04.8526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P193MB2382
Cc: gfs2@lists.linux.dev, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 syzbot+29c47e9e51895928698c@syzkaller.appspotmail.com
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

In gfs2_put_super(), whether withdrawn or not, the quota should
be cleaned up by gfs2_quota_cleanup() and wait for all quota to
be deallocated.

Otherwise struct gfs2_sbd has been freed before gfs2_qd_dealloc
(rcu callback) is completed, resulting in use-after-free.

Also, gfs2_destroy_threads() and gfs2_quota_cleanup() have
already been called in gfs2_make_fs_ro(), so there is no need to
call them again subsequently, whether withdrawn or not.

Reported-by: syzbot+29c47e9e51895928698c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=29c47e9e51895928698c
Signed-off-by: Juntong Deng <juntong.deng@outlook.com>
---
 fs/gfs2/super.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index a4b3655c5361..d21c04a22d73 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -602,13 +602,15 @@ static void gfs2_put_super(struct super_block *sb)
 	}
 	spin_unlock(&sdp->sd_jindex_spin);
 
-	if (!sb_rdonly(sb)) {
+	if (!sb_rdonly(sb))
 		gfs2_make_fs_ro(sdp);
-	}
-	if (gfs2_withdrawn(sdp)) {
-		gfs2_destroy_threads(sdp);
+	else {
+		if (gfs2_withdrawn(sdp))
+			gfs2_destroy_threads(sdp);
+
 		gfs2_quota_cleanup(sdp);
 	}
+
 	WARN_ON(gfs2_withdrawing(sdp));
 
 	/*  At this point, we're through modifying the disk  */
-- 
2.39.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
