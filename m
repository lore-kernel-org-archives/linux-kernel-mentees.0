Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DEA254B09
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  3 Jul 2025 16:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751561902; cv=none; b=a2Bb3D5/CM0iwgUn25YPQyEXG2Tx7S13bsujgSHooriP0cKi0rDJMxjM1ll5BVkp/LtpSdbqXJBC7jDC1AwjUWRTUXyr0fYMr5LD6C0vQR91VBjL54Ud9nwt5GnCXmwVFJSz7mzNUyCV6cmQBhR64aWfhC8iXeJvQd8vGOf+9bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751561902; c=relaxed/simple;
	bh=gTADXefJfpRuQnZneIMTgmGJqA5Hp6PtGpOLvS7HbS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qx5hdniXbIYvxEmMKVdNP6SSLOGbuz0kv37NTGjcM3rCyO4BaBa/pdf6axHS3WdH8c19zsm8xE6vBSf/aHuOoiwOUdcSYVTwT0DdkfRTlQ62jOPB+TGoecyFPl4kvjL+gSWoUtrsW8bBdxHYlVrqElg/VFcSck/xo/1mxF6PHAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lHmroS9J; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lHmroS9J"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A52C60709
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  3 Jul 2025 16:58:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0skR7s3GFJcW for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Jul 2025 16:58:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=akbansd@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B125A608FB
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B125A608FB
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lHmroS9J
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B125A608FB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  3 Jul 2025 16:58:20 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-235d6de331fso2077425ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 03 Jul 2025 09:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751561900; x=1752166700; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nfdd40hGPW9+mSHHbH6Co29MQZFw5Zd3l8gaeJvJ/Dk=;
        b=lHmroS9JTH43RdL9LrZ0gYLAZSMgVB8q+q5Iv6nvVPUZGwD9tLlQxr/2dC5Zn0QHR3
         pNlp8u3bIqy33Ya2pd/0RtWLk6JazobsSExs3acKt939/4f2JwDX6ltwqqxCxXPUls+u
         9wKeNmCvkXU6FwcuNfCCYwg8omBJGFdpBJ1hvk6GJhEOIOxqsOU3ZvZWCpAiqsH0LbVC
         PqL5RjzOhLxjCZ+D4aQXcVH47aE3i1hvYLU+AkrAECn2R+0x19SM5V4aSb0jFnOEl7l4
         OJez9eaimmyuppE5q36uEpcb81Q0pmKlDUBbWLqzUGGxKaX7N/Mgy00MJSzX/Pl2JBWU
         Vyjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751561900; x=1752166700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nfdd40hGPW9+mSHHbH6Co29MQZFw5Zd3l8gaeJvJ/Dk=;
        b=OHMk5nggdvdE1YF/FJw4USWbWKmZdWZtm3cRKEBjXyOiG6Ot/gHwX7fCxYERT4dJ7V
         tfvw9lRcN33XIO8i1/ndTKAhpzieQusf02AKwKQeFNP7r64FoXx5Yj8L61z8j8M8GcsH
         9MPyz2bx65Eg1peZ78w6Zj6TSiXmKdBqzJpgfJkaD78nE8rr1e04B09RQ7EJ+WCJEEpo
         HCULMFnJ22lhUKlOd/Q8C1R8kRLNOPlPqItf4iY0BVVm0xFXYuoVP9RRXtN3op5wDEQ4
         +ecQBMs5eP46uuOCxM8Bbey6tSjBLBQNhh8HN+CnzSKlwfQrlEsmsFU7U7xV3pm92s9/
         wa+g==
X-Forwarded-Encrypted: i=1; AJvYcCWniGM+QBC47fVYgxlUCtr0jxBd/CsNpNVsE8kyEMTptiaAivgKMcR31ilcIlBItJpoCiA4jqhuGh5v8pK5oE5mdAe3XA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yywdh7jbz0/x71RJqIzyPrw4NUkILSaPzcEwRXmV/Ts2aETztjY
	6/slvNnAJlot7PbrTpDAWAvrvA1nbhqx9LPzK1RV84oSVVJYvczsoIP/
X-Gm-Gg: ASbGncvVYiWMajnYI2SobtBL/Sw9wKqiyEHHpDWa9DAttAvnv4QgxBq0Ax1/MJkfSGP
	eNjNxk8L1Oi/K7hn3GnfJaOjXbGmo5aWB53JCGsOCiPe7x106phdp/ZD6UtiguBHZf9SZEgZsGM
	SbRe5LviqpWMXSl5Y4HfR+TRhzG6HOvPfEcwXqXUH5Rf3vW1dvrlyij53SoTpD1msPMWY7XUx1w
	sRJCUjzYr7jkVpg0THaY1BnCewe6UDqP5LvxIqbIXbtBRpdk+1ebOhfAZH8O+o0cSn4s5wasRMW
	GGlm6dDm1ScXNeVZLAKSiaR/u+aMfhNxAJSAz8GY18XpPtszagRoaiC3nFbb
X-Google-Smtp-Source: AGHT+IH8FObvGV7iLQxpoXaMWI/xlTrZYbrAR5aXp8VpSULc6F5ZzAmEgd7yWsFD0hTIxulY4uJk9A==
X-Received: by 2002:a17:902:f745:b0:235:799:eca5 with SMTP id d9443c01a7336-23c797ab3d4mr64095645ad.44.1751561899962;
        Thu, 03 Jul 2025 09:58:19 -0700 (PDT)
Received: from mbox.localnet ([36.50.162.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8457f308sm292935ad.149.2025.07.03.09.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 09:58:19 -0700 (PDT)
From: akshay bansod <akbansd@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iio: st_lsm6dsx: Replace scnprintf with sysfs_emit
Date: Thu, 03 Jul 2025 22:28:13 +0530
Message-ID: <2413481.ElGaqSPkdT@mbox>
In-Reply-To: <aGaIMjkYBmfMmCBn@smile.fi.intel.com>
References:
 <20250703053900.36530-1-akbansd@gmail.com>
 <aGaIMjkYBmfMmCBn@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Thursday, 3 July 2025 10:12=E2=80=AFpm +0530 Andy Shevchenko wrote:
> On Thu, Jul 03, 2025 at 11:08:59AM +0530, Akshay Bansod wrote:
> > Update the sysfs interface for sampling frequency and scale attributes.
> > Replace `scnprintf()` with `sysfs_emit_at()` which is PAGE_SIZE-aware
> > and recommended for use in sysfs.
>=20
> 'must' is stronger than 'recommendation'.
> Of has the documentation been changed lately?
>=20
> ...
>=20
> > st_lsm6dsx_sysfs_sampling_frequency_avail(struct device *dev,
>=20
> >  	odr_table =3D &sensor->hw->settings->odr_table[sensor->id];
> >  	for (i =3D 0; i < odr_table->odr_len; i++)
> > -		len +=3D scnprintf(buf + len, PAGE_SIZE - len, "%d.%03d ",
> > -				 odr_table->odr_avl[i].milli_hz / 1000,
> > -				 odr_table->odr_avl[i].milli_hz % 1000);
> > +		len +=3D sysfs_emit_at(buf, len, "%d.%03d ",
> > +				     odr_table->odr_avl[i].milli_hz / 1000,
> > +				     odr_table->odr_avl[i].milli_hz % 1000);
> >  	buf[len - 1] =3D '\n';
>=20
> My gosh, this is error prone. I'm wondering when some CIs will start to
> complain on this line. But this was already before your change...
>=20
I'm planning to drop It entirely or should I replace it with another `sysfs=
_emit_at()` ?
I've seen other device driver returning space terminated buffers. Maybe I'm=
 overlooking
something.

> >  	return len;
>=20
> ...
>=20
> >  	fs_table =3D &hw->settings->fs_table[sensor->id];
> >  	for (i =3D 0; i < fs_table->fs_len; i++)
> > -		len +=3D scnprintf(buf + len, PAGE_SIZE - len, "0.%09u ",
> > -				 fs_table->fs_avl[i].gain);
> > +		len +=3D sysfs_emit_at(buf, len, "0.%09u ",
> > +				     fs_table->fs_avl[i].gain);
> >  	buf[len - 1] =3D '\n';
>=20
> Ditto.
>=20
>=20

regards,
Akshay Bansod



