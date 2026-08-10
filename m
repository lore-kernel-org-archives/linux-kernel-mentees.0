Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1374282F06
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 10 Aug 2026 19:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786389713; cv=none; b=qwh6swy/fySWVkaq9r+Bvyv07iNISPO3B9cJ2XTXZ35sd6Ya5js1P0VaRFdLWVgbWYph9QMd8KpIz8bVLXuwhN/iLnYhlpnR5A+3Cthv9yJkH1a0DjQe2vAPvrgpfmzp4Ox5u4FRHhzgFd2qUvSERBj249x+uruQozZXrg2W8Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786389713; c=relaxed/simple;
	bh=uexxpyY32n0KDJ6TFBGqjZAlB3EeE5v+ilAqXIhOHwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JmS/BrCl7eI19guqGokduR23oKdnIOmgVP7N0ombrx1hmhwGThr4CGTHaBnEHCzr+SOW2n9t5aJmVsJYbC8Y9tkhg7j9wVTOWhRmlNeWD0gavFK1e7pnjqlL8mBzB6Gz+slRSVqCN2KcfRaD63FIvrWKuhVjWtDZq/fDp2xe2Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b8Kw6shu; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b8Kw6shu"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-664ce3000e6so1710763d50.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 10 Aug 2026 12:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786389711; x=1786994511; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2N7xrd0aGyVwzggneWt5AqqDVcxSb93c/y3jTFurvbk=;
        b=b8Kw6shuViOz4W7fueW6D3MY/wYIrE0UndKsb70khpLVllqd+BsuLp72vJlp83bxBG
         BBpjz7Ei6XvXiHmMR3jz2UBP2UJyf9Ka6++FL0AsWRrp6EvClBHyTsLppltXhZaFfZ4T
         9Pwp9zI7ZP3rMygmhIxCxMgIQO7rxpYYtqqvtRCIlJ5ZemOG8a/P8r2k5eK7sy4ttic3
         TOGBr2RYzMdnl4KsaoFFDjlSBeP5UZSbUIc6SqOqArwV9vFIvjXodNXk93+FxaLy1Yp3
         ph6zScdsIcgtXUX6Noq06c5klqfVvIfE/s3AjruqiAxoZfIDpvfQZXbCUO8Jcw2C74Iq
         sg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786389711; x=1786994511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2N7xrd0aGyVwzggneWt5AqqDVcxSb93c/y3jTFurvbk=;
        b=MdT+broClMqfLO5+kuIQIiVjbywRAo3gGzEqrv+K6vE5qV6s0FNmriuNg4iygmLub2
         Owkt3IWxY+0GtQXDh6V4eNC3ihvASoLdpgJ7LT0gyStZrpb6+hp04tbvKhQX60k0kyZl
         8raBueQia9ioY5y/ky8jnhBPaAaD5dDmsDVNc0SGjmmpLDKN2SwLlLVIPNgQApKCOG8t
         s+xrZi/+CHUpaXd0iX1zLP220wdLqWkzWqmCGa0XGrcC7LOZ+9vGYO3mgL8l+fdDOqjT
         6tzFP3JrvqdMHDT3SutcLj/m/lkaxhC6Q4p4OfmbD1WvCMBlcCOjaqO0+RImtgbGdNXJ
         W+Gg==
X-Forwarded-Encrypted: i=1; AHgh+Roz/OGQWp0BLjBIvzM7vGgRccU0Wk03+4O0wBiFuSDJYwhZnGnqsEz+OgcBiIudHl5aFpGS10A0gGyGlMHbmMQACk8rMg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwdElvG7PaSmkojWiJLx3b4wz4Etq+e5ZZCRl4lGZs2ujG0awKo
	jDb+fU8AEtm3kjLqhEsYgCtT6FcLq6O9rhjAlr0AnbO/aGFwzFgaiyZA
X-Gm-Gg: AR+sD11ShAI6ENQuQkK/dZkWMx/29OwEP8d7/1rdBALbZwynhei4jedoB637w49ywWQ
	+Zf8vmCz/KsaYwN5rk5KbAXfex/shsrWRMh0V8V7FLVWYpazELVyPb4E1x3Wz4AFlq9VI0Ca0lF
	ExK9ZrEQ20Yp1tuRXyCxIfT7r+bQ96vqjH+Iczy2US2nzEozgcfwOg8NNp5SlCKQX0Dr0sBe17A
	js7C5FzILTXdgmIWAMdDCKkARw7AXjxw3MfFh917FyrUXv5PbKdAGc/km8e2qZGGw1rV8mtx/gw
	jFpbik7fgopWuHPA1Yimthly3315Ga2X/yJguqePphX3+i/ll3zN0WfttwlX9C6XsFduVKFpGxp
	unbY8Qj8i0zrymHoUG/v6wBLH4595X/Q0MEeakQS+nNnckLvIybhHkwtDeolkwYh786K7M3c2rG
	5s+jEGxL6ivPhY6VOW72+SrUsLWmqI0gQLdcpG7BByGnrMZsnt8VrBneljR+EGuNFK59S404FLC
	dwU81Kdm67p1CTSWornQ9c7FRESBNOL7qjpMVn6wlw=
X-Received: by 2002:a05:690e:441b:b0:668:8b3c:77e6 with SMTP id 956f58d0204a3-66acd2f1fcemr10753609d50.26.1786389710698;
        Mon, 10 Aug 2026 12:21:50 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:5c54:b9f5:beef:8bf4])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66acafa90basm6928863d50.16.2026.08.10.12.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 12:21:49 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mranostay@gmail.com
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-kernel-mentees@lists.linux.dev,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/2] dt-bindings: iio: proximity: document LIDAR-Lite v3 fallback compatible
Date: Mon, 10 Aug 2026 16:18:41 -0300
Message-ID: <20260810192131.153495-3-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260810192131.153495-1-rodrigo.gobbi.7@gmail.com>
References: <20260810192131.153495-1-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PulsedLight was acquired by Garmin, who now sells the LIDAR-Lite v3.
It is pin-compatible with the v2, and the driver already matches it
directly: commit b257c1a45e99 ("iio: pulsedlight-lidar-lite-v2: add
lidar-lite-v3 property") added a "grmn,lidar-lite-v3" of_device_id
entry, so no driver changes are needed here.

Document it with "pulsedlight,lidar-lite-v2" as a fallback compatible.

Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
---
 .../proximity/pulsedlight,lidar-lite-v2.yaml   | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml b/Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml
index e19c8d166b81..baae9bf20a30 100644
--- a/Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml
+++ b/Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml
@@ -4,14 +4,14 @@
 $id: http://devicetree.org/schemas/iio/proximity/pulsedlight,lidar-lite-v2.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Pulsedlight LIDAR-Lite v2 range-finding sensor
+title: Pulsedlight/Garmin LIDAR-Lite range-finding sensors
 
 maintainers:
   - Matt Ranostay <mranostay@gmail.com>
 
 description: |
-  This binding covers the I2C interface of the Pulsedlight LIDAR-Lite v2
-  laser rangefinder.
+  This binding covers the I2C interface of the Pulsedlight/Garmin
+  LIDAR-Lite v2 and v3 laser rangefinders.
 
   Besides I2C, the mode control pin can also trigger acquisitions and
   report the measured distance through a PWM signal, without using I2C
@@ -20,12 +20,18 @@ description: |
   remains the active interface, as a plain status output signalling
   when an acquisition has completed.
 
-  Datasheet:
+  Datasheets:
+    https://static.garmin.com/pumac/LIDAR_Lite_v3_Operation_Manual_and_Technical_Specifications.pdf
     https://github.com/PulsedLight3D/LIDAR-Lite-Documentation/blob/master/Docs/LIDAR-Lite-v2-Docs.pdf
 
 properties:
   compatible:
-    const: pulsedlight,lidar-lite-v2
+    oneOf:
+      - items:
+          - enum:
+              - grmn,lidar-lite-v3
+          - const: pulsedlight,lidar-lite-v2
+      - const: pulsedlight,lidar-lite-v2
 
   reg:
     maxItems: 1
@@ -56,7 +62,7 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
         lidar@62 {
-            compatible = "pulsedlight,lidar-lite-v2";
+            compatible = "grmn,lidar-lite-v3", "pulsedlight,lidar-lite-v2";
             reg = <0x62>;
             vdd-supply = <&vdd_5v0>;
         };
-- 
2.48.1

