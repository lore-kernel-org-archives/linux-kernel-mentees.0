Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D288E28D829
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 12 Oct 2025 17:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760290651; cv=none; b=fQOrg7U6YoBUgo4CpifoAG/DC1diQb+6lknYS14jnGi2JK46LbT86pi5Zo7AVci1eP5dZ1D1PknvpoCKTdY0nCVZTBoHTcN7u/Jj628wiy7D6UAG7EZGenRyWiwzPXqkLA+jHVSsLbPAbhHPthRVMntmplzyQFr6eoPPT2OHiw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760290651; c=relaxed/simple;
	bh=wQf6CUx6iYNtn0zMxIL285xU6GTttxgQB+eMaEn+Nqc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kzWYm62JCEDOHgl3lDTvdulRm50oDs62n72xL5rbcWfM/f9TXgbL71HQ+TPa5Kjq7ZpgHKNs7d/Mh69nvX33jVq/vLLfOIbnTrShEk2X4h9Gopg/BQ+wgijb2q6xhzlZiBmM7HJxWcl3sv0x5J6UQ1Kchqr1t+0ISvQJVdjnnl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XmPl64rs; arc=none smtp.client-ip=209.85.218.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XmPl64rs"
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-b3e9d633b78so644148466b.1
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 12 Oct 2025 10:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760290648; x=1760895448; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HjN46mR7vmbfRcA2+LhyFdkXLDPT8VQfkzRMb9fR+Rg=;
        b=XmPl64rsdkWOF9HSdRaCbb5GrMqg921lOitaMbBz3ruTxSKEDMTr6+col7Sx4ljhig
         ccdueOpO+1Dxqq9WrgRYHQ6qOyTTuMCGVj/4qSspshOlqbDHe58qy5z9BKXFRH9f/fWQ
         kggT+nEdTq73oVps8K5/3S/SG6wrTer5AUfl1/j/Ke7OtgYQm0a6SEAMw+YiBksHADhW
         gUaiWEJTY//qMzzfassHWiXeXzQxkZ/4qoH4DWgoQ8txCA/2r+buQ90a5fFmF5lxLZdY
         ATFPRLiWAAL/4p+6OdUJKZ1tQxglF5A1yJOsYgTAEUCoiVWRCU6rwzqqET16lCBkttaM
         w4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760290648; x=1760895448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HjN46mR7vmbfRcA2+LhyFdkXLDPT8VQfkzRMb9fR+Rg=;
        b=LMdqOOfWiNvLUUbD8jTcORFDIOe6IhWGRERzG2VBUAMHz8k7jYQIq6WCdoFAVyscz+
         FGLe1esVllSTG6064AruMTz/LrzL2sxJMMbqMRpKimt2/EHP8BCZssgpjtAIXzN+y8I2
         qcfVV40c2zM8yrIZUDYChwnvqqyt6wfBWm8yImhZFUcvoRIXkFQjYd6puufNJqo7Lst9
         hgYc+7EwWgR/dK/rZDofee+osMoceEAIOHyDv8RNwEdaN6/+X/hpfOPX/+lfeA1rdIR9
         miPpTkIAP4BZHwZ4BtH1UEkICZ6yIRkjphY7KLWFQX6bHO9N4M9QfqPGC80RRZ0m4E/q
         VDhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEDJziU+Rd9TQ/0HjD2QtNwF0BnHhGcDnA4Gmlx9WhxkxgIDEg4XzbhPuLN/sUFvb56COKvMSH8iSV3P0bLMy0emliGg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxqP2ow4Cx4S/578ljnVebNHCuzWMPad8MLPxdWEJl15FP3626g
	MhO2XH+lqy4WWqEppiajiQQfWekLf3mtgkpCwUoMleuyLfT8kEMu1dqHYT+VMA/3cFeRZXYJpOu
	gXDT31MkL8OfzaolBKTuoP6Vxl1OVpGbwwjEc
X-Gm-Gg: ASbGnctLYNGL1VY/VKqa4lS/Zfrayz+HtHVItYQlc6YhOK2Zx5rZWMUEnLGhnzZy0q4
	3vXCtaw1rCPuRgZe+pSUaos68rVmOjIwOieIu6VgPkxMkDp1fBzP48b56K91QoDKJtKrompWIX8
	xT2nWD2aCmHOLw0d9M0e0+xgOW7uNdI93q++psHl62l1+plHcOZOWNnonrBsgzgUHounmXgcEha
	JCv7Cxh9H+DxL8ca8DVoQ7aYU776tlqOeT+
X-Google-Smtp-Source: AGHT+IGFP/EgOGkWxqjUos/OJLXKzFze7OmeAssC7kBZ/7quZxkALgbxBsS2MKonlO9lkxUJo4zvtwxsst0X4NFCXYo=
X-Received: by 2002:a17:906:c143:b0:b40:bdc3:ca04 with SMTP id
 a640c23a62f3a-b50baba84camr2323169866b.0.1760290647947; Sun, 12 Oct 2025
 10:37:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251008031737.7321-1-raskar.shree97@gmail.com>
 <20251008031737.7321-2-raskar.shree97@gmail.com> <20251012180644.019616c9@jic23-huawei>
In-Reply-To: <20251012180644.019616c9@jic23-huawei>
From: Shrikant <raskar.shree97@gmail.com>
Date: Sun, 12 Oct 2025 23:07:16 +0530
X-Gm-Features: AS18NWBpLXveHlQdIhTnFbX7i56JOrqOKowAXbKZ3PnsuA7_QAtU4BLr2PqKRcI
Message-ID: <CAHc1_P4L2oiM09YhewH69GHcVW667b0xW5eeH9+UY0xi2aO28w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: max30100: Add pulse-width property
To: Jonathan Cameron <jic23@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, matt@ranostay.sg, 
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 12, 2025 at 10:36=E2=80=AFPM Jonathan Cameron <jic23@kernel.org=
> wrote:
>
> On Wed,  8 Oct 2025 08:47:36 +0530
> Shrikant Raskar <raskar.shree97@gmail.com> wrote:
>
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
> I continued the discussion on v1 but just to make sure it is not
> missed, add a bit more here briefly touching on factors that govern what
> the right value is here.
I have considered the feedback from v1 and updated the description
with suggested factors. I have shared the v3 patches with updates for your
review.
Thanks and Regards,
Shrikant
>
> > +    enum: [200, 400, 800, 1600]
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
