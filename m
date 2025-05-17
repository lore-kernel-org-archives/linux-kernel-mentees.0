Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCB71B4121
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 17 May 2025 09:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747475668; cv=none; b=rLIqiEN6DgejByfmKYdLlh+geGyZaAZXuots3S1MOGRbvtynp9yruS+6CscLZ64HCVi9v3Z318aYED/LlltqglP65mBZ68uiTcVz4HWFvGtfdDOURU1Obn9zIJVcdUCLEGjmjJZH64awgZf5Be0X32Ymnmpa7JogM9fSZyMGD/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747475668; c=relaxed/simple;
	bh=skUsAxfeRaHo0zDnu8V+cniQAJE/FnU26VQBw2IcckY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C92Yf/irgIR2HJMVivAlRn0z+RES1QxQF5FGpzHnRzL0uU4XyvkMaBARftn5AOIlC8A1VPbMGNs9EWY1xxS9Ox0y7LQDN80tv/x1GFSuAAj/TD7z2y+t0f5cY4ky38CJvYkEzOm0167/HHJ6J07EDM2fVUqDiJTy8/RHzgMxPls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i1H5mRE3; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i1H5mRE3"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF3AD40445
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 17 May 2025 09:54:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qZ01ntErwyyy for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 May 2025 09:54:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=dakr@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D616C40175
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D616C40175
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i1H5mRE3
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D616C40175
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 17 May 2025 09:54:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EF8A044BDA;
	Sat, 17 May 2025 09:54:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B337C4CEE3;
	Sat, 17 May 2025 09:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747475664;
	bh=skUsAxfeRaHo0zDnu8V+cniQAJE/FnU26VQBw2IcckY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i1H5mRE3Lw41unnL1h0CmkLGf8s8fX8dp2Cwu8q/VzoEM2cWCK7h0LJMTBWH9J7UX
	 Jyly6iDq1J6QgerKmEdR6bDNtXpR7Vsn3SRsxjkvgfqcT2gyvvi+jDsIEO/6WufGne
	 Ci1ajrHgHIIPhR7Qiro2+S5U0o1hKCTvJOi5O52Az2V3LPNsD7XocZ+fDgTZ3n5+QM
	 Qut+SsEKEiHNgGvEKXep4WnRFIECe620TIER65VSjirlD0RD5FkOZ5Rnp0s8+JvoGi
	 vI1KqSNpngzlFgvpdI0wWv9ReTsOgWWEkVG3s0EtN5gp8VKogA8WIb9ov3bIQyxfDX
	 HFF/dvuN/y+FA==
Date: Sat, 17 May 2025 11:54:20 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Benno Lossin <lossin@kernel.org>
Cc: Marcelo Moreira <marcelomoreira1905@gmail.com>, benno.lossin@proton.me,
	ojeda@kernel.org, rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: Re: [PATCH v2] rust: doc: Clarify safety invariants for Revocable
 type
Message-ID: <aChczAWsPdmdeen3@pollux>
References: <20250503145307.68063-1-marcelomoreira1905@gmail.com>
 <D9RJQYNTIOK1.3HI7NDDWPK6IM@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D9RJQYNTIOK1.3HI7NDDWPK6IM@kernel.org>

On Fri, May 09, 2025 at 12:10:08PM +0200, Benno Lossin wrote:
> On Sat May 3, 2025 at 4:53 PM CEST, Marcelo Moreira wrote:
> >  /// # Invariants
> >  ///
> > -/// - The wrapped object `data` is valid if and only if `is_available` is `true`.
> > -/// - Access to `data` must occur only while holding the RCU read-side lock (e.g., via
> > -///   [`Revocable::try_access`] or [`Revocable::try_access_with_guard`]).
> > -/// - Once `is_available` is set to `false`, further access to `data` is disallowed,
> > -///   and the object is dropped either after an RCU grace period (in [`revoke`]),
> > -///   or immediately (in [`revoke_nosync`]).
> > +/// - `data` is valid if and only if `is_available` is true.
> > +/// - Access to `data` requires holding the RCU read-side lock.
> 
> I'm not sure what the correct wording here should be. The current
> wording makes the `revoke_internal` function illegal, as it doesn't hold
> the read-side lock, but still accesses `data`.
> 
> Maybe @Danilo can help here, but as I understand it, the value in `data`
> is valid for as long as the rcu read-side lock is held *and* if
> `is_available` was true at some point while holding the lock.

IMHO, the RCU read lock is *not* a requirement, it's (for some methods) the
justification for how it is ensured that the `is_available` atomic cannot be
altered during the usage of `data`. So, it shouldn't be part of the type
invariants.

For instance, we also have the Revocalbe::access() [1], which is an unsafe
direct accessor for `data`. It has the following safety requirement:

	 "The caller must ensure this [`Revocable`] instance hasn't been revoked
	 and won't be revoked as long as the returned `&T` lives."

Which is equal to the caller must ensure that `is_available` is true, and won't
be altered to false as long as the returned reference lives.

One valid way for the caller would be to wrap it into an RCU read side critical
section and check `is_available`. However, depending on the context, there are
also other justifications, e.g. [2].

[1] https://gitlab.freedesktop.org/drm/nova/-/blob/nova-next/rust/kernel/revocable.rs?ref_type=heads#L148
[2] https://gitlab.freedesktop.org/drm/nova/-/blob/nova-next/rust/kernel/devres.rs?ref_type=heads#L221

> > +/// - Once is_available is set to false, further access to data is disallowed,
> > +///   and the object is dropped either after an RCU grace period (in [revoke]),
> > +///   or immediately (in [revoke_nosync]).

Same here, RCU isn't a relevant factor for the type invariant IMHO. It's just
how part of the implementation guarantees to up-hold the invariant.
