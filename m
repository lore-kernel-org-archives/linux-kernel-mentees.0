Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E89342CB3
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 31 May 2026 10:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780224596; cv=pass; b=YmwDsJRwjEVoz0MQDj1lKTf8DWnMC2s324QsY8EYhbP5eRMEwuOCzbohEq01eUEGsdoAnQpue4Gdw0FvKNqlPRENZZgGiEg9OPCWj346abqGvnklspVR7qn9F35m3P42+u9KSaD60u4vO4BcyKWDFd8xL76wbbcUFSqCljBPRcc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780224596; c=relaxed/simple;
	bh=gvh82LA1KOKLl9bbz7xBRFmiovyrZGSaf+IOmHuiII4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kAkmH1fk/iVLP40JTf1LedUpZU9RKCcQo6qKKYx5gyyDE/MWoGbHcn3PeijwgNgZB9rcP7bFcvB4p8H9Y/3e7SiwgQb+kOzwSUJjbxh0En1GAmSP/D1lJGcQzJPlqMX6Yzt/sKgwRMNrt4Ad81FQPJJc0FhAKR6h5YcCmeK4pvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=axBnyWXO; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="axBnyWXO"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aa5ee1f07fso1248735e87.1
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 31 May 2026 03:49:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780224592; cv=none;
        d=google.com; s=arc-20240605;
        b=ilw+KQKS+1t0oXLx6kMBR/FEREXTs6EAHYWMYliYZMzSLLoMTdIF7LniJEFKT1iGRn
         xtex6fTFsMbjSlJCKWsqMAXoaxjS3p2LODnqyxcqBEEPQPctYyk5oh0rY17mcZa9mhsy
         ZjO0IyUSa15aFkT0Ox9TMSDsEP3QZQOppY8KzlJ3jsnqG0y4m0h6Tv5/VRZ4xzKjomFo
         DX9N7Uzy40JTPIW1E2WWCH2m331yzA2p7f6lCcf72MdIwD16gVSvYeks/GQYID37mcjB
         RmPYyWWrz8X8plrjtOlKHZcwKxvk2LL6lOLyzhGI7apxr9L3Zuo576ugFujN4CZe87pr
         D4Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9/xyzmmG3XKAH81i9/O4xpqMLBfh0HI6DZe6X6Qp4No=;
        fh=IsQzW3bj4foVs9j71unY0HRiov777NPIv6ynROGBBNM=;
        b=H1kMxS3TKWhU7+REmZxPdkdmdAvl9gdQCg5bYjSS39eMuiXMdOpQhJkYtxxCZaEHsP
         4SY+WeEBQmcuMgXVXRzc2g+jlDCafD7A8BcZ/3vSHX9Kfw3gO6CVfORnq/w1yHMc9dyN
         SEbxI6/kPFBYOaGrVFWwtdOLQ7NDcI01xLfcJVoej9Ds4K9fuZSw0/jgKajv8s73Ao3e
         eSPQyDJfPJ6JOUvFf+5K8MC9amBZJQNeG905IkCwHZsIcAtEM6q95UZlyH5nCJcuxqSk
         nN6Z2A8vVmXxeTuJ8GTL/QJ0Z4smHkibhnaFes+cA3VHAfwFN9/vlKvxYDB5WXyPUeus
         PA+w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780224592; x=1780829392; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/xyzmmG3XKAH81i9/O4xpqMLBfh0HI6DZe6X6Qp4No=;
        b=axBnyWXOKVDXrqC00NHNySG4WHLvDotnFwqBezo662GHMwtNA/DWwt/pEooYavzGFu
         rtTiD51flSA9DBZ8UJ1uVRihlMGZ66wTf/AztZaEYi4Umej6eyqBelXj0o8x3LkttON4
         OJ6A63HrjgvfZa1VV28l33UT3sFHvk2bji8rWZngpL69Zt5Om3ysTdMO8rtNbaQKgfp1
         N++dsxfXAdDLDNFgpom7PHqFXmbH6RX4iC/oLcZDYL0FWPi5F91WOFLPHAjJBWWoZN44
         MtNbdCOIlQQoH1pZtfwG05qpKxygVI52lsnon++RsuPS9qwKPC9ZKqdiLWTY7cnnGPCV
         cqag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780224592; x=1780829392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9/xyzmmG3XKAH81i9/O4xpqMLBfh0HI6DZe6X6Qp4No=;
        b=RIExhfM1wt51uxRsUujwHsgBR60B66OaNTD87HmFRLgZurENgkdlmbA2FZlgFbJCh7
         xBVQ7RSyL7SjPv70unHV9cocv9iF+vsKPj1JSbNd0oy7HqVcJxM+YCsdAqARTJMEu7g+
         PYwfBnW/wljgkO7ghNgcX+oXjSGvS4dUTheTRS1x7SWVlm+2zdAJ0hu7cARf34B9OCAy
         BuqaLsfHz2tMnVLsCPJN7GgtQP2bI9Ihmz86EoKe+UwGxEw9xPZM3U5vXmuT6WCMnTWD
         SKn9bLvvjbuXJZlgfiljOJnhT8E732cSbNV4gjKKBXokWPWfV7OXx4SF6xRacQ7/xZbK
         zkeg==
X-Forwarded-Encrypted: i=1; AFNElJ9k4F+P0z8u1q2bA564Yi3bZA5gDSqNefEmGTo5V4bqD5zkKV4VJK3igTL/1JKinuy3LaVCMcMjXWWrx3y0cvKU2Z58+Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwroO10ulbcUBjc8VkFLCBqgGywZdBFJLTfq0UTg64YnggP+Kpz
	IX1OJ0jkFjRbHQB88iZC9gz4LC3M7koDm83IGFMiuxtNaaTE52J5n11u6bC6gF1d/5RjUyKg40W
	iFiGc5htmw/22lFV8UzHUAof8UjAg2i4=
X-Gm-Gg: Acq92OFEB1f9hUOvelYBvY/Vn8jTpw6wv+S7w13W4D+7j5VAaaFSeJSKflPfRib0efb
	bvnvdc7C+eZ/2W80KdEF3gocjLOV+N+zGoUQ1TJv5YzuSC1rvHNWG/jIO7EQpQY8fEo489SqOM2
	cXfMnQA3Dut3DZizejz/9jIoxhAjthh5k0+3PVptQVpfYgVvWsJMGC1OSSQhcvJ/nKtW1+aLM5N
	OuCuoc/YW33gDly82Kbo0Hish7w76LKajXv0z3vntk5DfcLH2uG9NVIe2FqUipiUv/xf5v9a2q2
	na4f4wU6d1wyAP+Q0eIrTnzpwS7HWgve+HYyaEJ9ikT9icDj4A==
X-Received: by 2002:a05:6512:3407:b0:5a8:638f:7fe2 with SMTP id
 2adb3069b0e04-5aa606a381amr2175723e87.2.1780224591865; Sun, 31 May 2026
 03:49:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260530113938.171540-1-suunj1331@gmail.com> <20260530113938.171540-2-suunj1331@gmail.com>
 <20260530161048.0e2ce1fe@jic23-huawei>
In-Reply-To: <20260530161048.0e2ce1fe@jic23-huawei>
From: SeungJu Cheon <suunj1331@gmail.com>
Date: Sun, 31 May 2026 19:49:40 +0900
X-Gm-Features: AVHnY4KmF01ycKBB4Y08SI8KKiasM7YtgWEHp17ojcEjedx-CvRF-GYiRorZZMs
Message-ID: <CAGwK=3oJ1EhcC9uA0dufvCfkEfok2vx9yGYCO7iy22gkYW-=5A@mail.gmail.com>
Subject: Re: [PATCH 1/4] iio: pressure: mpl3115: convert probe to fully devm managed
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, apokusinski01@gmail.com, me@brighamcampbell.com, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jonathan, thanks for the detailed review.

On Sat, 30 May 2026 20:39:35 +0900 SeungJu Cheon <suunj1331@gmail.com> wrot=
e:
> > Register a devm action to return the device to standby,
> > replacing the cleanup previously performed in
> > mpl3115_remove().
>
> This should have noted that in error paths the standby wasn't there
> and now is. However see below; I think the patch need to be split in
> at least two parts.

You're right. I'll split it into two patches in v2:
  1. Add the standby cleanup on the probe error path (no devm yet).
  2. Convert to devm-managed allocation.
and note the error-path behaviour change explicitly.

> Very short wrap. Exactly whether to limit commit messages to 72 or
> 75 chars is a bit of a matter of opinion, but this is 50 something.

Understood, I'll rewrap the commit messages closer to 75 chars.

> > Move mpl3115_standby() and suspend/resume helpers above
> > probe to satisfy declaration ordering requirements.
>
> Not obvious why the suspend/resume moved. Just move the minimum to
> make the patch easier to read.

Agreed, that was unnecessary churn. I'll move only what's needed and
leave suspend/resume in place.

> > No functional change.
>
> Not true. That error path gaining suspend of device is a functional
> change.

You're right, I'll drop that line. The error-path change will live in
the split-out fix patch and be described there.

> Take opportunity to tidy indent up now we are less fuzzy about 80
> chars.

Will fix the indentation as you show.

> Andy covered this. I think we ripped out most instances of this a
> year or so back as it is a pointless bit of bouncing back and forth
> between container structure and the contained.

Yes, switching to dev_get_drvdata() in v2.

> Andy called out the question of why these moved. It makes the patch
> somewhat harder to review, so don't do that in this patch even if
> there is a reason to do it.

Understood, I'll leave suspend/resume untouched here.

> So in the error path for this function we will now call this standby
> action. If there isn't an equivalent in the original code, break
> this up.
> Patch 1. Add that cleanup without any devm stuff ...
> Patch 2. Devm stuff.

Confirmed there's no standby on the error path in the current code,
so I'll break it up exactly as you describe.

> Indent as something like:
>         ret =3D devm_iio_triggered_buffer_setup(&client->dev, indio_dev, =
NULL,
>                                               mpl3115_trigger_handler, NU=
LL);

Will do.

Thanks again.

On Sun, May 31, 2026 at 12:10=E2=80=AFAM Jonathan Cameron <jic23@kernel.org=
> wrote:
>
> On Sat, 30 May 2026 20:39:35 +0900
> SeungJu Cheon <suunj1331@gmail.com> wrote:
>
> > Convert probe to use devm-managed resource allocation,
> > removing the need for an explicit remove callback.
>
> Hi SeungJu,
>
> >
> > Replace iio_triggered_buffer_setup() and
> > iio_device_register() with their devm equivalents.
> > Register a devm action to return the device to standby,
> > replacing the cleanup previously performed in
> > mpl3115_remove().
>
> This should have noted that in error paths the standby wasn't there and n=
ow is.
> However see below; I think the patch need to be split in at least two par=
ts.
>
> Very short wrap.  Exactly whether to limit commit messages to 72 or 75 ch=
ars
> is a bit of a matter of opinion, but this is 50 something.
> >
> > Move mpl3115_standby() and suspend/resume helpers above
> > probe to satisfy declaration ordering requirements.
> Not obvious why the suspend/resume moved.  Just move the minimum to make
> the patch easier to read.
> >
> > No functional change.
>
> Not true. That error path gaining suspend of device is a functional chang=
e.
>
> >
> > Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
> > ---
> >  drivers/iio/pressure/mpl3115.c | 81 ++++++++++++++++------------------
> >  1 file changed, 39 insertions(+), 42 deletions(-)
> >
> > diff --git a/drivers/iio/pressure/mpl3115.c b/drivers/iio/pressure/mpl3=
115.c
> > index aeac1586f12e..befb6d48efa9 100644
> > --- a/drivers/iio/pressure/mpl3115.c
> > +++ b/drivers/iio/pressure/mpl3115.c
> > @@ -691,6 +691,33 @@ static int mpl3115_trigger_probe(struct mpl3115_da=
ta *data,
> >       return 0;
> >  }
> >
> > +static int mpl3115_standby(struct mpl3115_data *data)
> > +{
> > +     return i2c_smbus_write_byte_data(data->client, MPL3115_CTRL_REG1,
> > +             data->ctrl_reg1 & ~MPL3115_CTRL1_ACTIVE);
>
> Take opportunity to tidy indent up now we are less fuzzy about 80 chars.
>
>         return i2c_smbus_write_byte_data(data->client, MPL3115_CTRL_REG1,
>                                          data->ctrl_reg1 & ~MPL3115_CTRL1=
_ACTIVE);
> is the preferred style.
>
> > +}
> > +
> > +static void mpl3115_standby_action(void *d)
> > +{
> > +     mpl3115_standby(d);
> > +}
> > +
> > +static int mpl3115_suspend(struct device *dev)
> > +{
> > +     struct iio_dev *indio_dev =3D i2c_get_clientdata(to_i2c_client(de=
v));
>
> Andy covered this. I think we ripped out most instances of this a year
> or so back as it is a pointless bit of bouncing back and forth between
> container structure and the contained.
>
> > +
> > +     return mpl3115_standby(iio_priv(indio_dev));
> > +}
> > +
> > +static int mpl3115_resume(struct device *dev)
> > +{
> > +     struct iio_dev *indio_dev =3D i2c_get_clientdata(to_i2c_client(de=
v));
> > +     struct mpl3115_data *data =3D iio_priv(indio_dev);
> > +
> > +     return i2c_smbus_write_byte_data(data->client, MPL3115_CTRL_REG1,
> > +                                      data->ctrl_reg1);
> > +}
>
> Andy called out the question of why these moved. It makes the patch
> somewhat harder to review, so don't do that in this patch even if there
> is a reason to do it.
>
> > +
> >  static int mpl3115_probe(struct i2c_client *client)
> >  {
> >       const struct i2c_device_id *id =3D i2c_client_get_device_id(clien=
t);
> > @@ -730,53 +757,24 @@ static int mpl3115_probe(struct i2c_client *clien=
t)
> >       if (ret < 0)
> >               return ret;
> >
> > -     ret =3D mpl3115_trigger_probe(data, indio_dev);
> > +     ret =3D devm_add_action_or_reset(&client->dev, mpl3115_standby_ac=
tion,
> > +                                    data);
>
> So in the error path for this function we will now call this standby
> action. If there isn't an equivalent in the original code, break this up.
>
> Patch 1. Add that cleanup without any devm stuff (almost a fix but it's
>          only going to waste a bit of power in an unlikely error path so
>          we probably won't backport it).
> Patch 2. Devm stuff.
>
> >       if (ret)
> >               return ret;
> >
> > -     ret =3D iio_triggered_buffer_setup(indio_dev, NULL,
> > -             mpl3115_trigger_handler, NULL);
> > -     if (ret < 0)
> > +     ret =3D mpl3115_trigger_probe(data, indio_dev);
> > +     if (ret)
> >               return ret;
> >
> > -     ret =3D iio_device_register(indio_dev);
> > -     if (ret < 0)
> > -             goto buffer_cleanup;
> > -     return 0;
> > -
> > -buffer_cleanup:
> > -     iio_triggered_buffer_cleanup(indio_dev);
> > -     return ret;
> > -}
> > -
> > -static int mpl3115_standby(struct mpl3115_data *data)
> > -{
> > -     return i2c_smbus_write_byte_data(data->client, MPL3115_CTRL_REG1,
> > -             data->ctrl_reg1 & ~MPL3115_CTRL1_ACTIVE);
> > -}
> > -
> > -static void mpl3115_remove(struct i2c_client *client)
> > -{
> > -     struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
> > -
> > -     iio_device_unregister(indio_dev);
> > -     iio_triggered_buffer_cleanup(indio_dev);
> > -     mpl3115_standby(iio_priv(indio_dev));
> > -}
> > -
> > -static int mpl3115_suspend(struct device *dev)
> > -{
> > -     return mpl3115_standby(iio_priv(i2c_get_clientdata(
> > -             to_i2c_client(dev))));
> > -}
> > -
> > -static int mpl3115_resume(struct device *dev)
> > -{
> > -     struct mpl3115_data *data =3D iio_priv(i2c_get_clientdata(
> > -             to_i2c_client(dev)));
> > +     ret =3D devm_iio_triggered_buffer_setup(&client->dev,
> > +                                   indio_dev,
> > +                                   NULL,
> > +                                   mpl3115_trigger_handler,
> > +                                   NULL);
>
> Indent as something like:
>
>         ret =3D devm_iio_triggered_buffer_setup(&client->dev, indio_dev, =
NULL,
>                                               mpl3115_trigger_handler, NU=
LL);
>
> > +     if (ret)
> > +             return ret;
> >
> > -     return i2c_smbus_write_byte_data(data->client, MPL3115_CTRL_REG1,
> > -             data->ctrl_reg1);
> > +     return devm_iio_device_register(&client->dev, indio_dev);
> >  }
> >
> >  static DEFINE_SIMPLE_DEV_PM_OPS(mpl3115_pm_ops, mpl3115_suspend,
> > @@ -801,7 +799,6 @@ static struct i2c_driver mpl3115_driver =3D {
> >               .pm     =3D pm_sleep_ptr(&mpl3115_pm_ops),
> >       },
> >       .probe =3D mpl3115_probe,
> > -     .remove =3D mpl3115_remove,
> >       .id_table =3D mpl3115_id,
> >  };
> >  module_i2c_driver(mpl3115_driver);
>
