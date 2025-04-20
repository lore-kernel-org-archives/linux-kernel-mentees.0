Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3002F2E
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 20 Apr 2025 00:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745110639; cv=none; b=ChUDQCcnQXMvSkDLxK862U1nzgbaTEksWGSKFn1c8TarX77iceeNDIM0JhFN9Mj0lU/XEIJ8irLF+CNfly28bz0yrceDuEbOjIUjNPhKQshUfNKmygvwjmFx0t+mHwh4E66ENP/tJbFI2AX5Z9CrQLOZ8rmxnLiKvoXY6Y0J7jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745110639; c=relaxed/simple;
	bh=aziHOJ4GqSOMl4BVkfbsB/+BfjqVBr1GfZSrod5NdOU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AVK2mFt8Pra9447ySdsG35/B7YspVrQ6HRZbUVqNXpDxqMpC2zok/wW1APQyz6yuDxUyO1nu5Av9MTyh+D4inpx5fQ79FLKwcYknkQnjQrAVFGa+km7EVlq7AGET2o0nLvzcIOM5W2mQMSGJZYfsb3e17YgeA/ZGEhXsp70H/xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cqSHChxX; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cqSHChxX"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4769f3e19a9so19601221cf.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 19 Apr 2025 17:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745110637; x=1745715437; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GOHAhJvT2EGpYPBPHQW+Mj9H5MSMsb+eawEeMqiJDsg=;
        b=cqSHChxXPmZ1blwGjdfDnIolkke0c2cTod2iCNOSf0IZ4FxP85iJknv4UlJw49ykVa
         Zfw0xRMoLaXSC3ObVoHGQt2FMJ8OFFsUxn/QIHaHfjBVabkDwwAc1TJrwKJSBIl+Zb9g
         BQiFQsuIFedjm8RqJi5eTbXZuA6OYKOvZVnOwU8BUES1G7mpaOwDgArvGgsuQZA+M7MQ
         AQWvizLeWxc1//Cf0YogV/1EVRn3NbAGvzEPZ58PqpWzWkirdPx3Rw3DVVxHzX99Uf2g
         JGiKkY9KN9m+l25GL/mRuodF+Qob3V/FiKIOfI7ZbBcvdn5ws8lPs/WDiFUu4a7+mOHT
         k4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745110637; x=1745715437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GOHAhJvT2EGpYPBPHQW+Mj9H5MSMsb+eawEeMqiJDsg=;
        b=UgbK9VWlJ6pIgU5JvyeXME9Bcmrc4LvBwrdl9v/qVObg1HGKOERECz1YY4v+p7UTw7
         G5lZBXTTZry7cmTR50wl6Cb/EliZWBAv2wh/SeY984G5TZEcOEaO+uR9luf1Y9bnB110
         yiOCpeReRoVI6bR5dv/Pi7pCK7hRNSCZn9/FDku8fafbCcBVX/3wG8Bh7N6naDSIvmOd
         jqSkW4miSbHR0HwO4gOCrOj/Nr6t8NFNGbUm1LWqnNu94M3VQ+CfO618CLPGWmVFXuIs
         Sw8Sd7eGQaIkpjEH/YgiORlv5GSNk+71p9UMFgnU6YSOo0VJWyXbNtA0VHjfquaO+aCT
         9RnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsn2OXSwJ+vLNWM68lkEExsXB+639y7wzAiU+rtN9/XshUFb0CRUFNReb0h7ENDL2rfu2YhoY2FG+j//UWrCabpf/1DQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyuGk1R8M5zQfWBKK30MaufQttvYrVnh+ZnA/rTkA/FUqXQgPnp
	jYrzqVWDNJyr2r1ztS4KPdTSuJkGbAHBSdty1Y5DLfx9FeeG6bwMF6FCzSxqa30FrsK1uzJSSJG
	YLRdmYIvJzn61Ai9p8pPi/qyhUE0=
X-Gm-Gg: ASbGnctqMB4GubdYtt16zLkXSWHzj6zroFKnaNKVVHv+HHZS4mrKSNVfwkTGfJr2Msr
	R8Udz2omJTrgKVcFvQK7TvUwdP3M13pOvP79ArKy9p1fdH30FQGDkHybAuMCUtmqIorg+SL41l9
	Bw6BknNnTRDdLcxShIhqUgikhlyCFgUxsBBr9HlOnW2WNxiO315pDScQ==
X-Google-Smtp-Source: AGHT+IEl3pn8fOMMI5krWgbC9DkGmzCfM0IKmJTML4FlDjNgQq0v/3Xk0QIkwAXyeX1OouswOySf0C1Sla8KSTiLcfU=
X-Received: by 2002:a05:622a:15d6:b0:476:6599:dee2 with SMTP id
 d75a77b69052e-47aec40c9f4mr139115741cf.27.1745110637128; Sat, 19 Apr 2025
 17:57:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250419125413.679290-1-gshahrouzi@gmail.com> <aAPoAESnjjyNsHI2@debian-BULLSEYE-live-builder-AMD64>
In-Reply-To: <aAPoAESnjjyNsHI2@debian-BULLSEYE-live-builder-AMD64>
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Date: Sat, 19 Apr 2025 20:57:06 -0400
X-Gm-Features: ATxdqUE5aGXDKHfL4Aw31qgdnmk7PI718cHPIofiUd_hT7dVEzx4CyyxvUyP1j4
Message-ID: <CAKUZ0z+cd6VREDjiqMVy5k8rpV=NC+-YGQvBFYwYfFZ8iQbL1w@mail.gmail.com>
Subject: Re: [PATCH] iio: adis16201: Correct accelerometer scale factor
To: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Cc: himanshujha199640@gmail.com, jic23@kernel.org, lars@metafoo.de, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Michael.Hennerich@analog.com, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 19, 2025 at 2:13=E2=80=AFPM Marcelo Schmitt
<marcelo.schmitt1@gmail.com> wrote:
>
> LGTM. Minor comments inline.
>
> On 04/19, Gabriel Shahrouzi wrote:
> > The IIO_CHAN_INFO_SCALE previously reported for accelerometer channels
> > used 0.4624 mg/LSB. This value matches the datasheet specification for
> > the offset calibration registers (X/YACCL_OFFS_REG, pg 18).
> >
> > However, the scale should reflect the sensor output data registers
> > (X/YACCL_OUT, pg 15, Tables 7 & 8), which use 0.4625 mg/LSB. This is
> > also consistent with the typical sensitivity in Table 1 (1 / 2.162 =E2=
=89=88
> > 0.4625).
> >
> > Fixes: 57f9386405a2 ("Staging: iio: accel: adis16201: Add comments abou=
t units in read_raw()")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> > ---
>
> >  drivers/iio/accel/adis16201.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/iio/accel/adis16201.c b/drivers/iio/accel/adis1620=
1.c
> > index 8601b9a8b8e75..982b33f6eccac 100644
> > --- a/drivers/iio/accel/adis16201.c
> > +++ b/drivers/iio/accel/adis16201.c
> > @@ -133,7 +133,7 @@ static int adis16201_read_raw(struct iio_dev *indio=
_dev,
> >                        * 1 LSB represents 0.244 mg.
> Maybe also update the comment?
Good catch. I will update that for v2.
>
> >                        */
> >                       *val =3D 0;
> > -                     *val2 =3D IIO_G_TO_M_S_2(462400);
> > +                     *val2 =3D IIO_G_TO_M_S_2(462500);
> If we do the math with more decimal digitis we have 1 / 2.162 =3D=3D 0.46=
253469010176
> Would it make sense to do
>                         *val2 =3D IIO_G_TO_M_S_2(462535);
> ?
Since the datasheet lists the scale factor as 0.4625 mg, I believe
using *val2 =3D IIO_G_TO_M_S_2(462500); is correct. However, I'm not
sure so I'll postpone v2.
>
> >                       return IIO_VAL_INT_PLUS_NANO;
> >               case IIO_INCLI:
> >                       *val =3D 0;
