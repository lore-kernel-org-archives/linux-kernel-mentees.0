Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1297C6FD18
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Mar 2023 20:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F510841E4;
	Wed, 29 Mar 2023 20:37:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F510841E4
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=tuC4/n8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IeksS0q77k0Q; Wed, 29 Mar 2023 20:37:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 054048419A;
	Wed, 29 Mar 2023 20:37:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 054048419A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CBB16C0037;
	Wed, 29 Mar 2023 20:37:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 49386C002F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Mar 2023 20:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10AC98419C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Mar 2023 20:37:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10AC98419C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DVTUO0Sox-fs
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Mar 2023 20:37:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B4008419A
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B4008419A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Mar 2023 20:37:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5EC0B61E3F;
 Wed, 29 Mar 2023 20:37:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75CD8C433D2;
 Wed, 29 Mar 2023 20:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1680122228;
 bh=2I0JCeUtFGxllsjUjz1+8sN/d7dbpHqfz5oKNQ3vfTY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tuC4/n8EzvpZ3/oHnj4RCNIEHbpjqOm2O7NDHEfSij+yazs7vKG3dO0+sNFPqQvn2
 ZFZqMtZbZKqG3y0nzmgUlQ1bV27BNoS/irkhAPXDGl9zAo78A28DKnbyvaSY5Ir8dD
 DJ8lSYrMtRAvw1/ds6D3UROilqwNMntALQAkR+hc=
Date: Wed, 29 Mar 2023 13:37:07 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Ivan Orlov <ivan.orlov0322@gmail.com>
Subject: Re: [PATCH] mm: khugepaged: Fix kernel BUG in hpage_collapse_scan_file
Message-Id: <20230329133707.10b555eff630849a5293e4fd@linux-foundation.org>
In-Reply-To: <20230329145330.23191-1-ivan.orlov0322@gmail.com>
References: <20230329145330.23191-1-ivan.orlov0322@gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Cc: Song Liu <songliubraving@fb.com>, Rik van Riel <riel@surriel.com>,
 Johannes Weiner <hannes@cmpxchg.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, syzbot+9578faa5475acb35fa50@syzkaller.appspotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
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

On Wed, 29 Mar 2023 18:53:30 +0400 Ivan Orlov <ivan.orlov0322@gmail.com> wrote:

> Syzkaller reported the following issue:
> 
> kernel BUG at mm/khugepaged.c:1823!
> invalid opcode: 0000 [#1] PREEMPT SMP KASAN
> CPU: 1 PID: 5097 Comm: syz-executor220 Not tainted 6.2.0-syzkaller-13154-g857f1268a591 #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/16/2023
> RIP: 0010:collapse_file mm/khugepaged.c:1823 [inline]
> RIP: 0010:hpage_collapse_scan_file+0x67c8/0x7580 mm/khugepaged.c:2233
> Code: 00 00 89 de e8 c9 66 a3 ff 31 ff 89 de e8 c0 66 a3 ff 45 84 f6 0f 85 28 0d 00 00 e8 22 64 a3 ff e9 dc f7 ff ff e8 18 64 a3 ff <0f> 0b f3 0f 1e fa e8 0d 64 a3 ff e9 93 f6 ff ff f3 0f 1e fa 4c 89
> RSP: 0018:ffffc90003dff4e0 EFLAGS: 00010093
> RAX: ffffffff81e95988 RBX: 00000000000001c1 RCX: ffff8880205b3a80
> RDX: 0000000000000000 RSI: 00000000000001c0 RDI: 00000000000001c1
> RBP: ffffc90003dff830 R08: ffffffff81e90e67 R09: fffffbfff1a433c3
> R10: 0000000000000000 R11: dffffc0000000001 R12: 0000000000000000
> R13: ffffc90003dff6c0 R14: 00000000000001c0 R15: 0000000000000000
> FS:  00007fdbae5ee700(0000) GS:ffff8880b9900000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007fdbae6901e0 CR3: 000000007b2dd000 CR4: 00000000003506e0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  <TASK>
>  madvise_collapse+0x721/0xf50 mm/khugepaged.c:2693
>  madvise_vma_behavior mm/madvise.c:1086 [inline]
>  madvise_walk_vmas mm/madvise.c:1260 [inline]
>  do_madvise+0x9e5/0x4680 mm/madvise.c:1439
>  __do_sys_madvise mm/madvise.c:1452 [inline]
>  __se_sys_madvise mm/madvise.c:1450 [inline]
>  __x64_sys_madvise+0xa5/0xb0 mm/madvise.c:1450
>  do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>  do_syscall_64+0x41/0xc0 arch/x86/entry/common.c:80
>  entry_SYSCALL_64_after_hwframe+0x63/0xcd
> 
> The 'xas_store' call during page cache scanning can potentially
> translate 'xas' into the error state (with the reproducer provided
> by the syzkaller the error code is -ENOMEM). However, there are no
> further checks after the 'xas_store', and the next call of 'xas_next'
> at the start of the scanning cycle doesn't increase the xa_index,
> and the issue occurs.
> 
> This patch will add the xarray state error checking after the
> 'xas_store' and the corresponding result error code.
> 

Thanks.  We'll want a Fixes: for this to go with a cc:stable.

So when did we break this?  I'm thinking 99cb0dbd47a15 ("mm,thp: add
read-only THP support for (non-shmem) FS"), which did

+			if (!page) {
+				/*
+				 * Stop if extent has been truncated or
+				 * hole-punched, and is now completely
+				 * empty.
+				 */
+				if (index == start) {
+					if (!xas_next_entry(&xas, end - 1)) {
+						result = SCAN_TRUNCATED;
+						goto xa_locked;
+					}
+					xas_set(&xas, index);
+				}
+				if (!shmem_charge(mapping->host, 1)) {
+					result = SCAN_FAIL;
 					goto xa_locked;
 				}
-				xas_set(&xas, index);
+				xas_store(&xas, new_page);
+				nr_none++;
+				continue;
 			}

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
