Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52E23839A7
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 31 May 2026 11:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780226162; cv=pass; b=gdjQFpopesDRNhuI2opY57GsM4cpelrx/VG/rZ+T0u169snQgc0PceRIAMole9qCiNHiI4xg2R78855WA1d0Cg8zCIYTilWJpfBk7fKu16FqeS/ZHwGS30BGJHklX7FH4gFPp/mWyPtSHTy9WS73pZfGTP8ZTYzI0Obji6vZeqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780226162; c=relaxed/simple;
	bh=faHcfbpClcU4o+L38iaJU1ZD8GaunZRXjtU6wI0XuXY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VVA++ouuxgR39sFmlYbL6dhcBoQnWflMu6CHEUxmgz8y35G1w1BIwHygeXHBXGL9QknSe1HfhJRX1+SyH2pc00RcUuVCrGawTiVnDOwktk8ULkIBKwyCTi/Wm3jSPSInIYltzluIdUbvfDD/8mUu0pFYabkEIyQc0Tl8Wuu+ucQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nRTqWOFE; arc=pass smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nRTqWOFE"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7e612d0693eso7619486a34.3
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 31 May 2026 04:15:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780226159; cv=none;
        d=google.com; s=arc-20240605;
        b=S1UOw3i4GmJBy1p0ImwVDnrCK3/w6cu7xchsvx2DU7fLRykXOnQhat0UtJGd3Ju43O
         7Rgxgjn6Zv3qH5pBTU62kUyYSFrnSm7US81+kW3p+lvQiPaF0DdBvBoMnPIdY+RPnkfv
         QdYzLgT7igHxDl3QR1nhUn0monm8nJT1VBpMbViLyLUXJKtVjOXx2RPAfHII0P1jiYcx
         gFm9lHnA6TTT3NAX/8V8jFDNQulfBSozpMvS34NllAm7zCM6tJJVy4zACo318abl8tA8
         7JCPvxQJmM1bRFxvEADZPCos8k2E2ZV49iJSKF3M3bS3p3WY/DR6TMu2UX6WXdpV/73m
         lVFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bd2Xvn82ajx4EmMFtsNWklXrswUhyjI8fLCmJWocdxw=;
        fh=kblfJhIXCDLvc507z+L4wUnybpn7FiDDzi2oFrCNkIg=;
        b=HOqVP5GNWEXJuuPOwUSC8D5kNzL+TNnahBxA0ZrzJ17gRQOUg0Cyu+UsIWsTo8cbP7
         95o+G0BaonBprw8tEwJqQjiQN4yuG8URL0MeeRcUuW0K5K6efcxSQhkh7dkGEJhrOYkj
         s3Ms7pnpG2frtQA+BSjpMZ9K9Oq4x6O8vGqvPM2s/Yl6fOU/2kewzseuZCjd3IcgII81
         qZa/0Wfdxf19jUwqGsC941R7d1hFx1jrTEBwjAfuvvYlgg7wPuG/HPdI7giqAdr7F6y+
         3fkPdXygnHtJVqcQ4lwIV6ft3tbe49z8/KLwWUBl28iaC3pj3rNsB89n309o+mSTWYIH
         hG0Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780226159; x=1780830959; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bd2Xvn82ajx4EmMFtsNWklXrswUhyjI8fLCmJWocdxw=;
        b=nRTqWOFEjhMp/kNl6wfS9Mt8hWt/eViGOyN+DkhqknALTi0YMdLRXXkc4+T51GEUVh
         xybF4WzZEIMO4kLJR9h/Z5irOgNAVKVJp+zwMqrmul+i67CcOsDfOZMNxSmJAoLK/tBm
         fXg3cXXlUA0JXWAU9LdPwENn1TyDykurcBIDkoOOA0ethWg6TQnAjrqxgBN/bGiE845h
         pJio+fNjGjJg5pjAg/LROmth+v7UYyg5BcyM2vyrlAaAhRbidki9S+wwzyhQuPE62ZI8
         imfGK9H9y34F9yO7vIsLpLN2N/f0nDVjWUJKB0Q97ZWOns5BqanhCJHgPz9v+QFfFF1v
         08NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780226159; x=1780830959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bd2Xvn82ajx4EmMFtsNWklXrswUhyjI8fLCmJWocdxw=;
        b=rwD5xXtEJQOg9ca7sdwK0Y+mj+kEkN/t+DHdZ0CvALhLr5WNAx1EEV9O5HsNr+S/R9
         nIkLlRS7sS+mKS13FxNzxdxyRNaPY/bJpo4147c2gvTIdb3PBwNCMm2t0Kmv73RpH5Ew
         Xc9JDwZrbtfz/Am48flQXakvmN81NuAaU3HSZZaXNhwre9sqH8tSBE1CxPCLpjv6zzmO
         q2CVHF+V2hkBrTg+OZ4VpXQFeHvzmQ/UIdGryFt0lKboSu9wOjwTF4UN1rzXZszDgzYf
         wN3GPgSBbnoJ9AlfIdYeNQWntaXwFJ4V6E4tjVV/iDvamUmTGr4ybmvkuHShPPDTgi0m
         ZTIw==
X-Forwarded-Encrypted: i=1; AFNElJ/kxQrK12O539YJDsExT9WrYtjYS0mTxLAw8FVq8bufihbBrrRaQymmD6i5stVc1Mmf8mqjVcw4xIAeuXAi+/xJZezN9Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxcwRLRKPO0Vkb5AWF91694bpxF8BGvKOWXWe5unbOMUFPb6LYJ
	I3VaIbn4WKp38KFPaov+636D5qknbNl2p5tdiRNuu4J3qrf6EFk7NTLt2y8eT0HnTkTLQFeC+Gi
	PKCDoo1voZKBGMDFX3ebBDapkEvLjGFY=
X-Gm-Gg: Acq92OG1zAL77CUjW0YGo/g1sxDnXc+x9HvUlkp70k6oGhE7Ebj6oonLyaw1i9fgSmN
	91KazYX1n8IAWxFTbMIO48W9ttjxNOwW6UIVUB7EAxg/U90mWZcMywqr7sgXG7xyD+/55yLzW5w
	Glc6swGABGHPhecdWAjeAX2k8VYqG0hzecqnCXk10KZfL6JN8njQ+ArnvO7MFk7luOFYbs2XkQU
	oiAb1rtdmLB/wTSV6sj8E9uVWRlvsG/NCGdFwquLaOskpZwXnC38WE9WNgkKxm7KYTrBk30lDP1
	d0XoGAAPre8WIPeognwIz4FcM1y4TDOogsC9yqkd9KiYvv3U1w==
X-Received: by 2002:a05:6820:3086:b0:69d:8b4d:53ba with SMTP id
 006d021491bc7-69e1053fa68mr2944911eaf.37.1780226158613; Sun, 31 May 2026
 04:15:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260530113938.171540-1-suunj1331@gmail.com> <20260530113938.171540-5-suunj1331@gmail.com>
 <CAHp75VcN7B5BdKZGBiw5cbhYesGsO_tStcN3cKgggiHiuSnJ7w@mail.gmail.com>
In-Reply-To: <CAHp75VcN7B5BdKZGBiw5cbhYesGsO_tStcN3cKgggiHiuSnJ7w@mail.gmail.com>
From: SeungJu Cheon <suunj1331@gmail.com>
Date: Sun, 31 May 2026 20:15:45 +0900
X-Gm-Features: AVHnY4KPx0NSXU0gdfDXhQcY-GvsCUuHBJZCeL_LefC6__-IMJHMbSenQwFjoxQ
Message-ID: <CAGwK=3pJFnif5GToHOS_Y5uo6meGYNAZPp8qECjiDLUgcPdcrg@mail.gmail.com>
Subject: Re: [PATCH 4/4] iio: pressure: mpl3115: add hardware FIFO support
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: jic23@kernel.org, linux-iio@vger.kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, apokusinski01@gmail.com, 
	me@brighamcampbell.com, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Sat, May 30, 2026 at 10:33 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> > +       u8 fifo_buf[MPL3115_FIFO_SIZE * MPL3115_FIFO_SAMPLE_SIZE]
> > +               __aligned(IIO_DMA_MINALIGN);
>
> We have a macro for this,
...
> > +       u8 buffer[MPL3115_BUF_SIZE] __aligned(sizeof(s64)) =3D { };
>
> Don't we have a macro for this?

I'll rework the per-sample buffer as a struct with explicit fields
(__be32 pressure, __be16 temp, aligned_s64 ts), as Jonathan suggested,
which removes the manual offsets and alignment here.

> > +       ts =3D iio_get_time_ns(indio_dev);
> > +       for (i =3D 0; i < sample_count; i++) {
>
>   for (unsigned int i =3D 0; ...) {

Will declare i in the loop.

> > +               memcpy(&buffer[MPL3115_BUF_PRESS_OFFSET], &sample[0], 3=
);
> > +               memcpy(&buffer[MPL3115_BUF_TEMP_OFFSET], &sample[3], 2)=
;
>
> These two sound to me like something which might require endianness
> handling, but if you put this as CPU native one and leave user space
> to take care of, it may be okay.

These are big-endian channels (scan_type.endianness =3D IIO_BE), pushed
as-is for user space to decode. The struct rework will make that
explicit with __be32/__be16 fields.

> > +       value =3D clamp_val(value, 1, MPL3115_FIFO_SIZE - 1);
>
> Why not clamp()?

Will use clamp().

> > +               mpl3115_set_active(data, true);
>
> Instead of having an argument, just make two helpers: set_active() /
> set_inactive().

Will split into mpl3115_set_active() / mpl3115_set_inactive().

> > +       return mpl3115_config_interrupt(data,
> > +               data->ctrl_reg1 | MPL3115_CTRL1_ACTIVE, ctrl_reg4);
>
> In some cases the FIELD_PREP()/FIELD_GET() is used, why not use FIELD_MOD=
IFY()?

I'll review the FIELD_MODIFY() usage and apply it where appropriate.

> > +static const unsigned long mpl3115_scan_masks[] =3D {
> > +       BIT(0) | BIT(1),
> > +       0,
>
> No comma in terminator entry.

Will fix.

> > -       ret =3D devm_iio_triggered_buffer_setup(&client->dev,
> > [...]
>
> Before modifying this, it might make sense to split necessary bits to
> the helper function and then simply reuse it as needed.

Makes sense. I'll look into factoring the common setup into a helper
so the FIFO and triggered-buffer paths can reuse it.

Thanks for the review.

On Sat, May 30, 2026 at 10:33=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sat, May 30, 2026 at 1:40=E2=80=AFPM SeungJu Cheon <suunj1331@gmail.co=
m> wrote:
> >
> > Add support for the MPL3115A2 hardware FIFO.
> >
> > The device provides a 32-sample FIFO with configurable
> > watermark interrupts, allowing buffered data acquisition
> > with reduced interrupt and CPU overhead.
> >
> > Use a kfifo-backed IIO buffer when a DRDY interrupt and
> > SMBus block reads are available, falling back to the
> > existing triggered buffer implementation otherwise.
> >
> > When enabled, the driver configures the FIFO in circular
> > mode and drains accumulated samples on watermark
> > interrupts.
> >
> > Overflow conditions are handled by flushing available
> > samples before resetting the FIFO, avoiding unnecessary
> > data loss.
> >
> > The hardware always captures pressure and temperature
> > samples together, so FIFO operation requires both channels
> > to be enabled.
> >
> > Register cache updates are performed only after successful
> > I2C writes to keep cached and hardware state consistent.
> >
> > No functional change for non-buffered operation.
>
> ...
>
> > +       u8 fifo_buf[MPL3115_FIFO_SIZE * MPL3115_FIFO_SAMPLE_SIZE]
> > +               __aligned(IIO_DMA_MINALIGN);
>
> We have a macro for this,
>
> ...
>
> > +static int mpl3115_fifo_flush(struct iio_dev *indio_dev)
> > +{
> > +       struct mpl3115_data *data =3D iio_priv(indio_dev);
> > +       u8 buffer[MPL3115_BUF_SIZE] __aligned(sizeof(s64)) =3D { };
>
> Don't we have a macro for this?
>
> > +       unsigned int sample_count, i;
> > +       int ret;
> > +       bool overflow;
> > +       s64 ts;
> > +
> > +       ret =3D i2c_smbus_read_byte_data(data->client, MPL3115_F_STATUS=
);
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       overflow =3D FIELD_GET(MPL3115_F_STATUS_F_OVF, ret);
> > +       sample_count =3D FIELD_GET(MPL3115_F_STATUS_F_CNT, ret);
> > +       if (sample_count =3D=3D 0)
> > +               return overflow ? mpl3115_fifo_reset(data) : 0;
> > +
> > +       ret =3D mpl3115_fifo_transfer(data, sample_count);
> > +       if (ret)
> > +               return ret;
> > +
> > +       ts =3D iio_get_time_ns(indio_dev);
> > +       for (i =3D 0; i < sample_count; i++) {
>
>   for (unsigned int i =3D 0; ...) {
>
> > +               u8 *sample =3D &data->fifo_buf[i * MPL3115_FIFO_SAMPLE_=
SIZE];
>
> > +               memcpy(&buffer[MPL3115_BUF_PRESS_OFFSET], &sample[0], 3=
);
> > +               memcpy(&buffer[MPL3115_BUF_TEMP_OFFSET], &sample[3], 2)=
;
>
> These two sound to me like something which might require endianness
> handling, but if you put this as CPU native one and leave user space
> to take care of, it may be okay.
>
> > +
> > +               iio_push_to_buffers_with_ts(indio_dev, buffer, sizeof(b=
uffer), ts);
> > +       }
> > +
> > +       if (overflow) {
>
> > +               dev_warn_ratelimited(&data->client->dev,
> > +                                    "FIFO overflow, samples may be los=
t\n");
> > +               return mpl3115_fifo_reset(data);
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static int mpl3115_set_watermark(struct iio_dev *indio_dev, unsigned i=
nt value)
> > +{
> > +       struct mpl3115_data *data =3D iio_priv(indio_dev);
>
> > +       value =3D clamp_val(value, 1, MPL3115_FIFO_SIZE - 1);
>
> Why not clamp()?
>
> > +       guard(mutex)(&data->lock);
> > +       data->watermark =3D value;
> > +
> > +       return 0;
> > +}
>
> ...
>
> > +static int mpl3115_buffer_postenable(struct iio_dev *indio_dev)
> > +{
> > +       struct mpl3115_data *data =3D iio_priv(indio_dev);
> > +       u8 ctrl_reg4;
> > +       int ret;
> > +
> > +       guard(mutex)(&data->lock);
> > +
> > +       ret =3D mpl3115_set_active(data, false);
> > +       if (ret)
> > +               return ret;
> > +
> > +       ret =3D mpl3115_set_fifo(data, MPL3115_F_MODE_CIRCULAR);
> > +       if (ret) {
> > +               mpl3115_set_active(data, true);
>
> Instead of having an argument, just make two helpers: set_active() /
> set_inactive().
>
> > +               return ret;
> > +       }
>
> > +       ctrl_reg4 =3D data->ctrl_reg4;
> > +       ctrl_reg4 |=3D MPL3115_CTRL4_INT_EN_FIFO;
> > +       ctrl_reg4 &=3D ~MPL3115_CTRL4_INT_EN_DRDY;
> > +
> > +       return mpl3115_config_interrupt(data,
> > +               data->ctrl_reg1 | MPL3115_CTRL1_ACTIVE, ctrl_reg4);
>
> In some cases the FIELD_PREP()/FIELD_GET() is used, why not use FIELD_MOD=
IFY()?
>
> > +}
>
> ...
>
> > +static const unsigned long mpl3115_scan_masks[] =3D {
> > +       BIT(0) | BIT(1),
> > +       0,
>
> No comma in terminator entry.
>
> > +};
>
> ...
>
> > -       ret =3D devm_iio_triggered_buffer_setup(&client->dev,
> > -                                     indio_dev,
> > -                                     NULL,
> > -                                     mpl3115_trigger_handler,
> > -                                     NULL);
> > -       if (ret)
> > -               return ret;
>
> Before modifying this, it might make sense to split necessary bits to
> the helper function and then simply reuse it as needed.
>
> --
> With Best Regards,
> Andy Shevchenko
