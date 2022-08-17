Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 797BFC25B08
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 17 Aug 2022 08:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5E2340D7B;
	Wed, 17 Aug 2022 08:55:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5E2340D7B
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LQ2AFKVy
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mZL1i34YyvTC; Wed, 17 Aug 2022 08:55:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id DACB54048D;
	Wed, 17 Aug 2022 08:55:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DACB54048D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B1C23C0033;
	Wed, 17 Aug 2022 08:55:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 32CBEC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Aug 2022 08:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B3F34016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Aug 2022 08:55:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B3F34016E
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LQ2AFKVy
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qh679Qvy_7rP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Aug 2022 08:55:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D751640069
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D751640069
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Aug 2022 08:55:32 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id x19so380592plc.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Aug 2022 01:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=QMW64EnUhAM3fb/FOLJApJo2idS3sY65uejC0k2Z3qs=;
 b=LQ2AFKVyFma74B+9htyjmznvbfRPRnZLlV/vJ/foDCuBbipC/NLRNHJ23ZQTSer6X4
 o9M4ZYKS6kwdvQ86BhGBEWIluCEEK21Z4UPzw/qDfRApKMBKiZ8eSCrAKvrmfH8GSA9t
 tOJDTIuXcFqUS9yFM57ySvdGjzCpIAXXFZJVj2yPeyLNDcEZiwFY8tvvflUnL1AzhvX6
 TGd+BRvon3Dnn8Yawepllh+7mhuRvHlB1l+O3WC7H5gJsgSkpuSAfFa7jYVlx1iUDNsD
 bjGOchBVY1pbO9+e+gmYhjPvCazqKIHx/ArtUwzge1aG3UnZ9+qPKv6+yLNeYvWbTg1m
 xpZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=QMW64EnUhAM3fb/FOLJApJo2idS3sY65uejC0k2Z3qs=;
 b=Dq5EdJsYbWNiDOpKtb7KHH6TCDqk+iAqL3VKK9UyWfcrRiFJ/4BvFdVh7IGpRs/RtR
 i6gMkQg2HFjntNZ33vf8W02vhkq2qUgmkOaiD36jC/vviUyVk2pSk+YofXsSNI92tCIt
 1ureTD4Rh/Mvl8nWQTaMQDZy9eIs5X4+b8Hz/XULz8xJFgkc9UX3o3ZtjnbulNJ66wdk
 kpHEo7L+8/nK2P0VjmbxvvUk4cAwkDnYNlPI5HrY6mv1/0n8xdIyFTJZLPVm9YNzl9nV
 80deOjsu9GRlcX4+9ilMScC5Qwd2ZEaxMYZeyYD0qsd88x5qQ8Up4yu89Hw3HSPoS3oI
 nnWA==
X-Gm-Message-State: ACgBeo3YAP9FydbLuPSgZPyVLJ2wgCmwrs8NKtGMAXpdaiij0hBJLpNT
 Va1Ka9CFaICUkIYDyHSUdSk=
X-Google-Smtp-Source: AA6agR4b2hPRJE7HpZslHS98/W1cBrlQnEt1QfHEHV9DuQXzbwcnHh7xLYHsYR5KfdYpnG1L5uY+hA==
X-Received: by 2002:a17:902:7d86:b0:170:a752:cbd1 with SMTP id
 a6-20020a1709027d8600b00170a752cbd1mr25696348plm.17.1660726532284; 
 Wed, 17 Aug 2022 01:55:32 -0700 (PDT)
Received: from localhost ([36.112.86.8]) by smtp.gmail.com with ESMTPSA id
 bj7-20020a17090b088700b001fabc3da687sm389347pjb.51.2022.08.17.01.55.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 01:55:31 -0700 (PDT)
From: Hawkins Jiawei <yin31149@gmail.com>
To: syzbot+ffe24b1afbc4cb5ae8fb@syzkaller.appspotmail.com
Subject: [PATCH] reiserfs: add check in search_by_entry_key()
Date: Wed, 17 Aug 2022 16:55:11 +0800
Message-Id: <20220817085512.75936-1-yin31149@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <000000000000bcbb0205e13dc53a@google.com>
References: <000000000000bcbb0205e13dc53a@google.com>
MIME-Version: 1.0
Cc: paskripkin@gmail.com, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org,
 yin31149@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
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

Syzkaller reports use-after-free Read as follows:
------------[ cut here ]------------
BUG: KASAN: use-after-free in bin_search_in_dir_item fs/reiserfs/namei.c:40 [inline]
BUG: KASAN: use-after-free in search_by_entry_key+0x81f/0x960 fs/reiserfs/namei.c:165
Read of size 4 at addr ffff8880715ee014 by task syz-executor352/3611

CPU: 0 PID: 3611 Comm: syz-executor352 Not tainted 5.19.0-rc1-syzkaller-00263-g1c27f1fc1549 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
 print_address_description.constprop.0.cold+0xeb/0x495 mm/kasan/report.c:313
 print_report mm/kasan/report.c:429 [inline]
 kasan_report.cold+0xf4/0x1c6 mm/kasan/report.c:491
 bin_search_in_dir_item fs/reiserfs/namei.c:40 [inline]
 search_by_entry_key+0x81f/0x960 fs/reiserfs/namei.c:165
 reiserfs_find_entry.part.0+0x139/0xdf0 fs/reiserfs/namei.c:322
 reiserfs_find_entry fs/reiserfs/namei.c:368 [inline]
 reiserfs_lookup+0x24a/0x490 fs/reiserfs/namei.c:368
 __lookup_slow+0x24c/0x480 fs/namei.c:1701
 lookup_one_len+0x16a/0x1a0 fs/namei.c:2730
 reiserfs_lookup_privroot+0x92/0x280 fs/reiserfs/xattr.c:980
 reiserfs_fill_super+0x21bb/0x2fb0 fs/reiserfs/super.c:2176
 mount_bdev+0x34d/0x410 fs/super.c:1367
 legacy_get_tree+0x105/0x220 fs/fs_context.c:610
 vfs_get_tree+0x89/0x2f0 fs/super.c:1497
 do_new_mount fs/namespace.c:3040 [inline]
 path_mount+0x1320/0x1fa0 fs/namespace.c:3370
 do_mount fs/namespace.c:3383 [inline]
 __do_sys_mount fs/namespace.c:3591 [inline]
 __se_sys_mount fs/namespace.c:3568 [inline]
 __x64_sys_mount+0x27f/0x300 fs/namespace.c:3568
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x46/0xb0
 </TASK>

The buggy address belongs to the physical page:
page:ffffea0001c57b80 refcount:0 mapcount:0 mapping:0000000000000000 index:0x1 pfn:0x715ee
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
raw: 00fff00000000000 ffffea0001c57bc8 ffff8880b9a403c0 0000000000000000
raw: 0000000000000001 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as freed

Memory state around the buggy address:
 ffff8880715edf00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffff8880715edf80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffff8880715ee000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
                         ^
 ffff8880715ee080: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffff8880715ee100: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
==================================================================

The root cause is that the value of rbound in bin_search_in_dir_item()
is out of bounds.

To be more specific, struct buffer_head's b_data field
contains the directory entry headers array, according to
set_de_item_location(). So the array's length should be less
than the size of b_data, or it may access the invalid memory.  
This patch solves it by comparing the array's size with b_data's size.

Reported-by: syzbot+ffe24b1afbc4cb5ae8fb@syzkaller.appspotmail.com
Signed-off-by: Hawkins Jiawei <yin31149@gmail.com>
---
 fs/reiserfs/namei.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/reiserfs/namei.c b/fs/reiserfs/namei.c
index 3d7a35d6a18b..c4c056ffafde 100644
--- a/fs/reiserfs/namei.c
+++ b/fs/reiserfs/namei.c
@@ -33,7 +33,11 @@ static int bin_search_in_dir_item(struct reiserfs_dir_entry *de, loff_t off)
 	int rbound, lbound, j;
 
 	lbound = 0;
-	rbound = ih_entry_count(ih) - 1;
+	if (ih_location(ih) + ih_entry_count(ih) * IH_SIZE >=
+	    de->de_bh->b_size)
+		rbound = (de->de_bh->b_size - ih_location(ih)) / IH_SIZE - 1;
+	else
+		rbound = ih_entry_count(ih) - 1;
 
 	for (j = (rbound + lbound) / 2; lbound <= rbound;
 	     j = (rbound + lbound) / 2) {
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
