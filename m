Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08F91534E6
	for <Linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 29 Jan 2024 14:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706540154; cv=none; b=f4fms1yHSJh3ii1rVAiC16Hf3lFq8oSvcr5dVucI3iyWXCvwfi8vs+OQ70hyPo7QTHFxkAeiTtm+FQjCNCOFrtwcAB30C7JgRDtb1bGBzrv5X0GXZEsEY7jaRLQfhG82m5xMWr7+dziDcQGGpuDoRZZqiEXVnwlcj1RQZBpIrZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706540154; c=relaxed/simple;
	bh=xfUiB8wvjyFX013Mv3QWb1yK6cu/K8yFkVaHWgxs+ZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LRbRwGqfWG+Oi7TnEt7KibDYmvJfQ/blSKNmaYd48qz7kallUl1GOac300EY77MSoebAnlqnII/of4av/UZ7HzcU1LfGIuOtYC7cpqgH78fLjfxpQfmr9gcgyTszvXJa0hqJrMN0xakrSyqJX/sKNYwUau9jVyciSjIKXV08x7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=cLKcFRaK; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="cLKcFRaK"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24A5F60D78
	for <Linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 29 Jan 2024 14:55:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24A5F60D78
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=cLKcFRaK
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.398
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W5GKwTcq-p9w
	for <Linux-kernel-mentees@lists.linuxfoundation.org>;
	Mon, 29 Jan 2024 14:55:52 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 0C32F60A67
	for <Linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 29 Jan 2024 14:55:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C32F60A67
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TrkooSyhdXbj7EF1JaDzY488CLjZJ3kn1skh2fGPgEo=; b=cLKcFRaKqigr4dZ0QaOE1HnMHu
	RemHrAs+ZoXxi+b9GuSiAyclCHERfe+jOpQlxnElBP42XDW1E1h+zG2etAi54e7Yt1orheef5V/Pp
	m7XXzg5Yqgn/dWiEeC3TeXM5UeWkt6Ma6ma+ir/QqXeqa24fcBf2nTWdnwHZV9yXJl0AR+vFnarI7
	Jc+fiesQrKk6m6315E/j+BHS3zIZ98Qewyd6vlJMBO33LLewhzCC98g/fRVJOJJZBn6Kq5ToKbrNX
	hoDLClS4PbRzr5Hc9exJTDD3UKE4XVRibaeNgf0s50jL9ucAmtejtZHRue2xUGBknUxO+vP6wJizq
	VVVhHQNw==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUT35-00000006uAF-1ms1;
	Mon, 29 Jan 2024 14:55:47 +0000
Date: Mon, 29 Jan 2024 14:55:47 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Dave Kleikamp <dave.kleikamp@oracle.com>
Cc: Manas Ghandat <ghandatmanas@gmail.com>,
	Linux-kernel-mentees@lists.linuxfoundation.org,
	jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org,
	syzbot+411debe54d318eaed386@syzkaller.appspotmail.com,
	Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH] jfs: fix shift-out-of-bounds in dbJoin
Message-ID: <Zbe8c_CPNP8IdphB@casper.infradead.org>
References: <20231011143937.31996-1-ghandatmanas@gmail.com>
 <Zba9zRWq6rZhWn-p@casper.infradead.org>
 <a25c75af-c961-4ca6-9810-dbcfe64753d5@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a25c75af-c961-4ca6-9810-dbcfe64753d5@oracle.com>

On Mon, Jan 29, 2024 at 08:39:18AM -0600, Dave Kleikamp wrote:
> On 1/28/24 2:49PM, Matthew Wilcox wrote:
> > On Wed, Oct 11, 2023 at 08:09:37PM +0530, Manas Ghandat wrote:
> > > Currently while joining the leaf in a buddy system there is shift out
> > > of bound error in calculation of BUDSIZE. Added the required check
> > > to the BUDSIZE and fixed the documentation as well.
> > 
> > This patch causes xfstests to fail frequently.  The one this trace is
> > from was generic/074.
> 
> Thanks for catching this. The sanity test is not right, so we need to revert
> that one.

Unfortunately, my overnight test run with this patch reverted crashed
again with the same signature.  I also reverted the parent commit,
and when that crashed I also reverted the parent of that.  Which also
crashed.

So maybe there's something else that makes this unstable.  Or maybe my
bisect went wrong.  Or _something_.  Anyway, I'm going to spend much of
today hammering on generic/074 with various kernel versions and see what
I can deduce.

So far I see no evidence that v6.7 crashes with g/074.  And I know that
next-20240125 does crash with g/074.  I'm pretty sure that v6.8-rc1 also
crashes with g/074, but will confirm that.
