Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CD718C31
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 16 Oct 2025 10:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760610718; cv=none; b=Bv9+2MB2Jhd13C9sGqi8Dpd2QwNrIeg0NiqcnWU/ztH+4bMZ/NK5xkEny70xsZdaPaP7LJV8Yjq7d7Nogc3TGi4eHgOdU81mdLd9LNedSe2vbOaTbSoaY8FRyA6Y9WlEAyFNV0C5f4vNL9pUHyo5IZTSD2n5VWG8LEbNaVcCD9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760610718; c=relaxed/simple;
	bh=WleEz1jDhFGxeIs2CY0OgjieUL0QJH/bHnUi6b4JJ7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rN7ibYw2sgIioV4r1tCF1/vfe5Zxc8rcnyGjn/EHxWw2oEUlViW2PPryP55NOhI8K2DDAaQMcf8m9ZkKLl7BMOE2m+1t16aEf25cKBvkFZUGPGfuxVWT7vP8y5JrzHQyXti2Urg97FyOktzlnImxm+FxwnX3pJN4k/77CA0UXr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IavIT2te; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IavIT2te"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b55517e74e3so621882a12.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 16 Oct 2025 03:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760610716; x=1761215516; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1XdDhDJMoxJD2rsJZbe4GsNrMXtzir8r6EJcyMjSDT4=;
        b=IavIT2te73U+83Jiv3YW/4RvC4QoRl2wyrpcxv4s3tW13cLoDfTW58Gpts0YgoNvnZ
         17X2ZydMGyVwuoRu1qN2mPE1aWi6s1UVh7zHjVseMPUuOXgHwA7gEt93S8Z2PQwdiZwg
         Av/JgJcdYq2ex+SaZ8uaj4McunZXna21hOsDcbYW7a1D9q0ZhOqtxYjhP2zOW1bBDvNE
         m6gliuKVfxAHrQoFLVlZKS9LpchMfUPoIVAERtrVl8VNjUtzWrI9eMUf6RhV/SwBMf49
         sIX4JcI40m8YhOzyLIiK77SByPOSaoMBgmhCEmzFe0QeXlf2am5HYIzbvkrLDzriLZVW
         iDxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760610716; x=1761215516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1XdDhDJMoxJD2rsJZbe4GsNrMXtzir8r6EJcyMjSDT4=;
        b=NfMJtYVY9ggXADG7wrXsnDDMMU96kyASVhK0zMnY2TqgL26E9YZzD8agNIOssQRGDa
         8gO1AmMeg//4ZKYiXCIw77ndjX1EjqZ/NSY598JMxWS2msAcjmeWCgoyCuv9Z/WMkHQh
         kTFhnPmgaDL+KolaaLLWQj1RsAW0I0XtawTw1ZZ7oD3rK2tX+/Svw1lDy/hLR2PiNMVJ
         S1dV9oClgETnRQHBzVrQid1q49Qu+25YkeGcST/ZJA74b4MfKaeBBxpb5/fTG2GpnofZ
         sqWqtsR9tiU+iGfej75WG8FAOFWNXW637JkFh+W996Mo4F03Pwvvpj9aHGBuK8mwEefP
         Pdew==
X-Forwarded-Encrypted: i=1; AJvYcCXQbxORzEjqLIWBgxEeldsMs39jZ9Xk4cTJUCj8sCMcWxI6oYP6SBlZ+kmVokylyF/g00b9VrGjMzMckek7OUJ8LozO0Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwirUi+My68E23Wp4fpyVcMEqgD4nluINpjBMfdcMz6QhhvIlzo
	WmsE+5USqsYOIh5/A5MX/Nm4G54cuPNskSN1/xFqIABkDxxL4DYwXJjn
X-Gm-Gg: ASbGncvC64LvP6MrBODNho5S2fuJM7TH5BoFWvXQWnJ5Fy7gjOyVqqY3y5rflc+CcTf
	HYcjUlx/DOnomnxIUGDy34CphfsJ8ZMlXHAxHdLcvbdr+yCR1ESB7TK0PH9ay0NTxlthrgqE30k
	clDs0eSZWFg9X+KR5Axtb6h9p+IYprBLWT0fljrMW8tXlxWUcdSC3CncPO6dOSGu+O/Iaih54Fi
	MdKX+/fWkPv8Dz6xGc0puWrEf6ZlSeQJjH6VKLjtxCC2QiQSqJ+heuw8Ce7Xb8kHCvzkzbjr0P3
	vxf+FuTH4n/cJPFtll7f2Txe7DyS/itfoEZc+3EYjZtMYAWrKMvIenknLXmgUFyWgZJ4ojWuN76
	GRmscnPAXxx7fqBTLfqV0AWiJX++rNX2pvebrbvCXL5jheF5taVL+0e4eSDV+4vosDCGf1Dig2z
	NkE80YWg==
X-Google-Smtp-Source: AGHT+IGjBFuJvAMg2CCNAuWmCt1wkNiJYWm9mdK+6gFWgDz+yO8eXWxmZN+c2qpxak00Rg8z+kuJ1w==
X-Received: by 2002:a17:903:1b4d:b0:26d:353c:75d4 with SMTP id d9443c01a7336-2902724dc40mr375545515ad.0.1760610715577;
        Thu, 16 Oct 2025 03:31:55 -0700 (PDT)
Received: from tixy.nay.do ([2405:201:8000:a149:4670:c55c:fe13:754d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33bb65222b1sm1422670a91.6.2025.10.16.03.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 03:31:55 -0700 (PDT)
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
Subject: [PATCH] docs/hwmon: Fix broken links warnings in lm90.rst
Date: Thu, 16 Oct 2025 16:00:47 +0530
Message-ID: <20251016103049.2573-1-spyjetfayed@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes warnings in Documentation/hwmon/lm90.rst reported when
running 'make linkcheckdocs'.

On 2011-09-23 National Semiconductors became part of Texas Instruments
and national.com is no longer accessible. The datasheet resources for
the chips are now available at Texas Instruments website and have been
updated for lm90.

In 2021, Maxim Integrated was acquired by Analog Devices and maxim-ic.com
redirects to analog.com. The chip datasheets are now available at
Analog Devices and have been updated accordingly.

Some additional broken or unavailable links have been replaced with
equivalents hosted by DigiKey.

Signed-off-by: Ankan Biswas <spyjetfayed@gmail.com>
---
 Documentation/hwmon/lm90.rst | 127 ++++++++++++++++++++---------------
 1 file changed, 73 insertions(+), 54 deletions(-)

diff --git a/Documentation/hwmon/lm90.rst b/Documentation/hwmon/lm90.rst
index 98452eed16d5..79c023521d39 100644
--- a/Documentation/hwmon/lm90.rst
+++ b/Documentation/hwmon/lm90.rst
@@ -9,7 +9,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x18 - 0x1a, 0x29 - 0x2b, 0x4c - 0x4e
 
-    Datasheet: Publicly available at the National Semiconductor website
+    Datasheet: Publicly available at the TI website
+
+	       https://www.ti.com/lit/ds/symlink/lm84.pdf
 
   * National Semiconductor LM90
 
@@ -17,9 +19,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x4c
 
-    Datasheet: Publicly available at the National Semiconductor website
+    Datasheet: Publicly available at the TI website
 
-	       http://www.national.com/pf/LM/LM90.html
+	       https://www.ti.com/lit/ds/symlink/lm90.pdf
 
   * National Semiconductor LM89
 
@@ -27,9 +29,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x4c and 0x4d
 
-    Datasheet: Publicly available at the National Semiconductor website
+    Datasheet: Publicly available at the TI website
 
-	       http://www.national.com/mpf/LM/LM89.html
+	       https://www.ti.com/lit/ds/symlink/lm89.pdf
 
   * National Semiconductor LM99
 
@@ -37,9 +39,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x4c and 0x4d
 
-    Datasheet: Publicly available at the National Semiconductor website
+    Datasheet: Publicly available at the TI website
 
-	       http://www.national.com/pf/LM/LM99.html
+	       https://www.ti.com/lit/ds/symlink/lm99.pdf
 
   * National Semiconductor LM86
 
@@ -47,9 +49,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x4c
 
-    Datasheet: Publicly available at the National Semiconductor website
+    Datasheet: Publicly available at the TI website
 
-	       http://www.national.com/mpf/LM/LM86.html
+	       https://www.ti.com/lit/ds/symlink/lm86.pdf
 
   * Analog Devices ADM1020
 
@@ -57,7 +59,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x4c - 0x4e
 
-    Datasheet: Publicly available at the Analog Devices website
+    Datasheet: Publicly available at the DigiKey website
+
+	       https://media.digikey.com/pdf/Data%20Sheets/Analog%20Devices%20PDFs/ADM1020.pdf
 
   * Analog Devices ADM1021
 
@@ -65,7 +69,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x18 - 0x1a, 0x29 - 0x2b, 0x4c - 0x4e
 
-    Datasheet: Publicly available at the Analog Devices website
+    Datasheet: Publicly available at the DigiKey website
+
+	       https://media.digikey.com/pdf/Data%20Sheets/Analog%20Devices%20PDFs/ADM1021.pdf
 
   * Analog Devices ADM1021A/ADM1023
 
@@ -75,15 +81,18 @@ Supported chips:
 
     Datasheet: Publicly available at the Analog Devices website
 
+	       https://media.digikey.com/pdf/Data%20Sheets/Analog%20Devices%20PDFs/ADM1021A.pdf
+	       https://media.digikey.com/pdf/Data%20Sheets/Analog%20Devices%20PDFs/ADM1023.pdf
+
   * Analog Devices ADM1032
 
     Prefix: 'adm1032'
 
     Addresses scanned: I2C 0x4c and 0x4d
 
-    Datasheet: Publicly available at the ON Semiconductor website
+    Datasheet: Publicly available at the DigiKey website
 
-	       https://www.onsemi.com/PowerSolutions/product.do?id=ADM1032
+	       https://www.digikey.com/htmldatasheets/production/53140/0/0/1/ADM1032.pdf
 
   * Analog Devices ADT7461
 
@@ -111,9 +120,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x4b and 0x4c
 
-    Datasheet: Publicly available at the ON Semiconductor website
+    Datasheet: Publicly available at the DigiKey website
 
-	       https://www.onsemi.com/PowerSolutions/product.do?id=ADT7481
+	       https://www.digikey.com/htmldatasheets/production/234607/0/0/1/ADT7481.pdf
 
   * Analog Devices ADT7482
 
@@ -191,7 +200,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x18 - 0x1a, 0x29 - 0x2b, 0x4c - 0x4e
 
-    Datasheet: Publicly available at the Maxim website
+    Datasheet: Publicly available at the Analog Devices website
+
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/MAX1617.pdf
 
   * Maxim MAX1617A
 
@@ -199,7 +210,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x18 - 0x1a, 0x29 - 0x2b, 0x4c - 0x4e
 
-    Datasheet: Publicly available at the Maxim website
+    Datasheet: Publicly available at the Analog Devices website
+
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/MAX1617A.pdf
 
   * Maxim MAX6642
 
@@ -207,9 +220,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x48-0x4f
 
-    Datasheet: Publicly available at the Maxim website
+    Datasheet: Publicly available at the Analog Devices website
 
-	       http://datasheets.maxim-ic.com/en/ds/MAX6642.pdf
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/MAX6642.pdf
 
   * Maxim MAX6646
 
@@ -217,9 +230,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x4d
 
-    Datasheet: Publicly available at the Maxim website
+    Datasheet: Publicly available at the Analog Devices website
 
-	       http://www.maxim-ic.com/quick_view2.cfm/qv_pk/3497
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/MAX6646-MAX6649.pdf
 
   * Maxim MAX6647
 
@@ -227,9 +240,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x4e
 
-    Datasheet: Publicly available at the Maxim website
+    Datasheet: Publicly available at the Analog Devices website
 
-	       http://www.maxim-ic.com/quick_view2.cfm/qv_pk/3497
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/MAX6646-MAX6649.pdf
 
   * Maxim MAX6648
 
@@ -237,9 +250,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x4c
 
-    Datasheet: Publicly available at the Maxim website
+    Datasheet: Publicly available at the Analog Devices website
 
-	       http://www.maxim-ic.com/quick_view2.cfm/qv_pk/3500
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/MAX6648-MAX6692.pdf
 
   * Maxim MAX6649
 
@@ -247,9 +260,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x4c
 
-    Datasheet: Publicly available at the Maxim website
+    Datasheet: Publicly available at the Analog Devices website
 
-	       http://www.maxim-ic.com/quick_view2.cfm/qv_pk/3497
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/MAX1617.pdf
 
   * Maxim MAX6654
 
@@ -259,9 +272,9 @@ Supported chips:
 
 			   0x4c, 0x4d and 0x4e
 
-    Datasheet: Publicly available at the Maxim website
+    Datasheet: Publicly available at the Analog Devices website
 
-	       https://www.maximintegrated.com/en/products/sensors/MAX6654.html
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/MAX6654.pdf
 
   * Maxim MAX6657
 
@@ -269,9 +282,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x4c
 
-    Datasheet: Publicly available at the Maxim website
+    Datasheet: Publicly available at the Analog Devices website
 
-	       http://www.maxim-ic.com/quick_view2.cfm/qv_pk/2578
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/MAX6657-MAX6659.pdf
 
   * Maxim MAX6658
 
@@ -279,9 +292,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x4c
 
-    Datasheet: Publicly available at the Maxim website
+    Datasheet: Publicly available at the Analog Devices website
 
-	       http://www.maxim-ic.com/quick_view2.cfm/qv_pk/2578
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/MAX6657-MAX6659.pdf
 
   * Maxim MAX6659
 
@@ -289,9 +302,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x4c, 0x4d, 0x4e
 
-    Datasheet: Publicly available at the Maxim website
+    Datasheet: Publicly available at the Analog Devices website
 
-	       http://www.maxim-ic.com/quick_view2.cfm/qv_pk/2578
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/MAX6657-MAX6659.pdf
 
   * Maxim MAX6680
 
@@ -301,9 +314,9 @@ Supported chips:
 
 			   0x4c, 0x4d and 0x4e
 
-    Datasheet: Publicly available at the Maxim website
+    Datasheet: Publicly available at the Analog Devices website
 
-	       http://www.maxim-ic.com/quick_view2.cfm/qv_pk/3370
+	      https://www.analog.com/media/en/technical-documentation/data-sheets/MAX6680-MAX6681.pdf
 
   * Maxim MAX6681
 
@@ -313,9 +326,9 @@ Supported chips:
 
 			   0x4c, 0x4d and 0x4e
 
-    Datasheet: Publicly available at the Maxim website
+    Datasheet: Publicly available at the Analog Devices website
 
-	       http://www.maxim-ic.com/quick_view2.cfm/qv_pk/3370
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/MAX6680-MAX6681.pdf
 
   * Maxim MAX6692
 
@@ -323,9 +336,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x4c
 
-    Datasheet: Publicly available at the Maxim website
+    Datasheet: Publicly available at the Analog Devices website
 
-	       http://www.maxim-ic.com/quick_view2.cfm/qv_pk/3500
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/MAX6648-MAX6692.pdf
 
   * Maxim MAX6695
 
@@ -333,9 +346,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x18
 
-    Datasheet: Publicly available at the Maxim website
+    Datasheet: Publicly available at the Analog Devices website
 
-	       http://www.maxim-ic.com/datasheet/index.mvp/id/4199
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/MAX6695-MAX6696.pdf
 
   * Maxim MAX6696
 
@@ -345,9 +358,9 @@ Supported chips:
 
 			   0x4c, 0x4d and 0x4e
 
-    Datasheet: Publicly available at the Maxim website
+    Datasheet: Publicly available at the Analog Devices website
 
-	       http://www.maxim-ic.com/datasheet/index.mvp/id/4199
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/MAX6695-MAX6696.pdf
 
   * Winbond/Nuvoton W83L771W/G
 
@@ -355,7 +368,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x4c
 
-    Datasheet: No longer available
+    Datasheet: Publicly available at the DigiKey website
+
+	       https://mm.digikey.com/Volume0/opasdata/d220001/medias/docus/1128/W83L771W%2CW83L771G.pdf
 
   * Winbond/Nuvoton W83L771AWG/ASG
 
@@ -381,7 +396,7 @@ Supported chips:
 
     Datasheet: Publicly available at Nuvoton website
 
-               https://www.nuvoton.com/resource-files/Nuvoton_NCT7717U_Datasheet_V111.pdf
+	       https://www.nuvoton.com/resource-files/Nuvoton_NCT7717U_Datasheet_V111.pdf
 
   * Nuvoton NCT7718
 
@@ -391,7 +406,7 @@ Supported chips:
 
     Datasheet: Publicly available at Nuvoton website
 
-               https://www.nuvoton.com/resource-files/Nuvoton_NCT7718W_Datasheet_V11.pdf
+	       https://www.nuvoton.com/resource-files/Nuvoton_NCT7718W_Datasheet_V11.pdf
 
   * Philips/NXP SA56004X
 
@@ -401,7 +416,7 @@ Supported chips:
 
     Datasheet: Publicly available at NXP website
 
-	       http://ics.nxp.com/products/interface/datasheet/sa56004x.pdf
+	       https://www.nxp.com/docs/en/data-sheet/SA56004X.pdf
 
   * GMT G781
 
@@ -437,7 +452,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x18 - 0x1a, 0x29 - 0x2b, 0x4c - 0x4e
 
-    Datasheets: Publicly available at the Philips website
+    Datasheets: Publicly available at the DigiKey website
+
+	       https://www.digikey.com/htmldatasheets/production/97606/0/0/1/ne1617.pdf
 
   * Philips NE1618
 
@@ -445,7 +462,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x18 - 0x1a, 0x29 - 0x2b, 0x4c - 0x4e
 
-    Datasheets: Publicly available at the Philips website
+    Datasheets: Publicly available at the DigiKey website
+
+	       https://media.digikey.com/pdf/Data%20Sheets/NXP%20PDFs/NE1618.pdf
 
   * Genesys Logic GL523SM
 
@@ -453,7 +472,7 @@ Supported chips:
 
     Addresses scanned: I2C 0x18 - 0x1a, 0x29 - 0x2b, 0x4c - 0x4e
 
-    Datasheet:
+    Datasheet: No longer available at Genesys Logic website
 
   * TI THMC10
 
@@ -461,7 +480,7 @@ Supported chips:
 
     Addresses scanned: I2C 0x18 - 0x1a, 0x29 - 0x2b, 0x4c - 0x4e
 
-    Datasheet: Publicly available at the TI website
+    Datasheet: No longer available at the TI website
 
   * Onsemi MC1066
 
@@ -469,7 +488,7 @@ Supported chips:
 
     Addresses scanned: I2C 0x18 - 0x1a, 0x29 - 0x2b, 0x4c - 0x4e
 
-    Datasheet: Publicly available at the Onsemi website
+    Datasheet: No longer available at the Onsemi website
 
 Author: Jean Delvare <jdelvare@suse.de>
 
-- 
2.51.0

