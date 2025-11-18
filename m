Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09D0377E89
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Nov 2025 16:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763482486; cv=none; b=pdxvRyK/EHHt3B+PvegAvqT9eCUMsoVfHmg8pB7fyVLyOxvOSI2fwi5j+YQhcubw/anlU//WhYX4pF06zs7Fry76ijd+iV1fYVH/8bPRJ1FZRiykBUPbsYM63ilDSvCh4/Fwva5e1j02iXnkggldiAYCNV/nN4d4JMubKIugr8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763482486; c=relaxed/simple;
	bh=r34v7Chf23CjeqxCGh6jBGLpEJIxJ6vqN9qGWv4CVbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cuPaW2AD3HA3I+ZL1TSeQCmBDGlb1hkEM2RtMTaUnlWSy51InMBbzCjyKXAtXZH1RrgkyIdtwLCXKGFIQyhR0DQ6LUXCtBjMud1+nz09qmq7y8Bqy2inxfTh7fc5MQs3rXtCk/DLBe/yzGssITMfrDkKHGBT4MauK5sqiB0hsSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=wkgDq8Oi; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="wkgDq8Oi"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47118259fd8so43048365e9.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Nov 2025 08:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1763482482; x=1764087282; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r34v7Chf23CjeqxCGh6jBGLpEJIxJ6vqN9qGWv4CVbc=;
        b=wkgDq8OiWCV7EuMC+lgm58ICqKibxPKB1AdQPbY1DrR590EmOqMS1+xdwa1+lQToed
         DAnuGZc+2WGywXRmH2Lh8bOwcB4F4j70abyBGwE9zd5BUnDyN/VunYPGrJqAV+5OdxcG
         x2YpmjIt7TL85fwcTF2dBH7ZbkqSpHiUWcZxgDlDTqXCCy7ouSOO5PplcGWXqGcKmBxm
         eolKlK9bgq1BjoB5GKJ7uAbZ0SlqXSHnnWH4yHKCfgMJS2c3lqvWr7p025ArkrDNB+UB
         HZAhtqm10p1ApIuv3WQ62pip7CYFsCVgVkT4Cn4i5Dj/5VZvoOeDeHowt2N4JiDuc3OJ
         +RzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763482482; x=1764087282;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r34v7Chf23CjeqxCGh6jBGLpEJIxJ6vqN9qGWv4CVbc=;
        b=anIALEN1PlST9l53BEwWxTdewQQ5BR/Saagix2VylJzGfuEMdJeqhl/ku9ozdMAWVj
         G652vz/riZFEvwSWlKIjLHBaJysiNUr+H9p2+bIoYPBqVPuVk8TJaYrm/YWg8EY5L9sy
         4I9fgk6nGP3oy0hyBdWKIO/nrW3+uT94PMxZ9PdBHqOfO/1zIfYW0i1O4YHYE/7davvi
         MMhY3A8oiuxrdosZ5yyu1cG9xFW1yYGBJht6F1+HQ16s2XZHlJiE9IyFi+KZ3vnxl5Ix
         DmwzQ6sZQo3VPM5adfNowG0bfTR7BfcTqZ5GGZzPVpfV5kL1/DascpqZqZDReeTY+IbV
         /Cmw==
X-Forwarded-Encrypted: i=1; AJvYcCWwpNSw6i/TrCI4FGUIPAvGxldtovx0QG8BDbj/xzGqaj+5My8JTiV0zQyxJauZWfQnOG/0cZncCCnt64BFOJISPrgNfQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzMyW+mPwskHER23yGsPX3+MUQ7EIGFc2/2lllihROgGoZeWlDi
	JzqH0owdsdD/bTb8e6FKfqmOYZFEqsChZTjG5mImxmUolqEzyZV98S7DoL5Y3ERsIV4=
X-Gm-Gg: ASbGncsQHoP/qtPesHbWi7C/4Hk36JVOzpq+YZ3eNZizx1mvT2lxI9CLThwqOIyHBJT
	NyiSzbBdp4agEmHdcBtlrpvMkpA7+zExFWj6AS80chWFs6m5MhbESvIupjdIsRVAONj5ry4QO+d
	MXgOyI4WMgxAppxMlZR7yc7kYPCrJbhPJkCJCXbEaFsYQa5B3x22qOtw/tDmVZkiTA5hXZ6+SSc
	T+tUIMfBwpudRISdIs1oIF0xUxoA+yllbXA4tA2yllbroSwzk2Sk3ebJ9E0Gnl4jS7oMKTVBSuH
	tgeVOAiikXfHM6pa+nYJIqUMbKwMXr+PlNlcnUuXQ6y3d0Lo4HR/MymVtMgIZKRmwFYkAWnExVY
	w47f2xsZtgaMVDrKEQN/yCxM1WJPOMSMZHakwgc2gtlPUSvcl64LNKUzbQKpY5hmr24/AmiYrIW
	ppc8uqiBojbxurMW7M5eYiQaPBv0COAzKGOFhfrsWHEucGYrmjJU1Hc0sNgzxlRKQi5TYGCVIal
	VXUdAB+h9bIZQ==
X-Google-Smtp-Source: AGHT+IGABqHzMfvrkH8LxagAZ79PiCTyK0sWiTlho7XR0w0fdDe+kwEcDbDmDQrjqn2XXZR43BkeFQ==
X-Received: by 2002:a05:600c:4f54:b0:471:803:6a26 with SMTP id 5b1f17b1804b1-4778feba6a4mr162060395e9.37.1763482482061;
        Tue, 18 Nov 2025 08:14:42 -0800 (PST)
Received: from localhost (p200300f65f0267081cfc29f03d015de2.dip0.t-ipconnect.de. [2003:f6:5f02:6708:1cfc:29f0:3d01:5de2])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-477a9de4765sm19497645e9.10.2025.11.18.08.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 08:14:41 -0800 (PST)
Date: Tue, 18 Nov 2025 17:14:40 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Rakuram Eswaran <rakuram.e96@gmail.com>
Cc: ulf.hansson@linaro.org, chenhuacai@kernel.org, 
	dan.carpenter@linaro.org, david.hunter.linux@gmail.com, khalid@kernel.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	lkp@intel.com, skhan@linuxfoundation.org, zhoubinbin@loongson.cn
Subject: Re: [PATCH v3] mmc: pxamci: Simplify pxamci_probe() error handling
 using devm APIs
Message-ID: <gp4ju4m3ypaijxnll4e5246e6qu2zk7towstua3exfazdvqj5n@5zorhuwucugk>
References: <CAPDyKFoSX7QZGv78dL10C38wY0Sg5QC1qxvhyGXJ+VUYHihP3A@mail.gmail.com>
 <20251118142317.12921-1-rakuram.e96@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tvdndur6ruxolqvj"
Content-Disposition: inline
In-Reply-To: <20251118142317.12921-1-rakuram.e96@gmail.com>


--tvdndur6ruxolqvj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] mmc: pxamci: Simplify pxamci_probe() error handling
 using devm APIs
MIME-Version: 1.0

Hello Rakuram,

On Tue, Nov 18, 2025 at 07:53:11PM +0530, Rakuram Eswaran wrote:
> Shall I start to send the patch to remove the redundant if condition
> check from pxamic_remove() function?
> [...]
> I can pull Uffe fixes branch to send the above patch? Any inputs will be
> really helpful to start working on this.

It's sensible to build on top of your previous patch, yes. If you do
that by using next as development tree once Ulf's commit made it into
there, or if you apply it yourself (and then use `git format-patch
--base` correctly) doesn't matter much.

> Another point, I would like to ask is about the below discussion. You have
> mentioned about WIP suggestion for clk_get_rate().=20
>=20
> Link to that discussion:
> https://lore.kernel.org/linux-mmc/20251020183209.11040-1-rakuram.e96@gmai=
l.com/
>=20
> Was my understanding is correct?

I think so. In my understanding clk_get_rate() must only called for an
enabled clock. (Though the wording in include/linux/clk.h is a bit
ambigous. It says: "[the returned clock rate] is only valid once the
clock source has been enabled." That can mean "The return value doesn't
mean anything when called for a disabled clock." or "The returned rate
is the real one once the clock is enabled." Some time ago I tried to
improve the wording, but IIRC I didn't get relevant feedback on my
patch. Assuming the former semantic is safe for sure.

Best regards
Uwe

--tvdndur6ruxolqvj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmkcm20ACgkQj4D7WH0S
/k4GJAf+KrHQ+u3psNlWiXUPnf+rL6rUAvcOCBRGqjCu3WVQK4DaA+NQ50Di9Sqe
0FuaHc80e0+7aAT94gkuHBxu4Q8nuBo5zyDxd56+paZZ+ffvdLu7qVupWPM0Gn3Q
BsxYETC7CRK9aMdD99qoCh0KNdQkvArM+jBPmV1sW60193vub2a2TvMjl+KtI72q
YY9QsYOAHXfV6jsyRiAT4LLXGajisGC6YgnVWysClscOANepHPJDAHssxVMvLpGk
cKy99GqMShp51vD4QwljNqZsxCLIapYDZMPNozddXLrrgQYDp1HKCOdl53KBWWAA
Lg3jqexMXcZd8gy9dCdrb57GM9RRVg==
=p+mr
-----END PGP SIGNATURE-----

--tvdndur6ruxolqvj--
