Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45590369D59
	for <linux-kernel-mentees@lists.linux.dev>; Sun,  2 Aug 2026 12:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785674320; cv=none; b=t3fVAJk0KZtKn9NsxU/csTBxxQuM9Sg4LwzT9aJOQLnEPPEQbJqLCJ9n78dy8uDJ/tsyZS3W3z1pgXvd3TighRHu1QqpNnWPcNrOjKMLFQrrEXQYaxx00TShFTA7xpxpYwH+xTMzwYTSzStvp2d5nNzUc6XbQSyjHuHpqkCtInU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785674320; c=relaxed/simple;
	bh=FUud0qIrxq+PQmP+DKOJ9cRWUJkFwQBvJb/k9126FCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QWPi431/E8pcju/CqNXhW2BnH4P2IYT0WYpPRyo7bv3T3wdraZof3Ai2kF4kjoElLdFQxVp8AofNzi+WSU/h6/snvake6/aogSsNKmrr/fuOT3DNtPSLxK4+enlojxNd+VPklY3hokG5+UUQH3AKs1ZubtdcXFRi/IDDwO94t2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=jCblM2FC; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="jCblM2FC"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47fdb6f7d72so334594f8f.0
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 02 Aug 2026 05:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785674317; x=1786279117; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FUud0qIrxq+PQmP+DKOJ9cRWUJkFwQBvJb/k9126FCI=;
        b=jCblM2FCuSVHwJjqqCz4ndiRpXP6MIkABZAIhmYs6okebRGM5MLmriIHG2cemhqwSz
         RcVz60r19QgWmv3kxqSBRPJu4UDZB44uxW5PTNvU1Wnjfeb4KiX1A6I/XYvg8ojPl0bx
         gVDY77tVX+7M3biKb2+C4bZEmzusHaQhSMfhebV9SUkZh0zuB32iscCB9RpIZ70Mb1CO
         h3ODO0GnGEfzJtIp4yMOF/GRPydHxsmc5fPBS4QnPMZZXihWzKb8bNYBmWOJXcYD5cDz
         nXmU5krfCXM3y/+RfWv+LLIUlaUenJlKBO0V4/lVqlgiODb7TCfW/wEmJsJRRvYI/Q72
         mWgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785674317; x=1786279117;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FUud0qIrxq+PQmP+DKOJ9cRWUJkFwQBvJb/k9126FCI=;
        b=CTzRIOXkBNiloetyglf8kztaq9GV/ZvpkEYmtMBHTm7yNG6mb3tqGriSfMBPIPWKDm
         QHX4mahWF57S7glmymRLtu8arn+NXIrpZ552C+dsO1lxGt/lH7wQsFi86XLgGiAKYdsg
         qVXSz30LHz9Ci/0cLRdukvQOA5m94aGOO5JTD/wCNU2WWTXReD/V1W4P35ODsdJyZ7mg
         +FSsm0+c8S0sRTQFaEJKiEIhrx3rRi3NqHUhBXMEt8hkU1gkOev18xtjkFu+0NEkLPOv
         iVlClmk1lNlBTltq+t1cH3442rflSI3U8xq+5IPx1Tx4Q2JdDdYlKd6JCtJRzDPaVD1z
         xi7w==
X-Forwarded-Encrypted: i=1; AHgh+RpHhZ1+fXPb+8dkO8EDcaD2YO659SWZBcv4lD4IkCkbBAzc1IWwQMJsdVkoefERtteiDPwiWqL2HOVB1JY1W6vewJ0aCQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzmg9xOvb8rkbco8dbAEhozHc7CxNYZzaxFrcfar3zUcSNwHQF1
	sCAJ/6UZgYW6f1yn//gI30MASHPxeC8iHgr/BjPSvpP6EOi39JVR4Q7gHVcY2wt0Nwo=
X-Gm-Gg: AR+sD11HteEWjMuvsNHZoySoEdwbsZFowbO97K+Z2kqUta9TQ6QA69uLJAx+zdHyxob
	KWNmHJjLn0EbkWCfDGqMHcfnw5JAiXycrXrUJC0peoBT0/3XwLrzyKWjVHwMM5azSb1vR+Vzl6s
	J5sKEMmQcwujCKW5qnPtp5COwtsE1+qLMw/INFZub+ymc8Ok3d52sLCy8qhVSchTvmJ7/aPe2Dt
	rbEcp5iMVZ8Yu6TMduMBloxBOKLQd9S/3YWfFnO5T39d4Y6VQvu7NBt6ActbAwBjE0mILC2gHLs
	ps9ppjG8jjXEqx+4JWdDlyCi2zevAyAjLp2n0BMUe5WyNgDV4t5QvIdl7g22n2UhSQXbtRC4F9O
	pjjPuT8JZaTTwnThN7Q4sMOZIoeVQ3UTBMVq5/kHnAXYzhw9Sz9yjMPCN4u9iyixWZLMvRn6x4a
	fsEE2FH5kJ+7emtLHhU5plzZcLdNVYGUCvgSBpw1GKABW54xorGBfMGBWcnrcvod7w2A==
X-Received: by 2002:a05:6000:41c5:b0:47f:6f9e:1e82 with SMTP id ffacd0b85a97d-47fd72bbc06mr17510605f8f.9.1785674317371;
        Sun, 02 Aug 2026 05:38:37 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47fd45a0d7csm20932880f8f.35.2026.08.02.05.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 05:38:35 -0700 (PDT)
Date: Sun, 2 Aug 2026 14:38:35 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Adi Nata <adinata.softwareengineer@gmail.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, dakr@kernel.org, bhelgaas@google.com, mazziesaccount@gmail.com, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] iio: humidity: htu21: Fix SYMBOLIC_PERMS chekcpatch
 warning
Message-ID: <am86LUUeP7FYpQTC@monoceros>
References: <20260802012329.9877-1-adinata.softwareengineer@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l65pe66ab5ly532k"
Content-Disposition: inline
In-Reply-To: <20260802012329.9877-1-adinata.softwareengineer@gmail.com>


--l65pe66ab5ly532k
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH] iio: humidity: htu21: Fix SYMBOLIC_PERMS chekcpatch
 warning
MIME-Version: 1.0

Hello,

$Subject ~= s/chekc/check/

Best regards
Uwe

--l65pe66ab5ly532k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpvOkgACgkQj4D7WH0S
/k7Nggf/f2iAO0YAqCaePzleJcYfHLcZ/pnmQl8QJ50jszqhMA3KeV7PESWbfUzw
TDpx2x+JLkfK6EGtb2wbMT9PFcQwMGgI1A00w5Vmpl9RpT6k4stJQHx45Sjzh+iy
svZjzBVIfMcTO3zwd8Gx9mBCQP/NCpgd9PRFr6GJ2SQFXP/EIsJ7vizhgabz8NQA
V0UIjgac0UKr4eO+xn0OEJLDIgdhdjF/I1D2kIsVCa47uTnA3AvPT4AhZ4ZJN1TP
3iv/9AWHluthE6ifBGzUYcRN7s1XZ1GSq8mmVHBgcqoYIRq5RTI2n0N8ceAiOUh9
A3t+hvdPhKdg37gTn2TTVWAIMioiDw==
=Vnaz
-----END PGP SIGNATURE-----

--l65pe66ab5ly532k--
