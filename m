Return-Path: <SRS0=HmkY=2D=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68723C43603
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Dec 2019 21:36:43 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C6B7206C3
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Dec 2019 21:36:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I/5OorDH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C6B7206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 59FB020406;
	Fri, 13 Dec 2019 15:39:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X4LfKUA1X5s5; Fri, 13 Dec 2019 15:39:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id ACDCA203D2;
	Fri, 13 Dec 2019 15:39:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A05CEC1D7C;
	Fri, 13 Dec 2019 15:39:21 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CF536C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Dec 2019 15:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id CB2BD88345
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Dec 2019 15:39:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dCtb1BqlXMbI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Dec 2019 15:39:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 367AE8770C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Dec 2019 15:39:19 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id y14so1640988pfm.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Dec 2019 07:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5ksn7G5VYv/ryn3yV+sG6Khj5HN3a4JJFcRA1aIqGsc=;
 b=I/5OorDH2s57/ZmXBDm471m9YhattiMARcBWnB/M6vftRZMqyPT4Kyyv3io9GLgGvp
 Gt7XbTaOAzz1RYcbmUNOM3zCC9ooituahSFyhHzi7b8MhflLEB/3fd2UwjWOmU9kJkNL
 U2OGel49zhdPhvxA8TJtddbkaKp4kWLuzfGgyB67ItijYpcLfdqp/+J9HAZDLgwmuM7p
 icduXRqKhRVcF7a/Fmdaefj59VkFCooxn+T+r3oDYwNRXv0lWRCRLrApmjfQt8xu/F79
 /zbEmQzSppK6GjndgnkY5w7Bpvp+ZbryywIFQqUBtVLNdsdwXpoRSojzPXJXavLOzcf8
 sGYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5ksn7G5VYv/ryn3yV+sG6Khj5HN3a4JJFcRA1aIqGsc=;
 b=CQl31hj/cfk1L6DH/Cmw+Rl6yW6byiGeEgY3VlXzVEc++eqd0ft7pbgoQoc8g4hX2/
 B+YDAeUN/sGuohkkBZ0iKY1Bja25IRlmYwsh4WRh14gbfvUwxuiyaQSw1x35hK/H06kQ
 tQ0eSCzSmz6GnDk1ycNOZQu9NNXFjdD8miW66uZpzCwPXpKIKOUyg+24ngSPLv6gzY1F
 MNHY59ZSi3SrxGMiGX3xuEeyVBAydO8iA9AAXSkOYnkC9nZgf5DE8jo2sCEWeSK0sXiK
 0/Xd49h+7H6/ixE0/kBIGNOEyP5c8TFpdA+LUPl8gokECI/aLXs1opK4FELf7lKBOPRb
 y0tw==
X-Gm-Message-State: APjAAAUj1EPn5Nf6Lla3IhPQshW6gb5O8kSQCCLl22s9Fk958Mj3RKgt
 ZAuO+RLFvKiN+hWLRmDOTRw=
X-Google-Smtp-Source: APXvYqwZKvWM4KVEbblUTPfNgKLvrVa397PSCGZfDG1xfH/41foIwCmL2nz/b/MSXUWemPgipOI8rw==
X-Received: by 2002:a65:66da:: with SMTP id c26mr45888pgw.354.1576251558676;
 Fri, 13 Dec 2019 07:39:18 -0800 (PST)
Received: from debian.net.fpt ([2405:4800:58f7:48ef:2a83:3099:c3ff:3682])
 by smtp.gmail.com with ESMTPSA id 100sm10702350pjo.17.2019.12.13.07.39.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 07:39:17 -0800 (PST)
From: Phong Tran <tranmanphong@gmail.com>
To: jack@suse.cz,
	tytso@mit.edu,
	adilger.kernel@dilger.ca
Date: Fri, 13 Dec 2019 22:33:07 +0700
Message-Id: <20191213153306.30744-1-tranmanphong@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191213113510.GG15474@quack2.suse.cz>
References: <20191213113510.GG15474@quack2.suse.cz>
MIME-Version: 1.0
Cc: paulmck@kernel.org, linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
 joel@joelfernandes.org, linux-ext4@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH V2] ext4: use rcu API in
	debug_print_tree
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

Reviewed-by: Jan Kara <jack@suse.cz>
Signed-off-by: Phong Tran <tranmanphong@gmail.com>
---
 fs/ext4/block_validity.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

---
change log:
V2: Add Reviewed-by: Jan Kara <jack@suse.cz>

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
