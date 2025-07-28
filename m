Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DAF1F92A
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 28 Jul 2025 04:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753675241; cv=none; b=pBWbGo7nLu6Vu9TopgzmOloWJcgFuxZ1LMSrzL58v/bIW768VKp7IAObZinx4G1fApRzRiUTUMNrNGpeqC6Vc8vfozU3GhiPJ/iOPIL0mYeo0Li13u9mdUwL78usuL4P6zGxULOh+5Ig8qZXwYOxBWzuT6vU9gZ2KmkOAI+mhgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753675241; c=relaxed/simple;
	bh=qvN3pWCHp4FPHVOjEd0CKFbCWxdZzTv+jVDywDNGm0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G7ETSHTBoECCh10b0E+asEiDSJQhBoFa4b3K3OIPFCoAIisBvgP7A1I9sMFWRm/iCF+kM3dZ4UNXw/Z9h6ji/5RqklF9JWWWmKNpqFx2exuNM9bknMgxUk4HyGa/q7X5yNJMf5Viwy8hxDhFSdPsDo9cG0gQnA8vqAcNYI3s5hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cde30Skd; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cde30Skd"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-2cc89c59cc0so3312624fac.0
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 27 Jul 2025 21:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753675235; x=1754280035; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvN3pWCHp4FPHVOjEd0CKFbCWxdZzTv+jVDywDNGm0U=;
        b=Cde30Skdv/u2wjBrYTOB0fRZ22rNqfe1VYJuw6yzQ1hbyA+fkG1voc09uZUQX8I/7z
         vHfuk4+REmZKwO2fXtOKOOHQrAkGFK799bO5cWZy5V1TYzSQH0LhtprIs+bbNX+WO8xo
         mlLX/peUU2hA6Hzb+MpGzKYPpzPnmKu5IRPMyH1xAY80p9zVE8E/pmaAxnD6eFGgjOaN
         Jyth9jgBKRLVdphQ53BN4msW7ozcA7vp2jHdWDVIKdUMcxQNtr85rXB/HkTslJCjw/LC
         5xaGJ4/SuY6tYrPhufOE+p1ED4Ox+7Jmh2hnxALXl13/2AW0GZYGPzoPhvALtuxP0eQS
         bKBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753675235; x=1754280035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qvN3pWCHp4FPHVOjEd0CKFbCWxdZzTv+jVDywDNGm0U=;
        b=GDD7b2lxzLw1khkbYBpIeXDt3LS4JK5P/Km8Tf/xprPJWm6HJK2pzwrtA9PTX6xB9M
         Cm3GrST+bp1jOpEPNQDo9I/o18+GarzL6ReNNZzevU96dwfWgIZ4wKNu6iTUjCzc/xRK
         Cok7VGwMltzRg6yJ1l/eFeG5NvDBtkSRs1GQzWrXddgME0Z0MHKKR/jjG+hd9qE+HGZ+
         hN3JmyXw2cuRCgrYGyJ6DD95j0Ac0S9CBJAT6ZabD6WBMqWYO13xOJi2hlr+nXnNNCFw
         SSpjHGDUBq615hoXYfvMwTszvuKmnjakc+yh+WbM9CRPyZxIKgmXSL06+3eqSfMLZPpV
         XpgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpARr+Ovp178d8NCdpvgPw7IXKd1Oh4a321V3nCU/KMsXaYdrIelbtsxf4q2jEuJu0HDg/NVOcU4v/RD8vINkk163o2A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwZwlUyyHYjQGIfYl2mrm6/pfyr6qUq3Gzi5aZ1IDA0P5ZT+GNl
	H5IvpUI5gBOCoe/uFYXwdsZ65EbYPbpWKA13eLL/CgQE/AWJccB5Z1+3YTLJmir+9sT4bcZZMp0
	u582D8X0bc9bSqxuK9Lxg8Fu+8lAKFZY=
X-Gm-Gg: ASbGncuYwwDNGBB0Wj4eH4DW/CPUDl7QVHLkDWKTkaiB8KKB3GUIo5IkhpfM2ELTKz6
	e2uc3QD8lbV68jEh6ximL9DrmZURUETC8wcizx0YG+BSQIYJfYYubqOA8B/SYUsA7vU3tTPRs+n
	TKi9U/61CDphu6kXE65LvY/a7PS8QzBcb1ezuFHzH261T2SRDU3pREntlk/juBrI9qnj+00fthq
	AszKyqR5ypFthOy87A=
X-Google-Smtp-Source: AGHT+IG7FXpna1h57gCU/IkaF5+PeDeNtItAlACpGm7WezR0tx16skuQv/RQ8wWIaxf19/YYa05/tuTKHz5x2htsUQk=
X-Received: by 2002:a05:6870:c0b:b0:306:e708:c958 with SMTP id
 586e51a60fabf-30701e53fa4mr6524644fac.4.1753675235542; Sun, 27 Jul 2025
 21:00:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250727170217.206794-1-suchitkarunakaran@gmail.com>
 <DBN0JG0QP7TU.PZSZ8NZL5LD6@kernel.org> <CAO9wTFisWa5qY2qQE+BEdD40vacGwtzw=2xxPnV0V_w=Gt4jwg@mail.gmail.com>
 <DBN16LSXVANU.1LMW8POGVF2CJ@kernel.org>
In-Reply-To: <DBN16LSXVANU.1LMW8POGVF2CJ@kernel.org>
From: Suchit K <suchitkarunakaran@gmail.com>
Date: Mon, 28 Jul 2025 09:30:24 +0530
X-Gm-Features: Ac12FXwH_4SIl4ADStj1aszm5Xio2dj4WhMN5qSwGpTUqcV6kWhDWBsCgDQ-d28
Message-ID: <CAO9wTFhB1cJJOFOo1MWdXpoPau9pun8Of958DAB8Mwb-HPW5Yg@mail.gmail.com>
Subject: Re: [PATCH] rust/pin-init: remove workaround for type inference cycle
To: Benno Lossin <lossin@kernel.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, me@kloenk.dev, 
	chrisi.schrefl@gmail.com, rust-for-linux@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 27 Jul 2025 at 23:28, Benno Lossin <lossin@kernel.org> wrote:
>
> On Sun Jul 27, 2025 at 7:44 PM CEST, Suchit K wrote:
> > On Sun, 27 Jul 2025 at 22:58, Benno Lossin <lossin@kernel.org> wrote:
> >> On Sun Jul 27, 2025 at 7:02 PM CEST, Suchit Karunakaran wrote:
> >> > The `cast_pin_init` and `cast_init` functions previously used an
> >> > intermediate `let` binding before returning the result expression to=
 work
> >> > around a Rust compiler issue causing type inference cycles. With the
> >> > minimum Rust compiler version for the kernel now at 1.78.0, where th=
is
> >> > issue is fixed, the workaround is no longer needed. This patch remov=
es the
> >> > unnecessary `let` variables and returns the expressions directly.
> >> >
> >> > Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> >>
> >> I still encounter the cycle when compiling with 1.78.0, which version
> >> did you test this with?
> >>
> >
> > Oops, I just realised that I compiled it locally and forgot that I had
> > installed version 1.78.0 on my VM and not on my local system. I
> > actually compiled it with version 1.88.0. Sorry for the inconvenience.
>
> No worries.
>
> >> Do note the comment mentioning that it is needed for version 1.78 here=
,
> >> so I think this patch still needs to wait until we bump the minimum.
> >>
> >
> > Yup got it. I'll send the patch after the minimum version is
> > increased. Thanks for reviewing.
>
> If you do, then please send the patch upstream at [1], that makes things
> easier for me, thanks!
>
> [1]: https://github.com/rust-for-linux/pin-init
>

Sure, I=E2=80=99ll send the patch both here and upstream at [1]. Thanks!
