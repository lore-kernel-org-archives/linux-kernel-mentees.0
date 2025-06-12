Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21B829B799
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Jun 2025 18:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749754393; cv=none; b=lKqr3p0VNMmjr6MV8F7A0xh7fBxi5Ub5f3U3qd1R3t0BQ4FyTbwke5dEWD22W46oDldP84CX+oEumVSMh13iY0gsh/DR5ZhD7TVg3ztw7V/bbXsZp7V9DzwnmkHMlJvhtKzoL5Lnl7Euj89x04yaZbakqxlWMI8OhYR9UxQNyrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749754393; c=relaxed/simple;
	bh=d5+WGhhcp+MGZ1C5HzDAZA9VI4291qm8GsADLhFOFSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LZpPnCMZIOjx/O6RqLDmmVuDU6KRtOIy9iIXOnPDKew4CBHX4ngYQv9sTPPyAlJ1QHDG3+TZkFi6fWBxrjcRfdqT/hkNHOpOxyFPnxxZJlWdG0iGETN+SOm2wsVPubAPz0lR9FI3oxOAlKuC2u8dyPNEka0gqU0+hFdufphSa6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LYYkHkyp; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LYYkHkyp"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C228408E6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Jun 2025 18:53:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GrHmt39zzYSS for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Jun 2025 18:53:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::c2c; helo=mail-oo1-xc2c.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 409BC408E5
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 409BC408E5
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LYYkHkyp
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 409BC408E5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Jun 2025 18:53:10 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-60f22023eddso874559eaf.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Jun 2025 11:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749754389; x=1750359189; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cE06FTK8AiT7gXuZ0kOSJnrEGriFz7fdd2d9uJYxUaM=;
        b=LYYkHkypbndw4N/FdevIAiP4HYnT2+63HiYwoobVjf2HGDqrLwqUI375/YhGDJMMxX
         8jYQI1MaA6d733BeVVw/sguZi+FyTWwvag/FpSKPdNjbaHSqIGt6LquXDLvi9zQpNh9z
         Lyu+Tp7OLLkM8nPhmEHnvQ/ra0YU7eF7Rwrerk/aWZfzhagFLYW60l5CCv98HcLwq/yA
         vdycVMA0fxUwrGJxcjSFMXc89vrY6huqQ/BsY12/ZvnoYznPVWF4cf5weukUQXRPEwY1
         eMKWrztNfjuvl2WbpXrhbQr168HHI/j0z5dC5TS30MtIUaKylaaNeThr7KMgd2yWjPC5
         aLvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749754389; x=1750359189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cE06FTK8AiT7gXuZ0kOSJnrEGriFz7fdd2d9uJYxUaM=;
        b=GTnYTaRVTQRo4dR/4HPlBzXunQH8G/ij38I7z3/nbC5Mo/hD83oRgmZripepjCVP+1
         7uu3rJsBx9tVfRWiQ3eWOgDFMWuLLTroE/e0yZHxEb6i8gdWCmw6nzGdLsdwnZVF/2oM
         XvVnkyaG8WSz7hogc0JEgwtzVMxLaaeLCuG6P9vT1wK8nnR1t/alGTFVcbK3D0jrMaYj
         XNp9OWqG4kviHdm0M5HNjUC5lD0NlQ3Z5OHQ1NHhMxru71NQoKBhtZVCP0CvJNphGael
         T/QBQyLuDKqf/tegMOjnKylJRVubFeK6jzdFOalB1qPwHRHjtPwAPt88ndkO3BvxZOci
         uKOg==
X-Forwarded-Encrypted: i=1; AJvYcCVVnutQ60ITKinkIL8lF9Aebf1gwruHuVHpKaGynhb/v+nD1PM+6rnsNjwyqyhQLjpdXyIrJFhU3oDPyo730+eAX+n7gw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yz6s/wL/AhlDnNshoikkkegSwHJXEzovfbLwVqO0cLhFrBLoq2K
	WD/iR2PHi75HP6Cf8nuxB+fP3aM8BIfYEtLeOzZ1CVSitFSYy6hhOHEen0HqyqiuElJ8Y/g+wf2
	p3tphAETHx0UvyidEraY4wgyfrnQF7S0=
X-Gm-Gg: ASbGncuz2Jgt0w8r5INfGa/ghQR0/WMDOJHxxLxVcU0bfnJkLTo7Vz8krV8kZmKnNLZ
	4qZBsy5+gc/RhzEu9TdYBpMo0xtE2CkBfFqumzxTLwbsD1h+6BiUpBjTmOiBun46AvQH+7bEJux
	LuVSBxHMz27PttPqMhaotVje0m16gNgQKijp4GnoiqbDeu82b16TTHu9A=
X-Google-Smtp-Source: AGHT+IHGevGfBO1YY2lZjLZ+gxJQ8GCyuh4zpLb9vCEgZt4Hg3TYCMjuMdnSTo7+0aYyGADjkbLq7ZS33umBA54x7mY=
X-Received: by 2002:a05:6808:2188:b0:406:769e:e7a9 with SMTP id
 5614622812f47-40a71e7cb9dmr401622b6e.35.1749754389077; Thu, 12 Jun 2025
 11:53:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250602232842.144304-1-marcelomoreira1905@gmail.com>
 <20250602232842.144304-3-marcelomoreira1905@gmail.com> <aEqdur4JTFa1V20U@google.com>
 <DAKGNYQ6M24H.1KVXZASA4V00C@kernel.org>
In-Reply-To: <DAKGNYQ6M24H.1KVXZASA4V00C@kernel.org>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Thu, 12 Jun 2025 15:52:57 -0300
X-Gm-Features: AX0GCFvFvx-bpFhsDzC1pZXcGeQRbogJBVN7FSsBfkcA8FnXBfy6qWSbWzhpO_w
Message-ID: <CAPZ3m_gmeaQYu2oA5uz=zhnXUV+pyrnQvjootxKGos-_hWEATQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] rust: revocable: simplify RevocableGuard for
 internal safety
To: Benno Lossin <lossin@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, dakr@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qui., 12 de jun. de 2025 =C3=A0s 06:52, Benno Lossin <lossin@kernel.org>=
 escreveu:
>
> On Thu Jun 12, 2025 at 11:28 AM CEST, Alice Ryhl wrote:
> > On Mon, Jun 02, 2025 at 08:26:23PM -0300, Marcelo Moreira wrote:
> >> This commit refactors `RevocableGuard` to hold a direct reference
> >> (`&'a T`) instead of a raw pointer (`*const T`). This makes the guard
> >> internally safe, reducing the need for `unsafe` blocks in its usage
> >> and simplifying its implementation.
> >>
> >> The `try_access` function is updated to leverage `try_access_with_guar=
d`
> >> and `map` to construct the `RevocableGuard` in a more idiomatic and sa=
fe
> >> Rust way, avoiding manual pointer operations. The associated invariant=
s
> >> and `SAFETY` comments for `RevocableGuard` itself are removed as its
> >> safety is now guaranteed by its type definition.
> >>
> >> Suggested-by: Benno Lossin <lossin@kernel.org>
> >> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> >> Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
> >> ---
> >>  rust/kernel/revocable.rs | 26 ++++++--------------------
> >>  1 file changed, 6 insertions(+), 20 deletions(-)
> >>
> >> diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
> >> index d14f9052f1ac..43cc9bdc94f4 100644
> >> --- a/rust/kernel/revocable.rs
> >> +++ b/rust/kernel/revocable.rs
> >> @@ -105,13 +105,7 @@ pub fn new(data: impl PinInit<T>) -> impl PinInit=
<Self> {
> >>      /// because another CPU may be waiting to complete the revocation=
 of this object.
> >>      pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
> >>          let guard =3D rcu::read_lock();
> >> -        if self.is_available.load(Ordering::Relaxed) {
> >> -            // Since `self.is_available` is true, data is initialised=
 and has to remain valid
> >> -            // because the RCU read side lock prevents it from being =
dropped.
> >> -            Some(RevocableGuard::new(self.data.get(), guard))
> >> -        } else {
> >> -            None
> >> -        }
> >> +        self.try_access_with_guard(&guard).map(|data| RevocableGuard:=
:new(data, guard))
> >>      }
> >>
> >>      /// Tries to access the revocable wrapped object.
> >> @@ -198,22 +192,16 @@ fn drop(self: Pin<&mut Self>) {
> >>  ///
> >>  /// CPUs may not sleep while holding on to [`RevocableGuard`] because=
 it's in atomic context
> >>  /// holding the RCU read-side lock.
> >> -///
> >> -/// # Invariants
> >> -///
> >> -/// The RCU read-side lock is held while the guard is alive.
> >>  pub struct RevocableGuard<'a, T> {
> >> -    data_ref: *const T,
> >> +    data: &'a T,
> >>      _rcu_guard: rcu::Guard,
> >> -    _p: PhantomData<&'a ()>,
> >>  }
> >
> > I don't think this change is valid. Consider this code:
> >
> > fn takes_guard(arg: RevocableGuard<'_, i32>) {
> >     drop(arg);
> >     // rcu guard is dropped, so `arg.data` may become dangling now
> > }
> >
> > This violates the requirement that references that appear in function
> > arguments are valid for the entire function call, see:
> > https://perso.crans.org/vanille/treebor/protectors.html
>
> That's a good point. I don't see a way to make this work then... That's
> a bit sad :(

Thanks for the feedback. I didn't see this in my testing. Sorry.

I'm going to revert `RevocableGuard` back to the original design. Thanks! :=
)

>
> @Marcelo: sorry for the extra work.

don't worry! I'm learning =3DD

Just one thing, I wanted to ask for your opinion on another change in
the patch, specifically in the `try_access` function. I refactored the
logic of an `if/else` block to use
`self.try_access_with_guard(&guard).map(|data|
RevocableGuard::new(data, guard))`.

This change uses `Option::map`, the logic is: "if
`try_access_with_guard` succeeds, transform its result into a
`RevocableGuard` using the given `rcu::Guard`; otherwise, propagate
`None`." As I understand it, this transformation maintains the
original semantics and security.

Do you think keeping this specific change (using `.map()`) is a good
decision for clarity and style, or should I revert it to the explicit
`if/else` block as well?

Thanks Alice :)
Thanks Benno :)

Cheers,
Marcelo Moreira
