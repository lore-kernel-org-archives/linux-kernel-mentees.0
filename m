Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B9529DB6E
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  8 Oct 2025 03:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759893499; cv=none; b=Xr7kG7+qMn2rn2Oyua/VKq8uYWYt2oDVHnBDryWjjwy9kKYFJDrMjM366K7E7eXbg1/isXEf8ucZH+CpKCavRiOC/7ksgopNer96rRyf34d3Ye2gl6bb09WzgFGVkJBN5AOlwif84uv4NRcVt2iMESi7wWyYnEcThU9atIoMw0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759893499; c=relaxed/simple;
	bh=w88O91l141EF9mRTJr5gYUX1SUVp35Zw9XxJTz5LQBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TFaL9XOM7JcsrgfzCIbnQ55Gy+xTQk0cJMDrg58xwopGbwGz6rfKnE7YaHvOEigGYaMvKQre58f5tbWvxyoJZO5/+a19hFwXRT11FjHv2+27oFVgzkW9OXJwTLwFkx3X06yTIm8Ay/gWJ1AfD1Kvna4ZXLasU5SC59IPUP4HIbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cLK87hvj; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cLK87hvj"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-781ea2cee3fso6705901b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 07 Oct 2025 20:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759893497; x=1760498297; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BlQFQcawRFMEewIt0bOgUlauxcu0MJP5hQDoYscvOlw=;
        b=cLK87hvjMYiURdamqrl9VFzZ9a+GO3UDadTgQ8TKFKqcx1WUITQsXTXR9peMdP8JMH
         TODNr6VADdguiX4wNaGuiU6xs7wufxndCyvDa3p/xqOAcw+9j4d3sZ/llaFqNc8YHMsF
         YqCwCT/XR8aaGGoL8zXkRRVNf/DL0FlGhXQcEmPquZGavFOwjOSEb43ESgS0qOIpa6Ss
         kMXyxJOxHWapv+lIjhsgsqP7vcp2bCV9AD7wr1MUojZyHiyqJQiNfPXypYMAitBxnTjG
         3AxqDtqI1tYJBQCsVU49dtDgdl7srf6DBxtcr/60HbLzsFkNTG4lkuk+m5EBHazEHEPL
         QCRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759893497; x=1760498297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BlQFQcawRFMEewIt0bOgUlauxcu0MJP5hQDoYscvOlw=;
        b=vBSiGoXedonDh4XLvpPc5frjbJ/djhqRaMdtYWdlMzEAUOpaLHhenJpQMXMSdL5r6o
         2JZHghHUAtR6roqwSRUrcIjBTVwp0avB3SiBuWQqtaV1/nPQ9eMEuo+TSKIsGU+cmO1O
         fOwvVMHJ3+ZFufaxCsukqg+ceIOIWAZPwXIksHaoF5YoaBpHQat+8y6M2cis7cGYd/xN
         Gr9FI5VMgEPJ6S8tsn8kFk22NYYbh9IeAlSiS9eBFw3/hpieG4BK7Fcec1WyzF1x1uhI
         jZcb+YhO4a2u3KKVt4JrdbN4rS3vJ0kUNPHERXxUDjwfBiGzHXmoppPkIn8lyRfYkrmr
         R8Xg==
X-Forwarded-Encrypted: i=1; AJvYcCX5M/apExfaLOJ/DwxmUCLYb5zMBcp6JxixicictwwZ0DJKq69EynqH81e8xACUt0WdRLpwai2OfzN6BcgftCosRGjjzA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6HDUV+V84t/mmrERmR8aN1Y6j750Lp7nL3LwkI8D+EusmRqaa
	0EIDIfos7QIVWw4N0vcYRljD1HLqLbSt7r1TZv6JiUsKoUJFvaNVLU9J
X-Gm-Gg: ASbGncv4eWPwa4B7DzDwb2NYGG46kUK4ypAIRexz96ZRrEZjXF9inDt8KH2x0zx/E+z
	jmCEF5otPbzXamW77zRMK4Bp036x3X/sby/KrVqA26ep0Eq0N1/CiUZOZ3CUaT9g1zNFbDZyMMA
	j5FyYz44W70fLA/s+VPLFwbnXFN0ElqtZJn52o+g+FDZJ3Ycbsfw25gp+BfwXpWMX+eJjOgAauQ
	MwdMwfOlwzSlnx+z9IO0oRFv7+e78n9C1aBjlqbt7iUy+7yJqRLJnfML1g0cZX31pZhr6ID5KKI
	c2ftfRByBHx6LadYEF4ODtLVAB5QCvno52N8mS7rxkzjGwdMD8KHUq/dLanooGYcP3xyxQeiY4t
	t5b1UGOvWlXvIKdevaGRx+ephMvHn5Q+22jvNA/HXe+ved32Frg==
X-Google-Smtp-Source: AGHT+IEeKJ+xs0GcbSYEkaMOoq4ZNzOHvQx0Xbcrl6XMXjx/qanyX4b6zdbK6WVXlHpUCKR6ek6s0w==
X-Received: by 2002:a05:6a20:a103:b0:2e3:dd60:913d with SMTP id adf61e73a8af0-32da8163cc9mr2183530637.21.1759893496900;
        Tue, 07 Oct 2025 20:18:16 -0700 (PDT)
Received: from Ubuntu24.. ([103.187.64.31])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099f5990csm16527746a12.38.2025.10.07.20.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 20:18:16 -0700 (PDT)
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
Subject: [PATCH v2 1/2] dt-bindings: iio: max30100: Add pulse-width property
Date: Wed,  8 Oct 2025 08:47:36 +0530
Message-ID: <20251008031737.7321-2-raskar.shree97@gmail.com>
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

The appropriate LED pulse width for the MAX30100 depends on
board-specific optical and mechanical design (lens, enclosure,
LED-to-sensor distance) and the trade-off between measurement
resolution and power consumption. Encoding it in Device Tree
documents these platform choices and ensures consistent behavior.

Tested on: Raspberry Pi 3B + MAX30100 breakout board.

Signed-off-by: Shrikant Raskar <raskar.shree97@gmail.com>

Changes since v1:
Add unit suffix.
Drop redundant description.

Link to v1:
https://lore.kernel.org/all/20251004015623.7019-2-raskar.shree97@gmail.com/
---
 .../devicetree/bindings/iio/health/maxim,max30100.yaml      | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/health/maxim,max30100.yaml b/Documentation/devicetree/bindings/iio/health/maxim,max30100.yaml
index 967778fb0ce8..5c651a0151cc 100644
--- a/Documentation/devicetree/bindings/iio/health/maxim,max30100.yaml
+++ b/Documentation/devicetree/bindings/iio/health/maxim,max30100.yaml
@@ -27,6 +27,11 @@ properties:
       LED current whilst the engine is running. First indexed value is
       the configuration for the RED LED, and second value is for the IR LED.
 
+  maxim,pulse-width-us:
+    maxItems: 1
+    description: Pulse width in microseconds
+    enum: [200, 400, 800, 1600]
+
 additionalProperties: false
 
 required:
@@ -44,6 +49,7 @@ examples:
             compatible = "maxim,max30100";
             reg = <0x57>;
             maxim,led-current-microamp = <24000 50000>;
+            maxim,pulse-width-us = <1600>;
             interrupt-parent = <&gpio1>;
             interrupts = <16 2>;
         };
-- 
2.43.0

