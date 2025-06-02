Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EBF1AA1D8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  2 Jun 2025 01:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748827093; cv=none; b=sCdZmr8X1JCoN8kjI3tqsD9XCL1BVfMiCZJ6ySxM2CBLjU7fIJwsRw64vcx/UIrh+fQ4ucmob2wUkLqrxKwRTl+ffEfDyYL4nwa2su3O7Vqlw26JEhEIEh9d0yfd8lP/MhvrADT/CY7B7ktMsdy2JCyBs1tLSZYjQaujTmnxmzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748827093; c=relaxed/simple;
	bh=dAXBuYw4yroyUC0VpP4oyvK8LqmqKLV0doVnUr2zZKs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fA+m+7hU3k8a3pQmK59tPAZKyVBjfbbcVHt2h5EXCZol5hSzmRu8u87fLiSUzB7HrF/5LYVwCmapAk8L4Z/+MPmTtZ7f3fvjmGjDqV9GqiHKLj5Y4EIOVr/9zbMeFyDJW/vYukvnJMY2m3rmxDpvZyC4O91MhC8NpO6qkBWrviA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dIYl7ZMd; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dIYl7ZMd"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 003AC81AF5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  2 Jun 2025 01:18:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o3feLDlp0RvM for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Jun 2025 01:18:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4860:4864:20::2d; helo=mail-oa1-x2d.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EC1B681AC4
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC1B681AC4
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dIYl7ZMd
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
	by smtp1.osuosl.org (Postfix) with ESMTPS id EC1B681AC4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  2 Jun 2025 01:18:09 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-2cc57330163so2347287fac.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 01 Jun 2025 18:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748827088; x=1749431888; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qVLMNTN7sjVlEuHiSG2rde9sSLAyqhLlFxU7VC/3D/4=;
        b=dIYl7ZMd/ZZkV7u+3z9Qm41iiU0QuZ+91XHMApgTVld+Vry9MSNJmTYevq4d+9vuWh
         OqVzMLkYG87S0zEFeBwa3OkXnYzN2sgLsE3j+cD0rOxoWnY3w47XlcKCVTOP45bCeCgX
         DJN80sdKZDtNMqddk7hEZHWoM7dwHyEEO7A/xjnqgdGuez9XCAWF/Zt+3zvVit9i+9d6
         As+NDszg28qlXzuhCg7yQiy5eELYC2ZsbCJMWsWdEJDt5qoDJl7llkZiQSGjtZcqQ2VK
         oEm76LGEv35rxqVC7mawT++PxqMglI/fAWdJ3HZkfvkqjrAn5aUTQxo3hS2HmBylgLxN
         8VHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748827088; x=1749431888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qVLMNTN7sjVlEuHiSG2rde9sSLAyqhLlFxU7VC/3D/4=;
        b=d0lOuO9/Z5gd38BR0Mu8kGUrJ2wELGSMkLNMVWWfBxbZwT5SUQdYGPySmHBupvGSBV
         znLdaPxXM51zRoCxvZHudbUc08r4KmEoOnWUCJC0EpvJ4EJeGSZp5NT0nnvlnClZIIOQ
         bNwunaXhhX3tuRkKZLKvfv02cHGN8SAm3VL1icvLGVGhhkJ6zwuYmDyj0Bidyse4gjD9
         HxABx1lh3VLob2ebnji9lenihnwnUpdOQT9WCHixCxN+MhT/nNAYQgEunliKApdywhp9
         EWpJzQ7vPDHikUYE9+FbKQymq8vOl2x4l7J4DDj6FjQLi4AXb4QEckgmZCfMDIvX4/0J
         7/3g==
X-Forwarded-Encrypted: i=1; AJvYcCX3Ke8TWX6JR/PnGumvWvB53WlfKrpfObZdsZhxfzz+CE8HnRluqOHwkQFZ9sfIU6qiFk3BmP5lf6T3RKM1x6e/ZjYMnw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YydbxKjv4DutUR7b0JNJy4uk6QpTaihKL1Rdzfs2CDF5hOhPzAh
	s6rhfBSqyQbfZGJ3tncwz/IBh2YOh3CxZpLJPRFPF2LN+k77sY6dmonCnTFmCfVOrt+V1MUmBT7
	y2/ga0bC+/RiVg+NzcXqOGpV3MxdbJd8=
X-Gm-Gg: ASbGncsa+sjQeI59NpuU+pPcw5TOtkTnpCNpYpTu7PiwvCwh/W3ma3cp4ntTihinnqg
	ZTVc48Ot09QBItfrgWhONFOtkL02PXuJr8mX79vklKZvYQgCIwDootAbPFhaShuDbGQNxe5kigA
	4kxgeLpG65NRmx1iD2UgjEj/dKN8/ExAcwG5Kzm7DGHdVZ
X-Google-Smtp-Source: AGHT+IHfjEBaC4xImA4Ccm7T6LBwvNLOOmUBhPpmPLSxpWUCbVcu5vaUwDBwAqL14Cs3GAO1KF/4lRdvYgcrqGe+uIg=
X-Received: by 2002:a05:6871:e80e:b0:29e:6394:fd4a with SMTP id
 586e51a60fabf-2e9211a2f44mr7162125fac.2.1748827088460; Sun, 01 Jun 2025
 18:18:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250526020125.382976-1-marcelomoreira1905@gmail.com>
 <DA5YTSGIN9DK.3HQ7DNKTVQRP4@kernel.org> <CAPZ3m_h3rFpMBNmP95H0z_nZn-oG0q2-9VDbSE+Ntt+PBBDYgw@mail.gmail.com>
 <DA6XFLKUTP1P.RR6P5AK9PKIZ@kernel.org>
In-Reply-To: <DA6XFLKUTP1P.RR6P5AK9PKIZ@kernel.org>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Sun, 1 Jun 2025 22:17:57 -0300
X-Gm-Features: AX0GCFvU8oEZJmnozZEUnXEs1jk30qJyDAC8J-4sBwK7iASiNzgcs4jeL9J95Vk
Message-ID: <CAPZ3m_gCY=8PScnfGZmJrpxgPFtTOaSh6Xw-9hS5pcUs7y4p7A@mail.gmail.com>
Subject: Re: [PATCH v3] rust: revocable: Correct safety comments and add invariants
To: Benno Lossin <lossin@kernel.org>
Cc: dakr@kernel.org, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

oh no, it looks like I submitted the patch without the explicit v4
version and without the 0/3 part :/...  Sorry for that, it's the first
time I've made a split patch like that.

Em ter., 27 de mai. de 2025 =C3=A0s 09:03, Benno Lossin <lossin@kernel.org>=
 escreveu:
>
> On Tue May 27, 2025 at 3:02 AM CEST, Marcelo Moreira wrote:
> > Em seg., 26 de mai. de 2025 =C3=A0s 05:56, Benno Lossin <lossin@kernel.=
org> wrote:
> >> On Mon May 26, 2025 at 4:01 AM CEST, Marcelo Moreira wrote:
> >> > +/// - `data` is valid for writes when `is_available` was atomically=
 changed from `true` to `false`
> >> > +///   and no thread is holding an RCU read-side lock that was acqui=
red prior to the change in
> >> > +///   `is_available`.
> >>
> >> This doesn't cover the case needed in `drop`, since there might be a
> >> thread holding the RCU read-side lock when `drop` is run. But that
> >> doesn't matter, because that thread isn't going to access `data` (sinc=
e
> >> it can't have a reference to the value anymore, after all we're droppi=
ng
> >> it).
> >
> > My understanding: I understand that the write invariant primarily descr=
ibes
> > how data becomes valid for writes after revocation (RCU grace period).
> > In the specific context of drop, the validity for writes (e.g., drop_in=
_place)
> > is predominantly guaranteed by the exclusive mutable access (&mut self)=
 of the
> > PinnedDrop implementation, rather than the RCU-based write invariant.
> > The RCU readers would not be able to access the data being dropped anyw=
ay.
> >
> > Plans for v4: I don't understand if we need to change something here or=
 if this
> > will be reflected in the SAFETY comment for drop.
>
> We should change the invariant to only consider threads that can access
> `data`. So
>
>     - `data` is valid for writes when `is_available` was atomically
>       changed from `true` to `false` and no thread that has access to
>       `data` is holding an RCU read-side lock that was acquired prior to
>       the change in `is_available`.
>
> >> >  #[pin_data(PinnedDrop)]
> >> >  pub struct Revocable<T> {
> >> >      is_available: AtomicBool,
> >> > @@ -97,8 +105,9 @@ pub fn new(data: impl PinInit<T>) -> impl PinInit=
<Self> {
> >> >      pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
> >> >          let guard =3D rcu::read_lock();
> >> >          if self.is_available.load(Ordering::Relaxed) {
> >> > -            // Since `self.is_available` is true, data is initialis=
ed and has to remain valid
> >> > -            // because the RCU read side lock prevents it from bein=
g dropped.
> >> > +            // INVARIANT: `self.data` is valid for reads because `s=
elf.is_available` is true,
> >> > +            // and the RCU read-side lock held by `guard` ensures t=
his condition is maintained
> >> > +            // during access.
> >>
> >> Two things here:
> >> 1. This comment should refer to the type invariants of `Self` ie
> >>    "`self.data` is valid for reads because of the type invariants of
> >>    `Self` and because ...".
> >> 2. `INVARIANT` comments report on changes in the type invariants of a
> >>    type. For example when constructing a type with type invariants, on=
e
> >>    has to document that the invariants are fulfilled. In this case, th=
e
> >>    invariants of `RevocableGuard` are:
> >>
> >>    /// The RCU read-side lock is held while the guard is alive.
> >>
> >>    Which already is fulfilled by us having the `rcu::Guard` type aroun=
d.
> >>    So we should also change the invariants of the `RevocableGuard`.
> >>
> >> I think I suggested on the previous version that we change `data_ref` =
to
> >> a shared reference and thus simplify the `RevocableGuard` type, becaus=
e
> >> it won't need `unsafe` any more. Then we can also remove all invariant=
s
> >> on it. (And we also won't need the `new` function any more, since we
> >> have direct access to the fields).
> >>
> >> (This change should be its own patch)
> >>
> >> Then we will gain a new `unsafe` block in the code here that we will
> >> justify with the type invariant of `Self`.
> >>
> >> On second thought, we can reuse the `try_access_with_guard` function a=
nd
> >> then we won't need an `unsafe` block here.
> >>
> >> >              Some(RevocableGuard::new(self.data.get(), guard))
> >> >          } else {
> >> >              None
> >
> >
> > My understanding: The INVARIANT comment should be changed to SAFETY,
> > as we are justifying an unsafe operation (implicitly within RevocableGu=
ard::new
> > due to self.data.get()), not establishing a new invariant for Revocable=
<T>.
>
> We don't do SAFETY comments on "implicit" unsafe operations. A SAFETY
> comment must always be directly above an `unsafe` block.
>
> > The SAFETY comment should explicitly state that the validity of self.da=
ta for
> > reads is because of Revocable<T>'s type invariants, in addition to the
> > conditions
> > (is_available being true and RCU read-side lock).
> >
> > The proposed RevocableGuard simplification (changing data_ref to &T and
> > making RevocableGuard internally safe) is a significant refactoring tha=
t
> > should be in a separate, future patch.
>
> I think it should be done in this patch series, as it makes the safety
> comments significantly easier. In my mind the refactoring also shouldn't
> be too expensive.
>
> > For this v4 patch, RevocableGuard::new will continue to take a raw
> > pointer. Therefore,
> > try_access will continue to call RevocableGuard::new(self.data.get(),
> > guard), and the SAFETY
> > comment will justify this existing (implicit) unsafe interaction,
> > rather than introducing a new
> > unsafe block by calling try_access_with_guard here, which would
> > prematurely depend on the
> > RevocableGuard refactoring.
> >
> > Plans for v4: Change the comment from // INVARIANT: to // SAFETY.
> > - Reformulate the comment to: "SAFETY: self.data is valid for reads bec=
ause
> > of Revocable<T>'s type invariants, as is_available is true and _guard h=
olds
> > the RCU read-side lock."
> >
> > - No changes to the underlying logic of try_access (it will still call
> > RevocableGuard::new with self.data.get()).
> >
> >
> >> > @@ -115,8 +124,8 @@ pub fn try_access(&self) -> Option<RevocableGuar=
d<'_, T>> {
> >> >      /// object.
> >> >      pub fn try_access_with_guard<'a>(&'a self, _guard: &'a rcu::Gua=
rd) -> Option<&'a T> {
> >> >          if self.is_available.load(Ordering::Relaxed) {
> >> > -            // SAFETY: Since `self.is_available` is true, data is i=
nitialised and has to remain
> >> > -            // valid because the RCU read side lock prevents it fro=
m being dropped.
> >> > +            // SAFETY: `self.data` is valid for reads as `is_availa=
ble` is true and `_guard`
> >> > +            // holds the RCU read-side lock, adhering to `Revocable=
<T>`'s invariants.
> >>
> >> This is the wrong way around, the safety comment *relies* on the type
> >> invariants of `Self`. So it should be
> >>
> >>     SAFETY: `self.data` is valid for reads because of the type
> >>     invariants of `Self` and as `is_available` is true and `_guard`
> >>     holds the RCU read-side lock.
> >
> > My understanding: The SAFETY comment should clarify that the
> > operation's safety derives from or
> > relies on Revocable<T>'s type invariants, rather than merely "adhering =
to" them.
> >
> > Plans for v4: Reformulate the SAFETY comment to:
> > SAFETY: self.data is valid for reads because of Revocable<T>'s type
> > invariants, as is_available is true and _guard holds the RCU read-side =
lock.
>
> Missing '`' around code. Also please use `Self` instead of Revocable<T>.
>
> >> >              Some(unsafe { &*self.data.get() })
> >> >          } else {
> >> >              None
> >> > @@ -176,9 +185,11 @@ fn drop(self: Pin<&mut Self>) {
> >> >          // SAFETY: We are not moving out of `p`, only dropping in p=
lace
> >> >          let p =3D unsafe { self.get_unchecked_mut() };
> >> >          if *p.is_available.get_mut() {
> >> > -            // SAFETY: We know `self.data` is valid because no othe=
r CPU has changed
> >> > -            // `is_available` to `false` yet, and no other CPU can =
do it anymore because this CPU
> >> > -            // holds the only reference (mutable) to `self` now.
> >> > +            // INVARIANT: `is_available` is true, so `data` is vali=
d for reads.
> >>
> >> We're not only reading `data`, but also writing to it! (`drop_in_place=
`
> >> takes a mutable raw pointer and will call `Drop::drop` with a mutable
> >> reference)
> >>
> >> > +            // SAFETY: `self.data` is valid for writes because `is_=
available` is true, and
> >> > +            // this `PinnedDrop` context (having `&mut self`) guara=
ntees exclusive access,
> >> > +            // ensuring no other thread can concurrently access or =
revoke `data`.
> >> > +            // This ensures `data` is valid for `drop_in_place`.
> >>
> >> We have to mention the type invariants of `Self` here too. And also we
> >> have to satisfy all the conditions on the second invariant:
> >>
> >>     /// - `data` is valid for writes when `is_available` was atomicall=
y changed from `true` to `false`
> >>     ///   and no thread is holding an RCU read-side lock that was acqu=
ired prior to the change in
> >>     ///   `is_available`.
> >>
> >> This is the problem with that invariant that I outlined above. Nobody
> >> can access `data`, since we're getting dropped.
> >>
> >> >              unsafe { drop_in_place(p.data.get()) };
> >
> > My understanding: The operation in drop_in_place is a write
> > (destruction), so the prior INVARIANT
> > comment focusing on "reads" was a mistake.
> >
> > The SAFETY comment needs to explicitly mention Revocable<T>'s type inva=
riants.
> >
> > For drop, the primary safety guarantee for writes is the exclusive
> > mutable access (&mut self)
> > provided by the PinnedDrop context, in addition to is_available being
> > true. The RCU-specific
> > conditions of the write invariant are less directly relevant here
> > because of this exclusive ownership
> > during drop.
> >
> > Plans for v4: Remove the line: // INVARIANT: is_available is true, so
> > data is valid for reads.
> >
> > Reformulate the // SAFETY: comment to: SAFETY: self.data is valid for
> > writes because of
> > Revocable<T>'s type invariants (specifically, that data is valid when
> > is_available is true),
> > and because this PinnedDrop context (having &mut self) guarantees
> > exclusive access,
> > ensuring no other thread can concurrently access or revoke data. This
> > ensures data is valid
> > for drop_in_place.
>
> Your email client seems to rewrap the lines, could you avoid that, as it
> makes the text harder to read? Thanks!
>
> I don't think it's a good idea to have information in parenthesis in
> safety comments, they should be clear without the need for optional
> information. Also this needs the invariant change that I mentioned
> above.
>
> >> A function that also needs to be adjusted is the `revoke_internal`
> >> function. That's where the second type invariant comes in. I suggested
> >> that we remove that and split the behavior into `revoke()` and
> >> `revoke_nosync()` and Danilo agreed, so could you add that in another
> >> patch?
> >>
> >
> > My understanding: I fully understand and agree that the following are
> > significant refactorings
> > and should be handled in separate, dedicated patches, not in v4
> >
> > - RevocableGuard Simplification: Changing data_ref from a raw pointer
> > (*const T) to a shared
> > reference (&T), removing its unsafe logic and internal invariants.
> >
> > - revoke_internal Refactoring: Splitting revoke_internal into revoke()
> > and revoke_nosync() functions.
>
> Yes, but please include them in the next version of your patch series :)
> They make the safety comments a lot simpler.
>
> ---
> Cheers,
> Benno
