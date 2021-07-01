Return-Path: <SRS0=5SPK=LZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81965C11F64
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Jul 2021 03:08:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42BE36108C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Jul 2021 03:08:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42BE36108C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C28C607B8;
	Thu,  1 Jul 2021 03:08:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L8m7AORPgjaW; Thu,  1 Jul 2021 03:08:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1F8236072D;
	Thu,  1 Jul 2021 03:08:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0BF55C0010;
	Thu,  1 Jul 2021 03:08:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5D4A5C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Jul 2021 03:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4AF50404A9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Jul 2021 03:08:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QLVMnluAiJgr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Jul 2021 03:08:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D7B9404A4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Jul 2021 03:08:55 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id o18so4183451pgu.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Jun 2021 20:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LPhAq6c+h5ijWlJnLIAaDpeTI322IxRs/Oy2An/y/kA=;
 b=uFOwINFwmNxyQBzS/7gh0nM9K64OpKP5FgbjsHQDJclbfMM+0OgSCH5OMmz7lo3qXP
 8y3VYlTiN+AtdkPnKfrvWezVM3wtcsIH59VSm+FGu6M5U+KyJ2Az0LHMMvG4kAAHNF8e
 LCkdqO9ZcaWrxT7uDPo+4Qe6QBWPHkwEKT2l0dnPip7ZeDtiu7Qbw/evAR+hFMvaTrCP
 ptokm5Rs6rhKrRvSLhDfYJ2xY6g6SyB/HNpZQctUf6Wp1rn6Q2dlUvqTvB/7k1bsG+j8
 2fvSteepFc7xbJ35+y8Fp3md+aVQhJPq8dnuZqt2LYNNkg6VRMC+/BCBcuSWUhJEOJyr
 RcZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LPhAq6c+h5ijWlJnLIAaDpeTI322IxRs/Oy2An/y/kA=;
 b=nOMJZeCdorRftsHpza9bqqUfcsXa18QKZ74uzpmz8nvQ6pVJoz21RZ/UrON54NCdSo
 HYM+koJ3Q4MLwBzQuerSQg/UhVKRWvnUtiFGrmEKvJAdVYWqMRlgd9lvvHAMDUeOV/xT
 P33n9XXfOR4O1E5qtk3A6hgjVFz+KiuhusV2TnclXilyRWOFg8eOVYJ9mYCtAhMAr0Bg
 O/JcmygYn0A5P2vnCnpLDVln+CfR/623L+nfyWo9lG5Rn7btTs1Xxb140wjXhF0ZcWhh
 KF+RUs47NJYnPqtIp+K6XsnAXqC3BotbNmqUh14iD/dwY2vm9oUzVvWHM/UgmordQbMf
 eFNw==
X-Gm-Message-State: AOAM531EUNWIf+oO65nKNXuCGm9hAXrzDGWf8gb6SkOctl1gexsPfbq/
 iVSKGyjBpjpV+nQX3fwajxw=
X-Google-Smtp-Source: ABdhPJy4CJN5Z5COPTfLLuJMK0Ixaxb/eqC1GAcsIFCvO9wp/P29XH0swMMi+appF545pq08P0ROYw==
X-Received: by 2002:a63:ba06:: with SMTP id k6mr3248290pgf.220.1625108934625; 
 Wed, 30 Jun 2021 20:08:54 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id g10sm4568568pjv.46.2021.06.30.20.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 20:08:54 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: gustavoars@kernel.org,
	viro@zeniv.linux.org.uk
Subject: [PATCH v2 2/3] hfs: fix high memory mapping in hfs_bnode_read
Date: Thu,  1 Jul 2021 11:07:55 +0800
Message-Id: <20210701030756.58760-3-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210701030756.58760-1-desmondcheongzx@gmail.com>
References: <20210701030756.58760-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, slava@dubeyko.com,
 linux-fsdevel@vger.kernel.org,
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

Pages that we read in hfs_bnode_read need to be kmapped into kernel
address space. However, currently only the 0th page is kmapped. If the
given offset + length exceeds this 0th page, then we have an invalid
memory access.

To fix this, we kmap relevant pages one by one and copy their relevant
portions of data.

An example of invalid memory access occurring without this fix can be
seen in the following crash report:

==================================================================
BUG: KASAN: use-after-free in memcpy include/linux/fortify-string.h:191 [inline]
BUG: KASAN: use-after-free in hfs_bnode_read+0xc4/0xe0 fs/hfs/bnode.c:26
Read of size 2 at addr ffff888125fdcffe by task syz-executor5/4634

CPU: 0 PID: 4634 Comm: syz-executor5 Not tainted 5.13.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:79 [inline]
 dump_stack+0x195/0x1f8 lib/dump_stack.c:120
 print_address_description.constprop.0+0x1d/0x110 mm/kasan/report.c:233
 __kasan_report mm/kasan/report.c:419 [inline]
 kasan_report.cold+0x7b/0xd4 mm/kasan/report.c:436
 check_region_inline mm/kasan/generic.c:180 [inline]
 kasan_check_range+0x154/0x1b0 mm/kasan/generic.c:186
 memcpy+0x24/0x60 mm/kasan/shadow.c:65
 memcpy include/linux/fortify-string.h:191 [inline]
 hfs_bnode_read+0xc4/0xe0 fs/hfs/bnode.c:26
 hfs_bnode_read_u16 fs/hfs/bnode.c:34 [inline]
 hfs_bnode_find+0x880/0xcc0 fs/hfs/bnode.c:365
 hfs_brec_find+0x2d8/0x540 fs/hfs/bfind.c:126
 hfs_brec_read+0x27/0x120 fs/hfs/bfind.c:165
 hfs_cat_find_brec+0x19a/0x3b0 fs/hfs/catalog.c:194
 hfs_fill_super+0xc13/0x1460 fs/hfs/super.c:419
 mount_bdev+0x331/0x3f0 fs/super.c:1368
 hfs_mount+0x35/0x40 fs/hfs/super.c:457
 legacy_get_tree+0x10c/0x220 fs/fs_context.c:592
 vfs_get_tree+0x93/0x300 fs/super.c:1498
 do_new_mount fs/namespace.c:2905 [inline]
 path_mount+0x13f5/0x20e0 fs/namespace.c:3235
 do_mount fs/namespace.c:3248 [inline]
 __do_sys_mount fs/namespace.c:3456 [inline]
 __se_sys_mount fs/namespace.c:3433 [inline]
 __x64_sys_mount+0x2b8/0x340 fs/namespace.c:3433
 do_syscall_64+0x37/0xc0 arch/x86/entry/common.c:47
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x45e63a
Code: 48 c7 c2 bc ff ff ff f7 d8 64 89 02 b8 ff ff ff ff eb d2 e8 88 04 00 00 0f 1f 84 00 00 00 00 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 bc ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f9404d410d8 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 0000000020000248 RCX: 000000000045e63a
RDX: 0000000020000000 RSI: 0000000020000100 RDI: 00007f9404d41120
RBP: 00007f9404d41120 R08: 00000000200002c0 R09: 0000000020000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000003
R13: 0000000000000003 R14: 00000000004ad5d8 R15: 0000000000000000

The buggy address belongs to the page:
page:00000000dadbcf3e refcount:0 mapcount:0 mapping:0000000000000000 index:0x1 pfn:0x125fdc
flags: 0x2fffc0000000000(node=0|zone=2|lastcpupid=0x3fff)
raw: 02fffc0000000000 ffffea000497f748 ffffea000497f6c8 0000000000000000
raw: 0000000000000001 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff888125fdce80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffff888125fdcf00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>ffff888125fdcf80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
                                                                ^
 ffff888125fdd000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffff888125fdd080: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
==================================================================

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 fs/hfs/bnode.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/fs/hfs/bnode.c b/fs/hfs/bnode.c
index b63a4df7327b..c0a73a6ffb28 100644
--- a/fs/hfs/bnode.c
+++ b/fs/hfs/bnode.c
@@ -15,16 +15,31 @@
 
 #include "btree.h"
 
-void hfs_bnode_read(struct hfs_bnode *node, void *buf,
-		int off, int len)
+void hfs_bnode_read(struct hfs_bnode *node, void *buf, int off, int len)
 {
 	struct page *page;
+	int pagenum;
+	int bytes_read;
+	int bytes_to_read;
+	void *vaddr;
 
 	off += node->page_offset;
-	page = node->page[0];
+	pagenum = off >> PAGE_SHIFT;
+	off &= ~PAGE_MASK; /* compute page offset for the first page */
 
-	memcpy(buf, kmap(page) + off, len);
-	kunmap(page);
+	for (bytes_read = 0; bytes_read < len; bytes_read += bytes_to_read) {
+		if (pagenum >= node->tree->pages_per_bnode)
+			break;
+		page = node->page[pagenum];
+		bytes_to_read = min_t(int, len - bytes_read, PAGE_SIZE - off);
+
+		vaddr = kmap_atomic(page);
+		memcpy(buf + bytes_read, vaddr + off, bytes_to_read);
+		kunmap_atomic(vaddr);
+
+		pagenum++;
+		off = 0; /* page offset only applies to the first page */
+	}
 }
 
 u16 hfs_bnode_read_u16(struct hfs_bnode *node, int off)
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
