Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B5F2F12A1
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 17 Oct 2025 15:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760716091; cv=none; b=T3lT+rMSIvkc6kyIal9PG6cm+NAIt/med373kOvjGd9T/ZW6tVLfXRwjOV25Z8HlvSy0i2Ly3SPn7v8TLqQnjf8mumsBr7qHTI+EXPAVXsNGEZ/8Hs9i4572RyyLJGBn9PrztD7qgp6OizMGL2s8+y7o+SJOcago4L//cOezUUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760716091; c=relaxed/simple;
	bh=K8DFRb0Ztia+qrCcoflV/ZeZ7NwFvRkhWlev7x/h/Qg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S+az0jdahM/pUogevt8lgtm9aPvMarKMDAfqC3ivDN6rkonVkSHmvvlVcXfM1NVjWIUHuz9vp+tqLUMTyR5KdAPXBaXOCLgPjgow0GgmygbwHY/1W0R0+4zWDkQAgymvYHirTMh40gtMiESGVDjHs1GoTTP4BvHxiP6HjQwcANg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RHv9Pk2T; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RHv9Pk2T"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-27d4d6b7ab5so27290475ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 17 Oct 2025 08:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760716088; x=1761320888; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XA8hB+fKoSI0C5+4jjJikVSM6fs77YDr0e+WwSrJDj0=;
        b=RHv9Pk2TZkqkTLqzeO0kA4wQOvQIdrsRToUWa3JNiiG9meKcR8vdY3/vEDYD0/0lwM
         kOjjrasEoRmRasd4atWSUTQs20afZbMouc01jlq+UoiT2aEs6ekhfWNHFKnGh5k5WJ+6
         /9qA2z7vsZ35ak41rNtAh+dG/C92Y26PkDqAaakWkPZu+Q8Fz4AJlxw4dvMidqI4prnf
         JjVYVnHTMBRS3aStO7lLLjOG8iUjBWr7XcNcUX3Ixaao7snwwvD6NuDw9M6rm1Hiw4HM
         kZa14yYz4AvpfKOh8n3+mf5vlyqyT31mREU2PLcBFadFJcgnSFApiutqorFxxgRmHdEF
         dfrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760716088; x=1761320888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XA8hB+fKoSI0C5+4jjJikVSM6fs77YDr0e+WwSrJDj0=;
        b=s4FiZr8azaMzJKzvGbsxjGTMgowdkx1N9bIdIjprti8aPF+Nhkjl60lr/ez9f63Xju
         PpvMEVNRCkbrmerdLiPwZlhw14WETESvxzpkeliKzi6mihvUniS4LpI4WoNptMYud31f
         mO2UnPvEgxidaR8pi6zwguEz7F82cBgbZ5sx/VEAQwVMhBvwP5yf9ZawuFZm1BzTMALO
         GDLgjtxwYbAKyCd3WrTby8+M4vZCb+sPPsWYlXBF5yZhfpuVkuBBPOU4jphCsZ5g1hKL
         NMJgiV/oBTP71gEct9wKXi8RfKUD9WW6eh/A1u+qgzPgsTTGMnKyKu3UNDcAmd46tvcP
         Kauw==
X-Forwarded-Encrypted: i=1; AJvYcCUIXBaRL/CifEbdNJGhrkNPs2KsjEsH20p22dyrDP3gZAOsxz3gxA+1AV3mfzfNSVA1ShvTouVku7A/e5y+2Zsp2RYmvA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxvCrgoQepZTX+liFpddzXcoVCqNqumzI1w0Z5Pm5x3RERd1DRg
	OkuC5AN+L7CO1ppGwLi2KItDiKhhOcqHPqPQJ4OCbqHHkfbWXxv/S7Tp
X-Gm-Gg: ASbGnctuN3/i03QIBBi2iPJyFbtSvHFi7KrMQfKUPziRlT+kl9qNrK/WxOMLRFI6QxV
	7HNCAMRFmiAOP4YfItsaTLBgMNumvQxbM2mKc4CczThHYrVpKNkFnFdiBKO1hg1VNWfpSAUoYHd
	P8WkQN95NiifaSnJ9eXxinrmDNmW2J++Rtht86tE9ZGgRzTvLgFC9C29R8I43qeQksUyjRZfEt/
	v9f8EHaJ0n7vrvyyD+A60TqWXDlb6pZuWW79clqwnyYDKfpjiDxENDK4iShe9PobNP1xre2Xf3C
	UqUiHxGloCVmmEFnMKkrucIuDyBmR2ojySTM3GsWYK4yq3/YSHeVU1/VxedEYb0Y/OT/tEdx3Qj
	D/ISgc9dkSZqOE5JXl8rly1lwSdXEN/lpecxptVXyXdJ1yyqaENZPyTV0zIw4SWLP0lI47vqkTl
	UT6PrUt5n8/oyYXfTC
X-Google-Smtp-Source: AGHT+IEbaVBUhL2FBwern7+zHOit6xgEgtPgDccPkqcCVLqGnNEkHex6DpAOpZKc6wJEB6vGZjGEkQ==
X-Received: by 2002:a17:902:d510:b0:267:776b:a31a with SMTP id d9443c01a7336-290ca121a37mr51838215ad.29.1760716087572;
        Fri, 17 Oct 2025 08:48:07 -0700 (PDT)
Received: from tixy.nay.do ([2405:201:8000:a149:4670:c55c:fe13:754d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2909930a9a7sm67893225ad.18.2025.10.17.08.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 08:48:07 -0700 (PDT)
From: Ankan Biswas <spyjetfayed@gmail.com>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	khalid@kernel.org,
	david.hunter.linux@gmail.com,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Ankan Biswas <spyjetfayed@gmail.com>
Subject: [PATCH v2 1/3] Fix broken maxim-ic.com links to analog.com
Date: Fri, 17 Oct 2025 21:17:47 +0530
Message-ID: <20251017154755.32105-1-spyjetfayed@gmail.com>
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

Broken redirects fixed to their proper analog.com links.
Fixes warnings in 'make linkcheckdocs'.

Signed-off-by: Ankan Biswas <spyjetfayed@gmail.com>
---
 Documentation/hwmon/jc42.rst     | 2 +-
 Documentation/hwmon/max16064.rst | 2 +-
 Documentation/hwmon/max16065.rst | 8 ++++----
 Documentation/hwmon/max1619.rst  | 4 ++--
 Documentation/hwmon/max31790.rst | 2 +-
 Documentation/hwmon/max6650.rst  | 4 ++--
 Documentation/hwmon/max8688.rst  | 2 +-
 7 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/Documentation/hwmon/jc42.rst b/Documentation/hwmon/jc42.rst
index 19d10512f6c0..3736e63db2a8 100644
--- a/Documentation/hwmon/jc42.rst
+++ b/Documentation/hwmon/jc42.rst
@@ -33,7 +33,7 @@ Supported chips:
 
     Datasheets:
 
-	http://datasheets.maxim-ic.com/en/ds/MAX6604.pdf
+	https://www.analog.com/media/en/technical-documentation/data-sheets/MAX6604.pdf
 
   * Microchip MCP9804, MCP9805, MCP9808, MCP98242, MCP98243, MCP98244, MCP9843
 
diff --git a/Documentation/hwmon/max16064.rst b/Documentation/hwmon/max16064.rst
index c06249292557..2a8a76d7b230 100644
--- a/Documentation/hwmon/max16064.rst
+++ b/Documentation/hwmon/max16064.rst
@@ -9,7 +9,7 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: http://datasheets.maxim-ic.com/en/ds/MAX16064.pdf
+    Datasheet: https://www.digikey.com/en/htmldatasheets/production/701833/0/0/1/max16064
 
 Author: Guenter Roeck <linux@roeck-us.net>
 
diff --git a/Documentation/hwmon/max16065.rst b/Documentation/hwmon/max16065.rst
index 45f69f334f25..ac3dc6f023dd 100644
--- a/Documentation/hwmon/max16065.rst
+++ b/Documentation/hwmon/max16065.rst
@@ -12,7 +12,7 @@ Supported chips:
 
     Datasheet:
 
-	http://datasheets.maxim-ic.com/en/ds/MAX16065-MAX16066.pdf
+	https://www.analog.com/media/en/technical-documentation/data-sheets/max16065-max16066.pdf
 
  *  Maxim MAX16067
 
@@ -22,7 +22,7 @@ Supported chips:
 
     Datasheet:
 
-	http://datasheets.maxim-ic.com/en/ds/MAX16067.pdf
+	https://www.analog.com/media/en/technical-documentation/data-sheets/max16067.pdf
 
  *  Maxim MAX16068
 
@@ -32,7 +32,7 @@ Supported chips:
 
     Datasheet:
 
-	http://datasheets.maxim-ic.com/en/ds/MAX16068.pdf
+	https://www.analog.com/media/en/technical-documentation/data-sheets/max16068.pdf
 
  *  Maxim MAX16070/MAX16071
 
@@ -42,7 +42,7 @@ Supported chips:
 
     Datasheet:
 
-	http://datasheets.maxim-ic.com/en/ds/MAX16070-MAX16071.pdf
+	https://www.analog.com/media/en/technical-documentation/data-sheets/max16070-max16071.pdf
 
 Author: Guenter Roeck <linux@roeck-us.net>
 
diff --git a/Documentation/hwmon/max1619.rst b/Documentation/hwmon/max1619.rst
index b5fc175ae18d..f134d0fa9bfd 100644
--- a/Documentation/hwmon/max1619.rst
+++ b/Documentation/hwmon/max1619.rst
@@ -9,9 +9,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x18-0x1a, 0x29-0x2b, 0x4c-0x4e
 
-    Datasheet: Publicly available at the Maxim website
+    Datasheet:
 
-	       http://pdfserv.maxim-ic.com/en/ds/MAX1619.pdf
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/MAX1619.pdf
 
 Authors:
        - Oleksij Rempel <bug-track@fisher-privat.net>,
diff --git a/Documentation/hwmon/max31790.rst b/Documentation/hwmon/max31790.rst
index 33c5c7330efc..b8af2d907b6e 100644
--- a/Documentation/hwmon/max31790.rst
+++ b/Documentation/hwmon/max31790.rst
@@ -9,7 +9,7 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://pdfserv.maximintegrated.com/en/ds/MAX31790.pdf
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/MAX31790.pdf
 
 Author: Il Han <corone.il.han@gmail.com>
 
diff --git a/Documentation/hwmon/max6650.rst b/Documentation/hwmon/max6650.rst
index 7952b6ecaa2d..427f353c5e9c 100644
--- a/Documentation/hwmon/max6650.rst
+++ b/Documentation/hwmon/max6650.rst
@@ -9,7 +9,7 @@ Supported chips:
 
     Addresses scanned: none
 
-    Datasheet: http://pdfserv.maxim-ic.com/en/ds/MAX6650-MAX6651.pdf
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/MAX6650-MAX6651.pdf
 
   * Maxim MAX6651
 
@@ -17,7 +17,7 @@ Supported chips:
 
     Addresses scanned: none
 
-    Datasheet: http://pdfserv.maxim-ic.com/en/ds/MAX6650-MAX6651.pdf
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/MAX6650-MAX6651.pdf
 
 Authors:
     - Hans J. Koch <hjk@hansjkoch.de>
diff --git a/Documentation/hwmon/max8688.rst b/Documentation/hwmon/max8688.rst
index 71e7f2cbe2e2..71b6b9ee90ab 100644
--- a/Documentation/hwmon/max8688.rst
+++ b/Documentation/hwmon/max8688.rst
@@ -9,7 +9,7 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: http://datasheets.maxim-ic.com/en/ds/MAX8688.pdf
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/max8688.pdf
 
 Author: Guenter Roeck <linux@roeck-us.net>
 
-- 
2.51.0

