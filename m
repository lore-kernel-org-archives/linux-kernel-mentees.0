Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC46221A420
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  4 Oct 2025 01:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759543016; cv=none; b=Kw2VnYQfv38+irhYCdBFngXH6NVrqJyUDvNqNSq/G306/cIik8hJp35uDK7/J8zUqNNsueykciVYCsHuPQR7Jq/AVLwJVlBzvP53h9fMlAmLLC4hCDB92e3DANEo/V92EMeGK3NjtN7v67x5QLlqVwBsYUhKYaMPLlibnia7Qe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759543016; c=relaxed/simple;
	bh=60sFE8dH95IQRhjstRyY7EVNnqU2lIgts0o7HyQejn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Quh2wSVr/eL9y7sunibk9WuvSCiRvYFDGf/5X9RWOl2GfxcuJJC762Cm3NgOF5qFUh8CnrKG8GxqeeDUdJ0cI3+x3Tlim68w9ZHmJ9jmao2rgwkkAjEokHMaLYKIg+A7rIkQvZpEriXKN57vUAuyQT/Os2kyHvQ9s3DIi12sOpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CTifxzwq; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTifxzwq"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so2822943b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 03 Oct 2025 18:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759543014; x=1760147814; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bXs1QSVIqrmDB/CsKZ6PEf+V8gETdC9cB2i9VQlHTvA=;
        b=CTifxzwqBErv5KN8mngRCQjpqy3/+IjNgnEA3gmdWnPOwqIWCLC9lTkED8cNfisZ9i
         FyuIX2L8uaJc+qdV6YTgwuBPIwOp+NxNfQb2YSD5cIiGSShlMk5dUKvL9+C3nGmUwdS4
         UgiNH1O+OfgFw4I4hhSXZCROdMqZGL7llVnrUi+KMWkDT87NduTZ7cvL5hz5vmOzTqLq
         X/Y/B4k1iE1BdrpiW5bKYtQrwyea3nVDpkpA7O0ENS9UL6Tx9xI3pveNVsOmJI4vLfe3
         cA2AYT0/+BrKPOGPhvrU48gH3Kpl4iPUimGUVBTzSx8IuO7j21ZItVw7jahkspznXbE3
         Ao7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759543014; x=1760147814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bXs1QSVIqrmDB/CsKZ6PEf+V8gETdC9cB2i9VQlHTvA=;
        b=Z9jrwJxP3qTZlOzNbKl0r25EJbGXxW37TFpRYuXbSSDDoCLhks7ybYAo3olYoy231a
         /Arng+5tQMDnDFrD84La+zebQf25JDEyIhNnh59yxYUhUBtDL5mYQ6MzVeCzEXbIgn7S
         ouaLzWikZuyGoXSgXTEL7ATch4JmY/30e26vLZHF1Wk9zC6eMF5dZlCj5trfU1AWxPlJ
         8gjw4uHBUJDYS+8eq/MGAJR7E8NyIGUbpPqt9QlU6tuneo1ZDrrbW4l5EE6v4foC8yiQ
         azC7LqshiTltJPmbRaqZCsPWqJy6uDw48Set+ve2EJaToj/wzivTYIQh/bqB9KZgxJuU
         jWHw==
X-Forwarded-Encrypted: i=1; AJvYcCVNB+xQ4LbcwXAnGCEOAB1rmEJi/PoCBUaflP7+bUdmMKk01AjVlLjhIRXJ5XgoxTrlEWsQTmNfdkCRDq7+sRKrvfy8lQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzKvjHERL673cNACIAnhHTq7G9Hm8fl9pu25BsU3FUdRa+20hIu
	Xv3wQfHP8XGbJTZYH2NDmJp9ZE6MeW0r75ku28crqcoh8lV/zRmJlRg5
X-Gm-Gg: ASbGnctQF5bmyeBfX/v28FFxr5E9oMKdPBVX8byf8wHXjixbHMolJclrXruCFaINZdE
	UDiiWev6MfqWha23LVvTrj/dNXsV+NiG1trspPMkdyiUwSXZ6l3s9yb0pl9Md0hzxZ8EsGTrphI
	UeNHV/gtBIdR1fkCMgJGrDJ87iYZJOc3OmHQoFeQfO8ddD+r07vJSs2cwXhmanD4zcy9ZMoG5Hx
	BQZS9toaA1mwxYMaslBdTvD6otsntlzLmB/Gws4NOXbNL+vxEaQ/zgLyD2u+NDIcu7y/Dd8JoWB
	RBcL2Qe6LQc0ex8dhos9s6jYLAwNiIWRCd/Jd1DlqV1TyJuNhbpmTDuPkpmJaf/ECfAfiucDWZF
	ozqItOCURFRdkev6JLfo09x9A64MJJ2RPXb28u9Ad/lqJHyGulEFChao=
X-Google-Smtp-Source: AGHT+IFkvcg76qipc69NuQnIWNLwlZfZsq2gWo9bV8jdBE0nvip+ixi0boun0gdtaOb85HXiysRS2w==
X-Received: by 2002:a17:903:40d1:b0:27e:f16f:618b with SMTP id d9443c01a7336-28e9a55c07fmr62108745ad.24.1759543014242;
        Fri, 03 Oct 2025 18:56:54 -0700 (PDT)
Received: from Ubuntu24.. ([157.33.197.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d134859sm63197485ad.57.2025.10.03.18.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 18:56:53 -0700 (PDT)
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
Subject: [PATCH 2/2] iio: health: max30100: Add pulse-width configuration via DT
Date: Sat,  4 Oct 2025 07:26:23 +0530
Message-ID: <20251004015623.7019-3-raskar.shree97@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251004015623.7019-1-raskar.shree97@gmail.com>
References: <20251004015623.7019-1-raskar.shree97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MAX30100 driver previously hardcoded the SPO2 pulse width to
1600us. This patch adds support for reading the pulse width from
device tree (`maxim,pulse-width`) and programming it into the SPO2
configuration register.

If no property is provided, the driver falls back to 1600us to
preserve existing behavior.

Testing:
Hardware: Raspberry Pi 3B + MAX30100 breakout
Verified DT property read in probe()
Confirmed SPO2_CONFIG register written correctly using regmap_read()

Signed-off-by: Shrikant Raskar <raskar.shree97@gmail.com>
---
 drivers/iio/health/max30100.c | 39 +++++++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/health/max30100.c b/drivers/iio/health/max30100.c
index 814f521e47ae..2b3348c75beb 100644
--- a/drivers/iio/health/max30100.c
+++ b/drivers/iio/health/max30100.c
@@ -5,7 +5,6 @@
  * Copyright (C) 2015, 2018
  * Author: Matt Ranostay <matt.ranostay@konsulko.com>
  *
- * TODO: enable pulse length controls via device tree properties
  */
 
 #include <linux/module.h>
@@ -54,6 +53,9 @@
 #define MAX30100_REG_SPO2_CONFIG		0x07
 #define MAX30100_REG_SPO2_CONFIG_100HZ		BIT(2)
 #define MAX30100_REG_SPO2_CONFIG_HI_RES_EN	BIT(6)
+#define MAX30100_REG_SPO2_CONFIG_200US		0x0
+#define MAX30100_REG_SPO2_CONFIG_400US		0x1
+#define MAX30100_REG_SPO2_CONFIG_800US		0x2
 #define MAX30100_REG_SPO2_CONFIG_1600US		0x3
 
 #define MAX30100_REG_LED_CONFIG			0x09
@@ -306,19 +308,52 @@ static int max30100_led_init(struct max30100_data *data)
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
+	unsigned int pulse_us;
+	unsigned int pulse_width;
+	struct device *dev = &data->client->dev;
 
 	/* setup LED current settings */
 	ret = max30100_led_init(data);
 	if (ret)
 		return ret;
 
+	/* Get pulse width from DT, default = 1600us */
+	ret = device_property_read_u32(dev, "maxim,pulse-width", &pulse_us);
+	if (ret) {
+		dev_warn(dev, "no pulse-width defined, defaulting to 1600us\n");
+		pulse_width = MAX30100_REG_SPO2_CONFIG_1600US;
+	} else {
+		pulse_width = max30100_get_pulse_width(pulse_us);
+		if (pulse_width < 0) {
+			dev_err(dev, "invalid pulse-width %u\n", pulse_us);
+			return pulse_width;
+		}
+	}
+
 	/* enable hi-res SPO2 readings at 100Hz */
 	ret = regmap_write(data->regmap, MAX30100_REG_SPO2_CONFIG,
 				 MAX30100_REG_SPO2_CONFIG_HI_RES_EN |
-				 MAX30100_REG_SPO2_CONFIG_100HZ);
+				 MAX30100_REG_SPO2_CONFIG_100HZ |
+				 pulse_width);
 	if (ret)
 		return ret;
 
-- 
2.43.0

