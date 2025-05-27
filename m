Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C279C2DCC03
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 27 May 2025 01:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748307749; cv=none; b=Z4kd7efGL056DkaFJxyNzmyVl8i+U37B+Vl5PTEhlNNfDYM7j4KLJtu14llIBFsP2eT+lYIQ7xNWZgDe9+mlbtdNuJ48N+gXA9uid6qlw7xXDsWjpgyHLu+fA6hEKJvI2JA7pbkJT3o7V9i0qVRENffIGR2dtCWhs4YtC1AKmGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748307749; c=relaxed/simple;
	bh=0zeiApF+hMFh7qGgQ7iRGgc4LjMhDlkxLVc4oGtkjUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kyU0cztgLTRsrsob8IDtTpZ/uV0o9Nn01W9xPZ27jbJCPsbKAHn4OLQXrpEoMcuyfrgkUhE3weeWSTH9+qPcFCwIpVJCq92emFEtXx8EH6/k8qC5Va9KL6SpvK8wPms2aNGjSzMbuBbbgCFiTeMsv1mS2sN8jqVb/m82a7b/7jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G/cG91Tm; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G/cG91Tm"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43D4480CDD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 27 May 2025 01:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g1ZpGHnTl1ZD for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 May 2025 01:02:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4860:4864:20::35; helo=mail-oa1-x35.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 39CCE80B0E
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39CCE80B0E
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=G/cG91Tm
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 39CCE80B0E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 27 May 2025 01:02:26 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-2cc57330163so1603770fac.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 May 2025 18:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748307745; x=1748912545; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xzPkwOHwuY5jSZtUaFAgkkFRTbCA4+qYv5OsytzJXDQ=;
        b=G/cG91TmZDUIPG43I+cvyGaFKg5UrF3QOu3xZffP8SdKglpHz3g2bChY5IdmZiu6d1
         j0Tn+tUKUKo37eOMjvRy2/+x/GTBf6Q/xiOmfiNdFJ1wUyJJlleiugV2yPKf/qvHmCxb
         GxOLP047pk8EGFRICypgPZgiXo3XX97WUpUwtcD5wPsjW1Wcwg5nc4IIyUbk+ko2DPv9
         4omm2ln/E0/+ZQVR15Xvn42swVu5Uyz3GbH5QNYhsBzL4+CJZIvLSIJvg07VR5CXlY+Z
         s63dgf6Ql7CN6Xj9IlvnzLNJrK0g+YM+LtEC7XmUbGyInQclOiMtGZ8C/0bXZi+7J/x/
         aOTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748307745; x=1748912545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xzPkwOHwuY5jSZtUaFAgkkFRTbCA4+qYv5OsytzJXDQ=;
        b=YeFYU3s1PpwMFDoILMIvS+oyWDxias5p0oX1v7HzN6Yf1U2wwkSqDFW3iWx3uoYlgy
         4hDRC9WJzxSu9LdAaC7bqTSUlq5i185+j+NBdeslyB5yJ6dRC0yL7Ss1t22JFM0acwEV
         ZD7bBJUQPNK2UAnWEGkCCb7Yj/3klTWuX4NSNQECAaxgkS3YoJROVTHEnrQQz7cOO9Cp
         2MmtzaECWX2ImeM7pE9pW3VazicSLly3d6yPXbl3p0u8QPd80/HPfrFDpIGLEHLxml3F
         DjaIIS5wG9eqRu/g8JrIe/m2+bT5E7y/OBy+kxMgu0sA843MCLF3nIwRUg8hvd+RFJtg
         kBlg==
X-Forwarded-Encrypted: i=1; AJvYcCVOOnib8pPi4AJFFYp0igMKbfIsCyG+X07OstEk9IoOpSWpwFPLWf4cYKD4gxMTudHS4tp7eoVeHGKblk8dE9yka+BMAQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzcnUw2oaR1KWU7BthlCjYZuWve+M3DYYjaAO1e72LRY0dvVLiE
	+kqqU/GGX2OHGYZso7YE4n4dDaZBHmiD/y65LwZsxhgBzj4r05maBsyHgn3Qs8yGeiVXH1TCHj+
	vrJBjQnpRS4GdUicxHvNv7n4mXx0tvmk=
X-Gm-Gg: ASbGncsqDv1cmsKkkMNjG2Kevawbb4CCy2ZCj0BeEUOLg3nsrJmi9E7r8gLqUO8VCfN
	/IrLnUmUAth3tjMPQyJVZe4E6/xaYGx0vyVwMD4QTuxNaHd3YfuyDZuWMhyggf0N5CkgjF2Ji6W
	JZpCPzcUC1nCGCGtahCpyEKw7R+xNVff+9K3DtgiUgslK3xSdPO6/bq3I=
X-Google-Smtp-Source: AGHT+IHq0KaM8W/S/o2CDOIvcVUww39MyDMtgJhPWdOSp9phOrNY0aMc+4g5G60TIXdcw/QDZQ+uH8xM9Uyl+Z/fuAM=
X-Received: by 2002:a05:6870:3908:b0:29e:6394:fd4a with SMTP id
 586e51a60fabf-2e861de5c86mr6259660fac.2.1748307744858; Mon, 26 May 2025
 18:02:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250526020125.382976-1-marcelomoreira1905@gmail.com> <DA5YTSGIN9DK.3HQ7DNKTVQRP4@kernel.org>
In-Reply-To: <DA5YTSGIN9DK.3HQ7DNKTVQRP4@kernel.org>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Mon, 26 May 2025 22:02:12 -0300
X-Gm-Features: AX0GCFtFqImtG536_8KaVd6AvacafQ7r26wr4MVsa7qAMPfQ72ymCg2hIfWOfNE
Message-ID: <CAPZ3m_h3rFpMBNmP95H0z_nZn-oG0q2-9VDbSE+Ntt+PBBDYgw@mail.gmail.com>
Subject: Re: [PATCH v3] rust: revocable: Correct safety comments and add invariants
To: Benno Lossin <lossin@kernel.org>
Cc: dakr@kernel.org, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em seg., 26 de mai. de 2025 =C3=A0s 05:56, Benno Lossin <lossin@kernel.org>=
 wrote:
>
> On Mon May 26, 2025 at 4:01 AM CEST, Marcelo Moreira wrote:
> > diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
> > index 1e5a9d25c21b..fed860ad2e60 100644
> > --- a/rust/kernel/revocable.rs
> > +++ b/rust/kernel/revocable.rs
> > @@ -61,6 +61,14 @@
> >  /// v.revoke();
> >  /// assert_eq!(add_two(&v), None);
> >  /// ```
> > +/// # Invariants
> > +///
> > +/// - `data` is valid for reads in two cases:
> > +///   - while `is_available` is true, or
> > +///   - while the RCU read-side lock is taken and it was acquired whil=
e `is_available` was `true`.
>
> This looks good now :)

Nice! sounds good =3D)


> > +/// - `data` is valid for writes when `is_available` was atomically ch=
anged from `true` to `false`
> > +///   and no thread is holding an RCU read-side lock that was acquired=
 prior to the change in
> > +///   `is_available`.
>
> This doesn't cover the case needed in `drop`, since there might be a
> thread holding the RCU read-side lock when `drop` is run. But that
> doesn't matter, because that thread isn't going to access `data` (since
> it can't have a reference to the value anymore, after all we're dropping
> it).

My understanding: I understand that the write invariant primarily describes
how data becomes valid for writes after revocation (RCU grace period).
In the specific context of drop, the validity for writes (e.g., drop_in_pla=
ce)
is predominantly guaranteed by the exclusive mutable access (&mut self) of =
the
PinnedDrop implementation, rather than the RCU-based write invariant.
The RCU readers would not be able to access the data being dropped anyway.

Plans for v4: I don't understand if we need to change something here or if =
this
will be reflected in the SAFETY comment for drop.


> >  #[pin_data(PinnedDrop)]
> >  pub struct Revocable<T> {
> >      is_available: AtomicBool,
> > @@ -97,8 +105,9 @@ pub fn new(data: impl PinInit<T>) -> impl PinInit<Se=
lf> {
> >      pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
> >          let guard =3D rcu::read_lock();
> >          if self.is_available.load(Ordering::Relaxed) {
> > -            // Since `self.is_available` is true, data is initialised =
and has to remain valid
> > -            // because the RCU read side lock prevents it from being d=
ropped.
> > +            // INVARIANT: `self.data` is valid for reads because `self=
.is_available` is true,
> > +            // and the RCU read-side lock held by `guard` ensures this=
 condition is maintained
> > +            // during access.
>
> Two things here:
> 1. This comment should refer to the type invariants of `Self` ie
>    "`self.data` is valid for reads because of the type invariants of
>    `Self` and because ...".
> 2. `INVARIANT` comments report on changes in the type invariants of a
>    type. For example when constructing a type with type invariants, one
>    has to document that the invariants are fulfilled. In this case, the
>    invariants of `RevocableGuard` are:
>
>    /// The RCU read-side lock is held while the guard is alive.
>
>    Which already is fulfilled by us having the `rcu::Guard` type around.
>    So we should also change the invariants of the `RevocableGuard`.
>
> I think I suggested on the previous version that we change `data_ref` to
> a shared reference and thus simplify the `RevocableGuard` type, because
> it won't need `unsafe` any more. Then we can also remove all invariants
> on it. (And we also won't need the `new` function any more, since we
> have direct access to the fields).
>
> (This change should be its own patch)
>
> Then we will gain a new `unsafe` block in the code here that we will
> justify with the type invariant of `Self`.
>
> On second thought, we can reuse the `try_access_with_guard` function and
> then we won't need an `unsafe` block here.
>
> >              Some(RevocableGuard::new(self.data.get(), guard))
> >          } else {
> >              None


My understanding: The INVARIANT comment should be changed to SAFETY,
as we are justifying an unsafe operation (implicitly within RevocableGuard:=
:new
due to self.data.get()), not establishing a new invariant for Revocable<T>.

The SAFETY comment should explicitly state that the validity of self.data f=
or
reads is because of Revocable<T>'s type invariants, in addition to the
conditions
(is_available being true and RCU read-side lock).

The proposed RevocableGuard simplification (changing data_ref to &T and
making RevocableGuard internally safe) is a significant refactoring that
should be in a separate, future patch.

For this v4 patch, RevocableGuard::new will continue to take a raw
pointer. Therefore,
try_access will continue to call RevocableGuard::new(self.data.get(),
guard), and the SAFETY
comment will justify this existing (implicit) unsafe interaction,
rather than introducing a new
unsafe block by calling try_access_with_guard here, which would
prematurely depend on the
RevocableGuard refactoring.

Plans for v4: Change the comment from // INVARIANT: to // SAFETY.
- Reformulate the comment to: "SAFETY: self.data is valid for reads because
of Revocable<T>'s type invariants, as is_available is true and _guard holds
the RCU read-side lock."

- No changes to the underlying logic of try_access (it will still call
RevocableGuard::new with self.data.get()).


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
> > +            // SAFETY: `self.data` is valid for reads as `is_available=
` is true and `_guard`
> > +            // holds the RCU read-side lock, adhering to `Revocable<T>=
`'s invariants.
>
> This is the wrong way around, the safety comment *relies* on the type
> invariants of `Self`. So it should be
>
>     SAFETY: `self.data` is valid for reads because of the type
>     invariants of `Self` and as `is_available` is true and `_guard`
>     holds the RCU read-side lock.

My understanding: The SAFETY comment should clarify that the
operation's safety derives from or
relies on Revocable<T>'s type invariants, rather than merely "adhering to" =
them.

Plans for v4: Reformulate the SAFETY comment to:
SAFETY: self.data is valid for reads because of Revocable<T>'s type
invariants, as is_available is true and _guard holds the RCU read-side lock=
.


> >              Some(unsafe { &*self.data.get() })
> >          } else {
> >              None
> > @@ -176,9 +185,11 @@ fn drop(self: Pin<&mut Self>) {
> >          // SAFETY: We are not moving out of `p`, only dropping in plac=
e
> >          let p =3D unsafe { self.get_unchecked_mut() };
> >          if *p.is_available.get_mut() {
> > -            // SAFETY: We know `self.data` is valid because no other C=
PU has changed
> > -            // `is_available` to `false` yet, and no other CPU can do =
it anymore because this CPU
> > -            // holds the only reference (mutable) to `self` now.
> > +            // INVARIANT: `is_available` is true, so `data` is valid f=
or reads.
>
> We're not only reading `data`, but also writing to it! (`drop_in_place`
> takes a mutable raw pointer and will call `Drop::drop` with a mutable
> reference)
>
> > +            // SAFETY: `self.data` is valid for writes because `is_ava=
ilable` is true, and
> > +            // this `PinnedDrop` context (having `&mut self`) guarante=
es exclusive access,
> > +            // ensuring no other thread can concurrently access or rev=
oke `data`.
> > +            // This ensures `data` is valid for `drop_in_place`.
>
> We have to mention the type invariants of `Self` here too. And also we
> have to satisfy all the conditions on the second invariant:
>
>     /// - `data` is valid for writes when `is_available` was atomically c=
hanged from `true` to `false`
>     ///   and no thread is holding an RCU read-side lock that was acquire=
d prior to the change in
>     ///   `is_available`.
>
> This is the problem with that invariant that I outlined above. Nobody
> can access `data`, since we're getting dropped.
>
> >              unsafe { drop_in_place(p.data.get()) };

My understanding: The operation in drop_in_place is a write
(destruction), so the prior INVARIANT
comment focusing on "reads" was a mistake.

The SAFETY comment needs to explicitly mention Revocable<T>'s type invarian=
ts.

For drop, the primary safety guarantee for writes is the exclusive
mutable access (&mut self)
provided by the PinnedDrop context, in addition to is_available being
true. The RCU-specific
conditions of the write invariant are less directly relevant here
because of this exclusive ownership
during drop.

Plans for v4: Remove the line: // INVARIANT: is_available is true, so
data is valid for reads.

Reformulate the // SAFETY: comment to: SAFETY: self.data is valid for
writes because of
Revocable<T>'s type invariants (specifically, that data is valid when
is_available is true),
and because this PinnedDrop context (having &mut self) guarantees
exclusive access,
ensuring no other thread can concurrently access or revoke data. This
ensures data is valid
for drop_in_place.


>
> A function that also needs to be adjusted is the `revoke_internal`
> function. That's where the second type invariant comes in. I suggested
> that we remove that and split the behavior into `revoke()` and
> `revoke_nosync()` and Danilo agreed, so could you add that in another
> patch?
>

My understanding: I fully understand and agree that the following are
significant refactorings
and should be handled in separate, dedicated patches, not in v4

- RevocableGuard Simplification: Changing data_ref from a raw pointer
(*const T) to a shared
reference (&T), removing its unsafe logic and internal invariants.

- revoke_internal Refactoring: Splitting revoke_internal into revoke()
and revoke_nosync() functions.


Thanks again for your invaluable guidance! =3DD

Cheers,
Marcelo Moreira
