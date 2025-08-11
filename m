Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D852C21DE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 11 Aug 2025 17:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754931605; cv=none; b=Zzm1lW/dhXkc0JWUJat4B5CfwYuzjVHzpQyci/9QamhHOcigmUKKWODLS1QYgIjefvydkNOfkfjAZjwuX5ULZos/0lw5fMI3uA2xifWM1HPNjN3KPNkOZFvTjcHsVhCEiIF8v75Q3PFr2Yn4hDhQh6lOO/6wNEO7Hq0u6Q4+qZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754931605; c=relaxed/simple;
	bh=FM4j/KLa0Su57Gvjd7AN5fN2uWKuVf7TUWmimPrZGA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tsk39KMQ1L/15/tHnMB4V6Tb+DToyR8TIZ2eASSLy44Le6dCG6gpzjQz/t8D2Vati9TghWHX5XvapUI1msRXbjubaKm2RTQg7WQKaD/pz/fWvBc2ACCWWdsW9qF1kRmy9du3U40rCUp8m/bRl/iZnr7FjoVwT1IULGysW3I6KvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=doS16usm; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="doS16usm"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 367D440ED7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 11 Aug 2025 17:00:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DUIspqS-jXfZ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Aug 2025 17:00:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=akbansd@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5250D40299
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5250D40299
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=doS16usm
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 5250D40299
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 11 Aug 2025 17:00:03 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-24063eac495so35329125ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 11 Aug 2025 10:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754931603; x=1755536403; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b70QEBMuVk1XRVGfOT/SmxeLFQr82ewV2GdsPecZp9k=;
        b=doS16usm04mczSAxWtZ7VJ9B2zQPd8l6SRbGLefCzpCl72YuuItgXdXWY+1zGfjrsa
         vtyXobPbgEbFeEE5EV46O6oFSss97ef80mlJRmrtC4FoAKzARa165AfAjfxpES0G6cmS
         1c4NxOVDl+9YvkA3mKSNohc673MVOdp2qoI3TTgCuJ1mYoRLGVHPxmu4V9kMcvNpZDa8
         Hwkt8k1s4qeo+YGED8W79RLFI8HS48C8Fxsxz0V6aFwgVicyVJcgGKjrjzn001ZfZk1g
         201qWc0qD3/bLY86bi69wP+ttbA+7j528XGJzBKL7kXOxaay2ic1PsA+60+Q9uGNMsZ1
         wpWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754931603; x=1755536403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b70QEBMuVk1XRVGfOT/SmxeLFQr82ewV2GdsPecZp9k=;
        b=Y7o/HJXqTKqmLXGElYKqLP3utcYm8D+cnduyhwRpmPF/isadrdCUYcT60A5caHvGqk
         P7JcxGQyuGFI25+oxzNP2A5x9Jw7kO0+Tm+TZzA61fi4kmYKaQfkaDPlwB8eZ5L9i1MJ
         Mo6Jvec1qbTBBjI6zCQfMmQ2RIyb13Hi0keZLiSO0ZjAB+wSxuGpWE0xl8+fP0DlMAi9
         s3FrolRXzAYpQdKtP7WJPzn+dnzTx+hMvymPUjQecZAOb+GzJrb94W8BiZTvg/oyhsQD
         yaUgMQBVYhy0LviVL4lNLYdnZerkd6z7efVfqnHwLKAA5sGNX0i4Gy36A7c9zHgV18Vn
         ewQw==
X-Forwarded-Encrypted: i=1; AJvYcCUckdz1uoCsrDB15JSP7NeuXRYV5y/dPBQAhG4Kul9wMMrOAjObxNSE+if/oU/vfZUSC/xZJOL/PRVsugckxI0pWu4EBQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yw7XlFYRUiHAeBBpmAgr3F9nWUhcxnBiBzOcp0TD4ihgOevdzy8
	gb3Xmcp2jp4LwGAwSlkPLXdyB4Md+Mlb5q+L9ieYomM8dV2i7Qr9tISZ
X-Gm-Gg: ASbGnctQngyjAT6n8tjXLil0GcQ9S5gade8PKt5DliBtCTqoC6xIdabDsf1/nrnAc46
	Hnjj/De4PuYMMqpW/O/KR1rbTOFRpIHZOfoCLGgXOp/dJJXcnfG8ietAq6v3f+A4ZctY4s5bBJp
	q/TGLJ+5FeOBPJsreeoXMNSv5eQo2WBL9/G5RQpJi/RR4WEKFpWExZKIlpu/5XxB5oRaoH0lnoF
	O9t2S0NtH6tN2D39yKDcCAZITacRj/iKBw3RET+6mymW1fgVADIvFuPdsriTMxKDGVy5xkC6uTt
	mqO7hceLUPq+FgGYzfH7l2PR4+f73RG3RlySOrBHjbzKa4dl7DWcUw4YTHWk83UcMqiyHkcz85s
	MB39DJGZ9TD8cKv5BPGYadxs/
X-Google-Smtp-Source: AGHT+IH0zWSFZlX6bq67OkLzvNoVEetQmj5bpELLZPknl/+OFNeXJ8jejEywySmXdVtYBA0wrWlIEg==
X-Received: by 2002:a17:902:e54f:b0:23f:d861:bd4a with SMTP id d9443c01a7336-242c21dd44cmr188020895ad.27.1754931602588;
        Mon, 11 Aug 2025 10:00:02 -0700 (PDT)
Received: from mbox.localnet ([2401:4900:1f3a:31cb:81d4:471d:6f8e:380b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8976c40sm280902885ad.84.2025.08.11.09.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 10:00:02 -0700 (PDT)
From: akshay bansod <akbansd@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Jonathan Cameron <jic23@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
 David Lechner <dlechner@baylibre.com>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] iio: st_lsm6dsx: Replace scnprintf with sysfs_emit
Date: Mon, 11 Aug 2025 22:29:21 +0530
Message-ID: <13797318.O9o76ZdvQC@mbox>
In-Reply-To: <20250802125038.7a02cbce@jic23-huawei>
References:
 <20250723141359.11723-1-akbansd@gmail.com>
 <aIIdU7mJi_cEdRuI@smile.fi.intel.com> <20250802125038.7a02cbce@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Saturday, 2 August 2025 10:26=E2=80=AFpm +0530 Jonathan Cameron wrote:
> On Thu, 24 Jul 2025 14:47:31 +0300
> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
>=20
> > On Wed, Jul 23, 2025 at 04:41:00PM +0100, Jonathan Cameron wrote:
> > > On Wed, 23 Jul 2025 17:42:28 +0300
> > > Andy Shevchenko <andriy.shevchenko@intel.com> wrote: =20
> > > > On Wed, Jul 23, 2025 at 07:43:59PM +0530, Akshay Bansod wrote: =20
> >=20
> > ...
> >=20
> > > > >  	fs_table =3D &hw->settings->fs_table[sensor->id];
> > > > >  	for (i =3D 0; i < fs_table->fs_len; i++)
> > > > > -		len +=3D scnprintf(buf + len, PAGE_SIZE - len, "0.%09u ",
> > > > > -				 fs_table->fs_avl[i].gain);
> > > > > -	buf[len - 1] =3D '\n';
> > > > > +		len +=3D sysfs_emit_at(buf, len, "0.%09u ",
> > > > > +				     fs_table->fs_avl[i].gain);
> > > > > +
> > > > > +	sysfs_emit_at(buf, len - 1, "\n");   =20
> > > >=20
> > > > Still looks a bit weird (while working).
> > > >  =20
> > > > >  	return len;   =20
> > > >=20
> > > > I deally we should have a helper doing all this under the hood for =
plenty of
> > > > the (existing) users in the kernel. =20
> > >=20
> > > hmm I'm not sure generic is terribly easy =20
> >=20
> > I agree, I have some plans for %p specifier extension, but I was stuck =
with it
> > and it in half-basked state in some of my local Git branches.
> >=20
> > > and I'd prefer this using the
> > > read_avail callbacks that require the data in an array where ever pos=
sible.
> > > Mind you that does the same print at len - 1 as this.  Let's play.=20
> > > Completely untested.
> > >=20
> > > 	for (i =3D 0; i < fs_table->fs_len; i++)
> > > 		len +=3D sysfs_emit_at(buf, len, "0x%09u%c",
> > > 				     fs_table->fs_avl[i].gain,
> > > 				     ((i =3D=3D fs_table->fs_len - 1) ? '\n', ' '));
> > >=20
> > > better? =20
> >=20
> > Without extra parentheses this makes the job.
> >=20
> Akshay, can you spin a new version along those lines?

Apologies for the delay. Here's the revision
https://lore.kernel.org/linux-iio/20250811165641.1214347-1-akbansd@gmail.co=
m/


> >=20
> > > It's definitely not more readable than the above, but it does avoid t=
he write
> > > to len - 1.
> > >  =20
> > > > In any case, I leave this change to others to comment, I don't obje=
ct pushing
> > > > it in this form, either way len - 1 is simply weird. =20
> >=20
>=20
>=20




