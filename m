Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9446927F160
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 20 Aug 2025 05:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755667089; cv=none; b=mrcGPgZuWwP1EzG0hTjNmrLGvGU0xpa/SoW5bZsuGllqsdO2AfOZQih0A3H0CkS6aGJsWxi8PFK1UYCkOdH103de8kLK/HtUtwrw+MzM/qSg05jA2spQikGLtog6+96GC2Dt98XT10f/05cxIHS2HU9AxpAKZcytSsn5GqV7V80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755667089; c=relaxed/simple;
	bh=2NuIlexl8sKdTpa8K3Ng1YH290AAfgSN9p/5/nsGJ6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mVs95gn/aSozeCtVNfKizBFGdVpbWbCviMABED8IF71tlKRCi2+AEbVLGaiGB3dYS25lmAWTK8gGBWzn/Sx0f9nM+33wz7ajGNTnaKpM4WOVhZL9qVVtPoKjPXMEQb4yLl9Gv/CRqc//P7TbMgzwU3GZH3AHvp7ux3CQThXDvSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=in6kOJ2Y; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="in6kOJ2Y"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-323266d0535so795687a91.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 19 Aug 2025 22:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755667088; x=1756271888; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2NuIlexl8sKdTpa8K3Ng1YH290AAfgSN9p/5/nsGJ6c=;
        b=in6kOJ2Y3lz9ZWMdLs5VMQVK1Ksx7HDl0B11LDAeeGsI8nB3moF3QVBTrAf/ShguEJ
         n7AE8W8B1WEvp8GJrCpKQJCrKR8wEsnaW7MShRdxukZjDyyAVX6UDlC1kzyZd8Ld4A19
         aknedOvoBtI/+8fpdm9v8P7a4G0t5HF1AQjzXJ6fHQ0OntGuUcKN/9FWxeYsSPFywmoZ
         HZsX+fvSfFOZjhbK3BJgB6Zmb/Cx4t7VnyGRUqwaK+/1hiNIdPCc1KJ2UcPVypUWhSHI
         D+ho4FJ6YlQyWNEpCMaHVa+XZWyNLeKrdUo/+bRTx2wH8Z32zVQNCTtK/jdm+vVDTMuN
         9lww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755667088; x=1756271888;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2NuIlexl8sKdTpa8K3Ng1YH290AAfgSN9p/5/nsGJ6c=;
        b=sjwVJHsLsEhH1eN8foFJpVzhWF4x1IruQk6ikk7d4Y5ZP3qif7M0r7iJxrJU/ly92N
         7BfCuf9ru/sZ25tTeSkm2PBghJRiLtIV6vXdtD8mVzL+QchsckGoVW+FeYb7Ybq3kb8N
         EE8xnKeLWh7q4ovYEoWSBzdht0bGuXTb1soxMg/5V1n4EhkjlY3k4OEuTQknN78rChQl
         +1jeAdAhLrIwlBA7r0PX63MXoKOFToRGr4YXPAU1j3w8XMGYgzXUGhSMFfZxzv6Ny25S
         ychibtKPHfB+lniXYvtsfEjQAygnQVOBXA9YIZP9NCKh21LU7h4h9uWJqLQ4DDn6GWWz
         XNcQ==
X-Forwarded-Encrypted: i=1; AJvYcCViZ5a2RSCeH5SoJMpzrKXz6sHsjwZqDLhDbsvPTDkXdeHsRfHa3F8qRV5vA5W+f3T4VblyFb8wwW5ApulRnIpd+p99sQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxKEMpw8H50tlNjcjy1CGHXsEFnU1MJT7DjV7dtmS6s32fQeywl
	xpV868jnLzMI3C8YPuOYco6VPdbHJovNknj8CngGOpobiha348KckOfu
X-Gm-Gg: ASbGncsoHmoVzEa5fhYzmuQamWVqRqCdFsnHm0MNuxqhXSClPoAdNj+T9E+TnDCzcon
	ofrf4nocEj1orFrC4K808gtE1ixZMLyRQpvO5UTX1Rc1Y+ob+lolk+kmPE7gN7nAthlJ2RYu9h8
	Z94XwiS9qRp9eF6fle0pQUeiRhykJxD9mPSuv3Je3df1f7QrHlJTQb/IXzDMdEZ8HOftOUJpFu+
	yr7YKAs0Bn8fGPmkP+RPisa7APuhiJl5a3siXK9BZV0ez0w5ExKkC2isCxSH1Xci1obxlkIROau
	2zkPQbXfdyLdE+/94SWpsdHF9YwRxNtDfwX7bFoU0KpazDzGDFdEaYsBRhdu6LIrdbVWXhnqdoZ
	60jskVz1eHmoFemYCf0/N3aC/WZ+iuUI=
X-Google-Smtp-Source: AGHT+IHMD1LcX/pupFGgRrDlklcZoViMXprsqGd+UJfEK6hegF2tXkrCHXzy/74dHLRMWkAbHXwraQ==
X-Received: by 2002:a17:90b:1b04:b0:31e:f30f:6d21 with SMTP id 98e67ed59e1d1-324e1178c04mr1315233a91.0.1755667087796;
        Tue, 19 Aug 2025 22:18:07 -0700 (PDT)
Received: from hobbes ([2600:70ff:f833:0:8e07:c9e8:902c:6ffa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324e250eba9sm1003418a91.2.2025.08.19.22.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 22:18:06 -0700 (PDT)
Date: Tue, 19 Aug 2025 19:18:01 -1000
From: Joey Pabalinas <joeypabalinas@gmail.com>
To: Nai-Chen Cheng <bleach1827@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] drm/display: remove dead code in
 drm_edp_backlight_probe_state
Message-ID: <aKVaiRpULAGceEMD@hobbes>
References: <20250820-drm-dp-helper-logically-dead-code-2-v1-1-34421f4a7442@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fxN+yevHhckMWmys"
Content-Disposition: inline
In-Reply-To: <20250820-drm-dp-helper-logically-dead-code-2-v1-1-34421f4a7442@gmail.com>


--fxN+yevHhckMWmys
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 10:30:31AM +0800, Nai-Chen Cheng wrote:
> In the error path where ret < 0, the ternary operator "ret < 0 ? ret :
> -EIO" will always evaluate to ret since ret is guaranteed to be
> negative. Simplify by directly returning ret.
>=20
> Found by Coverity(CID 1649044).

Acked-by: Joey Pabalinas <joeypabalinas@gmail.com>

--=20
Cheers,
Joey Pabalinas

--fxN+yevHhckMWmys
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEx6b1SGGPTKxTmPDYqoHu9CTxowIFAmilWokACgkQqoHu9CTx
owLvWA/+OO8g6BVZk+PAWFYiWYD3imnpadaeoeKx42wPLV0y7LZrR9uZ1G+dCZyU
BCmDPq8FI+RPvV4mocggajuHvaU/ZtISUJ2C7gbIK6mJtl8SpyNe+DWPnOdo6euI
D2Y++3ds9im824TWlMTZUo9OkycrQCXYG3s1d3xftQjcqqmw/oZ96K4SAAyRQP7w
VnUQAhh562U6gN1rlCrwZSuyHykCoFyqSkZ83VcLt7RpDL+3oP4gagPN/vhiFcBt
+7qPYRsPBJZmketrhMOb/iS1a4IEESGzeezF3yZ5FpCcpVpLS3Ajw0+n/aLreGc5
/eJIolvhHGVenIjA0Xi3WgoyP9h9Zyj8fOJshhbtQ19nRBMe3ZSxn64PPNGHxbUN
L6jCmuDFMsCJS/Jqx6x1IfHbs/Ont3orkTwR1SJTRzt120NVN65RbfQMeU4MhZQY
4C+3DVi7BULnAduseq66qz5U/qA7r9s//8YpLDn8PW7UC5cjQHd2JcWmeSeDLJUe
LqCOB8jAFy+AO9rCpBrrhtE26dUeAA/Dl2XbOuns/87Oo5GKBamuDY2MCwhJbaw0
Z308BOM0TdtmOzsO7C4tYqQoG0/fpa7vXUXSrChCcq7NLoK+a9JrUmlXG2wwhjzI
f57T2lvKSVXMdPmBSgg64rfNAmpkT+AUN9BQxSCQSkWUAKnbARY=
=K/q7
-----END PGP SIGNATURE-----

--fxN+yevHhckMWmys--
