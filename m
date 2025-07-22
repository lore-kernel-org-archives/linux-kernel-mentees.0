Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F00285C91
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 22 Jul 2025 21:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753219434; cv=none; b=qFS03pkc6hi5S2q9H6gDAzyq5fhvMq8YTNhbQ9RBwtL3tTUPyF7963u4RdacTf6OASZdmG2J+S7fuMuO2KdQbjA7W6giUtVyrYGeHlTtMLJ2C1B65JMUqEMbxWDA3JnxjEUOPgLzNNL1NNt81Ys+1CuFHMbHUHhYPKT+RWgxQCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753219434; c=relaxed/simple;
	bh=b/7LJQ6qQ3Q5vacIEXk3tpmjxMdgqSwhrAK6bJjEcMc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N9UeEAPI564MGSrst6hNFEzYFmwbbBm+9k5eBQSjNHBz42f1zfdL5+H3WMs6mPwD2bgaVaFY18uBir4xwrvPm+pZMeeCVsZaYHy2yJvmyd/Zc2dL1brRv4kLtCSaapG/taqWSE8Ea/l4g4qvg6hwgHm0Wh6wl9NOrugbtIelJB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZxpP70ig; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZxpP70ig"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1848B41430
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 22 Jul 2025 21:23:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vpbyRUyonTeS for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Jul 2025 21:23:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::22d; helo=mail-oi1-x22d.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4F2D841453
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F2D841453
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZxpP70ig
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 4F2D841453
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 22 Jul 2025 21:23:52 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-40a4de1753fso154168b6e.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 22 Jul 2025 14:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753219431; x=1753824231; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHvXNQHoipe7vJQIGnLh+2kNSZ1IbtY7/n2adK7vTYo=;
        b=ZxpP70igjrJQ2RSJZeXpJiChaVmigAfhQ4843Rbfk13Er23JVv+0w3SMH4kjeUJV76
         kDq8/9o7Dbr4JKQQfk3llTwPnp7naSV61KKcudk4FJqrvyJAMjXnR5KJSXuRstaeLtum
         oV6wU1Rz+a5apz9QcwDSGZCQdTmG0U2VQB6qkxI1luzq+wpclGS2t7OzWbHbKZO9I1pw
         DQLXncNLjCKpW2PmVJyRcy5h4MwqIyq7kBPxTouKuIPZiv6Z47EAM0QZZLT5vfmAEZWV
         tKUDaThs0VV91t0iFgQ3xrWlBLvx6Zepyd7cQdUCBcMytjk3EkvSUF6vwo4sxWGvFdPH
         bkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753219431; x=1753824231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wHvXNQHoipe7vJQIGnLh+2kNSZ1IbtY7/n2adK7vTYo=;
        b=qv/4JcMqYOm27ELDakR5FAy4Kz7z7URo2i8ZXAVJkIq7u/WVtPXNMc8hoZFdi4zwmG
         Fw8puLXUs6ObX3/0fmGLap6cW+1pvfuolbj5aGJhcBQOJ8d8ug44A1moovPhEisIOYQu
         GKpiXd8V+gVgBARsn4QFmcYLHhDeeZco3iRmBPW6GAFLxzbSsDL8MRJrmdxOqp0llEnS
         GK3JJ12tH+MP/m07nEdC5UTLZOlZ5o6PP4H74xEF61ZrIuVPzVqODHUosfFeWuO3Uc1P
         pMqZG4hqJWpvBvtoK54oNeXxVm7x8eFWeNmO+/g8tB7sLQY4LRntZ4Lza4KWX9JeanQK
         xfMA==
X-Forwarded-Encrypted: i=1; AJvYcCXQGt9n/IK7C4Onsc/jJ6nYqqz9yR/JsnO0NCj1vvkSotM5fLd8rBDEL7CJNvtTh2YWxV1D5F56ZWSqzuWmrAVqTr79Pg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzHh3Bc+TzzwcdO0GUuWqd6bhSyxC5SDp856+SJQSDp1LyTqFy4
	gJM4mmKxH9IRlitwF8nd7DMUpra3Jb1j2IUPlxI9kQ6WC7fEvwWFSO/Hk1qT617TFaOwkVW06Of
	0apl1buJIdzQBZI5xc/v10A4L49W6/rs=
X-Gm-Gg: ASbGncsnf7smTYSyrWwjxsl3drjvTPJy5iqMLZeItBS8bNmLhhkOKryoDwpkbWLN4Lv
	3rAMGW78N6fWNBZcaEOrvMq+KVR443PONYTttwtDlrqI/GvZWYjAT+TYHXZFZiqpu9CsvNE2dtw
	nmtNmwe2KB8eY26e+bVFLegWKXlrMmC8gQiZkcCgNEn43kzDfSVuxO9ThlCI2iZQlIH9nwiFIDT
	mZKxtEv7m+SHERztdk=
X-Google-Smtp-Source: AGHT+IGa2JLI9RX6mt7SsEiS/wNhdhIMmcCi9mJkHqTggXOigNvlFvRp14Cy4MefV7xHd92FQIPl11lw0iis8HwqmmM=
X-Received: by 2002:a05:6808:1523:b0:41f:3a24:9726 with SMTP id
 5614622812f47-424a84208dbmr3909478b6e.18.1753219431099; Tue, 22 Jul 2025
 14:23:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250721010258.70567-1-marcelomoreira1905@gmail.com>
 <20250721010258.70567-4-marcelomoreira1905@gmail.com> <DBHSSQS2IALW.2OEWVKX6PY9LZ@kernel.org>
 <CAPZ3m_h4rvV8gfBi0ZQN=569FhB1+DsF2A6XkkLuWAFUEuKPDQ@mail.gmail.com> <DBIIZ28TA8SD.XY1W0S6G280F@kernel.org>
In-Reply-To: <DBIIZ28TA8SD.XY1W0S6G280F@kernel.org>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Tue, 22 Jul 2025 18:23:39 -0300
X-Gm-Features: Ac12FXyVLcBvfdnEb5gqZWjrw0-rbnrnXtkeCPveaPjQzHuYHMXwny0KC8iBtJo
Message-ID: <CAPZ3m_jepxCD-dr+gyun_=hb-fHX_yxTunsd4JX98nt4XmnEQA@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] rust: revocable: Document RevocableGuard
 invariants/safety and refine Deref safety
To: Benno Lossin <lossin@kernel.org>
Cc: aliceryhl@google.com, dakr@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em ter., 22 de jul. de 2025 =C3=A0s 07:51, Benno Lossin <lossin@kernel.org>=
 escreveu:
>
> On Tue Jul 22, 2025 at 1:01 AM CEST, Marcelo Moreira wrote:
> > Em seg., 21 de jul. de 2025 =C3=A0s 11:21, Benno Lossin <lossin@kernel.=
org> escreveu:
> >> On Mon Jul 21, 2025 at 3:01 AM CEST, Marcelo Moreira wrote:
> >> > Refinements include:
> >> > - `RevocableGuard`'s invariants are updated to precisely state that
> >> >   `data_ref` is valid as long as the RCU read-side lock is held.
> >> > - The `RevocableGuard::new` constructor is made `unsafe`, explicitly
> >> >   requiring callers to guarantee the validity of the raw pointer and
> >> >   RCU read-side lock lifetime.
> >> > - A new `SAFETY` comment is added to `Revocable::try_access` to
> >> >   justify the `unsafe` call to `RevocableGuard::new`, detailing how
> >> >   `Self`'s type invariants and the active RCU read-side lock ensure =
data
> >> >   validity for reads.
> >> > - The `Deref` implementation's `SAFETY` comment for `RevocableGuard`
> >> >   is refined.
> >> >
> >> > Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
> >> > ---
> >> >  rust/kernel/revocable.rs | 25 ++++++++++++++++++-------
> >> >  1 file changed, 18 insertions(+), 7 deletions(-)
> >> >
> >> > diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
> >> > index 6d8e9237dbdf..0048de23ab44 100644
> >> > --- a/rust/kernel/revocable.rs
> >> > +++ b/rust/kernel/revocable.rs
> >> > @@ -106,9 +106,12 @@ pub fn new(data: impl PinInit<T>) -> impl PinIn=
it<Self> {
> >> >      pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
> >> >          let guard =3D rcu::read_lock();
> >> >          if self.is_available.load(Ordering::Relaxed) {
> >> > -            // Since `self.is_available` is true, data is initialis=
ed and has to remain valid
> >> > -            // because the RCU read side lock prevents it from bein=
g dropped.
> >> > -            Some(RevocableGuard::new(self.data.get(), guard))
> >> > +            // SAFETY:
> >> > +            // - `self.data` is valid for reads because of `Self`'s=
 type invariants:
> >> > +            //   `self.is_available` is true.
> >> > +            // - The RCU read-side lock is active via `guard`, prev=
enting `self.data`
> >> > +            //   from being dropped and ensuring its validity for t=
he guard's lifetime.
> >>
> >> This shouldn't be needed.
> >
> > hmm, about what exactly?
> >
> > Are you suggesting to:
> > 1. Simplify the content of the `SAFETY`, is it too verbose?
>
> It's not too verbose. The requirement of holding the RCU read-side lock
> is not a *safety requirement*. It's already guaranteed by the existence
> of the `rcu::Guard` instance, so we don't need to concern ourselves with
> it in the safety requirements.
>
> Essentially you're just stating a tautology in the safety comment like
> saying "2 + 2 =3D 4".

Thanks for showing me that Benno.
So we can keep it like this:
// SAFETY: `self.data` is valid for reads because of `Self`'s type invarian=
ts:
// `self.is_available` is true.

Sounds good?

--=20
Cheers,
Marcelo Moreira
