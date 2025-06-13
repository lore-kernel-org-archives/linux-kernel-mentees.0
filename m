Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1DB291C07
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 13 Jun 2025 14:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749823882; cv=none; b=PlqqQsUYydYPNpSXZJ1zNx3+hndLwX2fNNGN7za6MgAPvBdUcQeGPN1u+6PC3nrXYQzBZiMPnP5U1oij01Sxl9RQOMgj/ZRQibkZjBztVX2SsWLWUKORK4eUOPefdOKidgksTss+jJhUWXPSZVH+w4nUEhGUycBwRGcA28onN0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749823882; c=relaxed/simple;
	bh=bhR4Bb2bwwXTLXLAtF8PnnNR8WQ9nu759oSJREasAeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FPsDVeApZL60nUF48kwBYp9xHSYsiiG6+QcTpewfwcIpNjBLlbqiHcKLPRWKrCve/qIN5RA+x1h8sKPujqcsLhe9eqDfFU3P1vKeJTp8zQwjn/Wzpf3tt8BoFy3L+T16grG5wyMkYFxY5ZkdVwL5jFBQXVpGBpqGMerfhpyIB+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gSMObpRg; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gSMObpRg"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAD8784341
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 13 Jun 2025 14:11:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -10.792
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u56O3T_Y2Z8S for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Jun 2025 14:11:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=dakr@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E8F8684340
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8F8684340
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gSMObpRg
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E8F8684340
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 13 Jun 2025 14:11:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 076855C6200;
	Fri, 13 Jun 2025 14:09:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 975F4C4CEEF;
	Fri, 13 Jun 2025 14:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749823878;
	bh=bhR4Bb2bwwXTLXLAtF8PnnNR8WQ9nu759oSJREasAeI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gSMObpRgyYD8505xSwE+6TE87oiNA0I1ZGarLcXLblMu+Y89Q2jHm/d5SKXBpchY1
	 WP6NiRROohIxLAz+IiEztI4sdV0ClnQUZYkzU7Ha9wujxxJcUmt48FmnfGFVjhY2wc
	 WSKTTKSigbRQE7Mx5DoWXayIgiAr3SkkP1N7RcvEIFGUi1ep29QMPc23/NAg/StDM4
	 hjlKpNiQHZfDpJtp0ozEj6q7WjJmiJcPxgPRdiHeHOfXyFEtonZSvBERm7K/DWZVlD
	 WZKfI0WrdixCqFm18DfeFwaY7mK3lSkpRheS26Z7JgmZyZg/fipcO2kPSJcRV1c60x
	 JOIkueoHGZIrg==
Date: Fri, 13 Jun 2025 16:11:13 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Marcelo Moreira <marcelomoreira1905@gmail.com>, lossin@kernel.org,
	ojeda@kernel.org, rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: Re: [PATCH v4 2/3] rust: revocable: simplify RevocableGuard for
 internal safety
Message-ID: <aEwxgUjYiNaJuzc_@pollux>
References: <20250602232842.144304-1-marcelomoreira1905@gmail.com>
 <20250602232842.144304-3-marcelomoreira1905@gmail.com>
 <aEqdur4JTFa1V20U@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEqdur4JTFa1V20U@google.com>

On Thu, Jun 12, 2025 at 09:28:26AM +0000, Alice Ryhl wrote:
> I don't think this change is valid. Consider this code:
> 
> fn takes_guard(arg: RevocableGuard<'_, i32>) {
>     drop(arg);
>     // rcu guard is dropped, so `arg.data` may become dangling now
> }
> 
> This violates the requirement that references that appear in function
> arguments are valid for the entire function call, see:
> https://perso.crans.org/vanille/treebor/protectors.html
> 
> Or the LLVM perspective: When Rust sees a reference in a function
> argument, it adds the LLVM attribute dereferencable to it, which implies
> that the pointer must be valid for *the entire function call*. If the
> memory becomes dangling after the rcu guard is dropped, then this is
> violated and the compiler could perform optimizations that are not
> correct.

Interesting, I wasn't aware of that. I wonder, why can't the compiler catch this
and throw an error?
