Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B074A1C861D
	for <linux-kernel-mentees@lists.linux.dev>; Sun,  2 Aug 2026 15:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785685143; cv=none; b=t+UWgBNIq2aoiKLi1t2nvyPEtR3opLGz52u8qz95leoWXd7rKnmvRY1tGELto7KcsvwOCaV5x1/KZqllBVzbmCJKYRNNjkCpT1iRH5OAvtH8PQcryhMoGTaA+e0tbc75SmoOXLWSufsxzKoVZN4xOsdoo7fTkqIBHe1uOubtTRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785685143; c=relaxed/simple;
	bh=Cw3BW59pzjhQ6yYtaY8oTMbMzdfEUldSAQFGv5og+Wk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GZhWyBAt+APGL0OG9UQ2wNNk5VvTGIfK4/GWoRr2HfezaZODpHP8QV5gS4+empYL6dUnzTjKQOI3spN8gpy/dSHOuGv3Nr1WIeFlRs9rR1bP+OdMm0Vd01PXEgHO2PnvLAcojTKuMKY5o2X2QTf1ButT8o8fLj/N8mUpKe2cN+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=igcJOnCk; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="igcJOnCk"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c1c52d920b8so375801466b.2
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 02 Aug 2026 08:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785685140; x=1786289940; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a1DcnFU7EismyxYSalD2E+hMXE3WVdszKjjvYYTM+tk=;
        b=igcJOnCkIDkfQze1fdYsnuIJar/XyI/qdOwYIipOzkQoyx3QNgYfYLRfwL/ITfIcMG
         sdHR1Xbj4T2KdiJsH04gBz40h7Q+ucoXSw5klKtv03LhAhGFtmfuuQl9oIlNECzsnOkF
         2WkGe7FSFv7aQeaOKeetX0VKlhyrj1NxLYnypxK9RzoSaMPhcMADkAaymM3RQWD9txDy
         h1Ablpconus1ckl8aF5lSFsinxpSN5JFUl74bp6r8IcExP6pnV6P4PiLaOLULOOm+1i7
         hcWvDNHtT7nWW5s+2Bt+PWl9T3xDYkfhGn++KJfWmtmbEZZer2jMn9gBw5MsyMxfjX28
         9D1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785685140; x=1786289940;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a1DcnFU7EismyxYSalD2E+hMXE3WVdszKjjvYYTM+tk=;
        b=p2brf4heomTmaCFhvdfqvbvvRQd9dthQNRyvI0njw14TXef4elRrom2LdPDr68ci0M
         BF+/SYJlU7eAzX5PnY2g1JCOoWzsafzk1JKGSIU0mZ1JykzCdXLaI0BIwqipYiDoTbjk
         TaOklRJZ7H9qXIMwTOuZQTitSlZF5nt9soKFPBlUUHTE7roKRYttC2ERj5d0P9CkNfzC
         N3gvxf0wc7krxU39CJ9fZPCuquAlT3eSiOgYw+abR4hYWC7QGGC2SkG4E2OdWpiHSLS3
         alS1AVVTJrmFdaP99v2O2qGQL9yyFnH2PYaJwyS8oj/bxO96vaap6qCzuPUfigGNNMTE
         VhfQ==
X-Forwarded-Encrypted: i=1; AHgh+RqhWVu2k40S6mwLIjEDaR6ikv8VPsgIBSz1rxQP95F4ulKBVD92fHSkPL4HqXujgVNo9+wTTkv82UPiHzAzMHzQVdsuNg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyTd3R6jAeQ9Yki4xYXTp1zJYSGK1YDob7h3JPGEfFeWh6TP36j
	VYFY/woULsMTlJLzOBZlKliiWlEb7Uz124f/NN+LFgh5/NFHc+9C/Ciz
X-Gm-Gg: AR+sD10kBYq6d8NICvpQnmxCY2rnvCqFvd1cKDLed/Qr4m3+YBnDSECeiTcXtahvMHp
	3XvX6LYoeHK5QZZ3v49injme5wt+Qt4KTrfm7DDLtUxpVA+PEANV4EyHeQOeBXek5Wq4USXrMtk
	2RJ7DLD+Mz+QBPYVCaNHSGi6kxTUk11wRrCsmU3EhBsBpyYDmFckCcrpjDsRA/IpyOI/e1NB9c/
	C+da/Jxlkv0JL8jB8XFQ4a2TWC1S1mdq4IzPIfasJQ7P5dJgQKhZEa6Qm8eUZV5EWbDVMfthwRJ
	9BVHyHMLZiaAlI2o29ufWYeHxKV23ILZWNj03BrGCb+BQe/LW8LUtXnRt0xq6VdNWWW83NmeaLo
	+d+mqqpA8WeFy5Nyym+0AzL8i2CykKcuWv1W5OnSy0xIIRsvCPaQxCKimq+npoIV4c+tGFLkWnV
	yiqaldzBt/r3e/S9rkdJggwxHfJMHcuZboHzZ6/t4bX5rsGwkAynOyfX3R4Rv1WtzLQONBkIVVe
	1ehWTnmEVpHcss/gpZwhrxXCrq2xQwbsohkQ/NiETHB4lJumSvExSOb0AhI+7EfnjJh0951nw0K
	CE/kvXQWl0HUERTg8WkENZ3NG/RZaozjyXCrBkhpXHm3aw7s2/fcwB2zpiWRFnonktuSlJXv2HC
	xlANoP0Ca4hY7cWXqb5u66rwuWn3VwgZ7COTM
X-Received: by 2002:a17:906:4e83:b0:c1f:5d05:34e8 with SMTP id a640c23a62f3a-c1fe80cad02mr347793066b.21.1785685139681;
        Sun, 02 Aug 2026 08:38:59 -0700 (PDT)
Received: from systembl0wer ([185.94.52.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd4534fc4sm418261566b.51.2026.08.02.08.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 08:38:59 -0700 (PDT)
Date: Sun, 2 Aug 2026 17:38:52 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Adi Nata <adinata.softwareengineer@gmail.com>
Cc: lorenzo@kernel.org, jic23@kernel.org, dlechner@baylibre.com,
 nuno.sa@analog.com, andy@kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] iio: humidity: hts221: Fix checkpatch blank line
 warning
Message-ID: <20260802173852.32b4bc52@systembl0wer>
In-Reply-To: <20260802020614.19732-1-adinata.softwareengineer@gmail.com>
References: <20260802020614.19732-1-adinata.softwareengineer@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun,  2 Aug 2026 10:06:13 +0800
Adi Nata <adinata.softwareengineer@gmail.com> wrote:

> Checkpatch warning:
> 
> WARNING: Missing a blank line after declarations
> +	struct hts221_hw *hw = iio_priv(iio_dev);
> 
> Signed-off-by: Adi Nata <adinata.softwareengineer@gmail.com>
> ---

This seems like churn on its own, Jonathan may not apply it.

Also, I feel like just putting checkpatch warnings directly into the
commit message is bad practice. Much better if it were "Add a blank line
after variable declarations per checkpatch warning."

-- 
Kind regards,
Joshua Crofts
