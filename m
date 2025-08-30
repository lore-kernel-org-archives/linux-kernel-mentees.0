Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9682D9EF8
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 30 Aug 2025 18:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756579398; cv=none; b=Q5rU5N4v5EDRQurs5AZVZAN1Ykd0eLBORztc7lO6I1FlsyhlkdQcO++yCEGEYldKXe+SBCJ0Pif46WWOWX5t0tV4W6qt83mq/ICE1IfShTXV9U+oFljyonZHnHj8/UFsUxzXs05seoLHnvqNQ0jX9NhuVPTV8E+H/BAMTdORcBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756579398; c=relaxed/simple;
	bh=oVbXo+WlMRVlhb0eRpFRU7JepS0fcP7SScAWqWR1jf8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H36qUCEGSZ6SPgcFq7BwajNFdkDJreX2IgsecVpRzoJPnr0XX0KDncMassAFnEsOkDHoTGPZpmIcFAyxn6JhN2mKo/0i9bOGKSHxPA5v5fvrDU+81TmdOTj0muHTAsQE4WMuaewimBDq0qQ91pcllR942D+yI/Ll0a73RuJyc4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJ5fP9dd; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJ5fP9dd"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-248a638dbbeso28066025ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 30 Aug 2025 11:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756579396; x=1757184196; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zk13z4Oe3MH+BwozPqkdTJOMupLgkm8t2078zZl5Y1c=;
        b=nJ5fP9ddHYeS//LyGZnb8OJREKLfDn0Pv0futtxWJM/6Yn4qNR1XUdtrcr14jmB4Xt
         X4h9/l0JFE02nwbEfHVjhJfcHfl9/VsBcgDP9+UCEGSvhFgWqZSFzMDsUcGFdCtcnYif
         0zBPml4S/hOp+2bTSKgqJaUCbazJ6IhEO+1Jh1BGuaQfsabSqHXHCA8x1/tgYZhFhYVg
         POWF+JsO7bFpnY3ni4Zg3DAGndYiL+PezAZQtrfhsUaSQ+2ch/Mk9sMo6kbwMQSWtNku
         NW53WK0DQGWVBFV+QH4Nt+PEbLV20Jzw0ijFQGigKffyPjzS7NQRxmoLNJvpbUn4jh4f
         VAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756579396; x=1757184196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zk13z4Oe3MH+BwozPqkdTJOMupLgkm8t2078zZl5Y1c=;
        b=s947gd/r8u+C+xBijxru/joCuVz0EYmCcTNgY0w0p7ofdqPuerxsijAXzmimEDBulx
         hfEwxLgpeK2EdnwmTf5r1lTfL7bvEK/UUQgQJ6piZYT0Lnw9iGYby7MEPJ+IwB9KpeUE
         9l/jw+RPqOwz9YbvEbaqtNxkZ93wResR0sfni6AaA5iQprWyUgxgY4xR9k/Y6b6yEIdA
         aknezjL4DPKU/7qa1RP7eveGm5bgrmFNYED/NXyL5gxRTHjFjXPLLYfJglpDeyBK1hqA
         1q0QIvb4RWIn808JcuVPtndX9Ibd4D/Sv2tj0S/LCA4/mscPRrDJOhLcQIbm09Gjoj/h
         d15g==
X-Forwarded-Encrypted: i=1; AJvYcCWnPW5LOCshlKoqtPSdiMGoVvXKgs9j0RXFl39OEbgUdMwcfWD80drq2IWjOuScs1UMYz5CFEp1XOiwAHfZ6gfwLRunDg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxTQurK8e1ro7+/ic9xNSLLD4cTT2k3S+szWqqt+A4Is3oDYeXb
	ir3qBMsEBRa9dksLKoMD69yySvPKOS0usSF+6NXfh9xhM91CQu1l8Cg0NGIhOb8S
X-Gm-Gg: ASbGncsmpyJnPJFjMxmq8LlSp3m21yg13FOmRUnzbkU5qKMeaFxcuxNpcayLweoUo9C
	fJyEqCEiBCOSPgtubERRGBWf+delsq41F3YcosAOlX/CktsWxUWkQn4hEGxOIugn19c/3T4XY2J
	H8trrZeh4v1lmt2ham2MgjlUbLPsINNIB8PcR9qxLkTQfY2G7JA7/stRvzcyyn0A2Cm9IVdpcKV
	GVnZcdjcfuskIw5DBpB6c3EX++JZp3C9j55F43UcJoAza4Njn0pad1e38zfVfG3nXlO4AZDVZkp
	pTk2gThTEoyBp5QioOP4IMR03iKPSINpDW3JGoxI9ewl94GuJDyUYhfR4VSSLcy+CxN5GjCnKZn
	YJHeXheuuVWrSuex5N1rZ+dx16z+AyBKBKd163A==
X-Google-Smtp-Source: AGHT+IHiAEKzjNZ893PL+wikbfz76WmuOnADXgWPN/rVP9WwwZX/uNaqkN6hmqwjlZCMidnBEi0GKw==
X-Received: by 2002:a17:903:32c9:b0:245:fa00:6e25 with SMTP id d9443c01a7336-24944a9bebdmr38079485ad.28.1756579396315;
        Sat, 30 Aug 2025 11:43:16 -0700 (PDT)
Received: from [192.168.1.19] ([122.177.240.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2490658999fsm56821665ad.112.2025.08.30.11.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 11:43:15 -0700 (PDT)
From: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
Date: Sun, 31 Aug 2025 00:12:45 +0530
Subject: [PATCH 1/5] dt-bindings: iio: imu: Add ICM-20948
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250831-icm20948-v1-1-1fe560a38de4@gmail.com>
References: <20250831-icm20948-v1-0-1fe560a38de4@gmail.com>
In-Reply-To: <20250831-icm20948-v1-0-1fe560a38de4@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, shuah@kernel.org, 
 linux-kernel-mentees@lists.linux.dev, 
 Bharadwaj Raju <bharadwaj.raju777@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756579380; l=1510;
 i=bharadwaj.raju777@gmail.com; s=20250830; h=from:subject:message-id;
 bh=oVbXo+WlMRVlhb0eRpFRU7JepS0fcP7SScAWqWR1jf8=;
 b=cK6T2sOCnhY+6oWzEJ29uRSw2k4Ip7H30NUZdkO1uKtolKDKWb1JA+B5ESNnIftxn5E/mXNLF
 yAZf5y3MDa0C/bTJ/mgzQvpNozNyUeurGMUf0YjbhPVzx0NYKEeSxlz
X-Developer-Key: i=bharadwaj.raju777@gmail.com; a=ed25519;
 pk=s+pP76EgUCC/7pyu4E6Q5AizWQ1T6hUf1jUWrQRl040=

Document device-tree bindings for the InvenSense ICM-20948 device.

Signed-off-by: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
---
 .../bindings/iio/imu/invensense,icm20948.yaml      | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/imu/invensense,icm20948.yaml b/Documentation/devicetree/bindings/iio/imu/invensense,icm20948.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..00c8210a0285972f8084137c69a4618a1f674485
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/imu/invensense,icm20948.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/imu/invensense,icm20948.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: InvenSense ICM-20948 Inertial Measurement Unit
+
+maintainers:
+  - Bharadwaj Raju <bharadwaj.raju777@gmail.com>
+
+description: |
+  9-axis motion-tracking device that combines a 3-axis gyroscope, 3-axis
+  accelerometer, and a 3-axis magnetometer.
+
+  https://invensense.tdk.com/wp-content/uploads/2024/03/DS-000189-ICM-20948-v1.6.pdf
+
+properties:
+  compatible:
+    enum:
+      - invensense,icm20948
+
+  reg:
+    maxItems: 1
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      icm20948 {
+        compatible = "invensense,icm20948";
+        reg = <0x69>;
+      }
+    }

-- 
2.51.0

