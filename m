Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39096130A73
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 23 May 2025 08:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747990565; cv=none; b=aSMeDSuPKDdYhKogpIsZQqnBO+ERNVcj2X21gT+3z32Wn7N7tT1JA6MNphVr8wJ6f/IdUwPXsYhAqn7H9ijR0kmZgp0Yt1Q3syNDL6E9O8GCoaPIItuNWknvzkev2nQkwwgiy7fhgarL7oIGTZjmJ5cLxvZUvmS19b0JgVSjDM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747990565; c=relaxed/simple;
	bh=9SoaVeXOrVydbuPq1K22nEmDYqKFXWQrFUdTaVSVQbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s5MNCsd0dW6XTKn3csq57xphFP3v4isbX7FPAfQCoC+srB6MkK4F0GDSzWccy/BdlJ6Du6HY0+d947bhTTUA1QZ9IdZ4tGKgF/pH0of3LnLj8+IsL7IDUQqiKDUhXMgtfv6dea20eJP90Y65kvg1PKGhmMSHGYaTWG1HundOsjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=drHUrEIs; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="drHUrEIs"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B907340B1F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 23 May 2025 08:56:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 52TRT3XX-yo8 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 May 2025 08:56:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=dakr@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 96D97404B0
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96D97404B0
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=drHUrEIs
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 96D97404B0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 23 May 2025 08:56:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E72B262A12;
	Fri, 23 May 2025 08:56:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2996C4CEE9;
	Fri, 23 May 2025 08:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747990560;
	bh=9SoaVeXOrVydbuPq1K22nEmDYqKFXWQrFUdTaVSVQbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=drHUrEIsQLTkJQQ82Box+uV+7cjOn/mvP0dwnFRQ1MRoToklmBKfblIkeLNK0BqB+
	 OGuXZu5wpEY1VPP8How8Lwc+L9+cVRCbUEjqflLbZgvkkeSyJ/iGNrk/kUhyYgeWuh
	 mCudayXFKQaBn5AAGW9dhuOJh6fJmd30U5kLmDohNkukKFKZOIHngKmVPeypuPP4VK
	 prHa294fR5OUivCp2KwQdbWb4Fa+BNJaOLvEqKl8MYC5DjxKlz1FWh9k6e4nwejbBq
	 7F93eewYzQ0O96VKnLiMvaExluFuZOZjtc1yGd/twnl9J9nBk72pWMcvHQJ/exhFly
	 6s/Y5u6Y/s/JQ==
Date: Fri, 23 May 2025 10:55:56 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Benno Lossin <lossin@kernel.org>
Cc: Marcelo Moreira <marcelomoreira1905@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, benno.lossin@proton.me,
	ojeda@kernel.org, rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: Re: [PATCH v2] rust: doc: Clarify safety invariants for Revocable
 type
Message-ID: <aDA4HIOL-g37cvpy@cassiopeiae>
References: <aChczAWsPdmdeen3@pollux>
 <D9YO7XDNV712.3A5HSSLUQIZ2W@kernel.org>
 <aCrwuQP46RFHxYB5@pollux>
 <DA00X0RTYKMA.2OG25TZ1X3AU@kernel.org>
 <aCsAEJtkCKKhspnF@pollux>
 <DA03ANJMDOU2.1ZQWA6MIENVKD@kernel.org>
 <aCsX-k0K_jqLvD4e@pollux>
 <DA04WHRZBBS0.17WRMWDF0A335@kernel.org>
 <CAPZ3m_i8fwsBRJKay72LHT4pEW=eZ5LxCFD=8CYkuEksjjt3_Q@mail.gmail.com>
 <DA3ENUO97I6D.234AA7I97AV62@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DA3ENUO97I6D.234AA7I97AV62@kernel.org>

On Fri, May 23, 2025 at 10:42:58AM +0200, Benno Lossin wrote:
> On Fri May 23, 2025 at 2:13 AM CEST, Marcelo Moreira wrote:
> > 3. Clarified revoke_internal for SYNC = false and swap correction
> > Proposed Documentation:
> >  if self.is_available.swap(false, Ordering::Relaxed) {
> >  if SYNC {
> >                 // SAFETY: Just an FFI call, there are no further requirements.
> >                 unsafe { bindings::synchronize_rcu() };
> 
> @Boqun: is this true?
> 
> If the answer is yes, then we should add this as a safe function in the
> rcu module.

I think it's a case for Klint, since synchronize_rcu() must not be called from
atomic context, since it may block. Otherwise, there shouldn't be any additional
requirements.

> >  }  else {
> >        // This branch for `revoke_nosync` requires the caller to prove
> > that `data`
> >        // can be dropped immediately without waiting for any RCU grace period.
> 
> I'm not sure that having a single function that does the revocation, but
> has this going on is a good idea. The safety requirements will be pretty
> complex.
> 
> @Danilo what do you think of inlining this function?

Sure, if it makes documentation significantly easier, which seems to be the
case, then it's probably worth.

> > 4. Documented RevocableGuard<'_, T> Invariants and PhantomData Adjustment
> > Proposed Documentation:
> > /// # Invariants
> > ///
> > /// - The RCU read-side lock is held for the lifetime of this guard.
> > /// - `data_ref` points to valid data for the lifetime of this guard.
> > pub struct RevocableGuard<'a, T> {
> >     data_ref: *const T,
> >     _rcu_guard: rcu::Guard,
> >     _p: PhantomData<&'a T>,
> > }
> 
> I think we can change this type to:
> 
>     pub struct RevocableGuard<'a, T> {
>         data: &'a T,
>         _rcu_guard: rcu::Guard,
>     }
> 
> And then we don't need any invariants :)

Agreed, let's make this change in a separate patch please.
