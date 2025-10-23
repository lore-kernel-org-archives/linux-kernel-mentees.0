Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7485B2FFFB9
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 23 Oct 2025 12:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761224309; cv=none; b=qNQKJImUPzfhoB7eDFyggoTfy6XOau1YYb012dY1pR22fjORmEpEUyQ/ubRIhIpKmDxCnack+tO5lD2w7MDn2l97jU/Pt05JE5fzQFhw6uJpSU32iD7IgR4F/bR9icAj4/4OwDO1AnclqxEhQuTthGxQXzUCo4HUvisStpvOrFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761224309; c=relaxed/simple;
	bh=xjeehlY0ayWZ3bhz/kWBr2+l/5odZE4178lrQkJI3IY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oSZ47tZFwSsv8ThdO+DTfKYBwG475+dQ3WKI+Fnlq2d6531iiOMDtdIeO9u8OmTserfdE7oj9e9ZmVqs8kiYvScMe+VHvoC+XSBgOLOTAmiUfXMVSQV64zAI01dq6zGTJjp+R6wb4pYSeGXwP28w3wKmE7irU4otR2nBBpybdK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=tFjL1yg6; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="tFjL1yg6"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b6d3effe106so190941366b.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 23 Oct 2025 05:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761224306; x=1761829106; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xjeehlY0ayWZ3bhz/kWBr2+l/5odZE4178lrQkJI3IY=;
        b=tFjL1yg6T9h/zG3X3lr3iEtAzzFowGPLg4+dFYT4qck2WyjZqJYg2eZGC6GpEOvbQ5
         IIFV9AdGAZb1pUzDHk1W7oHhE/Mq0lgTjVVNzgAzbIGPF1U4E/jlHQ9t3BkPLvCCifJ0
         ZRkJCkNC+f2yhraLjMLvf735YrDKBJKF0AndlNC+fME6iDE0fOjqBINzmbQ8BCtUdP3d
         nWAC+pC8+GXsIbImDJp+V2Dz/9n+qBZmyas+tEaCqvfSlT1aLc7uo3pWPQKPVYNOxUFO
         OGOvxr5hK51JdsJgpsC6G4uE27lL9ij4WwHY57teCabnY2NzNIrHA6TsKwrKJn+fDPTf
         +ffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761224306; x=1761829106;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xjeehlY0ayWZ3bhz/kWBr2+l/5odZE4178lrQkJI3IY=;
        b=IDVdB1MrT6h+svGTC2mQnaPt6iWfHucT1LLfEAzuLU8L0lEwUBSeLbb9KuvKGubtGQ
         /vlcyCiLoeRXL5xdlbe02E1MHYkzchzj+lzwBlATi+Wzf7k8yuTRIGsXcHSebO5ElSpL
         CaZoKiRKih1khspp4nOGmHY6UQcvlQsLI/mnEdsMS6djDR2DGre3MMmOBTk7pzcERo3d
         8ZHSBRH4hlvrzDwjUAPzXn9vxHJfjEuh3Kc98N6I4zaq/R1jG0iVwyhBR6hmK+pg3PGy
         99gdpFmoUVSCHj5gtRBGQFzDq6X3SJnvj7eBuq+I2Mfy06Fvy6I9InMs0q8MnZp1STKY
         tPIA==
X-Forwarded-Encrypted: i=1; AJvYcCUomWMA/v2zZ9w6vG2Sr6f7MWoipsmPzriGpCdB4nrno9CJuw7K20SVVNwklvbvNPA5YIVzlrioke08lfAUHkdTvf/jNg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyJcefWrpXAlqVtS128aTG4IVTk7sy/rmN3VUt4dkx3UZEV0mT6
	dJb3U5GZfor5GMVbO2Qeh+8OAN9/dNu2au/NN3UPNqgOjtMYBLjCzKQatjZyDAxaaHs=
X-Gm-Gg: ASbGnctJlCjDjssbme3Or8XTz8z18Xs6owqnrosHkd1Tfdt+/COyU0fKQjlevR4LOCA
	31u3G81Ui0vKlTJXkRUwjhjJFdXSX6nuh66ioMw+3J3ynvgFoGwsKz7fuVE5brF9b17DZOaL0C1
	IJkSZgz0YYZ6+N6ozE6+zOsP6c0ruVty/TAofo7Wn5z+31w0uP3rCUSTbxgrFh3u0G5S/B4yifv
	nMGCQ1OwkzPtlJqjUxVoThqYs7bDjvbOQehByS4RnYhwpCqJKHgkeDqsqGIKBiNcJnxBkEIUQqF
	OyrvYDANVfLMQaw2d/SkVtyjnFkMPB31R9Rc5CvxRmUcoWFMl2I96hoVJcst/YbrdqfmyNK3vfD
	crdvKnvkidUqCrb9hU1eZRpKb2To70KNAWabW7JBAbixygjVXuB6yi5z4BW1TAu8TZkzh2MA1Rp
	hYj+wXIa+OAUAftrs=
X-Google-Smtp-Source: AGHT+IH8+w2hScL952t99dlA5WzytVfJZrsnO3QY3tAYI5JKTW4feC+qQ/6KlSZu1F3zvRjTIGTR4w==
X-Received: by 2002:a17:907:5c8:b0:b40:2873:a60c with SMTP id a640c23a62f3a-b6472c5c6ddmr2987323466b.3.1761224305719;
        Thu, 23 Oct 2025 05:58:25 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b6d511d11eesm227985566b.12.2025.10.23.05.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 05:58:25 -0700 (PDT)
Date: Thu, 23 Oct 2025 14:58:22 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Rakuram Eswaran <rakuram.e96@gmail.com>
Cc: chenhuacai@kernel.org, dan.carpenter@linaro.org, 
	david.hunter.linux@gmail.com, khalid@kernel.org, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, lkp@intel.com, 
	skhan@linuxfoundation.org, ulf.hansson@linaro.org, zhoubinbin@loongson.cn
Subject: Re: [PATCH v2] mmc: pxamci: Simplify pxamci_probe() error handling
 using devm APIs
Message-ID: <itxfh366j3yhshvp5abji6xussdk2fc7zrtvc3zzk27y5ouwpb@fvvxnpg3keus>
References: <pvid2ycmgbkbmegnnzwl4hyev6e2smusxk5olkuqxfwxzykz2e@jlvolirolrxl>
 <20251023115819.11094-1-rakuram.e96@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wntpsxgdxjl2stru"
Content-Disposition: inline
In-Reply-To: <20251023115819.11094-1-rakuram.e96@gmail.com>


--wntpsxgdxjl2stru
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] mmc: pxamci: Simplify pxamci_probe() error handling
 using devm APIs
MIME-Version: 1.0

Hello Rakuram,

On Thu, Oct 23, 2025 at 05:28:17PM +0530, Rakuram Eswaran wrote:
> On Tue, 21 Oct 2025 at 14:01, Uwe Kleine-K=F6nig <u.kleine-koenig@baylibr=
e.com> wrote:
> > Yes, I suggest to make restructuring .remote a separate patch. (But
> > removing dma_release_channel belongs into the patch that introduces devm
> > to allocate the dma channels.)
>=20
> I believe ".remote" is a typo and you're referring to the _remove() funct=
ion.=20
> Removing if(mmc) condition check from pxamci_remove() can be handled in a=
=20
> separate cleanup patch, while removing redundant dma_release_channel()
> will be included in v3.=20
>=20
> Is my above understanding correct?

ack. remote vs. remove is one of my most-committed typos :-D

Best regards
Uwe

--wntpsxgdxjl2stru
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmj6JmwACgkQj4D7WH0S
/k7lgggAtXPs8vnFmq/fg2Ty175E+kYXR84uN5u6308vPn6bCdVgHaU62FeL4JO1
uCQWviLkqvGqfNYKlurKsn4vSdeRK1katvsYi6BTqanuYAMcZljEO8ht0vuTYJqr
KoFx/M7XEQun2GqDJvDr4weHJ2WgdFg4gCFuFnFxEpW2fZAaQ+MC0U0Ya69Dwf5B
dH5fBXIdpV/9HQSceLe62tE9h5Rv3Dn7tU9FcYS5dI7vS883B1BZkrOb4e7oUary
ED+3wJXueKXHod0aF0agKQSVyrJ/9d7XYfpQIIdYpnsLyZFAERarM+6OtWl3f0Zt
KM5dl0uekQzPkWrWcGV2Ig06F6bDlg==
=frsd
-----END PGP SIGNATURE-----

--wntpsxgdxjl2stru--
