Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4E126AAB6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Aug 2025 04:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755493143; cv=none; b=Z6VdeahFLSO/aPbFTT/YMy6/guZTl2aERNM+qNtl+U5OcUHTdFCtcZcip7iaaretIVwUkxGQBJxiD5OHlvyerFwZ53orjgkveE5TCJaQ6lk1ybCSGtxrHx4iHUvpnMK3kBb5gj4hEEBy+JAZHGrpQ4doJyydrgOPbWaYmNIY/8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755493143; c=relaxed/simple;
	bh=80kJvy07dW4KaqD/Q0pkwPLz7ZxqGJbsohCUNiX8eJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aTU+S/JJRRu/VAOHF2/pjYBgDaUV9vmFmWtinPP1FAHFkUpV5rwp0GdMrfvX6/+TXQlre0tUi3ZVpIxZToF0mmDNJQHEoUG68abW6cK35B8aWQxzWVXau7Im4dPao+KF2LGzVVzpUF65+bjeLumW/40MiSwOz8o7osFXL4b642w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=SqhO44r2; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="SqhO44r2"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2063C41972
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Aug 2025 04:59:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.398
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 040p3nYh7j7p for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Aug 2025 04:59:01 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+597369eda0ba97e1de7a+8030+infradead.org+hch@bombadil.srs.infradead.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 07FD94196F
Authentication-Results: smtp4.osuosl.org; dmarc=none (p=none dis=none) header.from=infradead.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07FD94196F
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SqhO44r2
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 07FD94196F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Aug 2025 04:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=k2Shf7AnNNnzE2815C58OfEvJwWhlSkhMmIH+MwrRqo=; b=SqhO44r2LZ03EJTg8Jsrb72RGf
	tj8C8/ac7vtcDLeKgfciPiufRq7fU+BsS+wSAYCecj7km/uIA5bbLwiHB346VJKfQcLtnCvccLhrL
	oZhfQy0yyqsxhKtpWcVdanFPzdkPC52qKlcU8vFmK0h8SG4XHLW2g36m5ZyZzs8Hu23dlZRT0rDLV
	AViO9Ol1UA5H2ARq1FseXnnlnnOJWuzENhvZLlYpDMYRBHhD31GQq+eSHlgbNr5RuF1vyt6O8kUwy
	a9Yk97Vm6kMAqweNdCg8o3rBd5+DSSEB6VPIQO3qViiVgJiMm779inIpjq7AYjRFa6QVQ2REA2D/e
	O4XyNEcg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unriv-00000006USp-1lBr;
	Mon, 18 Aug 2025 04:43:57 +0000
Date: Sun, 17 Aug 2025 21:43:57 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Marcelo Moreira <marcelomoreira1905@gmail.com>
Cc: cem@kernel.org, linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v2] xfs: Replace strncpy with memcpy
Message-ID: <aKKvjVfm9IPw9UAg@infradead.org>
References: <20250817155053.15856-1-marcelomoreira1905@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250817155053.15856-1-marcelomoreira1905@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Sun, Aug 17, 2025 at 12:50:41PM -0300, Marcelo Moreira wrote:
> Following a suggestion from Dave and everyone who contributed to v1, this
> changes modernizes the code by aligning it with current kernel best practices.
> It improves code clarity and consistency, as strncpy is deprecated as explained
> in Documentation/process/deprecated.rst. Furthermore, this change was tested
> by xfstests and as it was not an easy task I decided to document on my blog
> the step by step of how I did it https://meritissimo1.com/blog/2-xfs-tests :).

I tried to follow the link, but got a warning about a potential security
threat because firefox doesn't trust the SSL certificate.  But maybe you
can add what you wrote up to the xfstests README or a new file linked
from it to help everyone using it first time?

Either way this probably shouldn't be in this kernel commit log.

The change itself looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
