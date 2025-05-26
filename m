Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2142E40B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 May 2025 02:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748225437; cv=none; b=RImnynCRlYd6vHoL/5qon06LCvyS4AsrRwOFwBycemdI6CT3jQR9BxNcX4OvBQkiqD46UuAX8dX/GCBcJXrc1+1B6/UE8RrG6FvIe/GR9gTdNVnCdhD8zfrsIp2NMEW7v98RVZLhxyRbST+6rqyZW0blk7opFPfFNmruFOcUOcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748225437; c=relaxed/simple;
	bh=0nbGT2GlXb33Ss9MQ4uxO6gE8jpDPRoMCrJSOOK5Q9E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZqpLMgc12UhQQWFY3IMOwoT45unB3u4qs+ufat4wwqZKmFyUB1EonOlL4g0n3LqduHSuuMzRUSV4B7/LMEuKw4hjxklOh9ZDY4D/pKOKC32fcF8ZDIUmCz9SuFg50vVsB7tVjOj+mSehGXCz1AAn88X4Oc/K6L76Vzs0SQrDdcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q/fpyfZV; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q/fpyfZV"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D417805B6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 May 2025 02:10:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7e83EmO75eAI for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 May 2025 02:10:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4860:4864:20::2d; helo=mail-oa1-x2d.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5A5E58059A
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A5E58059A
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Q/fpyfZV
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5A5E58059A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 May 2025 02:10:35 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-2da73155e91so589912fac.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 25 May 2025 19:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748225434; x=1748830234; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mn/KkI5glUJ7hQ7qi0uM8/HimmScaJn3h59Vw1YH2Ac=;
        b=Q/fpyfZVkgG5rQQv3O0DZfTSRE2GazAzUisHytoSyIB70DbRXoiYdqyIkvufxlOJal
         VA8vPVTL5xV2++gpp34mELZEJvb41eAbQXP1gDLBcRV4jmpddr4HPUyl6Y68s4KQkAwo
         Coh6DCQalfjvY0RHXnx7xQE2b+KDmnp8rLNd0HdSLkFQ5+JN9W1RcPyWwhrSKB5rGE1Z
         sGrpw1k+Mmn5fkk/Z0wJm3pt0e/jx3ZBK2Y0duAux1lIkQY1dU6fQ42yqHBYrN0gQ8ut
         e1Cb+rdwQXwlspNbY10KrGNxXribLqgXd08dBY4KZz3QiWSBhP2rHpkvuwh5AZf00n6H
         9bJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748225434; x=1748830234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mn/KkI5glUJ7hQ7qi0uM8/HimmScaJn3h59Vw1YH2Ac=;
        b=vCB//IcZGdIqOQAdn+byTGWHiqk/eQI8NKK0yiN/1sY0QTkq3cR2LGcY1mULAXrbSL
         gN5EuAyFPNoVNVy5p3FpnqteTBUVabfovKiHMXXomyH47r4HYB/V/rqV6aOjBXmPxA3e
         6i+wn0x6gbsPztGMSSPO4BF/YTRWNBA39BYkPFU3DVk/TZyD88I4AAt9B5s9HuoZDPpQ
         /9nG59fGARiw6cR0EWxXYXVsdTjKUryhJ+ANlK9NJve95wDdvf26aW4y/EjOTZ88JUfb
         uZUmuzu7xAjNAidHEk/tFaUBURv8ke0qO2uwrygiC5YDtwAcjP8BXECUJJLqpZvPyEFe
         frcg==
X-Forwarded-Encrypted: i=1; AJvYcCUwOKKC6xVg1MXZARQKUS2fn6//wY577S4NwhxJGT4fEQHF7UHo1HPx3jwAt9Vkqqp/K5EwLoUsaLszGACvPy4jvhPp0A==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzeegF/lz/8CWYMSUB0wmMwYDbounpjYsOcDc53kO0YJ/FWFx2H
	vD3VQ7P5r7b5sYallR4ApeS+GQ1FHUjDR0yMbU0oH0Rahv59S1RXgvqVeTOr9j41T0WAadb/NYs
	Qx74KhLrJkr9Z2xMAqVkgs/lXWzKkxWc=
X-Gm-Gg: ASbGncuUEInDV60cxQfgNijUtAeWHRX2Qvin1hil0srOBokHVvCA9oT578Ihfw1Ucdm
	XI820ROQRVmp4sQnfim0fuctrAxad0/v/+WD1YCRTkAG50P9d5OEJtD+wg+e5z5QQ0G5ACGQR8S
	cxWv5n1xJRJ6jMqUs+pmXwpqGh3KYBNHH4dgp2mR80ORsL
X-Google-Smtp-Source: AGHT+IE6GxnCgZfQE34+GGdxCnGU4yePgtG4uRtXLQLRBOpOIUwNJkgnFqMM0umpqsY81ZTDyF0GGxbskYdCpBZgnwY=
X-Received: by 2002:a05:6870:4589:b0:2d6:109d:2598 with SMTP id
 586e51a60fabf-2e861dd0438mr4215534fac.5.1748225434078; Sun, 25 May 2025
 19:10:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aChczAWsPdmdeen3@pollux> <D9YO7XDNV712.3A5HSSLUQIZ2W@kernel.org>
 <aCrwuQP46RFHxYB5@pollux> <DA00X0RTYKMA.2OG25TZ1X3AU@kernel.org>
 <aCsAEJtkCKKhspnF@pollux> <DA03ANJMDOU2.1ZQWA6MIENVKD@kernel.org>
 <aCsX-k0K_jqLvD4e@pollux> <DA04WHRZBBS0.17WRMWDF0A335@kernel.org>
 <CAPZ3m_i8fwsBRJKay72LHT4pEW=eZ5LxCFD=8CYkuEksjjt3_Q@mail.gmail.com>
 <DA3ENUO97I6D.234AA7I97AV62@kernel.org> <aDA4HIOL-g37cvpy@cassiopeiae> <DA3IPNILKRA0.3LJ8DGKQ99KP8@kernel.org>
In-Reply-To: <DA3IPNILKRA0.3LJ8DGKQ99KP8@kernel.org>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Sun, 25 May 2025 23:10:22 -0300
X-Gm-Features: AX0GCFvh5ITjv588SBXUFjNEzCG7fOrSzN8qlbEeJ_5DVMpeDB5z9JJe-MCTxaQ
Message-ID: <CAPZ3m_jw0LxK1MmseaamNYhj9VY8AXtJ0AOcYd9qcn=5wPE4eA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: doc: Clarify safety invariants for Revocable type
To: Benno Lossin <lossin@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, benno.lossin@proton.me, 
	ojeda@kernel.org, rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Guys, thanks for your patience and kindness =3DD

I'm sending v3 right now!

In Brazil we say "Tamo Junto!" - We're in this together!
Marcelo Moreira


Em sex., 23 de mai. de 2025 =C3=A0s 08:53, Benno Lossin <lossin@kernel.org>=
 escreveu:
>
> On Fri May 23, 2025 at 10:55 AM CEST, Danilo Krummrich wrote:
> > On Fri, May 23, 2025 at 10:42:58AM +0200, Benno Lossin wrote:
> >> On Fri May 23, 2025 at 2:13 AM CEST, Marcelo Moreira wrote:
> >> > 3. Clarified revoke_internal for SYNC =3D false and swap correction
> >> > Proposed Documentation:
> >> >  if self.is_available.swap(false, Ordering::Relaxed) {
> >> >  if SYNC {
> >> >                 // SAFETY: Just an FFI call, there are no further re=
quirements.
> >> >                 unsafe { bindings::synchronize_rcu() };
> >>
> >> @Boqun: is this true?
> >>
> >> If the answer is yes, then we should add this as a safe function in th=
e
> >> rcu module.
> >
> > I think it's a case for Klint, since synchronize_rcu() must not be call=
ed from
> > atomic context, since it may block. Otherwise, there shouldn't be any a=
dditional
> > requirements.
>
> Makes sense, but then we should add this as a safe function (in a
> separate patch). After all we already have other safe functions that
> should be unsafe were it not for klint.
>
> >> >  }  else {
> >> >        // This branch for `revoke_nosync` requires the caller to pro=
ve
> >> > that `data`
> >> >        // can be dropped immediately without waiting for any RCU gra=
ce period.
> >>
> >> I'm not sure that having a single function that does the revocation, b=
ut
> >> has this going on is a good idea. The safety requirements will be pret=
ty
> >> complex.
> >>
> >> @Danilo what do you think of inlining this function?
> >
> > Sure, if it makes documentation significantly easier, which seems to be=
 the
> > case, then it's probably worth.
>
> Yeah then let's do it (also separate patch).
>
> ---
> Cheers,
> Benno
