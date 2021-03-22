Return-Path: <SRS0=kSKC=IU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FF45C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Mar 2021 16:12:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1CCF619D4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Mar 2021 16:12:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1CCF619D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=anirudhrb.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 891DF82F96;
	Mon, 22 Mar 2021 16:12:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HGRZt2W7fn9R; Mon, 22 Mar 2021 16:12:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83D5182F6F;
	Mon, 22 Mar 2021 16:12:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5F8CBC000B;
	Mon, 22 Mar 2021 16:12:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 10423C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Mar 2021 16:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE7474026B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Mar 2021 16:12:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=anirudhrb.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gNUqAQoSPhLw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Mar 2021 16:12:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sender4-of-o53.zoho.com (sender4-of-o53.zoho.com
 [136.143.188.53])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 30C7C40166
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Mar 2021 16:12:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1616429537; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=PRMysHNprZ3jf2UHc7wrhs76Alxf8YivXUfHuFraT286M73IEtLOyz6Nu5MWKEdsW8LSPK47eltnDwIxiCLi7EUP4nIO+/9hI+MyDUj7IXM0dZ5v3+4jX9snrH1BRme1Xikfdnhl40kNaPMZxGTMLIpBmpbiO+wYWepjemTMY3A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1616429537;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=qXkPKXLIdi3YS2QxskiB00F5rS0qkdSxQYzMcJTjnMo=; 
 b=A93zRYLFYdWAi01ZZwv796KSoJ9FrLQBJ9uBA125ndMv2d+GzRNf/lwjijEmoERSucguGnuCrF/lTIJioy8+nCV5g5oNnU5v0LqDbok+mORG9r0kBv9QaGGelWMI8RsjdVgMEZOWK9YDI0FRoUUO4NAbGa5/WXJ4Vj6R4OTbMQ0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=anirudhrb.com;
 spf=pass  smtp.mailfrom=mail@anirudhrb.com;
 dmarc=pass header.from=<mail@anirudhrb.com> header.from=<mail@anirudhrb.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1616429537; 
 s=zoho; d=anirudhrb.com; i=mail@anirudhrb.com;
 h=From:To:Cc:Message-ID:Subject:Date:MIME-Version:Content-Transfer-Encoding:Content-Type;
 bh=qXkPKXLIdi3YS2QxskiB00F5rS0qkdSxQYzMcJTjnMo=;
 b=T5hPkdOkdyoV+EvrAwp/VH/mTozUZyL2Yn4mutF7Yh+y/3xv8gyogTlrnjd3C5QE
 H0xJ+aHMO3k2qqsUkD5DjSWKFA5znZL7wRRuIRr/jCRVU2PFnVVV0OwhHuzaiVZGBKM
 B7NQ1ucBFxS2BB15+l0YyarIzS+8whu204hoX8ww=
Received: from localhost.localdomain (106.51.105.21 [106.51.105.21]) by
 mx.zohomail.com with SMTPS id 1616429533738896.0472127781908;
 Mon, 22 Mar 2021 09:12:13 -0700 (PDT)
From: Anirudh Rayabharam <mail@anirudhrb.com>
To: shaggy@kernel.org
Message-ID: <20210322161147.5593-1-mail@anirudhrb.com>
Subject: [PATCH resend] jfs: fix use-after-free in lbmIODone
Date: Mon, 22 Mar 2021 21:41:47 +0530
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-ZohoMailClient: External
Cc: jfs-discussion@lists.sourceforge.net,
 syzbot+5d2008bd1f1b722ba94e@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, Hillf Danton <hdanton@sina.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

Fix use-after-free by waiting for ongoing IO to complete before freeing
lbufs in lbmLogShutdown. Add a counter in struct jfs_log to keep track
of the number of in-flight IO operations and a wait queue to wait on for
the IO operations to complete.

Reported-by: syzbot+5d2008bd1f1b722ba94e@syzkaller.appspotmail.com
Suggested-by: Hillf Danton <hdanton@sina.com>
Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>
---
 fs/jfs/jfs_logmgr.c | 17 ++++++++++++++---
 fs/jfs/jfs_logmgr.h |  2 ++
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/fs/jfs/jfs_logmgr.c b/fs/jfs/jfs_logmgr.c
index 9330eff210e0..82d20c4687aa 100644
--- a/fs/jfs/jfs_logmgr.c
+++ b/fs/jfs/jfs_logmgr.c
@@ -1815,6 +1815,8 @@ static int lbmLogInit(struct jfs_log * log)
 	 */
 	init_waitqueue_head(&log->free_wait);
 
+	init_waitqueue_head(&log->io_waitq);
+
 	log->lbuf_free = NULL;
 
 	for (i = 0; i < LOGPAGES;) {
@@ -1864,6 +1866,7 @@ static void lbmLogShutdown(struct jfs_log * log)
 	struct lbuf *lbuf;
 
 	jfs_info("lbmLogShutdown: log:0x%p", log);
+	wait_event(log->io_waitq, !atomic_read(&log->io_inflight));
 
 	lbuf = log->lbuf_free;
 	while (lbuf) {
@@ -1990,6 +1993,8 @@ static int lbmRead(struct jfs_log * log, int pn, struct lbuf ** bpp)
 	bio->bi_end_io = lbmIODone;
 	bio->bi_private = bp;
 	bio->bi_opf = REQ_OP_READ;
+
+	atomic_inc(&log->io_inflight);
 	/*check if journaling to disk has been disabled*/
 	if (log->no_integrity) {
 		bio->bi_iter.bi_size = 0;
@@ -2135,6 +2140,7 @@ static void lbmStartIO(struct lbuf * bp)
 	bio->bi_private = bp;
 	bio->bi_opf = REQ_OP_WRITE | REQ_SYNC;
 
+	atomic_inc(&log->io_inflight);
 	/* check if journaling to disk has been disabled */
 	if (log->no_integrity) {
 		bio->bi_iter.bi_size = 0;
@@ -2200,6 +2206,8 @@ static void lbmIODone(struct bio *bio)
 
 	bio_put(bio);
 
+	log = bp->l_log;
+
 	/*
 	 *	pagein completion
 	 */
@@ -2211,7 +2219,7 @@ static void lbmIODone(struct bio *bio)
 		/* wakeup I/O initiator */
 		LCACHE_WAKEUP(&bp->l_ioevent);
 
-		return;
+		goto out;
 	}
 
 	/*
@@ -2230,13 +2238,12 @@ static void lbmIODone(struct bio *bio)
 	INCREMENT(lmStat.pagedone);
 
 	/* update committed lsn */
-	log = bp->l_log;
 	log->clsn = (bp->l_pn << L2LOGPSIZE) + bp->l_ceor;
 
 	if (bp->l_flag & lbmDIRECT) {
 		LCACHE_WAKEUP(&bp->l_ioevent);
 		LCACHE_UNLOCK(flags);
-		return;
+		goto out;
 	}
 
 	tail = log->wqueue;
@@ -2315,6 +2322,10 @@ static void lbmIODone(struct bio *bio)
 
 		LCACHE_UNLOCK(flags);	/* unlock+enable */
 	}
+
+out:
+	if (atomic_dec_and_test(&log->io_inflight))
+		wake_up(&log->io_waitq);
 }
 
 int jfsIOWait(void *arg)
diff --git a/fs/jfs/jfs_logmgr.h b/fs/jfs/jfs_logmgr.h
index 805877ce5020..3e92fe251f28 100644
--- a/fs/jfs/jfs_logmgr.h
+++ b/fs/jfs/jfs_logmgr.h
@@ -400,6 +400,8 @@ struct jfs_log {
 	uuid_t uuid;		/* 16: 128-bit uuid of log device */
 
 	int no_integrity;	/* 3: flag to disable journaling to disk */
+	atomic_t io_inflight;
+	wait_queue_head_t io_waitq;
 };
 
 /*
-- 
2.26.2


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
