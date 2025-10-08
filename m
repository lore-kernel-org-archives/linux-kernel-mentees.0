Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D8729E0E9
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  8 Oct 2025 03:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759893512; cv=none; b=JZEN2q7wNB4GuM74jkikYhnjnSOYvNSY7CNhGerEzI+RlyI5eq3xTNCqsGx3cFgMQTpyA9v4EP5v6T8vp0EtXGIqXVEFRwIYwmZBMqta+zZh3ORfAr90DxwUWiZOlGs0eSRClWVdeL6+yZuj/+hUZIlH922F/sWAQmGUavbKupU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759893512; c=relaxed/simple;
	bh=OjsnqX4w9xVPWhGo4KZ1oMWtoIY/AxwyxdfC9ODPA0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JwFndi7u5SiZfApFV/5ti4JSo4M0nd7RLews35QRYvZeVHGx3820tRkRdiseRaJZb2tjpc+EsUo3bOZlv+wzHJn27pRTzb9UFs/Ecd82uTxH4PQUw35MfWGlw/IV/5UALbCOVbSOuIs63X7lFsZoQcsF+t+Dnn3zRjcgxee/Dao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I9YkKUgG; arc=none smtp.client-ip=209.85.216.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I9YkKUgG"
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-33226dc4fc9so7066078a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 07 Oct 2025 20:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759893510; x=1760498310; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lDg4ZaE0kQk1RB2KpwuXVcFNrMgNFMWXQ87bNU/VPH0=;
        b=I9YkKUgGywQDYplyZSku4xtcbRfdODw0TD11C/yDD+2o/RCB+tRqSt3JDvxluiim1F
         Kaj7HLXaJ7EkPOFC+wMUZs2PABFyrp7xXWrZkI7PNH55IDlr0+GLKt1BH1I7Eq2i+aNm
         PeMZbiy5RcoQ8NEkJgBAd9mVBv3L0bKDxap65B1vx3uKSg2zNcaQ3NvD0tUCMltnwwnO
         tjvX4obfaB7mYNKK23I7ID76zWgqUpkS4Jp9P2FUnQM9xGq/y4m5nR73Eh0GarXKOXjI
         DrXOnGB4iYUpDulU798S1vfBo/ZVl3SeK1OH1cFgle6nng0sja+tSNWcmxckQNhcjoyN
         1iTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759893510; x=1760498310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lDg4ZaE0kQk1RB2KpwuXVcFNrMgNFMWXQ87bNU/VPH0=;
        b=t62pix2s3L0QCetaQ4IrgLebAhFYyjsldRPwFNPNIs/zyv6uy7+IqROMld1Z+dsYNq
         iKRhzkz1tOkd09hn5xtW/wn+zaUhLF97BFRk9fn1i5d8UWW2H2oB3Kba4x5lTiFp5dFk
         fgOJALMSseVJlnNKbLOdT41yJk8nkqj8QMibE42AR/oLUmItxxMW38tH/IdPq0/04n7H
         cdbGBGFeUi1GGDHiw9yiZn29Yyfxfc8bA28drBObjPTHW8AVN1oCiaoQiIRa8TBiBXIt
         ClPELKMMto5FH8WTazdgfsu6M+htY7RaXYEvgbKVQHiC5ABdUMT/ElHdCX/lPpM9lDJy
         0AIg==
X-Forwarded-Encrypted: i=1; AJvYcCWbVDJF3zIBM+LstJoZmpohe/pxBwTlDybWi4DoksLmQxZXaL4kesNf5rdk7ZEN0TlJOQPtA9bfQeiZtofFmLOHQYJfoA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxSgZz2xTf2mJAxeGYCH0n2ksc/lygP6S2kpGoQxSbr7Lf2uP1S
	vIh8hyp1vVF61BlPEAOgQdkhxeQXmh9LPPiOoyQE6LnaYdcbNTvkJGyY
X-Gm-Gg: ASbGnctdRelUSUOx4PLI3pJr8LzKbPv17rZVxiP5g9qdvVZR6/G/7x6Sa/KDarNZEWT
	PZ2p7KlTo+rv1RptG2LfbbLy6E9lW9AniAjwrA8/F/3aXSpKhzbd24oHPFksLml+lFhd5GchQkD
	e8cg0gGTZ4LwZknBakwH5YGJhYQxtUJ8R+HZr1kjBr1yUJDYRP+U+FeSlh+u2k+p+tkingx+0+i
	xxcbvOnwSdZg9Ggv1zwZxhGI5X0PkZiAKhE8wrz7WXQkYEmRTD3q8bI5T0ytHby92NINGCzSPAb
	5xiQji/m3cHc2LtJq2wgHZBXI3BeiJo5f5R6MBiV4srXepgHFxcgy4xGEzeBXPOGspGSFDlqyVw
	dSGpGYFHvTgkBa5UOD7+tkgBGCkEUOvd3Q/6wIPJrDe03HXyQQg==
X-Google-Smtp-Source: AGHT+IG1UQCmaY8cs78qKrEmsXcpdVVL9Yje3K7pg4Yhi80RChazLD8kGiz5Ppw9B7HegArhgX/3FA==
X-Received: by 2002:a17:90b:3911:b0:338:2ef8:14af with SMTP id 98e67ed59e1d1-33b513bee03mr2184017a91.37.1759893509584;
        Tue, 07 Oct 2025 20:18:29 -0700 (PDT)
Received: from Ubuntu24.. ([103.187.64.31])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099f5990csm16527746a12.38.2025.10.07.20.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 20:18:29 -0700 (PDT)
From: Shrikant Raskar <raskar.shree97@gmail.com>
To: jic23@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	matt@ranostay.sg,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Shrikant Raskar <raskar.shree97@gmail.com>
Subject: [PATCH v2 2/2] iio: health: max30100: Add pulse-width configuration via DT
Date: Wed,  8 Oct 2025 08:47:37 +0530
Message-ID: <20251008031737.7321-3-raskar.shree97@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251008031737.7321-1-raskar.shree97@gmail.com>
References: <20251008031737.7321-1-raskar.shree97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MAX30100 driver previously hardcoded the SPO2 pulse width to
1600us. This patch adds support for reading the pulse width from
device tree (`maxim,pulse-width-us`) and programming it into the SPO2
configuration register.

If no property is provided, the driver falls back to 1600us to
preserve existing behavior.

Testing:
Hardware: Raspberry Pi 3B + MAX30100 breakout
Verified DT property read in probe()
Confirmed SPO2_CONFIG register written correctly using regmap_read()

Signed-off-by: Shrikant Raskar <raskar.shree97@gmail.com>

Changes since v1:
Use FIELD_PREP() and define a pulse width bit mask.
Initialize default pulse_us before property read.
Use dev_err_probe() for error reporting.
Make pulse_width signed to handle negative return values.

Link to v1:
https://lore.kernel.org/all/20251004015623.7019-3-raskar.shree97@gmail.com/
---
 drivers/iio/health/max30100.c | 35 +++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/health/max30100.c b/drivers/iio/health/max30100.c
index 814f521e47ae..50cd4fd13849 100644
--- a/drivers/iio/health/max30100.c
+++ b/drivers/iio/health/max30100.c
@@ -5,7 +5,6 @@
  * Copyright (C) 2015, 2018
  * Author: Matt Ranostay <matt.ranostay@konsulko.com>
  *
- * TODO: enable pulse length controls via device tree properties
  */
 
 #include <linux/module.h>
@@ -54,6 +53,10 @@
 #define MAX30100_REG_SPO2_CONFIG		0x07
 #define MAX30100_REG_SPO2_CONFIG_100HZ		BIT(2)
 #define MAX30100_REG_SPO2_CONFIG_HI_RES_EN	BIT(6)
+#define MAX30100_REG_SPO2_CONFIG_PW_MASK	GENMASK(1, 0)
+#define MAX30100_REG_SPO2_CONFIG_200US		0x0
+#define MAX30100_REG_SPO2_CONFIG_400US		0x1
+#define MAX30100_REG_SPO2_CONFIG_800US		0x2
 #define MAX30100_REG_SPO2_CONFIG_1600US		0x3
 
 #define MAX30100_REG_LED_CONFIG			0x09
@@ -306,19 +309,47 @@ static int max30100_led_init(struct max30100_data *data)
 		MAX30100_REG_LED_CONFIG_LED_MASK, reg);
 }
 
+static int max30100_get_pulse_width(unsigned int pwidth_us)
+{
+	switch (pwidth_us) {
+	case 200:
+		return MAX30100_REG_SPO2_CONFIG_200US;
+	case 400:
+		return MAX30100_REG_SPO2_CONFIG_400US;
+	case 800:
+		return MAX30100_REG_SPO2_CONFIG_800US;
+	case 1600:
+		return MAX30100_REG_SPO2_CONFIG_1600US;
+	default:
+		return -EINVAL;
+	}
+}
+
 static int max30100_chip_init(struct max30100_data *data)
 {
 	int ret;
+	int pulse_width;
+	/* set default pulse-width-us to 1600us */
+	unsigned int pulse_us = 1600;
+	struct device *dev = &data->client->dev;
 
 	/* setup LED current settings */
 	ret = max30100_led_init(data);
 	if (ret)
 		return ret;
 
+	/* Read pulse-width-us from DT */
+	device_property_read_u32(dev, "maxim,pulse-width-us", &pulse_us);
+
+	pulse_width = max30100_get_pulse_width(pulse_us);
+	if (pulse_width < 0)
+		return dev_err_probe(dev, pulse_width, "invalid pulse-width %uus\n", pulse_us);
+
 	/* enable hi-res SPO2 readings at 100Hz */
 	ret = regmap_write(data->regmap, MAX30100_REG_SPO2_CONFIG,
 				 MAX30100_REG_SPO2_CONFIG_HI_RES_EN |
-				 MAX30100_REG_SPO2_CONFIG_100HZ);
+				 MAX30100_REG_SPO2_CONFIG_100HZ |
+				 FIELD_PREP(MAX30100_REG_SPO2_CONFIG_PW_MASK, pulse_width));
 	if (ret)
 		return ret;
 
-- 
2.43.0

