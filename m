Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE6935C1AA
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Nov 2025 14:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763475807; cv=none; b=r3vJKrE2NLqGnaEUgA0gK2nkaaRSDkLCEKk+mNQ0sVNWZ9BCEuicRYwQ4YZfnDm9LTcCueNuWBYzH/IgCaRaFWtlzvnABom4c5etpoPvHlZDQADIEnawcVwEVG/rz5Iqej5+RL6DhgP+5NTYQ8YNirYb97GOFD+YyUyle8PqsNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763475807; c=relaxed/simple;
	bh=zZSQe2ZxHutuqSiWUIg5Vy/daN/b64qg/IMIRlyyNxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fogXv291hxBmc76nlJ8PfZhjHSWzpqRoZCsVqkYBJsjeonxmNTcNWnfTxnZqFh1BaseRvHPwSlWaEf9CCVrCmqjuBhxO5FkUq15u8WZ461Uuj8Am2U33yOSFGthTehPMwrj+TnYiDkpFVqkB2MzdskyGD7l57s6DMupsG2VRQYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CeJ9kD87; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CeJ9kD87"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2980d9b7df5so58740975ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Nov 2025 06:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763475805; x=1764080605; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4UD0GpwQ8ZB6y6bn4+JVNJNgyJMPm3VDbXU5N9w4UY=;
        b=CeJ9kD875TlJSIOvL3svWzOmQwpBWpdAcy8+nWavLEg5orLnUyiIatYWKf/yb186Ee
         7zsHpJcJRthl09cZ5KBL6Kuz3BYtUSypNUi52+8HClrFH+7LH7sfTuiuR2Uhx5Lg8G93
         1v9Bi3t57US4XIzZK0n5tFZHSeiy4QSRoRC2P3Vm+7dAs+vLakh4AkFWpIfZE84Uo3dQ
         UyloWhIYYULur+MxYCBv3LM08r1m64Hn4gS77azHcu4JYdlokn2BIMqwa/F/RTV5WiPq
         duOyHvqtIpWxZP8M25ybd1wnqyrXeCd9tGiYisVxel0GNMA4SYhDHvkzQ5h07NKiFtwI
         BQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763475805; x=1764080605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i4UD0GpwQ8ZB6y6bn4+JVNJNgyJMPm3VDbXU5N9w4UY=;
        b=iZUm1WlI+hrZPZhaEMr9P2nM1rqri8vwwIXIffXAHbizFqppvGkb9LUB2Cd8AX4CQU
         7vizHCKhTupuG5EuKUUT2rj9n11dBaij3Td9ASrtU9IZywQ02EIzysBlXNSRpMYCufYZ
         Y5BhNIYNymBnOTZtrubt3iezcwJD6E1VoP718apMtrjpSgfvf/2F1R9U0MIZhECzrPU3
         d9MCSSzKPsNTO5LFD3YpUlgAlL3SyA68QPmlF7GtvbQRmn4RYYgC+dp4ZcEwaymojVhF
         OMwNuNpA3NKhBGwy9myao3mUG6oJvUjdD+CCj3uiLOB9IdlmRzg2mcEdFyxYyhKOEg8X
         bhcg==
X-Forwarded-Encrypted: i=1; AJvYcCVp19/i7Xn+1+qK0SlZsAOsbbeMD6WNkbxwZ8vFR9YDZ4+Mgdv9RJ0FM86X+eonWtH+c5W9UW4Q0ktex58weik1fuj9eQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzoEbvJyrb9JBUKB4C/oE97gKwZzeRSrf/SzyxPBuRkeaAG2wjQ
	I4bclMFiiXqnz53zGwlumxIA1jbpRCjDmIKb8LJ11EbvhCfKX/G5/gRq
X-Gm-Gg: ASbGnct/smg/z8mIZeax/nfIOjQMtdSKafC+yCjdEXR30Xex/VqVKFxlykcJke0xEgh
	pV0J0AcUzekPGKiCV+1m6Sgzn9rLYvH4eouYoAkxa1aRGUL6klpr+11pPDuWrWANrfqI8qWUlWi
	hgYKytS0dHIti7sEwk0Aa4RoRXOhgEo82yz+eiXXX6LEwNAXcq8yEGisRNhw+V0YK4q6i7dX4wq
	qniXt7HKb7lpPciMm7Fj5GAe1U93y2ng6bvVtMOaCbHoUT2HPX8+eG5h6W36VKXn2mgJwk9ymVP
	HuqqZisdRj1UCDHFWZWOluZZe9eclurphOst/PwcDmJTE6mc1J/JTBtiBTupisJ00jmR4GUqiCe
	qvDJ+HU6BFeFCp468XOxs/jnJR/9LyA3BhDgHOMr5qJlxOZOm7RXJT8hyKmkFtCHb8i0ZZNr1at
	xoo6mxbe1uBzjeL1yU
X-Google-Smtp-Source: AGHT+IEC31C+/QdlNZ28QnBzgc25thMPM7VSRkpCkiti8OLZOlHrEqIdHvn57SdKvFQQebb6wsTr7A==
X-Received: by 2002:a17:903:120b:b0:298:60d5:d27a with SMTP id d9443c01a7336-2986a73b975mr207046245ad.28.1763475804730;
        Tue, 18 Nov 2025 06:23:24 -0800 (PST)
Received: from rakuram-MSI ([2405:201:d027:f05b:b076:498e:270b:2a02])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc377414572sm15108698a12.35.2025.11.18.06.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 06:23:24 -0800 (PST)
From: Rakuram Eswaran <rakuram.e96@gmail.com>
To: ulf.hansson@linaro.org,
	u.kleine-koenig@baylibre.com
Cc: chenhuacai@kernel.org,
	dan.carpenter@linaro.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	lkp@intel.com,
	rakuram.e96@gmail.com,
	skhan@linuxfoundation.org,
	zhoubinbin@loongson.cn
Subject: Re: [PATCH v3] mmc: pxamci: Simplify pxamci_probe() error handling using devm APIs
Date: Tue, 18 Nov 2025 19:53:11 +0530
Message-ID: <20251118142317.12921-1-rakuram.e96@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: CAPDyKFoSX7QZGv78dL10C38wY0Sg5QC1qxvhyGXJ+VUYHihP3A@mail.gmail.com
References: <CAPDyKFoSX7QZGv78dL10C38wY0Sg5QC1qxvhyGXJ+VUYHihP3A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On Tue, 11 Nov 2025 at 23:06, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Thu, 23 Oct 2025 at 16:54, Rakuram Eswaran <rakuram.e96@gmail.com> wrote:
> >
> > This patch refactors pxamci_probe() to use devm-managed resource
> > allocation (e.g. devm_dma_request_chan) and dev_err_probe() for
> > improved readability and automatic cleanup on probe failure.
> >
> > It also removes redundant NULL assignments and manual resource release
> > logic from pxamci_probe(), and eliminates the corresponding release
> > calls from pxamci_remove().
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Closes: https://lore.kernel.org/r/202510041841.pRlunIfl-lkp@intel.com/
> > Fixes: 58c40f3faf742c ("mmc: pxamci: Use devm_mmc_alloc_host() helper")
> > Suggested-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> > Signed-off-by: Rakuram Eswaran <rakuram.e96@gmail.com>
>
> Applied for fixes, thanks!
>
> Kind regards
> Uffe
>

Hi Ulf Hansson,

Thank you for applying to fixes branch.

Hi Uwe,

Shall I start to send the patch to remove the redundant if condition
check from pxamic_remove() function?

Link to prior discussion:
https://lore.kernel.org/linux-mmc/pvid2ycmgbkbmegnnzwl4hyev6e2smusxk5olkuqxfwxzykz2e@jlvolirolrxl/

I can pull Uffe fixes branch to send the above patch? Any inputs will be
really helpful to start working on this.

Another point, I would like to ask is about the below discussion. You have
mentioned about WIP suggestion for clk_get_rate(). 

Link to that discussion:
https://lore.kernel.org/linux-mmc/20251020183209.11040-1-rakuram.e96@gmail.com/

Was my understanding is correct?

Best Regards,
Rakuram
