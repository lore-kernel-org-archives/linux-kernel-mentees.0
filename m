Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5941E307AEC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  2 Jul 2025 14:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751468282; cv=none; b=BiQWZF2zrO1G/J7C6k0PEi4adqZ9/MwJgcJ8nDqDaaNDiQr70hVjUtns3szd9H0IiMwPccHnn+c+xxcNIBS5qe6tIO/dZoy9NLwDP4wfFHyu+xNLGuHji1G93qrrsU3JE+dqlh5niMZYBT6kzeTetaSZLN6bkfahEtpe8kurBi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751468282; c=relaxed/simple;
	bh=BjH9ZL9GM336U/7LmIC7pQDa5Ym6s6rn2+kjuOw1wp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=prdZNqRy+X/Y5X2yr3pkTOSHBFXtwigk5U8nVLzclsL+T+VJEctjMX0bXuxu+cq2ROE708t6LlqwC+Iwo/jOE693+UPK28MudDCeNb+n8RiCa8Bau9dyDRCTvKli2WwI7NFHblDul5NU/WqxMFBlBtjRsO4ureyBlyUpLKVGaJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bv67mqxu; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bv67mqxu"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7FFF4094C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  2 Jul 2025 14:58:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nskVR3k8YHcN for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Jul 2025 14:58:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=akbansd@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 54C06404D6
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54C06404D6
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Bv67mqxu
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 54C06404D6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  2 Jul 2025 14:58:00 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-235d6de331fso58682185ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 02 Jul 2025 07:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751468279; x=1752073079; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G8mb6YKO/25FxCcRxNpOnxxYjHITO3LXQLCHLiZTW/c=;
        b=Bv67mqxurKZV17BbH+etEBYrM0T1nYG6MV4iqnzdpxQEKJF700omM8Czd0ouJio0yh
         eudffp0a4j2ePiwIwqSktxey61n6Af72mR3GUzBrP2f0hSdddeQRnglHy4inHcFPUn6E
         4BXuER6M/UHWgm3n6e7LKzccTGjAVaM8rihAhKDB4VNWWd6CggpnyXALjJuV+tWpwFjj
         oN2TuYvfNmVk1P6husdXoXBvI2AP61tMCO3TP5p9SLVh9CCbTra3gdeO8ISYtRjjWhc/
         OqYdBzMKRrfp5c2TmcVzo2Sv7n0E0oqZj3er4KJEycQZEQTz7dGhGiyslyq+V9w9fehd
         2PHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751468279; x=1752073079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G8mb6YKO/25FxCcRxNpOnxxYjHITO3LXQLCHLiZTW/c=;
        b=YMgGHKqsUOaLmLSf6n0iJroSeBAhOeaykGdMD084lJt/q+L8qO0UpmhFYusG+klVmY
         xo2SsGAl0Vlta1xPzVvrpgD4XV0tKJK5M2tXO0+JQI+UZgG6fmAilloFrDbxRVDVEWOV
         RMY8jynGvjS/QwssEhfjnZe4FTVofTQQ5Da9qjg9umaOt/vmH4qOdVSXo4wnpCkmbo5g
         pcdUUl+CJP8Bf0DNj/kLxgzdehF+FSdiU9is5ceYyNfvI0qsEg48j5rae+NN6oM4e8/w
         qTiN+zQtgyH1Fu15WRXVBrnyJAiUTF9gZsVh3qBphPQ9gfgJPYck1uOUjtHG5Rnqrbj7
         V+Vg==
X-Gm-Message-State: AOJu0Yy+PJQ1RnM2CCLe9kOSWzALRrz/zW36Xbwqli/g83kcevfnhdHp
	WjO9LwRtdSu27zP6w5RI3XMLsqilYsiGctMlyUtehm8b12jsxKj3Syjm
X-Gm-Gg: ASbGnctjtk5P9haEZyWrnlHm0ccMEHHY5cL4gNNVmClTfBJ0uyejG7lj6DRadtrytp4
	TrZYa4QIViUWIt06n6JN5n4lc6xNkluHe2t9ne1l1ypwoodA9a7JRh0xaQZG96QX57ns8ulZWi5
	55Ok0PjoP9QF6mfdUlNPMHq8Lc5hVF5rkURd/SABKV/eMlBsK4udErkOIQ+HZh4x22MD2CKlrvv
	iUWZ+ogoQVU7TsU8V/s4HJ7J5uVKd78g4KMn1BlJmPvi0M+MQWRgSHzFIJ+FdFTHZVUHnKzYzYu
	uWmFhH8zQh0JtISnzdr5eqO/dkUjFznhuC+7gkrKcXILerM8Em8/49oWKO5/6MOuoGO4LqU=
X-Google-Smtp-Source: AGHT+IGgNwNCyuwa7r5FGF7RkrD49EIguonUe9/QiJBv7+/xI5mloY38Y/AsFY/SVbUDzwPV58ljBA==
X-Received: by 2002:a17:903:2984:b0:234:b743:c7a4 with SMTP id d9443c01a7336-23c6e56f44emr61631745ad.38.1751468279578;
        Wed, 02 Jul 2025 07:57:59 -0700 (PDT)
Received: from mbox.localnet ([36.50.162.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3b8ec2sm132043445ad.183.2025.07.02.07.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 07:57:59 -0700 (PDT)
From: akshay bansod <akbansd@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, David Lechner <dlechner@baylibre.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Subject: Re: [PATCH] iio: st_lsm6dsx: Replace scnprintf with sysfs_emit
Date: Wed, 02 Jul 2025 20:27:53 +0530
Message-ID: <3363941.44csPzL39Z@mbox>
In-Reply-To: <f96b68a5-d750-45f0-8cdd-9761b5daca1d@baylibre.com>
References:
 <20250702135855.59955-1-akbansd@gmail.com>
 <f96b68a5-d750-45f0-8cdd-9761b5daca1d@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Wednesday, 2 July 2025 8:25=E2=80=AFpm +0530 David Lechner wrote:
> On 7/2/25 8:58 AM, Akshay Bansod wrote:
> > Update the sysfs interface for sampling frequency and scale attributes.
> > Replace `scnprintf()` with `sysfs_emit_at()` which is PAGE_SIZE-aware
> > and recommended for use in sysfs.
> >=20
> > Signed-off-by: Akshay Bansod <akbansd@gmail.com>
> > ---
> >=20
> > Testing:
> > - Built the driver (`st_lsm6dsx_i2c`) as a module.
> > - Tested using `i2c-stub` to mock the device.
> > - Verified that reading sysfs attributes like `sampling_frequency_avail=
able`
> >   works correctly and shows no change in functionality.
>=20
> Nice to see it was actually tested. :-)
>=20
:-)
> >=20
> >  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c b/drivers/iio=
/imu/st_lsm6dsx/st_lsm6dsx_core.c
> > index c65ad4982..1cef10919 100644
> > --- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
> > +++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
> > @@ -2035,7 +2035,7 @@ st_lsm6dsx_sysfs_sampling_frequency_avail(struct =
device *dev,
> > =20
> >  	odr_table =3D &sensor->hw->settings->odr_table[sensor->id];
> >  	for (i =3D 0; i < odr_table->odr_len; i++)
> > -		len +=3D scnprintf(buf + len, PAGE_SIZE - len, "%d.%03d ",
> > +		len +=3D sysfs_emit_at(buf, len, "%d.%03d ",
> >  				 odr_table->odr_avl[i].milli_hz / 1000,
> >  				 odr_table->odr_avl[i].milli_hz % 1000);
>=20
> Let's keep checkpatch happy and change the indent of the wrapped lines to
> line up with ( since the ( moved.
>=20
noted. I wasn't aware of that.
> >  	buf[len - 1] =3D '\n';
> > @@ -2054,7 +2054,7 @@ static ssize_t st_lsm6dsx_sysfs_scale_avail(struc=
t device *dev,
> > =20
> >  	fs_table =3D &hw->settings->fs_table[sensor->id];
> >  	for (i =3D 0; i < fs_table->fs_len; i++)
> > -		len +=3D scnprintf(buf + len, PAGE_SIZE - len, "0.%09u ",
> > +		len +=3D sysfs_emit_at(buf, len, "0.%09u ",
> >  				 fs_table->fs_avl[i].gain);
>=20
> ditto
>=20
noted.
> >  	buf[len - 1] =3D '\n';
> > =20
>=20
>=20

Thanks for the review. I'll revise the patch.

Regards,
Akshay



