Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B320344046
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 12 Aug 2026 00:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786494483; cv=pass; b=sQqAh2zF/3udmld43OBvjxpSzdlXq5bxiHpWW4L5HR7CiWoEAtXtEYe7PHSz/qSvMgFLODXNqfJ+83LSlxldZGccKrmGneXUs1NHfWFiJmeBYz3lGhamx/hsYzkiNqDZDAxVITfDif9bONLEJcJjoDMezFwzXvxSqQvKgoQK2m0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786494483; c=relaxed/simple;
	bh=+JgNRNBkf60JMVffSFUoCrJ3+9DhZgArNWR3kOAdN9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MLivKQt6ncTxGpU52eHBM4EJfDurEq7w9+eHJh5fAVSdKYUZGmUL2bG5bKaNCX0yoaP420bNM+f0OQLysPstFrih43S1Z4+2TZiwl3MArDaYCUcCfxnYKnfuGhldkGFmpWhX0XYxU2mtbUqGvlPQCKIaqbzObk6ORGcrLZWCAMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HlRzih+K; arc=pass smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HlRzih+K"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6ae8445b7b6so255777eaf.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Aug 2026 17:28:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786494481; cv=none;
        d=google.com; s=arc-20260327;
        b=LyQ/AUS7gXyTc+olTVfPZ6gAQdUSVFc7QnAy5ubykcO2cgc7/KfW73NTvk/H3ZksBJ
         Qy4JQtMyEAhjHQxF3VN9QGXHp9raA5+v3TbK/zTxbuweB4JoYTMU1/Ju160jnhx3Wj6w
         +U+f+bYQQJeCZS2Dag3NsNa8ir67rbzWgLyca7W8iEh9uFGfkQyy6QwWoxkK6B7ULtlP
         TYpjScM7/Kj5J/mq8w4o8lVKAqIcTSPX8xDPRwAG7/NfJjEoApYtzMeN1gHhIPxLQXml
         jZSocF3M0sVCvhPaBRuAXDDyC2JrQwoqhGXSEkjZU6HQTs9B9XmEK+64qGLs3BRU0fSM
         0d6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qw2zwg+o/gZss24iD7MLCp5/9hkX+uS6rkkY++7o8iI=;
        fh=DZtQ8CvOEECRMAK7/IM5i9KS0k7RrVBex34R0hjz1VE=;
        b=jc62TdqlnXtADgctPImseR7YLUrUXHSxNwzEd4/vhx6SA5UXghWLC59gkNEOoRG1KW
         cnBpPruvqoVwBQ/SdByob5Nwe/YFpaCQnVq36Qy+RwWf09wNL+xnw+3jsMzko0fxciHN
         vhNBoEQQpi285Foi63zT/9mQH+EP2dcPFIaJJZVOwRSf/JcPf+jh28Zmfz5vfo0/A4vW
         PTVkjVwSqwKOBSCRLbWFNmdwG5eGz6+yfa33gU9fZxF3wSiVixYnlwTPT15OJYEKPc9c
         Mrw1FNp3zVFSIXMcl3wlEXatlsvcEIqGFJYsqGuA10kVCcnHLaz7YJFy4vk53MwH3dOn
         Pg2w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786494481; x=1787099281; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qw2zwg+o/gZss24iD7MLCp5/9hkX+uS6rkkY++7o8iI=;
        b=HlRzih+Kd1psrGnFKobbLe4mZEMfRJ+4cod9aTHqlLeAXlO+jtb1r9kpBQ+KT1nLZk
         a//Nd279SsOlxCN8x1vJcb3VmClyH18VtMw2ndPcCGQxyhO+ZxIWm8YUjeOpVaXi6K4X
         AqN7W0jqIJCKFiPhCcZ8+iBDLsebsJG4AWoalWmEjq+zocr9ldic2DThCVqAw1a331DQ
         5nM+jF7D9QA1yPLi0zgcOtpuKoKRjoHYWDjCbFV6Fl0AKGUHXA99ex+qDTZLqL7xJseV
         NIM8x4dcSgGgTQfhz+a//TzR34JxV7Efglqk9nT4t9Nso1yMayww0uSA1ZFwRo3CvKNF
         7z4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786494481; x=1787099281;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qw2zwg+o/gZss24iD7MLCp5/9hkX+uS6rkkY++7o8iI=;
        b=Ax3GQJhm4qlv1PhY6DXJ4WVCo/V4weVoFkXWsgn6H59kURPtr4RQszTZ0csLllE86J
         Tj7+KEauhHcSPevqfHYIle7EwKynqxAb4fMXi9dEaEWhhS+Elg7IJMc0iXz2J7yMlgEZ
         NtLX5Q5hKOGxI29w9HGEzZjJYqHVNWGY7AXE93lk4sjHyL4STWk5boQRT1W0lEdLEUW+
         t98eZ8wYrQFDlAiZwfMBEPO9T4+8DgsPlfax8OLOO5YgTsmgKF+4hpi41glPwjRodvwd
         3JftBLYcCVVp7BlNpTQyFc74VYjKb1ljdIcvUIFjf6qgatPbJoYV2ErhWO+KoIfBHByz
         RBIQ==
X-Forwarded-Encrypted: i=1; AHgh+RqIyghAdivjWosNxmDvluaQKBWHqN3KjGuoSZnDJgyiMQICoqABH7oiwQVDByKbaiMbcy6haEw3hO2r86tT7eFEMQo5uA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxDwuMnX7wK/UIirWhcJW09Ses8fvKnbI4bu33g9QCU6GiugJTR
	8fD4KXT91cD2nFrdJ2niPhBAKzTPcuJxsivNJkk+xnaEM+tT2EY9hYPpsChsugQGLAU9r2UwPiX
	O0Y/zfLz73eZTIXN/rpUrAa3vBSAsqNo=
X-Gm-Gg: AR+sD12AQxMbiWxqxEYSNhdKs64bKSVpD0xHT63IG9LuYavdmiTmk1vKCCVD8Y6oiVC
	AWp1eF32/6VSwkETQ0++N5S4vFXNphNLlkdPM3UFOVeTnGt9DhYCL8Cor0fdI24eo9mX2Peqt4S
	m7pRwVF77wXQZs5DIaEWvtmgQjEzsmPmMGPdA7FghmpfQ+1Tr0fUlxDjxfoiEXKTnqp5oG+rSVA
	DTFWyNiSfePNmiEAig3BjuevayL/4/Q4Rn/bi31jbredxAN6ANByk8bb5fUNy2mmKH8bbZETCh7
	VT7TFqVtOi0jSc981Gd7//shw8l1Pcjax6+YGGzP+LhmpwfjYFw6Zg==
X-Received: by 2002:a05:6820:3097:b0:6b0:4bde:6da0 with SMTP id
 006d021491bc7-6b0b2640bd5mr873946eaf.11.1786494480703; Tue, 11 Aug 2026
 17:28:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260808090026.34187-1-adinata.softwareengineer@gmail.com>
 <20260808090026.34187-2-adinata.softwareengineer@gmail.com> <20260810010943.014d8db1@jic23-huawei>
In-Reply-To: <20260810010943.014d8db1@jic23-huawei>
From: Adi <adinata.softwareengineer@gmail.com>
Date: Wed, 12 Aug 2026 08:27:47 +0800
X-Gm-Features: AUfX_my5rP-vWsBc5c_enw8aTunBjIjRDIHSmVM9cuiADLHv-38CXJuQQFwHqbk
Message-ID: <CABZ6vuCOB1uOU78LZMKriMHGTy6ZgfFq8X5rx-6qwwDj9qGNOA@mail.gmail.com>
Subject: Re: [PATCH 1/5] iio: humidity: hts221: report available values via read_avail()
To: Jonathan Cameron <jic23@kernel.org>
Cc: lorenzo@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jonathan,

Thanks for the feedback. I have checked with what Sachiko is saying is corr=
ect.
The custom attribute was in_humidity_oversampling_ratio_available while
the current on is in_humidityrelative_oversampling_ratio_available because =
in
industrial_core.c only has [IIO_HUMIDITYRELATIVE] =3D "humidityrelative".

For this humidity case in particular, would it be better to keep the legacy
implementation while adding the new read_avail()?

The other case declaration will remain changed.

> > Replace the custom oversampling_ratio_available sysfs attributes with
> > the standard IIO read_avail() callback. This lets the IIO core create
> > and format *_available attributes and exposes the lists to
> > in-kernel consumers.
>
> Sashiko points out that there is an ABI change in here as oddly
> the driver uses
> in_humidity_oversampling_ratio_available rather than
> in_humidityrelative_oversampling_ratio_available
>
> Which makes this an ABI fix.  Therefore this should have a fixes
> tag and be moved to the start of the set.  Please check that logic
> though as maybe I'm missing something.

Regards,
Adi Nata

On Mon, Aug 10, 2026 at 8:09=E2=80=AFAM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> On Sat,  8 Aug 2026 17:00:22 +0800
> Adi Nata <adinata.softwareengineer@gmail.com> wrote:
>
> > Replace the custom oversampling_ratio_available sysfs attributes with
> > the standard IIO read_avail() callback. This lets the IIO core create
> > and format *_available attributes and exposes the lists to
> > in-kernel consumers.
>
> Sashiko points out that there is an ABI change in here as oddly
> the driver uses
> in_humidity_oversampling_ratio_available rather than
> in_humidityrelative_oversampling_ratio_available
>
> Which makes this an ABI fix.  Therefore this should have a fixes
> tag and be moved to the start of the set.  Please check that logic
> though as maybe I'm missing something.
>
> J
> >
> > Signed-off-by: Adi Nata <adinata.softwareengineer@gmail.com>
> > ---
> >  drivers/iio/humidity/hts221_core.c | 106 +++++++++++------------------
> >  1 file changed, 40 insertions(+), 66 deletions(-)
> >
> > diff --git a/drivers/iio/humidity/hts221_core.c b/drivers/iio/humidity/=
hts221_core.c
> > index bfeb0a60d3af..76a391f421f5 100644
> > --- a/drivers/iio/humidity/hts221_core.c
> > +++ b/drivers/iio/humidity/hts221_core.c
> > @@ -10,7 +10,6 @@
> >  #include <linux/kernel.h>
> >  #include <linux/module.h>
> >  #include <linux/device.h>
> > -#include <linux/iio/sysfs.h>
> >  #include <linux/delay.h>
> >  #include <linux/pm.h>
> >  #include <linux/regmap.h>
> > @@ -49,7 +48,7 @@ struct hts221_odr {
> >  struct hts221_avg {
> >       u8 addr;
> >       u8 mask;
> > -     u16 avg_avl[HTS221_AVG_DEPTH];
> > +     int avg_avl[HTS221_AVG_DEPTH];
> >  };
> >
> >  static const struct hts221_odr hts221_odr_table[] =3D {
> > @@ -58,6 +57,8 @@ static const struct hts221_odr hts221_odr_table[] =3D=
 {
> >       { 13, 0x03 },   /* 12.5Hz */
> >  };
> >
> > +static const int hts221_odr_avail[] =3D { 1, 7, 13 };
> > +
> >  static const struct hts221_avg hts221_avg_list[] =3D {
> >       {
> >               .addr =3D 0x10,
> > @@ -97,7 +98,11 @@ static const struct iio_chan_spec hts221_channels[] =
=3D {
> >                                     BIT(IIO_CHAN_INFO_OFFSET) |
> >                                     BIT(IIO_CHAN_INFO_SCALE) |
> >                                     BIT(IIO_CHAN_INFO_OVERSAMPLING_RATI=
O),
> > +             .info_mask_separate_available =3D
> > +                             BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO),
> >               .info_mask_shared_by_all =3D BIT(IIO_CHAN_INFO_SAMP_FREQ)=
,
> > +             .info_mask_shared_by_all_available =3D
> > +                             BIT(IIO_CHAN_INFO_SAMP_FREQ),
> >               .scan_index =3D 0,
> >               .scan_type =3D {
> >                       .sign =3D 's',
> > @@ -113,7 +118,11 @@ static const struct iio_chan_spec hts221_channels[=
] =3D {
> >                                     BIT(IIO_CHAN_INFO_OFFSET) |
> >                                     BIT(IIO_CHAN_INFO_SCALE) |
> >                                     BIT(IIO_CHAN_INFO_OVERSAMPLING_RATI=
O),
> > +             .info_mask_separate_available =3D
> > +                             BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO),
> >               .info_mask_shared_by_all =3D BIT(IIO_CHAN_INFO_SAMP_FREQ)=
,
> > +             .info_mask_shared_by_all_available =3D
> > +                             BIT(IIO_CHAN_INFO_SAMP_FREQ),
> >               .scan_index =3D 1,
> >               .scan_type =3D {
> >                       .sign =3D 's',
> > @@ -192,53 +201,35 @@ static int hts221_update_avg(struct hts221_hw *hw=
,
> >       return 0;
> >  }
> >
> > -static ssize_t hts221_sysfs_sampling_freq(struct device *dev,
> > -                                       struct device_attribute *attr,
> > -                                       char *buf)
> > -{
> > -     int i;
> > -     ssize_t len =3D 0;
> > -
> > -     for (i =3D 0; i < ARRAY_SIZE(hts221_odr_table); i++)
> > -             len +=3D scnprintf(buf + len, PAGE_SIZE - len, "%d ",
> > -                              hts221_odr_table[i].hz);
> > -     buf[len - 1] =3D '\n';
> > -
> > -     return len;
> > -}
> > -
> > -static ssize_t
> > -hts221_sysfs_rh_oversampling_avail(struct device *dev,
> > -                                struct device_attribute *attr,
> > -                                char *buf)
> > -{
> > -     const struct hts221_avg *avg =3D &hts221_avg_list[HTS221_SENSOR_H=
];
> > -     ssize_t len =3D 0;
> > -     int i;
> > -
> > -     for (i =3D 0; i < ARRAY_SIZE(avg->avg_avl); i++)
> > -             len +=3D scnprintf(buf + len, PAGE_SIZE - len, "%d ",
> > -                              avg->avg_avl[i]);
> > -     buf[len - 1] =3D '\n';
> > -
> > -     return len;
> > -}
> > -
> > -static ssize_t
> > -hts221_sysfs_temp_oversampling_avail(struct device *dev,
> > -                                  struct device_attribute *attr,
> > -                                  char *buf)
> > +static int hts221_read_avail(struct iio_dev *indio_dev,
> > +                          struct iio_chan_spec const *chan,
> > +                          const int **vals, int *type, int *length,
> > +                          long mask)
> >  {
> > -     const struct hts221_avg *avg =3D &hts221_avg_list[HTS221_SENSOR_T=
];
> > -     ssize_t len =3D 0;
> > -     int i;
> > -
> > -     for (i =3D 0; i < ARRAY_SIZE(avg->avg_avl); i++)
> > -             len +=3D scnprintf(buf + len, PAGE_SIZE - len, "%d ",
> > -                              avg->avg_avl[i]);
> > -     buf[len - 1] =3D '\n';
> > -
> > -     return len;
> > +     switch (mask) {
> > +     case IIO_CHAN_INFO_OVERSAMPLING_RATIO:
> > +             switch (chan->type) {
> > +             case IIO_HUMIDITYRELATIVE:
> > +                     *vals =3D hts221_avg_list[HTS221_SENSOR_H].avg_av=
l;
> > +                     *length =3D ARRAY_SIZE(hts221_avg_list[HTS221_SEN=
SOR_H].avg_avl);
> > +                     break;
> > +             case IIO_TEMP:
> > +                     *vals =3D hts221_avg_list[HTS221_SENSOR_T].avg_av=
l;
> > +                     *length =3D ARRAY_SIZE(hts221_avg_list[HTS221_SEN=
SOR_T].avg_avl);
> > +                     break;
> > +             default:
> > +                     return -EINVAL;
> > +             }
> > +             *type =3D IIO_VAL_INT;
> > +             return IIO_AVAIL_LIST;
> > +     case IIO_CHAN_INFO_SAMP_FREQ:
> > +             *vals =3D hts221_odr_avail;
> > +             *type =3D IIO_VAL_INT;
> > +             *length =3D ARRAY_SIZE(hts221_odr_avail);
> > +             return IIO_AVAIL_LIST;
> > +     default:
> > +             return -EINVAL;
> > +     }
> >  }
> >
> >  int hts221_set_enable(struct hts221_hw *hw, bool enable)
> > @@ -521,27 +512,10 @@ static int hts221_validate_trigger(struct iio_dev=
 *iio_dev,
> >       return hw->trig =3D=3D trig ? 0 : -EINVAL;
> >  }
> >
> > -static IIO_DEVICE_ATTR(in_humidity_oversampling_ratio_available, S_IRU=
GO,
> > -                    hts221_sysfs_rh_oversampling_avail, NULL, 0);
> > -static IIO_DEVICE_ATTR(in_temp_oversampling_ratio_available, S_IRUGO,
> > -                    hts221_sysfs_temp_oversampling_avail, NULL, 0);
> > -static IIO_DEV_ATTR_SAMP_FREQ_AVAIL(hts221_sysfs_sampling_freq);
> > -
> > -static struct attribute *hts221_attributes[] =3D {
> > -     &iio_dev_attr_sampling_frequency_available.dev_attr.attr,
> > -     &iio_dev_attr_in_humidity_oversampling_ratio_available.dev_attr.a=
ttr,
> > -     &iio_dev_attr_in_temp_oversampling_ratio_available.dev_attr.attr,
> > -     NULL,
> > -};
> > -
> > -static const struct attribute_group hts221_attribute_group =3D {
> > -     .attrs =3D hts221_attributes,
> > -};
> > -
> >  static const struct iio_info hts221_info =3D {
> > -     .attrs =3D &hts221_attribute_group,
> >       .read_raw =3D hts221_read_raw,
> >       .write_raw =3D hts221_write_raw,
> > +     .read_avail =3D hts221_read_avail,
> >       .validate_trigger =3D hts221_validate_trigger,
> >  };
> >
>
