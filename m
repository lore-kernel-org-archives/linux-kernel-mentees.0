Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075A42E3382
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  3 Apr 2025 04:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743654856; cv=none; b=AaMY6PT9sy4AMc8l2BSw5opl6xwNDZsxCqrfAdjl/oBk2n3/gPtYK4EgAxLf17tLeGEKCceeSeXDdJEmh6B86123uS7jnMVOszczYjTgWn0ZfeFdCktUEkpEau5CQvhY4RkDE8n64tD7zpKBGY5KxNdCqDfVdMCdyDwnNozE0Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743654856; c=relaxed/simple;
	bh=Jzhx/Ra49nXZERagmh0jTbdeVj7hvjbo/W6UXhYNDJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X4awyaIIWyWjBbOpoA1q0vyIEwcql/A3xgYaq67KD0vIJc/gbbBZy97k4wVblwFh0/YCijGBVXkc9ciWf6wvJdJE5PHN1MHYShA8CZ1zVRMM2gZyPwf3TJkVo1VNVKxMpsF2A6vsX/+vRs3rYDqTpvTJJBstBivJETrYh0YcjJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9298560718
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  3 Apr 2025 04:34:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.591
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lyLeOv9wek-s for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Apr 2025 04:34:13 +0000 (UTC)
X-Greylist: delayed 390 seconds by postgrey-1.37 at util1.osuosl.org; Thu, 03 Apr 2025 04:34:13 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 719EC60656
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=lst.de
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 719EC60656
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de; receiver=<UNKNOWN> 
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 719EC60656
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  3 Apr 2025 04:34:13 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 1928868C7B; Thu,  3 Apr 2025 06:27:38 +0200 (CEST)
Date: Thu, 3 Apr 2025 06:27:37 +0200
From: Christoph Hellwig <hch@lst.de>
To: Marcelo Moreira <marcelomoreira1905@gmail.com>
Cc: linux-nvme@lists.infradead.org, hch@lst.de, sagi@grimberg.me,
	kch@nvidia.com, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: Re: [PATCH] nvmet: replace strncpy with strscpy
Message-ID: <20250403042737.GE22360@lst.de>
References: <20250401004748.29172-1-marcelomoreira1905@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401004748.29172-1-marcelomoreira1905@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Mar 31, 2025 at 09:47:28PM -0300, Marcelo Moreira wrote:
> strncpy() is deprecated due to its lack of NULL-termination
> guarantees and unnecessary zero-padding of the destination buffer.
> Use strscpy() instead.

Nothing explains here why it is deprecated and why the replacement
is better.  And why using memcpy or a seq_buf wasn't considered.

> Link: https://github.com/KSPP/linux/issues/90

And these kinds of links are actively harmful as the point a
commercial entity that can be taken down or changed at any time.
Don't do that.

