Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 590DAEB64D7
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Jun 2023 18:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5EC960F91;
	Wed, 21 Jun 2023 18:37:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5EC960F91
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=nO50UhyV
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8ABdbd0IrOfO; Wed, 21 Jun 2023 18:37:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1391961106;
	Wed, 21 Jun 2023 18:37:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1391961106
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 00B82C0037;
	Wed, 21 Jun 2023 18:37:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 11E67C0029
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jun 2023 18:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D312141F20
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jun 2023 18:37:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D312141F20
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=nO50UhyV
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zo4DjKaKgnWR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jun 2023 18:37:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B553A41C49
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B553A41C49
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jun 2023 18:37:09 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-666ecf9a0ceso3340473b3a.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jun 2023 11:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687372629; x=1689964629;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HttJ+IZPAFgAC2KFju7xOOGbFCf82oXdQ0iEodC89/8=;
 b=nO50UhyVVA8Y94ODBGdhTOLw2aFgzMeIqVRRWVk7tgqaqKiMGEytcSwZ+y4vzjPB1u
 F/JgOQJHv6TbyKU8bvIxFCjvs+Iho9/b/0PnAm/XkSPl7NA4mASHCPGg97pUBmSKZ+K1
 VFDWNssgbn0YsTuILvQ2iBY/cfknOADdQOZr1MWChptp0H6PGhP0rS1e9LrEhD9x98BP
 gyOXoV38+jDpPmDz5VNQLW3jOW24wsUzpOdYaSTCNftO9q5ySsNDceIoxGE5lWSa9Xne
 eixcKbbhqJBuL2+2m6jZJZynRcsuUMdUBXfW47cLhoXswmHXdmH5duy3VtvwrAF+qCNy
 GcjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687372629; x=1689964629;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HttJ+IZPAFgAC2KFju7xOOGbFCf82oXdQ0iEodC89/8=;
 b=XZLoEVOWbcyTVHUFq1VocWJpWxZuToicx0y33SeFXxkSRWLEDA2dbnTK6dkdTUz5UM
 JA0NMNuXHf3BadtEfwpu+Zq4kJ1VPzQYV6CUNfptf+j5aSyhk5cVGtjeK6y1jgf/e7Sv
 /45O6e+1nN1LwZ/KmK4hiDfeOHv17GLGni/HAc5S8fGFOfNDtHnyQlUTeI7vgfkJUAWg
 u9b3c//N9x4kdx07c0JShFUZ+l8sA5sO/WdHMCvo5F9cEoQ+QFw0Ck/4FrG2XoOvsiJY
 EzuC3ie/S14NHTsJg6eRNUJtL8wZuQIl3Bbwv9mQh7Eb1QZXkRa4AVjtoPUiwcJXDdsI
 WSQw==
X-Gm-Message-State: AC+VfDwcTC7qd3dk7VC93/ctHeUul7ngk6Wb5o52yQKCy4McFlWTtOlL
 6Ha507dbHMPU9kroKWciY3U=
X-Google-Smtp-Source: ACHHUZ7BMK4uKx4E4hlm1l99TriZp6rOiSWu6de4B1O/UAlnENoG+aYVvtHECZDw12qdEkLBJ0/fiA==
X-Received: by 2002:a05:6a00:1a0f:b0:668:8705:57dd with SMTP id
 g15-20020a056a001a0f00b00668870557ddmr6703897pfv.28.1687372629026; 
 Wed, 21 Jun 2023 11:37:09 -0700 (PDT)
Received: from zephyrusG14 ([103.251.210.211])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a63e251000000b0050a0227a4bcsm3446104pgj.57.2023.06.21.11.37.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 11:37:08 -0700 (PDT)
Date: Thu, 22 Jun 2023 00:07:03 +0530
From: Yogesh <yogi.kernel@gmail.com>
To: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Subject: [PATCH] fs: jfs: Fix UBSAN: array-index-out-of-bounds in
 dbAllocDmapLev
Message-ID: <ZJNDT7ro6OA4hYM9@zephyrusG14>
MIME-Version: 1.0
Content-Disposition: inline
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

UBSAN: array-index-out-of-bounds in fs/jfs/jfs_dmap.c:1965:6
index -84 is out of range for type 's8[341]' (aka 'signed char[341]')
CPU: 1 PID: 4995 Comm: syz-executor146 Not tainted 6.4.0-rc6-syzkaller-00037-gb6dad5178cea #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/27/2023
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x1e7/0x2d0 lib/dump_stack.c:106
 ubsan_epilogue lib/ubsan.c:217 [inline]
 __ubsan_handle_out_of_bounds+0x11c/0x150 lib/ubsan.c:348
 dbAllocDmapLev+0x3e5/0x430 fs/jfs/jfs_dmap.c:1965
 dbAllocCtl+0x113/0x920 fs/jfs/jfs_dmap.c:1809
 dbAllocAG+0x28f/0x10b0 fs/jfs/jfs_dmap.c:1350
 dbAlloc+0x658/0xca0 fs/jfs/jfs_dmap.c:874
 dtSplitUp fs/jfs/jfs_dtree.c:974 [inline]
 dtInsert+0xda7/0x6b00 fs/jfs/jfs_dtree.c:863
 jfs_create+0x7b6/0xbb0 fs/jfs/namei.c:137
 lookup_open fs/namei.c:3492 [inline]
 open_last_lookups fs/namei.c:3560 [inline]
 path_openat+0x13df/0x3170 fs/namei.c:3788
 do_filp_open+0x234/0x490 fs/namei.c:3818
 do_sys_openat2+0x13f/0x500 fs/open.c:1356
 do_sys_open fs/open.c:1372 [inline]
 __do_sys_openat fs/open.c:1388 [inline]
 __se_sys_openat fs/open.c:1383 [inline]
 __x64_sys_openat+0x247/0x290 fs/open.c:1383
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x41/0xc0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f1f4e33f7e9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 51 14 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffc21129578 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f1f4e33f7e9
RDX: 000000000000275a RSI: 0000000020000040 RDI: 00000000ffffff9c
RBP: 00007f1f4e2ff080 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f1f4e2ff110
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>

The bug occurs when the dbAllocDmapLev()function attempts to access
dp->tree.stree[leafidx + LEAFIND] while the leafidx value is negative.

To rectify this, the patch introduces a safeguard within the
dbAllocDmapLev() function. A check has been added to verify if leafidx is
negative. If it is, the function immediately returns an I/O error, preventing
any further execution that could potentially cause harm.

Tested via syzbot.

Reported-by: syzbot+853a6f4dfa3cf37d3aea@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=ae2f5a27a07ae44b0f17
Signed-off-by: Yogesh <yogi.kernel@gmail.com>
---
 fs/jfs/jfs_dmap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/jfs/jfs_dmap.c b/fs/jfs/jfs_dmap.c
index a3eb1e826947..839f1b67485f 100644
--- a/fs/jfs/jfs_dmap.c
+++ b/fs/jfs/jfs_dmap.c
@@ -1953,6 +1953,8 @@ dbAllocDmapLev(struct bmap * bmp,
 	if (dbFindLeaf((dmtree_t *) & dp->tree, l2nb, &leafidx))
 		return -ENOSPC;
 
+	if (leafidx < 0)
+		return -EIO;
 	/* determine the block number within the file system corresponding
 	 * to the leaf at which free space was found.
 	 */
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
