Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E0B33F38C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 11 Nov 2025 14:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762872972; cv=none; b=WI6RqouJkEGeEJUEO/Rjwfw5Ei75r6LlF2LXc4i4RBMM6h2PZuFkrYJSQ6rsf6yIXshxP31uumjhwSJTqRXfoIeUG7Ai9GjBgTSd3Oh6Ubsn5IMAt9hHSpor5O56AcQoCSWiluzsiftCGAyCiCGwJVwRebXFymVcsW3P4r1iaa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762872972; c=relaxed/simple;
	bh=O/PGfeis5HPQNP+TRiiTqX1JHN1m4XlZ7OUntJXfooY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l6Ffo3zeh1Yu1vFPjuBExzzLGi6JceCtRxNUJMAl2JaV0dN319ZYy8U3ta95KXFoa3iu5M48DTQalEE3nrumUsI6/drzprQI+mFvWLa1dMQvzWCgaegoQWbPav9iulRgMkTC0JhPh6k4D9480lN5itYIiEjZf1pt84iHoCpc4t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EFO0Tfxh; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EFO0Tfxh"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BDAF80CB6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 11 Nov 2025 14:56:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.791
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NAHRHIM1tmxR for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Nov 2025 14:56:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=horms@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9E37E80C7A
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E37E80C7A
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EFO0Tfxh
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9E37E80C7A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 11 Nov 2025 14:56:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9CE2C40AF2;
	Tue, 11 Nov 2025 14:56:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4798C19422;
	Tue, 11 Nov 2025 14:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762872963;
	bh=O/PGfeis5HPQNP+TRiiTqX1JHN1m4XlZ7OUntJXfooY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EFO0TfxhvNiBJNj3+mPHMLHLr4rm30ye3iGgK0AAEv38u2yJYH2154KNqquD5ZSLg
	 Q3iosAzBw5AGju6tN4PGRK0nZYkYXC4NOsMIUYmpxJtpgiwqcYLxe1JYM97M1zv+d4
	 uCGTMBFP1E84GqSj4/xA/0FpTxxjBS+lG/xZh032Iqzss78c3sb42LUmlJKN/BQeyu
	 OudEJvyn5cKT/xy9SMD5eiemVzS2iIQ246tLhZfaOMQtbgFTq2SozEsxRYjx8Rq5BO
	 xePxEuHvnFI77KNnbRLulb4Azg74dKBgsvRqur6NfoVYUjyKwmnpzRsoNBiWqlDI2O
	 jTS+h12+0ATNg==
Date: Tue, 11 Nov 2025 14:55:58 +0000
From: Simon Horman <horms@kernel.org>
To: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
Cc: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Xing <kernelxing@tencent.com>, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] selftest: net: fix variable sized type not at the end of
 struct warnings
Message-ID: <aRNOfir6X9FmaUrd@horms.kernel.org>
References: <20251027050856.30270-1-ankitkhushwaha.linux@gmail.com>
 <aQD8AOZduY4Fit3k@horms.kernel.org>
 <aQ9-F34aW__rlMuD@fedora>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQ9-F34aW__rlMuD@fedora>

On Sat, Nov 08, 2025 at 10:59:59PM +0530, Ankit Khushwaha wrote:
> On Tue, Oct 28, 2025 at 05:23:12PM +0000, Simon Horman wrote:
> > On Mon, Oct 27, 2025 at 10:38:56AM +0530, Ankit Khushwaha wrote:
> > > Some network selftests defined variable-sized types defined at the end of
> > > struct causing -Wgnu-variable-sized-type-not-at-end warning.
> > > 
> > > warning:
> > > timestamping.c:285:18: warning: field 'cm' with variable sized type 
> > > 'struct cmsghdr' not at the end of a struct or class is a GNU 
> > > extension [-Wgnu-variable-sized-type-not-at-end]
> > >   285 |                 struct cmsghdr cm;
> > >       |                                ^
> > > 
> > > ipsec.c:835:5: warning: field 'u' with variable sized type 'union 
> > > (unnamed union at ipsec.c:831:3)' not at the end of a struct or class 
> > > is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
> > >   835 |                 } u;
> > >       |                   ^
> > > 
> > > This patch move these field at the end of struct to fix these warnings.
> > > 
> > > Signed-off-by: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
> > 
> > Hi Ankit,
> > 
> > I don't believe this change is correct.
> > 
> > I think that the intention of the code is the char arrays (buf and control)
> > provide the buffer space for the variable-length trailing field
> > of the preceding structure. Where we basically have a header followed
> > by data. But your patch would place the before the header.
> >
> Hi Simon,
> So if buf and control providing the buffer space, then i think it is
> better to suppress `-Wgnu-variable-sized-type-not-at-end` warning 
> within this block of code.
> 
> 	#pragma GCC diagnostic push
> 	#pragma GCC diagnostic ignored "-Wgnu-variable-sized-type-not-at-end"

I'm unsure of the attitude towards using #pragma like this in kernel code,
but certainly it would be a new one for me.

> 
> 	struct {
> 		union {
> 			struct xfrm_algo        alg;
> 			struct xfrm_algo_aead   aead;
> 			struct xfrm_algo_auth   auth;
> 		} u;
> 		char buf[XFRM_ALGO_KEY_BUF_SIZE];
> 	} alg = {};
> 
> 	#pragma GCC diagnostic pop
> 
> I think this would be fine.

In my view, the most promising approach I am aware of is using
TRAILING_OVERLAP(), as illustrated in [1]. However, that
approach was recently rejected, so I guess that means
it doesn't have much promise after all.

[1] https://lore.kernel.org/netdev/aPdx4iPK4-KIhjFq@kspp/
