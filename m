Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A019F2E3B17
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  9 Jul 2025 14:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752070563; cv=none; b=kdipTH2LFaLV0+11bys6DYspFU1CnqZl/HCwlW6Rr8m+1hkiOKucqK/9uqAnzwujRFl3w2s7hcIsl9NOJAG4R/Ig2gLIhKh42ffwq0y9CtArKjqTDPykAban+qZ9w7coHEb5OOJ9+jopCMkqVKNKWmsoyGAvIPdvS5snV6Y/XUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752070563; c=relaxed/simple;
	bh=hbnWpY7rICY5bdB+J7FSXeSJ0M42wfihgsYg9zvldJE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UWJjjseYcYBORIavtmvj+ijxsCU3uTM/nlgi5FEZlmkw7feeCTmn9VhxkovzQXNtmKDAoKhRu4Mmwq5vn1Ufib/rNc2Vko0cqeVuudE/x+qN9rYLRJf9x7pEWiUtPZP+HXCCF2i9Quhr9gozS/SHE6Wa0jx9ll1GcTGYIXjB0a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FGeR0RbC; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FGeR0RbC"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A68F81087
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  9 Jul 2025 14:16:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZFxvl-Gm6TGr for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Jul 2025 14:16:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=jic23@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3E98581036
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E98581036
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FGeR0RbC
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3E98581036
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  9 Jul 2025 14:16:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AE0F3A53752;
	Wed,  9 Jul 2025 14:15:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5273EC4CEEF;
	Wed,  9 Jul 2025 14:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752070558;
	bh=hbnWpY7rICY5bdB+J7FSXeSJ0M42wfihgsYg9zvldJE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FGeR0RbCIOALyTTZOdeahkgBn2+oR8ULeVk1TxuuKAnF1IBs5HkJI9uAOea4StcKa
	 wkbxZZf3bbgFtfmVinco4jmV1IE7Q4DkhPDN0Kc+Ae1660QujkSkTfn0JgNyCS75qz
	 XDVTDGj6FhgDDAoo27olu3occwvZrs5XJw8xD3ByhNVEkvrE879fXly3VbNGLw0Ps9
	 SlsdRJmNb6Vk7VzmcnogGlv9w1o3RTMvLA67+V3zzUZXmEpNtQc+SEOomS7qpoRqT8
	 cabtMwxdEW0v3kETf9BjCMZCUuKcKEyp2kHfF05fmuUNWq2+eVucHP5Bi/ZWOviEqC
	 rlvKwzYdU9f+g==
Date: Wed, 9 Jul 2025 15:15:52 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: akshay bansod <akbansd@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Lorenzo Bianconi
 <lorenzo@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iio: st_lsm6dsx: Replace scnprintf with sysfs_emit
Message-ID: <20250709151552.6ccde08b@jic23-huawei>
In-Reply-To: <22754870.EfDdHjke4D@mbox>
References: <20250703053900.36530-1-akbansd@gmail.com>
	<2413481.ElGaqSPkdT@mbox>
	<20250706115003.5752261c@jic23-huawei>
	<22754870.EfDdHjke4D@mbox>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 08 Jul 2025 12:20:04 +0530
akshay bansod <akbansd@gmail.com> wrote:

> On Sunday, 6 July 2025 10:00=E2=80=AFam +0530 Jonathan Cameron wrote:
> > On Thu, 03 Jul 2025 22:28:13 +0530
> > akshay bansod <akbansd@gmail.com> wrote:
> >  =20
> > > On Thursday, 3 July 2025 10:12=E2=80=AFpm +0530 Andy Shevchenko wrote=
: =20
> > > > On Thu, Jul 03, 2025 at 11:08:59AM +0530, Akshay Bansod wrote:   =20
> > > > > Update the sysfs interface for sampling frequency and scale attri=
butes.
> > > > > Replace `scnprintf()` with `sysfs_emit_at()` which is PAGE_SIZE-a=
ware
> > > > > and recommended for use in sysfs.   =20
> > > >=20
> > > > 'must' is stronger than 'recommendation'.
> > > > Of has the documentation been changed lately?
> > > >=20
> > > > ...
> > > >    =20
> > > > > st_lsm6dsx_sysfs_sampling_frequency_avail(struct device *dev,   =
=20
> > > >    =20
> > > > >  	odr_table =3D &sensor->hw->settings->odr_table[sensor->id];
> > > > >  	for (i =3D 0; i < odr_table->odr_len; i++)
> > > > > -		len +=3D scnprintf(buf + len, PAGE_SIZE - len, "%d.%03d ",
> > > > > -				 odr_table->odr_avl[i].milli_hz / 1000,
> > > > > -				 odr_table->odr_avl[i].milli_hz % 1000);
> > > > > +		len +=3D sysfs_emit_at(buf, len, "%d.%03d ",
> > > > > +				     odr_table->odr_avl[i].milli_hz / 1000,
> > > > > +				     odr_table->odr_avl[i].milli_hz % 1000);
> > > > >  	buf[len - 1] =3D '\n';   =20
> > > >=20
> > > > My gosh, this is error prone. I'm wondering when some CIs will star=
t to
> > > > complain on this line. But this was already before your change...
> > > >    =20
> > > I'm planning to drop It entirely or should I replace it with another =
`sysfs_emit_at()` ?
> > > I've seen other device driver returning space terminated buffers. May=
be I'm overlooking
> > > something. =20
> >=20
> > It is rather ugly currently but not a bug as such as we know we don't a=
ctually run
> > out of space in the page (it would just overwrite last byte in that cas=
e so odd
> > output, but not a bug) and that we always print something so just as yo=
u suggest
> > sysfs_emit_at(buf, len - 1, "\n"); is safe.  It also checks under and o=
verflow
> > so that safe + hopefully won't trip up static analysis tools.
> >  =20
> understood. I'll revise the patch.
>=20
> On a sidenode, I see a lot of repetitive code trying to write to a sysfs =
buffer
> from a static array. for example
>=20
>  drivers/iio/common/st_sensors/st_sensors_core.c:629
>  drivers/iio/adc/vf610_adc.c:614
>  drivers/iio/accel/adxl372.c:972
>=20
It is a more complex conversion but in at least some of these cases
they should really move to using a read_avail callback rather
than a custom attribute.

The internals of that functionality indeed look somewhat like your
suggested function but with added benefit of being useable by
in kernel consumers of the channels and with rigid enforcement of naming et=
c.

It does need to be done a little carefully though as there are some
messy lifetime issues when in kernel consumers use that data.

Jonathan

>  ...
>=20
> What if we export a symbol from industrialio-core.c which does something=
=20
> similar to
>=20
>  drivers/iio/industrialio-core.c:815
>=20
>  'iio_format_avail_list(char *buf, const int *vals,
> 				     int type, int length)'
>=20
>=20
> but rather than taking integer array, it take `void* ptr` and `int stride=
` as
> parameter. Then iterates from `vals` by `stride` for `count` times and ty=
pecast
> the pointer and 'sysfs_emit` it.
>=20
> static ssize_t iio_format_avail_list(char *buf, void *vals,=20
> 			      int stride, int type, int count) {
>=20
> 	// iterate (void*) vals by stride and perform `sysfs_emit`
> =09
> 	void* ref =3D vals;
> 	for(int i =3D 0; i < count; i++){
> =09
> 		ref +=3D stride;
> 	=09
> 		// typecast and write to buf using sysfs_emit
> 		...
>=20
> 	}
> };
>=20
>=20
> Thus, drivers can use this as follows.
>=20
> --- a/drivers/iio/common/st_sensors/st_sensors_core.c
> +++ b/drivers/iio/common/st_sensors/st_sensors_core.c
> @@ -618,20 +618,11 @@ EXPORT_SYMBOL_NS(st_sensors_verify_id, "IIO_ST_SENS=
ORS");
>  ssize_t st_sensors_sysfs_sampling_frequency_avail(struct device *dev,
>                                 struct device_attribute *attr, char *buf)
>  {
> -       int i, len =3D 0;
>         struct iio_dev *indio_dev =3D dev_to_iio_dev(dev);
>         struct st_sensor_data *sdata =3D iio_priv(indio_dev);
> =20
> -       for (i =3D 0; i < ST_SENSORS_ODR_LIST_MAX; i++) {
> -               if (sdata->sensor_settings->odr.odr_avl[i].hz =3D=3D 0)
> -                       break;
> -
> -               len +=3D scnprintf(buf + len, PAGE_SIZE - len, "%d ",
> -                               sdata->sensor_settings->odr.odr_avl[i].hz=
);
> -       }
> -       buf[len - 1] =3D '\n';
> -
> -       return len;
> +       return iio_format_avail_list(buf, &sdata->sensor_settings->odr.od=
r_avl[0].hz,
> +               sizeof(st_sensor_odr_avl), IIO_VAL_INT, ST_SENSORS_ODR_LI=
ST_MAX);
>  }
>=20
> The details about the various types to cover is still unclear.=20
> But does this sounds feasible ?=20
>=20
> > >  =20
> > > > >  	return len;   =20
> > > >=20
> > > > ...
> > > >    =20
>=20
> ...
>=20
> > >=20
> > >=20
> > >=20
> > >  =20
> >  =20
>=20
> Regards,=20
> Akshay Bansod
>=20
>=20
>=20
>=20
>=20

