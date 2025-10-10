Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72862D027F
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 10 Oct 2025 09:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760090370; cv=none; b=bFLvskk8uIg+ugEQ5Gz8XZvYrNtH9N/uM/2wcP4GjYq3XPBpIAsD1C7iL79a4sF93HTzeR7h04bnko5rsjwyPkwkKvHi3yLTzcMueCIIGrUZf9BEUbCL436TNr/7HFcpj0GHxUEAOlri2B9JDq2HSm1XxLIojT9k4eNzEebytMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760090370; c=relaxed/simple;
	bh=vQWMYvYYYMF9y9WflHX8XkNouS4Wqt/G/yc56cKJNGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HJg06eaX8+FFxsZdMVunQcWBqntj2D8OjzCDr3+ERWyAZwlwPPvTQb1o9MIyfDstUFHSuRzQLLF0g/dzs+aSmlAkeG/hw9uC1S+n89Jt7u6CKL8L0a9K2uq6WPTpWgooLvMX3g+HUOOVlN0xdr63AXHzFE06v9BSQ6QWNLpljrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Yt5hsTpN; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Yt5hsTpN"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3ed20bdfdffso1773412f8f.2
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 10 Oct 2025 02:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1760090366; x=1760695166; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8DzAn8h5K5sSJjaAHPz0TH/gQotZMWW1j3+EKC49O1s=;
        b=Yt5hsTpNxfKnxPFripLxESPt3K1cviEktPQBSJ/5RtzvUWUUOmPcL73oF+P41GZ4kB
         gbCKm6FEVseRlBwxnNvGnPEJS9AAksoiOC18F2hq4nZhSh9DM0bdsj7qoHsQHcRsrIHh
         tcMe//pkzdiWHy85+kIFUlg0p7/TpPAwy2gl35vsit/DC9P1i+vAv5Cvwt/XuPnIH8Ee
         8akrLsKxpw7v0zwW4kuedSfvvDvInHBckhDImwILR0KH8aUTvIjRwjewF6GGkOndGcb1
         i4i4afVrUhHKcm2+EFq+I0ktb9uiPB0kSEt57WERZ4SBcBfHP2QIudcX2f3+PLkqoajg
         2Dug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760090366; x=1760695166;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8DzAn8h5K5sSJjaAHPz0TH/gQotZMWW1j3+EKC49O1s=;
        b=KkEOYB4w2S149g8Nc+n1vg5qMjutU2T94waC/pV43gMmTYBud4ACjermynAAwun58U
         P+5FrAj8aARlXz+mkf5EA8sCHpmtVMYLNEm61/GjKuL5KZz2opl+QpiDXWthBQEZz7vB
         WQszYn6YreXMCmSI6P1m6tvpeQXKsmQhqNiGDPf8ccS/rXqzdd6Ekfqq+V1gkOSw7FAL
         R5en6hSOUn/BPL0R18Ld8uNgIy4l8/sZIIuvsldPZ4Le4EhoC0n0ZpqOsghNirgVdE9w
         QxuSHQca/jQRajFxs6gWCqTvXGI2rWXntpMiS6rjToxLBCJkcZgz6DaGloo90etMdzn3
         OEcg==
X-Forwarded-Encrypted: i=1; AJvYcCVPEcK7FhWRm3BeALnYhgPpVY/He9dYFwXhH9RXG15mAeyC/YyfDpaX8WQ/oRPZtmbuX7XqJdHy4EHKwc4OH0lnq7nkZg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwhHz3tveQjAd6j/DPH52V3h5yU6TOW4QASDQVHaluyN13KHgLH
	DhRTYjKtZ9FcUKHEUeqA6+7DkF2UqK3Hx0HWZwMKafrL+sd3LhxwngCvdJO4DbMbczU=
X-Gm-Gg: ASbGncs+e6DJGDC8iV1J7v+jQuFZmRUju6IfqrAHyk5cIFYJaJ53OKmzeYci/F3YOuJ
	24qM3oGAV5T1t4Aa+hOf5BBMhuPkUfkwKL3Y1lwicoasZUOVIp/72f+Jk1SinVrSI4mUK+rJj0+
	vw0QvATyh5RP6VoPKueoXx5fg6Mv7iT7/5FqunXbdgzXpzSBtPrkDIuU4I2g3wEOKbL5YaCKEtY
	1oczt3QZnAcYSoj+V574f0pmFX36PEpNLSVOrE2LUUM35q+H5lWd8OQjMHEtCyszz+XJivOQw/u
	p7HPYQvuoGEo+SNaxbr5N4i+LejohJACTN0VQhvLkgEPGota5BQcLF5g2fqLPJlgP686IV/zw5R
	euPl9E7FEdrWZDmWacxML9X2/HL58tGcQ0TaQxRBsz8TSy9qpHTtFRHKxPST2SEwUS1UBu4ZGrh
	rY2KyOJ5s=
X-Google-Smtp-Source: AGHT+IGBYsfMh75Hh5zxiwruYu23yH7nClDJDGYy+ble0hfKIDqxAPcoM9f6zkelCUi0z7d0tu8mqg==
X-Received: by 2002:a05:6000:1a8f:b0:3ec:db8b:cbf1 with SMTP id ffacd0b85a97d-42666ac7279mr7036053f8f.24.1760090365997;
        Fri, 10 Oct 2025 02:59:25 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-426ce5e10e8sm3345992f8f.39.2025.10.10.02.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 02:59:25 -0700 (PDT)
Date: Fri, 10 Oct 2025 11:59:23 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Rakuram Eswaran <rakuram.e96@gmail.com>
Cc: chenhuacai@kernel.org, dan.carpenter@linaro.org, 
	david.hunter.linux@gmail.com, khalid@kernel.org, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, lkp@intel.com, 
	skhan@linuxfoundation.org, ulf.hansson@linaro.org, zhoubinbin@loongson.cn
Subject: Re: [PATCH] mmc: pxamci: Fix passing NULL to PTR_ERR() in
 pxamci_probe()
Message-ID: <aliep4j5jmbdixu5cmqztoxwp3jv4r4hi63qpvhughepsepzb3@qh3mwgryf5ny>
References: <pe4sz3hamkxhahvwqzdq3p3q5u3yeqpdscl5rvvoo5gdfbbrl7@joiz2oj5y4so>
 <20251009152744.9734-1-rakuram.e96@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="54dwufa2azbfzfm6"
Content-Disposition: inline
In-Reply-To: <20251009152744.9734-1-rakuram.e96@gmail.com>


--54dwufa2azbfzfm6
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] mmc: pxamci: Fix passing NULL to PTR_ERR() in
 pxamci_probe()
MIME-Version: 1.0

Hello Rakuram,

On Thu, Oct 09, 2025 at 08:57:38PM +0530, Rakuram Eswaran wrote:
> Your suggestion makes perfect sense =E2=80=94 since host is devm-managed,=
=20
> explicitly assigning its members to NULL has no effect.=20
> I=E2=80=99ll remove those two redundant lines in v2 as you suggested.
>=20
> I had one small clarification regarding the remaining host->dma_chan_tx =
=3D NULL;
> in the TX DMA error path. Since that branch uses goto out,=20
> the cleanup section below may call dma_release_channel() on both RX=20
> and TX pointers. Setting TX to NULL there seems like a defensive step=20
> to avoid accidentally passing an ERR_PTR() to dma_release_channel()=20
> =E2=80=94 is that understanding correct?

Ah right, so either keep host->dma_chan_tx =3D NULL or improve the error
handling like:

diff --git a/drivers/mmc/host/pxamci.c b/drivers/mmc/host/pxamci.c
index 26d03352af63..e5068cc55fb2 100644
--- a/drivers/mmc/host/pxamci.c
+++ b/drivers/mmc/host/pxamci.c
@@ -715,7 +715,7 @@ static int pxamci_probe(struct platform_device *pdev)
 		dev_err(dev, "unable to request tx dma channel\n");
 		ret =3D PTR_ERR(host->dma_chan_tx);
 		host->dma_chan_tx =3D NULL;
-		goto out;
+		goto out_dma_tx;
 	}
=20
 	if (host->pdata) {
@@ -765,10 +765,11 @@ static int pxamci_probe(struct platform_device *pdev)
 	return 0;
=20
 out:
-	if (host->dma_chan_rx)
-		dma_release_channel(host->dma_chan_rx);
 	if (host->dma_chan_tx)
 		dma_release_channel(host->dma_chan_tx);
+out_dma_tx:
+	if (host->dma_chan_rx)
+		dma_release_channel(host->dma_chan_rx);
 	return ret;
 }
=20
> Also, I noticed that in the build configuration downloaded from the LKP r=
eport=20
> link (CONFIG_DMA_ENGINE isn=E2=80=99t defined), the kernel uses the stub =
inline=20
> version of dma_release_channel() from include/linux/dmaengine.h,=20
> which becomes a no-op.=20
>=20
> From what I understand, when the DMA engine framework isn=E2=80=99t enabl=
ed,=20
> these APIs compile as no-ops through their inline stubs.=20
> Please correct me if I=E2=80=99m misunderstanding how this works.
>=20
> Please let me know if this reasoning aligns with what you had in mind.

Sounds right.

Best regards
Uwe

--54dwufa2azbfzfm6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmjo2PkACgkQj4D7WH0S
/k5wUwf7BFg4e6GvALl61mEKV9IwUSBj6wGkRqj3UTzRfeqjt2/9cfLxrg9YrQXq
ZjjEQ4EDNpqeaVtzJmG6Cdv/sz49fAat8Cu3LUlg7iQjecA2Bp2ZT05wgAWD+lb9
/sc5wevdk7Lkwj835EAQsGZja31qEDsvIsuVL936pPYuLOAeH/KjlRD5mVp9rVGz
pQAfBsKe9tyeIDZPjmKyR8xrAvqqri3Z39LL+GJWtTUmQEy7z+Ibwcegu2HI5pea
0qHZAYpkqzFSiDrMF4n66sSyaF5ddDa+HwPHInzM4W5IKPWTtu3vNybWF4rvbpjU
mxedmYUlwln6CAHXIa6iHKqC8OYi4g==
=3GaF
-----END PGP SIGNATURE-----

--54dwufa2azbfzfm6--
