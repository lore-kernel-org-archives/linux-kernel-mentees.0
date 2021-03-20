Return-Path: <SRS0=sDOq=IS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6208DC433C1
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 20 Mar 2021 16:08:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B832061878
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 20 Mar 2021 16:08:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B832061878
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bombadil.infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7426483A7C;
	Sat, 20 Mar 2021 16:08:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f6HgVT6yKZ3k; Sat, 20 Mar 2021 16:08:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AF6183A7B;
	Sat, 20 Mar 2021 16:08:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3C9F1C000A;
	Sat, 20 Mar 2021 16:08:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 34730C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 16:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F416401D9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 16:08:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Amavis-Alert: BAD HEADER SECTION, Improper folded header field made up
 entirely of whitespace (char 20 hex): X-Spam-Report: ...that system
 for details.  Content previ[...]
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1n4NwJDGi92R
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 16:08:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 49BC1401D7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 16:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:Content-Type:MIME-Version:
 References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=lLZoxS2jnucsow36f/+/xibANjR777Ge9+Ym0kKbvpc=; b=KllN2K/hkTM3EeUXWft/eHxhZU
 KwdnPxKrzdC78hBbNskkRUWhFqjvdw8XdCylXMknUiDffnDK0M2/boumqKHhD4bzvSK/v0GeCfl+K
 wOlEms5d2g+L+Uusz5QPgwzGrQIAlQvu+xzanUZPaqdFwpc2OdFp0v+lnjkek59XpotGtbfQ4dxAy
 1Ozdsm7A6dwvohusQ+uhN2hcft9FnquuM6L/MMQBBUL4f4h5g8pwnrp4yDj3TeUmJXDrv0GxaZISI
 QZ9W7x/yRkJRnUBfZmLbQWpUy1qxtJjxGPR3LzXiZ3fqf2vmSM3Br9J2brTy86EYLNF/qmSvAKOeh
 sXKtWdHw==;
Received: from rdunlap (helo=localhost)
 by bombadil.infradead.org with local-esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lNe94-001vTD-A8; Sat, 20 Mar 2021 16:08:11 +0000
Date: Sat, 20 Mar 2021 09:08:10 -0700 (PDT)
From: Randy Dunlap <rdunlap@bombadil.infradead.org>
To: Aditya Srivastava <yashsri421@gmail.com>
Subject: Re: [PATCH] ecryptfs: fix incorrect kernel-doc comment syntax in files
In-Reply-To: <20210320081551.13954-1-yashsri421@gmail.com>
Message-ID: <731fb5fd-b20-c1e-bfe-276845a9a91@bombadil.infradead.org>
References: <20210320081551.13954-1-yashsri421@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210320_090810_373986_08DFD58B 
X-CRM114-Status: GOOD (  10.26  )
Cc: corbet@lwn.net, ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 code@tyhicks.com, christian.brauner@ubuntu.com,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>



On Sat, 20 Mar 2021, Aditya Srivastava wrote:

> The opening comment mark '/**' is used for kernel-doc comments.
> There are files in fs/encrypts which follows this syntax, but the content
> inside does not comply with kernel-doc.
> This causes unexpected warnings from kernel-doc.
>
> E.g., header comment for fs/ecryptfs/dentry.c follows kernel-doc syntax
> for comments(i.e., '/**'), but the content inside does not.
>
> Running kernel-doc -none on fs/ecryptfs/dentry.c causes these
> unexpected warnings:
> "warning: Incorrect use of kernel-doc format:  * ecryptfs_d_revalidate - revalidate an ecryptfs dentry"
> "warning: Function parameter or member 'dentry' not described in 'ecryptfs_d_revalidate'"
> "warning: Function parameter or member 'flags' not described in 'ecryptfs_d_revalidate'"
> "warning: expecting prototype for eCryptfs(). Prototype was for ecryptfs_d_revalidate() instead"
>
> Similarly for other files too.
>
> Provide a simple fix by replacing such occurrences with general comment
> format, i.e. '/*', to prevent kernel-doc from parsing it.
>
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> * Applies perfectly on next-20210312
>
> fs/ecryptfs/crypto.c          |  2 +-
> fs/ecryptfs/debug.c           |  2 +-
> fs/ecryptfs/dentry.c          |  2 +-
> fs/ecryptfs/ecryptfs_kernel.h |  2 +-
> fs/ecryptfs/file.c            |  2 +-
> fs/ecryptfs/inode.c           |  2 +-
> fs/ecryptfs/keystore.c        |  6 +++---
> fs/ecryptfs/kthread.c         |  2 +-
> fs/ecryptfs/main.c            | 10 +++++-----
> fs/ecryptfs/messaging.c       |  2 +-
> fs/ecryptfs/miscdev.c         |  2 +-
> fs/ecryptfs/mmap.c            |  6 +++---
> fs/ecryptfs/read_write.c      |  2 +-
> fs/ecryptfs/super.c           |  2 +-
> 14 files changed, 22 insertions(+), 22 deletions(-)
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
