Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB99194A52
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  2 Oct 2024 07:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727855806; cv=none; b=nju7uY+d0qfw+PyCgCFsh9mSVX138ckh/YPDjfRcVTO3q04iyIRijDE0Zk7J4Cp2iz5Sb16U1p0ya69/bOlTTiqiKQ8V+P5w7tBIFczWPl/pgn1JPhQEhLD6a2ssl8UzuqRfaFHBJxIguy+ofV9X/yC7enJI/hDp+XTNohPTiJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727855806; c=relaxed/simple;
	bh=zNB5aPvFtGX3xHkTauxG+Rfp5nBAXBexbnbIbTYxA9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gz8R45aPG2RJICSc01p2LpGAdocJxZ8zOKf8IC0xF07+DFQHV29NqdvAn43LGIYd+QRprQOYX018rIk46h/qSG0ia0HgvW4Drt/1qDY5VIi0lKQtfKoDHCZ/icFhktJi4FNBtCv4ve+rhXsBbpEfVG2Y2OmSyifX2QHblqdua/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=eugGmfQ7; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="eugGmfQ7"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE61380C9D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  2 Oct 2024 07:56:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.9
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g1Kp3BS8dUF0 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Oct 2024 07:56:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=ukleinek@baylibre.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 86C5780B64
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none) header.from=baylibre.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86C5780B64
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=eugGmfQ7
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 86C5780B64
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  2 Oct 2024 07:56:41 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a8a7b1c2f2bso1029905566b.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 02 Oct 2024 00:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727855800; x=1728460600; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:fnrom
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O08lDxgSZwC02/Y7RyccoCps9zhNy47cXCSDgPSj+Pg=;
        b=eugGmfQ7YUxLDr1++mYi7acIzPmCC2ru3qKGSWu/jPEgdefVQ2JSmtOvPqPgCb80Qf
         mjEmiVh15ikPb4vKQuMWumyHKH1tXKDwo0vQ2TdkGcn/kzKk3/YGfZfJuXJDObyOQGdy
         UkiA5kUPMeHtfjYgzCNRt7erlVCttX79ADjNC1MlieVFFfMXrbTtHCE0FF50FwQsYHHY
         cEAkAzQnFw0wVp82UY3gRwg4QC5KvPU5EdrBDNXfddCmHBQucpptrIQrMmfnA1hvb5MJ
         VXDD8GF8+BRC0W2yJNDgw/5AE8F+birQ2UpSSMYy246ku4BHkWSjd0DOGNnRZ7HMDzt1
         Lotw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727855800; x=1728460600;
        h=in-reply-to:content-disposition:mime-version:references:fnrom
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O08lDxgSZwC02/Y7RyccoCps9zhNy47cXCSDgPSj+Pg=;
        b=kBTLWv34sKARM33vqpDI20LHTRTZKHJ63FIPZPMhWAx0yRn9nd1IdhIbEGhme1BTzP
         6kkpvuWRghUF3k5aSMTwBfHRaCXDlmKGYQSsW+ujTtmECEGO6lmypichbuxTgBJmPoR4
         kLt6aytLjHO/H8vux/L8k2DT/2zv7R2PO55I/Ur8aiBc5d3VF42LPukqJjoNoIxUd2+n
         go+lRrdFYUDPtW4o5uqK/UWt9eEBH78lD37XGdwSSNu9h/rO9jF33Dl2Tna/1gpoN2nn
         tU1DMSBBTfXoa8W/1U+1oM7YKkSnzyrNUJxrJRgKzYgY6qh65nQ7P6wUC5lghPjkel+t
         hgAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfgtj/xRAUuKtpCczN98Fg+jydxiU4SKVwKKuQfcjRnqAmWtWTg9c0cZ7NCl+OnxAnft8cYx3WfpBdd62tpeoIKObB6Q==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyAar8rvvN9Qc0QNVAwGPjh0Wj799m723Mjrd2buX4eTtm8JisP
	EH2XrvD8FhwDnO035Q8VXBPJ8FMxRid26d77OZKD/ZmNj8gM9mpuBOEPcvBUR38=
X-Google-Smtp-Source: AGHT+IE8u200qXGBAzQDFEPwMdjrSXJqDUZiLWhBJFDgwgHtqmfq6vo4KW4QvXEdgdad+14r6A7rSA==
X-Received: by 2002:a17:907:9281:b0:a8d:555f:eeda with SMTP id a640c23a62f3a-a98f81f652amr223080166b.8.1727855799769;
        Wed, 02 Oct 2024 00:56:39 -0700 (PDT)
Received: from localhost (p5dc68d3d.dip0.t-ipconnect.de. [93.198.141.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27d47a2sm820676066b.89.2024.10.02.00.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 00:56:39 -0700 (PDT)
Date: Wed, 2 Oct 2024 09:56:38 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alex Lanzano <lanzano.alex@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Mehdi Djait <mehdi.djait@bootlin.com>, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v8 0/2] Add driver for Sharp Memory LCD
Message-ID: <t4lefcykpoe5i36wb4x5u23sseh6drnphtivuqc3mjviat2vvc@7hg4jyhxvpye>
Fnrom: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
References: <20241002033807.682177-1-lanzano.alex@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6erctmsjfjme4qbh"
Content-Disposition: inline
In-Reply-To: <20241002033807.682177-1-lanzano.alex@gmail.com>


--6erctmsjfjme4qbh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Oct 01, 2024 at 11:37:35PM -0400, Alex Lanzano wrote:
> This patch series add support for the monochrome Sharp Memory LCD
> panels. This series is based off of the work done by Mehdi Djait.
>=20
> References:
> https://lore.kernel.org/dri-devel/71a9dbf4609dbba46026a31f60261830163a0b9=
9.1701267411.git.mehdi.djait@bootlin.com/
> https://www.sharpsde.com/fileadmin/products/Displays/2016_SDE_App_Note_fo=
r_Memory_LCD_programming_V1.3.pdf
>=20
> Co-developed-by: Mehdi Djait <mehdi.djait@bootlin.com>
> Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
> Signed-off-by: Alex Lanzano <lanzano.alex@gmail.com>
> ---
> Changes in v8:
> - Addressed review comments from Uwe
>     - Replace pwm_get_state with pwm_init_state
>     - Use pwm_set_relative_duty_cycle instead of manually setting period =
and duty cycle

You didn't explicitly mention that it's fine if the PWM doesn't emit the
inactive state when you call pwm_disable(). You're code should continue
to work if you drop all calls to pwm_disable().

Ideally you mention that in a code comment to make others reading your
code understand that.

Best regards
Uwe

--6erctmsjfjme4qbh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmb8/LMACgkQj4D7WH0S
/k7EZwf+M/ShRYq1YgwqZPW4U30npE1K82FqykS7bQJxJQkQVyLkiSYOjmtVqVp2
Gax20mtgp0qxXz7EfAfKkNxJVTUbrK/O261lnSwfGMaXOf4HIriBDcER+MuSFzRZ
MJT6PmB0L+Ariyvbj/cKAUKwvGo8Mtfjbng0Mn3eHFNLIBPsfPT5PYFd7ru11pie
xQhZnUJJxusruq9VUnWFu/9Dqkh+EhSoZYH+sjtH6U62926QbxygpTSu9sjuU/NO
5nkEDUktwwDI01FdtksIo5RtwE1Dme5xYhA/KT3TX8HNjzYQSIEmkiZzu2vG60A+
hV/vo+Rw+hGNL4whuTeh0PDGqUedag==
=7JKD
-----END PGP SIGNATURE-----

--6erctmsjfjme4qbh--
