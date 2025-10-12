Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0201CD15
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 12 Oct 2025 16:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760287981; cv=none; b=JXD1JAJDZT0E0YdZFrLFEmodVmyIejv7Ujs6vljexYutU7d7kysjJDNiUcOMsUMeL8XJhuU/QDJm5P7zOFGUMEh2vrekOm3TKX8BSxXOUpE4z6m06sBuL+f9awoRWjCV5L/ZJfvYPwcNZ/sCaH0E+ZqTOgK4KyY4fkyfK+KXbbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760287981; c=relaxed/simple;
	bh=is6hqOlUkMzHTcnRZLMTBo5nWV2BPzV5Tey9TxfEm6U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YisALlH6T9kUo09ELctRjPPvrZK6I49IoYZPrTFXmbo6ZBI4yhSQ0j2v+iy8DCp5bjvSGH4l9DMDkK1ltfF65azA+gcCr8PPE1hHAqPwVP9nY00l1o26aFQMkYQaWcHYVSnF04onlMsB2QtDGlHaV4gWQ0QWf0fh79alqwpzxis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QvMd0lkJ; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QvMd0lkJ"
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-b457d93c155so562568366b.1
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 12 Oct 2025 09:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760287978; x=1760892778; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9JZxGJaBIG3WMNgOZk70IosVrcFGLTtGDI3zyIQtP54=;
        b=QvMd0lkJKAueYJDRrEAF4G9UzRF57rdLTO4PLoKdSx7zNTZtnWyaB6FIoGKRqBZR13
         whbXVw6D/Y8VTdpzA+ksgryM2Zp/fjFL6p1cnolwde9kM518/6/WbB2e6H6u+8buEcqG
         e1Z/af+FSq6NiPtwS02jH3NppTp9vV5a/imGkbfmhrd3kKROy9LniNclE2ErhDhMKwHf
         LCp84cKaDlwkpZM/0H7bpx3fazaisoFr0V5TUNyH0CZq0fjdqLxSIBI6OG2Xykz35S4q
         VB+PuT6hKFJ/kxo7WH7Mpbk4o60n7Zyf+zsoLdrWWoUYEp1xqutadUjngoCeSxTkViv8
         fO3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760287978; x=1760892778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9JZxGJaBIG3WMNgOZk70IosVrcFGLTtGDI3zyIQtP54=;
        b=Epc2Dq79sqM1ZKHd0Mg/6LYVXHFvu+0Z7uw5Sqyp5oHnkcye4Dk3Jl/3Lit/Hj9Cjt
         oFiDY3KX5zoalOmH7UT4yd3ih3gtFLIXkIjhoLdVNiezF0J2fuDSDQ0bGgnj1cY3goyT
         ttZUpBXPXY+9klmv78WKihyantByxOFfUDj2DpKGGKfUYpX6Tyo2M/3B7wpDjy1d/FpL
         qUHcQ1fAGIGXIwQPLF2yqJAK06oHraQ7rv7bTHkkpXMAdGqjdGQuyoKkxIpxkJ3TZ8Vs
         LLPGtuLZKunUtJ5RIX2Vc3wPGr4Pq51n54KZm8Q4/gs+ckYoWEEmOJa0D0xeMjcajF+y
         bB1A==
X-Forwarded-Encrypted: i=1; AJvYcCVzbV48Q9Oi9jBdNofuK2q7ez/E6Rq0XyJMsgJdy4ZrhYoSZZzl/sxI3wDSd6vbsv6BwCzQyh/GYg40cSKlXrK/36VvbQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzPMsRg/dwtjIv0uhx97wPSpnVHVlR2u65S8Z3Inl6W5dcp2WWL
	Gp+KDWuTwY457I/L5Pc6WkPhx6+7VdRXAwLvNGzr7w8gDBB+V1lFczwpXJhdnhVRjqiRuNMSEn+
	fH98BHSQf4X0k8sNvcb+ftiYT88XIHgg=
X-Gm-Gg: ASbGnctDQFYBHLPKdPrWzHhqT1l0VrY2gc6VZ+Q0/IGWl3qd4M6evLFoPrsy1VJUdIJ
	X30Z/cmJLpC4luhtptO00J139j53nSfvk/4ZhIMjbYu++IZn07o7hMJVnovpv0kydDUDV4f0Ho7
	iRIWm/DKoJaQulTEvoFiruFuWlaUSTtqiCUFbJ52cUc1WeTIAktMh+8648r+/JohOmxpr0QTpgq
	AXLHNbAxCC0tN2P/OcgJgJSiQ7t2M2w8wlSufz4SqVAwXI=
X-Google-Smtp-Source: AGHT+IHYC6gZQ7sVGps73WqhA1pssx5WiOdWA9NawCEncOKl23yyV6N76hIZIr600VGaUVKRCSjt6piNcz8DHQRfwsg=
X-Received: by 2002:a17:907:7f8a:b0:b46:897b:d759 with SMTP id
 a640c23a62f3a-b50abaa3309mr2018683466b.40.1760287977711; Sun, 12 Oct 2025
 09:52:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251004015623.7019-1-raskar.shree97@gmail.com>
 <20251004015623.7019-2-raskar.shree97@gmail.com> <20251004141231.632c311d@jic23-huawei>
 <CAHc1_P7MU=BYf_8sbZqikpXpfuvAtLNJ2E_hmi-50ohoh+gQcg@mail.gmail.com> <20251012151130.797450e3@jic23-huawei>
In-Reply-To: <20251012151130.797450e3@jic23-huawei>
From: Shrikant <raskar.shree97@gmail.com>
Date: Sun, 12 Oct 2025 22:22:46 +0530
X-Gm-Features: AS18NWB6k3kWKKLVTx0bu_UemQDkCkAOaqI3qRe-tlwz4EjAekbo6ZOk5wZIcpw
Message-ID: <CAHc1_P7heCXwgH1tnqKTPAg0RpTPEM9Q4NUsGoOJMk6gqyXnmA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: iio: max30100: Add pulse-width property
To: Jonathan Cameron <jic23@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, matt@ranostay.sg, 
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 12, 2025 at 7:41=E2=80=AFPM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> On Mon, 6 Oct 2025 08:34:03 +0530
> Shrikant <raskar.shree97@gmail.com> wrote:
>
> > On Sat, Oct 4, 2025 at 6:42=E2=80=AFPM Jonathan Cameron <jic23@kernel.o=
rg> wrote:
> > >
> > > On Sat,  4 Oct 2025 07:26:22 +0530
> > > Shrikant Raskar <raskar.shree97@gmail.com> wrote:
> > >
> > > > The MAX30100 sensor supports multiple LED pulse widths (200us, 400u=
s,
> > > > 800us, 1600us). These settings affect measurement resolution and po=
wer
> > > > consumption. Until now, the driver always defaulted to 1600us.
> > > >
> > > > Introduce a new device tree property `maxim,pulse-width` that allow=
s
> > > > users to select the desired pulse width in microseconds from device
> > > > tree.
> > > >
> > > > Valid values are: 200, 400, 800, 1600.
> > > >
> > > > This prepares for driver changes that read this property and config=
ure
> > > > the SPO2 register accordingly.
> > > >
> > > > Signed-off-by: Shrikant Raskar <raskar.shree97@gmail.com>
> > > Hi Shrikant,
> > >
> > > Explain why this is in some way related to characteristics of how the
> > > system containing this chip is built (wiring, lenses etc).  Otherwise
> > > this might instead be something that should be controlled from usersp=
ace
> > > not firmware.
> > >
> > > Also, give a little more on why we care about controlling it at all.
> > > Is there a usecase where power use of this chip matters?  Mostly I'd =
expect
> > > it to be in measurement equipment with relatively short measuring per=
iods.
> > >
> > > Jonathan
> > Hi Jonathan,
> >
> > Thanks for the feedback.
> >
> > The pulse width configuration is indeed dependent on the hardware integ=
ration
> > of the MAX30100. It affects how much optical energy the LEDs emit per s=
ample,
> > which in turn depends on physical factors such as:
> >
> >  - The type and thickness of the optical window or lens covering the se=
nsor
> >  - The distance between the LED and photodiode
> >  - The reflectivity of the skin/contact surface
> >
> > For example:
> >  - A smartwatch/wearable ring with a thin glass window can operate
> > with 200=E2=80=93400 =C2=B5s pulses to
> >    save power, while
> >  - A medical-grade pulse oximeter or a sensor mounted behind a thicker
> >    protective layer may require 800=E2=80=931600 =C2=B5s for reliable s=
ignal amplitude.
> >
> > I believe it would be appropriate to describe these fixed,
> > board-specific characteristics in the Device Tree,
> > since they are determined by the hardware design rather than being
> > runtime or user-controlled parameters.
> >
> > Would it be okay if I send v2 of the patch with the above explanation
> > included in the commit message?
> Hi Shrikant,
>
> I'd have this excellent detail + examples summarised in the patch descrip=
tion
> and also a small amount of description in the actual binding even if that=
 just says
> something like
>    Description:
>      Pulse width in... . Appropriate pulse width is dependant on factors
>      such as optical window absorption, distances and expected reflectivi=
ty
>      of skin / contact surface.
> That's just a quick mash up of what you have above, feel free to not use =
this
> particular text!
>
Thanks for your response. Sure, I will update the description in the
binding and will
update the commit message describing the details and examples. I will share=
 the
updated version of the patch shortly.
> The inclusion of target surface reflectivity in there makes me thing that
> for some applications we may also need userspace tweaking or some algorit=
hmic
> way to increase or decrease the value according to skin characteristics. =
However
> I guess maybe it isn't that sensitive.
Need to check on this point.

Thanks and regards,
 Shrikant
