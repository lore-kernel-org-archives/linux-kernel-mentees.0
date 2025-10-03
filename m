Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18882D47EA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  3 Oct 2025 09:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759483384; cv=none; b=qWpNH3mm1SjEf1+kHvwMs/2SS0wf2D6Z/9Vz06p3/b5L6fhq7zPpI8T87YxYVopO85+nq0eRGulL6TWSB/2uCni9e1Yp+ih4amE8dIhGwdMzoVStIREnUhjriz9anrXvi2Bdd0mfeXQYvHTnH9g2q5vzOifW9ZHrRwkLH5ZiaT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759483384; c=relaxed/simple;
	bh=gZlFWVR4yYekU834mJQpAfE/pKy24RTUeR8qbrDbZDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h52iL7lSE9VCLe7Pk39GSEwp9KTYo1hbVpL5UOuyjBu8s9+EVfL+f7CHtULn+EN5gc2b2uz51PB397Zez2wqRLXpfy36Tk5Uy9cAnPFH8XcGHWijqEarsHYWl49VJxu8+rqHtsSN3DDjleIXWNvfZegYxuy4ey0wXoOYAYedSYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UKOphzEt; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UKOphzEt"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 442BB81192
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  3 Oct 2025 09:23:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2bTI-dmo2X4j for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Oct 2025 09:23:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=horms@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 70B9480FB3
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70B9480FB3
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UKOphzEt
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 70B9480FB3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  3 Oct 2025 09:23:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1D4FC43697;
	Fri,  3 Oct 2025 09:23:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1163C4CEF9;
	Fri,  3 Oct 2025 09:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759483381;
	bh=gZlFWVR4yYekU834mJQpAfE/pKy24RTUeR8qbrDbZDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UKOphzEtVKQjUdhiK2e35HMlXBAacZxK0ccc+wNJdPAT4DZhGBcK0mxXpF17ti9nI
	 V/K0z5sClhu2RyDE4zU4MmGCGwgo5EMh5+RqQJfhC++3Ao2O7+lPOD5CNLzCIojXKi
	 Lp1PxyDtDkaOM2otSnRRcAlxK678tfsvrIZvu+KgveeCfFefXVlpVXyA3Ko7rZEH32
	 bQh+ENCw1PIqwOuo28wRVEJbEBcKUUTXuv9XMfW4XqNoVcJeMZ9+F8kLDkMxB/TVUS
	 JUGqjoEV62yThLUHhROuJ8midCth3DA+vLCWNuVSrIq3tL6wOaG+q+t7kyvrVlxkFd
	 A/SpfZDMjii2g==
Date: Fri, 3 Oct 2025 10:22:56 +0100
From: Simon Horman <horms@kernel.org>
To: Erick Karanja <karanja99erick@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	david.hunter.linux@gmail.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: fsl_pq_mdio: Fix device node reference leak in
 fsl_pq_mdio_probe
Message-ID: <20251003092256.GB2971550@horms.kernel.org>
References: <20251002174617.960521-1-karanja99erick@gmail.com>
 <20251003073324.GA2878334@horms.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251003073324.GA2878334@horms.kernel.org>

On Fri, Oct 03, 2025 at 08:33:24AM +0100, Simon Horman wrote:
> On Thu, Oct 02, 2025 at 08:46:17PM +0300, Erick Karanja wrote:
> > Add missing of_node_put call to release device node tbi obtained
> > via for_each_child_of_node.
> > 
> > Fixes: afae5ad78b342 ("net/fsl_pq_mdio: streamline probing of MDIO nodes")
> 
> nit: no blank line here
> 
> Slightly more importantly, although the code you are changing
> was added by the cited commit, I think that the bug existed before then.
> I wonder if the fixes tag should be.
> 
> Fixes: daa26ea63c6f ("Merge branch 'octeontx2-fix-bitmap-leaks-in-pf-and-vf'")

Sorry the above is obviously bogus.
I should have said:

Fixes: 1577ecef7666 ("netdev: Merge UCC and gianfar MDIO bus drivers")

> 
> > 
> > Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
> 
> One minor comment on process: as a fix for networking code, most likely this
> should be targeted at the net tree. And that should be denoted in the
> subject like this:
> 
> Subject: [PATCH net] ...
> 
> And if you do post an updated version, which is probably not strictly
> necessary, please be sure to observe the 24h rule.
> 
> See: https://docs.kernel.org/process/maintainer-netdev.html
> 
> The code changes themselves look good to me. Thanks.
> 
> Reviewed-by: Simon Horman <horms@kernel.org>
> 
> ...
> 
