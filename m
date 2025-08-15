Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458E8293C42
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 Aug 2025 06:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755238860; cv=none; b=MhoyNdDmutXzcJN0VeMAsSI/WbsWeCYWzJJb+mr+MI0s6pgbXnfFrNmrvBwDJ2J1ZQfhkKMq8Fm/NdcgNr7NZLHzOX5/jimEVgzcg8XiV6pjD9rAn/s2Bx/V1NvXZusltqioIezul+Ey5snILqKld4FNbc3L+Fyf6MrzPnyhEq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755238860; c=relaxed/simple;
	bh=qKWRkm37hVBPKiByb3llVWhtPN5gfJ3uWzGw9QoP1z0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WWR38krG/e0qOpF+Yt5bKrK1cCeH/Jaun7ikt+dRGR99+itMHJXjxIsikG3zbgfh6Mh5JUmRChXyv7tiINijBOrLix+CBGfb/b1srSI6BidoEqbhBLgB/xZpzIQlyrsZugWYyvXZ49HbvNUFUzvna/ZAyCCMTbZ8lx6HGrcZ8ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D95E0812D4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 Aug 2025 06:20:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -7.893
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Ray4wAS_MmP for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Aug 2025 06:20:58 +0000 (UTC)
X-Greylist: delayed 396 seconds by postgrey-1.37 at util1.osuosl.org; Fri, 15 Aug 2025 06:20:57 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BF80F812D1
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none) header.from=strlen.de
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF80F812D1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=91.216.245.30; helo=chamillionaire.breakpoint.cc; envelope-from=fw@strlen.de; receiver=<UNKNOWN> 
Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	by smtp1.osuosl.org (Postfix) with ESMTPS id BF80F812D1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 Aug 2025 06:20:57 +0000 (UTC)
Received: by Chamillionaire.breakpoint.cc (Postfix, from userid 1003)
	id AD4BB605B5; Fri, 15 Aug 2025 08:14:12 +0200 (CEST)
Date: Fri, 15 Aug 2025 08:14:07 +0200
From: Florian Westphal <fw@strlen.de>
To: Soham Metha <sohammetha01@gmail.com>
Cc: linux-kselftest@vger.kernel.org, shuah@kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org, netdev@vger.kernel.org
Subject: Re: [PATCH 2/6] setftests: net: netfilter: fix spelling mistakes in
 output
Message-ID: <aJ7QL0BHj7xJNqPw@strlen.de>
References: <20250815000859.112169-1-sohammetha01@gmail.com>
 <20250815001803.112924-1-sohammetha01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250815001803.112924-1-sohammetha01@gmail.com>

Soham Metha <sohammetha01@gmail.com> wrote:
> found/fixed following typos
> 
> - add add -> add
> - cannnot -> cannot
> - fowarded -> forwarded

OK, but what tree are you targetting?

In case netdev maintainers or someone else wants to take it:

Acked-by: Florian Westphal <fw@strlen.de>

Else we can route it via nf-next in the coming week.
