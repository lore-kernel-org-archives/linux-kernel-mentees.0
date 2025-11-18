Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E932D531;
	Tue, 18 Nov 2025 12:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763470564; cv=none; b=LC42L13OVroPS0+Upz7xF+OOItVX+3zHtY2PEeMavTrGDXaG7RFaZr3WWyX210ld8XqQFgBIlLFQgbYkp0XB8pH40ULwYdSww8oA6kpPSxISPgMY6OkLxrpNjxETuOqvUY/w/ZMTDu3KGUqgZ5j+jtnCeU6KSeI9E3hDCKfPI+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763470564; c=relaxed/simple;
	bh=7E1d1GKG8Mn2da/vkipoPU2v5+gS0lNiqIcc16vR3lo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ej8DKGwu6+Fs9oTTlD2XzUJBvu59v/TIyoKKZ6fkt1bkjCW0nf4Af2rg73BaRloWUY3miVt0I85x9SS6R3OvPENwgps33TA/erJpStRzY73gj8OImX8cyMBrLL5XXjbf81cGWYLhZvArHtmG2viqKj3K/UzoLnA7z77kuRLhF/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=G9T+jZSG; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="G9T+jZSG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZUndLiRuj8VVDQpGylc0ouZ9CH3E0910nA/n2o+vuEo=; b=G9T+jZSGmN2RpYit1OqCM6L1Is
	EnIgIp4P+aq7z2k/XbFrerQkkzdPKcMkX6oD1q+p6/UaSVDsYLWJHQrilJ4HyeK5jUS3ptbpOncmq
	F5mXJmRmVnKx9Y646K6Iv9vOh29j8bxtXwemJAS1hvnslqoYIE/b/4l9OrvlBDcW9ogTelDKZtA72
	7ZkOoRu0tbJ4AygUZ4GIVWaBYDPhzhAL5NmIBwJ2kOFWuzQ1eBsaCZSPB+w7jTajQzGdGDU0oB78D
	ry/+M8SiSBIlI8y6GyD4fdfnRBxeZYkMRBlzx83EVzFgtKLSsA3tTctQHzb0aa7znpoRuFOlvWy3s
	xNzus25A==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLLFZ-00000000RiH-0tvq;
	Tue, 18 Nov 2025 12:56:01 +0000
Date: Tue, 18 Nov 2025 04:56:01 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Christoph Hellwig <hch@infradead.org>,
	SHAURYA RANE <ssrane_b23@ee.vjti.ac.in>, akpm@linux-foundation.org,
	shakeel.butt@linux.dev, eddyz87@gmail.com, andrii@kernel.org,
	ast@kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
	khalid@kernel.org,
	syzbot+09b7d050e4806540153d@syzkaller.appspotmail.com
Subject: Re: [PATCH] mm/filemap: fix NULL pointer dereference in
 do_read_cache_folio()
Message-ID: <aRxs4djsaELyeBf9@infradead.org>
References: <20251114193729.251892-1-ssranevjti@gmail.com>
 <aReUv1kVACh3UKv-@casper.infradead.org>
 <CANNWa07Y_GPKuYNQ0ncWHGa4KX91QFosz6WGJ9P6-AJQniD3zw@mail.gmail.com>
 <aRpQ7LTZDP-Xz-Sr@casper.infradead.org>
 <aRv-jfh0WkVZLd_d@infradead.org>
 <aRxr5l-usmPvenbM@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aRxr5l-usmPvenbM@casper.infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Tue, Nov 18, 2025 at 12:51:50PM +0000, Matthew Wilcox wrote:
> Please read the rest of the thread; this code can be called in contexts
> that can't block.  That was why I proposed the kiocb_read() refactoring
> that I would expect you to have an opinion on.

Doing file reads from context that can't block is just broken.  Let's
just kill the code before it causes more harm.
