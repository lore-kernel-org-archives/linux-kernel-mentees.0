Return-Path: <SRS0=TDrl=LX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DDEEC11F6A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Jun 2021 14:49:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2858B61DD4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Jun 2021 14:49:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2858B61DD4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F3A68400C4;
	Tue, 29 Jun 2021 14:49:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OwO_rMwyTygD; Tue, 29 Jun 2021 14:49:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 1D2BA40169;
	Tue, 29 Jun 2021 14:49:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EC85DC0010;
	Tue, 29 Jun 2021 14:49:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E50ABC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 14:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7B2A8361C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 14:49:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ePtiXqonpMg3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 14:49:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C333836EA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 14:49:11 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id u190so18722818pgd.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 07:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sgedI6+6qKlLTRATOo8xiBdzNyb6QgjMf9+CiWSlKJg=;
 b=MrFm2QVZyIhOXx5Nl3OtAQV0OVWh5YFA/aNRmurlT+tEMLsAdfPgmix1dFQO5gkVlj
 SAMovFD1tS0GuqGaKMElv5SQmcgSYdKY7ZcrANkl4e+4ceVNe2/NcIz5JZSUwsYxRaNZ
 jqOt3GPtOv0IGOgn5PQ+m5ipHQATdEFYwzgHBuJZ+yfMWIoV7QFPGFda2t8A8+dbJUCs
 5IdRgpo2W2/VMNoiv3QExRd31uwZ64hFKQTiNvlSATStFt8E/U/FqfT001RhGC3C9T5z
 3kqDB0MOoOieFkDiayEJZliKHp6LFBdFv5gyrQIix79FDL8MefMDcYhGMXgyBVyNeyXp
 KR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sgedI6+6qKlLTRATOo8xiBdzNyb6QgjMf9+CiWSlKJg=;
 b=G0rQ0ReTEQYZfYOWWCFpQKgmeKgcnT62rcn6qD3D/FegOKz5GzI7WvYcb0C1474pZF
 K+ciOxIGdcweaVFPpHHQDnZAL7iQlSoh/VwnyOdzXEOFx47MURkLKEqrVEdzQlFQ9GGU
 RYmFfsx5Kl7LqScAqFVX7EgcMbYO7Y0XXovA2io4vyVluf9UOc/uqIx/bXtB/emVaTcF
 NOCR5o/2EZbE7TGwsRRApKcljhx11JyJqNnFDPhJU6uIrprtyMCpWY7lNoDc7j4j1gOA
 PTf4p4qIpZSkk5E3s5mrKbEE1BjYaoiknXdNpFjAa9QTvmuTDW7i7DdvJqPP0fgj6pDd
 4wnQ==
X-Gm-Message-State: AOAM531lDEjCrdaDJJy8Uf52SunUYPQWZ890VGtbJOSVDpcPS54V4KHq
 qRzDKnxfQwQhdstrdMwBpJ8=
X-Google-Smtp-Source: ABdhPJy6/Mf+TY9SUQHW36mJKwtu1pw9KHDcq/inYizQaE1PUDI16xDfzeYl9jbuRSqnKU00XaEzIQ==
X-Received: by 2002:a63:b54:: with SMTP id a20mr29013565pgl.407.1624978151551; 
 Tue, 29 Jun 2021 07:49:11 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id i2sm3417262pjj.25.2021.06.29.07.49.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 07:49:11 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: gustavoars@kernel.org,
	viro@zeniv.linux.org.uk
Subject: [PATCH 3/3] hfs: add lock nesting notation to hfs_find_init
Date: Tue, 29 Jun 2021 22:48:03 +0800
Message-Id: <20210629144803.62541-4-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629144803.62541-1-desmondcheongzx@gmail.com>
References: <20210629144803.62541-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 syzbot+b718ec84a87b7e73ade4@syzkaller.appspotmail.com,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
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

Syzbot reports a possible recursive lock:
https://syzkaller.appspot.com/bug?id=f007ef1d7a31a469e3be7aeb0fde0769b18585db

This happens due to missing lock nesting information. From the logs,
we see that a call to hfs_fill_super is made to mount the hfs
filesystem. While searching for the root inode, the lock on the
catalog btree is grabbed. Then, when the parent of the root isn't
found, a call to __hfs_bnode_create is made to create the parent of
the root. This eventually leads to a call to hfs_ext_read_extent which
grabs a lock on the extents btree.

Since the order of locking is catalog btree -> extents btree, this
lock hierarchy does not lead to a deadlock.

To tell lockdep that this locking is safe, we add nesting notation to
distinguish between catalog btrees, extents btrees, and attributes
btrees (for HFS+). This has already been done in hfsplus.

Reported-and-tested-by: syzbot+b718ec84a87b7e73ade4@syzkaller.appspotmail.com
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 fs/hfs/bfind.c | 14 +++++++++++++-
 fs/hfs/btree.h |  7 +++++++
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/fs/hfs/bfind.c b/fs/hfs/bfind.c
index 4af318fbda77..ef9498a6e88a 100644
--- a/fs/hfs/bfind.c
+++ b/fs/hfs/bfind.c
@@ -25,7 +25,19 @@ int hfs_find_init(struct hfs_btree *tree, struct hfs_find_data *fd)
 	fd->key = ptr + tree->max_key_len + 2;
 	hfs_dbg(BNODE_REFS, "find_init: %d (%p)\n",
 		tree->cnid, __builtin_return_address(0));
-	mutex_lock(&tree->tree_lock);
+	switch (tree->cnid) {
+	case HFS_CAT_CNID:
+		mutex_lock_nested(&tree->tree_lock, CATALOG_BTREE_MUTEX);
+		break;
+	case HFS_EXT_CNID:
+		mutex_lock_nested(&tree->tree_lock, EXTENTS_BTREE_MUTEX);
+		break;
+	case HFS_ATTR_CNID:
+		mutex_lock_nested(&tree->tree_lock, ATTR_BTREE_MUTEX);
+		break;
+	default:
+		return -EINVAL;
+	}
 	return 0;
 }
 
diff --git a/fs/hfs/btree.h b/fs/hfs/btree.h
index 4ba45caf5939..0e6baee93245 100644
--- a/fs/hfs/btree.h
+++ b/fs/hfs/btree.h
@@ -13,6 +13,13 @@ typedef int (*btree_keycmp)(const btree_key *, const btree_key *);
 
 #define NODE_HASH_SIZE  256
 
+/* B-tree mutex nested subclasses */
+enum hfs_btree_mutex_classes {
+	CATALOG_BTREE_MUTEX,
+	EXTENTS_BTREE_MUTEX,
+	ATTR_BTREE_MUTEX,
+};
+
 /* A HFS BTree held in memory */
 struct hfs_btree {
 	struct super_block *sb;
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
