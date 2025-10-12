Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DA816D4EF
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 12 Oct 2025 14:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760278552; cv=none; b=Cg+NbddNiX6UX2pPDf8ggqUjtmUsftIpEsCYUYwpSIWtyXmuGFPWZ2yOPYQDaahSy/7hVIYBdScQKv8ryXn8n/FGdTFQpogNrBTt2OcHeQVsmE9K/sBaZlXh+7H5eOytGnjIAfPlJpgxkDtKcTPAPBOffDBi8tvrEb48VLt9/9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760278552; c=relaxed/simple;
	bh=pQYo3AL0hKKQM74twJtSkHbfx6sfxE/SN/JlvBlE2gE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VPqxIQ4T+oOugXfzIjTFIHXSlfTxcf7g/EwqHIj4H/ZIePT7YDsVTaWwYwGRYwSOXpKF2oUOt8CsD8K4DW/oulm5vJAyRd3P6sr178mvMjv2t+vItp49VwwmI8+/0gUOuY1o6dKpDwUrwGTkgszbnuTTXCm58vFmmvRbmf0Ax24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=gGIrOYA5; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="gGIrOYA5"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b48d8deaef9so616348966b.2
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 12 Oct 2025 07:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1760278547; x=1760883347; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2XMzMC6esunaiQcFjYreM2qMVnAAkLc/iCHafaRbgJo=;
        b=gGIrOYA5Dc0DpOn+gz9HrCPfNS0ON86bwkp1+yxZ3K4gJmr2ULLZTdHEmAsOejh/7g
         4AnWc0kHkDhCoqoU+v/9aq9qGJr9uZWfOFoCU2mFTFLosalrlMm4nqkC7YgglL+ZeTww
         Q1s7B25n7+HagSjcP/YN36bctjBGslsT8uZs4Ex+hxc0GwlGVM0G1musdMEKziXTowK5
         Jg4Ikj7i2R2PhJP48ZnA4BB/9MDZrAyMF4jnU4w4YF/Q8bP3qrg2GTSmx6GpXLauZjoh
         RIEph5GbjNazz4hE58c/p9sVJ1O/+r/4p+guX4wmVEUGCEow2uLJrq8KUhjM23lq7NJS
         FPrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760278547; x=1760883347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2XMzMC6esunaiQcFjYreM2qMVnAAkLc/iCHafaRbgJo=;
        b=WzHR5pVJ77Z2FQA0iBFWTYq+hgLSb4I1BwwSpSmafCohOMdZ3KAQz3MFcB84AM41kV
         1277kbUkB3W4CF/2zNlPzhanmMhlGDw3tDGMs/a0ep/rIdoTuyFERAWqWs2t5BOWp1Sk
         beGyL+CsdzNdzEgl9xwO0EqsOzkVUloQmrCpM0PGkaVZwNYiln2gGm4NDWNUSoruXFjl
         Jj9/vQhHEVVJDMCNSfpo3NvoV1HNdTz4iBwJsck13+scgHucxjQO6rmPpJDLSB1XNI0F
         JF3mpCX5zqHU/YxxkE3M1tSej5CzBeGnx5lOgQTmljBcdrxBobsMyV7XmsHLNgCwCM+N
         hlfA==
X-Forwarded-Encrypted: i=1; AJvYcCUvwwLIQdZPMgciv4T0aQ6vNB/iKRJrwK1Cq/WsiLrwc1V8ErSNRYlJkXGZgcvhTupuolJFSG4yhBvQuxbHejQVT22NMw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxzf70sRdi0iT6hQ13bo2c4LJPPFcQ7vEOhzhp/v0E2mJnCknu6
	PxZlBupncM/A/6QIJf7nKuMM9egQ0udxCWQ9W0Vz9Zy8d00k0+SpBU5awewe3C5x0GQ=
X-Gm-Gg: ASbGncuoqy43CoLzWUDgCZzwctSPnfM3NB4mrVxQmFZwI4T93UbzxVhu0thJrBIM5ws
	0lqhcHfZn864nG/OPRKTZu8/RG5huyY5gNWJsmLqVdKyy3HYXV8JCDJI9L77BzsO3/e0a2gixT5
	0TbLHqpQ1mLsKCsEOFupko5uct76Lm9c/tFHD/Tr4AweVY2bGNJ8hSPiIJ8+tq8k0WS9xQC+L0c
	t4SIWQX3uciMABkV8BTIKeQwghcmLEjhGql/iv/hRzhuiyCS7citQKWNaVA9hyzM0/oE9meMDO5
	LdVHzrbNXWw5AWB7es2Ywh1S0V2+Wewm/X906KxmwOXhQ9V+7f+2VO6u3cDZGN2so8zefPMh60z
	EERWiwPKHqKOdCufiph7z2J//J9v4HiGDukPzAOP+ZlU3xQ==
X-Google-Smtp-Source: AGHT+IHW9hfSXC3QTPqo0OscrZQ5y9QPHTSmHKiSG71n5Gr9WACU3hTAEq7OXxbr/C9bpmT+R4SoBg==
X-Received: by 2002:a17:907:7290:b0:b45:a03f:d172 with SMTP id a640c23a62f3a-b50acc2f5bemr2022051166b.57.1760278547399;
        Sun, 12 Oct 2025 07:15:47 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b55d9526885sm722816166b.84.2025.10.12.07.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 07:15:46 -0700 (PDT)
Date: Sun, 12 Oct 2025 16:15:44 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Khalid Aziz <khalid@kernel.org>
Cc: Rakuram Eswaran <rakuram.e96@gmail.com>, chenhuacai@kernel.org, 
	dan.carpenter@linaro.org, david.hunter.linux@gmail.com, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	lkp@intel.com, skhan@linuxfoundation.org, ulf.hansson@linaro.org, 
	zhoubinbin@loongson.cn
Subject: Re: [PATCH] mmc: pxamci: Fix passing NULL to PTR_ERR() in
 pxamci_probe()
Message-ID: <xxtrhbv5qm2crtvc5ejpgu5caadsmms3rfulmosjwq7lumrko3@5mlcpk24hymm>
References: <pe4sz3hamkxhahvwqzdq3p3q5u3yeqpdscl5rvvoo5gdfbbrl7@joiz2oj5y4so>
 <20251009152744.9734-1-rakuram.e96@gmail.com>
 <aliep4j5jmbdixu5cmqztoxwp3jv4r4hi63qpvhughepsepzb3@qh3mwgryf5ny>
 <3a73daeb-1353-463d-a1f1-22cdece1326b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aiu3n4mecyew6rsx"
Content-Disposition: inline
In-Reply-To: <3a73daeb-1353-463d-a1f1-22cdece1326b@kernel.org>


--aiu3n4mecyew6rsx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] mmc: pxamci: Fix passing NULL to PTR_ERR() in
 pxamci_probe()
MIME-Version: 1.0

On Fri, Oct 10, 2025 at 11:59:57AM -0600, Khalid Aziz wrote:
> On 10/10/25 3:59 AM, Uwe Kleine-K=C3=B6nig wrote:
> > Hello Rakuram,
> >=20
> > On Thu, Oct 09, 2025 at 08:57:38PM +0530, Rakuram Eswaran wrote:
> > > Your suggestion makes perfect sense =E2=80=94 since host is devm-mana=
ged,
> > > explicitly assigning its members to NULL has no effect.
> > > I=E2=80=99ll remove those two redundant lines in v2 as you suggested.
> > >=20
> > > I had one small clarification regarding the remaining host->dma_chan_=
tx =3D NULL;
> > > in the TX DMA error path. Since that branch uses goto out,
> > > the cleanup section below may call dma_release_channel() on both RX
> > > and TX pointers. Setting TX to NULL there seems like a defensive step
> > > to avoid accidentally passing an ERR_PTR() to dma_release_channel()
> > > =E2=80=94 is that understanding correct?
> >=20
> > Ah right, so either keep host->dma_chan_tx =3D NULL or improve the error
> > handling like:
> >=20
> > diff --git a/drivers/mmc/host/pxamci.c b/drivers/mmc/host/pxamci.c
> > index 26d03352af63..e5068cc55fb2 100644
> > --- a/drivers/mmc/host/pxamci.c
> > +++ b/drivers/mmc/host/pxamci.c
> > @@ -715,7 +715,7 @@ static int pxamci_probe(struct platform_device *pde=
v)
> >   		dev_err(dev, "unable to request tx dma channel\n");
> >   		ret =3D PTR_ERR(host->dma_chan_tx);
> >   		host->dma_chan_tx =3D NULL;
> > -		goto out;
> > +		goto out_dma_tx;
> >   	}
> >   	if (host->pdata) {
> > @@ -765,10 +765,11 @@ static int pxamci_probe(struct platform_device *p=
dev)
> >   	return 0;
> >   out:
> > -	if (host->dma_chan_rx)
> > -		dma_release_channel(host->dma_chan_rx);
> >   	if (host->dma_chan_tx)
> >   		dma_release_channel(host->dma_chan_tx);
> > +out_dma_tx:
> > +	if (host->dma_chan_rx)
> > +		dma_release_channel(host->dma_chan_rx);
> >   	return ret;
> >   }
>=20
> I do not see the need for this code change. "if (host->dma_chan_tx)" will
> skip "dma_release_channel(host->dma_chan_tx)" since dma_chan_tx is already
> NULL. This code change does not add anything.

Yes, stand alone this change doesn't make sense, but if we want to drop

	host->dma_chan_tx =3D NULL

in the error path above, this change is needed. Maybe then even

	if (host->dma_chan_rx)

and

	if (host->dma_chan_rx)

can be dropped.

Best regards
Uwe

--aiu3n4mecyew6rsx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmjruA0ACgkQj4D7WH0S
/k5xlggAgtLA7I1LRrMqGE2N6WwAa5nB4GYA3H8oaIjnY1v1N7b2t/tjbdECN/3m
wmWnIH7UeQIHQYMkvrgbI6mM04/6cozbV1BQIZoC6ZfrO19YNVaUHiSdSkVa884A
XAD/t/z+4zSPlD9pjhAg+619Ub8KrPG7yPyARwRCN2g47NG+M0nRRjk30Y7POueH
YY+3vQFFxB0F5dDqz1PDyrNZUrMiEOCbzVOulU03FaMyCEK5P2LFNKurm3yhO975
Zx9pxi/JnDAw2slWZEnq+7VcuGgzpCvACFWXwM8f5jycbwnkp5/SzyNRu9x1iwRh
6gMBuzVYVkazusRPTkjGRghdLSedgw==
=AexD
-----END PGP SIGNATURE-----

--aiu3n4mecyew6rsx--
