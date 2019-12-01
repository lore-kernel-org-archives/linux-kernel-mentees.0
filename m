Return-Path: <SRS0=yDVd=ZX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAFF5C432C0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Dec 2019 03:51:25 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF24A206DC
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Dec 2019 03:51:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FaXUxc/i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF24A206DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9084B87BC8;
	Sun,  1 Dec 2019 03:51:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Bf6YQYK8JvA; Sun,  1 Dec 2019 03:51:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D97D787BB8;
	Sun,  1 Dec 2019 03:51:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C07B0C1D74;
	Sun,  1 Dec 2019 03:51:21 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E94A4C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 03:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C4C932037E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 03:51:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hl-jColrgftp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 03:51:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by silver.osuosl.org (Postfix) with ESMTPS id C234A2000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 03:51:18 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id s18so2521022pfm.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 30 Nov 2019 19:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jxgA6dJnA/dGvMRrEelT9MYN+n9ka+vhMkWWG7BgB2M=;
 b=FaXUxc/ieqHGSyxG54PAJ2Nps9gjPrpA0ofS4jtugNSYRbBvJ3I3XutMBnhsUCI6Iw
 Vqjxja0IfCnhW1ZQairkzedaSQhySx0ML8uycnBl1Hf/IYCTPDFkxx0xyvad9Bp+HXlt
 iW1ElX+TIxM1lU3SE0ijXzKbJQkst9KZFJwpotBYNUd6HFO1wDo9q6Khal9ChsuyEgnK
 FIqI3DFEVis5IOmhK10+k5qjP0+ohsRuLre2WltR00n/NpX51E7qWDhvS2OXI3uLJ3B6
 HzRe3eQJgJcnRN+iS7+i5yQXK9QbXvRlZmliFGL//uqWn2jVfqCxLEhBHXIW4GX2liZJ
 mraw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jxgA6dJnA/dGvMRrEelT9MYN+n9ka+vhMkWWG7BgB2M=;
 b=sz7dUJ2a1Qy4OlOA2ik8jpbQFSx7aYMnSXKmJlazvrwFcNL390hxm1cjLeR2rZMFpd
 YLLu2QgO5taW5McwYWg8cEPz+si7E+QOvg5S6AUJSw0D9x1BgYPKKYmq5L5MYPKl9J/Y
 e3UCsC9AA7QjmDVZOiZd3cqp+8syHaxGebn2o2pa4LAdBBqjeDkGUP+gx6kAsx65wOE/
 DzrEj1jlrcPfWUcVGVFdsONi3vmXDjLKtO9+is0KzJr6QOAcPm1qCtAZ20FaFuIlnDUN
 /nuWE9TgqCZCVAPbSrOZT6nDS787Yxwy8tkNSlY7Y5D/S/exiF9HLPMNsEx+R6rIs+Uw
 VKAA==
X-Gm-Message-State: APjAAAXkS3jQFynm2TXhNPFB70XnDSWFTA4kzz9i57LDn6QU8G5WcpFD
 Yo9Up9Dp6WC7FSd8rAqlG9o=
X-Google-Smtp-Source: APXvYqyCNUMu2NoyX7GVHrnhdhm32U9ViQxb/MYUOONemByuBlp/v9EEuWquWNP9hRCR7JCJbGObQg==
X-Received: by 2002:a65:6209:: with SMTP id d9mr24775834pgv.22.1575172278134; 
 Sat, 30 Nov 2019 19:51:18 -0800 (PST)
Received: from debian.net.fpt ([2405:4800:58f7:32f8:99ed:5ecf:a28d:555e])
 by smtp.gmail.com with ESMTPSA id c12sm3208096pfo.92.2019.11.30.19.51.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2019 19:51:17 -0800 (PST)
From: Phong Tran <tranmanphong@gmail.com>
To: tytso@mit.edu, adilger.kernel@dilger.ca, paulmck@kernel.org,
 joel@joelfernandes.org
Date: Sun,  1 Dec 2019 10:51:07 +0700
Message-Id: <20191201035107.24355-1-tranmanphong@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: rcu@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] ext4: use rcu API in debug_print_tree
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

struct ext4_sb_info.system_blks was marked __rcu.
But access the pointer without using RCU lock and dereference.
Sparse warning with __rcu notation:

block_validity.c:139:29: warning: incorrect type in argument 1 (different address spaces)
block_validity.c:139:29:    expected struct rb_root const *
block_validity.c:139:29:    got struct rb_root [noderef] <asn:4> *

Signed-off-by: Phong Tran <tranmanphong@gmail.com>
---
 fs/ext4/block_validity.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/ext4/block_validity.c b/fs/ext4/block_validity.c
index d4d4fdfac1a6..1ee04e76bbe0 100644
--- a/fs/ext4/block_validity.c
+++ b/fs/ext4/block_validity.c
@@ -133,10 +133,13 @@ static void debug_print_tree(struct ext4_sb_info *sbi)
 {
 	struct rb_node *node;
 	struct ext4_system_zone *entry;
+	struct ext4_system_blocks *system_blks;
 	int first = 1;
 
 	printk(KERN_INFO "System zones: ");
-	node = rb_first(&sbi->system_blks->root);
+	rcu_read_lock();
+	system_blks = rcu_dereference(sbi->system_blks);
+	node = rb_first(&system_blks->root);
 	while (node) {
 		entry = rb_entry(node, struct ext4_system_zone, node);
 		printk(KERN_CONT "%s%llu-%llu", first ? "" : ", ",
@@ -144,6 +147,7 @@ static void debug_print_tree(struct ext4_sb_info *sbi)
 		first = 0;
 		node = rb_next(node);
 	}
+	rcu_read_unlock();
 	printk(KERN_CONT "\n");
 }
 
-- 
2.20.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
