Return-Path: <SRS0=TDrl=LX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B57C11F67
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Jun 2021 14:49:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1412061DC2
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Jun 2021 14:49:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1412061DC2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1AA083760;
	Tue, 29 Jun 2021 14:49:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BOXWv4FQ1o6a; Tue, 29 Jun 2021 14:49:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id EE9D2836EA;
	Tue, 29 Jun 2021 14:49:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CB2CBC0010;
	Tue, 29 Jun 2021 14:49:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E8BA1C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 14:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBADD605F4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 14:49:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9TMB8RwW6V7R
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 14:49:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1CE6F605E6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 14:49:07 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id q192so17376834pfc.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 07:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=raTvzxH6lkQnnxr7LDSctOf0WWFvkKKzYtUzyRju/2Q=;
 b=qokE6m7mDCsTKsB7bvqoOYBd0sCH+I5nzXuMD/srHHx2hxT80KNvg0nVIaWauA9i8l
 PAh+29mV2kvfK2mWGUAPzJrjow++VC5A5uA/6j0j2TYdoEk+nlrnEq1nDyBHO+vy5I8k
 fW5EOrciGSIzNyjDtpLoI4kBKXdh9fYGtms30haIGC0GaktyiSqKkbRQ2Y+Snxs6p+hZ
 NYZZSuhC/vtFOCHu1y4ybHen55pdj+lTRmqqMez8vAvUVtuJ0GTylxquZoURq5UWIAmG
 iJRtXSJtYEtqUIb4gk/PmEzcOsUyTu9w1X1YE2B0lJ0fgSy94MTs0X21rRvMHtYFlI4B
 XVIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=raTvzxH6lkQnnxr7LDSctOf0WWFvkKKzYtUzyRju/2Q=;
 b=nuSZS2F0zYZOvkds02cUXQKltqWJTeaPC8NCmrwjv7XvTQeaCEcltzxKLiguQWfMaE
 HHoLEjE+4LAVKK6KDIFcN0xyOU3nCVNyc+kKieskviK3EVw3QnXJfcAJ1ZzWznTnRhnN
 b/Lke2kYQk1ymsw+K4xITDpsl75qdijl+s8tG3cxa3Y37MNhKzPlqWpJ/foa1tP1pxcN
 KMdVKr0DByEdwnr53bEURbGLWINEUdK2nNmUEp8A+0eBNSQTXwSMqz5cvfuSJGhL5vP6
 wtydy0bNqFXGcSjB8OY0GJFuN0zR5ULAhzKLl261jpugvD1UXF+NAPUqnW4KNwmoSA71
 ivCA==
X-Gm-Message-State: AOAM530E9Z9Hn16dXZCdaALZhhTOgdMsucolt7Wc4MqIABh4onACYHpJ
 84vuiuGYhAh9H++BELKhois=
X-Google-Smtp-Source: ABdhPJzvuGuo//trHwZcMIHW9CA+SeNjD6ndZY8EzLGswnPMVn9P/I7aIcBIfQ/Obzst0hNTLd2xrw==
X-Received: by 2002:a63:b25:: with SMTP id 37mr3459408pgl.181.1624978146530;
 Tue, 29 Jun 2021 07:49:06 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id i2sm3417262pjj.25.2021.06.29.07.49.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 07:49:06 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: gustavoars@kernel.org,
	viro@zeniv.linux.org.uk
Subject: [PATCH 2/3] hfs: fix high memory mapping in hfs_bnode_read
Date: Tue, 29 Jun 2021 22:48:02 +0800
Message-Id: <20210629144803.62541-3-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629144803.62541-1-desmondcheongzx@gmail.com>
References: <20210629144803.62541-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
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

To fix this, we use the same logic used  in hfsplus' version of
hfs_bnode_read to kmap each page of relevant data that we copy.

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
 fs/hfs/bnode.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/fs/hfs/bnode.c b/fs/hfs/bnode.c
index b63a4df7327b..936cfa763224 100644
--- a/fs/hfs/bnode.c
+++ b/fs/hfs/bnode.c
@@ -18,13 +18,23 @@
 void hfs_bnode_read(struct hfs_bnode *node, void *buf,
 		int off, int len)
 {
-	struct page *page;
+	struct page **pagep;
+	int l;
 
 	off += node->page_offset;
-	page = node->page[0];
+	pagep = node->page + (off >> PAGE_SHIFT);
+	off &= ~PAGE_MASK;
 
-	memcpy(buf, kmap(page) + off, len);
-	kunmap(page);
+	l = min_t(int, len, PAGE_SIZE - off);
+	memcpy(buf, kmap(*pagep) + off, l);
+	kunmap(*pagep);
+
+	while ((len -= l) != 0) {
+		buf += l;
+		l = min_t(int, len, PAGE_SIZE);
+		memcpy(buf, kmap(*++pagep), l);
+		kunmap(*pagep);
+	}
 }
 
 u16 hfs_bnode_read_u16(struct hfs_bnode *node, int off)
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
