Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78B97263C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Jun 2025 19:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749756180; cv=none; b=XgNJ5Qjlehg8bJ20K+XWhL+Cul7eizDhzgj7M0c00+uJuqMojpJLkjyDQYYik0yXQeu2OwTu50+SDaUPICnUaFULLUiT5R8xiEeS0joNWhNyc1Laj6Zf06g5AnhjBz7ejuifDZuIHFhsoySKDxEGKPRK0ymc3Xow0o47HlAzz54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749756180; c=relaxed/simple;
	bh=n+Yw3Mdq9XrJB0xtDS1RduOftH/giQ76nPPdgGJ14OI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ABYhl6ODMkKXdK9sO+AYPnmnuLY3dMeWwaAWigaxh/s+hxfIMHdGbeFUc1t3k/cWiYboQx5ScZIvamw49qGRvMSDFecqi+H332bfkSPJR4dFVZOsEIqpvGxVu88w8daQze3AZ3gG8VL2LHcN4L4bGfvTVM2fUgIZligMJes/4Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JU0Rf/vh; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JU0Rf/vh"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4324A408A9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Jun 2025 19:22:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pus1azw7GhDr for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Jun 2025 19:22:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 53468407DE
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53468407DE
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JU0Rf/vh
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 53468407DE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Jun 2025 19:22:57 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-736f1953673so393261a34.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Jun 2025 12:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749756176; x=1750360976; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nC++g9v4EmLHnilNICBRuJnxGRlHqhCvyDrR5A5MKVU=;
        b=JU0Rf/vheG8KBcg1KQ1cdAd6zG1p7ZXOSqBQyD8x2od2Un7PNHjNEiEqMrICPVAnSY
         ARS7DkpiA7GAedjyRUhb1wvaqGtB8n5ieUr7tPsSRQQvQ6IUcDvgeoUMMdsx+Cb/AZAy
         +kYaMOwFIyh5z2qTLP8i/IAQA/rAUh40Q54jSQR0ardgdtwdIeDtoSWIx3yqTaGZnvQv
         hjqM7MUaAjxpRZjfy3PGCbypfz8DiPZ54hR/QJ/NovQ2IKd4CIbbLQx7I5MZzgPJZEno
         RTekUemetOGKrpY4qHdNGYvQ1jSeDCJ7usbZ98R/WYpwAhZRPsq20MBZSsX8pIeTR7+b
         CBog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749756176; x=1750360976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nC++g9v4EmLHnilNICBRuJnxGRlHqhCvyDrR5A5MKVU=;
        b=aOIlilssRLfhys+0Owe9F1NnwaSqoxaC88A/8ISyNwaeEumQ5Smt/DJxBXg9K79aPu
         v80H1aYfmdSUhWWPSkYkf8aKnj/FhuLLKCMxUwnHubIZ9gp+yQZs5KQBoNviIxou5JsO
         dh2t9k94sHM2lmDFZV7yQ7LAvKXu6vKMeu8E+ZSFy98+cVj6/LcKhtBaFp1pZaC7swmO
         d5nRX5V5GvsGaXRSV9LRPmfzjirlfGk/uednvoT5H6NuAPF6i5nKhO0t0yD8TQFYQdN1
         1YorZhIyLbfSZxPoEph4tYTCuEvY9/0Lz7zsJZkncJP+4H5Fkwzmg9pSiKMrWxl5Eurt
         kX3w==
X-Forwarded-Encrypted: i=1; AJvYcCW4l8ZPS1O/a3xNOHLqzQojZeMo7QvblTnfCzfQN1xqMtkP9cBt5tkEcUgnbYaIWcfY+xG81aRiiQfksajMRwefPfAmGw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yz7YWjKt0EKr25o5ZxrlSsF9bfHw+b97f6XWJF9ikBsWpDtX1mP
	6PXqWu2aKqxGw5ao7gSSdg3AMPZieErLkMI93KrUlOfqgFODb7UPibwBpSMV11bJI/xT60mg31j
	g8QXaFe5R8ZDd6C7PG7GV8EeMWJn1jkE=
X-Gm-Gg: ASbGncu2/Q/9GmliH1Y+xDJCCr6DfzCuMMHxg20xD4S9g3XGKEmhTbVDgmDY/YwqMWJ
	GqB7UTxGakE6UpARVpUT7dfx5eeeflwr0w/LB863BVDPrFjR6UMDIMrO/q4PdORWvcvdrMk1l0g
	rPEcxbhykKcZF7VIUyMPrVLeO8DTeFNS0YfFufbULsyDAqWngyliqmrOs=
X-Google-Smtp-Source: AGHT+IFbTWjVrpjIYx07OvUtNCsIrGROXN4nHpRJec6tJa5NEAmV26b26XANJFeg1aLV/bGbroY6kmsRHchtj6FToQE=
X-Received: by 2002:a05:6808:220b:b0:3f6:a476:f7d3 with SMTP id
 5614622812f47-40a71e25e46mr458801b6e.9.1749756176182; Thu, 12 Jun 2025
 12:22:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250602232842.144304-1-marcelomoreira1905@gmail.com>
 <20250602232842.144304-2-marcelomoreira1905@gmail.com> <DAKFLKX7HS7W.29I8XUZP8L1KN@kernel.org>
In-Reply-To: <DAKFLKX7HS7W.29I8XUZP8L1KN@kernel.org>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Thu, 12 Jun 2025 16:22:44 -0300
X-Gm-Features: AX0GCFs-KHNkn6iQmM-_ZG4Sw0v0a9nw3i0Cb9_z09davBQquehFrRyEgrkN7gU
Message-ID: <CAPZ3m_hQF+ZHdfWTVZ3Z3dJoMu37Q8YcSecKi=fv1s3dw6UTSA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] rust: revocable: update write invariant and fix
 safety comments
To: Benno Lossin <lossin@kernel.org>
Cc: dakr@kernel.org, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qui., 12 de jun. de 2025 =C3=A0s 06:02, Benno Lossin <lossin@kernel.org>=
 escreveu:
>
> On Tue Jun 3, 2025 at 1:26 AM CEST, Marcelo Moreira wrote:
> > This commit clarifies the write invariant of the `Revocable` type and
> > updates associated `SAFETY` comments. The write invariant now precisely
> > states that `data` is valid for writes after `is_available` transitions
> > from true to false, provided no thread holding an RCU read-side lock
> > (acquired before the change) still has access to `data`.
> >
> > The `SAFETY` comment in `try_access_with_guard` is updated to reflect
> > this invariant, and the `PinnedDrop` `drop` implementation's `SAFETY`
> > comment is refined to clearly state the guarantees provided by the `&mu=
t Self`
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
>

ok, I'll wait for Danilo's answer :)

> The changes are almost perfect now, just some small formatting changes
> below. With those fixed, you may add:
>
> Reviewed-by: Benno Lossin <lossin@kernel.org>

ok :)

>
> > ---
> >  rust/kernel/revocable.rs | 20 +++++++++++++++-----
> >  1 file changed, 15 insertions(+), 5 deletions(-)
> >
> > diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
> > index 1e5a9d25c21b..d14f9052f1ac 100644
> > --- a/rust/kernel/revocable.rs
> > +++ b/rust/kernel/revocable.rs
> > @@ -61,6 +61,15 @@
> >  /// v.revoke();
> >  /// assert_eq!(add_two(&v), None);
> >  /// ```
> > +///
> > +/// # Invariants
> > +///
> > +/// - `data` is valid for reads in two cases:
> > +///   - while `is_available` is true, or
> > +///   - while the RCU read-side lock is taken and it was acquired whil=
e `is_available` was `true`.
> > +/// - `data` is valid for writes when `is_available` was atomically ch=
anged from `true` to `false`
> > +///   and no thread that has access to `data` is holding an RCU read-s=
ide lock that was acquired prior to
> > +///   the change in `is_available`.
> >  #[pin_data(PinnedDrop)]
> >  pub struct Revocable<T> {
> >      is_available: AtomicBool,
> > @@ -115,8 +124,8 @@ pub fn try_access(&self) -> Option<RevocableGuard<'=
_, T>> {
> >      /// object.
> >      pub fn try_access_with_guard<'a>(&'a self, _guard: &'a rcu::Guard)=
 -> Option<&'a T> {
> >          if self.is_available.load(Ordering::Relaxed) {
> > -            // SAFETY: Since `self.is_available` is true, data is init=
ialised and has to remain
> > -            // valid because the RCU read side lock prevents it from b=
eing dropped.
> > +            // SAFETY: `Self::data` is valid for reads because of `Sel=
f`'s type invariants,
>
> s/Self::data/self.data/

ok

>
> > +            // as `Self::is_available` is true and `_guard` holds the =
RCU read-side lock
>
> s/Self::is_available/self.is_available/

ok

>
> Missing `.` at the end.

ok, and sorry for this hehe . . .

>
> >              Some(unsafe { &*self.data.get() })
> >          } else {
> >              None
> > @@ -176,9 +185,10 @@ fn drop(self: Pin<&mut Self>) {
> >          // SAFETY: We are not moving out of `p`, only dropping in plac=
e
> >          let p =3D unsafe { self.get_unchecked_mut() };
> >          if *p.is_available.get_mut() {
> > -            // SAFETY: We know `self.data` is valid because no other C=
PU has changed
> > -            // `is_available` to `false` yet, and no other CPU can do =
it anymore because this CPU
> > -            // holds the only reference (mutable) to `self` now.
> > +            // SAFETY: `Self::data` is valid for writes because of `Se=
lf`'s type invariants,
>
> s/Self::data/self.data/
>
> > +            // and because this `PinnedDrop` context (having `&mut Sel=
f`) guarantees exclusive access,
> > +            // ensuring no other thread can concurrently access or rev=
oke `data`.
> > +            // This ensures `data` is valid for `drop_in_place`.
>
> This last sentence is not needed. Instead, we should mention that since
> this is a `drop` function, we're only called once, so it's fine to call
> drop (since that also is only allowed to be called once).
>

ok, I thought of something like:

// SAFETY: `self.data` is valid for writes because of `Self`'s type invaria=
nts.
// The `&mut Self` context guarantees exclusive access and a single
call to `drop`,
// making `self.data` valid for `drop_in_place`.


Thanks Benno! (^_^)b

Cheers,
Marcelo Moreira
