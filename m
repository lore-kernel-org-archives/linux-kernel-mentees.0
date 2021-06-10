Return-Path: <SRS0=bMK4=LE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 842E7C47094
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 10 Jun 2021 15:47:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 235CD60FE5
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 10 Jun 2021 15:47:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 235CD60FE5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=anirudhrb.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E460940375;
	Thu, 10 Jun 2021 15:47:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kluh3LFvHiqm; Thu, 10 Jun 2021 15:47:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 19E2D4010B;
	Thu, 10 Jun 2021 15:47:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EDDB8C000D;
	Thu, 10 Jun 2021 15:47:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9F488C000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Jun 2021 15:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 785D240192
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Jun 2021 15:47:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JfQuIb9zSKJL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Jun 2021 15:46:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sender4-of-o53.zoho.com (sender4-of-o53.zoho.com
 [136.143.188.53])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A28A04010B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Jun 2021 15:46:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1623340003; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=IgiM8ISSZ2YS3LSKUXVHNJy2D3C95YmSRs/hUUExlQlCZ3YgbvMadbx8rdZOy8F/lSGuuiBMUSUsQY1YQxkZ4xRFVYuLJ3lEmBbbj2SyetL5sRwTBiRUEjGEm6WUFGi3GDOBqSPmROkUYVzMJC0rsTG2kY707Hwc6WOIcaRMghw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1623340003;
 h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
 bh=S+/94991o1BPiFbH+TJfvpYPY1OSzgLbNS+l1MvqNzI=; 
 b=Ww8JMb1QorZGUx09/ZIyGOfUg3SZaocOv2pduUgiUgVOzKK3VnjSVEHnYZZyE8fJmqMgLowttcanDnZcZ/OqKe5XWWK3NZB+a3c2/7+kAtu7KI8rxq5PTOI7AXO777RsNmdSjEUfivpVd6hYpeBmAbrTUYNrd43+z34b6ZUkCBc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=anirudhrb.com;
 spf=pass  smtp.mailfrom=mail@anirudhrb.com;
 dmarc=pass header.from=<mail@anirudhrb.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1623340003; 
 s=zoho; d=anirudhrb.com; i=mail@anirudhrb.com;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;
 bh=S+/94991o1BPiFbH+TJfvpYPY1OSzgLbNS+l1MvqNzI=;
 b=Xr3UP7ZyBerFxIEDqYZZEI+9VSghy5xl/t/OV5XYMhNv9JbVJ7heqHNH4rMBdi4n
 I9V2MYndPwLfMG3r2wFncp541UDZ2XKw1YXbKYolQGFkmL53LuBfRCKehqTrceUTR1c
 JkFoETmS7djuvuYv5Vqkdz5hBxfqc/HhMTP7ROGg=
Received: from localhost.localdomain (106.51.105.43 [106.51.105.43]) by
 mx.zohomail.com with SMTPS id 1623340000838986.2840483348111;
 Thu, 10 Jun 2021 08:46:40 -0700 (PDT)
From: Anirudh Rayabharam <mail@anirudhrb.com>
To: "Theodore Ts'o" <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Dave Kleikamp <shaggy@austin.ibm.com>, Alex Tomas <alex@clusterfs.com>,
 Andrew Morton <akpm@osdl.org>
Subject: [PATCH v2 resend] ext4: fix kernel infoleak via ext4_extent_header
Date: Thu, 10 Jun 2021 21:16:24 +0530
Message-Id: <20210610154625.6827-1-mail@anirudhrb.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-ZohoMailClient: External
Cc: linux-kernel@vger.kernel.org,
 syzbot+2dcfeaf8cb49b05e8f1a@syzkaller.appspotmail.com,
 linux-ext4@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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

Initialize eh_generation of struct ext4_extent_header to prevent leaking
info to userspace. Fixes KMSAN kernel-infoleak bug reported by syzbot at:
http://syzkaller.appspot.com/bug?id=78e9ad0e6952a3ca16e8234724b2fa92d041b9b8

Reported-by: syzbot+2dcfeaf8cb49b05e8f1a@syzkaller.appspotmail.com
Fixes: a86c61812637 ("[PATCH] ext3: add extent map support")
Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>
---

Changes in v2:
Added a "Fixes:" tag.

v1: https://lore.kernel.org/lkml/20210505133011.32484-1-mail@anirudhrb.com/

---
 fs/ext4/extents.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/ext4/extents.c b/fs/ext4/extents.c
index 77c84d6f1af6..677d4821bcc1 100644
--- a/fs/ext4/extents.c
+++ b/fs/ext4/extents.c
@@ -825,6 +825,7 @@ void ext4_ext_tree_init(handle_t *handle, struct inode *inode)
 	eh->eh_entries = 0;
 	eh->eh_magic = EXT4_EXT_MAGIC;
 	eh->eh_max = cpu_to_le16(ext4_ext_space_root(inode, 0));
+	eh->eh_generation = 0;
 	ext4_mark_inode_dirty(handle, inode);
 }
 
@@ -1090,6 +1091,7 @@ static int ext4_ext_split(handle_t *handle, struct inode *inode,
 	neh->eh_max = cpu_to_le16(ext4_ext_space_block(inode, 0));
 	neh->eh_magic = EXT4_EXT_MAGIC;
 	neh->eh_depth = 0;
+	neh->eh_generation = 0;
 
 	/* move remainder of path[depth] to the new leaf */
 	if (unlikely(path[depth].p_hdr->eh_entries !=
@@ -1167,6 +1169,7 @@ static int ext4_ext_split(handle_t *handle, struct inode *inode,
 		neh->eh_magic = EXT4_EXT_MAGIC;
 		neh->eh_max = cpu_to_le16(ext4_ext_space_block_idx(inode, 0));
 		neh->eh_depth = cpu_to_le16(depth - i);
+		neh->eh_generation = 0;
 		fidx = EXT_FIRST_INDEX(neh);
 		fidx->ei_block = border;
 		ext4_idx_store_pblock(fidx, oldblock);
-- 
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
