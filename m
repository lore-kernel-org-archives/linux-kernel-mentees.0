Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAD7A59
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 23 Jul 2025 23:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753314593; cv=none; b=WuEd82kFZB9fXRmMV3D9lVE5LjPCTEPj6c0b/x4okl9ZMe4syF0V0tktnel1kuoS0nHEd8t4IJtfCjGvBPPLE+lZtKfs7rjbt7BOXwEkNICcHavmNImZUZWkXoZs35OmOEgb3+H5HUQr7AevWMALzFAGa149Xdq64gLkkTYQkVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753314593; c=relaxed/simple;
	bh=gJ6QvWTtPoEZV0vQSM863Xzk5kvnPKuhiZgVvnMDq1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AozVs3MCbaIjjYXeTS5UDMM0O82Qpw667Trk/XmuB9xEjyaOPfOu21OqSZWiCddh+6b+QH9DGRGqOf3+Fo8D99Gt8qKvPs80BK/zuwZn1zGSjZxqWkoOJkJI00yYqlwgYnRQQRTN8Azsc60Q9amK40Zl74E1lUA1NuwPOOPcoGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DXJNMA1e; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DXJNMA1e"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BAB941099
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 23 Jul 2025 23:49:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aFluC99dc-na for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Jul 2025 23:49:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::330; helo=mail-ot1-x330.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7178B41117
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7178B41117
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DXJNMA1e
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7178B41117
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 23 Jul 2025 23:49:50 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-73e88bc3728so110206a34.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 23 Jul 2025 16:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753314589; x=1753919389; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJkBuJA1bEWnF4NjmDtK8UbAiVwDs7c1RyvKhyo4rz8=;
        b=DXJNMA1eDkt4CQKrc4JuAaY+kJFfTi4UTj+OfsUBzXgA/mjtfzyo/niB/kHXKnmUS3
         uSwaMn8BJlz7L4x2zzDYk0Kq37raeKuSA7LWSSdoJaIObyMfQ2EgoECwLnYDKE2RVeH1
         33QVe5URH9F6VYN9U0VCb26RtfxpixZLN9/gWcD5MZlrlvB2cE1HG483w00sR4lLNsEV
         1xSIpA+T29QScTepIOdUG3t58PUVLtrBvjl8REKnJanrzjq5clhIdk4zIiSL8PnCD3/A
         uvoQml4g8NQoHLEah/UhpLOdd5gJZj0MHN6NAnKG0WCnLEX8rPPqUtVgCEcNz619hkEP
         pdCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753314589; x=1753919389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YJkBuJA1bEWnF4NjmDtK8UbAiVwDs7c1RyvKhyo4rz8=;
        b=LyG+FqgkcDPqk0OxezCl8SQDLJavm45HJojqyoV6DOS9y2rnzxTBIIgjkiSosHhQMa
         vFjiH4pc7iGBAqrP92IvaqBFBDch/nEcZrOjZGmn074swQbCNg7FBbCunJq1LtJ/da4r
         qbSiANQ6HMIjt/8/UR0HycTTQKHRzxclxN1SmoWt+9BTK06kEYZ4oowDaTAkzwvAiI9B
         0++SS49ONFf/rs7KLa6IN7X2sYvNCp7TCRBci8AB2SQTV4QQQlRpdrOBw0ZAfE9mHihm
         rHysvEVVxofmKBHDagtkYRwL1VkLRpTclSb9gAwwZ1T28TQI/B3uWlZrE5mU9iKbOVGR
         5kGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnsZ8jqncGcUY9ubLBH/4ol9LI0nNHF4NZauzZsIVnl6J8Ev+A3cvvl05POxob8zdHc/sAzcvP2rWBrLZZEYBPCTMNTg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yzuve3gMNPLAIcD9gGKy1iv/sCxNBnVmSda5RsLoa2bdgPTbusz
	fZvY+1jqZOmFVFwggSG9g34BquvqBYU8UN+IPVPxASVGpq5WnewXnmSwuKp96dv3VpaJa4bE7BM
	A2zqrNfa4xQEghJVJpnFQ/eGmYDMCQ1U=
X-Gm-Gg: ASbGncvN+Z1bn37yAvtGrZzKu5u3WFoNazQPmiShZp5oZfMhB6yWcVB41U6XAAP8Hc2
	CuLR3CTUtrYjUIkn5XzZK2nr5n2/hmpFuapqp1XNhrDF1+jmDNSbWheDnRXZChSiPLG8kAppPZW
	GWI2J39hxG1BUaCA1v3rXgyXMpzxhqwZzIYlDUS34RIuho0F4qtqVXzco66BxoFAFq7chM7/gOx
	/Y3jX4A1sSGStKFxWTkoSbon7NdxA==
X-Google-Smtp-Source: AGHT+IG1fHaqjmzQCwCOyic+2p1F9L7gvaAJ9aM3YWnNrlhglFg136vVfD+MdGNvIxheteX4QamjQT3STKGLvzTQnRs=
X-Received: by 2002:a05:6808:199f:b0:41d:981d:b7e9 with SMTP id
 5614622812f47-426cd7cb117mr4160498b6e.38.1753314589176; Wed, 23 Jul 2025
 16:49:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250721010258.70567-1-marcelomoreira1905@gmail.com>
 <20250721010258.70567-4-marcelomoreira1905@gmail.com> <DBHSSQS2IALW.2OEWVKX6PY9LZ@kernel.org>
 <CAPZ3m_h4rvV8gfBi0ZQN=569FhB1+DsF2A6XkkLuWAFUEuKPDQ@mail.gmail.com>
 <DBIIZ28TA8SD.XY1W0S6G280F@kernel.org> <CAPZ3m_jepxCD-dr+gyun_=hb-fHX_yxTunsd4JX98nt4XmnEQA@mail.gmail.com>
 <DBJI2YV59B29.2CZPPGB7G9TRF@kernel.org>
In-Reply-To: <DBJI2YV59B29.2CZPPGB7G9TRF@kernel.org>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Wed, 23 Jul 2025 20:49:38 -0300
X-Gm-Features: Ac12FXwBG65B-Zjd_l--VOq3xaXV1wbZqM0PrU9_d4ybkcaSNeRBBW2TLGiFQ9A
Message-ID: <CAPZ3m_i8j90tkjYaEZp+trd7GHSu1eaQLO+rqpn6HhV35JQH-w@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] rust: revocable: Document RevocableGuard
 invariants/safety and refine Deref safety
To: Benno Lossin <lossin@kernel.org>
Cc: aliceryhl@google.com, dakr@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qua., 23 de jul. de 2025 =C3=A0s 11:22, Benno Lossin <lossin@kernel.org>=
 escreveu:
>
> On Tue Jul 22, 2025 at 11:23 PM CEST, Marcelo Moreira wrote:
> > Em ter., 22 de jul. de 2025 =C3=A0s 07:51, Benno Lossin <lossin@kernel.=
org> escreveu:
> >> On Tue Jul 22, 2025 at 1:01 AM CEST, Marcelo Moreira wrote:
> >> > Em seg., 21 de jul. de 2025 =C3=A0s 11:21, Benno Lossin <lossin@kern=
el.org> escreveu:
> >> >> On Mon Jul 21, 2025 at 3:01 AM CEST, Marcelo Moreira wrote:
> >> >> > Refinements include:
> >> >> > - `RevocableGuard`'s invariants are updated to precisely state th=
at
> >> >> >   `data_ref` is valid as long as the RCU read-side lock is held.
> >> >> > - The `RevocableGuard::new` constructor is made `unsafe`, explici=
tly
> >> >> >   requiring callers to guarantee the validity of the raw pointer =
and
> >> >> >   RCU read-side lock lifetime.
> >> >> > - A new `SAFETY` comment is added to `Revocable::try_access` to
> >> >> >   justify the `unsafe` call to `RevocableGuard::new`, detailing h=
ow
> >> >> >   `Self`'s type invariants and the active RCU read-side lock ensu=
re data
> >> >> >   validity for reads.
> >> >> > - The `Deref` implementation's `SAFETY` comment for `RevocableGua=
rd`
> >> >> >   is refined.
> >> >> >
> >> >> > Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
> >> >> > ---
> >> >> >  rust/kernel/revocable.rs | 25 ++++++++++++++++++-------
> >> >> >  1 file changed, 18 insertions(+), 7 deletions(-)
> >> >> >
> >> >> > diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
> >> >> > index 6d8e9237dbdf..0048de23ab44 100644
> >> >> > --- a/rust/kernel/revocable.rs
> >> >> > +++ b/rust/kernel/revocable.rs
> >> >> > @@ -106,9 +106,12 @@ pub fn new(data: impl PinInit<T>) -> impl Pi=
nInit<Self> {
> >> >> >      pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
> >> >> >          let guard =3D rcu::read_lock();
> >> >> >          if self.is_available.load(Ordering::Relaxed) {
> >> >> > -            // Since `self.is_available` is true, data is initia=
lised and has to remain valid
> >> >> > -            // because the RCU read side lock prevents it from b=
eing dropped.
> >> >> > -            Some(RevocableGuard::new(self.data.get(), guard))
> >> >> > +            // SAFETY:
> >> >> > +            // - `self.data` is valid for reads because of `Self=
`'s type invariants:
> >> >> > +            //   `self.is_available` is true.
> >> >> > +            // - The RCU read-side lock is active via `guard`, p=
reventing `self.data`
> >> >> > +            //   from being dropped and ensuring its validity fo=
r the guard's lifetime.
> >> >>
> >> >> This shouldn't be needed.
> >> >
> >> > hmm, about what exactly?
> >> >
> >> > Are you suggesting to:
> >> > 1. Simplify the content of the `SAFETY`, is it too verbose?
> >>
> >> It's not too verbose. The requirement of holding the RCU read-side loc=
k
> >> is not a *safety requirement*. It's already guaranteed by the existenc=
e
> >> of the `rcu::Guard` instance, so we don't need to concern ourselves wi=
th
> >> it in the safety requirements.
> >>
> >> Essentially you're just stating a tautology in the safety comment like
> >> saying "2 + 2 =3D 4".
> >
> > Thanks for showing me that Benno.
> > So we can keep it like this:
> > // SAFETY: `self.data` is valid for reads because of `Self`'s type inva=
riants:
> > // `self.is_available` is true.
> >
> > Sounds good?
>
> Ah sorry, I didn't take a good look at the non-RCU justification. I
> liked the phrasing in the non-safety comment:
>
>     // Since `self.is_available` is true, data is initialised and has to =
remain valid
>     // because the RCU read side lock prevents it from being dropped.
>
> So how about we combine that with your current version:
>
>     // SAFETY: `self.data` is valid for reads for as long as the RCU read=
-side lock is held because of
>     // `Self`'s type invariants: `self.is_available` is true and the RCU =
read-side lock is held by
>     // `guard`.

good! but how about we simplify it:
// SAFETY: `self.data` is valid for reads because of `Self`'s type invarian=
ts:
// `self.is_available` is true and the RCU read-side lock is held by `guard=
`.

--
Cheers,
Marcelo Moreira
