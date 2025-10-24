Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E3730594A
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 24 Oct 2025 08:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761295141; cv=none; b=eRBG19Oe03azT3DtrijJ9w+qYasyRwzQMRbGIIie5MCx5zshuYCw/+JB9RNgArbLK+1ZbnWBeflsOTVFFfP8sDA/6MdTD+ynJ4zeE6MrUOZNIrhwlCuBxwGZEodP0J18mwXn58RcgqvKYf4I/3G0OcS/DmyCNpxHwZnUg+utNMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761295141; c=relaxed/simple;
	bh=WXCqwiJaVzwif74IHtQzyPxXFrlHw+EGeR8pfbgmG08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hv7z6RmA1FGKLDXBTsOVXey0G40GBWm9JaIw4O8EOEozucs9Ec0BQwzSMzRNJVSufdZF4aaxJkkRIzgW6z3OQk6aEr/Gl6KCuA8slBEolOzClNoXfE4DVEoCn/p1d1EXqG/cO5XnbkpmPIsPbHenadaurMkGdGjrdsXee2HB2tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SPU84Sjc; arc=none smtp.client-ip=209.85.218.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SPU84Sjc"
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-b6d4e44c54aso313800266b.2
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 24 Oct 2025 01:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761295137; x=1761899937; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NOoOk6fIvEaDShhUmAzlzdMKvgXXV9HjXrl++QyhiQI=;
        b=SPU84Sjc3QYUlPBbfNtRapMpcv3JxvGKFdkSPE0R0ApWG8gCXzsZjJc5I4sEpoAuM3
         hCUiy/W6IVuQ3XVvNsr6MUvBR+spXAAXFKsDm0IqPvEmeiT9+f0o1TM6yQI44120J+ic
         BTomtfIFRhHoc9gBBq9RFu5LzQO8OYQ5QaP6Y3ubvdrMzBHmXu650F3HCYtQpDv2HUNw
         kCE42/9UaG5YSZpbkqCFoU0v8iPDsh2UEdjDJuKjZgcO+G/DQ/vi7TInmO2Rxi+B0tgX
         fwV6gUrWKTWedE1DSe31lbzwpF2D5pLwIqDx9GR6AnhvlYVTbkE8W3iN573s+Ez5Lfi4
         DBoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761295137; x=1761899937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NOoOk6fIvEaDShhUmAzlzdMKvgXXV9HjXrl++QyhiQI=;
        b=bnLtCbLhJarMqWbnFN6Ir+aMIeDFgtquT0J7UBKSyWlS1Q/m1lNuiTWoOZJQpS2ohR
         l8o7KA1lpCQOVu12K3Nso+JWT8ndaif4vma2hgsXjrERafm2Rnk+yIkkOP17Rcr02wgZ
         WsKvoKEgLPKQjGgt8VRq8IUk34wnZEodCrqf70+J+RyuR7GkWWSLnUp6m+LzJ1IWJ9nL
         yiN2UScOceFvqmCLEwGuQ2HjOwwoOWQdEFQBv7PkP8khX1gtpOBIDA3e7Qzd3V+hzu/d
         mV12RBd4dkDMo3vih4HycXvrHXxiHkzCFolNCijy7wD/kRuI2muFvhVjGtFeZbByJfnl
         9H7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWDAOwzfpuaBsSRoaB1m5nMsH2jCo56bjgXElUMh2a8xtkzIXF3O+0y4bFuCaV+QIJmNk9L+MsbZfcBKEdQBZl0F+NqRw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzEu8Q6l+6QQl6El71NhJKdamttusXCmkEL41sTAPV8tQ9/271Y
	ygi68Kl0sXJJdsLmV0J4c4Jrjv1YzOSt8Zp2YyXm3dgYCytB4mHr1rbv9mjesb86aRZ2vF5P9ha
	2AVxMvoPNjcYfBiAft+7XBdXR0W61Y3o=
X-Gm-Gg: ASbGnctz4Ro0gFUibPDrGXNa+IzJdxl2X36X4Xr+ywGmvGAqq0XFH7pbt0ZzluElDV7
	ibkmcfPX6xiQeKEPTUY2WM9YW4DNVfS9/FzQQW4PYwXsGJTRaWRLLxrMCQ5Yw29X/Yj1ipMJB0a
	Q/6dZylufQu62+IMfHpgCvGafyE3x55xfDTHrqnuH99gLDIO1dIYqQj6M9RzDG7z2hPjrnJXjEM
	b9VNeNSheSo7jyH0CXnDIUlBogr1NVUWxuzXnS9MrZea3W/9vgFIzBOen12YWCssWeI9ZIU
X-Google-Smtp-Source: AGHT+IFix1z6tMmwfjPEG1oQQ06cd/niYVFK7A3ERyfKb9o0nkBTriHS7CNo7xGrw+fDhLGT1YJYfTTjX20y7ecwqRg=
X-Received: by 2002:a17:907:948f:b0:b57:2b82:732b with SMTP id
 a640c23a62f3a-b6475706215mr3433422466b.54.1761295136987; Fri, 24 Oct 2025
 01:38:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251012173035.12536-1-raskar.shree97@gmail.com> <20251018160400.6921df6c@jic23-huawei>
In-Reply-To: <20251018160400.6921df6c@jic23-huawei>
From: Shrikant <raskar.shree97@gmail.com>
Date: Fri, 24 Oct 2025 14:08:44 +0530
X-Gm-Features: AS18NWBKc75onvPQ2KcRtEzbrT_rOdOOZhjS01vyTKH3-6a5Fttp43NYSt_gDrg
Message-ID: <CAHc1_P6a=6MGT4_6mmMLzBXz8WxVv1C29iwDwXrDywV+Z2k-0g@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] iio: health: max30100: Add DT LED pulse-width support
To: Jonathan Cameron <jic23@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, matt@ranostay.sg, 
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 18, 2025 at 8:34=E2=80=AFPM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> On Sun, 12 Oct 2025 23:00:33 +0530
> Shrikant Raskar <raskar.shree97@gmail.com> wrote:
>
> > Add Device Tree support for configuring the LED pulse-width of the MAX3=
0100
> > sensor, and updates the driver to read and apply this property.
> >
> > Testing:
> > - Verify DT property read successfully in probe().
> > - Verify default fallback to 1600 us when DT property is omitted.
> > - Confirm SPO2_CONFIG register programmed correctly using regmap_read()=
.
> > - Validate different DT pulse-width values (200, 400, 800, 1600 us)
> >   are applied correctly.
> > - Validate probe() failure for invalid LED pulse-width
> > - Tested-on: Raspberry Pi 3B + MAX30100 breakout board
> >
> > Changelog:
> > Changes from v2:
> > - Fix DT binding schema errors
> > - Add default value
> > - Remove changelog from commit message
> > - Add missing header file
> >
> > Shrikant Raskar (2):
> >   dt-bindings: iio: health: max30100: Add LED pulse-width property
> >   iio: health: max30100: Make LED pulse-width configurable via DT
> >
> >  .../bindings/iio/health/maxim,max30100.yaml   |  8 ++++
> >  drivers/iio/health/max30100.c                 | 38 +++++++++++++++++--
> >  2 files changed, 43 insertions(+), 3 deletions(-)
> >
> >
> > base-commit: 8bd9238e511d02831022ff0270865c54ccc482d6
>
> Applied to the togreg branch of iio.git and pushed out as testing for now
Thanks for the update. I really appreciate your time and support!

Regards,
Shrikant
