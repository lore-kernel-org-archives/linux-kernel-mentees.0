Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C61713C3F2
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 12 Oct 2025 17:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760290262; cv=none; b=hwuIYLj98gY/z2yhvrgi7EVOokYaDvVBE7x0HmrX4ai8bsxh3GMEt/eZRLtkUnxn9INUMblMuEBTz4eXqRNvDqeVOI7gorHKPoS969EDx/pc2UEYsWawQoaNzIfaQl5qMDypprbxKdFkVAPe11PewilTALQiQBsDuvw85fYebPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760290262; c=relaxed/simple;
	bh=ARkCzPQRazCvQ8f08+IPMyTBKBhnxWBajxH9X4PKlgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T4/N638dM5BzyVGXiVc3Udr19ag+OnBt6Au90kbk+fZ/B/bdzvWpHo8nmSIBz842IyrjX3WXzJhhJoN5D9sA4Qonx/u3Z16H534Y0C0tJ3t0Rrl0rCg4Ux9G1Zdgc01IpMhMWwvmRT6xCXbAd1dPdemqpErIRBzQqJdlq5Q/oPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c6Xu3DF9; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c6Xu3DF9"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-793021f348fso3104281b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 12 Oct 2025 10:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760290260; x=1760895060; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJi/0aYLKJUb+ptER4OpoR5lNkPbRGPGuiPKjV49HE0=;
        b=c6Xu3DF90sh+f0NVka8GUGlBdS3g69E9d45MvfUyfLEli3NuTN/8ck/7xkjClZhtNc
         qSTOt0yWneTfPOYaiGkK34LNSEvEVxXdJ6q5vvKXY2LNeRi3uMLRYrcXyjX2J830CsHV
         wy0XRNKNsM9y7sPvT8v5VV50jXZGUfp4dxcFniyUTEBmrrC5LpEAzMBKR2SGPPDpsOoe
         wCVVy0oOliqMZ/J/BuWWq5LTaZKxczQ3vA82Fjv8TfCQUmvUGHkV9rinsRJ+hLUW+SKX
         OZbZzxRCGtDm7mjtwFxLpmQ0k9T605WSb/eH7XIyrzBzPsmjchkFFN/LMAllWLx62hPF
         znZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760290260; x=1760895060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OJi/0aYLKJUb+ptER4OpoR5lNkPbRGPGuiPKjV49HE0=;
        b=xNY3nyWuLAbZjqQi1eFQrC1yHPE1wblR1F19W/9OhlRXCMo7MZSIA6AbpSeAB2+1oP
         ryXoIQTN23sw5HlZI2CIiScOhIy5URP7ddOaX2O8RkPTLyG2siM4tdZCNHzuP9/pCFr1
         f57A6n/zYuxWwBF7eXvrqCxeDCh2gGyCqM35gbwt6X7K+M5ZbEq9eotZ/2Q2rbom34sH
         Fhe3rxgGHCU5ApAHpMEmQmq5xnon646a1AQ2llILzsaMXf+FRfXlbqODU6pJVng4B7yU
         7cnujZORpzW9mRaUXq9AahgtneT13fZu5cX9f9cYbiA1I7CceGD0uKCIqrSv/QAhHqan
         rtRw==
X-Forwarded-Encrypted: i=1; AJvYcCXvX4Iy6wcFYtOoKkz7+wujTcLMqXCTc+JTi5o/enTwNioebOtFg1+kuiFpNAOi89PGSqnnaVXv4N8wnWOd22M5F36Zsw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxA/0geXLZAq6sUEDv6H/rrBa/CGsWRLapt229x7viQdm+eInR1
	EYIp68/yGNQ9s97M7ib+3aP2R5we2Jxwbah54dMvmE76/3rmx+hPijan
X-Gm-Gg: ASbGncsacAw1fTSz/oAPZ5r/VqxQ2NSlpyKMcPE8FTMxtkmU4MVYtUuPNgbaLPAUWqS
	X+u+au2Tc3f8GvoO7SnR0xx5yk9Na1pLQf0hI/yBVWOJum7ASyA0cYDsUMetmomAyYoDO5JP2kv
	QyQXZI8jcQmdmgo3rQDrFL60mRuFPjWf5X6qBrnMOCxaEvsRdrGsgsXshkw5k1UW9sRnWCUYRu+
	6h4LcPnSkmvq7fqJS5ufvQ888zOValQSwyNb1Mi6NmTrJHNsb9WkNowgzJOq9tmh1arCK2Yoors
	kV9AW12Q7YL9YPXubCCjDcjGIZJMKaiQ6IZfBfG/X9o6hx8fs0NxtbJGLbRCT2xAdu8+pdxDfIq
	yntSUcI6e8BldD4vNOx9gYBUEvUsGiV4p3z2nNq95h5wt
X-Google-Smtp-Source: AGHT+IH6WVw6lNFlaFo8leOVXftMalOkuj/RAP/gLjDml0YRSInreJYPwyeM+ctX/cJcQNamB4qqpw==
X-Received: by 2002:a05:6a20:7d8a:b0:263:4717:53d with SMTP id adf61e73a8af0-32da84627d3mr24963297637.48.1760290259711;
        Sun, 12 Oct 2025 10:30:59 -0700 (PDT)
Received: from Ubuntu24.. ([103.187.64.31])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d09ace5sm9030616b3a.53.2025.10.12.10.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 10:30:59 -0700 (PDT)
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
Subject: [PATCH v3 1/2] dt-bindings: iio: health: max30100: Add LED pulse-width property
Date: Sun, 12 Oct 2025 23:00:34 +0530
Message-ID: <20251012173035.12536-2-raskar.shree97@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251012173035.12536-1-raskar.shree97@gmail.com>
References: <20251012173035.12536-1-raskar.shree97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LED pulse width on the MAX30100 sensor determines how long the
IR/Red LEDs are driven during each sample, directly affecting the
emitted optical energy and hence the received signal amplitude.

This parameter is highly dependent on the mechanical and optical
integration of the sensor, such as:
- The type and thickness of the optical window or lens covering
  the sensor.
- The distance between the LED and photodiode.
- The reflectivity of the target surface.

For example:
- A smartwatch or wearable ring with a thin glass window can operate
  with shorter pulses (200-400 us) to save power.
- A medical-grade pulse oximeter or sensor mounted behind a thicker
  protective layer may require longer pulses (800-1600 us) for
  reliable signal amplitude.

Because this configuration is determined by hardware design rather than
by runtime conditions, it is appropriate to describe it in the DT.

If not specified, the driver defaults to 1600 us to maintain
existing behavior.

Tested on: Raspberry Pi 3B + MAX30100 breakout board.

Signed-off-by: Shrikant Raskar <raskar.shree97@gmail.com>
---
Changelog:
Changes since v2:
- Fix DT binding schema for maxim,pulse-width-us
- Remove maxItems
- Update description with additional details
- Add default value to specify fallback pulse width when property is omitted
- Remove redundant changelog from commit message

Link to v2:
https://lore.kernel.org/all/20251008031737.7321-2-raskar.shree97@gmail.com/
---
 .../devicetree/bindings/iio/health/maxim,max30100.yaml    | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/health/maxim,max30100.yaml b/Documentation/devicetree/bindings/iio/health/maxim,max30100.yaml
index 967778fb0ce8..d4753c85ecc3 100644
--- a/Documentation/devicetree/bindings/iio/health/maxim,max30100.yaml
+++ b/Documentation/devicetree/bindings/iio/health/maxim,max30100.yaml
@@ -27,6 +27,14 @@ properties:
       LED current whilst the engine is running. First indexed value is
       the configuration for the RED LED, and second value is for the IR LED.
 
+  maxim,pulse-width-us:
+    description: |
+      LED pulse width in microseconds. Appropriate pulse width depends on
+      factors such as optical window absorption, LED-to-sensor distance,
+      and expected reflectivity of the skin or contact surface.
+    enum: [200, 400, 800, 1600]
+    default: 1600
+
 additionalProperties: false
 
 required:
-- 
2.43.0

