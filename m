Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A223242D76
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 08:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755766041; cv=none; b=RkIYhVX9IKqyOAPCAxsQbNKlmyoZfYFQhvCoXNOsXX9y5D9mjl5URSpTfxTJN1QEmrgSqh4EyPNSwh1qtmmfr+fCkFa0ckl6u2WfIrIiagBK3ORmuAC32wEIACVyvAPbtZWfFkFbaT7sqcpnkI1immW9AF5RI94IFU7hEX0wEUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755766041; c=relaxed/simple;
	bh=DlYEcUJLsw/MqzOBv72trID2YohXF6ThfaQqc5nFqts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oT9ugZy8qzlFvEUYOoWuwY1hvcvf7VAtmjX8FZ2mBg69T78IbQL5jQIe7qqJIQEgTBbHT+skz8Ru08QTsH36UJhT5ruGMvkvCPsll8aXH0FScyUIWbRIG13qUZX+Bknq+hEToEK2zF8pG8ECFAvTaK+dFBIgBsMXA9h/UCzTJf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=fWENBFe1; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fWENBFe1"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF38440C98
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 08:47:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.398
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UExqAwCBCNav for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Aug 2025 08:47:19 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+60ceb029d8b5ee12084a+8033+infradead.org+hch@bombadil.srs.infradead.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7D30F40C26
Authentication-Results: smtp2.osuosl.org; dmarc=none (p=none dis=none) header.from=infradead.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D30F40C26
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fWENBFe1
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7D30F40C26
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 08:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Mh/S+h5QxhKEbHlGF8hYN24btVqVDLaiV8YcyYE/644=; b=fWENBFe16pOMAhbCXyM4DqUIOF
	LlAtLPM1aQ6DWsawNjzJJIq/HjYEDZaa5jG118IDy9XyDkq52D3hXO3yUADzBInVISrmSGKgt9ner
	8urb+gAVKzFR/aqOUdbgGUrEa+natlf0ipzLq7ypJ3jsVnefg1pezXki4J7QYwBlQoIxoDjYNq/2L
	noSpdE6KVIHt+APXXujuDDZg8sL3Y3aohkPigYeU7o8VZ2Q+a/Zo5t8Rm4x/PK2wx1Tv0JERXbG0I
	D6d4pwx6PmPZq+0v3r0aRVz9Ne96/vQUOKZlzbfIZQjKqzCknxzBnXnC21lwvFDnmjWdZltyv5+za
	dkrketpg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up0x2-0000000GIiw-1acc;
	Thu, 21 Aug 2025 08:47:16 +0000
Date: Thu, 21 Aug 2025 01:47:16 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Marcelo Moreira <marcelomoreira1905@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>, cem@kernel.org,
	linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v2] xfs: Replace strncpy with memcpy
Message-ID: <aKbdFONDSYp0FxSg@infradead.org>
References: <20250817155053.15856-1-marcelomoreira1905@gmail.com>
 <aKKvjVfm9IPw9UAg@infradead.org>
 <CAPZ3m_g+KcJt_wxBjdmvyW+FqXAcEfVDUuHkp8iZ6XiUZ+6x-w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPZ3m_g+KcJt_wxBjdmvyW+FqXAcEfVDUuHkp8iZ6XiUZ+6x-w@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Wed, Aug 20, 2025 at 10:47:17AM -0300, Marcelo Moreira wrote:
> Hmm, I've sent the same link to other people, and none of them
> reported any issues with the SSL certificate. In my case, I'm using
> Let's Encrypt. It could be an outdated certificate in your Firefox.

Turns out I was connect to a corporate VPN which had some man in the
middle thing checking for "bad" websites, and they somehow considered
your bad, and their redirection didn't work.  Sorry for the blame :)

> Regarding sending it to the official xfstests README, it would be a
> good idea! If anyone here is involved in the xfstests project and
> thinks the post is good, I can send it to the official README :D

I think for the README itself it's probably a bit too specific.
But I'd love adding it as a new HOWTO file linked from README.

