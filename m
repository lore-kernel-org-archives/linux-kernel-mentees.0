Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF6820371E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun,  6 Jul 2025 10:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751799015; cv=none; b=PzH/BFBu6V8ZDPm90Q+hWJgZL6l9riM2RErDAOGjfEL03rz84rmo/NDY0ucn97U8g6GTm1BEVjMCXK65n++j0RkvGFOTWamFbFopXQSERMLK7lF9xR7nKM1yQPWTtEHKw2fymDUuXzFGNSPA0KhafTNILoZgdzyf/Ka+bA0VJMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751799015; c=relaxed/simple;
	bh=rnlOCsOx8oCuPmV5KoaTeoAVYCzmPUH79UN0xUbYiqs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LWh4e/xbZjjp9H6Qt3aADsmrHtdj/KsXDQJhl4+rfA2JzqRvhtV6Wl9FeSbLJvtTlHhnukruA0/DwOU+4LLs6EX6DOPQk6BbhluutKcXoHyjM+SAhTwm179yeU6rWKEZRmZjjdbju3PGcRFzwVJZYtDs9WJplNzmL8NJpUdodlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Du7bI8mF; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Du7bI8mF"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E67781F0C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun,  6 Jul 2025 10:50:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sCEecgQIZOUN for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Jul 2025 10:50:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=jic23@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 52D0F81F09
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52D0F81F09
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Du7bI8mF
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 52D0F81F09
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun,  6 Jul 2025 10:50:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2AFA0447E8;
	Sun,  6 Jul 2025 10:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70B18C4CEED;
	Sun,  6 Jul 2025 10:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751799011;
	bh=rnlOCsOx8oCuPmV5KoaTeoAVYCzmPUH79UN0xUbYiqs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Du7bI8mF3pklE/y4wUYkC+0Swb4+ZE1tnVHV1pau0A5sSa61VWSBKWpVL2czGSeqq
	 lP9A1hKIDFXO8GV8cQzZ9UFCY1b3qqlB4jivrH9tEhHRkfQVs77ulQopLiVkBrFmUL
	 xygqxKpX2s3I2hgb/HIHeLDXRvw+8w0X4nIcS7R+KBibZ1DZr1tRQg7LLmZENCi1RQ
	 i9wXQrwxnKEabvFeT8ncG/gVoLFQ7WrYHy0I5X308DLRppzRgCYb3QLYZCSCjNegV7
	 thYQv774XI2xsFTcmojrX3GNRaoF60dcqZuLOLdkFeFxKfwC7Ku0Jp630Sz7PWde2R
	 WCiV6kOCHacVw==
Date: Sun, 6 Jul 2025 11:50:03 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: akshay bansod <akbansd@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Lorenzo Bianconi
 <lorenzo@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iio: st_lsm6dsx: Replace scnprintf with sysfs_emit
Message-ID: <20250706115003.5752261c@jic23-huawei>
In-Reply-To: <2413481.ElGaqSPkdT@mbox>
References: <20250703053900.36530-1-akbansd@gmail.com>
	<aGaIMjkYBmfMmCBn@smile.fi.intel.com>
	<2413481.ElGaqSPkdT@mbox>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 03 Jul 2025 22:28:13 +0530
akshay bansod <akbansd@gmail.com> wrote:

> On Thursday, 3 July 2025 10:12=E2=80=AFpm +0530 Andy Shevchenko wrote:
> > On Thu, Jul 03, 2025 at 11:08:59AM +0530, Akshay Bansod wrote: =20
> > > Update the sysfs interface for sampling frequency and scale attribute=
s.
> > > Replace `scnprintf()` with `sysfs_emit_at()` which is PAGE_SIZE-aware
> > > and recommended for use in sysfs. =20
> >=20
> > 'must' is stronger than 'recommendation'.
> > Of has the documentation been changed lately?
> >=20
> > ...
> >  =20
> > > st_lsm6dsx_sysfs_sampling_frequency_avail(struct device *dev, =20
> >  =20
> > >  	odr_table =3D &sensor->hw->settings->odr_table[sensor->id];
> > >  	for (i =3D 0; i < odr_table->odr_len; i++)
> > > -		len +=3D scnprintf(buf + len, PAGE_SIZE - len, "%d.%03d ",
> > > -				 odr_table->odr_avl[i].milli_hz / 1000,
> > > -				 odr_table->odr_avl[i].milli_hz % 1000);
> > > +		len +=3D sysfs_emit_at(buf, len, "%d.%03d ",
> > > +				     odr_table->odr_avl[i].milli_hz / 1000,
> > > +				     odr_table->odr_avl[i].milli_hz % 1000);
> > >  	buf[len - 1] =3D '\n'; =20
> >=20
> > My gosh, this is error prone. I'm wondering when some CIs will start to
> > complain on this line. But this was already before your change...
> >  =20
> I'm planning to drop It entirely or should I replace it with another `sys=
fs_emit_at()` ?
> I've seen other device driver returning space terminated buffers. Maybe I=
'm overlooking
> something.

It is rather ugly currently but not a bug as such as we know we don't actua=
lly run
out of space in the page (it would just overwrite last byte in that case so=
 odd
output, but not a bug) and that we always print something so just as you su=
ggest
sysfs_emit_at(buf, len - 1, "\n"); is safe.  It also checks under and overf=
low
so that safe + hopefully won't trip up static analysis tools.

>=20
> > >  	return len; =20
> >=20
> > ...
> >  =20
> > >  	fs_table =3D &hw->settings->fs_table[sensor->id];
> > >  	for (i =3D 0; i < fs_table->fs_len; i++)
> > > -		len +=3D scnprintf(buf + len, PAGE_SIZE - len, "0.%09u ",
> > > -				 fs_table->fs_avl[i].gain);
> > > +		len +=3D sysfs_emit_at(buf, len, "0.%09u ",
> > > +				     fs_table->fs_avl[i].gain);
> > >  	buf[len - 1] =3D '\n'; =20
> >=20
> > Ditto.
> >=20
> >  =20
>=20
> regards,
> Akshay Bansod
>=20
>=20
>=20
>=20

