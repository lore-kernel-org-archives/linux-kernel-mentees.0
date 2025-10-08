Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2977519AD70
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  8 Oct 2025 00:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759882248; cv=none; b=rvnoQY6iHohs8fSk00sVg0xIFCuW+zJ22AbFecjjfBHN05o9BulnJbvyGwIBms30lZ8CGjdgwN7zaND0wVwrd/+ySIM6Ik95PCMCQBqvpsqfSG96S8aPyXW37cIHvwpSycKi2UBeKyrg330TdGew9XJrJ4qLFW/v/BA4yHNVV9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759882248; c=relaxed/simple;
	bh=5DjQq9GiDEKkg86E8LlrByJSBd0L+Mv47bskd5ivaiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZlnqlcmB47EzplWEAR7OmaFSuIa4OMeXmexVj4kBrjbbxErsJ5CMmqMu2IMSEbgQIXOEHD8f/D3zjur54Qzx0xmJrhheaz7nv1qQPL86f5puF3txixJCZT66C1at4UdKhpg+eNkz1B5wlfb9XyDEv8DmuIOjGTPY3WxMgU2bu6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eLg9Jn23; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eLg9Jn23"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b554bb615dcso5078772a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 07 Oct 2025 17:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759882246; x=1760487046; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5DjQq9GiDEKkg86E8LlrByJSBd0L+Mv47bskd5ivaiE=;
        b=eLg9Jn23bP1UCD2TJwP8rF2WJsQuLnsgM4QD+VffiB6Yhe1TZH7T3qjYLqAU3GHSqf
         RRLzb/MkQzx+GL59NGNpBjgizlDtDn/k3jOHwOK16Bt5m3haev3Rl4MLqzQzCtPhw9V6
         z+DTKTQtZbZgSOvfXNN/9BNXzxXFMV6evDzWt70yUUZKOQZprrzKF/FsTe+XQKlcfGNN
         P1wzfzv3lTT+Ov4F6XbVbP0/31W4ppe5APKTeMuasD+RhFKQUyVl6R7tvy8OlNvzd8rw
         LUpSfDMIFAOt/M+tn5PPLDy04VoBARqHCvoUkuLOtmE005CDbNX7ZUwRXxEJOcdCqOgy
         x4yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759882246; x=1760487046;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5DjQq9GiDEKkg86E8LlrByJSBd0L+Mv47bskd5ivaiE=;
        b=dZX8cNCu5rd1z4xLkq0AGyR3M7ggV10/U8mvvPll881cpZOkNq8pUaYZ2YE9ZJVsJg
         k6tij4G9Zls5md23LhigDQzhFmoU0EVFIVC1MtOzRyueXCkADp4c+L4KQJyO3Fgp/mKh
         fljaWcnFiREIClt6mXa/FXXrqChCGP+Qjf/3/SQm3tREosxFDihF/cG2QMOSlEs+Y4bb
         qfazJ2zsUtGtTJa4vkeIuCLQ1wD0bRbIRMQkmQ5Y+67nVUyOYWkyUoVGPW7rR9xANaGQ
         9n5gMwFq6xdxiF7S0zb2KnnXfveYaCox1z2HOHGauCnMLrcX+Gq+RBbErCH+661Y8ZEF
         +qUg==
X-Forwarded-Encrypted: i=1; AJvYcCXQ3RIy4InwhnxB2JfmG10uA/TAQJ/gC1P/x92YALoaIvtYiD9XcRSf9oXvau1Ri4Njp5CC4tyE7H9fCqv/G7R29XVE5Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyqcKMP1UJNh7RiXtvNn9YpVTRj4CWQviiIQmuV6f+3Bh8RZzPg
	/6Hssr6VOd6jIlCnfCSwXb+k599VV/YfAABT9ur0c3fRYT0FO7zrCvhn
X-Gm-Gg: ASbGnctP4L2X5XWd5lhmrcKbkjDm/tjso63XMDRMOKtaplPRUB/5+o7LdSdMSSuxDKV
	eLrxCE9JoS9XM/c3NS8UOOF8p/1YNrmMqycWNAO7qkHyymEXcAe04K+Qg7e31cmMrgW3A/flnFA
	K7tGG49AOkOW5y9xQB27Ht82oVzhkR30Ulp/6qaUz6ZcX9HuP0/oYVyIPwcQr3l+q/1qBPtLTkW
	utFWWBzA9POUV2Eh3ELXIOUfXkDfop5FcxOfTgsl+LNjzeulaZNYc9CQ7X/lyXV/23Uy8lqxsC+
	juKgqVxVXTjHCcKGncSXJC1ZVcdlMXmgMXUY+jwM5Pb/KQrQ+bGZut0jnhqRXHH2+PTgKvLMWv2
	0I/vy+12P+rnxHSS61aWofIQPDhvhZVHb1TccwbKYYBzwD8DydQ==
X-Google-Smtp-Source: AGHT+IHgwCD+l9vU2RGoqSNi25s3Y73FXtbqCN1chUFkrAL5OHXH3HCXgZb11azdn0WBZQ2RZ5Ft7g==
X-Received: by 2002:a17:902:ea0d:b0:267:44e6:11b3 with SMTP id d9443c01a7336-2902737494amr19890155ad.45.1759882246372;
        Tue, 07 Oct 2025 17:10:46 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1b87acsm179342975ad.76.2025.10.07.17.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 17:10:45 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id B28884233430; Wed, 08 Oct 2025 07:10:43 +0700 (WIB)
Date: Wed, 8 Oct 2025 07:10:43 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Gopi Krishna Menon <krishnagopi487@gmail.com>, rostedt@goodmis.org,
	corbet@lwn.net
Cc: linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com, khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev, crwood@redhat.com,
	tglozar@redhat.com, costa.shul@redhat.com, jkacur@redhat.com
Subject: Re: [PATCH 7/8] Documentation/rtla: rename common_top_options.rst
Message-ID: <aOWsA-HaX7A9Uqox@archie.me>
References: <aOUMyGvkibvOV0IS@archie.me>
 <20251007185508.40908-1-krishnagopi487@gmail.com>
 <20251007185508.40908-8-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xXfMCs0OD+RwnfE/"
Content-Disposition: inline
In-Reply-To: <20251007185508.40908-8-krishnagopi487@gmail.com>


--xXfMCs0OD+RwnfE/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 08, 2025 at 12:24:56AM +0530, Gopi Krishna Menon wrote:
> common_top_options.rst is intended to be included by other rtla
> documents and is not meant to be built as a standalone document.
>=20
> Rename common_top_options.rst to common_top_options.txt to maintain
> consistency with other common_*.txt files and prevent Sphinx from
> building it as a standalone document. Update all include references
> accordingly.
>=20

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--xXfMCs0OD+RwnfE/
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaOWsAwAKCRD2uYlJVVFO
o3/hAQCgsR/Awy30I6u1h473v37KycMP9YzYPoQLzG7GDP3h9wD/fINZ49mckUaV
QQJZIpiPaubn2Y1EnpJshktreCf2igo=
=4+9L
-----END PGP SIGNATURE-----

--xXfMCs0OD+RwnfE/--
