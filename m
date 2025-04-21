Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E56A1DED47
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 21 Apr 2025 13:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745240738; cv=none; b=WpJEMrXTP8J/GTPD7ES2WLQ2teOWLpmGxpUDBXFtwlBBOWQ3qoRsEKk2Qp7VipZEaCqcxLfn88Q/wevDHWuiTH5elrSj9WamGXSk7YyO8yXkiCuuNuhwmoasnETQD3biHiaCklfczGBmB1Q4P7FsQ2FkFcZvKbPYKQoWDTMbg6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745240738; c=relaxed/simple;
	bh=f+BKdAC4I6YUGknxlC3Xm4jFCVMEuPMlEQphh5ZvvvI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CsSbI2bFPKOwHOoIEqrNHrbqGTpO1hVfwPFtjKeTJjIrba0u3PSrVIkSWKJln9SdZdGv4kxXaEpnHL5RgwrIcH+XUQK8uBkPXlmh8C5mtt6ivOvzgjVZ68IMaQBvK6jXy5Dv5ox16wpkyFiWeJn3mTDtFtsTXma0PSDnAYgoLt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a6EI0yy3; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a6EI0yy3"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-476b89782c3so47110781cf.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 21 Apr 2025 06:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745240735; x=1745845535; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mFtNIhESQPUgGQGLUOpZgw8PI1xqIhF3XCImtswCRMw=;
        b=a6EI0yy37E1REqFja4NVVGJS/o3DaSD+Z/n5IXxwW+X6a/1ONknoKHfNz3pXhjNMK9
         30pt/SVWP5sEoTwzf7cV28ZXglnircsOFFsgGUXeH92to7+YADxVgDP6lee96K+aP9+s
         M8cxmaqJjBDMLkv3ZCqWy+0Qk4aiF9BeUlOQUn6OLJTUb4+kj+c6XClOxOhCcglKmPuG
         W0PIRG6XE7I6YPMt/SFW/CxmKylYFNypR0JCEgFIVFnneAUwchbyWQ24R9/TcU/h34Xj
         O74JPBW7gUmg5qZJNY2u7SfTa9JZA52KcHDOcH0R/bsheHGgJMIHnS/d/uWoUAR0WdPJ
         maBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745240735; x=1745845535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mFtNIhESQPUgGQGLUOpZgw8PI1xqIhF3XCImtswCRMw=;
        b=POuU3USgi4vUnfsa9n6mvo9r1A1psGYUwwf28FUTnKZr+qNYhWbVvJQFpMT6ovI1jl
         Tzal/44Sw57HI6bAzp3H2w3c9qxS/0VJ/l/uH8+XX9icRc1ja91Li0EbQWwTf+AbeMvy
         m45sBap+ACI9GYmHrwyazpmQ/h45yqoMwOxBX3S/FlS9AbThuzLgH/GOMSd0hddutJ4t
         pcSooFeHoNMQfWTgIXostGlseexHmicizRlozyKdkp0zDG1tiZeNjRnxshoOsbQOvx1P
         JA6mhXtp4e21DqkSuN/6JGbpzfa44v9nQ1roI/tMjvXn0NrasTtyNwa5bvcMrClEZRvL
         Ej3A==
X-Forwarded-Encrypted: i=1; AJvYcCVbZyqCs4wlfwiz0Nvf5aHnzoCNfUNhbgR9yBFhMgUJlgWlnwM9Z4nF8qtY87cJsjanWjQr9Iwn4RwX6soNxH1O1REqNQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwI2jMYb/E9SMTkLUsFucpaCuB+xcBAwujI2W/rvryIEfQni/OE
	lddY9P2c/y1GzTidJdv1c81T9CRTUPqtSNglXh1SpHVq+Z0/Vv5yE5DB6i12oX5v0r5KgkKoszN
	zReazN1RnvrnlP7okxV68XL1RhTg=
X-Gm-Gg: ASbGncu4hHiyYFauoU6QxOXLiYIsBQkK7cnsON7WmiNEqWXT82RvpiGG5R/Mn+TKUmz
	8qjPj+/f1js1bhvjrsoAXbVO/gwYD/ddIvILMxGEweN3JfK6KWW9nsSeVAH11Wn8Wg8wX2uIgbE
	Y7JtDiEaxaqtpjAov0rt3Bs1EcxEc42k6TPYgJN7l99FQZ61Gj0eWZJQ==
X-Google-Smtp-Source: AGHT+IFzhhB+GWbWRt4VxGeCchwkPhazFoXhUCuwU/HnqxTikuays0RZ9Gjb8LQHrf9hUaObS2S/SGrxuiz6Va7SYmY=
X-Received: by 2002:ac8:5748:0:b0:477:cb1:ab2a with SMTP id
 d75a77b69052e-47aec39436bmr229380531cf.13.1745240735267; Mon, 21 Apr 2025
 06:05:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250419144520.815198-1-gshahrouzi@gmail.com> <20250421124915.32a18d36@jic23-huawei>
In-Reply-To: <20250421124915.32a18d36@jic23-huawei>
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Date: Mon, 21 Apr 2025 09:05:24 -0400
X-Gm-Features: ATxdqUGZBqiT-xkUtjMAQApZJcXMrreXjPpwyLrHEPICF2V0q6d2B3Psi9ZDg1k
Message-ID: <CAKUZ0z+CSMqCNFAT9k6nUkiwYjq0QG=hH3QPLO-w47xWLkVUxg@mail.gmail.com>
Subject: Re: [PATCH] iio: adis16201: Correct inclinometer channel resolution
To: Jonathan Cameron <jic23@kernel.org>
Cc: lars@metafoo.de, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Michael.Hennerich@analog.com, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 7:49=E2=80=AFAM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> On Sat, 19 Apr 2025 10:45:20 -0400
> Gabriel Shahrouzi <gshahrouzi@gmail.com> wrote:
>
> > The inclinometer channels were previously defined with 14 realbits.
> > However, the ADIS16201 datasheet states the resolution for these output
> > channels is 12 bits (Page 14, text description; Page 15, table 7).
> >
> > Correct the realbits value to 12 to accurately reflect the hardware.
> >
> > Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> > ---
> > Omit fixes tag because it targets driver before it moved out of staging=
.
>
> Why does that matter?  Should have a fixes tag.  Whether we chose
> to backport the fix is a different matter.
Ah ok, that makes sense.
>
> Otherwise looks fine to me. Reply to this thread with a fixes tag
> and I can pick it up without needing a v2.
Got it, will send shortly.
>
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
