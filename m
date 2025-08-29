Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F386C31DD9B
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 29 Aug 2025 14:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756476507; cv=none; b=mIJGx2Sr952KDzGn1siVpaW1fbTOPB9wymd7s022BmkprtLhdfBYTz+HX1pvieQ3sq/X6eUl3bI4uZHY5UpHXFrUVdE9R2t7B+oFfifkdiRNKWKRDAU9mIobknwmXLm72w5PLdjdUiVpuJwzS63Duqz4IWKYGtsJAnROKTXYM/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756476507; c=relaxed/simple;
	bh=DAh/U/enVioZ42zugPRpYgcrwKZOBNN1HvpG2+jAg1w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K30/RlI9NpGxeCUKvUZhwDdQ6+JS/KWEqkyc/mtUZHzWwR+VEnb2qKW2skoL6pp6JG8OyngFlac3dZR7PquAQm2389xqq8c6FyQXgM5RCIfvbObipsQmpkQMgi50UR5dfMED+Fyxb3Ym9BzPlwbldgVipXINw2m7wHnTm9QQdvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z9eS3oRG; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z9eS3oRG"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-24884d9e54bso20628085ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 29 Aug 2025 07:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756476505; x=1757081305; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CBf/VV1pdi2Z8w+VO0yTAbCkrBmCO56El8UvHRxwiUM=;
        b=Z9eS3oRGi4Qv42+DII07BhwQxMr5pD7Yov1qoyuZ+NPwcj+/EVMavQa+kCx2SMoM4U
         9l7VEiAKZVhOtX/zvQ18+wGbPgRjNT1htL+oC91H2XGApMaydax5FsPJ1q0LsCd+HDXh
         NMy8Zl4NyFxUSSdaGIwN1R/wMfnZw/V0Mgn+m1ZRSLSgNCEOwRS0UD76SRgK/3sp88EZ
         dNpW3REQ24AEpPlISp01xGS4jC2Fn0880SS3mIbxvV27AZzVOvaxECJdH5RrvvfYr921
         4q5DwE/l/HFtJXJtIt/HElL5CelfINBe+2ed5k+1Igs01jAlJ0t+LZGVz7MHndnbi28a
         Zuzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756476505; x=1757081305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CBf/VV1pdi2Z8w+VO0yTAbCkrBmCO56El8UvHRxwiUM=;
        b=LkKdJm7NXFWEbe5xXxRVVz/72juig93UIEesiAg4YDD7pUsZ7I1q1+5yQ8LfXM7z9I
         ONWvxaJ8tHU4qMNqL3o0EEr0j7VB+nkSFDDNV1iUrM/SCvFCNBV20qPrfoh3i22ZIFQj
         UTVnTkL9IEGFg/BmxkKHiqHJwL8XbNAXz1k/E6KGmBDp/rz/ZrKJvV2349TW+ov5HmbG
         yeeixgONrdX63y2W4JPUGC3judZl+o81QybycdWIg2VUqm9oHNHvLYDgFWvDfDNb//9P
         Rg4jSjDEdPd/qxoX1cRtVhTdi8r4TR/Ne1dZeJP+oZr4meqVLwJVteuwNOIfVknQUPXu
         tCuA==
X-Forwarded-Encrypted: i=1; AJvYcCVlI9y6nF6RsY9wk98QNdzQx+NZf91aKREBWKl5wyUxcvGpiyvfeOjtWx6Ocsqc2h8tMdTDIt9wZI2405sqlyrqWzzYBw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzH+R3bzPWWBCVTpMjjcrHv33FTzr+RZMpq9iqbB5cLwnwNaeIv
	DeCTVV/QAFYbhsDi8l2P1mLLaCZlkRvBl/b54YsKSc/IDgRO5fAimoSv
X-Gm-Gg: ASbGncuyc3rE4Xygy4HhuAjeAigUskjZeXILwR+fT6GoTerNlj59JTJMVoSFrCW16zj
	u/JSa8D078phrngQjCEXcfl/pDXnl2XBImIOSWkEf8PZ5+EAw6uY8us2X1yy9oVRwAFtUD9tgfk
	0D3aSLvkvpfuTCA3yA1MkUvFI8r1UI/1fd6mIWoLJJrEdz23QzyvslTQos796rnMNRTTl+u7zaZ
	nKFh6gvIids57Wdo7mfzWO9aAisvxg+qux9futLqRSq5WHLRD63fCTHVHMwN5cxdhcAUYqer4HA
	h4gJXMtClBGoJHYWmOlSi4xCJACrghNx9ycxcuL4kLMI7DI8UJp+dqfTsokgJYGOs/N1EyjvdN5
	LVmnJ6p17YOV6uRhcKUqEiXu/IM2OcvxJWd785Xv4et9CsCrtFnE7z4Zc1MKqSuV5UVY/CO0U
X-Google-Smtp-Source: AGHT+IFy2rKDVmMJBBpmBizFlAb7O5EYV1H87g9lJZAsKpui8O9+9X3Y/5oW8iAeDHUw/5KiP4MCqQ==
X-Received: by 2002:a17:902:e811:b0:246:e85d:7bc3 with SMTP id d9443c01a7336-246e85d7e61mr288008225ad.49.1756476504546;
        Fri, 29 Aug 2025 07:08:24 -0700 (PDT)
Received: from linux ([223.185.129.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-249037285b9sm26971005ad.44.2025.08.29.07.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 07:08:23 -0700 (PDT)
From: I Viswanath <viswanathiyyappan@gmail.com>
To: wsa+renesas@sang-engineering.com
Cc: peda@axentia.se,
	linux-i2c@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	I Viswanath <viswanathiyyappan@gmail.com>
Subject: [PATCH] Documentation/i2c: Add missing SPDX-License-Identifier tags
Date: Fri, 29 Aug 2025 19:37:43 +0530
Message-ID: <20250829140743.46710-1-viswanathiyyappan@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the SPDX-License-Identifier tag to all the .rst files that
are missing it

Signed-off-by: I Viswanath <viswanathiyyappan@gmail.com>
---
 Documentation/i2c/busses/i2c-ali1535.rst    | 2 ++
 Documentation/i2c/busses/i2c-ali1563.rst    | 2 ++
 Documentation/i2c/busses/i2c-ali15x3.rst    | 2 ++
 Documentation/i2c/busses/i2c-amd-mp2.rst    | 2 ++
 Documentation/i2c/busses/i2c-amd756.rst     | 2 ++
 Documentation/i2c/busses/i2c-amd8111.rst    | 2 ++
 Documentation/i2c/busses/i2c-diolan-u2c.rst | 2 ++
 Documentation/i2c/busses/i2c-i801.rst       | 2 ++
 Documentation/i2c/busses/i2c-ismt.rst       | 2 ++
 Documentation/i2c/busses/i2c-mlxcpld.rst    | 2 ++
 Documentation/i2c/busses/i2c-nforce2.rst    | 2 ++
 Documentation/i2c/busses/i2c-nvidia-gpu.rst | 2 ++
 Documentation/i2c/busses/i2c-ocores.rst     | 2 ++
 Documentation/i2c/busses/i2c-parport.rst    | 2 ++
 Documentation/i2c/busses/i2c-pca-isa.rst    | 2 ++
 Documentation/i2c/busses/i2c-piix4.rst      | 2 ++
 Documentation/i2c/busses/i2c-sis5595.rst    | 2 ++
 Documentation/i2c/busses/i2c-sis630.rst     | 2 ++
 Documentation/i2c/busses/i2c-sis96x.rst     | 2 ++
 Documentation/i2c/busses/i2c-taos-evm.rst   | 2 ++
 Documentation/i2c/busses/i2c-via.rst        | 2 ++
 Documentation/i2c/busses/i2c-viapro.rst     | 2 ++
 Documentation/i2c/busses/scx200_acb.rst     | 2 ++
 Documentation/i2c/dev-interface.rst         | 2 ++
 Documentation/i2c/dma-considerations.rst    | 2 ++
 Documentation/i2c/fault-codes.rst           | 2 ++
 Documentation/i2c/functionality.rst         | 2 ++
 Documentation/i2c/gpio-fault-injection.rst  | 2 ++
 Documentation/i2c/i2c-protocol.rst          | 2 ++
 Documentation/i2c/i2c-stub.rst              | 2 ++
 Documentation/i2c/i2c-topology.rst          | 2 ++
 Documentation/i2c/instantiating-devices.rst | 2 ++
 Documentation/i2c/muxes/i2c-mux-gpio.rst    | 2 ++
 Documentation/i2c/old-module-parameters.rst | 2 ++
 Documentation/i2c/slave-eeprom-backend.rst  | 2 ++
 Documentation/i2c/slave-interface.rst       | 2 ++
 Documentation/i2c/smbus-protocol.rst        | 2 ++
 Documentation/i2c/summary.rst               | 2 ++
 Documentation/i2c/ten-bit-addresses.rst     | 2 ++
 Documentation/i2c/writing-clients.rst       | 2 ++
 40 files changed, 80 insertions(+)

diff --git a/Documentation/i2c/busses/i2c-ali1535.rst b/Documentation/i2c/busses/i2c-ali1535.rst
index 6941064730dc..d124a768611f 100644
--- a/Documentation/i2c/busses/i2c-ali1535.rst
+++ b/Documentation/i2c/busses/i2c-ali1535.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 =========================
 Kernel driver i2c-ali1535
 =========================
diff --git a/Documentation/i2c/busses/i2c-ali1563.rst b/Documentation/i2c/busses/i2c-ali1563.rst
index eec32c3ba92a..ad471a75d737 100644
--- a/Documentation/i2c/busses/i2c-ali1563.rst
+++ b/Documentation/i2c/busses/i2c-ali1563.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 =========================
 Kernel driver i2c-ali1563
 =========================
diff --git a/Documentation/i2c/busses/i2c-ali15x3.rst b/Documentation/i2c/busses/i2c-ali15x3.rst
index d4c1a2a419cb..4d4f93ceed46 100644
--- a/Documentation/i2c/busses/i2c-ali15x3.rst
+++ b/Documentation/i2c/busses/i2c-ali15x3.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 =========================
 Kernel driver i2c-ali15x3
 =========================
diff --git a/Documentation/i2c/busses/i2c-amd-mp2.rst b/Documentation/i2c/busses/i2c-amd-mp2.rst
index ebc2fa899325..f63a12fdfe19 100644
--- a/Documentation/i2c/busses/i2c-amd-mp2.rst
+++ b/Documentation/i2c/busses/i2c-amd-mp2.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 =========================
 Kernel driver i2c-amd-mp2
 =========================
diff --git a/Documentation/i2c/busses/i2c-amd756.rst b/Documentation/i2c/busses/i2c-amd756.rst
index bc93f392a4fc..ce453cc5b679 100644
--- a/Documentation/i2c/busses/i2c-amd756.rst
+++ b/Documentation/i2c/busses/i2c-amd756.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ========================
 Kernel driver i2c-amd756
 ========================
diff --git a/Documentation/i2c/busses/i2c-amd8111.rst b/Documentation/i2c/busses/i2c-amd8111.rst
index d08bf0a7f0ac..e538986a9765 100644
--- a/Documentation/i2c/busses/i2c-amd8111.rst
+++ b/Documentation/i2c/busses/i2c-amd8111.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 =========================
 Kernel driver i2c-adm8111
 =========================
diff --git a/Documentation/i2c/busses/i2c-diolan-u2c.rst b/Documentation/i2c/busses/i2c-diolan-u2c.rst
index c18cbdcdf73c..f65fa375e3dc 100644
--- a/Documentation/i2c/busses/i2c-diolan-u2c.rst
+++ b/Documentation/i2c/busses/i2c-diolan-u2c.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ============================
 Kernel driver i2c-diolan-u2c
 ============================
diff --git a/Documentation/i2c/busses/i2c-i801.rst b/Documentation/i2c/busses/i2c-i801.rst
index 47e8ac5b7099..c34ccd8e10fb 100644
--- a/Documentation/i2c/busses/i2c-i801.rst
+++ b/Documentation/i2c/busses/i2c-i801.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ======================
 Kernel driver i2c-i801
 ======================
diff --git a/Documentation/i2c/busses/i2c-ismt.rst b/Documentation/i2c/busses/i2c-ismt.rst
index 8e74919a3fdf..b997b74e4036 100644
--- a/Documentation/i2c/busses/i2c-ismt.rst
+++ b/Documentation/i2c/busses/i2c-ismt.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ======================
 Kernel driver i2c-ismt
 ======================
diff --git a/Documentation/i2c/busses/i2c-mlxcpld.rst b/Documentation/i2c/busses/i2c-mlxcpld.rst
index 9a0b2916aa71..589338894dea 100644
--- a/Documentation/i2c/busses/i2c-mlxcpld.rst
+++ b/Documentation/i2c/busses/i2c-mlxcpld.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ==================
 Driver i2c-mlxcpld
 ==================
diff --git a/Documentation/i2c/busses/i2c-nforce2.rst b/Documentation/i2c/busses/i2c-nforce2.rst
index 83181445268f..87d7e05aba50 100644
--- a/Documentation/i2c/busses/i2c-nforce2.rst
+++ b/Documentation/i2c/busses/i2c-nforce2.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 =========================
 Kernel driver i2c-nforce2
 =========================
diff --git a/Documentation/i2c/busses/i2c-nvidia-gpu.rst b/Documentation/i2c/busses/i2c-nvidia-gpu.rst
index 38fb8a4c8756..5d1d0408b433 100644
--- a/Documentation/i2c/busses/i2c-nvidia-gpu.rst
+++ b/Documentation/i2c/busses/i2c-nvidia-gpu.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ============================
 Kernel driver i2c-nvidia-gpu
 ============================
diff --git a/Documentation/i2c/busses/i2c-ocores.rst b/Documentation/i2c/busses/i2c-ocores.rst
index f5e175f2a2a6..1c8c33f13175 100644
--- a/Documentation/i2c/busses/i2c-ocores.rst
+++ b/Documentation/i2c/busses/i2c-ocores.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ========================
 Kernel driver i2c-ocores
 ========================
diff --git a/Documentation/i2c/busses/i2c-parport.rst b/Documentation/i2c/busses/i2c-parport.rst
index 4cbf45952d52..f83513c47883 100644
--- a/Documentation/i2c/busses/i2c-parport.rst
+++ b/Documentation/i2c/busses/i2c-parport.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 =========================
 Kernel driver i2c-parport
 =========================
diff --git a/Documentation/i2c/busses/i2c-pca-isa.rst b/Documentation/i2c/busses/i2c-pca-isa.rst
index a254010c8055..81bf9e25c148 100644
--- a/Documentation/i2c/busses/i2c-pca-isa.rst
+++ b/Documentation/i2c/busses/i2c-pca-isa.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 =========================
 Kernel driver i2c-pca-isa
 =========================
diff --git a/Documentation/i2c/busses/i2c-piix4.rst b/Documentation/i2c/busses/i2c-piix4.rst
index 94e20b18c59a..1adaefd18f77 100644
--- a/Documentation/i2c/busses/i2c-piix4.rst
+++ b/Documentation/i2c/busses/i2c-piix4.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 =======================
 Kernel driver i2c-piix4
 =======================
diff --git a/Documentation/i2c/busses/i2c-sis5595.rst b/Documentation/i2c/busses/i2c-sis5595.rst
index b85630c84a96..e0969e5dd4fc 100644
--- a/Documentation/i2c/busses/i2c-sis5595.rst
+++ b/Documentation/i2c/busses/i2c-sis5595.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 =========================
 Kernel driver i2c-sis5595
 =========================
diff --git a/Documentation/i2c/busses/i2c-sis630.rst b/Documentation/i2c/busses/i2c-sis630.rst
index 9fcd74b18781..de95ab7b5edd 100644
--- a/Documentation/i2c/busses/i2c-sis630.rst
+++ b/Documentation/i2c/busses/i2c-sis630.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ========================
 Kernel driver i2c-sis630
 ========================
diff --git a/Documentation/i2c/busses/i2c-sis96x.rst b/Documentation/i2c/busses/i2c-sis96x.rst
index 437cc1d89588..66a0b81bb0ca 100644
--- a/Documentation/i2c/busses/i2c-sis96x.rst
+++ b/Documentation/i2c/busses/i2c-sis96x.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ========================
 Kernel driver i2c-sis96x
 ========================
diff --git a/Documentation/i2c/busses/i2c-taos-evm.rst b/Documentation/i2c/busses/i2c-taos-evm.rst
index f342e313ee3d..454e757c2682 100644
--- a/Documentation/i2c/busses/i2c-taos-evm.rst
+++ b/Documentation/i2c/busses/i2c-taos-evm.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ==========================
 Kernel driver i2c-taos-evm
 ==========================
diff --git a/Documentation/i2c/busses/i2c-via.rst b/Documentation/i2c/busses/i2c-via.rst
index 846aa17d80a2..1a0de59961af 100644
--- a/Documentation/i2c/busses/i2c-via.rst
+++ b/Documentation/i2c/busses/i2c-via.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 =====================
 Kernel driver i2c-via
 =====================
diff --git a/Documentation/i2c/busses/i2c-viapro.rst b/Documentation/i2c/busses/i2c-viapro.rst
index 1762f0cf93d0..ba2e14221e16 100644
--- a/Documentation/i2c/busses/i2c-viapro.rst
+++ b/Documentation/i2c/busses/i2c-viapro.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ========================
 Kernel driver i2c-viapro
 ========================
diff --git a/Documentation/i2c/busses/scx200_acb.rst b/Documentation/i2c/busses/scx200_acb.rst
index 8dc7c352508c..4dd042d609cc 100644
--- a/Documentation/i2c/busses/scx200_acb.rst
+++ b/Documentation/i2c/busses/scx200_acb.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ========================
 Kernel driver scx200_acb
 ========================
diff --git a/Documentation/i2c/dev-interface.rst b/Documentation/i2c/dev-interface.rst
index c277a8e1202b..1c223e361b82 100644
--- a/Documentation/i2c/dev-interface.rst
+++ b/Documentation/i2c/dev-interface.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ============================================
 Implementing I2C device drivers in userspace
 ============================================
diff --git a/Documentation/i2c/dma-considerations.rst b/Documentation/i2c/dma-considerations.rst
index 142d52ce9ebb..7caf8519817c 100644
--- a/Documentation/i2c/dma-considerations.rst
+++ b/Documentation/i2c/dma-considerations.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 =================
 Linux I2C and DMA
 =================
diff --git a/Documentation/i2c/fault-codes.rst b/Documentation/i2c/fault-codes.rst
index b0864d1268bd..a1c6b1ff4fdf 100644
--- a/Documentation/i2c/fault-codes.rst
+++ b/Documentation/i2c/fault-codes.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 =====================
 I2C/SMBUS Fault Codes
 =====================
diff --git a/Documentation/i2c/functionality.rst b/Documentation/i2c/functionality.rst
index 377507c56162..0725ec470c07 100644
--- a/Documentation/i2c/functionality.rst
+++ b/Documentation/i2c/functionality.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 =======================
 I2C/SMBus Functionality
 =======================
diff --git a/Documentation/i2c/gpio-fault-injection.rst b/Documentation/i2c/gpio-fault-injection.rst
index 91d23889abd5..f55bbfa6a6f9 100644
--- a/Documentation/i2c/gpio-fault-injection.rst
+++ b/Documentation/i2c/gpio-fault-injection.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 =========================
 Linux I2C fault injection
 =========================
diff --git a/Documentation/i2c/i2c-protocol.rst b/Documentation/i2c/i2c-protocol.rst
index df0febfe6410..254b27402309 100644
--- a/Documentation/i2c/i2c-protocol.rst
+++ b/Documentation/i2c/i2c-protocol.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ================
 The I2C Protocol
 ================
diff --git a/Documentation/i2c/i2c-stub.rst b/Documentation/i2c/i2c-stub.rst
index a6fc6916d6bc..c63869091510 100644
--- a/Documentation/i2c/i2c-stub.rst
+++ b/Documentation/i2c/i2c-stub.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ========
 i2c-stub
 ========
diff --git a/Documentation/i2c/i2c-topology.rst b/Documentation/i2c/i2c-topology.rst
index 48fce0f7491b..f6317aa82771 100644
--- a/Documentation/i2c/i2c-topology.rst
+++ b/Documentation/i2c/i2c-topology.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ================================
 I2C muxes and complex topologies
 ================================
diff --git a/Documentation/i2c/instantiating-devices.rst b/Documentation/i2c/instantiating-devices.rst
index 3ea056a95812..98333aacd492 100644
--- a/Documentation/i2c/instantiating-devices.rst
+++ b/Documentation/i2c/instantiating-devices.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ==============================
 How to instantiate I2C devices
 ==============================
diff --git a/Documentation/i2c/muxes/i2c-mux-gpio.rst b/Documentation/i2c/muxes/i2c-mux-gpio.rst
index 7d27444035c3..756e3232bf0f 100644
--- a/Documentation/i2c/muxes/i2c-mux-gpio.rst
+++ b/Documentation/i2c/muxes/i2c-mux-gpio.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ==========================
 Kernel driver i2c-mux-gpio
 ==========================
diff --git a/Documentation/i2c/old-module-parameters.rst b/Documentation/i2c/old-module-parameters.rst
index b08b6daabce9..d5678568b020 100644
--- a/Documentation/i2c/old-module-parameters.rst
+++ b/Documentation/i2c/old-module-parameters.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ================================================================
 I2C device driver binding control from user-space in old kernels
 ================================================================
diff --git a/Documentation/i2c/slave-eeprom-backend.rst b/Documentation/i2c/slave-eeprom-backend.rst
index 38d951f10302..4d4745f5c260 100644
--- a/Documentation/i2c/slave-eeprom-backend.rst
+++ b/Documentation/i2c/slave-eeprom-backend.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ==============================
 Linux I2C slave EEPROM backend
 ==============================
diff --git a/Documentation/i2c/slave-interface.rst b/Documentation/i2c/slave-interface.rst
index 3f0d320bc80a..3e30c0f14355 100644
--- a/Documentation/i2c/slave-interface.rst
+++ b/Documentation/i2c/slave-interface.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 =====================================
 Linux I2C slave interface description
 =====================================
diff --git a/Documentation/i2c/smbus-protocol.rst b/Documentation/i2c/smbus-protocol.rst
index adc87456c99d..78b3cd058163 100644
--- a/Documentation/i2c/smbus-protocol.rst
+++ b/Documentation/i2c/smbus-protocol.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ==================
 The SMBus Protocol
 ==================
diff --git a/Documentation/i2c/summary.rst b/Documentation/i2c/summary.rst
index 579a1c7df200..1131652c0403 100644
--- a/Documentation/i2c/summary.rst
+++ b/Documentation/i2c/summary.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 =============================
 Introduction to I2C and SMBus
 =============================
diff --git a/Documentation/i2c/ten-bit-addresses.rst b/Documentation/i2c/ten-bit-addresses.rst
index 5c765aff16d5..e8f4edc974c3 100644
--- a/Documentation/i2c/ten-bit-addresses.rst
+++ b/Documentation/i2c/ten-bit-addresses.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 =====================
 I2C Ten-bit Addresses
 =====================
diff --git a/Documentation/i2c/writing-clients.rst b/Documentation/i2c/writing-clients.rst
index 121e618e72ec..687f5333850c 100644
--- a/Documentation/i2c/writing-clients.rst
+++ b/Documentation/i2c/writing-clients.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ===============================
 Implementing I2C device drivers
 ===============================
-- 
2.50.1

