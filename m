Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2370225A354
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 12 Oct 2025 18:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760294296; cv=none; b=Ph/un4nW4JYFgL148m55zx3oDW4kwcGfJSwwRcTWAVPhbMd4habpz+upUxTbOLsX/gXm4d6mYgFg7vS0dAWLmfEbm3M+ayWYuqSrC4jNT/Eys9kDWJXoxGLPuTxpP5e4siiGNU7D0Zi2cZnMoqnrfRgnZWnGmIl3jFvmXy3IR/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760294296; c=relaxed/simple;
	bh=uQUkzfZR4PJiFUZmTs3kpHMobAqAZ8tDwNcgCtPeYDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uN2L+YnZJSCsEYlowYTsGk+Zj0LpKgLHZO/os1vDfMPj/uUMG6RNxFnSIPuXalc4+vd4OTaSVQfrJp8Zt98w8/aLI5t5HGZb/3GtiPK4tyhBxfI/X+0o1yHuzUqUi5ZTQLl64ROoCSy+ZDJLQns/K9U9qO3GdhFX/4ec9W3UXbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FiEx11Wm; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FiEx11Wm"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7835321bc98so3372937b3a.2
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 12 Oct 2025 11:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760294294; x=1760899094; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RdM5hdZmStu6wP/lPTHT68dpyLc/oyOsPR/mfyzBd4E=;
        b=FiEx11WmNcZfGD4W0HUT1AkE/FimFZYjgdrGy2V86QclHDfVbMRbDtM4fq3Kh8EK9S
         A5CEjK62kj560EA3zUsZUS3r+VwcMCh4c8xsZRtleG92BJz2kcpACGM0HKaHCd2TWaUY
         YPrRLcogE4o2seQR8+EKNd4tTUd5nkmcHjyLTQ9JQEKBAsUc0ZQAVxmMLd4IQXbhAtCj
         ASguT7LzVvcf2XgfSBg9B61t96fwD9gUdq899+sU1GzSLaanBVRHX4nix4iuNEEUU7LH
         7sxSGbpVH6pLpAOAstm42Ro81IgiukITOwgBLdaAc2ickCd2QrZk+LejXKWl+eyiOnqx
         FIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760294294; x=1760899094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RdM5hdZmStu6wP/lPTHT68dpyLc/oyOsPR/mfyzBd4E=;
        b=xATNSKtIZ/8J8BsjbU9GiMzbOmxbj0l0s35zgtn+tNEPhWxDmfApdaq65TgpA+lkIS
         RPa6IrV2hMYeCQDV68cfbnmaA6J7dL/vAesAtTC6TyDv7adCj4DjxHhcETic5ooJnC85
         TzYrC1LIvn4tymx5zn3vjKvndhgQCF+MbeL+UADWDTqFoqjp9rpjAfb/1RjKdJUaNPDE
         KyPkppIu+i5fd/lkUoBWSYWQXJKeRhSsKCM2s9lOlNM/AsSDJmsvtvOsK0mvgbMz4fgy
         gBYQRvXkkjoMyIIPCcg4AWXa90+h34TJKnrS/fAi7QrafxL8I6CVpFN69o/dbF1W2mf3
         E/8w==
X-Forwarded-Encrypted: i=1; AJvYcCVpxj5j0idtl1hI2Yi0NNMU2PD1VOEGhjGP1xDyjmEGp9mv6iGc+nrGJ8TgI4iDVIAGMTmHccwWoe3OoLjm4hlqGu6pSA==@lists.linux.dev
X-Gm-Message-State: AOJu0YynT956HixW2iGFf5umTdiyxKU5/UY0VwkkJX8EriRTrrj6a6s8
	qtyKpwilcZsM0n0RBPu60wkyV0tV2qwImsmzadFzF379Rv6RxjV/EE5W
X-Gm-Gg: ASbGncvYfUuaZX6CWfakfqSb5yXKt/KExiMwcfnaldI5yPKWEQfbd1jWwY/NP1MkJY+
	1VIQWfFg1OFe3dpcg0J/PVN6RYyOGwEymn8s/Rq1RVRbqAH+Bnf+p6BQfX8jI3iPIl9UPour2na
	qkQrOddkQdDkjNh4lIqtpQxvKZuthkH2EJotkYYDALSxRqzX1IMjYyYCDs+xjBybvhgKgzY5d5N
	JSwZnEwSTEotypWRywPMgWo9bMimrm0rgInoDTWxxszm5eG0HU/Xs4QALhRWxFG9TrPGfFo7ge0
	2n2RNOqxHGWhCM8B2FMDvBtqjjnIsIvFfw7YaExAxmuoQVVaOdI3GAhBsEn/7yRIpNnUGX7dsUg
	n3N2d5ajJZS4liXMSjnoAW3/Kg4PC6MpkdcmBSEn2J0adhNJa
X-Google-Smtp-Source: AGHT+IGD4qq0d7J+6TgXoMmi4zHj5Ov0A4tbqkUnz7sBexTic8piA6fopsWY2ndvOzIISYPoIaFSqw==
X-Received: by 2002:a05:6a00:3d52:b0:781:1a9f:aee7 with SMTP id d2e1a72fcca58-79385709970mr22178082b3a.2.1760294294103;
        Sun, 12 Oct 2025 11:38:14 -0700 (PDT)
Received: from rakuram-MSI.. ([2409:40f4:310f:1e2f:de73:6871:5bf8:3f34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e1336sm8982904b3a.59.2025.10.12.11.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 11:38:13 -0700 (PDT)
From: Rakuram Eswaran <rakuram.e96@gmail.com>
To: u.kleine-koenig@baylibre.com
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
	ulf.hansson@linaro.org,
	zhoubinbin@loongson.cn
Subject: Re: [PATCH] mmc: pxamci: Fix passing NULL to PTR_ERR() in pxamci_probe() 
Date: Mon, 13 Oct 2025 00:07:52 +0530
Message-ID: <20251012183804.15171-1-rakuram.e96@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: xxtrhbv5qm2crtvc5ejpgu5caadsmms3rfulmosjwq7lumrko3@5mlcpk24hymm
References: <xxtrhbv5qm2crtvc5ejpgu5caadsmms3rfulmosjwq7lumrko3@5mlcpk24hymm>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

> >
> > I do not see the need for this code change. "if (host->dma_chan_tx)" will
> > skip "dma_release_channel(host->dma_chan_tx)" since dma_chan_tx is already
> > NULL. This code change does not add anything.
>
> Yes, stand alone this change doesn't make sense, but if we want to drop
>
>         host->dma_chan_tx = NULL
>
> in the error path above, this change is needed. Maybe then even
>
>         if (host->dma_chan_rx)
>
> and
>
>         if (host->dma_chan_rx)
>
> can be dropped.

Hello Uwe, 

I had one quick follow-up before sending v2.

Regarding the devm_clk_get() error path —
you mentioned that setting host->clk = NULL; is redundant since host is 
devm-managed and the function returns immediately afterward.

> I am not sure that sounds right. Looking at the code for
> __devm_clk_get(), if devres_alloc() fails, it returns -ENOMEM. If any of
> the other steps after a successful devres_alloc() fail, code goes
> through possibly clk_put() if needed and then devres_free(). So the
> resources are already freed at this point before the return to
> pxamci_probe(). The only thing left to do is to set host->clk to NULL
> since it would be set to an error pointer at this point.

Khalid pointed out that when __devm_clk_get() fails after allocating a 
devres entry, the internal cleanup (clk_put() + devres_free()) ensures 
resources are released, but host->clk would still hold an ERR_PTR() 
value at that point.

His suggestion was that setting it to NULL might be a harmless defensive 
step to avoid any accidental later dereference.

For now, I have dropped the redundant NULL assignment from 
host->dma_chan_rx = NULL and directly returning the ERR_PTR instead of 
storing in a return variable. 

Below I have appended proposed changes for v2.

diff --git a/drivers/mmc/host/pxamci.c b/drivers/mmc/host/pxamci.c
index 26d03352af63..eb46a4861dbe 100644
--- a/drivers/mmc/host/pxamci.c
+++ b/drivers/mmc/host/pxamci.c
@@ -653,8 +653,9 @@ static int pxamci_probe(struct platform_device *pdev)
 
 	host->clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(host->clk)) {
+		ret = PTR_ERR(host->clk);
 		host->clk = NULL;
-		return PTR_ERR(host->clk);
+		return ret;
 	}
 
 	host->clkrate = clk_get_rate(host->clk);
@@ -705,7 +706,6 @@ static int pxamci_probe(struct platform_device *pdev)
 
 	host->dma_chan_rx = dma_request_chan(dev, "rx");
 	if (IS_ERR(host->dma_chan_rx)) {
-		host->dma_chan_rx = NULL;
 		return dev_err_probe(dev, PTR_ERR(host->dma_chan_rx),
 				     "unable to request rx dma channel\n");
 	}

Would you prefer that I:

1. Remove the host->clk = NULL; assignment for consistency (as you initially 
suggested), or

2. Keep it in v2 for defensive clarity, as Khalid reasoned?

I just wanted to confirm your preference before resending, to keep v2 aligned.

Thanks again for your time and detailed feedback!

Best regards,
Rakuram
