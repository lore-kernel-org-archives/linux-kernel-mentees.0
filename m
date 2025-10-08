Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BDD1A3029
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  8 Oct 2025 00:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759882221; cv=none; b=aeS6iQB/Ixc46H8HIAZLvVZrEvaRAEHkHrCDrEMxvboPtDcSH+pVu/8I3EJsE3rMmv89vMFrcPbkjO9GJvOl8vmTecmT4bN2KNQ1JPWVa/C4LiNQQkMRf//LQMm2ORpP2ZHkFmsCr/xxza1lTUDOWJHZOuwjh7St2GfeIJswiRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759882221; c=relaxed/simple;
	bh=drQLTEcf0s9aDQXkyASHEbZdCPNdt5PbIV0XIqvxYGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sa+3NhVxLJPVgrDFEeyDRm/U9B42H1C30QVixguHfP7wOpeGOaEPkWvo/7OIWTRBXQ34o6Wts4usNVSCHZKZxRBt8C14aj4aXDx3WtLsfJECGM7nbtjX7fQ76J0u8DgAwPhZ6tiCu9coRScufd20dYzcuGzvuJY+zQQHh9S27O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iDEw5VqC; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iDEw5VqC"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2698e4795ebso67001615ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 07 Oct 2025 17:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759882220; x=1760487020; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=drQLTEcf0s9aDQXkyASHEbZdCPNdt5PbIV0XIqvxYGw=;
        b=iDEw5VqCAFtHescrh6U808JRnt1X6XawTLIUhifdqOYLLhUeNmMRNtPRsFqX52HS2H
         VUYD55gnZF+OpkscbZLCey2lO6t6hVEyq1wLPM70yiD3h69USvChp/5vFs8UYburx2mw
         firFwyc/LaF4TibnNpZkbhtZ5AWWB7FxHdmsPcGzA4tABnriDC5l7mXFta22jGtBkgV8
         mH+beeQ9THPmLsQLYD0rFgdm2EBJz3dyvBDLBuWA9V/uEH9U6mCGeHf+siQMBngMGahK
         lKkIgMoM+FUGldy+FEHk3f48harfgQo7m8i8EP6xpM92yHzykbfNXObPHP8CNg8jwAkM
         vy0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759882220; x=1760487020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=drQLTEcf0s9aDQXkyASHEbZdCPNdt5PbIV0XIqvxYGw=;
        b=KzXXQVtazXpaBEWjuZbm/e/E+DvzDlH/kmyivRVS77QPH424w7HZN0LPc7FUns4TUi
         mBEmW8f4HxYaIaEis7Zn/+5sCK/0WLFD0WrKLs/WqpR+B3Rc2+7mwKyelTlfyYVjtS23
         18uMZ0VOh/OwBghlv0FZ/I+YPk7HuG4zJiZnbHnVNVBCzLLiPMBeSh0SvnLDbsMjoq+9
         5lVcTFx94igPSrzn3fiQgjzd3CN8Npapba7heMHeD1Pq6xdsg60/ZBPcy086FifjN9uM
         njg4ZZq1mOrmzfcj3toN2gRB2w4n5/r15skKVtUrjtqtFLQ4iCyoG2H8uNVFH2/rmFeY
         F5WA==
X-Forwarded-Encrypted: i=1; AJvYcCWPbqPO6W8kHkmDL7u0Xa7NvVQ/uigZPBaNM/cTdcC2XFCo0/nS/O6Cw2KVuG9ZYmji/P15Ce1zRsw0QtlTLBSomjd6gw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxsHhlztVdFN+lqezcElMXExsm3ZynMXDD/SZJ8GEhlE46gFMpH
	bhqYp5QtTUC2gytcx8GzSxLfpQwxGb5fs5UImW+2QGiufP/x17jhmMzT
X-Gm-Gg: ASbGncuce4PrvVJafwf2lJWyLJSOM+UhPl1gqj5NcgxeVG6zEvRdqioQqAu3Zn9UsVu
	KAnpP6k2TiCCruJ4yJGCFZXtUAuNlWKeNfbZkhp72yYsU2plrLEK5sHyV73g5/qDGOoJY/MKxE4
	5L/KgtKnuwORNJ2OKAQqCW3O+Z5hXPBJGYPCYRoQf+85zwCHhCbks7Dp3u8LRnvpjM8DLg0+fCZ
	fTlHV5+zgw7SbFifXgrbVUqpGvLNjr5KAD4dICex5yi9tvugF2jt3DDUg3rsjJhByWXXX5DKZnB
	FN4AFs64kMzyj3ovb1rGBo/F/OMGOm1utaxKwQx3isi0Nbi8Yv3SnJr0OGaxMLfMiNS3clCg6x/
	xwAefEQUp6jSA2hg/phykotRJoA966auTC43gKp+WdDtyGFHUcQ==
X-Google-Smtp-Source: AGHT+IESzqjvqNWRLBhUSfgdQA0DbNktIOO7T7mo7zBI5D4i2rQuwbdLk49P2ILdFhIuxAbr8RriAg==
X-Received: by 2002:a17:902:ef4e:b0:28d:190a:1913 with SMTP id d9443c01a7336-290273edfcemr19418575ad.38.1759882219780;
        Tue, 07 Oct 2025 17:10:19 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e9cbff2a9sm147087985ad.32.2025.10.07.17.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 17:10:18 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id E747D4233430; Wed, 08 Oct 2025 07:10:16 +0700 (WIB)
Date: Wed, 8 Oct 2025 07:10:16 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Gopi Krishna Menon <krishnagopi487@gmail.com>, rostedt@goodmis.org,
	corbet@lwn.net
Cc: linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com, khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev, crwood@redhat.com,
	tglozar@redhat.com, costa.shul@redhat.com, jkacur@redhat.com
Subject: Re: [PATCH 6/8] Documentation/rtla: rename
 common_timerlat_options.rst
Message-ID: <aOWr6Ga_UzUsPfoi@archie.me>
References: <aOUMyGvkibvOV0IS@archie.me>
 <20251007185508.40908-1-krishnagopi487@gmail.com>
 <20251007185508.40908-7-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LlIS5/VYPbtMmilJ"
Content-Disposition: inline
In-Reply-To: <20251007185508.40908-7-krishnagopi487@gmail.com>


--LlIS5/VYPbtMmilJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 08, 2025 at 12:24:55AM +0530, Gopi Krishna Menon wrote:
> common_timerlat_options.rst is intended to be included by other rtla
> documents and is not meant to be built as a standalone document.
>=20
> Rename common_timerlat_options.rst to common_timerlat_options.txt to
> maintain consistency with other common_*.txt files and prevent Sphinx
> from building it as a standalone document. Update all include references
> accordingly.
>=20

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--LlIS5/VYPbtMmilJ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaOWr6AAKCRD2uYlJVVFO
oxP5AP98xFQWDMEDF9qmYQ0B2Wtvoh8Q9kx1bnbfFDCX6IqjJQEAk+h5fDL4OXEc
i5PQIL+OKPTBIi+wbjKY+z5qbTgraAA=
=XW3K
-----END PGP SIGNATURE-----

--LlIS5/VYPbtMmilJ--
