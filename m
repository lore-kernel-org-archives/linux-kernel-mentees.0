Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C6C28A1F5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 12 Jul 2025 18:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752346207; cv=none; b=LEVvkYYkjoy6dXCr2ySLszjsfDPrguv8fT+zaSKQJGyJ+z+XgGigKFn5t/a53hCr6csAdITE/+VhigdldecrOsJBHsBFK1Ksdla5JozHFB/ggYdyHBqV5yBPOgwAJVfGZOASkMmopZ4SrngN3GC+5N6o55UvMYy97rGogO5InNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752346207; c=relaxed/simple;
	bh=DB6Ga8bM7aygL1kZpLGO9sfqmiDJCBOeNWjASjzmSLM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bNA5OEZ+y6UShsj80Yp9JC0B9vybMsrww5znkG53QoWYWKAJgEFAql0pyAQYcSQBvxQLcqbwEFBV6BOJ6KETAlbSZ+/Uz57caU3XLKeahD1mqpcRh2499TSgD6P48oQ4vbxvapkYg/vSKdC4AXzqG6v8rKSSJRwdt23fdro0wqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NviRsuaU; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NviRsuaU"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFDC560F94
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 12 Jul 2025 18:50:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aIX0uFBMLh0j for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Jul 2025 18:50:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::22c; helo=mail-oi1-x22c.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1958260F0E
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1958260F0E
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NviRsuaU
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1958260F0E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 12 Jul 2025 18:50:04 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-40af40aee93so1953924b6e.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 12 Jul 2025 11:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752346204; x=1752951004; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wmITCC/KfIDuOyy8MkPRa7zW/SdFzcGJZzQ3YXREI8w=;
        b=NviRsuaUZmR/CrId6RQB3idbNMdF+o+NHNR9ROTS2V5JVJ6eQWK9GszVErbYcIAsnE
         yYvI3dEFFrKs1L8X1FAD4oHNDRR5hOpB3EZPEmbiwJ9OJP/laEpO/jUFS0wot6zVtnS7
         tw7/Wf5GjSarB0sus1lrrVNs8P2awsFd/4UnUjyy1QwM9ShCukKgu+qnDObTBF3TDKcX
         xYs5QoSOBeIckRLdlRkfkFQCpeeuDU2lZH2u4b9Wn2DNqW0cwf1zbMUjWAZDeauViLKe
         St3BSKOt8lWlI3PDcaYej2tPltOBYBDbklAPXG1WZBh1yR1T8B5sUqUz8weyDCiR1IrE
         h8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752346204; x=1752951004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wmITCC/KfIDuOyy8MkPRa7zW/SdFzcGJZzQ3YXREI8w=;
        b=rGFw4YU99UsS9k+zEKb7384BBSqpkrfmKLkVhKac5BrutOKhqMtBqX9RjuW1Fi0kyz
         g+f/gBANSEsA+A/PYve4VYyTldHgPJXnP9lZq+D3YnSCKmVBCU44AOkYL5lPUezRWDc1
         k2xCMFIGbbyqpr2SlkSzxjBYVKKlOQbmeWo/CHqsPt410u+ZnmN1xRGWyp1PYCThKxDn
         YGp0/CgW+s09aWz0QA5mUqw+JYRMp2Q3XZ/Pc0O4c5CV6MMBEKXNJv4Zr9yYVOciKTHI
         IelBMUlF3ECbEkx9Rig4NUH8mCp5oYQmxJrF1ZYt7UX85kvEuUy58GU0NCc3pkiWKBDb
         Cdmg==
X-Forwarded-Encrypted: i=1; AJvYcCXQgsgNIfGUdOhM1fgHECtyEwb+IhVidgRlvt+G4mVoquPR0aTjR0E8PXr37JgSiZKGM7z7etjla3dU23HT+U5BeKb1PA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxuFwOE//B51vRyWO1WXQB8jYw0tSXJYE2k7Qq7s38M31h49zYg
	B6nuYsGrem7c2qgkSWX0A059fEzrweRmUxFzY4/djjYppmqrq2lUWT5jEvTU0pyMGr7pQdKqc9Y
	VRT9tAP6s7yoEBgo8Kk444XWiVOcsFps=
X-Gm-Gg: ASbGncuMPuAZieL5HiTGaZe1MYgM5/jkb228qfFsNGGEBytX/i02Y9NcJR2IqmDpMFd
	3oUMk1IpMZ0oa6FnU1dRi0xTHCh3u527WacbUHvy54q7GjnsQB5MoPPAhnn0UCaGhAwnOc6ex9W
	9JS9wgYUkuf6FxXsmGTLS4Fpq7cYFV0BzuOxP29XSWHkA+34O7OVOkeftigLG2RZCXB/qD5tFyt
	3z4b3LrKXwd+nUUkDM=
X-Google-Smtp-Source: AGHT+IHrnGtltH6d/LHRfVMeejHGN49UH18y373XYXucdgMGhTHtMXV2dUQV7GZp/6Uns+6AEbERNSDwNpcuNgUXiN8=
X-Received: by 2002:a05:6808:1307:b0:406:6d79:49d2 with SMTP id
 5614622812f47-41567b4d886mr4828348b6e.26.1752346203776; Sat, 12 Jul 2025
 11:50:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250708003428.76783-1-marcelomoreira1905@gmail.com>
 <20250708003428.76783-4-marcelomoreira1905@gmail.com> <DB6RKSNTHUZ8.DW0EBFDU6L1I@kernel.org>
 <CAPZ3m_h37mCRO7oZX3qLnc+iFNwUu_wgYqEu_r0g-gtOB0661w@mail.gmail.com> <DB9XM595UG4V.3N51HST2TFVW@kernel.org>
In-Reply-To: <DB9XM595UG4V.3N51HST2TFVW@kernel.org>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Sat, 12 Jul 2025 15:49:52 -0300
X-Gm-Features: Ac12FXyJ-xuhxJnQvJzFdVIc4nNkoqOGmBgB8Mc0t3TJ_NJLBm_WmDalyOBRRTo
Message-ID: <CAPZ3m_grA_T_ixfHs7Z44nf5je4ftBcqCx=vcyvJOsJb+LaMFg@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] rust: revocable: Document RevocableGuard
 invariants and refine Deref safety
To: Benno Lossin <lossin@kernel.org>
Cc: aliceryhl@google.com, dakr@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em s=C3=A1b., 12 de jul. de 2025 =C3=A0s 05:26, Benno Lossin <lossin@kernel=
.org> escreveu:
>
> On Sat Jul 12, 2025 at 1:06 AM CEST, Marcelo Moreira wrote:
> > Em ter., 8 de jul. de 2025 =C3=A0s 12:04, Benno Lossin <lossin@kernel.o=
rg> escreveu:
> >> On Tue Jul 8, 2025 at 2:33 AM CEST, Marcelo Moreira wrote:
> >> > Improves the `RevocableGuard` documentation by explicitly stating th=
at
> >> > its `data_ref` member is a valid pointer as an invariant. Additional=
ly,
> >> > the `Deref` implementation's `SAFETY` comment is refined to justify
> >> > the `unsafe` dereference based on this new invariant and the
> >> > `_rcu_guard` ensuring data accessibility.
> >> >
> >> > These changes address feedback regarding the clarity and completenes=
s
> >> > of `RevocableGuard`'s safety guarantees.
> >> >
> >> > Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
> >> > ---
> >> >  rust/kernel/revocable.rs | 7 ++++---
> >> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >> >
> >> > diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
> >> > index 6d8e9237dbdf..64fe44b4f5a3 100644
> >> > --- a/rust/kernel/revocable.rs
> >> > +++ b/rust/kernel/revocable.rs
> >> > @@ -233,7 +233,8 @@ fn drop(self: Pin<&mut Self>) {
> >> >  ///
> >> >  /// # Invariants
> >> >  ///
> >> > -/// The RCU read-side lock is held while the guard is alive.
> >> > +/// - `data_ref` is a valid pointer to a `T` object for the entire =
lifetime of this guard.
> >>
> >> This should be:
> >>
> >>     /// - `data_ref` is a valid pointer for as long as the RCU read-si=
de lock is held.
> >>
> >> > +/// - The RCU read-side lock is held while the guard is alive.
> >>
> >> And this invariant is unnecessary.
> >>
> >> >  pub struct RevocableGuard<'a, T> {
> >> >      // This can't use the `&'a T` type because references that appe=
ar in function arguments must
> >> >      // not become dangling during the execution of the function, wh=
ich can happen if the
> >> > @@ -258,8 +259,8 @@ impl<T> Deref for RevocableGuard<'_, T> {
> >> >      type Target =3D T;
> >> >
> >> >      fn deref(&self) -> &Self::Target {
> >> > -        // SAFETY: By the type invariants, we hold the rcu read-sid=
e lock, so the object is
> >> > -        // guaranteed to remain valid.
> >> > +        // SAFETY: `self.data_ref` is valid for writes because of `=
Self`'s type invariants,
> >> > +        // and `_rcu_guard` ensures the data's accessibility for th=
e lifetime of this guard.
> >>
> >> This also needs to be adjusted.
> >>
> >> Also this patch should fix any invariant comments needed to construct
> >> `RevocableGuard`.
> >
> > Regarding this point, "...fix any invariant comments needed to
> > construct `RevocableGuard`."
> >
> > I looked at the function that constructs `RevocableGuard`
> > (try_access->RevocableGuard::new) and I think it's correct.
> >
> > In `try_access`, the comment justifies the validity of self.data.get()
> > by mentioning that `self.is_available` is true and that the RCU read
> > lock prevents data from being dropped. This aligns well with what we
> > already have in try_access_with_guard, for example (from patch 1/3).
>
> The comment seems wrong to me, it isn't even an `INVARIANT` comment. It
> also talks about RCU in the wrong way and doesn't mention the type
> invariants of `Self`...
>
> > Since there are no other code snippets that construct
> > `RevocableGuard`, I thought I'd submit the patch with just the
> > adjustments I made previously.
>
> There also is the `new` function of `RevocableGuard` that doesn't use an
> invariant comment. It also isn't unsafe despite taking a raw pointer...
> So either we make it unsafe, add the correct safety requirements which
> should just be the type invariants of the guard or we remove it, since
> we only use it once.

Even if it's only called once, I think it's better to make `new`
unsafe because it can be used in the future, and keeping it unsafe
gives us the advantage of maintainability.

Understood, Benno. I'll change `new` to be unsafe, change
`RevocableGuard::new` to an unsafe block, and adjust the `SAFEFY`
comment.
ok?

--=20
Cheers,
Marcelo Moreira
