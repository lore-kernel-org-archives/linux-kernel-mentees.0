Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48974253F25
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 17 Apr 2025 15:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744905241; cv=none; b=YsaYHSV0xlTZM1WkbpJFZ/2u/ulIr4BcRBD40Z8y4eEhor1UryIAUdGuZQNSQKHln0c6xD7rEUbRufFEbyKN9lRyCjfA9gqXR3BXfjGPOh09JB0nPGeIlg1zigcsHnljthqD5FOUKLpfGKosTKsNUZ5nM7L2sLEBb56PEPOp/EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744905241; c=relaxed/simple;
	bh=ZIBfrh/c201PDhvEu0wpq1QFp8dzTYEC0yDBA/8kVyE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e1wuifzAEA2kvjAI1gHN+cehAJCY/xVc6z8um48usWHePMjEul7QtW1FNAfNbPfWhWPZIrLeE66tz7rFqevz7ZBLsInwlw0KGF2jg5Vfdu8y8MlnUFe4w9vG5enAxLZnzngoXWdD2XI0V3iqNOab/1LVZInlZtA+mJUxm/I8UNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=CiN6Hkn2; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="CiN6Hkn2"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 34A6A240101
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 17 Apr 2025 17:53:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1744905237; bh=ZIBfrh/c201PDhvEu0wpq1QFp8dzTYEC0yDBA/8kVyE=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:From;
	b=CiN6Hkn2jpDgTZz2Wie9Y97B6G/CKVswp0PfEZocu+aAYVRAp9atFDkI9qlP6Hjkg
	 eSzNUhBCmYpzvukvtPFCovY/rxlbRUZSIbIhw8rKhL8k+OIgq2t1YUtkqiuX5mzvrL
	 gtDjOwwuIhfFfdof91DPXrsB4iHRnNPNmLlvDixF5geAkfGt12nm1DeQQXF4IR+4BG
	 W42AHTb4iRsbv1mZvYD5IiiyDvonCa0znnmbB+PNCF0sOAoVgcLKmYWWad+Oho0hq+
	 plwvb+M8GOIPxo3rSnbB7qqKAHNtaDfPvNXOhm9J0+bkNGMjsur8k+KU5nYARZz/RM
	 HI5XFH4ixUiMQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Zdj9t5XRkz6txd;
	Thu, 17 Apr 2025 17:53:54 +0200 (CEST)
Message-ID: <56edfb88d3f31939fb343149bfad436f24671f9d.camel@posteo.net>
Subject: Re: [PATCH] iio: frequency:: Remove unused parameter from data
 documentation
From: Charalampos Mitrodimas <charmitro@posteo.net>
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Cc: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, Michael.Hennerich@analog.com
Date: Thu, 17 Apr 2025 15:53:51 +0000
In-Reply-To: <20250417143220.572261-1-gshahrouzi@gmail.com>
References: <20250417143220.572261-1-gshahrouzi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2025-04-17 at 10:32 -0400, Gabriel Shahrouzi wrote:
> The AD9832 driver uses the Common Clock Framework (CCF) to obtain the
> master clock (MCLK) frequency rather than relying on a frequency
> value
> passed from platform data.
>=20
> Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> ---
> =C2=A0drivers/staging/iio/frequency/ad9832.h | 1 -
> =C2=A01 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/staging/iio/frequency/ad9832.h
> b/drivers/staging/iio/frequency/ad9832.h
> index 98dfbd9289ab8..d0d840edb8d27 100644
> --- a/drivers/staging/iio/frequency/ad9832.h
> +++ b/drivers/staging/iio/frequency/ad9832.h
> @@ -13,7 +13,6 @@
> =C2=A0
> =C2=A0/**
> =C2=A0 * struct ad9832_platform_data - platform specific information
> - * @mclk:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0master clock in Hz

Hi Gabriel,

This seems to be a leftover from
566564e80b0ed23ffa4c40f7ad4224bf3327053a ("staging: iio: ad9832: use
clock framework for clock reference")



> =C2=A0 * @freq0:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0power up freq0 tuning word in Hz
> =C2=A0 * @freq1:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0power up freq1 tuning word in Hz
> =C2=A0 * @phase0:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0power up phase0 value [0..4095] correlates
> with 0..2PI

