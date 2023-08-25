Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 243B1C88CB2
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 25 Aug 2023 00:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9785683168;
	Fri, 25 Aug 2023 00:50:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9785683168
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=hV2UHFjI
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NPr2r_Gnsmqs; Fri, 25 Aug 2023 00:50:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id EDB4E830B8;
	Fri, 25 Aug 2023 00:50:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDB4E830B8
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BA668C0071;
	Fri, 25 Aug 2023 00:50:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C6778C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Aug 2023 00:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B974830B8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Aug 2023 00:50:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B974830B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y-sLbOoUhrxB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Aug 2023 00:50:24 +0000 (UTC)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F2AE383065
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Aug 2023 00:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2AE383065
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-68a402c1fcdso353237b3a.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 17:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692924623; x=1693529423;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LvwS+jlKr38unb9CcYY5WoiseSIwieWVb3qntdo57a4=;
 b=hV2UHFjIjieRWzKuPWsS/r2yAjufefc86mAKUrHLobqKOBVuYpSsGgguQ4l5C/8ZVe
 1KgOwcLoW881Oy8XgIagxzfL2eukj9n/2lbAa+a3zChSbdGcgORl+tpFQPSHYuZE1LuI
 IAabMQqkct0P5QE3MQucHaEtq3jy0eprfnZUAyZFGlX37fXrCuNM6AEimvEGH5zuGpCl
 VXVsUINnwmKsDUVkc9R1wfp0gyFOfWAzGC5j7P+Sj2Qw3JOzhOpDHbFzvAVURMbCRd1e
 2/SNEOYH8vz6trAT4e73DzxVt/qlbUUrQEnkQtUfQCPxIOVQu1bAsjRK3yC/QeVH+WtO
 uknA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692924623; x=1693529423;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LvwS+jlKr38unb9CcYY5WoiseSIwieWVb3qntdo57a4=;
 b=Q/hrgGQrdwlJ7TN02C/xVyI1oGwk7m+zyKgyU2bUR6+ekub5HL+PoI2pWPFTt9+nVf
 Q47eFcCy51Z7r2j2s0J/Rs9KTVOHzTv+vuga1MhmPr4fSTpt9b4ugU7ZAYKElqx/pnhy
 qG70QF51ZXA3gzUKAQPk8Ble5uUGtUCXQC7CXmhMQF5sRYrBDuf47be4GcvaMyiNPT76
 hDAgY4sdBI5RTaD7fzw8C/OjvcDG1wNj+pCqxoFPVUSzpLDWIHJ6PVN3QiAYLFR9TTdq
 B+AXHNc4KXzkwTTq81kV9aBWFKn/lhIZdaUjRVyuKbXaTyYMXHG6xCQIQrXCxpuFz4fP
 9gxw==
X-Gm-Message-State: AOJu0YymQOo9Xkl69tqNGXUL69KjAtQH6Tz3NoWugLmNZdOhesKfmFrw
 Fc8kcZrZPH0YIREqbcA69uQ=
X-Google-Smtp-Source: AGHT+IF9kibcxyG9jR7mEZPqgFZUObik7otOOL6ht5rmNeC+uOml6EcU3CG9gL31/50CjLTwV7s/9Q==
X-Received: by 2002:a05:6a20:3d83:b0:134:2b44:decf with SMTP id
 s3-20020a056a203d8300b001342b44decfmr16885759pzi.21.1692924623064; 
 Thu, 24 Aug 2023 17:50:23 -0700 (PDT)
Received: from rajgad.hsd1.ca.comcast.net
 ([2601:204:df00:9cd0:5aa8:2901:89a5:c04b])
 by smtp.gmail.com with ESMTPSA id
 f12-20020aa782cc000000b0064f76992905sm320672pfn.202.2023.08.24.17.50.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 17:50:22 -0700 (PDT)
From: Atul Raut <rauji.raut@gmail.com>
To: linux-fsdevel@vger.kernel.org
Subject: pagevec: Fix array-index-out-of-bounds error
Date: Thu, 24 Aug 2023 17:17:21 -0700
Message-Id: <20230825001720.19101-1-rauji.raut@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: syzbot+e295147e14b474e4ad70@syzkaller.appspotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, willy@infradead.org
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

Syzkaller reported the following issue:

UBSAN: array-index-out-of-bounds in ./include/linux/pagevec.h:74:2
index 255 is out of range for type 'struct folio *[15]'
CPU: 1 PID: 12841 Comm: syz-executor402 Not tainted 6.5.0-rc7-syzkaller-g35e2132122ba #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/26/2023
Call trace:
 dump_backtrace+0x1b8/0x1e4 arch/arm64/kernel/stacktrace.c:233
 show_stack+0x2c/0x44 arch/arm64/kernel/stacktrace.c:240
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xd0/0x124 lib/dump_stack.c:106
 dump_stack+0x1c/0x28 lib/dump_stack.c:113
 ubsan_epilogue lib/ubsan.c:217 [inline]
 __ubsan_handle_out_of_bounds+0xfc/0x148 lib/ubsan.c:348
 folio_batch_add include/linux/pagevec.h:74 [inline]
 find_lock_entries+0x8fc/0xd84 mm/filemap.c:2089
 truncate_inode_pages_range+0x1b0/0xf74 mm/truncate.c:364
 truncate_inode_pages mm/truncate.c:449 [inline]
 truncate_inode_pages_final+0x90/0xc0 mm/truncate.c:484
 ntfs_evict_inode+0x20/0x48 fs/ntfs3/inode.c:1790
 evict+0x260/0x68c fs/inode.c:664
 iput_final fs/inode.c:1788 [inline]
 iput+0x734/0x818 fs/inode.c:1814
 ntfs_fill_super+0x3648/0x3f90 fs/ntfs3/super.c:1420
 get_tree_bdev+0x378/0x570 fs/super.c:1318
 ntfs_fs_get_tree+0x28/0x38 fs/ntfs3/super.c:1647
 vfs_get_tree+0x90/0x274 fs/super.c:1519
 do_new_mount+0x25c/0x8c8 fs/namespace.c:3335
 path_mount+0x590/0xe04 fs/namespace.c:3662
 do_mount fs/namespace.c:3675 [inline]
 __do_sys_mount fs/namespace.c:3884 [inline]
 __se_sys_mount fs/namespace.c:3861 [inline]
 __arm64_sys_mount+0x45c/0x594 fs/namespace.c:3861
 __invoke_syscall arch/arm64/kernel/syscall.c:37 [inline]
 invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:51
 el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:136
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:155
 el0_svc+0x58/0x16c arch/arm64/kernel/entry-common.c:678
 el0t_64_sync_handler+0x84/0xfc arch/arm64/kernel/entry-common.c:696
 el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:591

In folio_batch_add, which contains folios rather
than fixed-size pages, there is a chance that the
array index will fall outside of bounds.
Before adding folios, examine the available space to fix.

The patch is tested via syzbot.

Reported-by: syzbot+e295147e14b474e4ad70@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=e295147e14b474e4ad70
Signed-off-by: Atul Raut <rauji.raut@gmail.com>
---
 include/linux/pagevec.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/pagevec.h b/include/linux/pagevec.h
index 87cc678adc85..208f9a99889f 100644
--- a/include/linux/pagevec.h
+++ b/include/linux/pagevec.h
@@ -71,7 +71,9 @@ static inline unsigned int folio_batch_space(struct folio_batch *fbatch)
 static inline unsigned folio_batch_add(struct folio_batch *fbatch,
 		struct folio *folio)
 {
-	fbatch->folios[fbatch->nr++] = folio;
+	if (folio_batch_space(fbatch))
+		fbatch->folios[fbatch->nr++] = folio;
+
 	return folio_batch_space(fbatch);
 }
 
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
