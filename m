Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032CB2C3268
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 30 May 2026 12:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780143209; cv=pass; b=lmFnJLgb+foLby2ETlQhFmAD/XSrTLr61cO5aHazy0o1cQNC5fhkamCG1+FB6II0D6oPNSEcG2kpLWL3T8sSlfg7qoOYrsproKSqF9uU3v7qLcr5eJNiIkGsTPiIi7UsZYrNnyphndF09q5Qrzq6y3nlyrtz9CKrIjx2X6/hYHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780143209; c=relaxed/simple;
	bh=Zcqq4uNc5P/uQsQGgioaxUxbxELyjmsfBqYi3m/Vfvk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WyfS5/O3lHZqTAse5OK+t1WyZ19sU6MJ338cy2w1dnOcMaytRDao3XFFR6ZVxjWK7HkX4fTj/zK7lqqw2n7PaGW3h9OnchD7+2oyfoeNnwOBkYzRO8WqUTX1LLvf4u9zRVIh+BrT66RucUF2M+eDdDyIu99gdarxfYGIbihXYxc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nqna71mo; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nqna71mo"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-bdbcc6c4500so1425705966b.1
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 30 May 2026 05:13:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780143206; cv=none;
        d=google.com; s=arc-20240605;
        b=BFj0LXJ6Cy0mej9gj3VWO6EVRfVO3jd04Xcd1JxgKAY75bbbaRiSITgmTwjBk4b9R+
         LKC0ctleDRBlaHT8uq7Kj86my0xfZki5PBcuPoId1lna78BEG7KYUvOR3yYPpuql2Hhv
         f5URhirxf7vSlem0TNjMwn/LfDn1yUaG/0v0VfhLoba6Wx3MphREn2FV6oLp+igqX3Zw
         wzOYbZCEpnknpMiV2Du8lfj+FKhWJu+LtGc/VujNbKDGEzvWRUGkhOtfyypz2crQDqCl
         bWr/1uFHyb7UQfWMNZ7jWCBO/QLi/t/b5ATtRoIpo+zBhatyokrf/80kpNqiggSWdb4E
         dGCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xrduNo3l5STIDhpgC7F3W2pVEkONkM5OKWj5qR5aWhQ=;
        fh=jDoDgKsms/TfjNMZRxLFpK3gsbp+EmhRwgks6kH0B+k=;
        b=U3HW6tDFFvhTZOt84FaI2p3KBII0VTPxUUNWyGsTDSuzCoPcHCRzBGVoNZulpEYn9I
         og5a59AS3yTyBTJhZM25fkEfiFaLVdb7MueGN2d0ZCw2F2NPWs1GZH8KxUNdpRLwA4t1
         Sp4zGWb7fkkgQaYhJ5z0xnvDul719YTbPHmcL39WG+hcQppSd/ns8MzwpRwUgasyxmZq
         zvh1b0UQGvjcmdGC/3SQjExV7VZMvVHB7+jAnbouSX8pcSnQ5TF15EAHShIs0voWINWw
         ajX8xa2alulNJzwAOPg6XAKXIk9fbXwffRir87mUyggUO7hylib7dGxcsDuLs/Xp4Gt+
         VIFA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780143206; x=1780748006; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xrduNo3l5STIDhpgC7F3W2pVEkONkM5OKWj5qR5aWhQ=;
        b=nqna71moFOSu7p2g6G7/S5teWZDCoR7kX9jl/THrtUSGxHdcK63OELYJVvmQyvrexp
         iJxKkqS14Lym2rbSao9+SOGOQXP2rlkQJiOv7cYKq3sVC+lgvPfSbSWRTHtU3M2TbUSS
         ct0zHxIRaU1nDggC7PYYxfilVO3hu/mdlf8h0/xbt2zm34vy1bQ62LIE3Q2+BgSYVTVW
         UxLdNU9/ydK/QNRH8C7VM1z4gEM1j1eklKQWfS7VENo+cbC2IqBFfVnlI+wxsSKNwebm
         RJIo7nZQxpzQGGMnNMcEL6iKesqT38WzjyhimD7c3sUlWPZGKV50l+iUscvGSf39203h
         16yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780143206; x=1780748006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xrduNo3l5STIDhpgC7F3W2pVEkONkM5OKWj5qR5aWhQ=;
        b=ZPa+mRKWbC4MQrhtUoPT/jG9x9RUE1j+flp3AiqC/rDKCyoEbDJnkp8Uvb50QYTNqz
         l1AIwmJmguahxrztdRBUIlTkwf5ic2Re3PCKP3gyXsUKlGIW0OQD91yIQr1GskpIiENk
         9qMTU7zB2KwICIIILM9LJiQwoG6Aedsj38JNgwIv7m5GHn2nLiqtJ9vXTwTl0kPlBPPn
         6Uh1SPKWwPXrKlc4EqCN+6dlrFYlvtfe4ojXzywbeM+o9h92jmkt/e2gL/mL5lLp3CXG
         xrbxDDdSXqqVOiwja0+s6NKRsJmvGG4WEvKqykP+aO6Tg+0NL5EL4hTv6eR3JigG16dP
         UwhA==
X-Forwarded-Encrypted: i=1; AFNElJ+Vj7ixlw7SUhxYQSnDSWrUs2UcbyQwyiOVDLuIOslzLNDCX8l0hTsGewbtn6JURHlXI7nuQtXj3wr9QS94KAn9M26pjw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+BVsXOZfL5VVDYHiW4n9IzHYXofxwbos/J4IqhE8XRc4sSHdU
	YbrY5fadcz6MkOTZpZT78gqhM/wUpQPJexHb8gKU78i0pBEHbslGgA+gnHFPKv/f3VIOUFaB2nk
	uL0+rwXbnIARg8F6imh3nq5BPb9ZXVLU=
X-Gm-Gg: Acq92OEin1vKledX4VjPapHn8zJdhipi7OPVo/s6VPfN7SD+KAvFlZ0qTeBnQ0RlImA
	88Dl8lya5LlcvnGma2XcLeqRMMNUwnxcyd+pFOxEQoDfIb10kBJRBTdWceZjpIaQYrlKxvQDl3R
	Fyh3rkJkXwnEWSL1pcshV3+rVSjJw0M0I6QPNPyN135zLodFU6ENk3tfmCCGLgrI1bpIKr42HEY
	/u/RGvdhG5OiVRrT2V5AImIbupa+HXr4ujftSMYuONwztpSMPEL2ZCXDd0QVKxWPLyuT8UW95yV
	zy8sl+lHcga1wj4V+gevYEUyFLrDlw60v1kbIgp6QI4x09oI57PZlG64GKixFtPrragfxCVwDdd
	M9+OG5ezj9BX6mRoUXfoiJnc2pk3aUTv6JsOKWNu9OwUD6gaYsBrwXg7lt6ZyLMVBE6IjtajU2i
	kOYxDwwA1Li/xX1/8=
X-Received: by 2002:a17:906:5a49:b0:be2:7ee3:fabb with SMTP id
 a640c23a62f3a-beab3846422mr117941666b.41.1780143206144; Sat, 30 May 2026
 05:13:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260530113938.171540-1-suunj1331@gmail.com> <20260530113938.171540-2-suunj1331@gmail.com>
In-Reply-To: <20260530113938.171540-2-suunj1331@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 30 May 2026 14:12:49 +0200
X-Gm-Features: AVHnY4JaMDgf3QYl2WlxP_Brp-ClFJIuceIE2pF_w-vCIceUytgSPvaHhuC8coc
Message-ID: <CAHp75Vfd_eRRgnCpXsa0CVQ56f85YwQQRTj70MfmB4prVygYGg@mail.gmail.com>
Subject: Re: [PATCH 1/4] iio: pressure: mpl3115: convert probe to fully devm managed
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
> Convert probe to use devm-managed resource allocation,
> removing the need for an explicit remove callback.
>
> Replace iio_triggered_buffer_setup() and
> iio_device_register() with their devm equivalents.
> Register a devm action to return the device to standby,
> replacing the cleanup previously performed in
> mpl3115_remove().
>
> Move mpl3115_standby() and suspend/resume helpers above
> probe to satisfy declaration ordering requirements.
>
> No functional change.

...

> +static int mpl3115_suspend(struct device *dev)
> +{
> +       struct iio_dev *indio_dev =3D i2c_get_clientdata(to_i2c_client(de=
v));

What's wrong with dev_get_drvdata() ?

> +       return mpl3115_standby(iio_priv(indio_dev));
> +}
> +
> +static int mpl3115_resume(struct device *dev)
> +{
> +       struct iio_dev *indio_dev =3D i2c_get_clientdata(to_i2c_client(de=
v));

Ditto.

> +       struct mpl3115_data *data =3D iio_priv(indio_dev);
> +
> +       return i2c_smbus_write_byte_data(data->client, MPL3115_CTRL_REG1,
> +                                        data->ctrl_reg1);
> +}

...

You forgot about mutex_init().

> -       ret =3D mpl3115_trigger_probe(data, indio_dev);
> +       ret =3D devm_add_action_or_reset(&client->dev, mpl3115_standby_ac=
tion,
> +                                      data);

Add

  struct device *dev =3D &client->dev;

to the top of the function to make this shorter and easier to read.

>         if (ret)
>                 return ret;

...

> -static int mpl3115_standby(struct mpl3115_data *data)
> -{
> -       return i2c_smbus_write_byte_data(data->client, MPL3115_CTRL_REG1,
> -               data->ctrl_reg1 & ~MPL3115_CTRL1_ACTIVE);
> -}

Split moving of this function to a separate prerequisite patch.

...

> -static int mpl3115_suspend(struct device *dev)

> -static int mpl3115_resume(struct device *dev)

Why did you touch these two?


--=20
With Best Regards,
Andy Shevchenko
