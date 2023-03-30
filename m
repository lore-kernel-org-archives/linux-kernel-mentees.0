Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D80C7C761A6
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Mar 2023 15:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E4A160BFD;
	Thu, 30 Mar 2023 15:53:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E4A160BFD
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ROBarmsc
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HEGOGC9oR8lu; Thu, 30 Mar 2023 15:53:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3D98760BBC;
	Thu, 30 Mar 2023 15:53:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D98760BBC
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 28343C0037;
	Thu, 30 Mar 2023 15:53:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF6F3C002F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Mar 2023 15:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8956140263
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Mar 2023 15:53:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8956140263
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ROBarmsc
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YaHeCT7TrN7N
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Mar 2023 15:53:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 138B441E21
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 138B441E21
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Mar 2023 15:53:10 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id ek18so78350710edb.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Mar 2023 08:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680191589;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ikZyF37hU9YDO+GQB/GUbHTmkdXciWAtoxo0PEHvqgY=;
 b=ROBarmsc9FRDQk/abfcUvYA25l2Bl8IEyF1WgfDPAx4A5JuDBqHyeCrwreeMJyenNA
 v/OJvRZVjGKu2bWHM+Y28FtVAY6hyB6C03uv4iS0cfRSbz/rNPzTHClz1dEfTIq8hAo/
 E2RjDsaqtmGYV8cQslOaONDxnL3O6+LRmtpvoq1XA6o4BxiTC15ritsL82jR1iGCzY7C
 3D2+R8sk27Dp51zWeHJx80dTawRIABmezauk948tCUgvfgwcei/0sLl0SuFo6h3Ofh6d
 U55bwxxMHRJLYAxH4nI8QpYP6r39xLfRaF8nWV7+OZhpkXsY2QUuxWRnvwrdCzq/CGqE
 aKiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680191589;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ikZyF37hU9YDO+GQB/GUbHTmkdXciWAtoxo0PEHvqgY=;
 b=PlnSUhdl9xj698io11hOfAz9NORu4o7kFt5y7swWGOFLcoYWe2ZzsqcF8l3walBjpP
 bEPXLwZbtSWtJJHoZZhFY2OPRq22OLzyHVqK6gQ8m9gE4Qd3Z2X8O4ILGs9rjHqnEtpR
 BHVhqAKYH/flvsEKZhzfOcQ9tksn9LQGmfaU7jU7l3fWz5fIgSDJCqAm7zhQYkwS9qDg
 PieqAKcjxG+Xlo1Kce749yY+7Cze+bWkiatEznB/DUFGscwvIY1w3pKBTBe/WSEuUaUH
 yrAWXBZK8tD3wFqOnlRw8RnbIuOC+QijnDBhRdnKGh8JU9iFRB6pVAR2R9B9PlXUxar0
 xH/w==
X-Gm-Message-State: AAQBX9d9iRi6sSW0lBqqRlyEkFU9a/vax4FUUwFyCnkhQw+UtO1TGTF+
 jSZ2lPdPpC9+7b9xvtiS7b8=
X-Google-Smtp-Source: AKy350bonleupkdfcCxOXzFGjgMB/RZ0SXYhmfxsTBkQyFAwaTdJDflIKAwbXhgwxlO9d0UptITKhQ==
X-Received: by 2002:a17:906:2098:b0:8d2:78c5:1d4e with SMTP id
 24-20020a170906209800b008d278c51d4emr2497476ejq.5.1680191588594; 
 Thu, 30 Mar 2023 08:53:08 -0700 (PDT)
Received: from ivan-HLYL-WXX9.. ([37.252.81.51])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a170906248700b0093408d33875sm15027305ejb.49.2023.03.30.08.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 08:53:08 -0700 (PDT)
From: Ivan Orlov <ivan.orlov0322@gmail.com>
To: akpm@linux-foundation.org
Subject: [PATCH v2] mm: khugepaged: Fix kernel BUG in hpage_collapse_scan_file
Date: Thu, 30 Mar 2023 19:53:05 +0400
Message-Id: <20230330155305.423051-1-ivan.orlov0322@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>, shy828301@gmail.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 syzbot+9578faa5475acb35fa50@syzkaller.appspotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, zokeefe@google.com
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

kernel BUG at mm/khugepaged.c:1823!
invalid opcode: 0000 [#1] PREEMPT SMP KASAN
CPU: 1 PID: 5097 Comm: syz-executor220 Not tainted 6.2.0-syzkaller-13154-g857f1268a591 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/16/2023
RIP: 0010:collapse_file mm/khugepaged.c:1823 [inline]
RIP: 0010:hpage_collapse_scan_file+0x67c8/0x7580 mm/khugepaged.c:2233
Code: 00 00 89 de e8 c9 66 a3 ff 31 ff 89 de e8 c0 66 a3 ff 45 84 f6 0f 85 28 0d 00 00 e8 22 64 a3 ff e9 dc f7 ff ff e8 18 64 a3 ff <0f> 0b f3 0f 1e fa e8 0d 64 a3 ff e9 93 f6 ff ff f3 0f 1e fa 4c 89
RSP: 0018:ffffc90003dff4e0 EFLAGS: 00010093
RAX: ffffffff81e95988 RBX: 00000000000001c1 RCX: ffff8880205b3a80
RDX: 0000000000000000 RSI: 00000000000001c0 RDI: 00000000000001c1
RBP: ffffc90003dff830 R08: ffffffff81e90e67 R09: fffffbfff1a433c3
R10: 0000000000000000 R11: dffffc0000000001 R12: 0000000000000000
R13: ffffc90003dff6c0 R14: 00000000000001c0 R15: 0000000000000000
FS:  00007fdbae5ee700(0000) GS:ffff8880b9900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fdbae6901e0 CR3: 000000007b2dd000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 madvise_collapse+0x721/0xf50 mm/khugepaged.c:2693
 madvise_vma_behavior mm/madvise.c:1086 [inline]
 madvise_walk_vmas mm/madvise.c:1260 [inline]
 do_madvise+0x9e5/0x4680 mm/madvise.c:1439
 __do_sys_madvise mm/madvise.c:1452 [inline]
 __se_sys_madvise mm/madvise.c:1450 [inline]
 __x64_sys_madvise+0xa5/0xb0 mm/madvise.c:1450
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x41/0xc0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd

The 'xas_store' call during page cache scanning can potentially
translate 'xas' into the error state (with the reproducer provided
by the syzkaller the error code is -ENOMEM). However, there are no
further checks after the 'xas_store', and the next call of 'xas_next'
at the start of the scanning cycle doesn't increase the xa_index,
and the issue occurs.

This patch will add the xarray state error checking after the
'xas_store' and the corresponding result error code. It will
also add xarray state error checking via WARN_ON_ONCE macros,
to be sure that ENOMEM or other possible errors don't occur
at the places they shouldn't.

Tested via syzbot.

Reported-by: syzbot+9578faa5475acb35fa50@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?id=7d6bb3760e026ece7524500fe44fb024a0e959fc
Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
---
V1 -> V2: Add WARN_ON_ONCE error checking and comments

 mm/khugepaged.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 92e6f56a932d..8b6580b13339 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -55,6 +55,7 @@ enum scan_result {
 	SCAN_CGROUP_CHARGE_FAIL,
 	SCAN_TRUNCATED,
 	SCAN_PAGE_HAS_PRIVATE,
+	SCAN_STORE_FAILED,
 };
 
 #define CREATE_TRACE_POINTS
@@ -1840,6 +1841,15 @@ static int collapse_file(struct mm_struct *mm, unsigned long addr,
 					goto xa_locked;
 				}
 				xas_store(&xas, hpage);
+				if (xas_error(&xas)) {
+					/* revert shmem_charge performed
+					 * in the previous condition
+					 */
+					mapping->nrpages--;
+					shmem_uncharge(mapping->host, 1);
+					result = SCAN_STORE_FAILED;
+					goto xa_locked;
+				}
 				nr_none++;
 				continue;
 			}
@@ -1992,6 +2002,11 @@ static int collapse_file(struct mm_struct *mm, unsigned long addr,
 
 		/* Finally, replace with the new page. */
 		xas_store(&xas, hpage);
+		/* We can't get an ENOMEM here (because the allocation happened before)
+		 * but let's check for errors (XArray implementation can be
+		 * changed in the future)
+		 */
+		WARN_ON_ONCE(xas_error(&xas));
 		continue;
 out_unlock:
 		unlock_page(page);
@@ -2029,6 +2044,11 @@ static int collapse_file(struct mm_struct *mm, unsigned long addr,
 	/* Join all the small entries into a single multi-index entry */
 	xas_set_order(&xas, start, HPAGE_PMD_ORDER);
 	xas_store(&xas, hpage);
+	/* Here we can't get an ENOMEM (because entries were
+	 * previously allocated) But let's check for errors
+	 * (XArray implementation can be changed in the future)
+	 */
+	WARN_ON_ONCE(xas_error(&xas));
 xa_locked:
 	xas_unlock_irq(&xas);
 xa_unlocked:
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
