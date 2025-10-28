Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A5A286887
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Oct 2025 16:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761669156; cv=none; b=bePE0HBVCs8MJgX3zWykoCAxI7RyFABgwzt0kxNljC1UY/RkYd4RO0GAT9x6NeUiMGMOA7k0mPwcbNG8Hca/IdcXamZI7GheM5TTHVZaHm8quTaIWB/RcSmjM2Ld2KrerobcnFy8dzo7zx0b952fsh6J50Eei9G7IFItAgLp35o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761669156; c=relaxed/simple;
	bh=JdNgZ8T1nHVUE8GPyM0NLn6jOeFU81bhy/i+g3NI+Iw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dXeqlPVWh32HBtQWadWUutrBlYhSNIdi+DXA0uZPV5RkfGofb6tsvTOEs7WxZWGK19cLrzOYCXauHbza1W9VgerarOceUVQisgazpSmjgttAfGPUZY3mMSNtfYxxadOvdGtr5gCLi1HW/WHs2XnriFbHgs/Q9vblC8SjgwsmjdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B5/hDdTC; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B5/hDdTC"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA9C54009F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Oct 2025 16:32:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wFe8_hBH3FZW for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Oct 2025 16:32:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=horms@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4ED0B4009A
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4ED0B4009A
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=B5/hDdTC
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 4ED0B4009A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Oct 2025 16:32:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3FF6D43A0A;
	Tue, 28 Oct 2025 16:32:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2438EC4CEE7;
	Tue, 28 Oct 2025 16:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761669151;
	bh=JdNgZ8T1nHVUE8GPyM0NLn6jOeFU81bhy/i+g3NI+Iw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B5/hDdTCd8eh28z64MNb7J7i+gD6fyQgRoCm07cmOvUKD2bw3LfNNtHz0egPa06j4
	 qa+y8sTGpB+XeV94EVtENhOC6WtgJUXusS+ZZcNf7GLPU0UewxE3sU2CCI7hTwiSq0
	 jH/SxsTe/3l0WLhlSTn1WTxdtsiNOKRRtK7mdrfALRMfbCwW/3Csc4irgk0w7IjSa/
	 0/BvomNJgTbHVBCDyb/SP15KN8Tk/jJkUatGIoa5Wjt0KaetJQFRJniaV104c8o/gJ
	 91laSL/RBaJhKKuZR7mm9+LFIDUhNnAqqAgeTwdmnD25rfUzkdMTWydU4OflYW3uI5
	 UKhKYzqaWSFDg==
Date: Tue, 28 Oct 2025 16:32:26 +0000
From: Simon Horman <horms@kernel.org>
To: Rakuram Eswaran <rakuram.e96@gmail.com>
Cc: Eric Dumazet <edumazet@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, hswong3i@gmail.com,
	hlhung3i@gmail.com, khalid@kernel.org, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: tcp_lp: fix kernel-doc warnings and update outdated
 reference links
Message-ID: <aQDwGpQttEEsj9ik@horms.kernel.org>
References: <20251025-net_ipv4_tcp_lp_c-v1-1-058cc221499e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251025-net_ipv4_tcp_lp_c-v1-1-058cc221499e@gmail.com>

On Sat, Oct 25, 2025 at 05:35:18PM +0530, Rakuram Eswaran wrote:
> Fix kernel-doc warnings in tcp_lp.c by adding missing parameter
> descriptions for tcp_lp_cong_avoid() and tcp_lp_pkts_acked() when
> building with W=1.
> 
> Also replace invalid URLs in the file header comment with the currently
> valid links to the TCP-LP paper and implementation page.
> 
> No functional changes.
> 
> Signed-off-by: Rakuram Eswaran <rakuram.e96@gmail.com>
> ---
> Below W=1 build warnings:
> net/ipv4/tcp_lp.c:121 function parameter 'ack' not described in 'tcp_lp_cong_avoid'
> net/ipv4/tcp_lp.c:121 function parameter 'acked' not described in 'tcp_lp_cong_avoid'
> net/ipv4/tcp_lp.c:271 function parameter 'sample' not described in 'tcp_lp_pkts_acked'
> 
> The new URLs were verified through archive.org to confirm they match
> the content of the original references.
> ---
>  net/ipv4/tcp_lp.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/net/ipv4/tcp_lp.c b/net/ipv4/tcp_lp.c
> index 52fe17167460fc433ec84434795f7cbef8144767..976b56644a8a746946e5028dcb054e4c3e249680 100644
> --- a/net/ipv4/tcp_lp.c
> +++ b/net/ipv4/tcp_lp.c
> @@ -23,9 +23,9 @@
>   * Original Author:
>   *   Aleksandar Kuzmanovic <akuzma@northwestern.edu>
>   * Available from:
> - *   http://www.ece.rice.edu/~akuzma/Doc/akuzma/TCP-LP.pdf
> + *   https://users.cs.northwestern.edu/~akuzma/doc/TCP-LP-ToN.pdf

It's not important, but FTR, I notice that these
seem to be different versions of the same paper.

>   * Original implementation for 2.4.19:
> - *   http://www-ece.rice.edu/networks/TCP-LP/
> + *   https://users.cs.northwestern.edu/~akuzma/rice/TCP-LP/linux/tcp-lp-linux.htm

It's probably not important, but I think the following would
be a better drop-in replacement. That said, perhaps your choice
is a better one for the purposes of the comment above.

   https://users.cs.northwestern.edu/~akuzma/rice/TCP-LP/

That notwithstanding, this looks good to me.

Reviewed-by: Simon Horman <horms@kernel.org>

...
