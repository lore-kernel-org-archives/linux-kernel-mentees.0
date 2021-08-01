Return-Path: <SRS0=qNgb=MY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84A2BC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Aug 2021 23:09:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19A7360F70
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Aug 2021 23:09:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 19A7360F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB85A83CED;
	Sun,  1 Aug 2021 23:09:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t4nfTe6Nyth3; Sun,  1 Aug 2021 23:09:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DE0D383CD3;
	Sun,  1 Aug 2021 23:09:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BD156C001B;
	Sun,  1 Aug 2021 23:09:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 33A27C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Aug 2021 23:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3068C404C9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Aug 2021 23:09:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XXFfk-Ly5Y_k
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Aug 2021 23:09:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 591E8404C3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Aug 2021 23:09:02 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id go31so27781837ejc.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 01 Aug 2021 16:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r5yn5j7B+x1A085dBHc3N5l5217i15Q/vQad1rzyI0o=;
 b=XgIeEvO5aDyuvE4vU5MgBQQ18lIqNLkYhb/bwaqFmzNTDQb63UrvRIEzxoyiIeK8h9
 Z3gxZoB21lRp2Bs0Mth0Z8YWe4NaTfkKCxOjgNI+pP9ypHdaiIq9X8pmerl+Bky3hC+4
 0uDIZQTVtu9+t//W3ifkHJWOflTpzFhMGSstI3tgQfQDNMk2RBGyXjvtXgytJirxXiG7
 f6+IZHLNPSNgIHqexsZcGNedMs2pfCYTToz5mgGKmNd31NglcIEFycTmm56+wowX++ou
 lWaX6USqKpv1+K6/ONSzodQ1ljXYqn6VS5jNKbC56LegtxSQ4Cknb/tVuH4dColFNFj2
 9Tjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r5yn5j7B+x1A085dBHc3N5l5217i15Q/vQad1rzyI0o=;
 b=fQ8KWOS6fDrdZIqmMkBLNqqTM80mrVO3SxBpQAdHXebj13coYaqIs3s/LkXWVaTPQ4
 wi/laDh+Ciwon+hSMHo1HhG7UDcZAeE2kYK66uhiqjbRdEP8XJlp/5tmGdtHXT7Cc4V5
 5Zsxn6Mae3EE14eqTAtwsPttoa1Uvx9X27f6M5lLpWrXFizzSYQOqKyR8s1rdE06hJ3E
 n83NzGhnyy94mws6gKtedQxNQanZBkyYeQTWIKHt65Uv9pEfw51Z8UsIfPmcdIHlM0Ez
 NecYDxr4G2SdfDB0eFPq52tlKhx/HhJQudF64ax1vaZ+/61baWuP+964xeIqaGjqV5Qp
 hRow==
X-Gm-Message-State: AOAM533yC5hCtOfRMZsV/bNdzNL2v8+ZTXIVMdpwylyxgRTqo4X2E+7T
 wDHWJF83gBkyMcYfHHEl/UU=
X-Google-Smtp-Source: ABdhPJzH1wj4P0j9U+ZvVP9ZaXr3I/o4I38UCCoTwC6mbOncnhxrwJ2L5yhzKuwjJDcjCdzf1pWjGw==
X-Received: by 2002:a17:906:4ad9:: with SMTP id
 u25mr12810172ejt.106.1627859340528; 
 Sun, 01 Aug 2021 16:09:00 -0700 (PDT)
Received: from localhost.localdomain ([85.154.106.253])
 by smtp.gmail.com with ESMTPSA id t7sm3638932edw.65.2021.08.01.16.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 16:09:00 -0700 (PDT)
From: Rahul Balaji <rahulbalaji78@gmail.com>
To: lukas.bulwahn@gmail.com
Subject: [PATCH 2/2] Task 2: checkpath.pl documentation mentorship: remove
 semicolon warnings.
Date: Mon,  2 Aug 2021 03:08:17 +0400
Message-Id: <20210801230817.19963-1-rahulbalaji78@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
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

i changed the lines such that they no longer evoke the (ONE_SEMICOLON) warning
where possible.

there were 7 files with true positive violation.

drivers/mtd/ubi/block.c:408: WARNING:ONE_SEMICOLON: Statements
terminations use 1 semicolon

drivers/gpu/drm/nouveau/nouveau_gem.c:342: WARNING:ONE_SEMICOLON:
Statements terminations use 1 semicolon

fs/block_dev.c:1269: WARNING:ONE_SEMICOLON: Statements terminations
use 1 semicolon

(for fs/block_dev.c, the error was actually on line 1271 for me, not on 1269)

include/trace/events/iocost.h:163: WARNING:ONE_SEMICOLON: Statements
terminations use 1 semicolon

net/sched/cls_rsvp.h:231: WARNING:ONE_SEMICOLON: Statements
terminations use 1 semicolon

net/sched/cls_u32.c:782: WARNING:ONE_SEMICOLON: Statements
terminations use 1 semicolon

drivers/net/ethernet/mediatek/mtk_star_emac.c:1089:
WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon

the rest of the files given below i think are false positives, as they repeatedly use ";;" in their code.
so i guess it is necessary in their case.

arch/ia64/include/asm/mca_asm.h:139: WARNING:ONE_SEMICOLON: Statements
terminations use 1 semicolon

arch/ia64/include/asm/mca_asm.h:213: WARNING:ONE_SEMICOLON: Statements
terminations use 1 semicolon

arch/ia64/include/asm/native/inst.h:79: WARNING:ONE_SEMICOLON:
Statements terminations use 1 semicolon

arch/ia64/kernel/minstate.h:14: WARNING:ONE_SEMICOLON: Statements
terminations use 1 semicolon

arch/ia64/kernel/minstate.h:151: WARNING:ONE_SEMICOLON: Statements
terminations use 1 semicolon

arch/ia64/kernel/minstate.h:213: WARNING:ONE_SEMICOLON: Statements
terminations use 1 semicolon
---
 drivers/gpu/drm/nouveau/nouveau_gem.c         | 2 +-
 drivers/net/ethernet/mediatek/mtk_star_emac.c | 2 +-
 fs/block_dev.c                                | 2 +-
 include/trace/events/iocost.h                 | 2 +-
 net/sched/cls_rsvp.h                          | 2 +-
 net/sched/cls_u32.c                           | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 5b27845075a1..d476940ee97c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -339,7 +339,7 @@ nouveau_gem_set_domain(struct drm_gem_object *gem, uint32_t read_domains,
 	struct ttm_buffer_object *bo = &nvbo->bo;
 	uint32_t domains = valid_domains & nvbo->valid_domains &
 		(write_domains ? write_domains : read_domains);
-	uint32_t pref_domains = 0;;
+	uint32_t pref_domains = 0;
 
 	if (!domains)
 		return -EINVAL;
diff --git a/drivers/net/ethernet/mediatek/mtk_star_emac.c b/drivers/net/ethernet/mediatek/mtk_star_emac.c
index 96d2891f1675..0a445dde67ae 100644
--- a/drivers/net/ethernet/mediatek/mtk_star_emac.c
+++ b/drivers/net/ethernet/mediatek/mtk_star_emac.c
@@ -1086,7 +1086,7 @@ static void mtk_star_tx_complete_all(struct mtk_star_priv *priv)
 
 	spin_lock(&priv->lock);
 
-	for (pkts_compl = 0, bytes_compl = 0;;
+	for (pkts_compl = 0, bytes_compl = 0;
 	     pkts_compl++, bytes_compl += ret, wake = true) {
 		if (!mtk_star_ring_descs_available(ring))
 			break;
diff --git a/fs/block_dev.c b/fs/block_dev.c
index 9ef4f1fc2cb0..61b938fa5d5b 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -1268,7 +1268,7 @@ static int blkdev_get_whole(struct block_device *bdev, fmode_t mode)
 	if (test_bit(GD_NEED_PART_SCAN, &disk->state))
 		bdev_disk_changed(disk, false);
 	bdev->bd_openers++;
-	return 0;;
+	return 0;
 }
 
 static void blkdev_put_whole(struct block_device *bdev, fmode_t mode)
diff --git a/include/trace/events/iocost.h b/include/trace/events/iocost.h
index e282ce02fa2d..6d1626e7a4ce 100644
--- a/include/trace/events/iocost.h
+++ b/include/trace/events/iocost.h
@@ -160,7 +160,7 @@ TRACE_EVENT(iocost_ioc_vrate_adj,
 
 	TP_fast_assign(
 		__assign_str(devname, ioc_name(ioc));
-		__entry->old_vrate = atomic64_read(&ioc->vtime_rate);;
+		__entry->old_vrate = atomic64_read(&ioc->vtime_rate);
 		__entry->new_vrate = new_vrate;
 		__entry->busy_level = ioc->busy_level;
 		__entry->read_missed_ppm = missed_ppm[READ];
diff --git a/net/sched/cls_rsvp.h b/net/sched/cls_rsvp.h
index 27a4b6dbcf57..b7929dfcca1f 100644
--- a/net/sched/cls_rsvp.h
+++ b/net/sched/cls_rsvp.h
@@ -228,7 +228,7 @@ static void rsvp_replace(struct tcf_proto *tp, struct rsvp_filter *n, u32 h)
 
 	for (s = rtnl_dereference(head->ht[h1]); s;
 	     s = rtnl_dereference(s->next)) {
-		for (ins = &s->ht[h2], pins = rtnl_dereference(*ins); ;
+		for (ins = &s->ht[h2], pins = rtnl_dereference(*ins);
 		     ins = &pins->next, pins = rtnl_dereference(*ins)) {
 			if (pins->handle == h) {
 				RCU_INIT_POINTER(n->next, pins->next);
diff --git a/net/sched/cls_u32.c b/net/sched/cls_u32.c
index 6e1abe805448..290359f6ce6f 100644
--- a/net/sched/cls_u32.c
+++ b/net/sched/cls_u32.c
@@ -779,7 +779,7 @@ static void u32_replace_knode(struct tcf_proto *tp, struct tc_u_common *tp_c,
 	/* The node must always exist for it to be replaced if this is not the
 	 * case then something went very wrong elsewhere.
 	 */
-	for (pins = rtnl_dereference(*ins); ;
+	for (pins = rtnl_dereference(*ins);
 	     ins = &pins->next, pins = rtnl_dereference(*ins))
 		if (pins->handle == n->handle)
 			break;
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
