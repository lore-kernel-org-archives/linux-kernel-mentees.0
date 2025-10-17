Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1299329C48
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 17 Oct 2025 10:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760698709; cv=none; b=Kl6p8zFHUEdxN8e11TZ4Armiz9UfJsbhyiiTH70vdjzlPZvNFW7YvDPq73M65WVqnLeoRBrxZwWtfXSA39rOFgBGsYedwR6Aw8cEkrqDPmor0/8OWWUcElvScUjcZmESNhUX62xqLVD0GMj5TBHxjHr9aGD9cK+7Jt9iQbQlOvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760698709; c=relaxed/simple;
	bh=awOXJ76qW+uqReitMYlhmpnBHHfBduEeSXRYaw9nhUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JxIfWBNwHUX6UEJ9knIs1jfblNSrhhTFbZ936QgGq3Z0YXWbiuC1EzVRIMfO28HKEl5xknfJF+7TW8hecv+jenJyZm2C5yl1i2Ck4ugfKzheRnbiJfuD4moLdIxCc1woNRZ+SsLDZu9SCUWqaJMmQ6griMBeU/tvw+TNUC6fTR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cRiLfJhA; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cRiLfJhA"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-78af743c232so1602203b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 17 Oct 2025 03:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760698706; x=1761303506; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YKyThkLJsQQYLBoBp/ki0YsrfR20uz6FjDBOGTP9Uj0=;
        b=cRiLfJhAn7csMw1pp5ZZZbq7oRFjh4C+dgcDP5xJ8tftPYbGfKEfBXRJok3L5BfjAC
         +PBOPU2PiJ6VN3JaZVC9EOAjWvAuLaYN3MmGBvMFnAIX+qz951j5NtZwplMl6O1rSD8Y
         aeHgASV7Rzb+X5tgQzRTZ6/eZsursSs0fRI/ye/CS0kPpKLu49QD4Dy/lrkDlHZail8U
         rd5KDlbJQS+lYqHA1an4o5k8UY45d1YsUug4inDlOaHxnhJWX1y4D7pVKrXVzStyg5om
         f3Td1pD0rXZfvkmaEC7OroCDuK19fDXyevEArYMx2v51zA+ete5lKptxWqR+ICLaz0UE
         w2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760698706; x=1761303506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YKyThkLJsQQYLBoBp/ki0YsrfR20uz6FjDBOGTP9Uj0=;
        b=C8L3qjNMlr8UlpOqB6BKR2eroJzOnBxpk2ozIbZB38lpTt3GeL3ejDeFW9/Tc3pZc6
         p1VoKQ6tH3e1ll0gzFXqMaN5BvvSIbTLfBb67PpdxX9sSWNXD4gDXm1lupnUQCENkH2j
         VkC5pGntJAXpBtHcoPg4bRabzppsUGspRB8dF7FnGPNL633YI8RluFImQIxedJKo7XrW
         0XEyC1EL/j4UgUkSpzUdUu85w9LicBem2nGA2hMyBLbBKjinNBPn2J/I4H5ff89ACdh5
         eCLx/dVizjKO11BuJ2AktmnytdFvp4tjmPJhaf15ayd2Aw8dLwZz24Yi3ZPR/Hj5SM3v
         NCVA==
X-Forwarded-Encrypted: i=1; AJvYcCUVA40dYwqI+t0gKeUImt08CkeoTwTaR6XeSj79S6RFFEzTOm9uWGjC6BZDNXzrhOdlzH6HORNrqkgNJlWWgCQ2cWowBA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzq6bxarzx2KK/Mjte+O0o7zNDf1MWAJiCl3xZSMuzgZlebpL1s
	ZWdskZmR3w81Pq0vqLG9X8eaw7bdy03qNHJezKsSAiYwOkP/IWT4DWbo
X-Gm-Gg: ASbGncvrcsemmEy9WT7Mhw7jzaQ1dR+4WF57CkGJERzo/EpGrw7t3PnDahHRKgJR72j
	TwGUZNKvP96Zd5wS2d0/isXG/3lwjntK12iifE8UKVUdh06BRUnXbW98nKt255PAvr7ho50CYwv
	AHQXf5kiCSJIzR+X80tKdgQ7qfQMERUyXCkIWwG738I5svN6Rnyxn43OFRhfTce1qynOMSHAiIJ
	xFLOeDp4D6DtQCiFJFUvm8aG+iq08Y4986AzlrPzYg61/K/4c8vxX5mH0XdjpwDqgVmRBcLtifd
	7+efOOULoZ46ebe7T8tawsctnVA6jXAU/qeYX2mbNA152LCOv9W9ZGjiDg6U7efh26J4No2/XFD
	UN/4O91LR88n00eVuld51iAgo3493oOAcq1O+Yge2+w5H2AE3e5Pr1+yq/fTmQegS2n98Fv6fXi
	rr21Kiyg==
X-Google-Smtp-Source: AGHT+IFVmlgfFGKJInD7guXV1jAhWwcObJ5HGSNw+n60AINx8nIvhIaYT0D8qgDuf7T/ppajshtYQw==
X-Received: by 2002:a05:6a20:12c5:b0:334:96ed:7a7b with SMTP id adf61e73a8af0-334a85fda77mr4338002637.38.1760698705934;
        Fri, 17 Oct 2025 03:58:25 -0700 (PDT)
Received: from tixy.nay.do ([2405:201:8000:a149:4670:c55c:fe13:754d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b639cc8sm25407571b3a.20.2025.10.17.03.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 03:58:25 -0700 (PDT)
From: Ankan Biswas <spyjetfayed@gmail.com>
To: linux@roeck-us.net,
	corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	khalid@kernel.org,
	david.hunter.linux@gmail.com,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Ankan Biswas <spyjetfayed@gmail.com>
Subject: [PATCH 2/3] docs/hwmon: Add missing datasheet links for Maxim chips
Date: Fri, 17 Oct 2025 16:27:17 +0530
Message-ID: <20251017105740.17646-3-spyjetfayed@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017105740.17646-1-spyjetfayed@gmail.com>
References: <20251017105740.17646-1-spyjetfayed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In 2021, Maxim Integrated was acquired by Analog Devices.
maxim-ic.com & maximintegrated.com links redirect to analog.com.

Missing datasheets now available at Analog Devices added.

Signed-off-by: Ankan Biswas <spyjetfayed@gmail.com>
---
 Documentation/hwmon/ds1621.rst   | 20 +++++++++++++++-----
 Documentation/hwmon/lm75.rst     | 13 ++++++++-----
 Documentation/hwmon/max15301.rst |  8 ++++++--
 Documentation/hwmon/max31827.rst |  5 +++++
 Documentation/hwmon/max77705.rst |  4 +++-
 Documentation/hwmon/pmbus.rst    |  4 ++--
 6 files changed, 39 insertions(+), 15 deletions(-)

diff --git a/Documentation/hwmon/ds1621.rst b/Documentation/hwmon/ds1621.rst
index 552b37e9dd34..415d4c3043a7 100644
--- a/Documentation/hwmon/ds1621.rst
+++ b/Documentation/hwmon/ds1621.rst
@@ -9,7 +9,9 @@ Supported chips:
 
     Addresses scanned: none
 
-    Datasheet: Publicly available from www.maximintegrated.com
+    Datasheet: Publicly available at the Analog Devices website
+
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/DS1621.pdf
 
   * Dallas Semiconductor DS1625
 
@@ -17,7 +19,9 @@ Supported chips:
 
     Addresses scanned: none
 
-    Datasheet: Publicly available from www.datasheetarchive.com
+    Datasheet: Publicly available at the Analog Devices website
+
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/DS1620.pdf
 
   * Maxim Integrated DS1631
 
@@ -25,7 +29,9 @@ Supported chips:
 
     Addresses scanned: none
 
-    Datasheet: Publicly available from www.maximintegrated.com
+    Datasheet: Publicly available at the Analog Devices website
+
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/DS1631-DS1731.pdf
 
   * Maxim Integrated DS1721
 
@@ -33,7 +39,9 @@ Supported chips:
 
     Addresses scanned: none
 
-    Datasheet: Publicly available from www.maximintegrated.com
+    Datasheet: Publicly available at the Analog Devices website
+
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/DS1721.pdf
 
   * Maxim Integrated DS1731
 
@@ -41,7 +49,9 @@ Supported chips:
 
     Addresses scanned: none
 
-    Datasheet: Publicly available from www.maximintegrated.com
+    Datasheet: Publicly available at the Analog Devices website
+
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/DS1631-DS1731.pdf
 
 Authors:
       - Christian W. Zuckschwerdt <zany@triq.net>
diff --git a/Documentation/hwmon/lm75.rst b/Documentation/hwmon/lm75.rst
index 908b3a9df06e..2dbcf0c204b0 100644
--- a/Documentation/hwmon/lm75.rst
+++ b/Documentation/hwmon/lm75.rst
@@ -23,15 +23,17 @@ Supported chips:
 
 	       http://www.national.com/
 
-  * Dallas Semiconductor (now Maxim) DS75, DS1775, DS7505
+  * Dallas Semiconductor (now Analog Devices) DS75, DS1775, DS7505
 
     Prefixes: 'ds75', 'ds1775', 'ds7505'
 
     Addresses scanned: none
 
-    Datasheet: Publicly available at the Maxim website
+    Datasheet: Publicly available at the Analog Devices website
 
-	       https://www.maximintegrated.com/
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/DS75.pdf
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/DS1775.pdf
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/DS1775.pdf
 
   * Maxim MAX6625, MAX6626, MAX31725, MAX31726
 
@@ -39,9 +41,10 @@ Supported chips:
 
     Addresses scanned: none
 
-    Datasheet: Publicly available at the Maxim website
+    Datasheet: Publicly available at the Analog website
 
-	       http://www.maxim-ic.com/
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/MAX6625-MAX6626.pdf
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/MAX31725-MAX31726.pdf
 
   * Microchip (TelCom) TCN75
 
diff --git a/Documentation/hwmon/max15301.rst b/Documentation/hwmon/max15301.rst
index e2222e98304f..94d6491400b7 100644
--- a/Documentation/hwmon/max15301.rst
+++ b/Documentation/hwmon/max15301.rst
@@ -11,7 +11,9 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX15301.pdf
+    Datasheet: Publicly available at the Analog Devices website
+
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/max15301.pdf
 
   * Maxim MAX15303
 
@@ -19,7 +21,9 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/max15303.pdf
+    Datasheet: Publicly available at the Analog Devices website
+
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/max15303.pdf
 
 Author: Erik Rosen <erik.rosen@metormote.com>
 
diff --git a/Documentation/hwmon/max31827.rst b/Documentation/hwmon/max31827.rst
index 6cc5088b26b7..f40daa4bdcf9 100644
--- a/Documentation/hwmon/max31827.rst
+++ b/Documentation/hwmon/max31827.rst
@@ -13,6 +13,8 @@ Supported chips:
 
     Datasheet: Publicly available at the Analog Devices website
 
+	    https://www.analog.com/media/en/technical-documentation/data-sheets/MAX31827-MAX31829.pdf
+
   * Maxim MAX31828
 
     Prefix: 'max31828'
@@ -21,6 +23,8 @@ Supported chips:
 
     Datasheet: Publicly available at the Analog Devices website
 
+	    https://www.analog.com/media/en/technical-documentation/data-sheets/MAX31827-MAX31829.pdf
+
   * Maxim MAX31829
 
     Prefix: 'max31829'
@@ -29,6 +33,7 @@ Supported chips:
 
     Datasheet: Publicly available at the Analog Devices website
 
+	    https://www.analog.com/media/en/technical-documentation/data-sheets/MAX31827-MAX31829.pdf
 
 Authors:
 	- Daniel Matyas <daniel.matyas@analog.com>
diff --git a/Documentation/hwmon/max77705.rst b/Documentation/hwmon/max77705.rst
index 4a7680a340e1..0491dab1ec8e 100644
--- a/Documentation/hwmon/max77705.rst
+++ b/Documentation/hwmon/max77705.rst
@@ -11,7 +11,9 @@ Supported chips:
 
     Addresses scanned: none
 
-    Datasheet: Not available
+    Datasheet: Publicly available at the Analog Devices website
+
+	    https://www.analog.com/media/en/technical-documentation/data-sheets/max77505.pdf
 
 Authors:
       - Dzmitry Sankouski <dsankouski@gmail.com>
diff --git a/Documentation/hwmon/pmbus.rst b/Documentation/hwmon/pmbus.rst
index d477124cf67f..dcfb69fc4db3 100644
--- a/Documentation/hwmon/pmbus.rst
+++ b/Documentation/hwmon/pmbus.rst
@@ -72,9 +72,9 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet:
+    Datasheet: Publicly available at the Analog Devices website
 
-	Not published
+	https://www.analog.com/media/en/technical-documentation/data-sheets/MAX20796.pdf
 
   * Generic PMBus devices
 
-- 
2.51.0

