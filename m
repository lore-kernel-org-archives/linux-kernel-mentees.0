Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400ED273D93
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  1 Jul 2025 12:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751373647; cv=none; b=pQlxniR+CBDMTLxaCr4vZSt8yOpOgcZTn9eHJ+mCl1QbgzwXWZwOHl4zJRGyxNH/+9wVBpcAWfCdCeAYWJOqCixJoQU2qvq+ockf27QIzgxdcfoC70Rrr0AdpbtdvAVf3vnfdDCEQ9/xoLhXEyofBgjbaO6TCmp4jqfIS3sKivE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751373647; c=relaxed/simple;
	bh=wsrtT7s5b9mhLZIo+sZQI9vjY/IY6SEISkh7aZxU8/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f/SZddTCgjvHHQCyHWwvRd4/3+2pmq7J6SaDbR/Oboia7eM/V/eu5ZPNg7PEzvbjuDBA2dySzI+2qWU7YiFAha4EbFl4De7nAv839aFOElRvpmOK9PZKeycrypQ7omADli668Yx9TXxpi/0J+2XMWD0ojq/VHTZoMR+3U71cIf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UAp/oQhr; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UAp/oQhr"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF71D84971
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  1 Jul 2025 12:40:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jy4uOMfbZUfS for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Jul 2025 12:40:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4897084977
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4897084977
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UAp/oQhr
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4897084977
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  1 Jul 2025 12:40:45 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-73b1fbe64a6so502528a34.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 01 Jul 2025 05:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751373644; x=1751978444; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XdErdFg1vX4gcYQWDTK5wUjoqQS/z3Xz9dvVl3+3m3o=;
        b=UAp/oQhrTdmt6R/6ZRCT4q8C8XVQ3r8G8Fy2DAIhY4hHKlCo6xMxRmlCumpUJ0SrIc
         jYIp+C93dT2fx6yTCGiOxwKSkcjr/iR+Y9xFSIfzZOGetRQqzcNpmmX6nwSWBaBRaVNl
         p+jm9ZroiAwVXkr+zrebPG6KUQwP88VeMua1oVs5+TIhmVBYDogugZw44DxGT8j4HloS
         KivyhxuRMOaykDt12Cxa/hoLR6JF2uv3OJntJUdX/OUOX3B2JjadVFYL2teeq6tmKiFu
         mcr4MxuYCB37Sipwbh+oVhIcRyAW1yFJTJ162AnT7f+pGWgL2GvjvxwQbQwztD7GL1Yy
         wrzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751373644; x=1751978444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XdErdFg1vX4gcYQWDTK5wUjoqQS/z3Xz9dvVl3+3m3o=;
        b=pbnyF38Euw9yzqMuQV1WvS1mYaE31KK9AsUrF6eIEP3AQ4EoPcZ0dGSy8+rmPVg1fS
         AdCO5xnS04c9WZ9+sHD7doSHbn3hGqdBwPnrh7PxvaGqOhKKgUGQrlGWVyenr8u7BgbH
         Zjo9FPCHO1wiYCk8BTPWfIQFkTMC3M503gtFsT9UFat3tDHG96ousAH15k/cugn/21j/
         NzctUjrkzdeAsdbLan5zIEKhOop7Z4f1n4g1zgZAAWxvDyo5knM+5xTGm1Ks0V84T6vy
         qtWQr+D65kM0EldM9gxF4t2eHXr8/8Q3r6Dg0nFnEVYaYGbgjBDle82cGLVIibCHEw37
         2xYw==
X-Forwarded-Encrypted: i=1; AJvYcCXraBYfHesuOeYCLyPhQ8hFj0paC065dRKrPeNG85hgkY94E5q7SlVlydqx9BiZnxsGd0qLyOmHTC4xlPkhMJTY9h3BSQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yx+Kmsz5tetnNdbSwHiu/uPiRQPw2Ur1O+/QzX1m0F0eDUFu0R8
	Vfd9RYkHzgqeZ8xY6wXU3wrWkl0DRLpXd7l9pchgFMrNdL9F/Ml2Cn+6+jFrUyC0apMuObbq1jY
	EdUoDbvAbjO8D8gnvl+lrqhw3fUMy9Vw=
X-Gm-Gg: ASbGncvH+hUjmy1LjWc/LPcOneij6L8vBjbwia8yc3CVITQqazjP7h1pTgj+1h7XOjq
	mrHZvF5vH7TOPLAh9cLEBLFCqar2yu343yX6fHm+/J8jUb+MRPP3LEmKArxvEuMkpFE28Q2PtId
	SpQpR4eqrr5klrZO49xTUAracjeVJgUiiEoSki9gg8VLv31i4oT9RwySU=
X-Google-Smtp-Source: AGHT+IGRq/2oJykwL3uDZFjxo47YcFlscjUtTrkIHuzT9+MEUEqLjfzDBT5TFgpVTabshxLl2ugT3p3ZMVzmpxTRxqw=
X-Received: by 2002:a05:6808:124d:b0:403:3e86:ab4c with SMTP id
 5614622812f47-40b33e91df5mr11427821b6e.39.1751373643950; Tue, 01 Jul 2025
 05:40:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250626165927.66498-1-marcelomoreira1905@gmail.com>
 <CAH5fLgiTTXVMs3tzrHAU1rwQDCs_VPuPgEVcEkjbu+rNT=35vA@mail.gmail.com> <aGPJFw_Ouj8MNbuq@pollux>
In-Reply-To: <aGPJFw_Ouj8MNbuq@pollux>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Tue, 1 Jul 2025 09:40:32 -0300
X-Gm-Features: Ac12FXyjLSiJFJb_uICiNNWJ9sSdOG5Cz6Tn30Lk3KFTMK8_ATlyuHEukx0FnUQ
Message-ID: <CAPZ3m_hRQGQKYhS+Vw5EQiYOfy4iDKH-0xaqWrEcMTyj2c_WAA@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] rust: revocable: documentation and refactorings
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lossin@kernel.org, ojeda@kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em ter., 1 de jul. de 2025 =C3=A0s 08:40, Danilo Krummrich
<dakr@kernel.org> escreveu:
>
> On Tue, Jul 01, 2025 at 01:27:17PM +0200, Alice Ryhl wrote:
> > On Thu, Jun 26, 2025 at 6:59=E2=80=AFPM Marcelo Moreira
> > <marcelomoreira1905@gmail.com> wrote:
> > >
> > > This patch series brings documentation and refactorings to the `Revoc=
able` type.
> > >
> > > Changes include:
> > > - Clarifying the write invariant and updating associated safety comme=
nts for `Revocable<T>`.
> > > - Splitting the internal `revoke_internal` function into two distinct=
, explicit functions: `revoke()` (safe, synchronizing with RCU) and `revoke=
_nosync()` (unsafe, without RCU synchronization), now returning `bool` to i=
ndicate revocation status.
> > >
> > > Marcelo Moreira (2):
> > >   rust: revocable: Refactor revocation mechanism to remove generic
> > >     revoke_internal
> > >   rust: revocable: Clarify write invariant and update safety comments
> >
> > Danilo, did you have Revocable / Devres changes that conflict with this=
?
>
> Yes, but I sent them to Linus for -rc3 already. Given that rust-next is b=
ased on
> -rc3, we should be good. There shouldn't be any further conflicts.

Hi guys!

I resolved the conflicts. I hope it is the way you expected.

--=20
Cheers,
Marcelo Moreira
