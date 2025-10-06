Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DF619F137
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  6 Oct 2025 03:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759719858; cv=none; b=M/7DduP9oWbviEMwJCAOUqZ+HrhSS1xzeFwsNaf9IlgqifXsMQ5Z6HyV+HjF15CwHNBCiEwJY8OESt7MhFyVipir18/NCecOWD9/DsqXv0/jTrJMWWF76VSWiYkO5vxewK+/l8nD9Rg9zyhN6q28NzWtHpZkHpc6FxqVAIaH/gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759719858; c=relaxed/simple;
	bh=zrCv2LuYmCw0DiAsIUBqoGDXiizxKiHny8jAmmjwrG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qBnQnfceKiAF6SltyCxT5OMZRaihYQlEBFV4sd+OBRgu3r1HEGAo8s4lwVbrmJWKSi5eBEqoVFu5raMfjRo8OzlWA8fyEtjGWyD9K99/coQslPS4Jt/lOiOICKAQOXnsqtm0gN+I4HvwrSDnxHpUamV+gtwbJsWfLve3h2fHml0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UDKg/glQ; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UDKg/glQ"
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-b4c89df6145so193364966b.3
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 05 Oct 2025 20:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759719855; x=1760324655; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g8HZij/mNEbJxirmDzZ6t2wS0k3yCLSvvwCRqNRU6uM=;
        b=UDKg/glQXMXbCvCRDtFkM6qSOloW9yHb2VsyHgWBugAWKHPquouKyJqDuUIa5NxIPL
         BpnNt0l+aQDEPfk7ki0BbS/+FRkyS0AZuMVW9H5NUPEeMbZ8Mr87S+Fuv0kK573OnSK8
         ojc08bcb8KrJ5Tk2NXZQ4venfbxDvoK9eYATCmsw70ua7SC6uJpFcgYSvVpjTuTdLvot
         9o/xN9tTCpcgQyZZExdc8E20TIp7VGxvl3U+0b2l95TvBqs6URd1Sbw2P4WZBjoky6un
         Xkst/n4yrhZ19Oc/7A/omu/rT4R9EPr9/iPiv8a3GyB55q/U3yKSwS25dXKc2G92fPpE
         YHhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759719855; x=1760324655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g8HZij/mNEbJxirmDzZ6t2wS0k3yCLSvvwCRqNRU6uM=;
        b=nsRJ0ibtCSvAEsTvFMX9LKvamuFP3yU3dYy7Iyjryg+1gULmZ9HrJgADO3DdOL8Kjr
         0tKXDFz4K2Y3At6CDPo7UERbFFL6oeArQpECMdOcElyOmZkKI+ehll0ER6zGGI8Hwybl
         DB6nVaw0VKeeVET4JF7yq8FwCneAwNqoKiXDvvr0ZuTiaIJVO/c//XE1nRqBxdX/pzeV
         jbnoFujDctNdeNklv7l7y50W1dSBzI84faAb63ZFesj5Ya4SeNoYIcGuZe+Sz/WG1ALf
         QtR55AYE6MA0kpk4kIjXjY1pHihyMJwlFa5az3TqiLx5rltjgPxggeBZXz6J4IoTZx2m
         ltqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXM+J2XnzrIPAczaGn4tqMXYAl9bLqxO8rsVdEVlRwagzMSPrzIRvZ5/5DqRsEZDx+yLWivZNNzkrguAYMSbuGY12gnWA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyH5SpLGOQXv0qUH7w5395NEpCQMd6aljrgMMf2+3El09ES4Nt5
	ttiSl7Zx/SpX1DYRqR/myd9OMPCxVkk4dumh3EDbreWHGNnviMUPDfu8VKPnicCozEioRkPsGRP
	1zkd+wU0umoVAADDQwY6rjPXcTAKL7sw=
X-Gm-Gg: ASbGncvb+suGdQV1f0mvLgs71QXYvg8P7V6iFZ6M531xL0BtJ9+VA06Z5+l7YtahjrX
	F+Nx9mhxlugF3A9dqtwbwHt+jxL1fu1Ynu509Sdt5ktLavQYOIAezlTBjV9P+LE4Y10HCi3hZVK
	H3iU0nGoqvlJ5CmNZpfQOMvbCbfQANOWZzEHyEwEm6cWUdUGQiLpDCKoDYekprPWNjDzqgcf9OQ
	4nJVoc8/Zbp4FdTTrmTDOr2Zvodmh3mLZ+WSWi2/w==
X-Google-Smtp-Source: AGHT+IF3g5iOV5bBmvcCjDZVj28/wSv9TwXn03R1OV6xFO9+YKnCOgJo0QkX4WrE9j8JvzAze30xlaVLyrf8o/PLByI=
X-Received: by 2002:a17:907:7e8c:b0:b04:5b0a:5850 with SMTP id
 a640c23a62f3a-b49c3b25f61mr1442292266b.40.1759719854642; Sun, 05 Oct 2025
 20:04:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251004015623.7019-1-raskar.shree97@gmail.com>
 <20251004015623.7019-2-raskar.shree97@gmail.com> <20251004141231.632c311d@jic23-huawei>
In-Reply-To: <20251004141231.632c311d@jic23-huawei>
From: Shrikant <raskar.shree97@gmail.com>
Date: Mon, 6 Oct 2025 08:34:03 +0530
X-Gm-Features: AS18NWCdUtEmwAviFScR6aUatO9T_ZkTtEYw9JwSoZ6crvMFN1TNWl_QFZoYWvY
Message-ID: <CAHc1_P7MU=BYf_8sbZqikpXpfuvAtLNJ2E_hmi-50ohoh+gQcg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: iio: max30100: Add pulse-width property
To: Jonathan Cameron <jic23@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, matt@ranostay.sg, 
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 4, 2025 at 6:42=E2=80=AFPM Jonathan Cameron <jic23@kernel.org> =
wrote:
>
> On Sat,  4 Oct 2025 07:26:22 +0530
> Shrikant Raskar <raskar.shree97@gmail.com> wrote:
>
> > The MAX30100 sensor supports multiple LED pulse widths (200us, 400us,
> > 800us, 1600us). These settings affect measurement resolution and power
> > consumption. Until now, the driver always defaulted to 1600us.
> >
> > Introduce a new device tree property `maxim,pulse-width` that allows
> > users to select the desired pulse width in microseconds from device
> > tree.
> >
> > Valid values are: 200, 400, 800, 1600.
> >
> > This prepares for driver changes that read this property and configure
> > the SPO2 register accordingly.
> >
> > Signed-off-by: Shrikant Raskar <raskar.shree97@gmail.com>
> Hi Shrikant,
>
> Explain why this is in some way related to characteristics of how the
> system containing this chip is built (wiring, lenses etc).  Otherwise
> this might instead be something that should be controlled from userspace
> not firmware.
>
> Also, give a little more on why we care about controlling it at all.
> Is there a usecase where power use of this chip matters?  Mostly I'd expe=
ct
> it to be in measurement equipment with relatively short measuring periods=
.
>
> Jonathan
Hi Jonathan,

Thanks for the feedback.

The pulse width configuration is indeed dependent on the hardware integrati=
on
of the MAX30100. It affects how much optical energy the LEDs emit per sampl=
e,
which in turn depends on physical factors such as:

 - The type and thickness of the optical window or lens covering the sensor
 - The distance between the LED and photodiode
 - The reflectivity of the skin/contact surface

For example:
 - A smartwatch/wearable ring with a thin glass window can operate
with 200=E2=80=93400 =C2=B5s pulses to
   save power, while
 - A medical-grade pulse oximeter or a sensor mounted behind a thicker
   protective layer may require 800=E2=80=931600 =C2=B5s for reliable signa=
l amplitude.

I believe it would be appropriate to describe these fixed,
board-specific characteristics in the Device Tree,
since they are determined by the hardware design rather than being
runtime or user-controlled parameters.

Would it be okay if I send v2 of the patch with the above explanation
included in the commit message?

Thanks and regards,
Shrikant
