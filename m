Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC67922F77E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  8 Jul 2025 06:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751957417; cv=none; b=dot2ul68a5+/6fpr/kNBTy8l127PoY2D1/2YELBYB2FFKteFWz9308VDkSnQ3QKthkiW2y7xCwHGC2dZFtIAtGh/ah779PAdZhngI320zmLX54Gh7158xPyQWvbFmSUM4zPaeYCwPLRnWhy5g0axtudJ+wgFnxdoz/P/ncspSyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751957417; c=relaxed/simple;
	bh=p7Vczb2qgKmJ1lCdlCQ9oB0YanB7KoIMpQZqJ3Ly4MY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mye0r70gS/rW6JX6xW7R3M8ziRjxmSpOR/q59GI3k/1jQpY2Ghnsor7ZNvvUgV3guOMglMZH9qNhAt9XXTUMGQEYbLvQrKRUEChF/YYyDUCTPwKnMkcixw67WbKqS+GRmUgxivjYrF6YgR1D7YmZ5YmSkmnt1EiAiM3cmpLcCr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ipUvlGup; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ipUvlGup"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4762181865
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  8 Jul 2025 06:50:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eUEE4-sJ8Mif for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Jul 2025 06:50:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=akbansd@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9B12781323
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B12781323
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ipUvlGup
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9B12781323
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  8 Jul 2025 06:50:14 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-74b56b1d301so2262831b3a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 07 Jul 2025 23:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751957414; x=1752562214; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aqugteN2eEIc2l2DBcvL/f8yXrIHgaMnuOSPwTtzdIk=;
        b=ipUvlGup7oO2mKNRQxqnC94aZZ/4bSV2cflll8sMvGUY72499mryhfCSa4k9aHMFz5
         iBrGUja8p1KCF/qElKsLmme5vIJTTUzIjTFfrwB+LM8CDb4jtC7iUTPBnxREQT9eKij5
         P4DdB5rCBgda6XT4QuWbP9kVIKMCddkhPRjB/jmDxlQj7V8JEgulA+cZFhy2WhM6FpJJ
         Vt5U02tlNmWdzedTX1yJe2leGZiJsQTsK/jWJIb0+BPYxH2//SUq8/kfKqoHqIc6tRRl
         dUAN2TgPXMQK1xUwneymHSmc6Ap2KxNPnYsDIEifiAJz6mHFBVKKbW7A3qgOXaedrzJC
         oQmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751957414; x=1752562214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aqugteN2eEIc2l2DBcvL/f8yXrIHgaMnuOSPwTtzdIk=;
        b=thHG1+horO2Hs96EPUv4mtSo88shJL7sA5aeyZQM48H/tHi9tJVGuyAgfr+LDlYX63
         P2GFgNZbXj5OufJgrYut17dr9MDc4kLZtPVUzsTewJqSqoiRBSuDmazTVnc3JCn5Q/zO
         4PDjZ2lJyvB8zLcUSm5vafR9BeYpWgYkh4Ka13BQ3+4ZLOp+sY9oy2Zb0AgsqFujUZkV
         gEWumuM9+YQWD+CcZZg8QvmClNNDhW3aIEhXxWBxsVsxFw1S+CFyt1tqGyMmdT0rHARk
         hqq/5sEzejSipleCsviTh0TreB35cGGoxYhDEx3hPgEDjg4p9c3xgAa5Nh5TrazjK9Yt
         7Asg==
X-Forwarded-Encrypted: i=1; AJvYcCW7cEL3ZOhqaPzWobcbu7e3BL7H1uOSokC5r6Z/CX5ifMTOVrj7KENXDiSbqUcNMlk3dY2bS+aLr7B6YjNek0vsCuegxA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzLkvEQWzVGyI/8m1DiwpOa7XqAw6a8TRNiLEftFwreXlhBac0T
	nN1BrO4cE2SQrbmjWdTtJbxVn1Alvo8AtVVm5sTdRLX/oSRR7cQWtu4v
X-Gm-Gg: ASbGnctOgYarvymjqi+JUm8aijj6mhDQ0Fnq8Xbl6A4ntRf4a81zSppeEGSnW2lEc+z
	Zhfial9xSMjW68hgQuWujEm7I60iJWaXkFTdKdPvQrY1WtDWXd0AXXbg681jP1BlYWNXSEQ1Zxy
	AJDE5UDLJhYGeY7p+vloYfNYTXh9EmS9mbg2MC65G8GHHTBnJXAC85iDUk1IHXt0QONXk5joeHs
	bR2PC7bhjdoJHpyrtvT+UA/vYmcQ9sYZQXotjoDVWF66lwLKRgnBGijraUoXDshU7xVFjTTF7Q5
	Y+I6cFpL35dgxWqVzIRQVhWmaXfXqxjOYEiUpyNGbHdt2/NSLZZ/HRCmm+mQ
X-Google-Smtp-Source: AGHT+IEDnB13/b3LmDOwrFJZtQd45JvmCuztyCFmjCx6EDfkeVSU5wUDDdMIIH9GoBNpGm4oSRkvBg==
X-Received: by 2002:a05:6a00:1c86:b0:74c:efae:fd8f with SMTP id d2e1a72fcca58-74cefaefdf8mr18459328b3a.15.1751957413474;
        Mon, 07 Jul 2025 23:50:13 -0700 (PDT)
Received: from mbox.localnet ([36.50.162.228])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce417dde0sm10402432b3a.73.2025.07.07.23.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 23:50:12 -0700 (PDT)
From: akshay bansod <akbansd@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, David Lechner <dlechner@baylibre.com>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iio: st_lsm6dsx: Replace scnprintf with sysfs_emit
Date: Tue, 08 Jul 2025 12:20:04 +0530
Message-ID: <22754870.EfDdHjke4D@mbox>
In-Reply-To: <20250706115003.5752261c@jic23-huawei>
References:
 <20250703053900.36530-1-akbansd@gmail.com> <2413481.ElGaqSPkdT@mbox>
 <20250706115003.5752261c@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Sunday, 6 July 2025 10:00=E2=80=AFam +0530 Jonathan Cameron wrote:
> On Thu, 03 Jul 2025 22:28:13 +0530
> akshay bansod <akbansd@gmail.com> wrote:
>=20
> > On Thursday, 3 July 2025 10:12=E2=80=AFpm +0530 Andy Shevchenko wrote:
> > > On Thu, Jul 03, 2025 at 11:08:59AM +0530, Akshay Bansod wrote: =20
> > > > Update the sysfs interface for sampling frequency and scale attribu=
tes.
> > > > Replace `scnprintf()` with `sysfs_emit_at()` which is PAGE_SIZE-awa=
re
> > > > and recommended for use in sysfs. =20
> > >=20
> > > 'must' is stronger than 'recommendation'.
> > > Of has the documentation been changed lately?
> > >=20
> > > ...
> > >  =20
> > > > st_lsm6dsx_sysfs_sampling_frequency_avail(struct device *dev, =20
> > >  =20
> > > >  	odr_table =3D &sensor->hw->settings->odr_table[sensor->id];
> > > >  	for (i =3D 0; i < odr_table->odr_len; i++)
> > > > -		len +=3D scnprintf(buf + len, PAGE_SIZE - len, "%d.%03d ",
> > > > -				 odr_table->odr_avl[i].milli_hz / 1000,
> > > > -				 odr_table->odr_avl[i].milli_hz % 1000);
> > > > +		len +=3D sysfs_emit_at(buf, len, "%d.%03d ",
> > > > +				     odr_table->odr_avl[i].milli_hz / 1000,
> > > > +				     odr_table->odr_avl[i].milli_hz % 1000);
> > > >  	buf[len - 1] =3D '\n'; =20
> > >=20
> > > My gosh, this is error prone. I'm wondering when some CIs will start =
to
> > > complain on this line. But this was already before your change...
> > >  =20
> > I'm planning to drop It entirely or should I replace it with another `s=
ysfs_emit_at()` ?
> > I've seen other device driver returning space terminated buffers. Maybe=
 I'm overlooking
> > something.
>=20
> It is rather ugly currently but not a bug as such as we know we don't act=
ually run
> out of space in the page (it would just overwrite last byte in that case =
so odd
> output, but not a bug) and that we always print something so just as you =
suggest
> sysfs_emit_at(buf, len - 1, "\n"); is safe.  It also checks under and ove=
rflow
> so that safe + hopefully won't trip up static analysis tools.
>=20
understood. I'll revise the patch.

On a sidenode, I see a lot of repetitive code trying to write to a sysfs bu=
ffer
from a static array. for example

 drivers/iio/common/st_sensors/st_sensors_core.c:629
 drivers/iio/adc/vf610_adc.c:614
 drivers/iio/accel/adxl372.c:972

 ...

What if we export a symbol from industrialio-core.c which does something=20
similar to

 drivers/iio/industrialio-core.c:815

 'iio_format_avail_list(char *buf, const int *vals,
				     int type, int length)'


but rather than taking integer array, it take `void* ptr` and `int stride` =
as
parameter. Then iterates from `vals` by `stride` for `count` times and type=
cast
the pointer and 'sysfs_emit` it.

static ssize_t iio_format_avail_list(char *buf, void *vals,=20
			      int stride, int type, int count) {

	// iterate (void*) vals by stride and perform `sysfs_emit`
=09
	void* ref =3D vals;
	for(int i =3D 0; i < count; i++){
=09
		ref +=3D stride;
	=09
		// typecast and write to buf using sysfs_emit
		...

	}
};


Thus, drivers can use this as follows.

=2D-- a/drivers/iio/common/st_sensors/st_sensors_core.c
+++ b/drivers/iio/common/st_sensors/st_sensors_core.c
@@ -618,20 +618,11 @@ EXPORT_SYMBOL_NS(st_sensors_verify_id, "IIO_ST_SENSOR=
S");
 ssize_t st_sensors_sysfs_sampling_frequency_avail(struct device *dev,
                                struct device_attribute *attr, char *buf)
 {
=2D       int i, len =3D 0;
        struct iio_dev *indio_dev =3D dev_to_iio_dev(dev);
        struct st_sensor_data *sdata =3D iio_priv(indio_dev);
=20
=2D       for (i =3D 0; i < ST_SENSORS_ODR_LIST_MAX; i++) {
=2D               if (sdata->sensor_settings->odr.odr_avl[i].hz =3D=3D 0)
=2D                       break;
=2D
=2D               len +=3D scnprintf(buf + len, PAGE_SIZE - len, "%d ",
=2D                               sdata->sensor_settings->odr.odr_avl[i].hz=
);
=2D       }
=2D       buf[len - 1] =3D '\n';
=2D
=2D       return len;
+       return iio_format_avail_list(buf, &sdata->sensor_settings->odr.odr_=
avl[0].hz,
+               sizeof(st_sensor_odr_avl), IIO_VAL_INT, ST_SENSORS_ODR_LIST=
_MAX);
 }

The details about the various types to cover is still unclear.=20
But does this sounds feasible ?=20

> >=20
> > > >  	return len; =20
> > >=20
> > > ...
> > >  =20

=2E..

> >=20
> >=20
> >=20
> >=20
>=20

Regards,=20
Akshay Bansod




