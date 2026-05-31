Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A5D367B96
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 31 May 2026 11:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780225732; cv=pass; b=sjLVZlOsdy80Wr/ms3iWZLL4H9cfkGOcVU5zMX0rQ6nRTEAiA7cXchSsPKfKJKCVWQFrFpnc/1QzJXanHJRpQGYyw5F/akph8tuXlxJE5MUc+H4NJ8nwqdBFNh/Q+aTIrHhtOA60SZr2lwIOIpwHzgbadR11b11f7LzeQUis/AQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780225732; c=relaxed/simple;
	bh=nu8/JQN0VEd8oe2BFffLTKxC3PetKFWMv325fNt1V+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F7VrbhUHaq1q5x6PsfezejKy0T06FeSxI3HtsPDP6PUJB4exoNDP9QaAY8gnzxx0hrNGyZGR9fKBe0rsYi+QFrTh5H3v9Qoja5/QApeM8bFGLyJiG1DsETHTJ80YrKESQyhHITy81+ioHB4MyKPutSteqHO46psVEjx4oTv5594=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=siqM/WTO; arc=pass smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="siqM/WTO"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7e582b3bcaaso13136821a34.3
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 31 May 2026 04:08:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780225730; cv=none;
        d=google.com; s=arc-20240605;
        b=Drtl9ZJaAVolfsVpjG/sAhdaumo8o8HtvH2gyx9a/Xm8QRIRIhPH/KN6YiyzUE949r
         7ebSA0aLXZ8j5yxsgS6J5c+WlLRc7gehM3VzLedLN01R4pem3V/F0IwNg/HLe52CKNbs
         7v4sHiIdiD/Kg0NuylgWUAUs+H6ct+kK6EaECnhVBy60MWti4BEzf/54fvwpsfZ6Lrk/
         hfgPf63n9yZ+8cS8CbmU/C7EzQEoUZl8kTPIXIzBYem4pPKElORVJiBr3NJBIbDFFMSh
         pHoVZW4yrzIvCakw35x/T5Ac2JWEOoLxY1SbrSbtlGLogFizjJqvFkV/XY9zulMbcBDV
         Koyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=REIMmtve57RIIm20E1r4PpT0MYpcGxeBosfS9/0toIQ=;
        fh=nu9ewLCMbJSNlzZoXUaWRgfO+z0tneHEMUn5WpZkv+Y=;
        b=PAeqdr1f/sNdwmdHPUMWl6C20rVReJE0+fdr4G3Hm8ntHhWjoTr4F5BrF2RTwk7X7Y
         rUnsZz4ZnOyTLTrk+8aGKx5wXtan2O8XorvzdqXxu6KWvr/nVRrJ3EkYEL6ENeT1uj6D
         Rphz4UnOzuaIAOl1dRdC+grUtVwxK7nsNLQTA+fO/k61QY7bYq8yMQya0LCxY1s3Q07Y
         zW8l0QnWMi8pSsVqYQIV0IkZH/jozThekXdtpVJ75FWVQWaJGK09WFyGjElVf4i+j6++
         HhxVyIEt6w9QOcQ6GiHxPcVwOdjaZ3lGDBzyBBn8frp33jd3Tu2uEPnTnJ1R2mwkSXkE
         dvrw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780225730; x=1780830530; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=REIMmtve57RIIm20E1r4PpT0MYpcGxeBosfS9/0toIQ=;
        b=siqM/WTOoISXAVEi/b+VRHg6Bhho91lsMhQdsYDEXLnVu5x1OX29Ac4NEpiRFTsUfm
         M77cdlRqCYQh694WiSBKQlM2wJZpChlBQWUKC2GE+Au/62QhCsfiggyeTff+5O/KIGKQ
         p5+AJWERC7aPAV81hFd+fEJkyAIXB6RTyDJX9ZyfBWlrkSR7aXv2obngLlHzwOrwjUmG
         X27j62GpBT3MGvNDxh5ee0u+XCeeaJtDbNHhuu3gFbwiJBS1akrAZS5e5gs1azD26Zdt
         lrS2i1GmbKOzgSF185AzyGnBzIxV89uYstNMUl+SeF73NGspdeogRIb7CbasEttCtriS
         qKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780225730; x=1780830530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=REIMmtve57RIIm20E1r4PpT0MYpcGxeBosfS9/0toIQ=;
        b=rl7w0iVTEI1kWBGzUOyBDLWSRPbUkdDEU5iu8bKb+yYErPLwgFJZzfozUIBp8eQtuF
         bG1t1tga1iytP+x9NTbJqDWL58yrkkFtOmWzJ/7yl/y/2Snqsy9HLinNDbjly508RO4X
         LYfiOmkP7PFyhIAwu600ear/0SMTSqL6Bc7afUf0TWsZ0zYfjAXc41aeB4xVUfgY1S0e
         KPg5MVY7qTEQSfoo8ZINPDW//IMWXVDBuqle8FQbFjl6IhjE/qbNHCDVfnklrhVsTYSc
         +7P+puwJTKJ8I+X7HQfVBxdFw/wdU09ix6y9Uxc8lsYHAnrv8BKERYhGYCKKkHeAE2M7
         JHeQ==
X-Forwarded-Encrypted: i=1; AFNElJ8bA9btaAxUsEMEIR/6K1XWYHjUr59rj04Dl6Oab0+ORfSSyxdjt/cWm4FAUpjTOIrwzSTxDnsgi6s2mL4OZj8cyUzX1A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwjQkvIzYt04QjI+83bLOqhNe/A8K0f1LKqZWiyeCFLrzVNlnWi
	0VdGP3xiRk4tzMveC9ok2+J2T2UAnSCMGhlQ48r/EBdeFVHuIS5/oaGW9GzzZRaQXwYR1+1xK1B
	HexusOa4VQ4vsRnWMK6k9FIC7XbJ30oU=
X-Gm-Gg: Acq92OHo3E+Kq+xxbRAfwEbmYGME+kRM3VZttYkuC+xhPnNU5VIW01ZnBbiJwxiaErG
	jQ7kfrA710TRLm29d1MZdpQOY87ha4jvB6U4oNskvWpTliNpGLX+SeNILxwWJSMWNc0VUjapn0K
	d66XpoIZaIAmTRD/EwtfsPfL42yoiMW92hF4MAfjRW/yaNJtkNb5oEewdgOQ3P2++2yKdLTMDpD
	ilVIlwh7FsBLO9zJHpwpg0KD8FaqQX0LsLE9TrwckposYx16sQQpSqXZpqpW121jiGRqY2izpBE
	xD1vsc/k2q9rHb4mMw0UaTbnpoYp9YC9q9Ax8NAUtdGssnesng==
X-Received: by 2002:a4a:e902:0:b0:69d:ee54:bab9 with SMTP id
 006d021491bc7-69e1007af36mr2646663eaf.0.1780225730325; Sun, 31 May 2026
 04:08:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260530113938.171540-1-suunj1331@gmail.com> <20260530113938.171540-4-suunj1331@gmail.com>
 <20260530163208.698e9b31@jic23-huawei>
In-Reply-To: <20260530163208.698e9b31@jic23-huawei>
From: SeungJu Cheon <suunj1331@gmail.com>
Date: Sun, 31 May 2026 20:08:37 +0900
X-Gm-Features: AVHnY4KBVXe1dqVFd5JjgWGU-_LqtAJqjZnYVbDQwALDbsl-X1DsrtQ7jW5BgxM
Message-ID: <CAGwK=3qrTVMdkwZnSr27McrExMJsbOsDR8xZ5d+eiDksTduRNw@mail.gmail.com>
Subject: Re: [PATCH 3/4] iio: pressure: mpl3115: generalize interrupt pin routing
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, apokusinski01@gmail.com, me@brighamcampbell.com, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jonathan,

On Sat, 30 May 2026 12:32 ... Jonathan Cameron wrote:
> > This avoids incorrect interrupt routing after a suspend/resume
> > cycle where the register may not return to its default state.
>
> Need more information on this. What do you actually mean by not
> return to it's default state? There are a lot of registers in this
> device that affect config - are all the others restored after
> resume?
> I suspect you are actually talking about a soft reboot where the
> driver is reloading. Given there is a reset call just above this
> that should never be an issue.

You're right, that justification doesn't hold. The reset call above
covers the reload case, so the register won't be in an unexpected
state here. I'll drop the suspend/resume reasoning and describe the
change simply as writing CTRL_REG5 explicitly instead of relying on
the power-on default when INT2 is selected.

> > Route both DRDY and FIFO interrupts to the selected pin. The
> > FIFO routing is not yet used but is required by the hardware
> > FIFO support added in the following patch.
>
> Do it in that patch then, not now. By all means introduce a
> local variable that you change in that patch, but don't set
> the fifo bit.

Will do. I'll introduce the ctrl_reg5 local here with only the DRDY
bit and add the FIFO bit in the FIFO patch.

> > +#define MPL3115_CTRL5_INT_CFG_FIFO BIT(6)
>
> Not in this patch.

Right, I'll move that define to the FIFO patch.

> > +     ctrl_reg5 =3D irq_pin =3D=3D MPL3115_IRQ_INT1 ?
> > +         MPL3115_CTRL5_INT_CFG_DRDY | MPL3115_CTRL5_INT_CFG_FIFO : 0;
>
> That's complex enough that I'd prefer it as a simple if / else
> as will be easier to read. Also you are enabling the fifo
> interrupt. That should be in the next patch, not here.

Will switch to a plain if / else and drop the FIFO bit here.

> Oh that's fun. The data sheet has bit 1 as IPOL2 in the compact
> table 49, but PP_OD2 as bits 0 and bit 1 in table 50. If you are
> bored, might be wroth pointing that typo out to them!

Good catch, I hadn't noticed that one.

> > +             ret =3D i2c_smbus_write_byte_data(data->client,
> > +                                             MPL3115_CTRL_REG3,
> > +                                             ipol);
>
>                 ret =3D i2c_smbus_write_byte_data(data->client, MPL3115_C=
TRL_REG3, ipol);
>
> Fine to go a bit long where it helps readability (stay under 100
> chars though!)

Will put it on one line.

Thanks again.

On Sun, May 31, 2026 at 12:32=E2=80=AFAM Jonathan Cameron <jic23@kernel.org=
> wrote:
>
> On Sat, 30 May 2026 20:39:37 +0900
> SeungJu Cheon <suunj1331@gmail.com> wrote:
>
> > Write CTRL_REG5 explicitly for both INT1 and INT2 rather than
> > relying on power-on defaults when INT2 is selected.
> >
> > This avoids incorrect interrupt routing after a suspend/resume
> > cycle where the register may not return to its default state.
>
> Need more information on this.  What do you actually mean by not return
> to it's default state?  There are a lot of registers in this device
> that affect config - are all the others restored after resume?
>
> I suspect you are actually talking about a soft reboot where the
> driver is reloading. Given there is a reset call just above this
> that should never be an issue.
>
> >
> > Route both DRDY and FIFO interrupts to the selected pin. The
> > FIFO routing is not yet used but is required by the hardware
> > FIFO support added in the following patch.
> Do it in that patch then, not now.  By all means introduce a
> local variable that you change in that patch, but don't set
> the fifo bit.
> >
> > Consolidate polarity configuration into a single code path
> > that handles both interrupt pins uniformly.
> >
> > No functional change intended.
> >
> > Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
> > ---
> >  drivers/iio/pressure/mpl3115.c | 33 +++++++++++++++++----------------
> >  1 file changed, 17 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/iio/pressure/mpl3115.c b/drivers/iio/pressure/mpl3=
115.c
> > index 52a3d0d59769..90e83e34ec43 100644
> > --- a/drivers/iio/pressure/mpl3115.c
> > +++ b/drivers/iio/pressure/mpl3115.c
> > @@ -67,6 +67,7 @@
> >  #define MPL3115_CTRL4_INT_EN_TTH BIT(2)
> >
> >  #define MPL3115_CTRL5_INT_CFG_DRDY BIT(7)
> > +#define MPL3115_CTRL5_INT_CFG_FIFO BIT(6)
>
> Not in this patch.
>
> >
> >  static const unsigned int mpl3115_samp_freq_table[][2] =3D {
> >       { 1,      0 },
> > @@ -624,6 +625,7 @@ static int mpl3115_trigger_probe(struct mpl3115_dat=
a *data,
> >  {
> >       struct fwnode_handle *fwnode =3D dev_fwnode(&data->client->dev);
> >       int ret, irq, irq_type, irq_pin =3D MPL3115_IRQ_INT1;
> > +     u8 ctrl_reg5;
> >
> >       irq =3D fwnode_irq_get_byname(fwnode, "INT1");
> >       if (irq < 0) {
> > @@ -634,6 +636,9 @@ static int mpl3115_trigger_probe(struct mpl3115_dat=
a *data,
> >               irq_pin =3D MPL3115_IRQ_INT2;
> >       }
> >
> > +     ctrl_reg5 =3D irq_pin =3D=3D MPL3115_IRQ_INT1 ?
> > +         MPL3115_CTRL5_INT_CFG_DRDY | MPL3115_CTRL5_INT_CFG_FIFO : 0;
>
> That's complex enough that I'd prefer it as a simple if / else
> as will be easier to read.  Also you are enabling the fifo interrupt.
> That should be in the next patch, not here.
>
> > +
> >       irq_type =3D irq_get_trigger_type(irq);
> >       if (irq_type !=3D IRQF_TRIGGER_RISING && irq_type !=3D IRQF_TRIGG=
ER_FALLING)
> >               return -EINVAL;
> > @@ -643,23 +648,19 @@ static int mpl3115_trigger_probe(struct mpl3115_d=
ata *data,
> >       if (ret < 0)
> >               return ret;
> >
> > -     if (irq_pin =3D=3D MPL3115_IRQ_INT1) {
> > -             ret =3D i2c_smbus_write_byte_data(data->client,
> > -                                             MPL3115_CTRL_REG5,
> > -                                             MPL3115_CTRL5_INT_CFG_DRD=
Y);
> > -             if (ret)
> > -                     return ret;
> > +     ret =3D i2c_smbus_write_byte_data(data->client, MPL3115_CTRL_REG5=
,
> > +                                     ctrl_reg5);
> > +     if (ret)
> > +             return ret;
> >
> > -             if (irq_type =3D=3D IRQF_TRIGGER_RISING) {
> > -                     ret =3D i2c_smbus_write_byte_data(data->client,
> > -                                                     MPL3115_CTRL_REG3=
,
> > -                                                     MPL3115_CTRL3_IPO=
L1);
> > -                     if (ret)
> > -                             return ret;
> > -             }
> > -     } else if (irq_type =3D=3D IRQF_TRIGGER_RISING) {
> > -             ret =3D i2c_smbus_write_byte_data(data->client, MPL3115_C=
TRL_REG3,
> > -                                             MPL3115_CTRL3_IPOL2);
> > +     if (irq_type =3D=3D IRQF_TRIGGER_RISING) {
> > +             u8 ipol =3D irq_pin =3D=3D MPL3115_IRQ_INT1 ?
> > +                       MPL3115_CTRL3_IPOL1 :
> > +                       MPL3115_CTRL3_IPOL2;
>
> Oh that's fun. The data sheet has bit 1 as IPOL2 in the compact
> table 49, but PP_OD2 as bits 0 and bit 1 in table 50.  If you are bored,
> might be wroth pointing that typo out to them!
>
> > +
> > +             ret =3D i2c_smbus_write_byte_data(data->client,
> > +                                             MPL3115_CTRL_REG3,
> > +                                             ipol);
>                 ret =3D i2c_smbus_write_byte_data(data->client, MPL3115_C=
TRL_REG3, ipol);
>
> Fine to go a bit long where it helps readability (stay under 100 chars th=
ough!)
>
>
>
> >               if (ret)
> >                       return ret;
> >       }
>
