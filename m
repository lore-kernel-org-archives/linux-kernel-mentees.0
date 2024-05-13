Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7A714882C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 May 2024 09:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715591394; cv=none; b=A0Ld1FMMJwdkrqFrZ7xXLp6Vys0GFYu7IrKIm2HUE8TEFUlIfkFpaarqON7lID3ZiLv+HGyZkupKg2Zex6lNBFT2SAJxpS67aI7LpLtDbeS/2kgYHTV2DQJhUUJXagwKM++jMUNSt+TWz/bCLwGpsLCWZriJ5CGO9S2jQwVrHvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715591394; c=relaxed/simple;
	bh=35parTJp+jKZKjJtoHwW7Fi8fa+9bQDeP0JhKWVJeKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sv18J6vbRkIjcC7DlVR8iZ6AozJ1OU/vUmpKK8/0UWEDMqHs8cgMEmvGfoFsNUMnMuHRA6NGrCJEstP3O4rwG9iuLw1Om0CrwkUVhVK602VGZ3XNaasynhaWk7MQWV5EMnDFGMI0+G4gaaU2uCAAC4qzzaFOC+rHeH7eU62QqHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RbvYTe+l; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RbvYTe+l"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 082C740722
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 May 2024 09:09:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.236
X-Spam-Level: *
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XGgZaEOlfcge for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 May 2024 09:09:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8A7424057A
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A7424057A
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RbvYTe+l
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8A7424057A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 May 2024 09:09:50 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1ec486198b6so29841945ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 May 2024 02:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715591390; x=1716196190; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zqXFTG/UsEGp/a5otOk5W3+y5hWj2D7lzRkWmSN8zUQ=;
        b=RbvYTe+lXVVQ+Mn8dvvXTT++EdjMO+ptL9DmZBNAU+cQZpCAE/w+NiMWVrmiXNjVs3
         onDn31XCX8cUCzP9Mu4tVgA4fJMHb8tvjIdjrhgFJ7ME21y7lnBv/94utRm0FIN3xXVt
         JF4vibXlUFCVgB0Lb+7dq5gtrsa4nxlqJT7rARm/lau3SHnJ5BTdniWKLywW2m4u9QNq
         fNb69N3y8j4+25CCMYRdEwOJOT+0ksqYNErlQ7SKpvpGoNrn8vS2VsgrlYjLkvxXcmlP
         2qDjrTjxPh83TAJMTLAWKtam+znB641LwPXt0+V6zM1EGyID1iU1EraSRBAm9vxRR7UJ
         Kvpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715591390; x=1716196190;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zqXFTG/UsEGp/a5otOk5W3+y5hWj2D7lzRkWmSN8zUQ=;
        b=YKGz/jXyHVzEGu2UvyOLeBN/+bEIkBE071NvSTHda7ceOxOQ+4dHZNSkj2wLyq4vV5
         /zYVpximSXyv5bc+EGXXkf65FSNuJKHi6KZ2XvgoVCae3Hc1ze0qPIan1onDb/gXQRog
         Ru7nXo6H3hGgLfY8CFD+XgSEXBPdDXnm42Xtk6zRmribPmIrYhpBcO+8EkvtvbITGzJh
         wIaORvrQxcKRvxIKf0h9WBdzuXaWj69jClfBuOEZ5V++ItlDjn0oIxig735LKiwzqfmP
         zDe0tf5UG41rUMEOP9x1Gu3LYjkvYpWoJAFbAKY6HIiEqOEaEChoI2sbFoITDPDrIwTI
         YwVg==
X-Gm-Message-State: AOJu0YzRrlX3AByAJsghqOVWzQuoZlWKTf1aEi60zvvniuYBFDYYp+xF
	2DVU7me0R1y98EWpKrX2N6EmXIszW9K2qqaoEwAQxKAMWUw7pXb5
X-Google-Smtp-Source: AGHT+IHjhm3ct3fZIyK9rW9/JPt7Mo9iUNvdzbhCzIEAmlhLG4cF8py8h5nFpQJD6eYBcsw+ILQhaw==
X-Received: by 2002:a17:902:f605:b0:1df:f681:3cd8 with SMTP id d9443c01a7336-1ef43d2e288mr117782885ad.12.1715591389652;
        Mon, 13 May 2024 02:09:49 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c13908bsm74600455ad.265.2024.05.13.02.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 02:09:49 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 88AE8180716E1; Mon, 13 May 2024 16:09:46 +0700 (WIB)
Date: Mon, 13 May 2024 16:09:46 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Luis Felipe Hernandez <luis.hernandez093@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>, corbet@lwn.net
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Mao Zhu <zhumao001@208suo.com>, Ran Sun <sunran001@208suo.com>,
	Xiang wangx <wangxiang@cdjrlc.com>,
	Shaomin Deng <dengshaomin@cdjrlc.com>,
	Charles Han <hanchunchao@inspur.com>,
	Attreyee M <tintinm2017@gmail.com>, LihaSika <lihasika@gmail.com>
Subject: Re: [PATCH] Refactor phrasing for clarity
Message-ID: <ZkHY2sYUOXVSWDMO@archie.me>
References: <20240513022430.17626-1-luis.hernandez093@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="G+nCITxMkLxwGcUH"
Content-Disposition: inline
In-Reply-To: <20240513022430.17626-1-luis.hernandez093@gmail.com>


--G+nCITxMkLxwGcUH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 13, 2024 at 02:24:02AM +0000, Luis Felipe Hernandez wrote:
> * Updated title capitalization for consistency
> * Fixed acronym capitalization (e.g. CPU, vCPU)
> * Added usage of hypenated compoud adjective
> (e.g. host-side polling, where host-side is modifying polling)
> * Added missing verb "as" in "basic logic is as follows"
> * Added missing articl "an" in "guest_halt_poll_ns when an event occurs"
> * Fixed parameter definition in 4, all previous examples started with
>   descibing the parameter in the first sentence followed by additional
> notes
> * Replaced C-terminology Bool in favor of formal form Boolean
> * Cleaned up phrasing in "Further Notes" section for clarity
>=20

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--G+nCITxMkLxwGcUH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZkHY1gAKCRD2uYlJVVFO
ox4xAQDSJzIXK/ubTuy+ucT6toBdOYC5pnOD3av5A5Mhf3oCyQEAhL9yg69u0SDc
Hr75AvMHVpqR8mxhp9UJoPs1SpfQbQY=
=I0Lo
-----END PGP SIGNATURE-----

--G+nCITxMkLxwGcUH--
