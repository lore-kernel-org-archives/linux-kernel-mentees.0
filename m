Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8451F26DB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  8 Nov 2024 23:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731110270; cv=none; b=q26Ds+ipDJd0K8zl9QI93lfT+6ezxQ32GisrCMHNqHN+chql8nt7QFhQCdzLakdmSAOCWBA6YH04zDzQZdOjYAmjgFGX5dSKVdixIEuf7nfD3JcddPSKG9H2qwtcnmwM7Wsnl2YFitREm64NUfw8+m2mN0lCa1v9LPGP3B6j1D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731110270; c=relaxed/simple;
	bh=5MygCCliXOQIPYExnAgpq36Qgh4XXuyOqtJQoNoZ5Eo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o2qZiFqPatsEMmD2UM+fIr+dj75KJN6sgZgXaSWkyTphNgAhOpzvHx1AdI/2rTXEPRG80vWrwhZz90Eq2q0RL0ksWm9YxokRnKU45d4ZXDcyfeDXFW+9Eoz3Q5JY2dpHtjBTsrrmZmL4FwJ9Iu08cp2wicRZ8oJ6RE67Af4cqSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h5mb4lzj; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h5mb4lzj"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C749845FD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  8 Nov 2024 23:57:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VTbq6zOZERVX for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 Nov 2024 23:57:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D14658134C
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D14658134C
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=h5mb4lzj
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D14658134C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  8 Nov 2024 23:57:48 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-20e576dbc42so30464065ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 08 Nov 2024 15:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731110268; x=1731715068; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uq/HleutbBsgjDYtAH2w9gnQgvSfXJu8kVx54tjEWPs=;
        b=h5mb4lzjPpSoe1Kc2g4pmsvqtwuq2JDhgd1bqr54DU+0zurkQJ57FN6qZFZFZxENFp
         K6npb/XmJ+vjv3FS7PB2HgLT9/rtU2hOwQNIGOatEoFWDd0h/ACYpSQE7Z+mHupdhTH8
         ZW6/R7WtxMrAyuhUPWFRzJbPDTPTWMMdWWP+IeEaU7nWnFGLwtYvM6weIZMOYDoqC+lT
         2mA+DMBKi+IjyJU8sEi8y2WZ4zeycZmqduai8fW09UISkeeHc25ofShgw4yH0lEOdaxW
         qpg6oZCK+SBYkDzqLamXH08rqbPXBlIA17u8GeTSFO3MNrmGvWycU4QBEjI5WpNfhAv1
         uwhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731110268; x=1731715068;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uq/HleutbBsgjDYtAH2w9gnQgvSfXJu8kVx54tjEWPs=;
        b=RL+UQPYcVMfKU1BacpbHv08totZsIes73JRudpxTWx86E+qfD3B3d31xfGxQmM0asj
         Hms7n+KxiBg3MLRK6b1oBUaPkm4+FxVAk4QyApRgb2ntV7NRrKnbjHztAoPKT2J9yxth
         sUUnAxWSrDro6jQBCC2rdmIGt3FRB0bXTyEZN7Da1W6bH40SxVisdqzi/4h2MgOQqKXD
         gmQiuU/pd4ZFITk1pZgglle8RW9kU48RT2BvJ1qmHUJwzm+IUG1xXqg21AtWUYPdjv+1
         ui/17czVxu/CicORMbBbVfCqIplUQndi5g6N8cfIP4jFxjQrDU1gJllIV/cY1HLX1BiL
         B/mg==
X-Forwarded-Encrypted: i=1; AJvYcCU8nWyqW7es6CrXgWjjfcpN0l90mwL/0Q54ruaKoJuo+dEmt42Q1LgIHr2ZSUrOl+m7bSpppI5QMylF801ti/IfUd280w==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwAsSNdmyAyU59VmL08FzJWKDUAuWxURgJOabr0i2wk+Thoks1C
	9J1fXxQJcjLi2Lp1oBB+CXlOGHS6RX18G6JdproVkE1bxOBjzyVF
X-Google-Smtp-Source: AGHT+IHsqYMoJaZR7DEU7+RH7csowchtdMKT8eN0fEPfCSshXzgwgvSMaWsCEdbws5SrloYWRHxKNA==
X-Received: by 2002:a17:902:db0a:b0:20b:70b4:69d8 with SMTP id d9443c01a7336-2118359ae3cmr54561975ad.37.1731110267757;
        Fri, 08 Nov 2024 15:57:47 -0800 (PST)
Received: from archie.me ([103.124.138.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e6938csm36445735ad.229.2024.11.08.15.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 15:57:45 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id CDD1541F52F8; Sat, 09 Nov 2024 06:57:40 +0700 (WIB)
Date: Sat, 9 Nov 2024 06:57:40 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Abhinav Saxena <xandfury@gmail.com>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] docs: hwmon: Fix typos in sch5627 and max31827
Message-ID: <Zy6ldOPnnl5ocf6V@archie.me>
References: <20241108212201.144482-1-xandfury@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8KwVmF4c1EsaXBVK"
Content-Disposition: inline
In-Reply-To: <20241108212201.144482-1-xandfury@gmail.com>


--8KwVmF4c1EsaXBVK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 08, 2024 at 02:22:01PM -0700, Abhinav Saxena wrote:
> diff --git a/Documentation/hwmon/max31827.rst b/Documentation/hwmon/max31=
827.rst
> index 9c11a9518c67..6cc5088b26b7 100644
> --- a/Documentation/hwmon/max31827.rst
> +++ b/Documentation/hwmon/max31827.rst
> @@ -136,7 +136,7 @@ PEC Support
> =20
>  When reading a register value, the PEC byte is computed and sent by the =
chip.
> =20
> -PEC on word data transaction respresents a signifcant increase in bandwi=
tdh
> +PEC on word data transaction represents a significant increase in bandwi=
dth
>  usage (+33% for both write and reads) in normal conditions.
> =20
>  Since this operation implies there will be an extra delay to each
> diff --git a/Documentation/hwmon/sch5627.rst b/Documentation/hwmon/sch562=
7.rst
> index 8639dff234fc..5f521c6e90ab 100644
> --- a/Documentation/hwmon/sch5627.rst
> +++ b/Documentation/hwmon/sch5627.rst
> @@ -39,7 +39,7 @@ Controlling fan speed
>  ---------------------
> =20
>  The SCH5627 allows for partially controlling the fan speed. If a tempera=
ture
> -channel excedes tempX_max, all fans are forced to maximum speed. The sam=
e is not
> +channel exceeds tempX_max, all fans are forced to maximum speed. The sam=
e is not
>  true for tempX_crit, presumably some other measures to cool down the sys=
tem are
>  take in this case.
>  In which way the value of fanX_min affects the fan speed is currently un=
known.

Looks OK, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--8KwVmF4c1EsaXBVK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZy6lcAAKCRD2uYlJVVFO
oyqwAQDDPN2bC6IWGqOVlsjF9FqVbpegaenlIOkDCdTywIVMVAD/aLzSDrWOH9PV
Mnp0H17MyQPDx5DN+4UDoroJMn27LQE=
=i2CI
-----END PGP SIGNATURE-----

--8KwVmF4c1EsaXBVK--
