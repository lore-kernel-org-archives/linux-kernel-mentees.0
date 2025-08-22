Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17D52765CC
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 22 Aug 2025 03:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755832282; cv=none; b=iN4wNS9awy5CAbAgy9DgHJZrOmZQphWaaDAuQlRGrsoT/1mL9cdg6/8jpMd7nptPlvreUCTsT/QmuFW4zk0R3ZUkjAz0vLhuD35N5gOmgHMe1Zoo9m1OAsAMruvrVi7Z9XtMoc9FsTdBCqfO01Fd69oJOwWTXvO96+1US1dIAxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755832282; c=relaxed/simple;
	bh=Qg0tKoyStlqwSRv0HhTWh/TwyYqr/JJMQJP72gTLj9s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CUq7De1Fm9v1CaoS1pqQJzfVfE5Ep4jLT1oEqRlNjj0yT+BsITEmJEqhp46khpxN4fFxryVS0DlxfH4L7lDdPCMjtzX8KTTOXk+2k5GIeGbhWrP/mPlyWh2C2TEHAK2A2CBxPxQ06oQYTKeEOM7z57SXH2mgBQQM3zTXzwNDGYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J1sByy/c; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J1sByy/c"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-71fd55c0320so5877807b3.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 21 Aug 2025 20:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755832279; x=1756437079; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G5vYyHrmF/bUEegllwDeFAZ8/aIhsfymLG3ivU9KTho=;
        b=J1sByy/cUjN4nzQLmfZah6aFHyBOcrVkdbHL+H5A2mX2UGcrC2rGoVmQjYTNf1tcM2
         HKQhD26tF/Ed2OE1pDyVtL+wn+WseBRpmATnU7otVbW+blgXZdpfbPYRBUUTsaUOSleC
         UmcNIeUwTTxijXJYfhXUvZHxisMoQHiDpfMld6QI0jQSlCT0ftDPfGDbcUDXtl3WgZ1o
         Zjj3xFSuSYuTp+h1+IrN+ycSWXaIwgphLm5yrPdCygr9JAF6/Ol1jtpcC7JmewlPEjAQ
         9sGQfD/JvmWRkOlxtOVuFwZ7F01vCvFAP9HsaiRxPqUd1/uU3FfdES4ZK4W2CKz8538O
         3IFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755832279; x=1756437079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G5vYyHrmF/bUEegllwDeFAZ8/aIhsfymLG3ivU9KTho=;
        b=fbmeX5fcJggs1MlFe9LRFHbMtHMxcSYPxv62ze5wXVdzjk25zslu93hyIXTVJu2rcE
         SUErXOmabjFEVTJolb11GKE16PNd/tDVVAwDKVefm5Dh59pLXk/uDXIx/pccOhM2NQ0u
         0z3WroYIixs1eItCnNOzReFP/98K/NybBcmMrp0P17On5LXJ6HnsC9PCzl2p32bFQKZH
         pegciIh6Fm+5Ope7orQ1sEexukR7PU74H5ijnwZV1gIrCmJexqd+d6RAIDUcIpne0/gy
         HHeYGxUhY+01nY35la80Tn6PC/qrmBZcPKVzWaJTwpfBYZ7G6OkuUs9U0Nq05Hm7ex0b
         J1Xw==
X-Forwarded-Encrypted: i=1; AJvYcCWgiHyCiU02a3D2WdT+3ZqYuDaW/gXtojJ3J3FaOOK/+fu+8ToxrjuclKDaA62assW3emrpjMEbo+3WXSPWXqH50XKwTA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxzgLIRVYkDoQhRO7i32fG8VAwfUhfvUaelQccEnYyhWbUHtUqo
	luzBe8x66Dlsi4O1pltQAx2KgrdXKUXkuqo+Jv1YS2bxktyFbHm/MDKVH7/Hr/6pu9VWvqNSKzM
	RcSopXhdrW02JgnRcLnw2oYqop6ZxoEY=
X-Gm-Gg: ASbGncu6T3rLwirnJjmEvqDBSb2OA3WvKg21CCwzb5rOLG7A2xyo+Pv8Y9fN7vL93l1
	p/ib8UzTJB6I1tOXN2AL6fnywH5hfOBpyUeN2amuPyM/PbvFRf16dU4/mnTg5PReuPr1IqsVxza
	HyoiuhRPijbjWSpxmv/x015KPQCC4n86/WSj92qs9Sxk1PQZjgnJX+IB6mNPXL3jSAt2DiYpgDa
	2rcsbZ/BV8l56BxLyhZJcPlrJ9FHJ/7WWbDKAI=
X-Google-Smtp-Source: AGHT+IEt8PH9/sXqPDbYtckv5kTTfLPn5oKJHWIGi/sdlPO8MD6VYwtNnxskjLMg1Cft09p+xydf65liGokfDREYBRE=
X-Received: by 2002:a05:690c:8e07:b0:71e:57bd:f2a with SMTP id
 00721157ae682-71fc9f6b0f7mr44681547b3.21.1755832278410; Thu, 21 Aug 2025
 20:11:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250818093159.612208-1-chandramohan.explore@gmail.com> <aKdWnKdSDs2j73F-@valkosipuli.retiisi.eu>
In-Reply-To: <aKdWnKdSDs2j73F-@valkosipuli.retiisi.eu>
From: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
Date: Fri, 22 Aug 2025 08:41:07 +0530
X-Gm-Features: Ac12FXyI8CJxEnrdzUP15elpoDm4F6JwNduF5hnyReTTklvEz5zEGZlo0cj4N6o
Message-ID: <CADBJw5bgK9Hcs3SwB0fU0yjiAqD1OZvc5RQT+yVHRAX7EjCG=g@mail.gmail.com>
Subject: Re: [PATCH] media: v4l: Fix dereference before NULL check
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: alain.volmat@foss.st.com, mchehab@kernel.org, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, shuah@kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari Ailus,

Thanks a lot for your review and suggestions. Sure, I will choose an
appropriate subject.

Thanks,
Chandra Mohan Sundar

On Thu, Aug 21, 2025 at 10:57=E2=80=AFPM Sakari Ailus <sakari.ailus@iki.fi>=
 wrote:
>
> Hi Chandra,
>
> Please choose an appropriate subject on the next time, this is missing wh=
at
> the patch is for -- see git log if in doubt.
>
> On Mon, Aug 18, 2025 at 03:01:57PM +0530, Chandra Mohan Sundar wrote:
> > In 'stm32_csi_start', 'csidev->s_subdev' is dereferenced directly while
> > assigning a value to the 'src_pad'. However the same value is being
> > checked against NULL at a later point of time indicating that there
> > are chances that the value can be NULL.
> >
> > Move the dereference after the NULL check.
> >
> > Fixes: e7bad98c205d1 ("media: v4l: Convert the users of v4l2_get_link_f=
req to call it on a pad")
>
> Fixes: requires Cc: stable. I've fixed these this time. See
> Documentation/process/submitting-patches.rst .
>
> > Signed-off-by: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
> > ---
> >  drivers/media/platform/st/stm32/stm32-csi.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/platform/st/stm32/stm32-csi.c b/drivers/medi=
a/platform/st/stm32/stm32-csi.c
> > index b69048144cc1..fd2b6dfbd44c 100644
> > --- a/drivers/media/platform/st/stm32/stm32-csi.c
> > +++ b/drivers/media/platform/st/stm32/stm32-csi.c
> > @@ -443,8 +443,7 @@ static void stm32_csi_phy_reg_write(struct stm32_cs=
i_dev *csidev,
> >  static int stm32_csi_start(struct stm32_csi_dev *csidev,
> >                          struct v4l2_subdev_state *state)
> >  {
> > -     struct media_pad *src_pad =3D
> > -             &csidev->s_subdev->entity.pads[csidev->s_subdev_pad_nb];
> > +     struct media_pad *src_pad;
> >       const struct stm32_csi_mbps_phy_reg *phy_regs =3D NULL;
> >       struct v4l2_mbus_framefmt *sink_fmt;
> >       const struct stm32_csi_fmts *fmt;
> > @@ -466,6 +465,7 @@ static int stm32_csi_start(struct stm32_csi_dev *cs=
idev,
> >       if (!csidev->s_subdev)
> >               return -EIO;
> >
> > +     src_pad =3D &csidev->s_subdev->entity.pads[csidev->s_subdev_pad_n=
b];
> >       link_freq =3D v4l2_get_link_freq(src_pad,
> >                                      fmt->bpp, 2 * csidev->num_lanes);
> >       if (link_freq < 0)
>
> --
> Regards,
>
> Sakari Ailus
