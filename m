Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BFDC88CB2
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 25 Aug 2023 02:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27A21834E3;
	Fri, 25 Aug 2023 02:12:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27A21834E3
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=ZXvSVtmT
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XbAWCQgqmP5Z; Fri, 25 Aug 2023 02:12:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A33D9834CB;
	Fri, 25 Aug 2023 02:12:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A33D9834CB
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6D9D5C0071;
	Fri, 25 Aug 2023 02:12:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AC006C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Aug 2023 02:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 78178834E3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Aug 2023 02:12:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78178834E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VbLOgQy3Y3J6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Aug 2023 02:12:44 +0000 (UTC)
X-Greylist: delayed 967 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 25 Aug 2023 02:12:43 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7FFF834CB
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C7FFF834CB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Aug 2023 02:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=zGOmB18RB1OY5AGgTsleumk2XgvNgUMI8iEL9xumJk0=; b=ZXvSVtmTyf6k6h6o4XNApeq6M/
 d4w7hC/lTkT+pCjDE23uFVXoFt69E9bn5T2kuJWhbfLFk/1mAwKyhPUxu4OQJX3ytUHtTxfxN1enb
 bRBjaWDq0jfSeENUAyqpL/Sju4/HAHtemBgg5p2Dy76FRoPv4gk+OYJhVwMLCz2nAztWGiTIGy/6u
 Isf1Hjh2oxdnb/g1jGj54l64m4odwRujObylUra0tMDRPbqM93afXB5PkefPcVWxrX1Oj4cjuWit+
 JIj+K8V0NiFUXOVGbGAndfMUWrX6w2b8i0dD14T4rI/UijI7zLCtPiVjXsgvw9MJbbgtH5g5rc9qu
 jmG95iFg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1qZM3o-00EMuv-Hq; Fri, 25 Aug 2023 01:56:28 +0000
Date: Fri, 25 Aug 2023 02:56:28 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Atul Raut <rauji.raut@gmail.com>
Subject: Re: pagevec: Fix array-index-out-of-bounds error
Message-ID: <ZOgKTO612u1Fn7PB@casper.infradead.org>
References: <20230825001720.19101-1-rauji.raut@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230825001720.19101-1-rauji.raut@gmail.com>
Cc: linux-fsdevel@vger.kernel.org,
 syzbot+e295147e14b474e4ad70@syzkaller.appspotmail.com,
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

On Thu, Aug 24, 2023 at 05:17:21PM -0700, Atul Raut wrote:
>  ntfs_evict_inode+0x20/0x48 fs/ntfs3/inode.c:1790

No.  This is your clue.  ntfs corrupts memory.  You can't take bug
reports involving ntfs seriously.  Ignore everything tagged with ntfs.

> In folio_batch_add, which contains folios rather
> than fixed-size pages, there is a chance that the
> array index will fall outside of bounds.
> Before adding folios, examine the available space to fix.

This is definitely the wrong fix.

>  static inline unsigned folio_batch_add(struct folio_batch *fbatch,
>  		struct folio *folio)
>  {
> -	fbatch->folios[fbatch->nr++] = folio;
> +	if (folio_batch_space(fbatch))
> +		fbatch->folios[fbatch->nr++] = folio;

Did you look at what folio_batch_space() actually does?

static inline unsigned int folio_batch_space(struct folio_batch *fbatch)
{
        return PAGEVEC_SIZE - fbatch->nr;
}

So if fbatch->nr is 255, what will it return?  How will
folio_batch_add() behave?

The right way to fix this problem is to find the data corrupter in NTFS.
You can't "fix" it anywhere else.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
