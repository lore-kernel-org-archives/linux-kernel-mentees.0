Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA7F2C21FD
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 19 Aug 2026 20:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787173095; cv=none; b=EMbRANWa4F4MpYY4UgPB4AWAFdmeXr2f4a2oAZhJqUTwZiKgihPFjl0A6lwIJdgRKdKORj2nUrBxZfC1MBMRAQdr9uvk8Cb7txd/WNYZBg7iNmGtswk+GyRwaD7zGMY8mxjCGirrFMLH9UlMowrzuTmkR5pvitJd1JmLsdUPThE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787173095; c=relaxed/simple;
	bh=4yOAcHCi9um0K8UTl3s2TjwG/mb+CyVD7wWEW1YbriM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lij24Eh+PDsI6IjPsol6KeFk4dfIvS2CwzREt8EsEvrfWZD0gxD3GLMgAcP45lrN1pHl1vVj2SH6Qxmhvj+I0ZVa5ux0X7St79lnWtB3zkZFAa5iRJ8SmgcrKEJsECB/nWNpbDx2lGHSGemGcyzH9lLdT033f4XNeyRuRYQ07sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MCh8S6BU; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MCh8S6BU"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-73b909fbb6bso984759137.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 19 Aug 2026 13:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787173093; x=1787777893; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=58Z3XVoKaJQbEkvkG1Y4mEaTnnepGYJ8EOpBbp+pok0=;
        b=MCh8S6BU2SpbpRo0rt+rm2GpiaQSWlv7ucorSY7JDUybtWMnerm3DtT3HTBmgZWKdu
         mQXmFAHrAIB5PJFedbiTrkjmPvTepN665kh/FTH2rfoN6mQVRSQv5dzMQFJecEElRgHd
         KEJIk91zc0B0TonSxCFatyrIuQr1vL12h0lnlWp/9L8KgspUU6XTdRJI7W1ojDUZZP6k
         4ISJMz2wNstdWcWF6bwR11A90bEMFudQ1iTRoLhltIV9Be+UTL/peAlPnLGoOrWjGmpY
         iTMI/89q8byo3FEOi1AbZSYVdeXYAtoTHLH2/WZzDuQfOOGPk5q+e+u8teXjE6rMk+Qk
         FwYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787173093; x=1787777893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=58Z3XVoKaJQbEkvkG1Y4mEaTnnepGYJ8EOpBbp+pok0=;
        b=MnBe5+EWZi0GOYiXjacLBmg+xGrEHgRq5UBDGqopjynUfotDLO/vVIxwvc+GfDO7cb
         OWEcOM/tWI/OTgzaiDqxXKa4S/lA5ENXIjTfkko1kMVOlo2sbd7tBzOFAZO+hgHhhBjY
         KFvXb15rK88i1tz+1MHPGKLQfu4ysWhBv9/DSGzGD0ksfDcu02WaPZtKty3DaCZhmsXv
         N0GLAWFve2l8DSFJBwLWoAtwPef4jTbPyErBVY5eNVU5juJCOXLKzatlxIsdnaoNeoaW
         2FLryP1THUuoQWSxuMTwbEXtdomQXmIbTrDKy66KtP+pLySDHuXqBU90GUL9QHABRdDQ
         nFAA==
X-Forwarded-Encrypted: i=1; AHgh+Rq72Hb9lJsUlvSwKT5/7rkOXlEnr/4bL5LLqzHBfR8dMwCR5etewI+rS8AJsbR+KCg9y50qNmplxwsBMUDboIkja8zu+w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5Mm8Lf8Qwj0EP1XusImv7cSE2I8I+l5Ybvj44rTdcmctbLIb7
	mTvhVqWsQWJKzcNQiD65B4Xyt8dqu765mFzy0SBzSW7hHYYs6nd+31GM
X-Gm-Gg: AR+sD11fvgqhRYitYb1lnNp4Cnv6WC5h/31s4+CviUntA5DXoPKPSUaQXUipkKCmo4j
	/aFLfFg8GB80BMDQf/cymO8JnQSmEIZoRjaRrRR1/dU+F+yL7O5TtWX/px4U5kExb2TGKJ/joAC
	6Itrh+oFRy6cNBQvH8Xfv/7tlAvrxb1m3zpYMIO4P1j3zTcPZ4pIm8kSToIM6NEtPEFzuLK9k04
	wCBA7sbG6NA+2AbqdBXrrvDe9DVsjfBI6vRbIN1RrhiEL/m71MTymjqD4zskItJKLyoncX0Du0t
	MgZKmoREO62N4mCW5i6p4UfSL7RbBGe8tgmF6XSQa+ppiextrdh4voF5u7JojQReJMytGtXbGhB
	hau1eG6yitm5OuB6qA6Ul86ps9DpmmSjpllfXrGJVue/opu2vgsJxN9z0O/84JqbTzVcwAamIbB
	pjnpQsJxpWpgQxDFTbjJlyaiau9VpA0rw7Hp2RwbIU43AFDZ4ToiAf+a90BBAR8ZeGya8eH33Gx
	i2Z0VopwGp+tbOXWZinWH/G3iY27fEx/gMeoV4SEnPL
X-Received: by 2002:a05:6102:6ce:b0:738:fd01:5b60 with SMTP id ada2fe7eead31-777f897904amr3350181137.3.1787173092636;
        Wed, 19 Aug 2026 13:58:12 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:3443:53b2:2e07:b3bf])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-777ddc844besm3616259137.11.2026.08.19.13.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 13:58:11 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matt@ranostay.sg
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-kernel-mentees@lists.linux.dev,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/2] dt-bindings: iio: proximity: document LIDAR-Lite v3 fallback compatible
Date: Wed, 19 Aug 2026 17:55:18 -0300
Message-ID: <20260819205751.166030-3-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260819205751.166030-1-rodrigo.gobbi.7@gmail.com>
References: <20260819205751.166030-1-rodrigo.gobbi.7@gmail.com>
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
entry.

Document it with "pulsedlight,lidar-lite-v2" as a fallback compatible.

Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../proximity/pulsedlight,lidar-lite-v2.yaml   | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml b/Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml
index 491960bb3a0e..dd739319b9eb 100644
--- a/Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml
+++ b/Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml
@@ -4,15 +4,15 @@
 $id: http://devicetree.org/schemas/iio/proximity/pulsedlight,lidar-lite-v2.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Pulsedlight LIDAR-Lite v2 range-finding sensor
+title: Pulsedlight/Garmin LIDAR-Lite range-finding sensors
 
 maintainers:
   - Matt Ranostay <matt@ranostay.sg>
   - Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
 
 description: |
-  This binding covers the I2C interface of the Pulsedlight LIDAR-Lite v2
-  laser rangefinder.
+  This binding covers the I2C interface of the Pulsedlight/Garmin
+  LIDAR-Lite v2 and v3 laser rangefinders.
 
   Besides I2C, the mode control pin can also trigger acquisitions and
   report the measured distance through a PWM signal, without using I2C
@@ -21,12 +21,18 @@ description: |
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
@@ -57,7 +63,7 @@ examples:
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

