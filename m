Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036D9242D65
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 21 Jul 2025 23:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753138895; cv=none; b=XRlGOgP87WLKVK+b3jnStNcYGB2eWj++TmGSI2y4OwkA2J9QnV1Jny9CVsprtCEvEIpUWq6BDUruweT8WtKxXM3jTuzDzFSmPi8EFinY1VE1VxuZm5meLsqvdO5hb/diw1CIDSbv4IjhbgGkPK+XuvSWi/AK/IIA7pN+6oto7YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753138895; c=relaxed/simple;
	bh=oSDk1m8uBMc0vfQ1c6DOmzGyXrUpcAabRQnRAew9ym4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GYSUWpEI18q+rJeyiKXsfmMyAv5OxKXLkRZFKregY6DxOWHmoe2BvhgJoAKocXzscox1nsMAxCafqK4wNMYPo1X5aL8MQP6ys+yTg0OD/oTNiVYouZjy5I3T57gIbNT1MsGWtpNFJcx3HiR4W7CPN9SM+pu6rXMR0Rzuygr/Zvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d5aF6tNS; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d5aF6tNS"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B71283EF1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 21 Jul 2025 23:01:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q-ieYeUU304j for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Jul 2025 23:01:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::232; helo=mail-oi1-x232.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AE04283F19
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE04283F19
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=d5aF6tNS
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
	by smtp1.osuosl.org (Postfix) with ESMTPS id AE04283F19
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 21 Jul 2025 23:01:31 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-41cfa50c73dso2381623b6e.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 21 Jul 2025 16:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753138890; x=1753743690; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZKEhto9raNL4YZsb1wsL16sv2nRjzkFcDwUj+fpIMmk=;
        b=d5aF6tNSWxlQtlb4qU2Z+xAvihQcqxVIGxceREXSKT4rIGxnLJK5JP0wM1dGTtSrGG
         O+mxUO4DqMF2hZSWTcFHhh0bN2A20aj12n6/3eyF7/3aJ8qXAUY+XMxP8kXIn5wP6A9b
         nOhrSGM7hewH1Klz2XHBj8u8clZfZqtaxhDGL5b0D29b0gQ2X3Wzj0db4W3tkqimsVAU
         4Y5u/jWK/s+ZVXLON66WXO0ouyGJYky2rt36YxF7VK539nE6coA+OdfSd2AlQenzm2Ge
         gGeXZyd8c6n8+GTBivw/irAJIVS8O7sEeHfMbWsIJCS9h6l74m+tgH0/wcGOdGtLkDQg
         oluw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753138890; x=1753743690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZKEhto9raNL4YZsb1wsL16sv2nRjzkFcDwUj+fpIMmk=;
        b=Qc1P/z+9mvM5/OTNzd4CWcgXgp69gM7m4kbVKUjvA0YEeRh/NvJPkJTn47n/Iq/j4W
         NNR2VkJ4Hdg2S4/xxiI3nK4iqTOYNwK806d1lnhuU6WiqlRddb177MpIbbMrHsHFn6Pt
         YaB26QNaIgN+Bt8h/VqZda+Mbc+R0Z8TWxB6wyz9LVV4SWrGaayatWjw0DDrMk+Bx6fD
         kdgUtuYG0kYD4Eqg3zk6rIpPuglp6IEcJK7VnV82iBpRVRz3FIzyp7L3M65iYsiceoXL
         0amvUJvcXQgnOy8Ri7UEQfmWPLgAhl75Q7+4u3/XqCJENkC+X+CeUSQnJrGJvvukp3r5
         5/Mg==
X-Forwarded-Encrypted: i=1; AJvYcCVZwbiENpM61FffgVM4wsBaxF0RArTEJbuqPSv8tgQPtoM2decF4ay1q+dyU9Kwk0fj/yTrf39AI/gv+tBDcUuPgXAtSg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yxn0DmeStlu2O2EtDJjgFehwj/fT9Ams1oAcaL089zskjPQNHsE
	5cERGx+34lXupW3m38psk0EUrxGxMGzpEkCBvu/opBNRJHvW6g5JGSu2cxqm5RjBS71vTIbYx2G
	xb2HGiNntgVmxRY2DnZJ0nF6j8+Pwz6I=
X-Gm-Gg: ASbGncs4Qh3olFIYNIdmPa76oV6HnhCBCHNkqnQz4feQj6Ugqm3aBHBYoQXT9IZPDB0
	UfZR064XjICUKwhjm2QIcogaL1WaiKQyHNBJIiMdFO30EFq65Zl/gFqr27cjOaVz8oeg/D/XVZ/
	AV4oinK90QmbHr2GQIfeOAwPFY62IvrZMljq6a64XeXv+oGp18RUKm/v8UwpvTE5pLOoIKy0seq
	OVZ8hDycewid+2e4QU=
X-Google-Smtp-Source: AGHT+IHEg/1nRFO7h5VeJ6NMKIyca/En9otpaW7j+5Z7nS9c7ZhKDcK96TDj17Jc6whIMqwuClziuR+Sa2ttAGlAnhc=
X-Received: by 2002:a05:6808:23ca:b0:409:f8e:726f with SMTP id
 5614622812f47-41e468a7a39mr12475498b6e.25.1753138890364; Mon, 21 Jul 2025
 16:01:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250721010258.70567-1-marcelomoreira1905@gmail.com>
 <20250721010258.70567-4-marcelomoreira1905@gmail.com> <DBHSSQS2IALW.2OEWVKX6PY9LZ@kernel.org>
In-Reply-To: <DBHSSQS2IALW.2OEWVKX6PY9LZ@kernel.org>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Mon, 21 Jul 2025 20:01:18 -0300
X-Gm-Features: Ac12FXzSAGc46XYmDiNTuW7c68kRxL3WL0wImhqKCCd7IO0sECbrPI3Sv-dSCQI
Message-ID: <CAPZ3m_h4rvV8gfBi0ZQN=569FhB1+DsF2A6XkkLuWAFUEuKPDQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] rust: revocable: Document RevocableGuard
 invariants/safety and refine Deref safety
To: Benno Lossin <lossin@kernel.org>
Cc: aliceryhl@google.com, dakr@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em seg., 21 de jul. de 2025 =C3=A0s 11:21, Benno Lossin <lossin@kernel.org>=
 escreveu:
>
> On Mon Jul 21, 2025 at 3:01 AM CEST, Marcelo Moreira wrote:
> > Refinements include:
> > - `RevocableGuard`'s invariants are updated to precisely state that
> >   `data_ref` is valid as long as the RCU read-side lock is held.
> > - The `RevocableGuard::new` constructor is made `unsafe`, explicitly
> >   requiring callers to guarantee the validity of the raw pointer and
> >   RCU read-side lock lifetime.
> > - A new `SAFETY` comment is added to `Revocable::try_access` to
> >   justify the `unsafe` call to `RevocableGuard::new`, detailing how
> >   `Self`'s type invariants and the active RCU read-side lock ensure dat=
a
> >   validity for reads.
> > - The `Deref` implementation's `SAFETY` comment for `RevocableGuard`
> >   is refined.
> >
> > Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
> > ---
> >  rust/kernel/revocable.rs | 25 ++++++++++++++++++-------
> >  1 file changed, 18 insertions(+), 7 deletions(-)
> >
> > diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
> > index 6d8e9237dbdf..0048de23ab44 100644
> > --- a/rust/kernel/revocable.rs
> > +++ b/rust/kernel/revocable.rs
> > @@ -106,9 +106,12 @@ pub fn new(data: impl PinInit<T>) -> impl PinInit<=
Self> {
> >      pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
> >          let guard =3D rcu::read_lock();
> >          if self.is_available.load(Ordering::Relaxed) {
> > -            // Since `self.is_available` is true, data is initialised =
and has to remain valid
> > -            // because the RCU read side lock prevents it from being d=
ropped.
> > -            Some(RevocableGuard::new(self.data.get(), guard))
> > +            // SAFETY:
> > +            // - `self.data` is valid for reads because of `Self`'s ty=
pe invariants:
> > +            //   `self.is_available` is true.
> > +            // - The RCU read-side lock is active via `guard`, prevent=
ing `self.data`
> > +            //   from being dropped and ensuring its validity for the =
guard's lifetime.
>
> This shouldn't be needed.

hmm, about what exactly?

Are you suggesting to:
1. Simplify the content of the `SAFETY`, is it too verbose?
2. Or are you suggesting that the use of bullet points within the
`SAFETY` is not preferred here?


> > +            Some(unsafe { RevocableGuard::new(self.data.get(), guard) =
})
> >          } else {
> >              None
> >          }
> > @@ -233,7 +236,7 @@ fn drop(self: Pin<&mut Self>) {
> >  ///
> >  /// # Invariants
> >  ///
> > -/// The RCU read-side lock is held while the guard is alive.
> > +/// - `data_ref` is a valid pointer for as long as the RCU read-side l=
ock is held.
> >  pub struct RevocableGuard<'a, T> {
> >      // This can't use the `&'a T` type because references that appear =
in function arguments must
> >      // not become dangling during the execution of the function, which=
 can happen if the
> > @@ -245,7 +248,15 @@ pub struct RevocableGuard<'a, T> {
> >  }
> >
> >  impl<T> RevocableGuard<'_, T> {
> > -    fn new(data_ref: *const T, rcu_guard: rcu::Guard) -> Self {
> > +    /// Creates a new `RevocableGuard`.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// Callers must ensure that `data_ref` is a valid pointer to a `T=
` object,
> > +    /// and that it remains valid for as long as the returned `Revocab=
leGuard` is alive.
> > +    /// The RCU read-side lock must be held for the duration of the gu=
ard's lifetime,
> > +    /// as indicated by `rcu_guard`.
>
> This last part shouldn't be needed, as the `rcu::Guard` already
> guarantees it.

Ok, I can remove just that part and keep the rest.

--=20
Cheers,
Marcelo Moreira
