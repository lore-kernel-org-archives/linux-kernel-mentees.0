Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4565C2DEA7E
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 18 Jul 2025 15:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752853173; cv=none; b=JMu6otCPoWPyammjsFCeMZICEgh5IHEdtuOWIFjKZtbDJ/UcnUXOhMeMi211sPx2yBWkvN5Xus28UnlDbdUPKyBMarWwkjpED6Qgheur1yxSsXBb5//GT6Kxor5fgG+iuDo1UO4QQRikTLwgqTGqwjhhaz0Xz/vj/WhIYcr80+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752853173; c=relaxed/simple;
	bh=9VSV9uLZb50DfyKoCnVz+avlkKOMbZZ5AZGoFFpkR+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qpHcuUfo+VaivmFNN8zlKTbiUAvq6MtPjeTQ7Q4PqoKUzsjzmg7Mj+bdqkMJB3M+0J74fDjwzthvWiJrtj7yDBqLGfcrzxQSrkRo8sIH3KhmnzX848lj7dzmsZI5knV0Ml4Ck6iXMODG2zPs+PyeO/e8wPr9j97ApgfOrwxpqRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mips2Vxq; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mips2Vxq"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6070293103cso3435064a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 18 Jul 2025 08:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752853169; x=1753457969; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9VSV9uLZb50DfyKoCnVz+avlkKOMbZZ5AZGoFFpkR+o=;
        b=Mips2VxqJG8SpgTNZwcc67VEhITGa+XDcmlf80KN21k0gKs/xfHObZXpbjF1WKW3J9
         9+9m5Uy/TZ8eAlCkjKBHsKaYOasfxAlEjnxxH0P7M5YksYjXq8kfWEp4mZaDY8DnSSJg
         rUr5fdDMohSmWdyw5gRxqQlsDiT6Im7b3vfR0qjO1MzAI5xzJY8iaV2mm3egNt7Nnq8v
         o2hySYg8zLp7p7vmlOe71AdsLxsLnGIY3yJ6s43E22O+sb8dVWKorbbe6DqReGbXDCOV
         bciKBsUBu5jSgV38WujPNjxpkBaKsQT0IcehaFOyB4Q4zwszENJmOckWaXVs5Mk0Qb3w
         xQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752853169; x=1753457969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9VSV9uLZb50DfyKoCnVz+avlkKOMbZZ5AZGoFFpkR+o=;
        b=WdX7zMyD7FyqXtgsRa1JgeTcTlCJovRlaq1RFi/rljrtMfb/bssOD0WMFulXberxOk
         jPNUuvtqDTGoC/nLl1xjM1p527ve1Atb81kW/upL/VvMVyPSFmg1FGPiMILiKUGtuHxQ
         CaiGGnjsxWGH5AURENdl3Sf/g3KKHRN/wjAfJ28hFNnlR/sqRy1a8JZFuplOWShJo15B
         rcl1J+mafsKLm83+8eS+9h77LPlUf012fPDleOd8hpKw/AcfgwO2TmQzFlCqz/iIAwxx
         bMV/C+l89EBggXs1d0zqxGbCzBsJD7Q7lbSmJu1xM6xzLtsWF4dCL5pGcc4h6aOw/blU
         r1eA==
X-Forwarded-Encrypted: i=1; AJvYcCUKJFLvWcYAp5pa/gQT/Tq4fgnVXzqw8vNymL3N5XIXjI/sl6ojR2k2CyrDJFaMIFECKFNglXW07nIq/SJ1BKTylJeFKg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwWMvPhopVvryB7AxekBvfYtPj9/GOMQJiGBt2uIvOla6FBj/Vn
	R3HXIEf+dkaJiXfdQW+0KX5tmvHj74Vn3nfKRvd386HgNXs+9PVCMfAoEe1mZs8J3iN1+02UYS5
	L24NIQnpjNy5R0VOJqX/ddQG1D2aenJo=
X-Gm-Gg: ASbGncsV3F1NpUOmvF24VWsy/+OY8O4DvFSh/FVpLfNce2L0RaAcAxwWJxO3K1J8Hon
	7dnFjGgeM+4gEJvploR1asLgCE5JjqOrqlj7qBZ7Nt+2lPftP2BNCkf8zFoR2rdSrYEkI07TSkI
	qykA5XwNwXMmmrZdi7eSXx3ZCV5BZTgehinAVKQ1ZQn3Z0JhYFSRgUfSCHVK357PeAyUb8fA2IP
	3pv/g==
X-Google-Smtp-Source: AGHT+IEpeVxME6aVq15riUIEW3IcE9rZry6wSWfhQX8HqiZb7qciuqAosUdiKMt2TXpE4cJ1jOG0BXke05WcjyCrYC8=
X-Received: by 2002:a17:907:989:b0:ae0:b7ef:1c11 with SMTP id
 a640c23a62f3a-ae9cdd86a54mr1116865766b.5.1752853169232; Fri, 18 Jul 2025
 08:39:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250717115936.7025-1-suchitkarunakaran@gmail.com>
 <CAEf4BzZ+OTkaXmtWPbOGB0OWz5xmj-d06UWchooO+iUyDHar4g@mail.gmail.com> <CAO9wTFgLOymS+VDcUTCHZ7niu_gEgN-N-F1uX-Kpm+uqvaMrQg@mail.gmail.com>
In-Reply-To: <CAO9wTFgLOymS+VDcUTCHZ7niu_gEgN-N-F1uX-Kpm+uqvaMrQg@mail.gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 18 Jul 2025 08:39:01 -0700
X-Gm-Features: Ac12FXxnbJSkiNaYLXamvASk4rtFXxTiGngAImtikLHkoEBtFQMXFsQXoFL0bO0
Message-ID: <CAEf4Bzayn6UNjjbtgA8i2n4-_kuyERnOZAZMfc4cXTDKrSFr+w@mail.gmail.com>
Subject: Re: [PATCH] libbpf: Replace strcpy() with memcpy() in bpf_object__new()
To: Suchit K <suchitkarunakaran@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org, 
	yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org, 
	sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, bpf@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2025 at 10:33=E2=80=AFAM Suchit K <suchitkarunakaran@gmail.=
com> wrote:
>
> > This is user-space libbpf code, where the API contract mandates that
> > the path argument is a well-formed zero-terminated C string. Plus, if
> > you look at the few lines above, we allocate just enough space to fit
> > the entire contents of the string without truncation.
> >
> > In other words, there is nothing to fix or improve here.
> >
>
> Even though it=E2=80=99s safe in this context, would it still be a good i=
dea
> to replace strcpy() with something like memcpy() since it's

no, there is no need. And keep in mind that this is libbpf library
source code, which is developed as part of kernel repo, but isn't
running inside the kernel itself

> deprecated? I=E2=80=99m still a beginner in kernel development and trying=
 to
> find my way around, so I=E2=80=99d appreciate any guidance.
