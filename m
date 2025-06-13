Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A719D2E11AE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 13 Jun 2025 14:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749823710; cv=none; b=iUdSnJIHfjrlkb3+Ovlz3U+d75hGNTe6l04qEf2uwRE5ti9coXxGIFT0Je5MnFPDhZoCStljnPP6feXgzQfpkKCNuTw774DHqUn+n31/qlTlhzwkOMnmF9g4uASbeMi+7dhbmQd6iQgOgZufn1U8Q/2hCzP8xeWLZ4/E8rSTApg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749823710; c=relaxed/simple;
	bh=WuP7FJsNoYSMk2iheBJeNX0TljEt0ZX1T+7DPKvCTlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IiFssWxH9B/+pC5o/DwOJeF5RdeKUzspnfhHc9cfz2Gl7XNSXQbSNfPLsaNFt8T1zZ5oMbdUgYYSmHd7m5Xh+Q+aELM6Wrroe6sEXjNJJjuNkmAONq+MnRF8lkqsD94VXBAPG8+DdeJ75f54dHsa23HkOj2EBdewBD2+bMcx2wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gkk/4BSX; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gkk/4BSX"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4214380DE4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 13 Jun 2025 14:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Moc9pAe82AkJ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Jun 2025 14:08:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=dakr@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8ADBF80DF1
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8ADBF80DF1
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Gkk/4BSX
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8ADBF80DF1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 13 Jun 2025 14:08:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 11C21629E5;
	Fri, 13 Jun 2025 14:08:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28B82C4CEEF;
	Fri, 13 Jun 2025 14:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749823706;
	bh=WuP7FJsNoYSMk2iheBJeNX0TljEt0ZX1T+7DPKvCTlk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gkk/4BSX3KjYSeK7D9B9B0/Y0o7W1xftigDjGRb8xS1PBgpWbbrGPrGu0a/6y4YGQ
	 Cd+2zu18t0Ey+lzjY/AqItHOYr40fZbVP19bs4H1EtdhlMsae+Mga5hIcM4fAOngKK
	 pbJkcZwONh60o3IFIKtGw+idRgkH4hj9FsEZ1PHQvS3KbBZrnXsIceHjzrgsVjFb6K
	 cPkmsHrDA59aVV1ejkjsoB5vz0jd7FY+qYGfrAlYsylARHsiqGg7Lzr6TT7hgWqeCV
	 jHDy+eOHOSNjn5K+2PwmSo+puyhBOxQlQ4nlacCVAAAfNJbeRdAGL+b+ZIquS5VXZb
	 Wm7/DCMTYuV7g==
Date: Fri, 13 Jun 2025 16:08:22 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Benno Lossin <lossin@kernel.org>
Cc: Marcelo Moreira <marcelomoreira1905@gmail.com>, ojeda@kernel.org,
	rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: Re: [PATCH v4 1/3] rust: revocable: update write invariant and fix
 safety comments
Message-ID: <aEww1owNOEBTSjLf@pollux>
References: <20250602232842.144304-1-marcelomoreira1905@gmail.com>
 <20250602232842.144304-2-marcelomoreira1905@gmail.com>
 <DAKFLKX7HS7W.29I8XUZP8L1KN@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DAKFLKX7HS7W.29I8XUZP8L1KN@kernel.org>

On Thu, Jun 12, 2025 at 11:02:21AM +0200, Benno Lossin wrote:
> On Tue Jun 3, 2025 at 1:26 AM CEST, Marcelo Moreira wrote:
> > This commit clarifies the write invariant of the `Revocable` type and
> > updates associated `SAFETY` comments. The write invariant now precisely
> > states that `data` is valid for writes after `is_available` transitions
> > from true to false, provided no thread holding an RCU read-side lock
> > (acquired before the change) still has access to `data`.
> >
> > The `SAFETY` comment in `try_access_with_guard` is updated to reflect
> > this invariant, and the `PinnedDrop` `drop` implementation's `SAFETY`
> > comment is refined to clearly state the guarantees provided by the `&mut Self`
> > context regarding exclusive access and `data`'s validity for dropping.
> >
> > Reported-by: Benno Lossin <lossin@kernel.org>
> > Closes: https://github.com/Rust-for-Linux/linux/issues/1160
> > Suggested-by: Benno Lossin <lossin@kernel.org>
> > Suggested-by: Danilo Krummrich <dakr@kernel.org>
> > Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
> 
> I would have done this change after the other two, since then you can
> change all the safety comments here, but if Danilo is fine with doing it
> this way, then you can leave it this way.

I agree, it's probably better to have this patch last.

> The changes are almost perfect now, just some small formatting changes
> below. With those fixed, you may add:

and:

Reviewed-by: Danilo Krummrich <dakr@kernel.org>

> Reviewed-by: Benno Lossin <lossin@kernel.org>
