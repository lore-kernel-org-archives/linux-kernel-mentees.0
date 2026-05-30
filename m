Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F292739D6FF
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 30 May 2026 13:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780147983; cv=pass; b=llDw3HZ6cRvV8N3o4a7rvFs9QVJtoy+RpJ17SRDmhrqADjr47he8q2lZWRBpwvcuVBnSz+dOu9sPFAcRXmtQDevAdVV5Fg03Wkkj2jmt1gl6cFP3H7BGy96xOM8OzVY744FKhB8m+RxFxHTH9CWhcIduNaucSiY3xbQyJ5JOK9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780147983; c=relaxed/simple;
	bh=L/Zna6URqXyzVfJdb3caqyH2x3byxNdGLxMMgpga9w8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lDn2UWrQG7ljgfUZRgrgakrN97+bBducGhagKIIuDChhCe9p899TJLmtF6e4JG+ssBInZduCwF+7/huMVmJ9BMaLlxtY5tjmziY1d+/gNfUI/maWluTtR0pwnk7eYpGNdkHcsMVz682OdgsuyNHfqrpAW5qmS+oQl9eyoxrdxdQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eMyYock7; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eMyYock7"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-68cc6c7df99so665193a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 30 May 2026 06:33:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780147980; cv=none;
        d=google.com; s=arc-20240605;
        b=Vy8R2oNy959GMcpgm7PG7sL4uvKiUYna8GA6CS0RLpN6J1P8do0GbThvwlgkqM9Ijh
         qXs8i6ZRwMK41Ts+4YabttMaZOq6Qgfxcs+x+r/enw6SYjJ/XAHOpKfU2FIOj1gNI/4z
         Mz7Nh+jM/MDrZdsWhxVW5meO5dDryV+Tan/TSCruG46sJMIpAxlt4+kO1JMIvfty0ttD
         7FJWvTR2dK7ePXhjJEVEcSdCtCYmjBYjLA9bWhFf2YIZTdC3ZRG2Bm4MbD62PvsDia05
         /BLffrDWmn5Q0HLeA2mjPW4rCI0X2xgswQkjiuSFOyF8GiUOaInx8kDkfw+21+GP0pMY
         tiKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4VWEUBWF7KBd1rVzFSzp+Xk2pu4Cot8nnx4EEqEDLwU=;
        fh=cM7OK7tRV3qH+xNsvJA2wEXv2Oaw9ye3H/CNClMTjqo=;
        b=J55RQ1iCLj9XOX+VY6bif6+gs2YuaKD5zCeXlkzAA7cP+012Gz4sahJbqXn1kRease
         ZFATsfBGiw4Y+ZSYlTPm0lESPJvqX7O0cCcBIhlGgCM4GJ57FOVZwWK1N2Iu+GSTfh6H
         0U4ma4XEJO70X70QjZpYLJrbxlRngQMZQ9WGIrnuR4X8FAzboUnXFQF3GvGfWzhqWijB
         KN3ebjSvidcBy6j4zPDjJVRZaGfW2QAi7L0v0MGDvaWF5taeoVUakpI1dG+6BXRlzgXJ
         ccRyVL50FDxyEyOTpFvOzaCLr51cpwGIpt398dj6cEvZ3piCSJ6U25Wpj8ZpXwHtp8Ik
         dJZQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780147980; x=1780752780; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4VWEUBWF7KBd1rVzFSzp+Xk2pu4Cot8nnx4EEqEDLwU=;
        b=eMyYock7GQsPhdxfq1VHc4LHUZtSDqBk99EZ7MOdqX5hqMdqqgAWYSfwktUvgFivrC
         rwt+dEdhzfR+tqWizhwBur/qgDREtlCfD89M7ETHcNgaxairfS6yVtFAokmGwiZmQAbZ
         KkPmLSq1+FexNaLY9EG9DzNlgoVL/OxG5KM80FQ+ymtSHnVCodSnQbN0mzMWOoXRlosQ
         FjtM2xh8YO5EZP5l1E2QEWAUSQqgGsgeIFoZ92A+Qlk3fEov4t1+ZGsLtzvLzQgIdFtq
         vZ/Jj5sCS4oYESZJS2Mad2dT+tVtuYgWyed3pLlh05ntNNTOJj8/8HcAJDeuw2e35hZe
         JjcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780147980; x=1780752780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4VWEUBWF7KBd1rVzFSzp+Xk2pu4Cot8nnx4EEqEDLwU=;
        b=k8GCsbPWwIbqvJgXzgXwDSgqIyG92176aG5K8a402f8CpOHan7rVCjdrixscRt/thB
         LEF0u/9deXwjtzHapG1cZMSTrgkdEy6qwiEML0CXg3iHGHU7+GT5zBa/TMZ/cDq2WQyg
         mCIwQX+UBgiAweK5ELOIVTXFtnAkKjLmIVDXnI3ULC5W60qJ57nlhVn2lkBkaGKXAJ5v
         Ea1/hMeB8NnnLadl3LoM6dRruzXB00Z4JbxeRQl82kvhwqts/OfeXBkjtaitQaA1lUJx
         dmEDa8JhPQsxQYEIBs0z8rFvF0LEuuDDBplD9lf/2F4dRr7xFtcOvI3nZFKbielf3jmE
         v7UA==
X-Forwarded-Encrypted: i=1; AFNElJ8Q7d+3SfcaGifk4fcbH/f8i0/KJPtbbqIXqnrdHMzbeHbSyRBfj0/il3FZqyg94iNWl3TUdEHirh0AxavQjIsUSuGhsg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyAPqDKFN2m9pjSa/AnFKDUkU8AYvGHu+v5m9W22D8oE9YHfL1c
	A2NLjgSK+sYk93lSWC/ZXsGfUD+N+ZgCOM8qGXcJvmP61pkSy7e12sH49ZymZgK2YUSaO9p1zSq
	wYLc0jyQbB1FOEwnoTrt7V0J48TRpm+M=
X-Gm-Gg: Acq92OHtycIuO22VRJ3tGqZpgWYYo5KETjO8OePYv+Hpy6b17hTDG9rcObkCTc5fc2O
	RTJYD1mZ9q9rt1a1pc/bsqWPbT1G3rgBTDtKvNjUcQGtQmDdEk0O1bOu2Dc2Y04T5UA4TgPndjw
	Tc8gCE1dSy8Q/x9205DhJBuUMWhwPGb6cCBQ9SuwulvGCnYr9E2HsvPeIyw+cbVR13+49eHFn+j
	9pOLnkqUB8cewxsnB29fE7mijmSlAvbtNVJDTCmlRAqWFlVjdUA0cpt945GzzmL5Gr3Rcx8h9t9
	pW+PkOToSUmTWpd1HazevKSrf2huz1pSIHVAs59pc5ev/CNa3kkoVJ+BRsdLR5WgeyTJdTO7Me6
	3x1uH4bk0hcluDtdaMQj66uY/p44MGUDkYgiheY/9PP5yxnxc31AdYsbcnX++/dRxrN44GaHWbd
	GcL7yM
X-Received: by 2002:a17:907:1dc4:b0:bab:ba5a:fcb8 with SMTP id
 a640c23a62f3a-beab78b54edmr128024966b.32.1780147980188; Sat, 30 May 2026
 06:33:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260530113938.171540-1-suunj1331@gmail.com> <20260530113938.171540-5-suunj1331@gmail.com>
In-Reply-To: <20260530113938.171540-5-suunj1331@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 30 May 2026 15:32:23 +0200
X-Gm-Features: AVHnY4JGtN-bFKVfNa_oaVFPXwDdfk9n2OhCT6NCdPj5SfXTexBuP7-erJSeYz0
Message-ID: <CAHp75VcN7B5BdKZGBiw5cbhYesGsO_tStcN3cKgggiHiuSnJ7w@mail.gmail.com>
Subject: Re: [PATCH 4/4] iio: pressure: mpl3115: add hardware FIFO support
To: SeungJu Cheon <suunj1331@gmail.com>
Cc: jic23@kernel.org, linux-iio@vger.kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, apokusinski01@gmail.com, 
	me@brighamcampbell.com, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 30, 2026 at 1:40=E2=80=AFPM SeungJu Cheon <suunj1331@gmail.com>=
 wrote:
>
> Add support for the MPL3115A2 hardware FIFO.
>
> The device provides a 32-sample FIFO with configurable
> watermark interrupts, allowing buffered data acquisition
> with reduced interrupt and CPU overhead.
>
> Use a kfifo-backed IIO buffer when a DRDY interrupt and
> SMBus block reads are available, falling back to the
> existing triggered buffer implementation otherwise.
>
> When enabled, the driver configures the FIFO in circular
> mode and drains accumulated samples on watermark
> interrupts.
>
> Overflow conditions are handled by flushing available
> samples before resetting the FIFO, avoiding unnecessary
> data loss.
>
> The hardware always captures pressure and temperature
> samples together, so FIFO operation requires both channels
> to be enabled.
>
> Register cache updates are performed only after successful
> I2C writes to keep cached and hardware state consistent.
>
> No functional change for non-buffered operation.

...

> +       u8 fifo_buf[MPL3115_FIFO_SIZE * MPL3115_FIFO_SAMPLE_SIZE]
> +               __aligned(IIO_DMA_MINALIGN);

We have a macro for this,

...

> +static int mpl3115_fifo_flush(struct iio_dev *indio_dev)
> +{
> +       struct mpl3115_data *data =3D iio_priv(indio_dev);
> +       u8 buffer[MPL3115_BUF_SIZE] __aligned(sizeof(s64)) =3D { };

Don't we have a macro for this?

> +       unsigned int sample_count, i;
> +       int ret;
> +       bool overflow;
> +       s64 ts;
> +
> +       ret =3D i2c_smbus_read_byte_data(data->client, MPL3115_F_STATUS);
> +       if (ret < 0)
> +               return ret;
> +
> +       overflow =3D FIELD_GET(MPL3115_F_STATUS_F_OVF, ret);
> +       sample_count =3D FIELD_GET(MPL3115_F_STATUS_F_CNT, ret);
> +       if (sample_count =3D=3D 0)
> +               return overflow ? mpl3115_fifo_reset(data) : 0;
> +
> +       ret =3D mpl3115_fifo_transfer(data, sample_count);
> +       if (ret)
> +               return ret;
> +
> +       ts =3D iio_get_time_ns(indio_dev);
> +       for (i =3D 0; i < sample_count; i++) {

  for (unsigned int i =3D 0; ...) {

> +               u8 *sample =3D &data->fifo_buf[i * MPL3115_FIFO_SAMPLE_SI=
ZE];

> +               memcpy(&buffer[MPL3115_BUF_PRESS_OFFSET], &sample[0], 3);
> +               memcpy(&buffer[MPL3115_BUF_TEMP_OFFSET], &sample[3], 2);

These two sound to me like something which might require endianness
handling, but if you put this as CPU native one and leave user space
to take care of, it may be okay.

> +
> +               iio_push_to_buffers_with_ts(indio_dev, buffer, sizeof(buf=
fer), ts);
> +       }
> +
> +       if (overflow) {

> +               dev_warn_ratelimited(&data->client->dev,
> +                                    "FIFO overflow, samples may be lost\=
n");
> +               return mpl3115_fifo_reset(data);
> +       }
> +
> +       return 0;
> +}
> +
> +static int mpl3115_set_watermark(struct iio_dev *indio_dev, unsigned int=
 value)
> +{
> +       struct mpl3115_data *data =3D iio_priv(indio_dev);

> +       value =3D clamp_val(value, 1, MPL3115_FIFO_SIZE - 1);

Why not clamp()?

> +       guard(mutex)(&data->lock);
> +       data->watermark =3D value;
> +
> +       return 0;
> +}

...

> +static int mpl3115_buffer_postenable(struct iio_dev *indio_dev)
> +{
> +       struct mpl3115_data *data =3D iio_priv(indio_dev);
> +       u8 ctrl_reg4;
> +       int ret;
> +
> +       guard(mutex)(&data->lock);
> +
> +       ret =3D mpl3115_set_active(data, false);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D mpl3115_set_fifo(data, MPL3115_F_MODE_CIRCULAR);
> +       if (ret) {
> +               mpl3115_set_active(data, true);

Instead of having an argument, just make two helpers: set_active() /
set_inactive().

> +               return ret;
> +       }

> +       ctrl_reg4 =3D data->ctrl_reg4;
> +       ctrl_reg4 |=3D MPL3115_CTRL4_INT_EN_FIFO;
> +       ctrl_reg4 &=3D ~MPL3115_CTRL4_INT_EN_DRDY;
> +
> +       return mpl3115_config_interrupt(data,
> +               data->ctrl_reg1 | MPL3115_CTRL1_ACTIVE, ctrl_reg4);

In some cases the FIELD_PREP()/FIELD_GET() is used, why not use FIELD_MODIF=
Y()?

> +}

...

> +static const unsigned long mpl3115_scan_masks[] =3D {
> +       BIT(0) | BIT(1),
> +       0,

No comma in terminator entry.

> +};

...

> -       ret =3D devm_iio_triggered_buffer_setup(&client->dev,
> -                                     indio_dev,
> -                                     NULL,
> -                                     mpl3115_trigger_handler,
> -                                     NULL);
> -       if (ret)
> -               return ret;

Before modifying this, it might make sense to split necessary bits to
the helper function and then simply reuse it as needed.

--=20
With Best Regards,
Andy Shevchenko
