Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834FF272E72
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  1 Jul 2025 11:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370016; cv=none; b=ESaChkepAfhs8t1DsCDLWRhH+38mYWq28+4v7LhOMyM7di1cRb7DePy1iRk+CC6PuyNejKCMTV/nLdlhS0P3TjGeSr3/xl3eAIiGF48WCGD2NRpsWqQNoe5bsccwlWc2k8aVwz8F/MZMA4JCZhieaNNGnCjNBakjTDRN3qWJQv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370016; c=relaxed/simple;
	bh=u8zZNCS4lvpD1VplOy6onJI7j2IZhMgAIkB1xz0hPjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s/wF+POP8Ixv1SlhU0LPUrln5URhjciOva30S7bKpSn4TVzaby2vekfcISCZp04bYh+z8hGHrwEOm/IT1//79ThwKBXjyoiPmsXmvwB2OjbTn1WtIZK/TyEt0oTyWPZ94AZxidyGYyzsd5sri2jpiuXu4AKTEArapWcdfoB4pxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PShz8UON; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PShz8UON"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 209A381AA7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  1 Jul 2025 11:40:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QsPrXndW1xVW for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Jul 2025 11:40:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=dakr@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 892FB812C4
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 892FB812C4
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PShz8UON
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 892FB812C4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  1 Jul 2025 11:40:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 10B86A52F09;
	Tue,  1 Jul 2025 11:40:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFB92C4CEEB;
	Tue,  1 Jul 2025 11:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751370012;
	bh=u8zZNCS4lvpD1VplOy6onJI7j2IZhMgAIkB1xz0hPjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PShz8UONIBJ7VTbSCVd9ONPARVYPA4QnMiTuO/LwiBb4ejnn+D2aRCpyzipuIA54x
	 xZGEyaVfFFXNRp0kG5tLgswG/lrL958MQghZHD3PJmX6rRBLr/M0NRm2x9tbxeIEeL
	 wieRiLuHupQ7J0HVAkCQSirNTGtVlRrvJUD8oM9KDGamDNI0FOd79YcSk1a35i07qI
	 lVpTXPQ08ImfNvJFacsKj8aVC9wVLBqAjf3kSulXFv9K+ybc5L0UuvWc1zR16Qz5EV
	 FwcztaJ9CfyRMM+nLKZ/J/u8hrRN6FZ5ZUBKFhqr9CRFT+q4rkQMnC4+wUygWBvD4I
	 OYihIxf+i7NQw==
Date: Tue, 1 Jul 2025 13:40:07 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Marcelo Moreira <marcelomoreira1905@gmail.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	lossin@kernel.org, ojeda@kernel.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: Re: [PATCH v5 0/2] rust: revocable: documentation and refactorings
Message-ID: <aGPJFw_Ouj8MNbuq@pollux>
References: <20250626165927.66498-1-marcelomoreira1905@gmail.com>
 <CAH5fLgiTTXVMs3tzrHAU1rwQDCs_VPuPgEVcEkjbu+rNT=35vA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLgiTTXVMs3tzrHAU1rwQDCs_VPuPgEVcEkjbu+rNT=35vA@mail.gmail.com>

On Tue, Jul 01, 2025 at 01:27:17PM +0200, Alice Ryhl wrote:
> On Thu, Jun 26, 2025 at 6:59 PM Marcelo Moreira
> <marcelomoreira1905@gmail.com> wrote:
> >
> > This patch series brings documentation and refactorings to the `Revocable` type.
> >
> > Changes include:
> > - Clarifying the write invariant and updating associated safety comments for `Revocable<T>`.
> > - Splitting the internal `revoke_internal` function into two distinct, explicit functions: `revoke()` (safe, synchronizing with RCU) and `revoke_nosync()` (unsafe, without RCU synchronization), now returning `bool` to indicate revocation status.
> >
> > Marcelo Moreira (2):
> >   rust: revocable: Refactor revocation mechanism to remove generic
> >     revoke_internal
> >   rust: revocable: Clarify write invariant and update safety comments
> 
> Danilo, did you have Revocable / Devres changes that conflict with this?

Yes, but I sent them to Linus for -rc3 already. Given that rust-next is based on
-rc3, we should be good. There shouldn't be any further conflicts.
