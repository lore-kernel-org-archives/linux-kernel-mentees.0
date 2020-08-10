Return-Path: <SRS0=Vbn0=BU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C5E5C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Aug 2020 18:42:04 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28C9122B4E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Aug 2020 18:42:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="qljNspzF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28C9122B4E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id EEDAB875A2;
	Mon, 10 Aug 2020 18:42:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H3aYQR0alVnd; Mon, 10 Aug 2020 18:42:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 99B81860D5;
	Mon, 10 Aug 2020 18:42:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7DBEAC013C;
	Mon, 10 Aug 2020 18:42:02 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 54CC6C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 18:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 50D5A879B8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 18:42:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TBTTbphbrFgJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 18:41:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5F9038797A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 18:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Bg4wvYCFgi2LJkMB+zazI0Hb6qHpqkIiplriJYhyPmc=; b=qljNspzFLEaIRvIDjm9Uo01u4F
 OvUHxPOY5yUkahjC53iyj0bEiTUjIkwcF4b6kAnx5vJmjO/YM8ZMH8CGiMPSM5JiNmt/BnWtjnm6M
 LW647o5GKDA7C3wdgao3k8bAkVcFv9f0RJIrN+qBOyWw6XRKWQxCFAzW4IG4/DGeJ2ix9+cPWvuYi
 WkpzYDTTOTnxlkxXIfpjBu20/B91RRBXYQoxfAx0tBqmNNnNGWtIcjX9ZQWKRIvh9rRh9jiWdSWEs
 RPr9dKvx3FDMXGCnsq6s43c4nsf2tmODQe0+YsJkiUQ/8r4JsBYIH12s3r9N1v2uHgfhiODSpHWff
 td2vRrfg==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1k5Ck5-0008MI-Vu; Mon, 10 Aug 2020 18:41:54 +0000
Date: Mon, 10 Aug 2020 19:41:53 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Puranjay Mohan <puranjay12@gmail.com>
Message-ID: <20200810184153.GN17456@casper.infradead.org>
References: <20200810183019.22170-1-puranjay12@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200810183019.22170-1-puranjay12@gmail.com>
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>
Subject: Re: [Linux-kernel-mentees] [PATCH] Core-api: Documentation: Replace
 deprecated :c:func: Usage
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

On Tue, Aug 11, 2020 at 12:00:19AM +0530, Puranjay Mohan wrote:
> Replace :c:func: with func() as the previous usage is deprecated.
> 
> Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>

Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Jon, I'm comfortable with you merging this through the docs tree.
Looks like we also need:

+++ b/MAINTAINERS
@@ -18686,6 +18686,7 @@ XARRAY
 M:     Matthew Wilcox <willy@infradead.org>
 L:     linux-fsdevel@vger.kernel.org
 S:     Supported
+F:     Documentation/core-api/idr.rst
 F:     Documentation/core-api/xarray.rst
 F:     include/linux/idr.h
 F:     include/linux/xarray.h

but i can do that in the xarray tree.

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
