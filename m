Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72778C6FD18
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Mar 2023 21:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E31CF84188;
	Wed, 29 Mar 2023 21:53:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E31CF84188
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=A3yz2lkG
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AtC1XVKvVBOp; Wed, 29 Mar 2023 21:53:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E20378417C;
	Wed, 29 Mar 2023 21:53:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E20378417C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B019FC0036;
	Wed, 29 Mar 2023 21:53:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2CC6FC002F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Mar 2023 21:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA32F8417D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Mar 2023 21:53:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA32F8417D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ugTaTFvM2twR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Mar 2023 21:53:07 +0000 (UTC)
X-Greylist: delayed 01:15:57 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01A968417C
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 01A968417C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Mar 2023 21:53:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E664161E68;
 Wed, 29 Mar 2023 21:53:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E790C433EF;
 Wed, 29 Mar 2023 21:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1680126785;
 bh=K6T/IUGj1Ip/Ty8DVHp0rPk4TkR7iO4ih/+pi3zhJr4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=A3yz2lkGPRZU49PZGaqeYtfe9HCc4NoysxY7NDUOLf+/PuUUj+ZUi5aK3V4FpnweQ
 js+tEfEZg0UPhJBfWbvPsYpE6JA/G4PaOkSnytvbSdl8QN+HUo9WOo2HoUMqtO6p2w
 RU/XO7vveNmgZKiO2aKzzL1nZyx68F5EBFA8Gtdk=
Date: Wed, 29 Mar 2023 14:53:04 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Ivan Orlov <ivan.orlov0322@gmail.com>
Subject: Re: [PATCH] mm: khugepaged: Fix kernel BUG in hpage_collapse_scan_file
Message-Id: <20230329145304.66add47ba9b9fafb71b1e13d@linux-foundation.org>
In-Reply-To: <20230329145330.23191-1-ivan.orlov0322@gmail.com>
References: <20230329145330.23191-1-ivan.orlov0322@gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 syzbot+9578faa5475acb35fa50@syzkaller.appspotmail.com,
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

On Wed, 29 Mar 2023 18:53:30 +0400 Ivan Orlov <ivan.orlov0322@gmail.com> wrote:

> Syzkaller reported the following issue:
> 
> ...
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
> Tested via syzbot.
> 
> Reported-by: syzbot+9578faa5475acb35fa50@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?id=7d6bb3760e026ece7524500fe44fb024a0e959fc
> Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
> ---
>  mm/khugepaged.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 92e6f56a932d..4d9850d9ea7f 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -55,6 +55,7 @@ enum scan_result {
>  	SCAN_CGROUP_CHARGE_FAIL,
>  	SCAN_TRUNCATED,
>  	SCAN_PAGE_HAS_PRIVATE,
> +	SCAN_STORE_FAILED,
>  };
>  
>  #define CREATE_TRACE_POINTS
> @@ -1840,6 +1841,15 @@ static int collapse_file(struct mm_struct *mm, unsigned long addr,
>  					goto xa_locked;
>  				}
>  				xas_store(&xas, hpage);
> +				if (xas_error(&xas)) {
> +					/* revert shmem_charge performed
> +					 * in the previous condition
> +					 */
> +					mapping->nrpages--;
> +					shmem_uncharge(mapping->host, 1);
> +					result = SCAN_STORE_FAILED;
> +					goto xa_locked;
> +				}
>  				nr_none++;
>  				continue;
>  			}

Needs this, I assume.

--- a/include/trace/events/huge_memory.h~mm-khugepaged-fix-kernel-bug-in-hpage_collapse_scan_file-fix
+++ a/include/trace/events/huge_memory.h
@@ -36,7 +36,8 @@
 	EM( SCAN_ALLOC_HUGE_PAGE_FAIL,	"alloc_huge_page_failed")	\
 	EM( SCAN_CGROUP_CHARGE_FAIL,	"ccgroup_charge_failed")	\
 	EM( SCAN_TRUNCATED,		"truncated")			\
-	EMe(SCAN_PAGE_HAS_PRIVATE,	"page_has_private")		\
+	EM( SCAN_PAGE_HAS_PRIVATE,	"page_has_private")		\
+	EMe(SCAN_STORE_FAILED,		"store_failed")
 
 #undef EM
 #undef EMe
_

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
