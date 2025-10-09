Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFE12D321D
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  9 Oct 2025 08:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760000233; cv=none; b=MCtMaQw6PU9VODfvA7tP1wBmdK1h+y+Vh88mmXJ/GK/dgqZMXas7g/s9B0IF6D+SotpH3gDtQdjCfhj2q+Ugjz8Ofvav0a4NncHehdIZecy2ye0hH9dRS6TQx6xshtqeGdk/CQjXg+iv0K96GEoGtBxLgIl8vOw+y/xsAVMjRyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760000233; c=relaxed/simple;
	bh=HiObraWyRHAfPwn43/lMyitENL/dZ7TO4iiibkA0miM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dm7AlOW89sfGOSzPRLaYvEfoSIgHPg8mmyYREtbUIVna2wvcTJl/2yArrx3t6l+Z1tNdCInqMgez032sd8weybKqzqkFAaL+UocVFn2NVypChZ25M33NMlT25hENHHHSNj1P2rLObszgDRerR5tyZzPkitYCSjlnK0z88ltjf9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=jTvacKpY; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="jTvacKpY"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-639df8d869fso1312706a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 09 Oct 2025 01:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1760000229; x=1760605029; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tehd6TigRZIFeKvV43jFxd5P2fyWIrIsVUguA2VauEc=;
        b=jTvacKpYh8+LNb6zVmlfuE1VKb29m2Ah7uREwzyiCL6NJlfjRe0yaeGpGx5rrvprIV
         ezS7LGvmxrbJcJLyikh4A+suomjYujje5n6lvCBL5VO3RXWdhb+f8oa8FNwG42swDrxs
         VwTPj8dPiazP5IoE/0SHKmpSBJtUdRJHkqBPp9fHFOp1uWptxQ7mQ/5xMjgbJ5+nw/9O
         TwrFlMpckgAk/WS25/oBYxGKtDEshpm5cpYHKtI1cNtP6n50/rVoY4Sk7bLAfAPJv08n
         LuzNywcPnuiooHeMxA6R0gQ9lQifPRA+gcQoh166ic5quMU08gTO0gMishjs0kDWaCdt
         5ShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760000229; x=1760605029;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tehd6TigRZIFeKvV43jFxd5P2fyWIrIsVUguA2VauEc=;
        b=bMe6I5fwmiR6RMd0bYsedZcEUoT2c7tNxJHHDJ2TztfvmIpJCymNIWrUAhteUpluPp
         FSZzwmc0MFMdEyi1r5V17L5L8aE+PaveJje2g5VSWyluLs9zUIxRr0IGYckAQK7OZcd9
         asmmvbCDCTWrWq51WJrRRDOJtXShNaDT3NIBjbzQB+aSujI3IyNxAlA9iJ1IrKrzKMPb
         Ct3eofbaM0zg3Arhki7BpwmBSXGLVFWajmanq/yxHDpGu1w6xiAjGUvWhCuIUq2F1R09
         xvRbp7rtPsI5RbUoNAItBefa96F8GdK2reCtOet2zNtLNj/uXXaGfsW2PfJESUCIuuKd
         UH6w==
X-Forwarded-Encrypted: i=1; AJvYcCVq1KMkMyool9hMnfdeyWMjqosv7HhZrlam/1Efzk0S/NX9rIM2lkVrLy6CUZw4LhTA2KL1RAk4BFx4XYPCFMAeDfGuHw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzacln9uxHWkWZ71nBNuG5cWY596R4Sda+efnw59lCGD/Musb82
	HyJu83HlEzkXsE3oBsUrisIkI4SvNiSNcgt3GJn7BVpXOyhHEHdU87S/+vuFHsS7gCc=
X-Gm-Gg: ASbGnctEoiwx6zyzn9H/7R0ULoPBTMIBI4zBBAaAQETi6Fdhm83AjsHLCTX/DGBN/iV
	3DERKoF2kg502q9Z9+7LapgRopvfAleJqBrp5TMAqKOIk0theFGdY8lTJksoE+YCWsVmp9EBhgJ
	pYfmcK1B8VgCFDOpJXUuLnftzQKpDKkKUhbOFAXpSsTaiCyXHVWoU8Ysv5f1Ekh4bmiAdHzXmk3
	0gHXgTQdbWK3xNHTr2Itzp5gg1v9QmAJs5Nnj2y3OX5eVk1U/2A1VTgcecQ2bGN2ZFBmWP+8JVL
	96Xn7wK5z3qlsp6qCr85USNamKjVQCqfn6jdjSjE13/gfjhRTiYbbPqD1yDnNgql85q95o0SACf
	J4VBh1RidIl6MfVmhjrsSRi1BT1KNT4oO4CZ/Xj5jRmp77B0AzL4=
X-Google-Smtp-Source: AGHT+IHZMQ66dbn0HYqgUWqtOKY+6W/hbvSvLLM0DsnxT0WoK6ke4PDsI9taPpSLoFon0ighiqsLSA==
X-Received: by 2002:a17:907:3d91:b0:b42:f7df:a2ec with SMTP id a640c23a62f3a-b50aa391ec3mr705746666b.9.1760000229110;
        Thu, 09 Oct 2025 01:57:09 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b4869b57f0asm1854008166b.77.2025.10.09.01.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 01:57:08 -0700 (PDT)
Date: Thu, 9 Oct 2025 10:57:06 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Rakuram Eswaran <rakuram.e96@gmail.com>
Cc: ulf.hansson@linaro.org, zhoubinbin@loongson.cn, chenhuacai@kernel.org, 
	david.hunter.linux@gmail.com, skhan@linuxfoundation.org, khalid@kernel.org, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, kernel test robot <lkp@intel.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH] mmc: pxamci: Fix passing NULL to PTR_ERR() in
 pxamci_probe()
Message-ID: <pe4sz3hamkxhahvwqzdq3p3q5u3yeqpdscl5rvvoo5gdfbbrl7@joiz2oj5y4so>
References: <20251007161948.12442-1-rakuram.e96@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="abfyiat56trvwoek"
Content-Disposition: inline
In-Reply-To: <20251007161948.12442-1-rakuram.e96@gmail.com>


--abfyiat56trvwoek
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] mmc: pxamci: Fix passing NULL to PTR_ERR() in
 pxamci_probe()
MIME-Version: 1.0

On Tue, Oct 07, 2025 at 09:47:44PM +0530, Rakuram Eswaran wrote:
> Smatch reported:
> drivers/mmc/host/pxamci.c:709 pxamci_probe() warn: passing zero to 'PTR_E=
RR'
>=20
> Case 1:
> When dma_request_chan() fails, host->dma_chan_rx is an ERR_PTR(),
> but it is reset to NULL before using PTR_ERR(), resulting in PTR_ERR(0).
> This mistakenly returns 0 instead of the real error code.
>=20
> Case 2:
> When devm_clk_get() fails, host->clk is an ERR_PTR() resulting in the sim=
ilar
> issue like case 1.=20
>=20
> Store the error code before nullifying the pointers in both the cases.

Why is the pointer set to NULL at all? This is in both cases memory that
is freed directly afterwards (as `host` is devm managed). So I'd claim

diff --git a/drivers/mmc/host/pxamci.c b/drivers/mmc/host/pxamci.c
index 26d03352af63..404f78198252 100644
--- a/drivers/mmc/host/pxamci.c
+++ b/drivers/mmc/host/pxamci.c
@@ -652,10 +652,8 @@ static int pxamci_probe(struct platform_device *pdev)
 	host->clkrt =3D CLKRT_OFF;
=20
 	host->clk =3D devm_clk_get(dev, NULL);
-	if (IS_ERR(host->clk)) {
-		host->clk =3D NULL;
+	if (IS_ERR(host->clk))
 		return PTR_ERR(host->clk);
-	}
=20
 	host->clkrate =3D clk_get_rate(host->clk);
=20
@@ -704,11 +702,9 @@ static int pxamci_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, mmc);
=20
 	host->dma_chan_rx =3D dma_request_chan(dev, "rx");
-	if (IS_ERR(host->dma_chan_rx)) {
-		host->dma_chan_rx =3D NULL;
+	if (IS_ERR(host->dma_chan_rx))
 		return dev_err_probe(dev, PTR_ERR(host->dma_chan_rx),
 				     "unable to request rx dma channel\n");
-	}
=20
 	host->dma_chan_tx =3D dma_request_chan(dev, "tx");
 	if (IS_ERR(host->dma_chan_tx)) {

is a superior patch.

Best regards
Uwe

--abfyiat56trvwoek
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmjneOAACgkQj4D7WH0S
/k4H/Qf/caIHRDrNP2OZZWaTAwpTU4YgeIGVsaqKVOCxJtPIl/kUO2W0PRXb/k7A
KbdrnygmBtHhSZeeDIJEbBPQtdj4vmGvGbVTC0LoOgbJxOG1AUSsqB32JjUC6cCk
QUZbvY1EjoYUCOmZWxsJYxBQA6LcBOeQPR/pXW8wNv/uc5dHwXcYcrVS4ZoddCe2
gfCldJdsaUTqSf5Uk2EC+e54x7buJHigSseQdEP43QLVBx4n6Z3kJpuw+J6djT4y
NYDCNSDp8wSnRqcBoviiHmr7+lT51f+LFhEbDfxvdXtKgGN1flo7py8tEB5JkSDx
pEHwloQTiVr6XIYLRM12qgDvhP5WTg==
=TQg9
-----END PGP SIGNATURE-----

--abfyiat56trvwoek--
