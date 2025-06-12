Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2C32D3237
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Jun 2025 19:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749756612; cv=none; b=gMtpTayx7FfeYDT1jPfNig4O3FCDSyPuYo1dviKu8lNzpDriUDtvZ/YSSOdJ4J/4ZnKj5CoanoXV5aVC/gsP3e1trAiH8EfJuJkAXE/8t5SrUJgMq9ugvOG4LLX8++1zGwwISe0egMuHnbvll80S8iTnwZBZNQk46Q/AK3Oi05E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749756612; c=relaxed/simple;
	bh=CcqpGh9z/Ce+MNF5QoPH82IVpEGXPfDNl6fTwAvAo8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ju8ktJkiueyDUrwKKFDeIqG5JxJRNvHZ2NdArJqMfNgASX2lmMjioxLzDmlW6LjSCYivhE0E83mZ+NQzbUGtQOADdyU56AALFEEPZ47dcs6qOaRmGd1ek7txvbsKm94/RBcQ64Tva+lm0SkuP2WuuDwV9CCkAfnSjdGhtmJqvL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=euxLcakD; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="euxLcakD"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EA2860BC0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Jun 2025 19:30:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m1zypn1KYFTb for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Jun 2025 19:30:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4860:4864:20::29; helo=mail-oa1-x29.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D4EF160BB1
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4EF160BB1
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=euxLcakD
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D4EF160BB1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Jun 2025 19:30:09 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-2ea34731c5dso702307fac.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Jun 2025 12:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749756609; x=1750361409; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sKGZf29zeJuTyr5Er/hAccheguB+TsnTj7N2LnaeJXc=;
        b=euxLcakDD3z5Bwvom1OtJb9YY83f+rqozu3Qw8gGZtID83qIez/CVSQDM7VZgeBLcD
         7RTDGBHt5UQzfMiHKzH7YdtLG8mx+oR38iKq+4yXJneIGn1uQOptEzwMleZCcxYPhDaL
         gXatrwGT/5/klVq+eVbEVmd203p/sssNyOsub94ynhUAgspM2b2xTBprDyipJez1CxpB
         PHPYykkqujMPh9PM5Z0bYHkQ6fP5r1MiNh0dg3eJOlh43vxiSBaZCq4J4nnrpg5V8AKT
         27tBu/cIegf80gg79uS57uM5ET5SHDpf/VGD7YjK0tQvRuz6wiu6GKx8dyZrUu5PNulv
         SMpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749756609; x=1750361409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sKGZf29zeJuTyr5Er/hAccheguB+TsnTj7N2LnaeJXc=;
        b=C/C5tztYKW2W+X+/UsDm82uuNx1EH4l1ybtvNvExTh1AgK7UCK0pfQ1qZCMWRFoFbT
         nSVOLmh5ohqgT/IF0p/O7IuQXoETAtpMXx3lFRIh6x+mc50H2D8IZhET2shLxPVZwPKh
         Vm5lHJVTDZ8keNo78eTOXydIP+jfYnFZvouhj1vAIw4f1zTjjX0wL8ObaP3qOzCcPCik
         3GS4TMvNkgkHK6XvflulwWKFFPGdlELn6+/xgqEX/1wLOScWq5o3oCiEbrC5PniXaSGX
         fewdycUh9sFC0Zoiqz9LV6D4gxfVU6tBuBmwf5hTm7OmDSSI+ovn0jkG28iBCFnPOJnn
         Nw4A==
X-Forwarded-Encrypted: i=1; AJvYcCUO5bpFAt2xn83EOjldvVGYGLsaNWdX5tU67MIzN+IwT7TIzi7JloXyJjoIAherEruGgKaR8aUXhmdWHqwnTuoSvYjPDg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzojCY1NqUz1sKT5ZN5zHcrl48VPE1wv/0HwKj6dktenzmSDZwb
	oiQeuF4eiU5necPrrFhvsBIjIy2jrydBzYLT6wyBJpHtzxFcHPNo3mUrcMLRYsl+Vl3XF3hrSuP
	981zJFQs3ITApOP9+xkmCSORCDuI3ato=
X-Gm-Gg: ASbGncvHN+ToznicccZnoAWQTSUxK2D0Wssf6dwLy1ZTqBX1XF4odjYv8cifDPPKOFm
	jDbqb1dKKZASPPaOU6DBj9u4gL/KPQQfl7VVvZWXd5yqUZA/YtCIODY+ny0KQ0KF9W6/HboDjXY
	H1mfzbElyKLRsO1gEql31yYoCi4p1+yH+O7fNBMiq5K+5AuxIAzUwNXaxdNkcGVkYSow==
X-Google-Smtp-Source: AGHT+IFmsq9sEI1DwWDfzQEZyfKZ6sKyH+yEuzi6AEoCYzQdb4LIZMRoqB1ychnI0//y4/XN6kS72Ohg4umywUsq2f0=
X-Received: by 2002:a05:6870:459d:b0:29e:27b6:bea5 with SMTP id
 586e51a60fabf-2ead510a294mr204968fac.25.1749756608683; Thu, 12 Jun 2025
 12:30:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250602232842.144304-1-marcelomoreira1905@gmail.com>
 <20250602232842.144304-4-marcelomoreira1905@gmail.com> <DAKFP38LXT84.QN50NZ2QB4WU@kernel.org>
In-Reply-To: <DAKFP38LXT84.QN50NZ2QB4WU@kernel.org>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Thu, 12 Jun 2025 16:29:57 -0300
X-Gm-Features: AX0GCFuv3CuGZGgFXqgtoeVvFBARV_ILL3PpMLlKpk0s2y3xseDEjs6AETefSSY
Message-ID: <CAPZ3m_ie+0+mcdKdVsZgbzLBZyf=9YvmyNUSCX7ehMhaJF_Baw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] rust: revocable: split revoke_internal into revoke
 and revoke_nosync
To: Benno Lossin <lossin@kernel.org>
Cc: dakr@kernel.org, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qui., 12 de jun. de 2025 =C3=A0s 06:07, Benno Lossin <lossin@kernel.org>=
 escreveu:
>
> On Tue Jun 3, 2025 at 1:26 AM CEST, Marcelo Moreira wrote:
> > This commit refactors the revocation mechanism by removing the generic
> > `revoke_internal` function. Its logic is now directly integrated into
> > two distinct public functions: `revoke()` and `revoke_nosync()`.
> >
> > `revoke_nosync()` is an `unsafe` function that requires the caller to
> > guarantee no concurrent users, thus avoiding an RCU grace period.
> > `revoke()` is a safe function that internally waits for the RCU grace
> > period to ensure all concurrent accesses have completed before dropping
> > the wrapped object.
> >
> > This change improves API clarity and simplifies associated `SAFETY`
> > comments by making the synchronization behavior explicit in the functio=
n
> > signatures.
> >
> > Suggested-by: Benno Lossin <lossin@kernel.org>
> > Suggested-by: Danilo Krummrich <dakr@kernel.org>
> > Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
>
> One comment below, with that fixed:
>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
>
> > ---
> >  rust/kernel/revocable.rs | 38 +++++++++++++++-----------------------
> >  1 file changed, 15 insertions(+), 23 deletions(-)
> >
> > diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
> > index 43cc9bdc94f4..daf22e3a7d20 100644
> > --- a/rust/kernel/revocable.rs
> > +++ b/rust/kernel/revocable.rs
> > @@ -126,22 +126,6 @@ pub fn try_access_with_guard<'a>(&'a self, _guard:=
 &'a rcu::Guard) -> Option<&'a
> >          }
> >      }
> >
> > -    /// # Safety
> > -    ///
> > -    /// Callers must ensure that there are no more concurrent users of=
 the revocable object.
> > -    unsafe fn revoke_internal<const SYNC: bool>(&self) {
> > -        if self.is_available.swap(false, Ordering::Relaxed) {
> > -            if SYNC {
> > -                // SAFETY: Just an FFI call, there are no further requ=
irements.
> > -                unsafe { bindings::synchronize_rcu() };
> > -            }
> > -
> > -            // SAFETY: We know `self.data` is valid because only one C=
PU can succeed the
> > -            // `compare_exchange` above that takes `is_available` from=
 `true` to `false`.
> > -            unsafe { drop_in_place(self.data.get()) };
> > -        }
> > -    }
> > -
> >      /// Revokes access to and drops the wrapped object.
> >      ///
> >      /// Access to the object is revoked immediately to new callers of =
[`Revocable::try_access`],
> > @@ -151,10 +135,12 @@ unsafe fn revoke_internal<const SYNC: bool>(&self=
) {
> >      ///
> >      /// Callers must ensure that there are no more concurrent users of=
 the revocable object.
> >      pub unsafe fn revoke_nosync(&self) {
> > -        // SAFETY: By the safety requirement of this function, the cal=
ler ensures that nobody is
> > -        // accessing the data anymore and hence we don't have to wait =
for the grace period to
> > -        // finish.
> > -        unsafe { self.revoke_internal::<false>() }
> > +        if self.is_available.swap(false, Ordering::Relaxed) {
> > +            // SAFETY: `Self::data` is valid for writes because of `Se=
lf`'s type invariants,
> > +            // as `Self::is_available` is false due to the atomic swap=
, and by the safety
>
> Please also use `self.data`/`self.is_available` here (& below) instead
> of `Self::`.

ok, Thanks! :D

Cheers,
Marcelo Moreira
