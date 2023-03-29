Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C180C6FD18
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Mar 2023 14:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE6E741DC4;
	Wed, 29 Mar 2023 14:53:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE6E741DC4
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XjLsCsvn
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1aBPZXEgQIWU; Wed, 29 Mar 2023 14:53:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 9DB4741E86;
	Wed, 29 Mar 2023 14:53:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DB4741E86
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7A25FC0037;
	Wed, 29 Mar 2023 14:53:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 39B25C002F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Mar 2023 14:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0846F4041C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Mar 2023 14:53:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0846F4041C
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XjLsCsvn
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wrvkRsVEcwJb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Mar 2023 14:53:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E31FE4000B
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E31FE4000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Mar 2023 14:53:44 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id bi9so20552302lfb.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Mar 2023 07:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680101623; x=1682693623;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mEfOw359GRtKE8JCHIM8Osck0I4+SZuJBzUhnN6nlo8=;
 b=XjLsCsvn2a3ktcgvoxrI3m6Hds0ImD4++hcwbtY5mAvMFbIWA1qd/u9qZrBYzOUF/9
 q6a1SeSR4o2oggFekN91HgYcXltH9kFil7hJPOgM7O0Q+f0FEYLjtaJH7E32blYe+SPp
 aizgMdw/+R/V1Dn3RZZSWl947luOD2oEDYbM+ETcn97+ILXUsu+RHoDgjNfT4OfpNx/v
 wwXjOxPbzvLokpL57HHdji8y8Gk7A4NnbHmwV/xw6fXV7wGB0RTz4UU2eNtqMgnCdwDA
 HsBGknsOSkR0xQTcxN0Txg+FL1aRhenfL42rKtq1BsmHtadmhBiklX4RIlPf40Yo4Qw4
 G19g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680101623; x=1682693623;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mEfOw359GRtKE8JCHIM8Osck0I4+SZuJBzUhnN6nlo8=;
 b=XU0RDGlg4xMLdlW1gJztir3WJ7xApFgfQuNS5yie4zaKDQHB6MN2edqsh1F3PaVTE1
 8aJyKlPB7stMj/plgNbuSmheu8I64wWCogNMJWESxI8mjOniZVBxCgvnuLJgulR+UMyJ
 dwxZzm3LkH9T+Jm0bLOk77zqK3JRBbVIwcaigMfpYDIwLKdEqLHHkEKyQ+wn7PCffK38
 PfxSJR8qgpd4rSF/yALLnoBuA2+epgNdGPd8SyMQExEBPGs25eb2BqyN/lxW6mFxmMe2
 tfa7wbhDKEMZz1o1V+hWFEts2dDkAf49p9KTCLl6vidEvmak8F1jXxeZytRunERyVxpW
 woKw==
X-Gm-Message-State: AAQBX9ci2MlQpCPOg9CFOr1PadUwQyTc92NXQXsTUlTYLf6GKSjXBMI5
 0QC0khjgov2kEZyz40aTm+8=
X-Google-Smtp-Source: AKy350YdsUKflXAEBl1vJ9VDW1DfapsI013xZTK3XHhLffq3SlUJND31lkuQM3vbpQwCIOiQ/dDjJA==
X-Received: by 2002:ac2:5989:0:b0:4dd:a025:d87 with SMTP id
 w9-20020ac25989000000b004dda0250d87mr4805726lfn.0.1680101622641; 
 Wed, 29 Mar 2023 07:53:42 -0700 (PDT)
Received: from ivan-HLYL-WXX9.. ([178.160.196.94])
 by smtp.gmail.com with ESMTPSA id
 b3-20020ac25623000000b004eb0c51780bsm1619723lff.29.2023.03.29.07.53.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 07:53:42 -0700 (PDT)
From: Ivan Orlov <ivan.orlov0322@gmail.com>
To: akpm@linux-foundation.org
Subject: [PATCH] mm: khugepaged: Fix kernel BUG in hpage_collapse_scan_file
Date: Wed, 29 Mar 2023 18:53:30 +0400
Message-Id: <20230329145330.23191-1-ivan.orlov0322@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, syzbot+9578faa5475acb35fa50@syzkaller.appspotmail.com,
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
'xas_store' and the corresponding result error code.

Tested via syzbot.

Reported-by: syzbot+9578faa5475acb35fa50@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?id=7d6bb3760e026ece7524500fe44fb024a0e959fc
Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
---
 mm/khugepaged.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 92e6f56a932d..4d9850d9ea7f 100644
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
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
