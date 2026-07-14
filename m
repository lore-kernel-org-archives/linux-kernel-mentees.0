Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E048D3DB636
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 14 Jul 2026 19:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784057069; cv=none; b=MXX0+LFKf8oEZvYr9F6M5H5P81dfhmQfqvgCtu/zqPS/Sc8Q+56SF//Dz3aMomgA/kQPH3aGSYdgGixXzbc8bE/uCSw7cFX771Ujx+bMZ+PExvrxz8zUifS7sLgx5ak0YsmXbRm3sabRZezWX/OSr2p0kN/ypZJjd46NOmOrPTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784057069; c=relaxed/simple;
	bh=LS5H5BIMkkbis3RT2WUSmYP2ZWYwer8rWqk98FrAJ44=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fjvg7CgEdgiWMEChNsEZ6BL5E+s/R9Xb1LC3j4/OrvJyinpqeGgSiRfse3QbxYqZIvapHW9TXz1UC5jbwL0hWBwkn6S5mOfRCz/MPyA/yQjM7pD37oOI4PPFu8Ga0N5nD6wpo35SsX9kissxafn1Ec3ZJsh0iS5Rq+E/GXpzIes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PUVYn2r3; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PUVYn2r3"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cc6dd436c6so15995235ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 14 Jul 2026 12:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784057067; x=1784661867; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jMDExVgbOXk0VFPubyBaAIODXmgYxAMyHC4myKb7xfk=;
        b=PUVYn2r3dUlJ8dIHFS3XTSvKnfPkjgaGbOGRIP6Vi8LixPOY0m7cSzebJUM7CHxZCh
         5gEobENuVFhV+DbWbUstaFEbbbf2q54aBxuRiEP2ozlety4YCHiOalNtw++CI/zqCqQc
         2ET4QWwt5YatgmsoWotgl6Bzn1/vvmN8XUfy+XqaCV3VeVuWpuE0+L3YkItRRVbnBQ+u
         RcEUOc4sa9Xo6XiiPSfo+AmfKt8tdb1xgzbOp2uJBFykAXGT7Ol1vxCa9mFsp/KTZC36
         V60W2RFlDeLVWnd3+pFY+t/b5M+F4qeElulBYQ7IElqYwGo5tATCAy1R57WRET65fKDS
         OwVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784057067; x=1784661867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jMDExVgbOXk0VFPubyBaAIODXmgYxAMyHC4myKb7xfk=;
        b=fCuY0UMLGyhmXNDk3uPYcXCh776KFHwgWcYAdvzxdutABrCPZDX93XAsfCcTfjPFxi
         0N8/vTHmGFWOZbGV9toyBUk4HWxHIbaXCWG9iumwyHvMomjWWGVSTlN8jXhXtxknBIEH
         T3lfxyNkd1zFuCe4MEq3rK+iPJ+giP+jSpNoZNfb7hngDjhW8+KwrS9I+hhSHsKPFjVA
         GowYIiiddF00OZTaODyrNTPVSot3m6AlO/vIv5d8pNw8vKYaQxnWUwgqFhjITmNz+FOz
         L0KtuMDy5xcaTu41RN3izcCxQfN9aS2csEmy/ItpSMcvU+E0m2WrjaHev+IjhZUJpQ25
         HCFA==
X-Forwarded-Encrypted: i=1; AHgh+RqL/uehyJWb1N3TuioXP++zuX4C2NTYxmF2hwxA95M/bpQlFOHZxNICMBFqkbNlg+XX1K748bD8oUNROQ/FoKXhr0A3RA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+t6VRGGa3hpnzSW9xoE0yLrqzvkvnGT1BgElIFyF91n8yIdBy
	R5H2FyElOJ6BMj/a+pt1clpKm3gKjlYpEFTrxNFufH1LfAogwRi8l+Hp
X-Gm-Gg: AfdE7cmXAYY4yboBK33YkCGo16xPok/j6BbeiZi6WcKAg48u1GJ6fX60a3m0D/drIlZ
	Dv/4QYe+U+2ELnXqQf4BDeR29kIMVxQEOBLf15R8DCyPE0RLBnwE0DN2PRxQUKoJmmkcTyy81PE
	JLlq6J/fCQpx+5YHsOT1hUFE5tfrhSsMq4deKR46Fl+ZDYUG4y94eVQY8CVOookrDPmwdQtf8pp
	UVtfj/GyDwwvJR33PhoG9lenTU+I0FCuaP8L8EI23uDC//9ecwm9mPi1xBppH8IdkbFYqp8EXsg
	FtpYZoQUuNSluk5iqtc2JN/3LLT39m/IQ/RwRbciYhv0KyhUpnAm9+Sav7THSBZFWYOOan8YZCV
	K7k4Fgysl509hzSECPTv7prq2VVYP0hPRCKwVv1ioDw6kFihAR8ZJrIOsOCzOSoApB4RwhUt8rC
	c9WW/N4zWUgduDqmuvxeYQCMHRtVJXXj+C9JLb1CsZn6Bu57WSIu6ZO/sGY5hoZ1vcMpV9vEq9O
	2UfS33RADOX9whOR3oRhaK6iRnt
X-Received: by 2002:a05:6a20:9150:b0:3aa:c93b:6266 with SMTP id adf61e73a8af0-3c11060a51bmr16770901637.19.1784057066941;
        Tue, 14 Jul 2026 12:24:26 -0700 (PDT)
Received: from fedora ([202.179.95.46])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b8fc7c088sm31983224c88.2.2026.07.14.12.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:24:26 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: claudiu.beznea@tuxon.dev,
	andrei.simion@microchip.com,
	lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	Ninad Naik <ninadnaik07@gmail.com>
Subject: [PATCH] regulator: mcp16502: Convert to dev_err_probe() in mcp16502_probe()
Date: Wed, 15 Jul 2026 00:52:28 +0530
Message-ID: <20260714192228.1639768-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mcp16502_probe() currently uses dev_err() for logging errors.
However, functions like devm_regmap_init_i2c, devm_gpiod_get_optional
and devm_regulator_register can return -EPROBE_DEFER. Using dev_err()
in these situations can cause unnecessary error spam in dmesg.
As a result, convert to dev_err_probe(). It also simplifies the print
and return operations into single statement. The 'ret' variable is no
longer required and has been removed.
Originally detected by Coccinelle with this warning "Consider using
%pe to print PTR_ERR()"
Compile-tested only.

Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
---
 drivers/regulator/mcp16502.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/regulator/mcp16502.c b/drivers/regulator/mcp16502.c
index b34ae0bbba6f..fea0f6a2f21b 100644
--- a/drivers/regulator/mcp16502.c
+++ b/drivers/regulator/mcp16502.c
@@ -508,7 +508,7 @@ static int mcp16502_probe(struct i2c_client *client)
 	struct device *dev;
 	struct mcp16502 *mcp;
 	struct regmap *rmap;
-	int i, ret;
+	int i;
 
 	dev = &client->dev;
 	config.dev = dev;
@@ -518,30 +518,23 @@ static int mcp16502_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	rmap = devm_regmap_init_i2c(client, &mcp16502_regmap_config);
-	if (IS_ERR(rmap)) {
-		ret = PTR_ERR(rmap);
-		dev_err(dev, "regmap init failed: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(rmap))
+		return dev_err_probe(dev, PTR_ERR(rmap), "regmap init failed\n");
 
 	i2c_set_clientdata(client, mcp);
 	config.regmap = rmap;
 	config.driver_data = mcp;
 
 	mcp->lpm = devm_gpiod_get_optional(dev, "lpm", GPIOD_OUT_LOW);
-	if (IS_ERR(mcp->lpm)) {
-		dev_err(dev, "failed to get lpm pin: %ld\n", PTR_ERR(mcp->lpm));
-		return PTR_ERR(mcp->lpm);
-	}
+	if (IS_ERR(mcp->lpm))
+		return dev_err_probe(dev, PTR_ERR(mcp->lpm), "failed to get lpm pin\n");
 
 	for (i = 0; i < NUM_REGULATORS; i++) {
 		rdev = devm_regulator_register(dev, &mcp16502_desc[i], &config);
-		if (IS_ERR(rdev)) {
-			dev_err(dev,
-				"failed to register %s regulator %ld\n",
-				mcp16502_desc[i].name, PTR_ERR(rdev));
-			return PTR_ERR(rdev);
-		}
+		if (IS_ERR(rdev))
+			return dev_err_probe(dev, PTR_ERR(rdev),
+					     "failed to register %s regulator\n",
+					     mcp16502_desc[i].name);
 	}
 
 	mcp16502_gpio_set_mode(mcp, MCP16502_OPMODE_ACTIVE);
-- 
2.55.0

