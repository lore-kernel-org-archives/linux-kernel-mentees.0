Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9DD1C173F
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 19 Feb 2025 07:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739951823; cv=none; b=sLiS3lc8WHXW4u2cb22rS/jd7nAOEof2nQfo1GpD0s8HOYsdufMmVP5Okkf7cWGcR0V5dD0R1tDCUPxzGvp6ffDOr7fnB9u2FImucyMRKGcclUB9LXFhsiYaP/+ye+zfkx9AI5n9dWp11dbiQfH5jogXJnKa6x+43lGRfLb/Dow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739951823; c=relaxed/simple;
	bh=P/kpZ0JFyS8K2bUvvNK9hIZS7U9RMBG2F3Uw3zx/60k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B8W1VT0URkKc9M39g140sAdl8gdmFAgcRoN7HObu3H+tHwXbf4RNShOpCfCOMuRkIDo/6iRObKGi+rVTOjXemB/aay6MKfEF2oespR9Ym3PbD46FLEQ8sIJOjaVXKmmLQbm39QbozBSZmVBnfSqc5UVrvslvJtcN1R2IYdgtlc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fGr3XDhD; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fGr3XDhD"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-220c2a87378so90361695ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Feb 2025 23:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739951821; x=1740556621; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P/kpZ0JFyS8K2bUvvNK9hIZS7U9RMBG2F3Uw3zx/60k=;
        b=fGr3XDhDS8N5Ak1uMlFAjFVbVUChuUhTWe0gqaHkRnskhQBk5lPao268xLpspj65hl
         gLE//uw9HDGBO2oUmbg+WDbm2+wqaoe97lZ6BxT3niVFGxHRyDHDwaN+3U821pPP6mdJ
         2CRQQnmE+t1n7EanUMDCJCmlvDqo7rr7TlA+jzGK8Y4hb/wBasrgvIPCvkEI+NHSVuph
         y9614EtXIvQE/bmAu3WRRQurg8PlFiC/TnIaSqjphxfGdMF/Y1QzRhZEDu23yuXyrxP4
         YKtQizF5CLZzxN20EUN3NqiIGd0kAKzQki8wjkUnGJUWz7cjlHJl0eFdyU22ooJD03wD
         69oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739951821; x=1740556621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P/kpZ0JFyS8K2bUvvNK9hIZS7U9RMBG2F3Uw3zx/60k=;
        b=g4jEe+FUQmClVdQCcWmkc4sDrksC9hVblRXKtwsJrV6wMpAl3d8CmduG4AJ1NOpuAU
         zW4ABmqpVfxKyPFI2OaoIY3HUUbU0sAQ0Ofi+VP+7/ktGjkcsOvQrBFiUAhBnAdL9/zg
         Uev3feTF3kuS9IQUFss/0NIowCTaw0bca+77Z2EGpf51zyLrfjhKTMy0pIXujIQGEy44
         COxRfvB5eaCDFqagDMMmR/xUdCicFqGiigcNWXWh+dAMjJJ4JWXCdnRm27/cMwKE5swg
         EcUhkOQSqKx4c2TMF7UEzhVpXh6u8+LPZB+v4N7p+ErT+KQixFdi7LeMnzBPdcrMKnf0
         7bJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIxV8cTTKbuZ1CiDvuDY+g+Ij5RNztfdnPGH8f9fJUg/ugXvp5dXfZNDeoipga/RfchJhA560MB4z8FSd4UaW3eKJaSA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxVcs1RZAv3avVOwucVtzlIU5nNGcGhowrxcPe/xYJJIPjcEamh
	7RmFGng9+wWYWX+2WzUiMct/YoYiRKBBZMtHTqAEvgX7aE4L9KKW
X-Gm-Gg: ASbGncsNH6bJspruf4PKpz9wQLCKrnzdbSLfQdjvTXkbQiigvTpYrALZ2JVs7PTp+Gv
	nd8j6AsDERh7zQsTvfXWm9dXx2NahfwpifvsZn1n3GM/wlfXEq7MP3nzQO4plHJRTe05oOGIazB
	3v/dPlYpfRLushsuvTkJAlOBEl4iXoh/wjHGYjaTTz1MsWvcbH0gsgExXsAv51XL/XDmG5R2Kqr
	bFa4s/hFhpu6gLS+TjiimIPA8NOqYdYKKD1ApSruBTdSzotwwAQ3qSkfUdxooY5fEkESN8zJAKI
	RsluCQPA64u3ToI=
X-Google-Smtp-Source: AGHT+IEJD6274fxtcOpikxcjTZmPbe/QYievTKtzYG/3d2LzY4XIXg6MjLwRdaeB83HEkRnMk5cYhw==
X-Received: by 2002:a05:6a21:394c:b0:1ee:d7b1:38ad with SMTP id adf61e73a8af0-1eed7b139b5mr2915550637.0.1739951821365;
        Tue, 18 Feb 2025 23:57:01 -0800 (PST)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73242546177sm11328548b3a.5.2025.02.18.23.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 23:57:00 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 4BD094208F47; Wed, 19 Feb 2025 14:56:58 +0700 (WIB)
Date: Wed, 19 Feb 2025 14:56:58 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Pranav Tyagi <pranav.tyagi03@gmail.com>
Cc: Linux Documentation <linux-doc@vger.kernel.org>,
	Linux DRI Development <dri-devel@lists.freedesktop.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] vgaarbiter: documentation grammar correction
Message-ID: <Z7WOym9fl8GNPJiO@archie.me>
References: <20250207165325.3998-1-pranav.tyagi03@gmail.com>
 <Z6bKR9K16-oYMLFl@archie.me>
 <CAH4c4jKe7Q-E1LhA0KxOxEjK-gn=JY7e=2GN13X=yutaO8k3Pw@mail.gmail.com>
 <CAH4c4j+kOYMfzO5QOBg+hGe2zt4kN4f7v+mrri-2GMLzYtCPrw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BToSCmPd5dm/qara"
Content-Disposition: inline
In-Reply-To: <CAH4c4j+kOYMfzO5QOBg+hGe2zt4kN4f7v+mrri-2GMLzYtCPrw@mail.gmail.com>


--BToSCmPd5dm/qara
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2025 at 11:05:39PM +0530, Pranav Tyagi wrote:
> Hi,
>=20
> Just a gentle follow-up on this patch. It has been reviewed but hasn't
> been applied yet.

You may need to resend the patch, but with scripts/get_maintainer.pl
output Cc'ed so that DRM maintainers can be notified on the patch.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--BToSCmPd5dm/qara
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZ7WOxQAKCRD2uYlJVVFO
ozkoAP0eKLrhmoKPcsU785IBYgu8CdHmCLy3XmrPIMibyJI/QgD/ZJDL9komfCvv
38f91wD0Ik059kbk8dCpCTrK/qTtIgA=
=qgWc
-----END PGP SIGNATURE-----

--BToSCmPd5dm/qara--
