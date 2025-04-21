Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7DF175D48
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 21 Apr 2025 14:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745245226; cv=none; b=eLUjdfRg3EZm2l3XbmFaDJaAUTCTxcUm8GDl7fcdtF2qd5dVoAKfhBtJHT6/xaD73UCXmfVrWehJnCoxco8mnm/a4MlKKpeFP4BwCpywzIfgFBTr+yMZZqXagIiclGjT+wqFAF1kcU880Y6VXd6TTCu2koVk3pNZZwS0KY6BCNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745245226; c=relaxed/simple;
	bh=9BaS4/yvCP2VWZ4vW+sjMlK9au+mAQZhlwBJy+NiT+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OWs66aBLKwgblNc9TSZ7A53FyFaiF9Jjrpav+ngLx3aQnQa6FcBQUijjmmrRvBNQ88kIZpgLfqRNwGRPckw1pv+9GL1X+CSCkX4HEfCwXTlVkjdc4medZwkeJ9lOxyVx+/fZaBbpRffq0pEkzUobp18gw1LEGENBadPF0S3wdf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GpEBhtX+; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GpEBhtX+"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4775ce8a4b0so72400621cf.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 21 Apr 2025 07:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745245224; x=1745850024; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CI2xNSbeewY7lsc4y3gCRJvOG3cBl5hA05Vzfe6wrpg=;
        b=GpEBhtX+xbWELkFeALxVpXiAMvBbRnyMFlkxdzEFqoCHbtnDPWN1s6bSWz1IwLoq6Q
         IbKkj5S4DSEm+oYi2rZG0SKpyrvo5ypk8FtJqR+qET8j5pO+c6nIzmpaxIllCEFUKZl9
         gjvrUr8oFk8R+H2RRqVAIS3m5ymR0K20Fsy2pn0zvc3pTM1t+6BXbfedeG7KOJJkteT3
         dGIK3FmhED/pkeH4HW1mX6EpYVsiK6CRzGs/+VHONKiQDEGgPzKdbG4svY0n8YYpMnCx
         D0w/dK+28iFcE6UJbXhI2cgx42EnmEksVsNyCBtu/UogwT+sQ5UECDFrELU8d7Yc22H7
         SioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745245224; x=1745850024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CI2xNSbeewY7lsc4y3gCRJvOG3cBl5hA05Vzfe6wrpg=;
        b=S+rZGa5aopgG5YMI+t8BsZLKGY1Nz9JxF7cZZHGMRH33eEjNu9vRMIwHrZqMUUmnc9
         lirkldAAULyJGkv1OldPp4l8k2W2JXeIFnmrWqS7jUuiQ4LPiGy9Np4mquQIwrghnsT7
         +yUXYJxCjP/VSeSfpbxM2Sn3DRZ74g3HMtukG1W+Ar/49Hwi+TxAg4eq6UlcmA7yM91G
         Fds5D4oApG5d/CyqPAHGo4sH90Pt7EjuxQuWqm5v6ryvhG7V+q9R5jBXqs0IVUQL4pqT
         COEmIlGGDfHUqQX3TUIYWIh4mGK8YwVe/j+RAiXHbINRYKTr2h1tgsBTa2eVcpSJpSXX
         p3jg==
X-Forwarded-Encrypted: i=1; AJvYcCVpsNrYgmHlXdDduemVAHCze59q2SUF41Ld4bJQ5I4zHC6jr8KnsmxmCIfFKjO1bxHKQ22rrDGYW1CN0RKNG7eakfeDPA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyPL197MfUk/e3Ig9VxUVSwMKnMK9GPTh4eT57THkG+P2mpRaUF
	zatm+w5wmQqvBK8+PU8an6rhSgPWxETFgsknYpWxwCy+KMQRNh7ZpU2zKDjlyVGsar4FawAjiA3
	MUV0aYq/8H7j3rbkrWpAbeBUDc5atWKnCxNpn6g==
X-Gm-Gg: ASbGnctuaTv5tPybbrY68rx3OpomlYuhXkWzZtatJBBEctnn7NZvxafvJRUEC/AAAOB
	DiAYHp7u56Czq5XvLp+3cDZMecslwlEeI8Fv5Oq62/2aS2OjlQNKKyd0pa0eZVuTSLfC4WH9wED
	85SYIsWv9t+hHFOP1ejV6Rqvmh0Wo1nyiXkTMjARLJIuvY7wsHvQboEQ==
X-Google-Smtp-Source: AGHT+IGiwVHdFSP3RyYjNXEtkPVmd51AlMlVK54vlvEAduXQRnI0NpLK+6bgJH5tuxlzzGRreEFkNYv6mIKVQO9CN70=
X-Received: by 2002:a05:622a:251:b0:476:ad9d:d4f0 with SMTP id
 d75a77b69052e-47aec4c56c6mr169031841cf.48.1745245223831; Mon, 21 Apr 2025
 07:20:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250421124915.32a18d36@jic23-huawei> <20250421131539.912966-1-gshahrouzi@gmail.com>
 <20250421145931.605df588@jic23-huawei>
In-Reply-To: <20250421145931.605df588@jic23-huawei>
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Date: Mon, 21 Apr 2025 10:20:13 -0400
X-Gm-Features: ATxdqUEcsfhAZuHj_DJDNyEENkD2VFIfgxR7tR6TCwWttn2zmwd8Sxn6BTIeyn0
Message-ID: <CAKUZ0z+=Vo-QUW1ph5FKej-o6Vmv_TcX=WF=3gteDs1Lg9_w3w@mail.gmail.com>
Subject: Re: [PATCH] iio: adis16201: Correct inclinometer channel resolution
To: Jonathan Cameron <jic23@kernel.org>
Cc: lars@metafoo.de, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Michael.Hennerich@analog.com, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, marcelo.schmitt1@gmail.com, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 9:59=E2=80=AFAM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> On Mon, 21 Apr 2025 09:15:39 -0400
> Gabriel Shahrouzi <gshahrouzi@gmail.com> wrote:
>
> > The inclinometer channels were previously defined with 14 realbits.
> > However, the ADIS16201 datasheet states the resolution for these output
> > channels is 12 bits (Page 14, text description; Page 15, table 7).
> >
> > Correct the realbits value to 12 to accurately reflect the hardware.
> >
> > Fixes: f7fe1d1dd5a5 ("staging: iio: new adis16201 driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> If you post a new version, always add the version number.
>
> Anyhow, I was just asking for the fixes tag, but this is fine.
Ah, that makes sense - thanks for the clarification. I was debating
whether to just send the Fixes tag or resend the full patch, and
figured the full patch might make it easier to apply.
>
> Applied to the fixes-togreg branch of iio.git
>
> Thanks,
>
> Jonathan
>
> > ---
> >  drivers/iio/accel/adis16201.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/iio/accel/adis16201.c b/drivers/iio/accel/adis1620=
1.c
> > index 982b33f6eccac..dcc8d9f2ee0f1 100644
> > --- a/drivers/iio/accel/adis16201.c
> > +++ b/drivers/iio/accel/adis16201.c
> > @@ -211,9 +211,9 @@ static const struct iio_chan_spec adis16201_channel=
s[] =3D {
> >                       BIT(IIO_CHAN_INFO_CALIBBIAS), 0, 14),
> >       ADIS_AUX_ADC_CHAN(ADIS16201_AUX_ADC_REG, ADIS16201_SCAN_AUX_ADC, =
0, 12),
> >       ADIS_INCLI_CHAN(X, ADIS16201_XINCL_OUT_REG, ADIS16201_SCAN_INCLI_=
X,
> > -                     BIT(IIO_CHAN_INFO_CALIBBIAS), 0, 14),
> > +                     BIT(IIO_CHAN_INFO_CALIBBIAS), 0, 12),
> >       ADIS_INCLI_CHAN(Y, ADIS16201_YINCL_OUT_REG, ADIS16201_SCAN_INCLI_=
Y,
> > -                     BIT(IIO_CHAN_INFO_CALIBBIAS), 0, 14),
> > +                     BIT(IIO_CHAN_INFO_CALIBBIAS), 0, 12),
> >       IIO_CHAN_SOFT_TIMESTAMP(7)
> >  };
> >
>
