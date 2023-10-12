Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76893CDB482
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Oct 2023 11:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16B49820B9;
	Thu, 12 Oct 2023 11:09:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16B49820B9
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=nFv+h+xn
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qFyt7HHl28Zf; Thu, 12 Oct 2023 11:09:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id CC8E181E6C;
	Thu, 12 Oct 2023 11:09:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC8E181E6C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 99578C0071;
	Thu, 12 Oct 2023 11:09:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D216BC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Oct 2023 11:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 970BC820B9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Oct 2023 11:09:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 970BC820B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8Dqfk22AqmKp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Oct 2023 11:09:11 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04olkn0803.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::803])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7BA7A81E6C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Oct 2023 11:09:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BA7A81E6C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B/8c8wTDinwn7cFxrB8UQxp/X/9Z5doFb9YCe8qFXGyOlKeNPlcp5z1yELnoi93sWpe+ZP6jkVcr8yG+gE0euCpqFNao95vKUcZaO+WnGuNuuIFIGcUnDD8SHY2lofrKVN2TvXxEXBEfD8Tu7Hk9utoXvOwBrPdvPZ81KJWccRNbTuxKOc05cNcSbi3BPFKxJPjOpYUgDGHBiW9vdeyMPGuh9+oVjvptvh7L36UZ06i4uoH8/E030ZEuOlU7fRsCJfge7TzUBaQN0BuRWL6X3oeqk8MxrI++iNxxl97c4mGzsg9DheRQ3C2RMTkxoaxGK5vR3iRUX55B/JD6KIvjRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lIPcVhKphvYHB9AXSn2UFPY/PSOBBuMD+WpuD5ZR1fs=;
 b=jvuMyheShFVLtC4r1O2RHEr/DDwLg9LkIAw0imyP9Ms/39hMqtZAzKsPkJdSUKc0GNS2PaUEyU7ST1p7muQcOcx4NK/bvGaNnaHI9Q0T5ZF6rVF8QtheWWho2Y4ThfRmDJr+kJJdSOPkCM5QYUFASkQjPCj0JoKJeUBoV48dqSPDWDi0ukLY5IFNWmrvwlggtwEqXPjX79L1BUGEuKAMbkcSafGxQgAAdStrFxDf9FlLPC3MWLDD1ZSC85hvE5xFKkP3ACdRDWJ8YZUrUEPgEKtbkbxGQn2/84tnqR40vbwHjvYuRV9jVv4DPHScvZDTRtAp5vP0GkFqnMveqWIGKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lIPcVhKphvYHB9AXSn2UFPY/PSOBBuMD+WpuD5ZR1fs=;
 b=nFv+h+xnK4cLKiVl+3n0Rlq+PBtywiOI2BNa1+MzSw2EiNqZiRLDyuWGRAH5wnVNFZ2SMNOTlnlgov7zFiKMos4PojnBdcb/fE+1CxzSaM3xJgiRiHG/GXn1zManSxSA+Iwv8d8eZDRXENEslxIkNMcJ+g+OSLlT15eITUELoeg2IaCj9wwFUv+2ZsnNUcg2eghcfjFYA3R7ToL7IHi0yGCsZZINI14vvKd9wOYrukaLwq1b5fON7nCPSD6uEwnMulQ6Vu3exaRkPpLBBbN2PrAUZNrs9WDuOrvTlf88ZO+UuDZzVeaNVZkoOVXZ594yfCHVeI+S+rSKxWkfEtxRqg==
Received: from VI1P193MB0752.EURP193.PROD.OUTLOOK.COM (2603:10a6:800:32::19)
 by DBAP193MB1097.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:1c6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.42; Thu, 12 Oct
 2023 11:09:07 +0000
Received: from VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
 ([fe80::af68:c2a:73ce:8e99]) by VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
 ([fe80::af68:c2a:73ce:8e99%3]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 11:09:07 +0000
From: Juntong Deng <juntong.deng@outlook.com>
To: brauner@kernel.org, jlayton@kernel.org, jack@suse.cz,
 gregkh@linuxfoundation.org, xiubli@redhat.com
Subject: [PATCH] fs/minix: Improve validity checking of superblock
Date: Thu, 12 Oct 2023 19:07:22 +0800
Message-ID: <VI1P193MB0752662A4587C90C3DD4C5DB99D3A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.39.2
X-TMN: [HTVgY1J+M33/W0pqfi8I1pgRVoMzJS+H]
X-ClientProxiedBy: LO6P265CA0029.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::15) To VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:32::19)
X-Microsoft-Original-Message-ID: <20231012110722.11153-1-juntong.deng@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P193MB0752:EE_|DBAP193MB1097:EE_
X-MS-Office365-Filtering-Correlation-Id: 85d2b238-d9a5-412a-ef2d-08dbcb13a684
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bODEC29oWXM+1MXfOTLjKSUh8zwk3La69kDSltEsxvwx/PblSasMSJA39hKwTaV+NFIVHTLTTn/RJNZiiGiCSPZMe8BbUN2eWGKT5U2cVNjyxIaAk81n6T2kuFfnyjG1cYloS3aebiZdoK9HhH7J7bRuq2I1RGjY4cBXilMqCGJ8L0X1iTKu7e3g/w3t64aPmuM5vbu7b/OYBo2c5BFTHYppBBgVe+LuH5cXOQBKTgzbR7qySIFVIAJj1fssHfrnMccX1+HDmDND/ZoUXUexgq7cfukjvpbbhw9ezxxpJJeXspn0bZxeizRp6eNlBw3diOfWNU/mLFztrZdwUHcpUF6DENmIJBxIIzJWQFfP8VeHaewbUcdoHczJM/L7NfdXhuOJ4iIcP19xl9+d5dFtuczFmGJ7/e7QcTUHhU7JAg/4doWIghe+yNTbBXMUqRSJ5gqWdkKt4DxBHb7Ug44PD9R4DiPizGUUiwJTS5HFRipFnc2QcZN5sGQOZsOWA1NX0C9DVhFSuGVlDIls8/quYgc86+PiQ8lT+2SZLyEhR0C99e1Ug9isD8G4ja87oIoRc8pCmWbyX1VW+o2hsVRJG/7i9r7ma9WSJ+TmDLbXAdUmihj3ilRWNO4pQVU+YGuO
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D1nodr4h7j6jrQnzCZ5lrZP/BdQHvZTrI85fYA7YKCt1GZGTDk6P4vMpDBdG?=
 =?us-ascii?Q?bxKAmF4TOiAdasN35MRCPORjwDT58WKOcHODM2c4anONRHCDofTsm3FeJSHI?=
 =?us-ascii?Q?lvxevArKIk8bDimXNNEnqb3+Sn8ImmHYQhiSbHEdOQ/ihFJinrKlTeLPKfVp?=
 =?us-ascii?Q?eHIDCsQMwObUfkzFdtK1cSR60O72d6MOR6KIYlaIH1JJczFaA5gxTRBKGxOj?=
 =?us-ascii?Q?OMoOcgrclJVeGM/TUbGgzTqAwABEJp1cxHgYbM8Qf6g3/itySfXMeTpEffzz?=
 =?us-ascii?Q?kXFfqrOQd5aPS8rUeH9E2bc+Xd1Q8gAPfdbvAbvrj1XmBDGx1rZxVf4XnmqQ?=
 =?us-ascii?Q?e4CJZAt6Mqcc33HLRk3ybZy9gZgfE1YA4g1PER3hemvuwUpAarw5HNepTbo7?=
 =?us-ascii?Q?xHbkLg8lb2tjaTvMwv7SWsVCcw5x+8Xu/4zVf+crTGB/MSZGiVvj0yiAPYsB?=
 =?us-ascii?Q?ys5xmBDZdCWmlDmfQsIM3rXEjBN1OEoH/jlfo9ByygsAurLbXz5kbK/a/BjN?=
 =?us-ascii?Q?32BOc10eiUuOYEo1+jA7pq5zuDiPe3rNwY5kH4xvHR3i0FwgXsbDk3+uykgs?=
 =?us-ascii?Q?pimqZpnALjUBtW9xi2tLFg5wXwXhE8vXwZN5HhsAieUzsRQUmp4A+7qjM9Mg?=
 =?us-ascii?Q?26MV1O17lpIqmzFPmwh4ORoa2dsFqa+mg47nWBSNAZVTKteTWj3WD9lEzqdW?=
 =?us-ascii?Q?apz2YguyeWfgq7Mf2+dWyZ9o8XkiTlT8OvrJ6QvUVO+qNjpNyo0JBnUivG4u?=
 =?us-ascii?Q?RkPhvrldB61w9cdnvzRMFQfg4HVQHQ07M1oBsBrCMa+oh6bqPcndvEl5OeTa?=
 =?us-ascii?Q?9th++3Og50iUfOZCe+BtNSaigdgh3JRHyyVC59Y/E8c5M47Ql/zDo0f5yefE?=
 =?us-ascii?Q?my7GV0nEMMoQJcb9h27X5AmEFhUpYnTOSHeGF3dnmc6dcMbnESt2Pd7PdLvI?=
 =?us-ascii?Q?iEaU1n4KTC4yZVRH4de7v0IjD0A01sElJ8OZcO5dUAwmnp6espc1LeT/8xC4?=
 =?us-ascii?Q?SpQbTya67NhIgyBfJehiyxyDWeffpDQ5TnchemK3FIEWWAwzQ+niTjVFmepu?=
 =?us-ascii?Q?vf6mRboK3TXj6N14WN1uHNOCmXpW8NhVflxfHsrrOUXBSD1wp+7QGICL50qu?=
 =?us-ascii?Q?CKSUONB0QEXPj6wUuYATksy6/uZrGym1z0JRewpg38qQAS8bpDaZhhgb4+xv?=
 =?us-ascii?Q?lo683hfdNlnUnpZSDw1i0VetpCzzaXH+y96SWNOBuk4B72HU6s+gJHvSA0I?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85d2b238-d9a5-412a-ef2d-08dbcb13a684
X-MS-Exchange-CrossTenant-AuthSource: VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 11:09:07.2034 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAP193MB1097
Cc: syzbot+5ad0824204c7bf9b67f2@syzkaller.appspotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 syzbot+2f142b57f2af27974fda@syzkaller.appspotmail.com
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

According to the Minix source code, s_imap_blocks, s_zmap_blocks,
s_ninodes, s_zones, s_firstdatazone, and s_log_zone_size should
be checked for validity when reading superblocks.

The following is the content of minix/fs/mfs/super.c:332

  /* Make a few basic checks to see if super block looks reasonable. */
  if (sp->s_imap_blocks < 1 || sp->s_zmap_blocks < 1
				|| sp->s_ninodes < 1 || sp->s_zones < 1
				|| sp->s_firstdatazone <= 4
				|| sp->s_firstdatazone >= sp->s_zones
				|| (unsigned) sp->s_log_zone_size > 4) {
	printf("not enough imap or zone map blocks, \n");
	printf("or not enough inodes, or not enough zones, \n"
		"or invalid first data zone, or zone size too large\n");
	return(EINVAL);
  }

This patch improve the validity checking of superblock based on the
Minix source code above.

Since the validity of s_log_zone_size is not currently checked,
this can lead to errors when s_log_zone_size is subsequently used
as a shift exponent.

The following are related bugs reported by Syzbot:

UBSAN: shift-out-of-bounds in fs/minix/bitmap.c:103:3
shift exponent 34 is too large for 32-bit type 'unsigned int'

UBSAN: shift-out-of-bounds in fs/minix/inode.c:380:57
shift exponent 65510 is too large for 64-bit type 'long unsigned int'

Reported-by: syzbot+2f142b57f2af27974fda@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=2f142b57f2af27974fda
Reported-by: syzbot+5ad0824204c7bf9b67f2@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=5ad0824204c7bf9b67f2
Signed-off-by: Juntong Deng <juntong.deng@outlook.com>
---
 fs/minix/inode.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/minix/inode.c b/fs/minix/inode.c
index df575473c1cc..84c2c6e77d1d 100644
--- a/fs/minix/inode.c
+++ b/fs/minix/inode.c
@@ -154,7 +154,11 @@ static bool minix_check_superblock(struct super_block *sb)
 {
 	struct minix_sb_info *sbi = minix_sb(sb);
 
-	if (sbi->s_imap_blocks == 0 || sbi->s_zmap_blocks == 0)
+	if (sbi->s_imap_blocks < 1 || sbi->s_zmap_blocks < 1 ||
+		sbi->s_ninodes < 1 || sbi->s_nzones < 1 ||
+		sbi->s_firstdatazone <= 4 ||
+		sbi->s_firstdatazone >= sbi->s_nzones ||
+		sbi->s_log_zone_size > 4)
 		return false;
 
 	/*
-- 
2.39.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
