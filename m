Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D81419EED3
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 29 May 2025 01:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748481786; cv=none; b=I8e9vimCI4rXkW993aoDhFBH8SE6G3IhtdyAhO4YXwRX6XFvCfEh5Lwu0CDzt0uoed0PX28EugE70BsUDCTUkUVmBPG8qndvwapzCSWcAs9nrgzqTn/NMBPdfPsnV8Tvifm5QjuFHq/0DfNw4LBs4hMdBDGgWX+aMasKKSJXEPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748481786; c=relaxed/simple;
	bh=5y7CveGbYGod76OFGDf+v0QSkzJi7YLcrk5H2SLo95E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lCG85WU5W6DqHD4HJVUg9XKpk28pAPsN4YkhlD5kEdGh2TI5sZMqkVnDikhWr5fI0oSRu/i3tTpxV38liRj0O/TLqP+Z5eMxBNG1sbM1uyTY8Fg4Mt69BMuU/PeV5uR6bmusu/n2Xgw2TbmBVmids02MKrs6X+a+ga6q5Cl13A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hPqAp5Rp; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hPqAp5Rp"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-74267c68c11so269267b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 28 May 2025 18:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748481784; x=1749086584; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yNcpQ6iTd23Fuh0WUpnzSmEEECvnd8gbAVf510WE3Vg=;
        b=hPqAp5RpWOAqiHDBR5tWR2WiXLL27bp50z6w8/2u3J+rJcXG2GoZcLgV/O5ELj5EB0
         VkSVSZE5BEJLYdl/Kjk6il3GKWpq94+4dNbqmOCvcRMXJCltGn3b8U3xAa3Q6TCqLaRK
         YCKdShCoru3jdt+T3bRujrXahYj4tOyrX4ZiPSNtVfm8HX55ENNSaw+IqxhG+sVUaHhf
         F14lAa2LK9M8fPAuVc1klwlCgt7RSi8knHltB3ILpOkY2aeY1zkpZRJ4Gj0yZF1fs1cp
         EeumK1ydgifos5d+MlYtdKjXR7bgUOdt5hAaQcMd5KECRP8USn1PtrRqRTUwv/ltGKVb
         18UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748481784; x=1749086584;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yNcpQ6iTd23Fuh0WUpnzSmEEECvnd8gbAVf510WE3Vg=;
        b=QMVZwnUgdG0NqPVVs0HyMgxKONCKxuvTW+m7DFQjMOlGL5/HT21TN03WSrk1bzyO9j
         +/SfRSSIg0+/OxkRzCWVuxkXSCmO/JQTEJgbkAcn83DFhe58PZwMlt5l71JWNXA0kpfa
         HPpz8GWzzvXlHJMauiitHHmuF0Tb/mY2TXSxgoSAZOx29b6Hdn1d2ulanHLzcMwfy18O
         I4cpd2CusRqvwEldstkL5fPHrdbEdd8XbIYIIGfWRHHSX3CSQAFIsQy0jvW//o2sKYVU
         aZP4mWyCz9JPyL/zLiYhIF+aWur2dLCaVm1SR85FD58dGmjCEwC9ZIYbjmqi1jVYsYtZ
         a4tg==
X-Forwarded-Encrypted: i=1; AJvYcCVDTE1912OsD/As7Ea4K5sOy3Joug5Oh7JLVkZ/MOmJTC/6A/Om7ouMQePLU/qA8WvqdEqDP7tIyQ0pCXpkRVH7+z1sCQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxtP8ipcsWHUH5qP+iGlIZWiLjxLzogZNDm0Jem6ZM1+RzwPlDn
	bjIVkPk62hGsCH+MQNw8RRuD6joMuSrJ83XNj9EsWFP9dehAayXbDbnZ
X-Gm-Gg: ASbGncuFmAAR5mpE8sokAeLK7HtPEdMUAyHrrasHrjXw35qjr6SzGPdEs0CfsDOU5p7
	f0AuY5LZnzdclgYnLje3VZI3U+JK2k/eQc/hUMN97HVX+d3SnLP8+itc3uRtIFb09LqXK9Vnps2
	tMX59oy6zsoFfwh8aRt9zkXp0jyfZALZgT/Q1twFJ/+iO/jg77bCJ1YR3eSL4T57iRAO4cBknJx
	ncJO93l9YL5QFCh5byJiq0rZZ1ZQXw/zbC6KaB1zcU8r0QRySZXR1wBQNF1Csy1py2BeeqMP7Ii
	JRGpRB7QjYUKgv/1XNNRKVuA2mz4m6cHebYAb3FMfZoBvQFZex0=
X-Google-Smtp-Source: AGHT+IEq7cO8TC8Du8MUlyjcSTXy0CPrk1am1y/cD3TkFUUKjnPvY8xKVFDO7oe1jBnbh2UVTJ4sXg==
X-Received: by 2002:a05:6a20:d70f:b0:1f5:9098:e42e with SMTP id adf61e73a8af0-2188c1e8dfamr33868375637.7.1748481784332;
        Wed, 28 May 2025 18:23:04 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afe9639csm248215b3a.17.2025.05.28.18.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 18:23:03 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id C918B41E4844; Thu, 29 May 2025 08:23:01 +0700 (WIB)
Date: Thu, 29 May 2025 08:23:01 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: George Anthony Vernon <contact@gvernon.com>, dmitry.torokhov@gmail.com,
	corbet@lwn.net, skhan@linuxfoundation.org
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2 3/4] input: docs: Fix Amiga joysticks grammar
Message-ID: <aDe29U-JljGPpKiK@archie.me>
References: <20250526135957.180254-1-contact@gvernon.com>
 <20250526135957.180254-4-contact@gvernon.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="K4011M0stGA66i1P"
Content-Disposition: inline
In-Reply-To: <20250526135957.180254-4-contact@gvernon.com>


--K4011M0stGA66i1P
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 02:59:51PM +0100, George Anthony Vernon wrote:
> -         +-------+----------+-------------------------------------------=
--+
> -         | BIT#  | FUNCTION | DESCRIPTION                               =
  |
> -         +=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> -         | 15    | OUTRY    | Output enable for Paula pin 33            =
  |
> -         +-------+----------+-------------------------------------------=
--+
> -         | 14    | DATRY    | I/O data Paula pin 33                     =
  |
> -         +-------+----------+-------------------------------------------=
--+
> -         | 13    | OUTRX    | Output enable for Paula pin 32            =
  |
> -         +-------+----------+-------------------------------------------=
--+
> -         | 12    | DATRX    | I/O data Paula pin 32                     =
  |
> -         +-------+----------+-------------------------------------------=
--+
> -         | 11    | OUTLY    | Out put enable for Paula pin 36           =
  |
> -         +-------+----------+-------------------------------------------=
--+
> -         | 10    | DATLY    | I/O data Paula pin 36                     =
  |
> -         +-------+----------+-------------------------------------------=
--+
> -         | 09    | OUTLX    | Output enable for Paula pin 35            =
  |
> -         +-------+----------+-------------------------------------------=
--+
> -         | 08    | DATLX    | I/O data  Paula pin 35                    =
  |
> -         +-------+----------+-------------------------------------------=
--+
> -         | 07-01 |   X      | Not used                                  =
  |
> -         +-------+----------+-------------------------------------------=
--+
> -         | 00    | START    | Start pots (dump capacitors,start counters=
) |
> -         +-------+----------+-------------------------------------------=
--+
> +         +-------+----------+-------------------------------------------=
---+
> +         | BIT#  | FUNCTION | DESCRIPTION                               =
   |
> +         +=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> +         | 15    | OUTRY    | Output enable for Paula pin 33            =
   |
> +         +-------+----------+-------------------------------------------=
---+
> +         | 14    | DATRY    | I/O data Paula pin 33                     =
   |
> +         +-------+----------+-------------------------------------------=
---+
> +         | 13    | OUTRX    | Output enable for Paula pin 32            =
   |
> +         +-------+----------+-------------------------------------------=
---+
> +         | 12    | DATRX    | I/O data Paula pin 32                     =
   |
> +         +-------+----------+-------------------------------------------=
---+
> +         | 11    | OUTLY    | Out put enable for Paula pin 36           =
   |
                                "Output"
> +         +-------+----------+-------------------------------------------=
---+
> +         | 10    | DATLY    | I/O data Paula pin 36                     =
   |
> +         +-------+----------+-------------------------------------------=
---+
> +         | 09    | OUTLX    | Output enable for Paula pin 35            =
   |
> +         +-------+----------+-------------------------------------------=
---+
> +         | 08    | DATLX    | I/O data  Paula pin 35                    =
   |
> +         +-------+----------+-------------------------------------------=
---+
> +         | 07-01 |   X      | Not used                                  =
   |
> +         +-------+----------+-------------------------------------------=
---+
> +         | 00    | START    | Start pots (dump capacitors, start counter=
s) |
> +         +-------+----------+-------------------------------------------=
---+

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--K4011M0stGA66i1P
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaDe29QAKCRD2uYlJVVFO
o2NgAQD2R4HfOj4KSacO1xNyyC/L6FQDftc+OlaWuS7P7PjNHwEAqxD7T/wXLCmO
uKixNwmxZN2NxZBvJnkaw7Dn7Q2jQw0=
=pYvh
-----END PGP SIGNATURE-----

--K4011M0stGA66i1P--
