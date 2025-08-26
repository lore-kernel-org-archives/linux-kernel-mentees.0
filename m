Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BE727A11E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 26 Aug 2025 23:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756252307; cv=none; b=PCmmup1a061HuEnhYIbBfdBNvwh+ORY0dzz2NbLHkHeNjkUM59ZTZIA/2he03mqN3dw42XqaPLcv4X962Air73sfb5xJ2mDKH3h8cC7aGSh5BfxGV9DN1NCfFOAKZ2FJ4bImzDygDQ3x2zNVyZQ/ZdHECJv1IDmDIqDMwtOQBcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756252307; c=relaxed/simple;
	bh=SpXyvaX1NMJmqbPDl1jzs13gIOFuk+UAO1oy0+GjGMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c7/+cOuyRalZlqMshMza2FwY4p+tG32D18ZPgQMom+fV1p6TAW6j2J1cxUI6oZcWzRei/7JgXIs79lS3nffKZ0dHpoXWwX2Erb8fNahLVGPAzAMFhpq78GycIW7H6vBM9Mqk0hLb1JLMap2b+SWyhZ1rqKdO72kQXgZvfbKHuwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c98jjcq3; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c98jjcq3"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77D7180E28
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 26 Aug 2025 23:51:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KNO-FIi4juq2 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Aug 2025 23:51:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CAF1080B48
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAF1080B48
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=c98jjcq3
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	by smtp1.osuosl.org (Postfix) with ESMTPS id CAF1080B48
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 26 Aug 2025 23:51:44 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-246fc803b90so21864495ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 26 Aug 2025 16:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756252304; x=1756857104; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ePblVNg9HZRAOQWqKcYLTh/hWYQSO5Q87vhxYG33kNc=;
        b=c98jjcq30tBmYKlPJ8R3XM+gHjqSxzA8fC4+ELlqtt994Q16kGk48lwwgkp3bGNUdK
         Vi47b354P+d3qvhp21hvgjnLf04mKhVSoZHr8XSVT84zaF1B0HXLRI5CDl/qBrq+WnsD
         lBWlGZ++rGXcPFHBOXSq9ZZPtDNAh5xGoukSOSZaHArkWp0Izm6mJuPtDPrAGvLeAeYi
         ZvVhgDaFU17U7R8z+igJs2+qaWrHWdDoXIJdVUmqONZ0MflpeEOohTal8M3tM9sP0laV
         uEOHekaGSQjt242dZf7n2UOEAyEIP6IMgj7HKXhcucCZ4pNhvMbs0dlqMTHvoJjb9sia
         JXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756252304; x=1756857104;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ePblVNg9HZRAOQWqKcYLTh/hWYQSO5Q87vhxYG33kNc=;
        b=HyT4LGuHTemUCMrcPG+AglO+ngZMcX/n7NYNdO6ElqweVOeTNfCf4kA6UpIhH3ee/z
         o62V3zI7fH9U11FSv7aZ/k6wxSSXVcPZwgrXUZzwWrLZfzsOr7caCXoRzTPbebdvfDJW
         hJ8lgFMQ1l0dZpx8bUvRvLgg6Fu/RaICnhz7+ZS31A3qBqESV6R7nNleIP3U7Ld2pres
         NuMQMYC7Wul+OX8gxpND7FpPKd84bq231PIvtpFnt3E5idXTG4Bt5W574W/ZlqrAmzO/
         6aFVneRSB+51ev/R/2ELDp2qgrK0yM/duJu2gC2t4ncZboMiHCkm+ZU2agyO0g0ihaGC
         n1pA==
X-Forwarded-Encrypted: i=1; AJvYcCVDXQ1B3oTh+l3f9cT2HgvwF4FMueXH4q35OUvww8xKPeophrVlnoP9nozDeeVz5Fz8gwQyBHvXPbsUuiy2UxjQUGMS5Q==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwHTXczGS/6F4lkuYLUvZHvHCfphbXbjzs+VW/NirmqDtxayHhu
	RZJyqVK6VWHVuxpvq0dG1zokKIAWbqv2aaoQhbZly/L8AYTgjlw2+1N4
X-Gm-Gg: ASbGncs5zLwUZWkWKghy1EkGw8QJVPOOjT0v3mRu4WdK+GJOT4O6QMhOxSVK89BoMUw
	/lq7n8A4LrykadxuQR2Nlr4SL9e5ephWlpqGPLxM2HJwe+FcIgZECJwgYzax/Df5XfSPS3cfR/7
	581i2mJyuyhcsCRpYAmiNMdcGo6X82qMt1xkksrHlGxrh3zJsxTbGyf1aQ7J1xYyeHfST3mYUdI
	o4aeIfa9oWdT5BV2r3CmOI8q/rD+Khr9g+g9v8wJvdPSnKASLl3u8Y9qAMY4eQ0+sySYCEYUMdw
	yn6aZkv5ZqkjML9JWWZsk7e9gF3jTgGKD4gW/nvs9KVVbYdSVxJll6b4XQDr/6icyZxaU0BnJLX
	k62EL3zYcWD/wTx+/2qr6rg==
X-Google-Smtp-Source: AGHT+IFb8KVQRSdRU+uLjRMz6f0hTjcJUJXW9JG6G/8TmE/+OZYW9hjVMMGvhDWh2D9wG3itreKMjw==
X-Received: by 2002:a17:903:11c5:b0:240:3b9e:dd65 with SMTP id d9443c01a7336-2462ef44573mr206281725ad.38.1756252304007;
        Tue, 26 Aug 2025 16:51:44 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246687a5fc5sm106139645ad.52.2025.08.26.16.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 16:51:43 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 1228941E4F06; Wed, 27 Aug 2025 06:51:40 +0700 (WIB)
Date: Wed, 27 Aug 2025 06:51:40 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: bhanuseshukumar <bhanuseshukumar@gmail.com>, tglx@linutronix.de,
	mingo@redhat.com, shuah@kernel.org
Cc: peterz@infradead.org, dvhart@infradead.org, dave@stgolabs.net,
	andrealmeid@igalia.com, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	bigeasy@linutronix.de, colin.i.king@gmail.com
Subject: Re: [PATCH] selftests: futex; Fix spelling in test messages
Message-ID: <aK5IjAkVEyDdGpPu@archie.me>
References: <20250821154103.115110-1-bhanuseshukumar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KcJKMH3iRoHD8Lg5"
Content-Disposition: inline
In-Reply-To: <20250821154103.115110-1-bhanuseshukumar@gmail.com>


--KcJKMH3iRoHD8Lg5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 09:11:03PM +0530, bhanuseshukumar wrote:
> -	printf("  -g    Test global hash instead intead local immutable \n");
> +	printf("  -g    Test global hash instead local immutable\n");
                                         instead of local immutable
> -	ksft_test_result(ret =3D=3D 2, "No more auto-resize after manaul settin=
g, got %d\n",
> +	ksft_test_result(ret =3D=3D 2, "No more auto-resize after manual settin=
g, got %d\n",

This one looks OK.

Thanks.=20

--=20
An old man doll... just what I always wanted! - Clara

--KcJKMH3iRoHD8Lg5
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaK5IhwAKCRD2uYlJVVFO
o2/dAP9CPlLCjbClhfPsWjJPq0xEgCHDChtGzkwpBrIRrCf79AEAuCCLeTfsIRN8
m6FPTCQPwmt2ChZvakiMMycRqp6Mtwg=
=KwY0
-----END PGP SIGNATURE-----

--KcJKMH3iRoHD8Lg5--
