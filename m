Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF431D63D8
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 18 Jul 2025 16:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752855540; cv=none; b=Je9fzao37r+jugC6vHyQ+X2tmzzMKWHNdzOkpzZxMwhabwaxT69Re0MGgqbA3ZMJg450E83WTBuDMYXGzytP8Fxs88kwOLmJ0kD98oSatOf3n6DWeWbABpf4lhZSvhrtSTQtKqgCQ5H/Z7FOii80rKW5IVw5l/mBJg/LHqZ7moI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752855540; c=relaxed/simple;
	bh=JsGI4d1WgsQxQwDTlELaaQan2DJyyq7rBgqt3cAK84Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Si/sHFB7RYI+G/P/WysEJdg9hwRd1ECdKhhPJzzjz0g55e43IFbkUFx/xi8hF64lWH1/HVHQyPNNfWK0+Cpk7lvVQdMOJXIOme22BkA0AVCYeiNZ5cHu/DR4+a4pZUwTIa2hOYERmuWozs9mEibuIhRJ3ziRJHyGEFWUzATvORs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mSoTV1dr; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mSoTV1dr"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-2ff94cc4068so623167fac.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 18 Jul 2025 09:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752855538; x=1753460338; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JsGI4d1WgsQxQwDTlELaaQan2DJyyq7rBgqt3cAK84Q=;
        b=mSoTV1drvoa2ZF+7DbwuvQbZZnqPWlxfJ+t0iUavxJRLwQGOPYqcqZE8SmCJGyfI4o
         s6c3H9OvqgJ4PyuJeg3C/WyUqwkcwn3vB2PVzuPU7MeexwLq53ehKs1tOCv2k0J50xcf
         cUbmtVB8m1nLmNtGapqdyfYBqQYuZlNszFcR7NvlsjU4YjAXN1X5Ys2UPafFuN/fyfVH
         fRm0CEEu1lPdiecDEiqyz3HAHVKmjLaCBWlx7EwRTm9bZJ6dyCQp0mgLdB+KzXcQ/ovB
         wfcC07LNFCPagJzwOFCfvOeih+LbYIGxYyex7cgAAlcV3sCBbA+nrGcGDUmSNASwo8Id
         lifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752855538; x=1753460338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JsGI4d1WgsQxQwDTlELaaQan2DJyyq7rBgqt3cAK84Q=;
        b=dNStirVjJqGRq3pGVqte3CNAEHwlqB6kYJseZNhE4tLOB2OhXzMTEP/zdYgqi2GeuV
         ZzBDjjWMHab4bY3bQ1D+sah4MgjDcHbV/nov8HgTpKc/QJGvXBNyFWxJXWHqs1/Op5px
         PJTu+ZywwtVJclElTOt1FjBFjHeyKGKzNBzMmb1RcU2S+6TnUgHvNkMhW4EQe29+Bawo
         IHNDUeCXsXWGIpR2Lc7F5pdPOJvir2rFz+Emh/7+cR1fURze+p+vJHez2uNOogmA/ua7
         7JaANNXj0Dssm5fuKUPHOC87qbziztYwrSYEiqgAlcQ0v9QjT7KQ+w0mxUyDRqEby8ZA
         mnhw==
X-Forwarded-Encrypted: i=1; AJvYcCV/5JE7V9Fe+k+sJrqg6PM1Oce2SnGk1qVJS5WixIJkjzewXnib2WP0JWFtW+3UPC7Xn+ZMrTC7d6SWG8IiZLc39pk1gA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzjS8ch6ufrrZ5dJjH83SzaDKdxND2++eYsJ1l3YhIL86a8Av1W
	nA+2VcHzJy8a5T3YUS7eivplxJYdlN25sJ2X/sQXyvR0XePPYo2Bc6cYUhamqih3VUQb0HcTWUY
	i42bjhlLBYefabEBbgUF23DOYFbOiv6o=
X-Gm-Gg: ASbGnctBc++H7Mk3xYl+E9o/AyZOk6UjGaAY7mbs2WXFLFhoyuS9PAVTvm/JfgCerOZ
	W0PE3KI44fiF+s7hcgGmPflmw5DNTPLtENH33O+3iE4jUHNAEZOxzhp3w1slxacqDcOpGf+17tn
	mfqbsv+nI3OJLak4WufMSG8bIS5U3i8xif/es2ERGScqPwQdKbYep1YzfL0ZGqmJUjExIEThrPF
	Kdqof2C
X-Google-Smtp-Source: AGHT+IGe4Yj5ws/qqsi0APF23sRi0Iv9xe2xK91Wy35K93f2vavegXJAkOTU2w+EaE+/G0T1B+A6VAnk+FODlxkSWOk=
X-Received: by 2002:a05:6870:a40a:b0:2c1:bc87:9bd7 with SMTP id
 586e51a60fabf-300ea49dbd9mr2765849fac.35.1752855537239; Fri, 18 Jul 2025
 09:18:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250717115936.7025-1-suchitkarunakaran@gmail.com>
 <CAEf4BzZ+OTkaXmtWPbOGB0OWz5xmj-d06UWchooO+iUyDHar4g@mail.gmail.com>
 <CAO9wTFgLOymS+VDcUTCHZ7niu_gEgN-N-F1uX-Kpm+uqvaMrQg@mail.gmail.com> <CAEf4Bzayn6UNjjbtgA8i2n4-_kuyERnOZAZMfc4cXTDKrSFr+w@mail.gmail.com>
In-Reply-To: <CAEf4Bzayn6UNjjbtgA8i2n4-_kuyERnOZAZMfc4cXTDKrSFr+w@mail.gmail.com>
From: Suchit K <suchitkarunakaran@gmail.com>
Date: Fri, 18 Jul 2025 21:48:42 +0530
X-Gm-Features: Ac12FXwjJnu7p3rh_Nm1Hf80A9R6X2OQXnzsdSC58X3ar7pRz68vSsoQRwmvdJo
Message-ID: <CAO9wTFgGgoEs08PazyWvnRyEQ4tvdCgjvtLNnzX_6Ov-RjU4Rg@mail.gmail.com>
Subject: Re: [PATCH] libbpf: Replace strcpy() with memcpy() in bpf_object__new()
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org, 
	yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org, 
	sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, bpf@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 18 Jul 2025 at 21:09, Andrii Nakryiko <andrii.nakryiko@gmail.com> w=
rote:
>
> On Thu, Jul 17, 2025 at 10:33=E2=80=AFAM Suchit K <suchitkarunakaran@gmai=
l.com> wrote:
> >
> > > This is user-space libbpf code, where the API contract mandates that
> > > the path argument is a well-formed zero-terminated C string. Plus, if
> > > you look at the few lines above, we allocate just enough space to fit
> > > the entire contents of the string without truncation.
> > >
> > > In other words, there is nothing to fix or improve here.
> > >
> >
> > Even though it=E2=80=99s safe in this context, would it still be a good=
 idea
> > to replace strcpy() with something like memcpy() since it's
>
> no, there is no need. And keep in mind that this is libbpf library
> source code, which is developed as part of kernel repo, but isn't
> running inside the kernel itself
>

Yup got it. Thank you so much for the clarification.
