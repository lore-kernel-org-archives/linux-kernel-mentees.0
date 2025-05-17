Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA0123DE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 17 May 2025 00:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747440201; cv=none; b=OuoUgfDJ0Ek9jjAvGwfZiFDyIXu6U4hiQ9UF0FOxCjit0tAjV0QviAfQTZ+YJtU4tcaXzgz8EZBUNfPaLRHr7j7XJZlGXTD2Xw5P7loFfOP4x5o2PcYPkbPyNe0OV+Hgf1gb9sxL/Yr2RbA/hywGC/VCk3BZCd74wK//mttBUqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747440201; c=relaxed/simple;
	bh=NZ3zAOgFrGZJhZlkzLRCBvTh2j9Kn3YGWDHl6HOO2MU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=My2q6C7LeSH9hCDfETQrg34jYWOAiqZQ2/erPLIB6ZsgqmtwswBMszlWQe9WSxDGL+yV3hUuBN7kF6FpfSLsh3Gfo/NbyFGe6bi/SZPHJondAUF5BRJMKokE764uHg+tcttlp8m+UP8uSNvYDA33Wu6cxqHT0Pw1KgpquxoqEqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aGzAQCd4; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aGzAQCd4"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C19A419C8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 17 May 2025 00:03:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RSqmW6ADTJRn for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 May 2025 00:03:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2A326419C5
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A326419C5
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aGzAQCd4
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 2A326419C5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 17 May 2025 00:03:17 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-72c172f1de1so2013460a34.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 16 May 2025 17:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747440196; x=1748044996; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fH8dW5UE47sf3FpTA0xQ8yqieYLO4yazP4wNG7Z03EA=;
        b=aGzAQCd4l8Rd4o7gVpOsigjZcKi4TRn4gMl3sEfzGLzjA9BPzKzDs3d6RDMT80dv0i
         vbhhTgmlxBmaf+enoDDBY/kEqpBFC0g2WqXDWTdepfO3eJYxHYi9qOBbfn6wjLjfKzSL
         mLguJz7W4E5SoUBIyPyuU8QbpwMydG7esqqRya1iZil/fDL42PabEbDx0NnXrGHPPBev
         FMILtKlUmzg6rsI3a2rLCvhtauO9kgjxKtZJQxm5DEIKhnx2oZKLLgSQvacXpJHQs2XR
         J+xA7KAmb6hy6LW/4/srhph1pMEh4600Blw/UYFS3Jly21CyZxVlWIZRBMr7jU3Nd8ig
         ePNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747440196; x=1748044996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fH8dW5UE47sf3FpTA0xQ8yqieYLO4yazP4wNG7Z03EA=;
        b=wwbYMDTdB+gmwo9bykh/W/s9ueHiaojUH4mGmd9zwawHC/+F1WUxaBbVDzrZ0UW6pw
         oeoy5ifuilq+N5PaAqYTy8N/YSdgY8+nowebOU5QX/bxbiFU0RZIwwQQbE2uVedhDpov
         ozENg9mjUV6tFGw8nrwYOlW10mNL0LwnvIz3ZWE429T81SDAFkXRGYxNpW91ZI1AV0gQ
         OM7ShYB83+UYUmW9SdToHyTQQUVDz1k2fZoiY0W8pVuBFhHWVDIkLV7DFvNi5lAnrUbr
         dJ6aI3NUy/SJRYp7+iAVeA2I39/VNOndwRx4GO2rM45FlCoud5C25jIDjA4yBZq1XTst
         9+ng==
X-Forwarded-Encrypted: i=1; AJvYcCVGaVgv5mMkq3FS6PZFsQTKaNu0vgyvEIJzs5zkdkJuW4tgEwYRKTZw4un9eZxojiw3qnG5tsaJ2XVNO2LmFDkg1LK0XQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yz91u3o8Yim0NT8RmqtEpLhcYjUnrZQDXB1x3vV/uFIN6ma8Bf7
	llek9mnmxejBIR3zoJy3Eivyk2D98HLyZgtKoT4rBWs2QXqTLzGC65BiOE+PrXEtHxaH5KQXOxB
	o/WyIZ6f6LCQvVENCXfrZlS/G9kNZBTc=
X-Gm-Gg: ASbGncvGauJPx/Y/ZtqjF3j+peDpoSBGCE37BpXxp8eH9+OxRgmkvDLDovfZVALd+ha
	zlWuaJMD9nLMXR16FD8fpHFktiDDs2z+K4gVb1E4HwttF43OWZjidFZUGWmgi432Mh5uWhf7rTY
	giPUyqWLeT1L73ZgKaRe1FcS6UQI2AynWBtlUb8n6NvEIt
X-Google-Smtp-Source: AGHT+IFjo3ZVivpjBOBjIP4euGZPLiHArWJ0VKrlzqgnciqA+1NgqmU3r5gGh9fWuqsuXmaOq682r80GWhDstpRxgIQ=
X-Received: by 2002:a05:6808:6a98:b0:403:3626:b33b with SMTP id
 5614622812f47-404d8698a2bmr3958980b6e.9.1747440195822; Fri, 16 May 2025
 17:03:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250503145307.68063-1-marcelomoreira1905@gmail.com> <D9RJQYNTIOK1.3HI7NDDWPK6IM@kernel.org>
In-Reply-To: <D9RJQYNTIOK1.3HI7NDDWPK6IM@kernel.org>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Fri, 16 May 2025 21:03:04 -0300
X-Gm-Features: AX0GCFu1wMIZlUomooF1C3N7EyveU1xK_LrLv8fLTi2NGxo1Hq7deXXY70_wo8o
Message-ID: <CAPZ3m_hZ0uNgwpRefMOuu7x7q011VVzfntMRV5D68wdcrjnLAw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: doc: Clarify safety invariants for Revocable type
To: Benno Lossin <lossin@kernel.org>
Cc: benno.lossin@proton.me, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello guys!

Thank you for the continued feedback =3D)

Based on your point, I'm revising the `# Invariants` section for `Revocable=
<T>`
to be more precise about when access to `data` is valid. I'm
considering the following wording:

- data is valid if and only if is_available is true.
- Access to data is valid while the RCU read-side lock is held, ensuring no
concurrent revocation, or within the specific scope of the
revoke_internal function
where the revocation logic guarantees exclusive access before dropping data=
.
 - Once is_available is set to false, further access to data outside
of the revocation
process is disallowed, and the object is dropped either after an RCU
grace period
(in [revoke]), or immediately (in [revoke_nosync]).

I've attempted to clarify that the RCU read-side lock protects against
concurrent
revocation during normal access, but that `revoke_internal` has its own saf=
ety
guarantees that allow access without the lock in that specific context. I
'd appreciate your feedback on this revised wording to ensure it accurately
reflects the intended behavior and safety invariants.

Thank you for your patience and guidance. I will send the next version
of the patch soon.

Best regards,
Marcelo Moreira


Em sex., 9 de mai. de 2025 =C3=A0s 07:10, Benno Lossin <lossin@kernel.org> =
escreveu:
>
> On Sat May 3, 2025 at 4:53 PM CEST, Marcelo Moreira wrote:
> > The Revocable type in rust/kernel/revocable.rs lacked a comprehensive
> > documentation of its safety invariants, specifically regarding the
> > validity of the wrapped data and the necessity of holding the RCU
> > read-side lock for access. This patch addresses this by:
> >
> > - Adding an '# Invariants' section to the documentation of `Revocable<T=
>`
> >   clarifying that `data` is valid if and only if `is_available` is true=
,
> >   and that access to `data` requires holding the RCU read-side lock.
> > - Adding '// INVARIANT:' comments in `try_access` and `try_access_with_=
guard`
> >   to explicitly refer to these invariants before accessing the underlyi=
ng data.
> > - Adding an '# Invariants' section to the documentation of `RevocableGu=
ard<'_, T>`
> >   documenting that the RCU read-side lock is held for the lifetime of t=
he guard
> >   and that `data_ref` points to valid data during this time.
> > - Updating the safety comment in the `Deref` implementation of `Revocab=
leGuard`
> >   to explicitly mention the relevant invariants.
> >
> > Changes in v2:
>
> The changelog should not be part of the commit message, instead place it
> below the `---`, but before any file diff. It then will only appear in
> the email and not the commit message.
>
> Another thing: could you please CC Danilo Krummrich the next time you
> send this patch? I think he should also take a look at this.
>
> >
> > - Refined the wording of the invariants in `Revocable<T>` to be more di=
rect
> >   and address feedback regarding the phrase 'must occur'.
> > - Added '// INVARIANT:' comments in `try_access` and `try_access_with_g=
uard`
> >   as suggested by reviewers.
> > - Added the missing invariant for `RevocableGuard<'_, T>` regarding the
> >   validity of `data_ref`.
> > - Updated the safety comment in the `Deref` implementation of `Revocabl=
eGuard`
> >   to refer to the new invariant.
> >
> > Reported-by: Benno Lossin <benno.lossin@proton.me>
> > Closes: https://github.com/Rust-for-Linux/linux/issues/1160
> > Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> > Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
> > ---
>
> ^^ right here would be the place for the changelog.
>
> >  rust/kernel/revocable.rs | 29 ++++++++++++++++-------------
> >  1 file changed, 16 insertions(+), 13 deletions(-)
>
> It seems to me that you sent this patch on top of your previous one [1].
> Normally, one doesn't do that and instead sends the patch based on a tag
> (like `v6.15-rc4`) or the subsystems `-next` branch (so in our case
> `rust-next`). So a new version should not rely on any previous one.
>
> [1]: https://lore.kernel.org/all/20250501005726.744027-1-marcelomoreira19=
05@gmail.com
>
> > diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
> > index 2da3e9460c07..7ef2f34782b4 100644
> > --- a/rust/kernel/revocable.rs
> > +++ b/rust/kernel/revocable.rs
> > @@ -64,12 +64,11 @@
> >  ///
> >  /// # Invariants
> >  ///
> > -/// - The wrapped object `data` is valid if and only if `is_available`=
 is `true`.
> > -/// - Access to `data` must occur only while holding the RCU read-side=
 lock (e.g., via
> > -///   [`Revocable::try_access`] or [`Revocable::try_access_with_guard`=
]).
> > -/// - Once `is_available` is set to `false`, further access to `data` =
is disallowed,
> > -///   and the object is dropped either after an RCU grace period (in [=
`revoke`]),
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
>
> > +/// - Once is_available is set to false, further access to data is dis=
allowed,
> > +///   and the object is dropped either after an RCU grace period (in [=
revoke]),
> > +///   or immediately (in [revoke_nosync]).
>
> Several missing `
>
> >  #[pin_data(PinnedDrop)]
> >  pub struct Revocable<T> {
> >      is_available: AtomicBool,
> > @@ -106,8 +105,9 @@ pub fn new(data: impl PinInit<T>) -> impl PinInit<S=
elf> {
> >      pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
> >          let guard =3D rcu::read_lock();
> >          if self.is_available.load(Ordering::Relaxed) {
> > -            // Since `self.is_available` is true, data is initialised =
and has to remain valid
> > -            // because the RCU read side lock prevents it from being d=
ropped.
> > +            // INVARIANT: Since `self.is_available` is true, `self.dat=
a` is valid. The
> > +            // RCU read-side lock held by `guard` ensures that `self.d=
ata` remains valid for
> > +            // the lifetime of the guard.
> >              Some(RevocableGuard::new(self.data.get(), guard))
> >          } else {
> >              None
> > @@ -124,8 +124,10 @@ pub fn try_access(&self) -> Option<RevocableGuard<=
'_, T>> {
> >      /// object.
> >      pub fn try_access_with_guard<'a>(&'a self, _guard: &'a rcu::Guard)=
 -> Option<&'a T> {
> >          if self.is_available.load(Ordering::Relaxed) {
> > -            // SAFETY: Since `self.is_available` is true, data is init=
ialised and has to remain
> > -            // valid because the RCU read side lock prevents it from b=
eing dropped.
> > +            // SAFETY:
>
> Empty SAFETY comment?
>
> > +            // INVARIANT: Since `self.is_available` is true, `self.dat=
a` is valid. The
> > +            // RCU read-side lock held by `_guard` ensures that `self.=
data` remains valid for
> > +            // the lifetime of the returned reference.
> >              Some(unsafe { &*self.data.get() })
> >          } else {
> >              None
> > @@ -200,7 +202,8 @@ fn drop(self: Pin<&mut Self>) {
> >  ///
> >  /// # Invariants
> >  ///
> > -/// The RCU read-side lock is held while the guard is alive.
> > +/// The RCU read-side lock is held for the lifetime of this guard.
> > +/// `data_ref` points to valid data for the lifetime of this guard.
>
> Please use a bullet point list.
>
> ---
> Cheers,
> Benno
>
> >  pub struct RevocableGuard<'a, T> {
> >      data_ref: *const T,
> >      _rcu_guard: rcu::Guard,
> > @@ -221,8 +224,8 @@ impl<T> Deref for RevocableGuard<'_, T> {
> >      type Target =3D T;
> >
> >      fn deref(&self) -> &Self::Target {
> > -        // SAFETY: By the type invariants, we hold the rcu read-side l=
ock, so the object is
> > -        // guaranteed to remain valid.
> > +        // SAFETY: By the invariant of `Revocable`, `self.data_ref` is=
 valid because the
> > +        // RCU read-side lock is held for the lifetime of this guard.
> >          unsafe { &*self.data_ref }
> >      }
> >  }
>
