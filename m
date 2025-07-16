Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A7F2BEC25
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 16 Jul 2025 20:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752696726; cv=none; b=pW+z+/SzWUgcVVNvg/Xap3EwRKXfBw17jQsUmtb8jrwKiE4dea6o+DEfXquWv/k+T/SWMdVO1mLzWpkcDAETRdldiNC99pbkBX+ya/LpHOqRGl0qvhrJsy6F2E9lW69mgecGwpkYo/OkjbUFlJw41CCFdk5F8GDSp4NPy7sw60c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752696726; c=relaxed/simple;
	bh=YlvdcJp3JJip5BkmEMaC0OZOtG+DOOiozRI/czCgQ0E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n4MbBX6dMHO9dAA44laDoxGct4vR1aW0BMREnnH58sXYLgSXE81RbZg+B2Q2TbAfqzZyTP1zmUUtdDO/a6ACWxRhs9JHaxER7+yBVvzOiQRzTMAqQwE2K+VjM6oH62icHi1wQQ3VUIliocBdJ5ZKFjxsxBaxwCFX5Tw+/dX/bz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m6iwWa/b; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m6iwWa/b"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3828083F3C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 16 Jul 2025 20:12:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1l8h0iMd4waQ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Jul 2025 20:12:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::c2b; helo=mail-oo1-xc2b.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 751E083CE5
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 751E083CE5
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=m6iwWa/b
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 751E083CE5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 16 Jul 2025 20:12:04 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-61593d5f92bso175657eaf.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 16 Jul 2025 13:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752696723; x=1753301523; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7fOuszaQr9CL9eUMJdejd3ksjD49N9Pv+PwPZ2WVlkU=;
        b=m6iwWa/bSlurWkfBsHL/iH9MHR/BYRjUIEhMhL92N9PEw8l6noTNx6uX0eGtuqV9FW
         b1GAdTcazeHAaDfDkbXClKVUP2CY3YiY7IxdSETvvSwog1J0sS1OS4HvGswoFNxus6/r
         QTn055xfx8Ogkgrx0KJe4wlUEnM9jF15r/icQExdZRWQWAOOxL6a4tLLHWU1eD8NGozC
         YtSsqYmLAJRLFHUmN3P+5eOFXt2vlr2X0UIsZW9Br72CFnZPWEsgTPNKRdPBnhlX9wLI
         KxPvlgf49Qo6fMGlFe/06OJROy9PIf52TrjgJ45JLmDQq4nTujlb0yls06T8/rJFRYR2
         FT2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752696723; x=1753301523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7fOuszaQr9CL9eUMJdejd3ksjD49N9Pv+PwPZ2WVlkU=;
        b=HAsj8mh9mIM98bNYrJWqaBfrUXvcUi2yIeXu22CfhUJDoJvzDrkKeYPgdPwAptyGfy
         6Klyh6KrMBj+ZVxroAkoVjuPQxlXyP4cShfYFlZvLBORHALq3iKHSfbcSug0jaC5tmwQ
         GJxhbVwwjPVdu/GqV2UVwl1xXEus6QIUJzFvkybmPC1RDae0Lu5kSHYdLn07v0MRep70
         wdE28WxOCwsUbE4/APPNhe3OJfLLnY1QPUQgzdMojFd6b8Yu2KWn+tTQg77gaK05K0+Y
         C1crCdoldHEvhh7XhcQ3RJuwbDU73N7puIFc9Hv3vNWvTR1BtndMVpcdCXieE2wXMyL2
         BP4g==
X-Forwarded-Encrypted: i=1; AJvYcCVR3A5s7s+v5ypelwvO5c98e4V3Pbb4GNs2prdhnY9ZbzUGrb+UHrer00MFLw6bO1hsa8KgnW/EdX5+KVYTIKhOexJ2Wg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yw9I10bKQIxQQ5lOnisTnlkBL7sVNVgtpF2nKRKXNc+m4djv8kx
	RT0rnhDmZGCGJQhXRoOb/cWCqM2cmBF12kYzmDkeV67WnwfZ74OHBnpLlu4oOEfHh3TZ9JOOtid
	upppJzni76OiPy3LztaaA+VahUaAGPa0=
X-Gm-Gg: ASbGncvUZ4SX/5MdfFYHQkPgH296qkx+qtUitHXgpKwBalqG8LFdbx5G9gA77aTMmhe
	LthvGn8Sasek0GnIfqGXMpfD9zGbhrSr8OSfhovVo67ekQL7jNpZ59ocsUmbbieVYeO0oEuhzSj
	TgudPnQg7z6DF6VRpBAJfOJZ3Reh5pYyYpVq9I3ZvYPi2c5ulUANYWxUWuttgrUXpROQMi+mFd0
	HnRW4FNfUnB7RE5F5k=
X-Google-Smtp-Source: AGHT+IEQSHCRDUqox4A+3jgkR2kJo21sUHMgOxfS1zQtZ5MJOe0bPnRbW+HkB8TRuyaCmEV4t/fDzNnmzYfdLIoZTys=
X-Received: by 2002:a4a:ee17:0:b0:613:bd07:54cc with SMTP id
 006d021491bc7-615acb4ab78mr666388eaf.0.1752696723268; Wed, 16 Jul 2025
 13:12:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250708003428.76783-1-marcelomoreira1905@gmail.com>
 <20250708003428.76783-4-marcelomoreira1905@gmail.com> <DB6RKSNTHUZ8.DW0EBFDU6L1I@kernel.org>
 <CAPZ3m_h37mCRO7oZX3qLnc+iFNwUu_wgYqEu_r0g-gtOB0661w@mail.gmail.com>
 <DB9XM595UG4V.3N51HST2TFVW@kernel.org> <CAPZ3m_grA_T_ixfHs7Z44nf5je4ftBcqCx=vcyvJOsJb+LaMFg@mail.gmail.com>
 <DBACAJ6K5FAH.3IHMMM6NHITEJ@kernel.org>
In-Reply-To: <DBACAJ6K5FAH.3IHMMM6NHITEJ@kernel.org>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Wed, 16 Jul 2025 17:11:52 -0300
X-Gm-Features: Ac12FXx6I_pvMjNlSUhQyRDG4BoZKqYwKlQFV3CMFCUpL4UwVshlKdP4q2iWoDw
Message-ID: <CAPZ3m_hmb9xpvy2tN_C36rEobMG1aJ5UQg6Y4hkM-Uy3AugjSg@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] rust: revocable: Document RevocableGuard
 invariants and refine Deref safety
To: Benno Lossin <lossin@kernel.org>
Cc: aliceryhl@google.com, dakr@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em s=C3=A1b., 12 de jul. de 2025 =C3=A0s 16:56, Benno Lossin <lossin@kernel=
.org> escreveu:
>
> On Sat Jul 12, 2025 at 8:49 PM CEST, Marcelo Moreira wrote:
> > Em s=C3=A1b., 12 de jul. de 2025 =C3=A0s 05:26, Benno Lossin <lossin@ke=
rnel.org> escreveu:
> >>
> >> On Sat Jul 12, 2025 at 1:06 AM CEST, Marcelo Moreira wrote:
> >> > Em ter., 8 de jul. de 2025 =C3=A0s 12:04, Benno Lossin <lossin@kerne=
l.org> escreveu:
> >> >> On Tue Jul 8, 2025 at 2:33 AM CEST, Marcelo Moreira wrote:
> >> >> > Improves the `RevocableGuard` documentation by explicitly stating=
 that
> >> >> > its `data_ref` member is a valid pointer as an invariant. Additio=
nally,
> >> >> > the `Deref` implementation's `SAFETY` comment is refined to justi=
fy
> >> >> > the `unsafe` dereference based on this new invariant and the
> >> >> > `_rcu_guard` ensuring data accessibility.
> >> >> >
> >> >> > These changes address feedback regarding the clarity and complete=
ness
> >> >> > of `RevocableGuard`'s safety guarantees.
> >> >> >
> >> >> > Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
> >> >> > ---
> >> >> >  rust/kernel/revocable.rs | 7 ++++---
> >> >> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >> >> >
> >> >> > diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
> >> >> > index 6d8e9237dbdf..64fe44b4f5a3 100644
> >> >> > --- a/rust/kernel/revocable.rs
> >> >> > +++ b/rust/kernel/revocable.rs
> >> >> > @@ -233,7 +233,8 @@ fn drop(self: Pin<&mut Self>) {
> >> >> >  ///
> >> >> >  /// # Invariants
> >> >> >  ///
> >> >> > -/// The RCU read-side lock is held while the guard is alive.
> >> >> > +/// - `data_ref` is a valid pointer to a `T` object for the enti=
re lifetime of this guard.
> >> >>
> >> >> This should be:
> >> >>
> >> >>     /// - `data_ref` is a valid pointer for as long as the RCU read=
-side lock is held.
> >> >>
> >> >> > +/// - The RCU read-side lock is held while the guard is alive.
> >> >>
> >> >> And this invariant is unnecessary.
> >> >>
> >> >> >  pub struct RevocableGuard<'a, T> {
> >> >> >      // This can't use the `&'a T` type because references that a=
ppear in function arguments must
> >> >> >      // not become dangling during the execution of the function,=
 which can happen if the
> >> >> > @@ -258,8 +259,8 @@ impl<T> Deref for RevocableGuard<'_, T> {
> >> >> >      type Target =3D T;
> >> >> >
> >> >> >      fn deref(&self) -> &Self::Target {
> >> >> > -        // SAFETY: By the type invariants, we hold the rcu read-=
side lock, so the object is
> >> >> > -        // guaranteed to remain valid.
> >> >> > +        // SAFETY: `self.data_ref` is valid for writes because o=
f `Self`'s type invariants,
> >> >> > +        // and `_rcu_guard` ensures the data's accessibility for=
 the lifetime of this guard.
> >> >>
> >> >> This also needs to be adjusted.
> >> >>
> >> >> Also this patch should fix any invariant comments needed to constru=
ct
> >> >> `RevocableGuard`.
> >> >
> >> > Regarding this point, "...fix any invariant comments needed to
> >> > construct `RevocableGuard`."
> >> >
> >> > I looked at the function that constructs `RevocableGuard`
> >> > (try_access->RevocableGuard::new) and I think it's correct.
> >> >
> >> > In `try_access`, the comment justifies the validity of self.data.get=
()
> >> > by mentioning that `self.is_available` is true and that the RCU read
> >> > lock prevents data from being dropped. This aligns well with what we
> >> > already have in try_access_with_guard, for example (from patch 1/3).
> >>
> >> The comment seems wrong to me, it isn't even an `INVARIANT` comment. I=
t
> >> also talks about RCU in the wrong way and doesn't mention the type
> >> invariants of `Self`...
> >>
> >> > Since there are no other code snippets that construct
> >> > `RevocableGuard`, I thought I'd submit the patch with just the
> >> > adjustments I made previously.
> >>
> >> There also is the `new` function of `RevocableGuard` that doesn't use =
an
> >> invariant comment. It also isn't unsafe despite taking a raw pointer..=
.
> >> So either we make it unsafe, add the correct safety requirements which
> >> should just be the type invariants of the guard or we remove it, since
> >> we only use it once.
> >
> > Even if it's only called once, I think it's better to make `new`
> > unsafe because it can be used in the future, and keeping it unsafe
> > gives us the advantage of maintainability.
>
> Eh I'm not so sure that there is the need to construct it in more places
> than one. And if we ever need it, we could add it back in. But we can go
> either way. Maybe Danilo has a preference?
>
> > Understood, Benno. I'll change `new` to be unsafe, change
> > `RevocableGuard::new` to an unsafe block, and adjust the `SAFEFY`
> > comment.
> > ok?
>
> Sounds good, you also need to add an invariant comment inside of
> `RevocableGuard::new`.

Ok, Thanks Benno! :)

--=20
Cheers,
Marcelo Moreira
