Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE87EADC
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 27 Jul 2025 17:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753638296; cv=none; b=bC9l0KfAs7nFklGGAvJwSeZLCvdy+5StnGGYnklzDA47YQ9QPyi4OjU3Nyb/FCqyL9U0/9/KRgE8hEwFGQIN8uvZFYT/qWh/NPoCoWyCpoTvSIm9Ho4ZrI41lVlXSltBkoewoyEt8C29i0GTldir8fkma8xbY7zIdTAE+Jg6Vmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753638296; c=relaxed/simple;
	bh=luZy4eZKmQcKzAmjb0W2hbu7XLSsCm4YttVeB4b4JKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ufpx0jaAdLiRdA9fzj4m07jOSYgUqX4zcD0PH8LzR2yYDQm9QdjVwnrq/mr+XJJ7oVD7ODKqbSiZiYa3fI36F+0+kFf7Y8ogcGArhGgCBmKYuGFL2rjwrpUwmQTAO/HiuRuzR7XnQLsGKP9Yibr4/Pj8GD1n/EMuZ2GjtuWjHgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W2DcABPA; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W2DcABPA"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6159fb8b2aaso1805136eaf.0
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 27 Jul 2025 10:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753638294; x=1754243094; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XGroCA+Q9oleFuUP1DUfRwkk4GCwj8qwuq1UKkEblcc=;
        b=W2DcABPAS9dYwUIlCMNmYE3lcc1WiNC3r/ik0NoXr/3Ws0Z1NnUAn1+2QuTcAKFbyk
         Gt2HVNLYLd9Eicfz8SFFRQDeDeOytu4vHgL72XRMHT84fdN3IShWpBWlJxmbIgPUkBiD
         0BcAjokO+esxS0RBciVLjqfhthOTSLGzmwin/2S+ROtoGVoZNTs3v3qeKAnN4mbzHY66
         807MUg/W2sMwLzEha55bT5cI7zObDkCNGPaBQ4X7CmtYAoiaShY49LC3pv3WjTZdqMoD
         y23VIwdXxBMfCv59zIyvyWW3AeH6utayr8rfZ327Vxoar3YtmDBRUVxxKfr7p3gIbgek
         kQMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753638294; x=1754243094;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XGroCA+Q9oleFuUP1DUfRwkk4GCwj8qwuq1UKkEblcc=;
        b=SoIpn65OtHt4EmmwgquYNDVPXNQqhWr/WWb8yrIobXUW+gGHTRwmzM23XKtunmMb5Q
         HmqWFzHgm/rYQCFcjRskjXPSdLygyfUntbpEXTkj05N8lZB9DVJFnWvO4MFAjBiusKXY
         OvE1Ni11hDYEseBh5J0loiZxoX6TqIRemHr/RGxwM6d0SSd9GDygkiAfnsuQCGMqkka7
         tlcddwyKcdWavdhtUbwFQ4CHSIFMx4BX8ePIlRUcWv8QkQ+rl8oyCvd7RKD2Cg/4bQYC
         w9yu14BSslv1RnLf8dpvZqjax/3Vo4m8y+2yj1WOAOXKwa3mFoHPNwyQhPz8buDWapmt
         nFxw==
X-Forwarded-Encrypted: i=1; AJvYcCUked/IKpk5gKJxYIZptNA1IVGqGxxEBhFxO5YQYE0VbDmlzUqye6kfw4ho6lXVzyg1NU2Dg+wVUtwtH0u001q7FvrVbQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5z30e5MMgN8zirikMdbBG29zgYZtL6ihEWnz0U4XngrNPxi0r
	S0qAB+b0F84yE4TAqdA7+invQ1s4B3aofn3PS2IdjweUvlSGIivYDsK2F2eECQmcGmN2Sjaf7XZ
	SiVxzmaDwJGEQl6OZ0ITu1nMDen1qf0E=
X-Gm-Gg: ASbGncu6gmKqQ+XkSzBL0XwuQ18LOyG2/KvK+p1uzQybG8xfkz3ENv/gNJywd/xzCmj
	snYDHgdFp2Pu2W6pyi6QK8HDIZV28gknFYAo6an7hyByN4CUG1Kq731TNjFJGzkUBAWgyDYCFY1
	lu7BL7VDxtThRFgYUmpU5MH702aAtmM+63pUcyJbiDg8XHjklBUVR0CtQQISf7QaCI+UGUysHFk
	rZXh0GB0Q==
X-Google-Smtp-Source: AGHT+IEcnnq+XHAJsDe6I+R84usIoc8E3O69l2x91KvquQ7Ibo03OEsTStfabGqIVtL64hiD9yrZDixEvAlp2fSKaZ4=
X-Received: by 2002:a05:6808:4fe8:b0:406:6e4b:bd91 with SMTP id
 5614622812f47-42bb71f6138mr5453348b6e.7.1753638294032; Sun, 27 Jul 2025
 10:44:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250727170217.206794-1-suchitkarunakaran@gmail.com> <DBN0JG0QP7TU.PZSZ8NZL5LD6@kernel.org>
In-Reply-To: <DBN0JG0QP7TU.PZSZ8NZL5LD6@kernel.org>
From: Suchit K <suchitkarunakaran@gmail.com>
Date: Sun, 27 Jul 2025 23:14:43 +0530
X-Gm-Features: Ac12FXwSad14yHXxRo13EgdT4JwnjtEG8O1CWDHmMGLelFE845ODAhv-6zpFidM
Message-ID: <CAO9wTFisWa5qY2qQE+BEdD40vacGwtzw=2xxPnV0V_w=Gt4jwg@mail.gmail.com>
Subject: Re: [PATCH] rust/pin-init: remove workaround for type inference cycle
To: Benno Lossin <lossin@kernel.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, me@kloenk.dev, 
	chrisi.schrefl@gmail.com, rust-for-linux@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 27 Jul 2025 at 22:58, Benno Lossin <lossin@kernel.org> wrote:
>
> On Sun Jul 27, 2025 at 7:02 PM CEST, Suchit Karunakaran wrote:
> > The `cast_pin_init` and `cast_init` functions previously used an
> > intermediate `let` binding before returning the result expression to work
> > around a Rust compiler issue causing type inference cycles. With the
> > minimum Rust compiler version for the kernel now at 1.78.0, where this
> > issue is fixed, the workaround is no longer needed. This patch removes the
> > unnecessary `let` variables and returns the expressions directly.
> >
> > Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
>
> I still encounter the cycle when compiling with 1.78.0, which version
> did you test this with?
>

Oops, I just realised that I compiled it locally and forgot that I had
installed version 1.78.0 on my VM and not on my local system. I
actually compiled it with version 1.88.0. Sorry for the inconvenience.

> One of The errors I see after applying the patch on top of
> `pin-init-next`:
>
>     error[E0391]: cycle detected when computing type of opaque `cast_pin_init::{opaque#0}`
>         --> rust/pin-init/src/lib.rs:1278:73
>          |
>     1278 | pub const unsafe fn cast_pin_init<T, U, E>(init: impl PinInit<T, E>) -> impl PinInit<U, E> {
>          |                                                                         ^^^^^^^^^^^^^^^^^^
>          |
>     note: ...which requires borrow-checking `cast_pin_init`...
>         --> rust/pin-init/src/lib.rs:1278:1
>          |
>     1278 | pub const unsafe fn cast_pin_init<T, U, E>(init: impl PinInit<T, E>) -> impl PinInit<U, E> {
>          | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>     note: ...which requires promoting constants in MIR for `cast_pin_init`...
>         --> rust/pin-init/src/lib.rs:1278:1
>          |
>     1278 | pub const unsafe fn cast_pin_init<T, U, E>(init: impl PinInit<T, E>) -> impl PinInit<U, E> {
>          | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>     note: ...which requires const checking `cast_pin_init`...
>         --> rust/pin-init/src/lib.rs:1278:1
>          |
>     1278 | pub const unsafe fn cast_pin_init<T, U, E>(init: impl PinInit<T, E>) -> impl PinInit<U, E> {
>          | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>          = note: ...which requires computing whether `cast_pin_init::{opaque#0}` is freeze...
>          = note: ...which requires evaluating trait selection obligation `cast_pin_init::{opaque#0}: core::marker::Freeze`...
>          = note: ...which again requires computing type of opaque `cast_pin_init::{opaque#0}`, completing the cycle
>     note: cycle used when computing type of `cast_pin_init::{opaque#0}`
>         --> rust/pin-init/src/lib.rs:1278:73
>          |
>     1278 | pub const unsafe fn cast_pin_init<T, U, E>(init: impl PinInit<T, E>) -> impl PinInit<U, E> {
>          |                                                                         ^^^^^^^^^^^^^^^^^^
>          = note: see https://rustc-dev-guide.rust-lang.org/overview.html#queries and https://rustc-dev-guide.rust-lang.org/query.html for more information
>
> > ---
> >  rust/pin-init/src/lib.rs | 10 ++--------
> >  1 file changed, 2 insertions(+), 8 deletions(-)
> >
> > diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
> > index 62e013a5cc20..cc244eeb19cd 100644
> > --- a/rust/pin-init/src/lib.rs
> > +++ b/rust/pin-init/src/lib.rs
> > @@ -1278,10 +1278,7 @@ unsafe fn __pinned_init(self, slot: *mut T) -> Result<(), E> {
> >  pub const unsafe fn cast_pin_init<T, U, E>(init: impl PinInit<T, E>) -> impl PinInit<U, E> {
> >      // SAFETY: initialization delegated to a valid initializer. Cast is valid by function safety
> >      // requirements.
> > -    let res = unsafe { pin_init_from_closure(|ptr: *mut U| init.__pinned_init(ptr.cast::<T>())) };
> > -    // FIXME: remove the let statement once the nightly-MSRV allows it (1.78 otherwise encounters a
>
> Do note the comment mentioning that it is needed for version 1.78 here,
> so I think this patch still needs to wait until we bump the minimum.
>

Yup got it. I'll send the patch after the minimum version is
increased. Thanks for reviewing.
