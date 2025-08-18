Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01423271442
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Aug 2025 04:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755493114; cv=none; b=Qm+dZ6HfmKhFzNeQgYevlHuiNMKK7F7z1KfE+4eYy8jX7TM2SbiDpVlKQo9P8eXHmmxVMR83jl4iYiD5eVi4Yl9wSJGTUzgm+qVQCBIJ7Pxh1dSkIq3N1v3mId13/FQB/xsLO6sJ0C9HwLvqjIemIrdGVmCCgbJQ+RwgKQUWmT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755493114; c=relaxed/simple;
	bh=DYiu9Mqu06AQlZtUQwvMaZWULdA5Fh8Dvk0W2Ch3aXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tt7TkzHUryymF0uJ45xjQygQ/o9BM5cRQ2SMzhA5ba4ejwX1ts5qbkf2qzg8FLRSoVrpt5JFdiJYj4bfxvIugXy08kKfZq0VHi1MIHoEBaBHUWoe0+jXAmS0qM6os90bssWc6NG9XuLSCDjYajnXQvumGxNSbhKPQwq7uPYGR1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=qItQqzXP; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="qItQqzXP"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E6EE842A9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Aug 2025 04:58:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.998
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xuxirLhAljIC for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Aug 2025 04:58:32 +0000 (UTC)
X-Greylist: delayed 867 seconds by postgrey-1.37 at util1.osuosl.org; Mon, 18 Aug 2025 04:58:31 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 42621842D7
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none) header.from=infradead.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42621842D7
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qItQqzXP
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+597369eda0ba97e1de7a+8030+infradead.org+hch@bombadil.srs.infradead.org; receiver=<UNKNOWN> 
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 42621842D7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Aug 2025 04:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DYiu9Mqu06AQlZtUQwvMaZWULdA5Fh8Dvk0W2Ch3aXc=; b=qItQqzXPRvvNp0T3RehfczY5E3
	Jb+n/7xuCzoEjT+5a91ggBAc4zpZ1uhX5BrwetBnZmPm1bv++yO0ytDYruWkzIs6je+IbXYG6+x+K
	E8d656y6eROOSPadZehGIyKItcHxo20OCiOIenpd1LE5f5B8v9VAolfdISsqbM7OupbE6TUFpVqkO
	gobRtm+h1lvMiZ3aof5nWLGZHNpXNk1gU3xSve3yWcZlAbtCzW/U2rxtRwelx0ss12M+fhjA+xTpB
	Y3tL+VsJZjDtYBvyc/MzSI26UZZzNG9QQGrLGnNuEUjEPhByJEUwvthvMx51wlm7tqR63PNsdoh6b
	6o7tw1Cw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrku-00000006UkS-2VKK;
	Mon, 18 Aug 2025 04:46:00 +0000
Date: Sun, 17 Aug 2025 21:46:00 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Marcelo Moreira <marcelomoreira1905@gmail.com>
Cc: cem@kernel.org, linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v2] xfs: Replace strncpy with memcpy
Message-ID: <aKKwCKhf4bRy_W4Y@infradead.org>
References: <20250817155053.15856-1-marcelomoreira1905@gmail.com>
 <aKKvjVfm9IPw9UAg@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKKvjVfm9IPw9UAg@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Sun, Aug 17, 2025 at 09:43:57PM -0700, Christoph Hellwig wrote:
> I tried to follow the link, but got a warning about a potential security
> threat because firefox doesn't trust the SSL certificate.

.. and if ignoring that redirects to a site that has the same issue.
I tried this for a few steps but didn't get anywhere even ignoring the
warnings as unlike what the warning claims you are very unlikely to
steal my credit card data by me rading your blog :)

