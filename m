Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76D5159574
	for <Linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 29 Jan 2024 22:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706566409; cv=none; b=nKByP42nsZ2NLvJPne8CvkhTEzvP3zPfl4Cu+YN/kFZgsCgj26U6RWz8p+BqBq2MvaCsXBxtUhJp3bT59SKE8aG3DQAdusY/hfa8iy1fi2Kw8lwwXvqorz6oW5SHwUfLDxx4t6VgylnfkdIigHygXzjvLVWe9ZhXjJHV74PYKsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706566409; c=relaxed/simple;
	bh=+UBZjeypPym8/ohCgDx7XPk3dKBYj0DKy9qt8tmB0c8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mgFPWhzejKNtxjTxTVybskbRLMULPHqvSPdJQ5cuSLG9g4xXgPrEEP2NHOjVRHjXx9dwaSy6Peano3YbLmIuLiAcZxWQQFH5dbCT2elsbe4817pCH7CCXOL4XZAZjruTanW/DKg1exakKjvlhiwXxHBU8GQj0hp+fGFCmS993Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=mFuXXzit; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mFuXXzit"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C2DB80ECA
	for <Linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 29 Jan 2024 22:13:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C2DB80ECA
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=mFuXXzit
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.398
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d1u6_dqoiz0z
	for <Linux-kernel-mentees@lists.linuxfoundation.org>;
	Mon, 29 Jan 2024 22:13:24 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7DB2580E3E
	for <Linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 29 Jan 2024 22:13:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DB2580E3E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JCXBqSej7X9xmvzctrfkV79cun5I2fkyVI7US30JjdE=; b=mFuXXzitjEl/D4S9MwNvPSNvyP
	4Zh9bQ56Tivc6zdM3tycSmZ40z9HLNru8T8m8ZVEDTGHaJiA9wgXMvBl0c9B/SVlY+zCehUbpIH+n
	GgiIAVCSy5ViY3Qez4hJx2+cZB3bPhngceltE5+kzpWf8EpnXvfTu4uih72uTFCcKqkLOHM+FWY4e
	bQSzjnjiiXu0xmKfhzDFZ+hUALCv9fKZ696W1uj8eZQW/QgQmv9SdBGUtT2Ex7nmh2D6u3NDcUvvD
	9pDr27IRWQlHXdaSRd9HUyvHK8THCcXGvImArL4HtmDtlJgsbyZ1jfIijH4rkNA3KKOHpOSbtpXNd
	4y41i2Fg==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUZsW-000000080xV-08D6;
	Mon, 29 Jan 2024 22:13:20 +0000
Date: Mon, 29 Jan 2024 22:13:19 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Dave Kleikamp <dave.kleikamp@oracle.com>
Cc: Manas Ghandat <ghandatmanas@gmail.com>,
	Linux-kernel-mentees@lists.linuxfoundation.org,
	jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org,
	syzbot+411debe54d318eaed386@syzkaller.appspotmail.com,
	Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH] jfs: fix shift-out-of-bounds in dbJoin
Message-ID: <Zbgi_3MyT0rL7oZs@casper.infradead.org>
References: <20231011143937.31996-1-ghandatmanas@gmail.com>
 <Zba9zRWq6rZhWn-p@casper.infradead.org>
 <a25c75af-c961-4ca6-9810-dbcfe64753d5@oracle.com>
 <Zbe8c_CPNP8IdphB@casper.infradead.org>
 <551e1e86-f990-487a-ad88-53799df0882a@oracle.com>
 <ZbfumG4uLUwZkzlf@casper.infradead.org>
 <37af8f84-98bc-4733-bd9c-102b62fdd028@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37af8f84-98bc-4733-bd9c-102b62fdd028@oracle.com>

On Mon, Jan 29, 2024 at 03:17:27PM -0600, Dave Kleikamp wrote:
> On 1/29/24 12:29PM, Matthew Wilcox wrote:
> > On Mon, Jan 29, 2024 at 09:00:56AM -0600, Dave Kleikamp wrote:
> > > On 1/29/24 8:55AM, Matthew Wilcox wrote:
> > > > On Mon, Jan 29, 2024 at 08:39:18AM -0600, Dave Kleikamp wrote:
> > > > > On 1/28/24 2:49PM, Matthew Wilcox wrote:
> > > > > > On Wed, Oct 11, 2023 at 08:09:37PM +0530, Manas Ghandat wrote:
> > > > > > > Currently while joining the leaf in a buddy system there is shift out
> > > > > > > of bound error in calculation of BUDSIZE. Added the required check
> > > > > > > to the BUDSIZE and fixed the documentation as well.
> > > > > > 
> > > > > > This patch causes xfstests to fail frequently.  The one this trace is
> > > > > > from was generic/074.
> > > > > 
> > > > > Thanks for catching this. The sanity test is not right, so we need to revert
> > > > > that one.
> > > > 
> > > > Unfortunately, my overnight test run with this patch reverted crashed
> > > > again with the same signature.  I also reverted the parent commit,
> > > > and when that crashed I also reverted the parent of that.  Which also
> > > > crashed.
> > > > 
> > > > So maybe there's something else that makes this unstable.  Or maybe my
> > > > bisect went wrong.  Or _something_.  Anyway, I'm going to spend much of
> > > > today hammering on generic/074 with various kernel versions and see what
> > > > I can deduce.
> > > > 
> > > > So far I see no evidence that v6.7 crashes with g/074.  And I know that
> > > > next-20240125 does crash with g/074.  I'm pretty sure that v6.8-rc1 also
> > > > crashes with g/074, but will confirm that.
> > > 
> > > I'll try to beat on it too and see what I find.
> > > 
> > > Sasha, maybe hold up on to all the jfs patches for the time being.
> > 
> > I have it reproducing easily on cca974daeb6c.  I ran it a lot on
> > e0e1958f4c36 and have not reproduced it.  So I'm going back to my
> > earlier assertion that cca974daeb6c is bad.  Now, maybe other commits
> > are also bad?
> 
> I was able to reproduce it too, but not after reverting that one. I believe
> it is the only one causing problems.
> 
> I only asked Sasha to hold the other ones as a precaution until we were more
> confident that this one was the problem.

I can't reproduce any problem with v6.8-rc1 + this one reverted.
So I'm not sure what my overnight soak test found.  I'll try a few other
things ...
