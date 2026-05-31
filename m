Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116C71EDA0F
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 31 May 2026 10:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780225180; cv=pass; b=rIxBCm1j9/ZHJnqadm7MobiOqCs279InuZrf6JzsQnPKYCmnNOe5MkZ6C53eFrl0gzuXUXHgcAasj8oTfm9S5VZ7hlP5jpTui1HfVchYzWg5F3PnvN3l5CjcjbW4jJTwtvz7X/kcNcmxNcsYBnwUm/t5wCWwjcLHMAofhNIngwM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780225180; c=relaxed/simple;
	bh=VoTyx3reL2C07Vu3UWT12J1PLZzG7OJzx2rPm2qaGts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oNqj0NAc8ByKSGaixy9gSojOAvFCjZItsITt491MJTWSQ4wBr4nyK55jGP8Ydud/i8t+jPmw+9OYwekACDHPgElDAd6rBBt/28/XV9OETtZ24j5BT27eLtICupjDR4wCdc5TPJWpXr7vbFjOp2fZ5iwDmi6KKk3tDsHNqiUZBjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pEj7u83m; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pEj7u83m"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aa68cf03bfso450937e87.0
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 31 May 2026 03:59:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780225177; cv=none;
        d=google.com; s=arc-20240605;
        b=hl5vO4PW9Dm6DoIf2Oqrh9UVYcLIm8zfz8TYpKWF+ZsOUYrfsngkpfs6/frm8cPxq2
         t86fWsNF0BTluumNbCYRxtS1FpyRDv9po5kBBrlZdUMFKeF+sBXPG9vwZrOOiQYJv4oJ
         Y1tEK3+EEuJL66UcPhjSIT68D68BmNOw+3iYS79P6Dm0hlfGHoBLWq1m67kqNVElqbz4
         WH49BcIc5SjctskrTIEKYd4psKFU2JGSIj30RqNgkXiO5Fz0Uq0sTILKurcQBx+bs/Ju
         HVdmIfr/r8NO5CgYuDl1QMIsbR3//gPGj07aLe70tIz5ycXtthvAAIAOcLX4YwkXitbs
         Gk+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K85Mu1v0tp7Z9mGqwWbWUilSbKLPUt4T605BlkDO7L0=;
        fh=+azVD0D7yosYPl6wNehjslVJqTaWzKQEKycRYRIk2LA=;
        b=ilkV5H9SwCLeOdG3VNZJSnAND48TSM5gKczVp19PBYugTI6YrHWDIvcx6r/tajuLz9
         llycwG/zzAyT/JyqtUm2IgHCPwHf+y3EXIKp8jOOOFuyxwIUG8B7YnZQb4A9IGtko4vh
         A1Ou1Fe+6CPCuuCZbRLQb3eBK6q/nbwKvQOrFk0PXBPVBo+IHYqhb4TFfF2jHtJfLf5M
         nKqOtwxt61hunFxqRojtvv1qjc7mrTFJcTDRC1smRi1OXE+FtXcBGVVoaScZyztKtII7
         CMtCiHrsOKtI22g69PzOY0EBPFXzSJkCguLdvJVjVxSZM7ioItu0VLhMEOjfbZ4iMnnZ
         fZvA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780225177; x=1780829977; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K85Mu1v0tp7Z9mGqwWbWUilSbKLPUt4T605BlkDO7L0=;
        b=pEj7u83m4BZG7NQp+KVegVYKZgPlLgokXj+LOUIC15p/LDb77cGjDFQNqrmQidwSJ7
         J4Bg+ai4xQPGi4/S70F3eDTru3weFWgodZaSa11JGTk6t8SAqCY3fCFIV3Xuu1eM1j9h
         hAEequ5ruAwV+Mp6l2uLjEv0BmSQEaZOhTWAbbcma/PS9gv7ODEJOuR2TUBby+F898Vk
         q/RvzVkHIU6OVp54zutYheigu+ojt4ixEQHZMFmfIypjZTmJFDAcadZYAtzcAT/krRJl
         Lcc+eCq/FfgsQ6s34GyoPmKWLWB2mVAwc+qKqT+bT7ks26889vKCrw/KTtoIcSVrvsgD
         +lJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780225177; x=1780829977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K85Mu1v0tp7Z9mGqwWbWUilSbKLPUt4T605BlkDO7L0=;
        b=Uwbn13oD6wkWesznbn0zSg9Hk31+LuQ40KhK0S/AKg53ydN4L4so0LMR+elJZFM5wU
         9/bKg5Tyg3K+S3kpACenebIeLy3HW57hMpgbAIejZUZwarmRiGFe1ri0dFT2Wu3uWbzT
         TZi3dfgqBprKndFWuzvJwbPDz8//W6CHc4jRBZ40PkXRoo5gInGbvJtjaidENW0C3/BE
         NRYb+t1Kfrd55NxtQY6RqkX+3d1vKHCVZnlL6Eg1x2JXSr2qb/NshE7jt76yMHwssBpT
         ITF8nUndsxy3tL9vZbYP2PlQTkQpzM9X6zwQ2tDycIjAuF4WyhtOIsBqHj0yaN2EjfC7
         H9og==
X-Forwarded-Encrypted: i=1; AFNElJ+14NoT4khs0KvwOnq7zvffl6G5t8Zc86oVCbY0tR8Cc5pnZofsyg2Xd+1vlm1lyRefqcJ/POxifTQz+3f1PwBpt/qwSg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwB5q+HtDd13+/fVa+gedJp7R/8+Y2ZiVyKi3o9ngvIC6JGvCCi
	dj7+AaHior6L/JA0f5pUrsAsDyG3Dkx4l55QNnMTFkzUqR9n808KA9QmuJOeIp0ucGUA0elHNBa
	ELszNtv3Hv2YhV2WOVb3poaydYvZBQoM=
X-Gm-Gg: Acq92OFe+jnGrAQkkErbiZnOHG4MTEbmwK/cGvVstvRiPGw/UUbaI8TtgyDJilxIxjb
	EEuJkD/+Bz2db4mAB1tYOD2PBgV4crdMz36S7wvJ4tsW/RkXBRjU+5LnkPFTzbEsFHl6NSIOdns
	8bxbxCSFuKAeKN01qT1FfICifnXT6cCCoOBtdX+62VwSvEl/rRCdwapEo91NtoaR5kFboObTst9
	dbxTBdlSgnEs/xyqDar2+9eXiPfxkizbmf0AtcrmWwj4wTYY7kqKyaXvoRnNiqkBbK8iNEfmVx5
	SG+JpPJlsj/jiG9KmEwZiy/i+liXslZUIm50xqrKCk4rFRqz4A==
X-Received: by 2002:a05:6512:6c4:b0:5aa:67c8:5dcd with SMTP id
 2adb3069b0e04-5aa67c8617amr634532e87.1.1780225177094; Sun, 31 May 2026
 03:59:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260530113938.171540-1-suunj1331@gmail.com> <20260530113938.171540-3-suunj1331@gmail.com>
 <20260530162335.048cfec4@jic23-huawei>
In-Reply-To: <20260530162335.048cfec4@jic23-huawei>
From: SeungJu Cheon <suunj1331@gmail.com>
Date: Sun, 31 May 2026 19:59:25 +0900
X-Gm-Features: AVHnY4K7X5KxoCsaYXhOs5fF-DhbM5O2IBFW5Kg4hPhJ-Li7FxeqQ8qLyFlQfTI
Message-ID: <CAGwK=3pEPN3EdLGBbXu2kfp-0MAoxm22n5ZOs=XWPX3WLzfSig@mail.gmail.com>
Subject: Re: [PATCH 2/4] iio: pressure: mpl3115: clean up interrupt handling
 and locking
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, apokusinski01@gmail.com, me@brighamcampbell.com, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jonathan,

On Sat, 30 May 2026 12:23 ... Jonathan Cameron wrote:
> > Return IRQ_NONE instead of IRQ_HANDLED when reading
> > INT_SOURCE fails.
>
> As in previous, wrap to 75 chars for commit messges.

Will rewrap to 75 chars.

> > On shared interrupt lines, returning IRQ_HANDLED after a
> > failed register read may prevent other handlers from being
> > invoked.
>
> From what I recall that is simply not true. Given interrupts might
> occur at same moment, the shared interrupt code calls all handlers
> as it can't tell if how many interrupt sources have signalled an
> interrupt.
> Look more closely at what isn't invoked (hint it's about when things
> go wrong!)
> Also, doesn't look to me like this driver supports sharing of the
> interrupt anyway.

You're right, the shared-handler rationale is wrong, and this driver
doesn't share the interrupt anyway. That's a better rationale. I'll
rework the commit message around the spurious-interrupt accounting
aspect rather than shared interrupt handling.

> > Switch the trigger handler from explicit mutex_lock/unlock
> > to scoped_guard() for consistency with the locking style
> > used elsewhere in the driver.
>
> I'm a little dubious about the value of scoped_guard() for such
> simple cases but I guess it is harmless. As Andy called out though,
> different type of change, different patch.
> Hmm. Actually do it by pushing the lock down into the function
> called instead and there you can use a guard(). [...]
> So put it in mpl3115_fill_trig_buffer().

Good idea. I'll move the locking into mpl3115_fill_trig_buffer() with
a guard() so the scope sits next to the accesses it protects, and put
that in its own patch.

> > Move mpl3115_config_interrupt() above the interrupt handler
> > in preparation for the FIFO support added in a subsequent
> > patch.
>
> Separate patch as moving and doing other things just makes for
> harder to review code.

Agreed, I'll split the move into its own patch.

> > No functional change intended.
>
> Except for the one you call out above.

Right. I'll drop that line; the IRQ_NONE change moves to its own
patch and will be described there.

Thanks for the detailed review.

On Sun, May 31, 2026 at 12:23=E2=80=AFAM Jonathan Cameron <jic23@kernel.org=
> wrote:
>
> On Sat, 30 May 2026 20:39:36 +0900
> SeungJu Cheon <suunj1331@gmail.com> wrote:
>
> > Return IRQ_NONE instead of IRQ_HANDLED when reading
> > INT_SOURCE fails.
>
> As in previous, wrap to 75 chars for commit messges.
>
> >
> > On shared interrupt lines, returning IRQ_HANDLED after a
> > failed register read may prevent other handlers from being
> > invoked.
>
> From what I recall that is simply not true.  Given interrupts might occur
> at same moment, the shared interrupt code calls all handlers as it can't
> tell if how many interrupt sources have signalled an interrupt.
>
> Look more closely at what isn't invoked (hint it's about when things
> go wrong!)
>
> Also, doesn't look to me like this driver supports sharing of the interru=
pt
> anyway.
>
>
> >
> > Switch the trigger handler from explicit mutex_lock/unlock
> > to scoped_guard() for consistency with the locking style
> > used elsewhere in the driver.
>
> I'm a little dubious about the value of scoped_guard() for such simple
> cases but I guess it is harmless.  As Andy called out though, different
> type of change, different patch.
>
> Hmm. Actually do it by pushing the lock down into the function called
> instead and there you can use a guard(). Has the added advantage of makin=
g
> the exact scope of the locking visible next to the calls in it.
> So put it in mpl3115_fill_trig_buffer().
>
> >
> > Move mpl3115_config_interrupt() above the interrupt handler
> > in preparation for the FIFO support added in a subsequent
> > patch.
>
> Separate patch as moving and doing other things just makes for harder
> to review code.
>
> >
> > No functional change intended.
>
> Except for the one you call out above.
>
> >
> > Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
> > ---
> >  drivers/iio/pressure/mpl3115.c | 59 +++++++++++++++++-----------------
> >  1 file changed, 29 insertions(+), 30 deletions(-)
> >
> > diff --git a/drivers/iio/pressure/mpl3115.c b/drivers/iio/pressure/mpl3=
115.c
> > index befb6d48efa9..52a3d0d59769 100644
> > --- a/drivers/iio/pressure/mpl3115.c
> > +++ b/drivers/iio/pressure/mpl3115.c
> > @@ -308,9 +308,8 @@ static irqreturn_t mpl3115_trigger_handler(int irq,=
 void *p)
> >       u8 buffer[16] __aligned(8) =3D { };
> >       int ret;
> >
> > -     mutex_lock(&data->lock);
> > -     ret =3D mpl3115_fill_trig_buffer(indio_dev, buffer);
> > -     mutex_unlock(&data->lock);
> > +     scoped_guard(mutex, &data->lock)
> > +             ret =3D mpl3115_fill_trig_buffer(indio_dev, buffer);
> >       if (ret)
> >               goto done;
> >
> > @@ -322,6 +321,32 @@ static irqreturn_t mpl3115_trigger_handler(int irq=
, void *p)
> >       return IRQ_HANDLED;
> >  }
> >
> > +static int mpl3115_config_interrupt(struct mpl3115_data *data,
> > +                                 u8 ctrl_reg1, u8 ctrl_reg4)
> > +{
> > +     int ret;
> > +
> > +     ret =3D i2c_smbus_write_byte_data(data->client, MPL3115_CTRL_REG1=
,
> > +                                     ctrl_reg1);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     ret =3D i2c_smbus_write_byte_data(data->client, MPL3115_CTRL_REG4=
,
> > +                                     ctrl_reg4);
> > +     if (ret < 0)
> > +             goto reg1_cleanup;
> > +
> > +     data->ctrl_reg1 =3D ctrl_reg1;
> > +     data->ctrl_reg4 =3D ctrl_reg4;
> > +
> > +     return 0;
> > +
> > +reg1_cleanup:
> > +     i2c_smbus_write_byte_data(data->client, MPL3115_CTRL_REG1,
> > +                               data->ctrl_reg1);
> > +     return ret;
> > +}
> > +
> >  static const struct iio_event_spec mpl3115_temp_press_event[] =3D {
> >       {
> >               .type =3D IIO_EV_TYPE_THRESH,
> > @@ -381,7 +406,7 @@ static irqreturn_t mpl3115_interrupt_handler(int ir=
q, void *private)
> >
> >       ret =3D i2c_smbus_read_byte_data(data->client, MPL3115_INT_SOURCE=
);
> >       if (ret < 0)
> > -             return IRQ_HANDLED;
> > +             return IRQ_NONE;
>
> So the fun of error handling in interrupt threads.  Arguably we have no i=
dea
> if it was our interrupt or not if this occurs - which I suspect is the mo=
tivation
> of the author in returning IRQ_HANDLED here (and IRQ_NONE when we did rea=
d but there
> were no interrupts).
>
> I think IRQ_NONE still makes more sense because if we do have an intermit=
tent fault
> and the state is such that the interrupt will retrigger, then it doesn't =
matter if we
> flag one spurious interrupt.
>
>
> >
> >       if (!(ret & (MPL3115_INT_SRC_TTH | MPL3115_INT_SRC_PTH |
> >                    MPL3115_INT_SRC_DRDY)))
> > @@ -420,32 +445,6 @@ static irqreturn_t mpl3115_interrupt_handler(int i=
rq, void *private)
> >       return IRQ_HANDLED;
> >  }
> >
> > -static int mpl3115_config_interrupt(struct mpl3115_data *data,
> > -                                 u8 ctrl_reg1, u8 ctrl_reg4)
> > -{
> > -     int ret;
> > -
> > -     ret =3D i2c_smbus_write_byte_data(data->client, MPL3115_CTRL_REG1=
,
> > -                                     ctrl_reg1);
> > -     if (ret < 0)
> > -             return ret;
> > -
> > -     ret =3D i2c_smbus_write_byte_data(data->client, MPL3115_CTRL_REG4=
,
> > -                                     ctrl_reg4);
> > -     if (ret < 0)
> > -             goto reg1_cleanup;
> > -
> > -     data->ctrl_reg1 =3D ctrl_reg1;
> > -     data->ctrl_reg4 =3D ctrl_reg4;
> > -
> > -     return 0;
> > -
> > -reg1_cleanup:
> > -     i2c_smbus_write_byte_data(data->client, MPL3115_CTRL_REG1,
> > -                               data->ctrl_reg1);
> > -     return ret;
> > -}
> > -
> >  static int mpl3115_set_trigger_state(struct iio_trigger *trig, bool st=
ate)
> >  {
> >       struct iio_dev *indio_dev =3D iio_trigger_get_drvdata(trig);
>
