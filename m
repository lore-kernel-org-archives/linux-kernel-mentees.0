Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678F6387563
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 31 May 2026 12:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780231147; cv=pass; b=A+QsBjeDf+wEZBZgoCaQXubiHVB+g5UtfmRaEHwD/IbLg4D6RayiTqNneFdm1cgR24cpo+/lJYl26KMcjVNqV697heVXNOR5KPZoOk7YO9VHg73Evg+J9oGLpMax64DR0yKJIHHGZCmbwr1GYmYjpKjP4JtBUJV+U2AHsg8H7Ts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780231147; c=relaxed/simple;
	bh=2OZDPXFYs4jiJNgdp1ffT7ShDq56e80aP32Ung71qqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FuHPhTrWU06nSBKi2fdtAj0mXbeG6RR0ka7ki5bd7/BqU+GNlEPi6qTP8D44CflWTFBUVJFw/QmJjB8VyPltKjo1uc9pj5EEz9pLVLe9PreeDRc2uj+axPu3v0ucXlvUAqET+PfqvejhyfQDiRCne+gqIN8gSsE2dGNp+bbyRYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h1qs/Nhx; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h1qs/Nhx"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aa612bf6efso1272918e87.3
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 31 May 2026 05:39:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780231143; cv=none;
        d=google.com; s=arc-20240605;
        b=h4RaX/suvHWoFaaMe3KcJGUDE9l2TOJnQMdHZ50DuYLd8dNZtzZcme+ILm/qdnnqut
         uY8pGwlpYG526ZRMqCggCqK2S/jvQYqhyl+E+c9hDp2p7PzZE8k8xWWalHmZcRhhgCIs
         n4ecOoTFzhgUPKbaAKBSVgf6vYlki15eWQDNQSxpfXvI6wCQV9nWyyt4lmwM0mX49HaF
         Kg+TA4uAoP1K/H2GaV0sctyEvPcCiV1mjQLdgqMEre+80YLsEDTuZqsLRowvEgTdWmXX
         xnBDWDPnNNdyhlczpv4x8FZEdCpkddN4yhuuqjKGfRgGvDWUD1vAQVYUYTpPqmtjmRGR
         0kfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ehfLg/8cA5jYFyJ8eK7zstuVr331pF3pCUVEUtMzQak=;
        fh=LU5Cq4yWofmH0t+DLBcIsHG78/IgOWOw76UQDtPb/c8=;
        b=hlIg0MzdwRsslo3TI2kbTMQznSWmufS2F1Fc1xJ2a9QZUewUKIEOFmbo5Qbk9qJ2ZW
         YD8lKV5eeblzbm7KA6wDsA0v/SpTaJUxh2OhG2M32kPTCtp8itbYRRwbopInCFhA6qnR
         p4uW1lJ7UTipopxR/j1sFRM7Frdha1/hzGxBGKdIm/01AoC0xUIV/tU+tHK/fsTS6olS
         gqWfosGmH+bw3ByPpHEErJcoU/FG9w1yhuLNNmpHCsn6KD+SlRwjJr5xTZD+KPcPFRmU
         Hw4kkw33oY+V/+80Py3QUYzItXHhzB//VtrlGbyEiYP1oxGLVYZAEXeitgL5g6H1tCnt
         NNbw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780231143; x=1780835943; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ehfLg/8cA5jYFyJ8eK7zstuVr331pF3pCUVEUtMzQak=;
        b=h1qs/NhxQ1YxE9dtWzoxikJwmErSUNNB+u1SYpGUcKOaKjBx0/FCwiFbBPg1AkqD+N
         Ul3zpLcMQQRcrS5ETbyL3cz9JiNpCQpvq+fOJJlJ8tJtvU9TOhFN2UN+ucPhMLQZ425C
         C6M4W2QmqTbXXZFvKuHK4i8y0xfrfrUpy0/sI06l8CwkVq7DOuG4LPv4MhHXqKf6it3+
         460BM5IWUFOLsD96rZllN43kl5IpZXA/lDKBX6GXEGkWbqBTKE8YFg4AFN4KpVoNAScK
         GRqReYK/5rkii4CRLr56hEpMwZoNp1B/J3TmfasjhqehN5wzVhn2Tbzu7tUmINfgHPXx
         krIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780231143; x=1780835943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ehfLg/8cA5jYFyJ8eK7zstuVr331pF3pCUVEUtMzQak=;
        b=Z/uBupYzobm5CliRbz5mQOL1sLk89X9beSNpfzPEid3Hk5nhgvawqVx+he/ItpON1x
         QH8ee5un7c8t9pgjiVbI52i2T4OkiJCcvhuv/wgnLtGzb8R38Xeahfc7t+zjOZmMRXno
         2Ty0EM/JT+4r/hLxfbhaCCulr0M+mO1EdkoohkhfdbMqlg1svd9ImmB9f9A8dI1R7mmR
         dgexI/oavZ56HAp3Q6HJRn+i8oZGievC0v/RCPQVp+RUi2YppSE/KRy/B5ci8kTv2hzj
         3sKEYoo/n3GdlyI2Uc3vR3gmi2zqtyWpD9+mmoiPmbPDJz+y1x9+QYHvLc/3XFoqJokO
         1JiQ==
X-Forwarded-Encrypted: i=1; AFNElJ9MfERi61cDxLw+1M95S8fOgD5ZZoC0OujkC6tGryfvjbhEjtX4fewiwy7NobtgS319Dkkwt9M5kovFolICP6lzQsp/1Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzyBMcCWebxQxV0VynmIBA5Rq4t3hIFxIDe8ZE6cUnKDcggfaoO
	z7+O+bCex9ARPpHkm/PKyUfhQpINfawtYuDnVraCTX4iNwlQ2LNkq/9gCiOSFdHOfUbAaab34V2
	4Axt+T23xL9mgIAthHvFG2kMLQtM8SeE=
X-Gm-Gg: Acq92OG6OqpSWGDENQPqj9vrf1NvKGZxylariiRrtoJbJCUcZ25DDAMZ0melAm/Dat2
	tuduWf54vuRx6ID3tzbCShZs2g9OqufTD6nV8YwHqt2kuNWYqCYopccJdCSQUFaVhO+wvEgX8NG
	Xo9EgvMswytO3xOh2y3JNA8sUawisMJwN1bbhZ1ITWCSZhPP99a+8Oau2np/++bAUQJ6z1zwPWW
	LpCMTvix1pAh8a6nrhYP2awdqcJj0Z/i1Rwo/5U9YbIGuc5LF1TrDLSsBxtl2BxkIh1RcpDwWUh
	jjCK3DKQOCbc9Swmm9Ks0wGAwRJU1UL5vkvrRV6BqVzy+L2F2w==
X-Received: by 2002:a05:6512:150f:10b0:5a8:9988:f1d5 with SMTP id
 2adb3069b0e04-5aa608f7f43mr1472189e87.24.1780231142164; Sun, 31 May 2026
 05:39:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260530113938.171540-1-suunj1331@gmail.com> <20260530113938.171540-5-suunj1331@gmail.com>
 <20260530170534.11f8e7f7@jic23-huawei>
In-Reply-To: <20260530170534.11f8e7f7@jic23-huawei>
From: SeungJu Cheon <suunj1331@gmail.com>
Date: Sun, 31 May 2026 21:38:48 +0900
X-Gm-Features: AVHnY4IA1OzfOKzo1cwWjda6xbVuzhJ-g0PyjwMkraZvEoCXPsDVsKaEk64TfcI
Message-ID: <CAGwK=3qU2VsgoSAtC7+LFps-qG4Yrjsdw=AWxJ0cpzt7EymHiQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] iio: pressure: mpl3115: add hardware FIFO support
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, apokusinski01@gmail.com, me@brighamcampbell.com, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jonathan,

On Sat, 30 May 2026 01:05 ... Jonathan Cameron wrote:
> Note that even though you've had a couple of quick reviews wait at
> least a few days / 1 week to see if others have review comments
> before doing a new version.

Will do. I'll hold v2 for a week or so to let any further comments
come in.

> > +#define MPL3115_FIFO_SAMPLES_PER_READ 6U
>
> comment on why 6.

Will add a comment explaining the 6.

> > +     return i2c_smbus_write_byte_data(data->client, MPL3115_F_SETUP,
> > +                     f_setup);
>
> Align after ( Or just go a bit long and put it one line.

Will put it on one line.

> > +     while (remaining > 0) {
>
> Don't think this can got negative. I'd make that explicit as !=3D 0

Will change to !=3D 0.

> > +             ret =3D i2c_smbus_read_i2c_block_data(data->client,
> > [...]
>
> Given this is reading up to 6 samples, it feels odd to just keep
> reading without pushing any of them to the buffer. I'd rework the
> logic so for each iteration of the fifo we push the data we have.
> That will reduce the storage requirement quite a bit.

Good point. I'll push samples as I read each batch instead of
buffering them all first, which also shrinks fifo_buf considerably.

> > +     u8 buffer[MPL3115_BUF_SIZE] __aligned(sizeof(s64)) =3D { };
>
> This is only used in the loop below. Declare it down there with
> an appropriate struct (see reply I sent to Andy's review)

Will move it into the loop as a struct with __be32/__be16 fields and
an aligned s64 timestamp.

> > +     unsigned int sample_count, i;
> > +     int ret;
> > +     bool overflow;
> > +     s64 ts;
>
> When no other reason for ordering, reverse xmas tree preferred in
> IIO.

Will reorder.

> > +     if (sample_count =3D=3D 0)
>
> Add a comment on what overflow with no samples means. That seems
> unusual.

Will add a comment for the overflow-with-no-samples case.

> > +     ts =3D iio_get_time_ns(indio_dev);
>
> This data is coming from a fifo. How is the time grabbed here
> relevant?
> Timestamp + fifo handling is hard. See how the invensense IMU
> drivers do it. For 1st version of this you may have to just fail the
> buffer enable if the timestamp is turned on. I'd revisit timestamps
> after the rest is upstream (or at least as additional patches).

Agreed, stamping FIFO samples with the current time isn't ideal. For
v2 I'll reject buffer enable if the timestamp channel is on, and leave
proper FIFO timestamping (along the lines of the invensense drivers)
to a follow-up once the rest is in.

> Maybe worth introducing an enum for those bits (use in the
> iio_chan_spec array elements as well)
> > +     0,
> No comma (Andy got this already)

Will drop the comma and introduce an enum for the scan indices, reused
in the channel specs.

> > +             if (flush_ret < 0)
> > +                     goto err_reset_fifo;
> > [...]
> > +err_reset_fifo:
> > +     scoped_guard(mutex, &data->lock)
>
> So this is technically not a bug but it runs into the basic argument
> that if you are using automatic cleanup you shouldn't be using gotos
> in the same function [...]
> Hmm. This is trickier given fifo_reset is called in fifo_flush.
> Maybe a wrapper and guard() The none guard version would typically
> use __mpl3115_fifo_reset() naming.

Makes sense. I'll push the locking into the functions and use guard()
there, with a __mpl3115_fifo_reset() helper for the already-locked
caller, so the handler no longer mixes scoped_guard() with a goto.

> It's hard to retrofit a fifo and not end up with a weird control
> interface. We can't remove the triggered buffer because that will be
> a regression for existing users.
> So the trick we have done in the past is to enable the fifo whenever
> a trigger is not set, but the buffer enabled.
> [...]
> Do this unconditionally. It will register a kfifo so we can use that
> anyway, but will also have the interface we can't remove [...]

Understood. I'll drop the use_fifo gating and keep the triggered
buffer registration unconditional, then select the FIFO path from
postenable when no trigger is configured. I'll try option (A) by first
making the triggered capture always read both channels, so the FIFO
path can avoid introducing available_scan_masks.

Thanks very much for the detailed review.

On Sun, May 31, 2026 at 1:05=E2=80=AFAM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> On Sat, 30 May 2026 20:39:38 +0900
> SeungJu Cheon <suunj1331@gmail.com> wrote:
>
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
> >
> > Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
>
> Various comments inline to add to what Andy pointed out.
>
> Note that even though you've had a couple of quick reviews wait at least =
a few
> days / 1 week to see if others have review comments before doing a new ve=
rsion.
> Any discussion will probably have finished by then.
>
> (I can't speak for Andy, but in the UK it's too hot to do much outside
> today - so I'm bored!)
>
> Thanks,
>
> Jonathan
>
> > ---
> >  drivers/iio/pressure/mpl3115.c | 266 +++++++++++++++++++++++++++++++--
> >  1 file changed, 256 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/iio/pressure/mpl3115.c b/drivers/iio/pressure/mpl3=
115.c
> > index 90e83e34ec43..26b6490c8c4c 100644
> > --- a/drivers/iio/pressure/mpl3115.c
> > +++ b/drivers/iio/pressure/mpl3115.c
>
> > +#define MPL3115_BUF_PRESS_OFFSET 0
> > +#define MPL3115_BUF_TEMP_OFFSET 4
> > +#define MPL3115_BUF_TS_OFFSET 8
> > +#define MPL3115_BUF_SIZE (MPL3115_BUF_TS_OFFSET + sizeof(s64))
> > +
> > +#define MPL3115_FIFO_SAMPLES_PER_READ 6U
> comment on why 6.
> > +
> >  #define MPL3115_PT_DATA_EVENT_ALL GENMASK(2, 0)
> >
> >  #define MPL3115_CTRL1_RESET BIT(2) /* software reset */
> > @@ -63,8 +89,12 @@
> >  #define MPL3115_CTRL3_IPOL2 BIT(1)
> >
> >  #define MPL3115_CTRL4_INT_EN_DRDY BIT(7)
> > +#define MPL3115_CTRL4_INT_EN_FIFO BIT(6)
> >  #define MPL3115_CTRL4_INT_EN_PTH BIT(3)
> >  #define MPL3115_CTRL4_INT_EN_TTH BIT(2)
> > +#define MPL3115_CTRL4_ACTIVE_MASK \
> > +     (MPL3115_CTRL4_INT_EN_DRDY | \
> > +      MPL3115_CTRL4_INT_EN_PTH | MPL3115_CTRL4_INT_EN_TTH)
> >
> >  #define MPL3115_CTRL5_INT_CFG_DRDY BIT(7)
> >  #define MPL3115_CTRL5_INT_CFG_FIFO BIT(6)
> > @@ -94,6 +124,9 @@ struct mpl3115_data {
> >       struct mutex lock;
> >       u8 ctrl_reg1;
> >       u8 ctrl_reg4;
> > +     u8 watermark;
> > +     u8 fifo_buf[MPL3115_FIFO_SIZE * MPL3115_FIFO_SAMPLE_SIZE]
> > +             __aligned(IIO_DMA_MINALIGN);
> >  };
> >
> >  enum mpl3115_irq_pin {
> > @@ -101,6 +134,25 @@ enum mpl3115_irq_pin {
> >       MPL3115_IRQ_INT2,
> >  };
> >
> > +static int mpl3115_set_active(struct mpl3115_data *data, bool active)
> > +{
> > +     u8 reg;
> > +     int ret;
> > +
> > +     if (active)
> > +             reg =3D data->ctrl_reg1 | MPL3115_CTRL1_ACTIVE;
> > +     else
> > +             reg =3D data->ctrl_reg1 & ~MPL3115_CTRL1_ACTIVE;
> > +
> > +     ret =3D i2c_smbus_write_byte_data(data->client, MPL3115_CTRL_REG1=
,
> > +                                     reg);
> One line.  Or as Andy suggested split this in two, then the reg local
> variable isn't needed.
>
> > +     if (ret)
> > +             return ret;
> > +
> > +     data->ctrl_reg1 =3D reg;
> > +     return 0;
> > +}
> > +
> >  static int mpl3115_request(struct mpl3115_data *data)
> >  {
> >       int ret, tries =3D 15;
> > @@ -322,6 +374,109 @@ static irqreturn_t mpl3115_trigger_handler(int ir=
q, void *p)
> >       return IRQ_HANDLED;
> >  }
> >
> > +static int mpl3115_set_fifo(struct mpl3115_data *data,
> > +                         enum mpl3115_fifo_mode mode)
> > +{
> > +     u8 f_setup;
> > +
> > +     f_setup =3D FIELD_PREP(MPL3115_F_SETUP_F_MODE, mode) |
> > +               FIELD_PREP(MPL3115_F_SETUP_F_WMRK, data->watermark);
> > +
> > +     return i2c_smbus_write_byte_data(data->client, MPL3115_F_SETUP,
> > +                     f_setup);
>
> Align after (  Or just go a bit long and put it one line.
>
>
> > +}
> > +
> > +static int mpl3115_fifo_reset(struct mpl3115_data *data)
> > +{
> > +     int ret;
> > +
> > +     ret =3D mpl3115_set_fifo(data, MPL3115_F_MODE_DISABLED);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return mpl3115_set_fifo(data, MPL3115_F_MODE_CIRCULAR);
> > +}
> > +
> > +static int mpl3115_fifo_transfer(struct mpl3115_data *data,
> > +                              unsigned int sample_count)
> > +{
> > +     unsigned int remaining =3D sample_count;
> > +     unsigned int offset =3D 0;
> > +     unsigned int batch;
> > +     int ret;
> > +
> > +     while (remaining > 0) {
>
> Don't think this can got negative. I'd make that explicit as !=3D 0
>
> > +             batch =3D min(remaining, MPL3115_FIFO_SAMPLES_PER_READ);
> > +
> > +             ret =3D i2c_smbus_read_i2c_block_data(data->client,
> > +                                                 MPL3115_OUT_PRESS,
> > +                                                 batch * MPL3115_FIFO_=
SAMPLE_SIZE,
> > +                                                 &data->fifo_buf[offse=
t]);
> Given this is reading up to 6 samples, it feels odd to just keep reading =
without
> pushing any of them to the buffer. I'd rework the logic so for each itera=
tion
> of the fifo we push the data we have. That will reduce the storage requir=
ement
> quite a bit.
> > +             if (ret < 0)
> > +                     return ret;
> > +             if (ret !=3D batch * MPL3115_FIFO_SAMPLE_SIZE)
> > +                     return -EIO;
> > +
> > +             offset +=3D batch * MPL3115_FIFO_SAMPLE_SIZE;
> > +             remaining -=3D batch;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int mpl3115_fifo_flush(struct iio_dev *indio_dev)
> > +{
> > +     struct mpl3115_data *data =3D iio_priv(indio_dev);
> > +     u8 buffer[MPL3115_BUF_SIZE] __aligned(sizeof(s64)) =3D { };
>
> This is only used int he loop below. Declare it down there with
> an appropriate struct (see reply I sent to Andy's review)
>
> > +     unsigned int sample_count, i;
> > +     int ret;
> > +     bool overflow;
> > +     s64 ts;
> When no other reason for ordering, reverse xmas tree preferred in IIO.
>
>
> See below. I'd pull the guard() in here.
>
> > +
> > +     ret =3D i2c_smbus_read_byte_data(data->client, MPL3115_F_STATUS);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     overflow =3D FIELD_GET(MPL3115_F_STATUS_F_OVF, ret);
> > +     sample_count =3D FIELD_GET(MPL3115_F_STATUS_F_CNT, ret);
> > +     if (sample_count =3D=3D 0)
>
> Add a comment on what overflow with no samples means. That seems
> unusual.
>
> > +             return overflow ? mpl3115_fifo_reset(data) : 0;
> > +
> > +     ret =3D mpl3115_fifo_transfer(data, sample_count);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ts =3D iio_get_time_ns(indio_dev);
>
> This data is coming from a fifo. How is the time grabbed here relevant?
>
> Timestamp + fifo handling is hard. See how the invensense IMU drivers
> do it.  For 1st version of this you may have to just fail the buffer
> enable if the timestamp is turned on.  I'd revisit timestamps after the
> rest is upstream (or at least as additional patches).
>
> > +     for (i =3D 0; i < sample_count; i++) {
> > +             u8 *sample =3D &data->fifo_buf[i * MPL3115_FIFO_SAMPLE_SI=
ZE];
> > +
> > +             memcpy(&buffer[MPL3115_BUF_PRESS_OFFSET], &sample[0], 3);
> > +             memcpy(&buffer[MPL3115_BUF_TEMP_OFFSET], &sample[3], 2);
> > +
> > +             iio_push_to_buffers_with_ts(indio_dev, buffer, sizeof(buf=
fer), ts);
> > +     }
> > +
> > +     if (overflow) {
> > +             dev_warn_ratelimited(&data->client->dev,
> > +                                  "FIFO overflow, samples may be lost\=
n");
> > +             return mpl3115_fifo_reset(data);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int mpl3115_set_watermark(struct iio_dev *indio_dev, unsigned i=
nt value)
> > +{
> > +     struct mpl3115_data *data =3D iio_priv(indio_dev);
> > +
> > +     value =3D clamp_val(value, 1, MPL3115_FIFO_SIZE - 1);
> > +
> > +     guard(mutex)(&data->lock);
> > +     data->watermark =3D value;
> > +
> > +     return 0;
> > +}
> > +
> >  static int mpl3115_config_interrupt(struct mpl3115_data *data,
> >                                   u8 ctrl_reg1, u8 ctrl_reg4)
> >  {
> > @@ -348,6 +503,67 @@ static int mpl3115_config_interrupt(struct mpl3115=
_data *data,
> >       return ret;
> >  }
> >
> > +static int mpl3115_buffer_postenable(struct iio_dev *indio_dev)
> > +{
> > +     struct mpl3115_data *data =3D iio_priv(indio_dev);
> > +     u8 ctrl_reg4;
> > +     int ret;
> > +
> > +     guard(mutex)(&data->lock);
> > +
> > +     ret =3D mpl3115_set_active(data, false);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D mpl3115_set_fifo(data, MPL3115_F_MODE_CIRCULAR);
> > +     if (ret) {
> > +             mpl3115_set_active(data, true);
> > +             return ret;
> > +     }
> > +
> > +     ctrl_reg4 =3D data->ctrl_reg4;
> > +     ctrl_reg4 |=3D MPL3115_CTRL4_INT_EN_FIFO;
> > +     ctrl_reg4 &=3D ~MPL3115_CTRL4_INT_EN_DRDY;
> > +
> > +     return mpl3115_config_interrupt(data,
> > +             data->ctrl_reg1 | MPL3115_CTRL1_ACTIVE, ctrl_reg4);
> > +}
> > +
> > +static int mpl3115_buffer_predisable(struct iio_dev *indio_dev)
> > +{
> > +     struct mpl3115_data *data =3D iio_priv(indio_dev);
> > +     u8 ctrl_reg1, ctrl_reg4;
> > +     int ret;
> > +
> > +     guard(mutex)(&data->lock);
> > +
> > +     ret =3D mpl3115_set_active(data, false);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D mpl3115_set_fifo(data, MPL3115_F_MODE_DISABLED);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ctrl_reg4 =3D data->ctrl_reg4 & ~MPL3115_CTRL4_INT_EN_FIFO;
> > +     ctrl_reg1 =3D data->ctrl_reg1;
> > +
> > +     if (ctrl_reg4 & MPL3115_CTRL4_ACTIVE_MASK)
> > +             ctrl_reg1 |=3D MPL3115_CTRL1_ACTIVE;
> > +
> > +     return mpl3115_config_interrupt(data, ctrl_reg1, ctrl_reg4);
> > +}
> > +
> > +static const struct iio_buffer_setup_ops mpl3115_buffer_ops =3D {
> > +     .postenable =3D mpl3115_buffer_postenable,
> > +     .predisable =3D mpl3115_buffer_predisable,
> > +};
> > +
> > +static const unsigned long mpl3115_scan_masks[] =3D {
> > +     BIT(0) | BIT(1),
> Maybe worth introducing an enum for those bits (use in the iio_chan_spec =
array elements
>  as well)
> > +     0,
> No comma (Andy got this already)
> > +};
> > +
> >  static const struct iio_event_spec mpl3115_temp_press_event[] =3D {
> >       {
> >               .type =3D IIO_EV_TYPE_THRESH,
> > @@ -409,10 +625,19 @@ static irqreturn_t mpl3115_interrupt_handler(int =
irq, void *private)
> >       if (ret < 0)
> >               return IRQ_NONE;
> >
> > -     if (!(ret & (MPL3115_INT_SRC_TTH | MPL3115_INT_SRC_PTH |
> > -                  MPL3115_INT_SRC_DRDY)))
> > +     if (!(ret & (MPL3115_INT_SRC_FIFO | MPL3115_INT_SRC_TTH |
> > +                  MPL3115_INT_SRC_PTH | MPL3115_INT_SRC_DRDY)))
> >               return IRQ_NONE;
> >
> > +     if (ret & MPL3115_INT_SRC_FIFO) {
> > +             int flush_ret;
> > +
> > +             scoped_guard(mutex, &data->lock)
> > +                     flush_ret =3D mpl3115_fifo_flush(indio_dev);
> > +             if (flush_ret < 0)
> So this is technically not a bug but it runs into the basic argument that=
 if you are
> using automatic cleanup you shouldn't be using gotos in the same function
> (says that in comments in cleanup.h - Linus was very explicit about this =
when people
>  1st starting using these functions!)
>
> With it pushed into the function though that doesn't matter.
>
> > +                     goto err_reset_fifo;
> > +     }
> > +
> >       if (ret & MPL3115_INT_SRC_DRDY)
> >               iio_trigger_poll_nested(data->drdy_trig);
> >
> > @@ -444,6 +669,11 @@ static irqreturn_t mpl3115_interrupt_handler(int i=
rq, void *private)
> >       }
> >
> >       return IRQ_HANDLED;
> > +
> > +err_reset_fifo:
> > +     scoped_guard(mutex, &data->lock)
>
> Hmm. This is trickier given fifo_reset is called in fifo_flush.
> Maybe a wrapper and guard()  The none guard version would typically use
> __mpl3115_fifo_reset() naming.
>
>
> > +             mpl3115_fifo_reset(data);
> > +     return IRQ_HANDLED;
> >  }
>
> >  static int mpl3115_trigger_probe(struct mpl3115_data *data,
> > @@ -723,6 +954,7 @@ static int mpl3115_probe(struct i2c_client *client)
> >       const struct i2c_device_id *id =3D i2c_client_get_device_id(clien=
t);
> >       struct mpl3115_data *data;
> >       struct iio_dev *indio_dev;
> > +     bool use_fifo;
> >       int ret;
> >
> >       ret =3D i2c_smbus_read_byte_data(client, MPL3115_WHO_AM_I);
> > @@ -762,17 +994,31 @@ static int mpl3115_probe(struct i2c_client *clien=
t)
> >       if (ret)
> >               return ret;
> >
> > +     data->watermark =3D MPL3115_DEFAULT_WATERMARK;
> > +
> >       ret =3D mpl3115_trigger_probe(data, indio_dev);
> >       if (ret)
> >               return ret;
> >
> > -     ret =3D devm_iio_triggered_buffer_setup(&client->dev,
> > -                                   indio_dev,
> > -                                   NULL,
> > -                                   mpl3115_trigger_handler,
> > -                                   NULL);
> > -     if (ret)
> > -             return ret;
> > +     use_fifo =3D data->drdy_trig &&
> > +        i2c_check_functionality(client->adapter,
> > +                                I2C_FUNC_SMBUS_READ_I2C_BLOCK);
>
> Hmm. So this is always a fun thing to work out how to handle.
> Gating on a particular i2c controller function isn't appropriate.
> More to the point existing code is relying on that being available.
>
> static int mpl3115_fill_trig_buffer(struct iio_dev *indio_dev, u8 *buffer=
)
> {
>         struct mpl3115_data *data =3D iio_priv(indio_dev);
>         int ret, pos =3D 0;
>
>         if (!(data->ctrl_reg1 & MPL3115_CTRL1_ACTIVE)) {
>                 ret =3D mpl3115_request(data);
>                 if (ret < 0)
>                         return ret;
>         }
>
>         if (test_bit(0, indio_dev->active_scan_mask)) {
>                 ret =3D i2c_smbus_read_i2c_block_data(data->client,
>                         MPL3115_OUT_PRESS, 3, &buffer[pos]);
>                 if (ret < 0)
>                         return ret;
>                 pos +=3D 4;
>         }
>
>         if (test_bit(1, indio_dev->active_scan_mask)) {
>                 ret =3D i2c_smbus_read_i2c_block_data(data->client,
>                         MPL3115_OUT_TEMP, 2, &buffer[pos]);
>                 if (ret < 0)
>                         return ret;
>         }
>
>         return 0;
> }
>
> It's hard to retrofit a fifo and not end up with a weird control
> interface. We can't remove the triggered buffer because that will be
> a regression for existing users.
>
> So the trick we have done in the past is to enable the fifo whenever
> a trigger is not set, but the buffer enabled.
>
> > +
> > +     if (use_fifo) {
> > +             indio_dev->available_scan_masks =3D mpl3115_scan_masks;
> Given other changes I'm suggesting we have nothing to gate that on.
> 2 options:
> A) take the view that's not that costly and optimize the exiting triggere=
d
>    capture for that case (as a precursor)
> B) Do manual data mangling so that you don't need this.  That is just
>    fill the buffer with enabled channels (that makes a mess of using a st=
ruct
>    though as the first channel type changes depending on what is enabled)=
.
>
> I'd do (A)
>
> > +             ret =3D devm_iio_kfifo_buffer_setup(&client->dev, indio_d=
ev,
> > +                                               &mpl3115_buffer_ops);
> Don't do this - instead...
> > +             if (ret)
> > +                     return ret;
> > +     } else {
> > +             ret =3D devm_iio_triggered_buffer_setup(&client->dev,
> > +                                                   indio_dev,
> > +                                                   NULL,
> > +                                                   mpl3115_trigger_han=
dler,
> > +                                                   NULL);
>
> Do this unconditionally. It will register a kfifo so we can use that
> anyway, but will also have the interface we can't remove (without it
> being an ABI regression) to set the trigger.
>
> > +             if (ret)
> > +                     return ret;
> > +     }
> >
> >       return devm_iio_device_register(&client->dev, indio_dev);
> >  }
>
