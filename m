Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7712E7BDC
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  7 Oct 2025 16:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759854150; cv=none; b=G3nAxw0Kg2QqTbtRSdeUDBn18wHqPUogNF7s4FD3yVrZg9gcuAtbwNfxcFDWGQrQ0UJR9ubOg2L8kuF6Z49LjyY5AvB/9t+eR7cNQr8ufBcBDzY7r2f4YrcifSP9abiVm2ZS2UyxJ348TaoQIFoK0wtQ6PAFoLgIQcIVCu1G47s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759854150; c=relaxed/simple;
	bh=jNPXFguZ0o33eieY8lz73vZNTUwXVK/ZZse4W5W/FWs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tde95MDl3Uyvir0+dH303LbS6mC36BeKxysv0JMk/42nOkKqZYZznIOgNDcHEJYWh2GZc2vnBrIXpLNZ+5K4RvFpq4TN4RtYd3KM0mxOIkL/Jg2aWF9bdRfzDwauttPwWH+kBdikFJ+JBLubGd7X4qOdvG7Fq2F5vVVLQX3lG2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QtXDljL8; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QtXDljL8"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-33255011eafso6653022a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 07 Oct 2025 09:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759854148; x=1760458948; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PpoHs7x3DMAGLg3gdog2cHx5D9ViCBx9xQddbSTGLHY=;
        b=QtXDljL8cg5wULJaYz9AGWAPwurH2slEEUXixo2Z1ZLegInoOskNfe5l0kTVUE6iYB
         tbh0nZdhelT39PlsqQ02zb6SiqeJkf9vMdqzb/1Q7DTg2MZ2r0orN8Js0FlChL23jxqB
         qy3DAV1aG8Daq6wBm17KB/OZPJEfNhwejk53Joe2Szbc8SVtHq5UwuFX8sFHcfd46fEh
         Z7Vhv16z4KoXZK+765NofzLV+mBgSXW9sSZAZFfWqo9wQFAUf2AfwFJ8yE9j4MqCHj8C
         1omCbj7KETHpmw/xo/MPac2DgOEe2eRqM+YdExV7aq04n6rdpVdGSN1zfla6tFGTwA2W
         mi0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759854148; x=1760458948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PpoHs7x3DMAGLg3gdog2cHx5D9ViCBx9xQddbSTGLHY=;
        b=fssrqVf5jHubF1rV0kJV/jUL1PcIZzTeNDhpv5tZWwO5ugfb9tDQIbQjMDdct7hy7g
         F3w6m62eNdkrcPCtQKV0ieucR0F492YfENsb/8tloaxKRxRoVvwyXgRyWaS8vxWhdjNh
         qQhhUHZ1HRBIQ6keZK+m5Ovre/tE6+t+aE+nUofKfAxdVv9Pkgdx8C/5w/qVXxfR5PGe
         iU+OYUfmJyeP/zG6eKZHNaRuTKljwFrWSevRCzddoMQxpVMOh2kmvfvuPJ2o5h/AsKGo
         h4cY3ZfzqOgtMh8ed7FpY1N5Ugjn9Rwavrrz4zKF/Li74jUpzqfcCR8qGplQBbKgHZH1
         NhCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDrOONUgcRB5vceYSqZHdjl17S4qBVs5OEkHH16JjIieu5NXaO9sLW8z7Ug79BjwpaM3ONi+DbZeCg5OHHIbnuqLhXfw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxx40c+tCiAbXvvZmovtYsMTwTgEuv3DtHzjl4u0SjKqrY5TvoV
	8mTu5Y1LEGW8Xww9y8h+X177+bpzk90+4B3agp3JxyMttcAxWrlbuoo9
X-Gm-Gg: ASbGncttF02vNm2Bx4m+TC89Oikh5VJK1PM5DmKL9G5dZ2tIQsfw+FQtjBJrtmU2zKs
	5Rd2uO5tDt8ho2yS0Wo5R1B2tHms8UbaCuersjEx43CHJfOAkeURNOg+h+tfPcj59vWnwVl/4Sb
	hgKBEESdcDOLXwHsvQfybNz9k0eeQvfVW/Jeb6jzHlj9IGl1m4WE2zHOe07oUdIIpu9FT0ZU9uw
	OF6mRozuDSJBleXTHtf01vWcVsM+KzbPR5I4MCrUR5UC02yf1yX/1LHNWiNarrg+OjDN3KyjqMv
	LJfrAtSjrQVtZVOXzMA9ph5u/zdANRv+xKCoJXRpoGz074rF8kt9rpLMA9FJ+WKQ2t06U1Wpu4Y
	RWi8WRNi1QPkTz4WyEYA/E/l5Qar4cPSQDzDYVLshDDvBVUOI1+nZc8Wod6o0XlU=
X-Google-Smtp-Source: AGHT+IEVmC+M/InRT3VdaLJRW/KctK/jw/7e7suEc5r/fdcvZSXq5B54eCtA1zk17y2IKaq6ovlUJw==
X-Received: by 2002:a17:90b:1e0c:b0:32e:87fa:d975 with SMTP id 98e67ed59e1d1-33b513ebbedmr59703a91.34.1759854147989;
        Tue, 07 Oct 2025 09:22:27 -0700 (PDT)
Received: from rakuram-MSI.. ([2405:201:d027:f04e:d2f9:a2da:e7d:3e96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339ee0f830fsm1431733a91.5.2025.10.07.09.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 09:22:27 -0700 (PDT)
From: Rakuram Eswaran <rakuram.e96@gmail.com>
To: ulf.hansson@linaro.org
Cc: zhoubinbin@loongson.cn,
	u.kleine-koenig@baylibre.com,
	chenhuacai@kernel.org,
	david.hunter.linux@gmail.com,
	skhan@linuxfoundation.org,
	khalid@kernel.org,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rakuram.e96@gmail.com,
	linux-kernel-mentees@lists.linux.dev,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH] mmc: pxamci: Fix passing NULL to PTR_ERR() in pxamci_probe()
Date: Tue,  7 Oct 2025 21:47:44 +0530
Message-ID: <20251007161948.12442-1-rakuram.e96@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Smatch reported:
drivers/mmc/host/pxamci.c:709 pxamci_probe() warn: passing zero to 'PTR_ERR'

Case 1:
When dma_request_chan() fails, host->dma_chan_rx is an ERR_PTR(),
but it is reset to NULL before using PTR_ERR(), resulting in PTR_ERR(0).
This mistakenly returns 0 instead of the real error code.

Case 2:
When devm_clk_get() fails, host->clk is an ERR_PTR() resulting in the similar
issue like case 1. 

Store the error code before nullifying the pointers in both the cases.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202510041841.pRlunIfl-lkp@intel.com/
Fixes: 58c40f3faf742c ("mmc: pxamci: Use devm_mmc_alloc_host() helper")
Signed-off-by: Rakuram Eswaran <rakuram.e96@gmail.com>
---

Build and Analysis:
This patch was compiled against the configuration file reported by
0day CI in the above link (config: s390-randconfig-r071-20251004) using
`s390x-linux-gnu-gcc (Ubuntu 14.2.0-19ubuntu2) 14.2.0`. 

Static analysis was performed with Smatch to ensure the reported warning 
no longer reproduces after applying this fix.

Command used for verification:
  ARCH=s390 CROSS_COMPILE=s390x-linux-gnu- \
  ~/project/smatch/smatch_scripts/kchecker ./drivers/mmc/host/pxamci.c

 drivers/mmc/host/pxamci.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/pxamci.c b/drivers/mmc/host/pxamci.c
index 26d03352af63..4fab693d3b32 100644
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
@@ -705,8 +706,9 @@ static int pxamci_probe(struct platform_device *pdev)
 
 	host->dma_chan_rx = dma_request_chan(dev, "rx");
 	if (IS_ERR(host->dma_chan_rx)) {
+		ret = PTR_ERR(host->dma_chan_rx);
 		host->dma_chan_rx = NULL;
-		return dev_err_probe(dev, PTR_ERR(host->dma_chan_rx),
+		return dev_err_probe(dev, ret,
 				     "unable to request rx dma channel\n");
 	}
 
-- 
2.48.1

