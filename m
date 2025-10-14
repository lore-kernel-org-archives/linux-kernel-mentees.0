Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADCF18A956
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 14 Oct 2025 18:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760467676; cv=none; b=mI7JMt0FQduO+1nNfdHPjn4eRn83FQvRRf0w9Ktp3UZe/oDleuqd4pe25jN3pabspg8eFrZQU1r4Ln5H4lWe3HSg3NRhKQvcLJ9BeCM3qD7m2LriMH31kemHG0XJmcK1bketfO+BmW2Lwd3IqvTGEBAJ9eUykjjn11d9MBvZqOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760467676; c=relaxed/simple;
	bh=hgw2ak5c1O2M/5ChYQ01W+oW1brr/FJVECKIUnmfon0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sBivtD6sT07OzMdHD4O9qQ8SXV7jPeOyR67Xax0m52hXk6qgMnwyeO2ez0RPQcT126KZoPWh2ZwvAf3FyvaoMihlzVDAp5Q6ov2OWAf890FQVLcV3RaBAa8h2zafIgWoIXBE57mfrLnBvuuXqveXEMdLO1KpnIwlmd3yOvAFIj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D1LW9xqr; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D1LW9xqr"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-782bfd0a977so4782031b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 14 Oct 2025 11:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760467674; x=1761072474; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QPOmoKy9wR88I2He99PlsgEdkB2xOEgVxLxZe9Nh3wU=;
        b=D1LW9xqrfo/DYg9eoYqINOv+9WUOXIduP0Tpajd2OlMYmG1aWTPT+ICNOVPoFypzw9
         eu73QbOb3JVjXmApCbqNXwM5BSDFjRqqJldmVI7V8uWuI7r05IgCAHXIwppS7qmrKONA
         1A54hXYCIAvPIRnnquCPBj8aZfVsojc74tm+RK9YHII3qnye0IS3iBksoz87dh/johWA
         1xXgDOTMxBSzhsAkbSDvJwSERzi0FUmGRZyAVH3la2Suw7b6XmkckOhWKVEc3D/MJeeo
         OFq12ux+gDoR2ZlAujY0r7gyeT8UM1pgQ4gcn6Ixy7zTp2zy9RlzzNNpVtuhORjVQCjx
         WdRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760467674; x=1761072474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QPOmoKy9wR88I2He99PlsgEdkB2xOEgVxLxZe9Nh3wU=;
        b=K0CmwO0xU5h3f9wmsgRSfbOUMJgDRlKwutamf2YYZoSAkQTfSS1idXVdGSax/l64/A
         jpmMp+nb7uefYOW9dvjKUki8KXpeW8dz4o4P4a0TLZQgdXmrD9InVenMO74Shvjnp1ai
         +MHtOGW/rvtPqsoFjOgt0RYcQMLiEG/lmU1ZcJeV5ux0ReVrlTXJUiqLssrc+veKV8/W
         GjMCMIqOh2GHaJaxoL+bLkzgMODhCCW7MTqy5CSJbknQm71GyJOSgW/MsAndj9om7DEL
         Iyx9le7warKdJtITN2luLn+56O/NFG8cOCv7WNOubr8fUSHtshEDSfLUu9nKJb4ySq7Q
         gFvA==
X-Forwarded-Encrypted: i=1; AJvYcCVw1wkT+HaxfxptaL3TjZX/I9Li4gXOUtBxNBleElTEaJUJV65tx/wRkUKrfIp5SuhDpMC18pTVDPb4T11FRe9hYOE2TQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz457Yt3r1hLqUqIehtNTEy+aWAY9oor7/ex2HSi6Jnm4aOMVGO
	mAy76vtO1JyV+ITTFwbGQI3RZgVtVjkMoC3VgqmAhPx2bE9FEqrwgBO4
X-Gm-Gg: ASbGnctLEa/fuA9w3kqzxWIorHRVddJ+64EojXArpOZvmDOBZtk/2SZghPBcdiPT3XT
	lU6KKewB+xYdn8pxPXsRx5cd1MRTldc9Ah+nkau1tDyoeMNeOpS3gh7vpAlMbo4rEk56LBxX07S
	0A4bys+Go47Nz0Hke6WZ8oRh4kqyTOOgqgtdJqxlOUCpbXxGrJSlFaBc9Pb42GEbWAnwz7LO0MX
	d5qhwjyG+T5QjwxE917zzoaKEAKxR4J8n1a+ZMHl/XJc/zckji6Y5cExlwGUumzU0CswDSbx1jI
	ACpQoLGBKSkZAX2arBrJyJigi3iu3OU89bVTRUkfZn3is0QXE8GLJxfGP0azgnU0G1bVc4BPjCd
	wdbenRDT2M7hJAQM/idiY3JEpyi7eX+mt/9gd6ullhWDxc2wfVk9+9Zz8UOxLyq08IPI6jQ==
X-Google-Smtp-Source: AGHT+IFEopthtCtStgyG+ij0kvK9buFqkz9ixbvsbeY4hA3xqXjl5owuM5LciKd/1gGbiE8hOUtHow==
X-Received: by 2002:a05:6a21:8312:b0:334:7bf4:ff3c with SMTP id adf61e73a8af0-3347bf50146mr1476712637.31.1760467674296;
        Tue, 14 Oct 2025 11:47:54 -0700 (PDT)
Received: from rakuram-MSI.. ([2405:201:d027:f04e:f00a:2e90:a424:4c03])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b678dcbf919sm12697212a12.9.2025.10.14.11.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 11:47:53 -0700 (PDT)
From: Rakuram Eswaran <rakuram.e96@gmail.com>
To: ulf.hansson@linaro.org
Cc: u.kleine-koenig@baylibre.com,
	chenhuacai@kernel.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	skhan@linuxfoundation.org,
	zhoubinbin@loongson.cn,
	rakuram.e96@gmail.com,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v2] mmc: pxamci: Simplify pxamci_probe() error handling using devm APIs
Date: Wed, 15 Oct 2025 00:16:57 +0530
Message-ID: <20251014184657.111144-1-rakuram.e96@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch refactors pxamci_probe() to use devm-managed resource
allocation (e.g. devm_dma_request_chan()) and dev_err_probe() for
improved readability and automatic cleanup on probe failure.

This eliminates redundant NULL assignments and manual release logic.

This issue was originally reported by Smatch:
drivers/mmc/host/pxamci.c:709 pxamci_probe() warn: passing zero to 'PTR_ERR'

The warning occurred because a pointer was set to NULL before using
PTR_ERR(), leading to PTR_ERR(0) and an incorrect 0 return value.
This refactor eliminates that condition while improving overall
error handling robustness.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202510041841.pRlunIfl-lkp@intel.com/
Fixes: 58c40f3faf742c ("mmc: pxamci: Use devm_mmc_alloc_host() helper")
Suggested-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
Signed-off-by: Rakuram Eswaran <rakuram.e96@gmail.com>
---

Changes since v1:
Following Uwe Kleine-König’s suggestion:
- Replaced dma_request_chan() with devm_dma_request_chan() to make DMA
  channel allocation devm-managed and avoid manual release paths.
- Used dev_err_probe() for improved error reporting and consistent
  probe failure handling.
- Removed redundant NULL assignments and obsolete goto-based cleanup logic.
- Updated commit message to better describe the intent of the change.

Testing note:
I do not have access to appropriate hardware for runtime testing. 
Any help verifying on actual hardware would be appreciated.

Build and Analysis:
This patch was compiled against the configuration file reported by
0day CI in the above link (config: s390-randconfig-r071-20251004) using
`s390x-linux-gnu-gcc (Ubuntu 14.2.0-19ubuntu2) 14.2.0`. 

Static analysis was performed with Smatch to ensure the reported warning 
no longer reproduces after applying this fix.

Command used for verification:
  ARCH=s390 CROSS_COMPILE=s390x-linux-gnu- \
  ~/project/smatch/smatch_scripts/kchecker ./drivers/mmc/host/pxamci.c

 drivers/mmc/host/pxamci.c | 57 +++++++++++++++------------------------
 1 file changed, 21 insertions(+), 36 deletions(-)

diff --git a/drivers/mmc/host/pxamci.c b/drivers/mmc/host/pxamci.c
index 26d03352af63..d03388f64934 100644
--- a/drivers/mmc/host/pxamci.c
+++ b/drivers/mmc/host/pxamci.c
@@ -652,11 +652,14 @@ static int pxamci_probe(struct platform_device *pdev)
 	host->clkrt = CLKRT_OFF;
 
 	host->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(host->clk)) {
-		host->clk = NULL;
-		return PTR_ERR(host->clk);
-	}
+	if (IS_ERR(host->clk))
+		return dev_err_probe(dev, PTR_ERR(host->clk),
+				     "Failed to acquire clock\n");
 
+	/*
+	 * Note that the return value of clk_get_rate() is only valid
+	 * if the clock is enabled.
+	 */
 	host->clkrate = clk_get_rate(host->clk);
 
 	/*
@@ -703,46 +706,36 @@ static int pxamci_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, mmc);
 
-	host->dma_chan_rx = dma_request_chan(dev, "rx");
-	if (IS_ERR(host->dma_chan_rx)) {
-		host->dma_chan_rx = NULL;
+	host->dma_chan_rx = devm_dma_request_chan(dev, "rx");
+	if (IS_ERR(host->dma_chan_rx))
 		return dev_err_probe(dev, PTR_ERR(host->dma_chan_rx),
 				     "unable to request rx dma channel\n");
-	}
 
-	host->dma_chan_tx = dma_request_chan(dev, "tx");
-	if (IS_ERR(host->dma_chan_tx)) {
-		dev_err(dev, "unable to request tx dma channel\n");
-		ret = PTR_ERR(host->dma_chan_tx);
-		host->dma_chan_tx = NULL;
-		goto out;
-	}
+	host->dma_chan_tx = devm_dma_request_chan(dev, "tx");
+	if (IS_ERR(host->dma_chan_tx))
+		return dev_err_probe(dev, PTR_ERR(host->dma_chan_tx),
+				     "unable to request tx dma channel\n");
 
 	if (host->pdata) {
 		host->detect_delay_ms = host->pdata->detect_delay_ms;
 
 		host->power = devm_gpiod_get_optional(dev, "power", GPIOD_OUT_LOW);
-		if (IS_ERR(host->power)) {
-			ret = PTR_ERR(host->power);
-			dev_err(dev, "Failed requesting gpio_power\n");
-			goto out;
-		}
+		if (IS_ERR(host->power))
+			return dev_err_probe(dev, PTR_ERR(host->power),
+						"Failed requesting gpio_power\n");
 
 		/* FIXME: should we pass detection delay to debounce? */
 		ret = mmc_gpiod_request_cd(mmc, "cd", 0, false, 0);
-		if (ret && ret != -ENOENT) {
-			dev_err(dev, "Failed requesting gpio_cd\n");
-			goto out;
-		}
+		if (ret && ret != -ENOENT)
+			return dev_err_probe(dev, ret, "Failed requesting gpio_cd\n");
 
 		if (!host->pdata->gpio_card_ro_invert)
 			mmc->caps2 |= MMC_CAP2_RO_ACTIVE_HIGH;
 
 		ret = mmc_gpiod_request_ro(mmc, "wp", 0, 0);
-		if (ret && ret != -ENOENT) {
-			dev_err(dev, "Failed requesting gpio_ro\n");
-			goto out;
-		}
+		if (ret && ret != -ENOENT)
+			return dev_err_probe(dev, ret, "Failed requesting gpio_ro\n");
+
 		if (!ret)
 			host->use_ro_gpio = true;
 
@@ -759,16 +752,8 @@ static int pxamci_probe(struct platform_device *pdev)
 	if (ret) {
 		if (host->pdata && host->pdata->exit)
 			host->pdata->exit(dev, mmc);
-		goto out;
 	}
 
-	return 0;
-
-out:
-	if (host->dma_chan_rx)
-		dma_release_channel(host->dma_chan_rx);
-	if (host->dma_chan_tx)
-		dma_release_channel(host->dma_chan_tx);
 	return ret;
 }
 
-- 
2.48.1

