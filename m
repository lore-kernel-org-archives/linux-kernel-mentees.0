Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE1A2D3A6A
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 12 Oct 2025 17:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760290930; cv=none; b=ijKoaNo2+/vwMPb4W/okerfCaBw1hxEmWggaTy1j2oanv4daqBX6XoLL4rJEqcNQ1HoTZLH2WKRCXIz5m5gE569DQjHK+jgrP75sDCGsc/QMh/7gza6664wUJTaTu8MhP7aNPMe0qw0B8/9BKT/GYkD1XL3plKcKPxy11Bdlo/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760290930; c=relaxed/simple;
	bh=eP9vUD+vnLqburWlbhDBLpx8OtHE5Yk44Bqb+/o3gVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t24CmbNzV5GlSOSD+PYnj7KwrWFRiAEQwEEiisFCfBol1E/cB8VA7vV/K/DLeXParNbx2f6YXNjVcsEwg5bsIj6ZHJHvM1mcbS6DiZOijNK6J1B7h4RHfghw0A6G8+jDCIcjUv8ypQG8lmYy6CEKAkfB0cQJYqIwELGuNMiJ5l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O2P2AkE5; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O2P2AkE5"
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so590078166b.3
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 12 Oct 2025 10:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760290927; x=1760895727; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9Vp913h5vL+QAaTd5YmM73F2Cs5m5TxizRwXZaWP60=;
        b=O2P2AkE5KRXi7OH018FGIyzK3MDht2ccnzYYXu1JYpy4xjb6RkwLWMrgskFS2Yb/Gr
         ZVK+Jw/egviQQCPNwrEP6u9ayq/1YN3yu+qTdVuSwVXCETQmaIN9U5IWVCN3oJUNGo7s
         mDikh02199j/5d8lgyRcFp2Mv9YyTIXPoaJycQ4Fa+kaXvBFw9THTRgqGl/DRTfnXANX
         eD50R42goOrt06XDv75394fAjTvikKNsmMHwN57mhoRjRGVY0PW0vIV6AU5SqpL8toTt
         3jOeD0fGmhQKkR+rRf0cS4sn5l45ZFTVDvx3PFWrBoaOfRQS1ZH0juWdVh7V7iC4bSB1
         FjQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760290927; x=1760895727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9Vp913h5vL+QAaTd5YmM73F2Cs5m5TxizRwXZaWP60=;
        b=csyl5YFCIxFICcfIQVCqhINDEgqK5cqlQjwZ+SP8dGV3ZpsY1Va2GC6Ib4A9u8Re8a
         WzVsVE+zlSocz4dDGP6Sr/hV1u6mqar2dADR3xM2SFjGibWKDJCdZ4Ytoesak2AMPYL/
         wSO2/RkmIq+/E1VlAFcmHEMVI7Y6CBu5NP8pfAJeRh59JNPkuE06LRji8HE+JA6XpJMw
         fGzE4PQXQpmBjbKx0ZKY332zelBYM/cVjsGVH89mWSxQ/DEycPgMDVpRtyJS43BH+7/u
         JYMsh0XUL3LdBk2gvRBUK7bHvIh3Pv1kTrWxV+MxkZghsz8hN+nmW+2Ul/+Z8MnRCyfU
         JC/A==
X-Forwarded-Encrypted: i=1; AJvYcCXwpwWLj0Fc/GtsfPGncEKeuwTt2kZiusSU25+eWYUsbN+swnWSW1zZAJ1C8oH4Lee09ApNU2dLtQR0wiijfESAjtyoDA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwP/Q7a5kz7F9G+kINWmGAenZzMlpPfZih8AzrMKvO7YtIL2l4Y
	UfBShxoLHJMy5WviFuhCRDTdlbG83sVWJM4IZOHlH2WuCxbJilB0i138qeJ1dYVs+htpoyOlfIC
	qeQ2pVDOC60qairUxtHmm8thsgwWIqzA=
X-Gm-Gg: ASbGncuWJI/iWbDCur/gWWkolbw9l1+g/xYakOfcBH6mZQt74jY8s/TjWAZ/crcSVIR
	XphgRY9EQvZBA4ROW0uDfUo4vJzMGSK6WysvvUOyyeStdekeVMBkBY3+xaZeQmNsEGc7aXFJjMP
	xQgwa+7sAIsDs88A8cV6GHy0JgD4Vjbu2ybmJXT/IO1mieAoM5jUjq5v9wb1JjYEz3kaYSavFJ6
	eDG/Bhw1pVbzHJ3hsDnN9YrQg==
X-Google-Smtp-Source: AGHT+IHK/YEDMsxfyxXe6QHnu1EkcbH1GIUSupmeK3Uje3bcpIQzzt6PFoeNHm7/h6JTMXG/uNGnvGRHvfar18LgOMI=
X-Received: by 2002:a17:906:dc90:b0:aff:fe6:78f0 with SMTP id
 a640c23a62f3a-b50ac8e5533mr2061063566b.54.1760290927009; Sun, 12 Oct 2025
 10:42:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251008031737.7321-1-raskar.shree97@gmail.com>
 <20251008031737.7321-2-raskar.shree97@gmail.com> <fce1c905-1c64-47b5-91b1-0017809ec12c@baylibre.com>
In-Reply-To: <fce1c905-1c64-47b5-91b1-0017809ec12c@baylibre.com>
From: Shrikant <raskar.shree97@gmail.com>
Date: Sun, 12 Oct 2025 23:11:55 +0530
X-Gm-Features: AS18NWAjXit-R0YqUEVlsFKx0AtG-hL4GXHhWfTkLW4-ZmK0phkm6xICo2h97SE
Message-ID: <CAHc1_P7W0sU_5dU8Ei9MgGOFA+N7Q=fotk91vdcGUuUGLWLuqg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: max30100: Add pulse-width property
To: David Lechner <dlechner@baylibre.com>
Cc: jic23@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nuno.sa@analog.com, andy@kernel.org, matt@ranostay.sg, 
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 10, 2025 at 11:19=E2=80=AFPM David Lechner <dlechner@baylibre.c=
om> wrote:
>
> On 10/7/25 10:17 PM, Shrikant Raskar wrote:
> > The appropriate LED pulse width for the MAX30100 depends on
> > board-specific optical and mechanical design (lens, enclosure,
> > LED-to-sensor distance) and the trade-off between measurement
> > resolution and power consumption. Encoding it in Device Tree
> > documents these platform choices and ensures consistent behavior.
> >
> > Tested on: Raspberry Pi 3B + MAX30100 breakout board.
> >
> > Signed-off-by: Shrikant Raskar <raskar.shree97@gmail.com>
> >
> > Changes since v1:
> > Add unit suffix.
> > Drop redundant description.
> >
> > Link to v1:
> > https://lore.kernel.org/all/20251004015623.7019-2-raskar.shree97@gmail.=
com/
> > ---
> >  .../devicetree/bindings/iio/health/maxim,max30100.yaml      | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/iio/health/maxim,max3010=
0.yaml b/Documentation/devicetree/bindings/iio/health/maxim,max30100.yaml
> > index 967778fb0ce8..5c651a0151cc 100644
> > --- a/Documentation/devicetree/bindings/iio/health/maxim,max30100.yaml
> > +++ b/Documentation/devicetree/bindings/iio/health/maxim,max30100.yaml
> > @@ -27,6 +27,11 @@ properties:
> >        LED current whilst the engine is running. First indexed value is
> >        the configuration for the RED LED, and second value is for the I=
R LED.
> >
> > +  maxim,pulse-width-us:
> > +    maxItems: 1
> > +    description: Pulse width in microseconds
>
> Would be nice to add to the description which pulse width this is referri=
ng to.
Thanks for your review comment, I have updated the description and
shared v3 patch for your review.
> > +    enum: [200, 400, 800, 1600]
>
> Properties with standard unit suffixes are u32 arrays, so I think this
> would fix the error and also make maxItems not necessary.
>
>        items:
>          - enum: [200, 400, 800, 1600]
>
Thanks for sharing the fix. I have tried it but 'dt_binding_check'
complains as below: 'items' is not one of ['description', 'deprecated',
'const', 'enum','minimum', 'maximum', 'multipleOf', 'default', '$ref', 'one=
Of'].
Schema expects it to be defined as a single u32, not an array. I have
updated the patch accordingly.
> And we want to know what the default is if this property is omitted.
>
>         default: 1600
>
Thanks for your feedback, I have added the default value and shared v3
patch for your review.

Thanks and Regards,
Shrikant
> > +
> >  additionalProperties: false
> >
> >  required:
> > @@ -44,6 +49,7 @@ examples:
> >              compatible =3D "maxim,max30100";
> >              reg =3D <0x57>;
> >              maxim,led-current-microamp =3D <24000 50000>;
> > +            maxim,pulse-width-us =3D <1600>;
> >              interrupt-parent =3D <&gpio1>;
> >              interrupts =3D <16 2>;
> >          };
>
