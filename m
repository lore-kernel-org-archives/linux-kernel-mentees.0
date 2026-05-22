Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9D238C2A5
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 22 May 2026 12:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779453266; cv=none; b=gWoF670gMxb2x493/DZZZljRzPdAbBpi7CH3ZpGd/4FDsW50aNF3RFI22YnJ6nAyWsJ+JfczRsd5y02eFVO6gdc7SEen0ElcP4SxHIIcK8226jEN7xSLwqh/DRhkEqTx3oI2TBF536EAw4PBV7x49leYdCeQLXvL/RvxWHC/95I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779453266; c=relaxed/simple;
	bh=upzag8qhKi6aKvj4oazaakxR+C2DYD1uVCnLUQ1r2A0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nW1iMKUeczdxDN6muQwbH89PwSplPEO5FIAfkURb7NWO9J8gY1H1HWA13ywBIy68iVkXRuvqYwtx9VBKGYL/tl4lsOdf17UpUFkwTLxF/da9RFPU43ZTEf+Ypc/zg/PtbFwjByX9tLXM3FRZ+ObC1YInGp/zrj2yTLAGeAADJWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mq57w515; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mq57w515"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49041e84237so6929605e9.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 22 May 2026 05:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779453263; x=1780058063; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2YX8b4V19qziyTb596TiLv9FQnlA5Iy1jj595uzVils=;
        b=mq57w515A0gWKFSfhypnHdt6XFfhtJ2kXID0IWpH/KH+J219R5ry38qGlFKavq/CU3
         AcXF+cS4m32Sm57Z1iAuD66yFLUVs49N+8q0reAUjm73cx1YZgaog7ExD2ERCV23yeBB
         jgq7mBZckHbuYxbx+xYnmAQWK81HVoRhcP4QxKkTpTFkYihFL36rgBbDPCSeZaTtJZvU
         pwtSU81GlU7YWVB6w/iHmeb2Gdn+iLJvxpbHDEWnPIPmeuqlxNOkK3Nz8uzURaBjpqjD
         hgq0XeUPvsZC21nilM7hwPXKtiIw9U/gc/9jQN7Bw1toMFJtCAiDWihl3qoTv3zZ5nYz
         kLMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779453263; x=1780058063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2YX8b4V19qziyTb596TiLv9FQnlA5Iy1jj595uzVils=;
        b=EdqXft9LYsw9z7Ct46HaYFt9LHHqizt93mBdwup6N1THW7c77dlIhr7emYm0UUXsWX
         SdGe/TO3mPZV+PTyYbgQVUkjOBDj04mX9NU/eFDzZ1ByXC/Sj0MfHuvsgSS2qlragrul
         +c2U9tu4Fdpxkr3qspbqIcG9iZUVgka9EjBT32ARjY1sCoEF+Kd3RTyuHBeA3iqmVKFQ
         3MX+DubcBzSrq5aBE/annFBJfe0LDMebzJasI6X7KBAGxRzu3qW0CxZTtFOrokPbWMx1
         RIMukmL7kr7lzpnVT8xiAU2rsgq7TEtuvoAlgFSZZE5nIBKTiUbbwETg1ITSPQRSy31B
         o+AA==
X-Forwarded-Encrypted: i=1; AFNElJ/KTI841M55U9tNreMuRsTl75czaZwA93MQfVHqJQqaglNDHSNrdakji0Wh+TYlI+kU3qeHi+Z6w1V8mj3/wfIQTVBH/g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2Kj0TVjMeViODBneb6ZLwRcnR/+ZqjTVrcn3G1d2CkcIS9N8R
	U9rYMjqC1h+kxHaZQlH8lGJ5h7siCh69sJ/zMWkEWA3Tsjz8DMEPcM02
X-Gm-Gg: Acq92OEy3dQrPLi8Wpab2G/5UIhiTBuqwHmi82dlNpNF+8GtKa1aZLOMomNV6OTt4Pm
	XYFD7jems1Q0Z3aHh60CG1L7PLpIs/Gdtiv+zU7Dq2K1hxKoukAIWqrGaRSYciOKpX1x5Tf8aPL
	xVJFhjsamrMzFiMm6xh6IKJMfqrX8JOaaT1YT6Zg/hA7m0yK6NCoIFHcd1vEfbTPO5AYk6BPl5L
	C4XY7WGLsqR/Apw/PTK8ScTZ3l85dn5N6PdOdKN4Gt+jPFfKdGpMcb67RtRW9aC/hohEJpOgHfI
	EqatK6bwj3WZHjD3kTRlbQmVxCsgTT9IrbW/fNB2u7EXjuixj11nXi4VypBEjbcRvbolWzwGJ22
	QxQODxAHq9AjArHBfF0pR8/n1scZ/pi7Hr5ZVkeXo2jdPPyEDIkGJ18SfWSkKZs9cAnOsAlf4GZ
	+7k2PnbsBoI3MdVQR76po3zEQyOaZfkhcTjumDLT+k7Tory957ZrEj
X-Received: by 2002:a05:600c:8b85:b0:48a:534a:eed8 with SMTP id 5b1f17b1804b1-49042260287mr39772245e9.1.1779453262348;
        Fri, 22 May 2026 05:34:22 -0700 (PDT)
Received: from aldo-conte-t14.tailf68ad9.ts.net ([217.61.173.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49042af0ac1sm14760175e9.31.2026.05.22.05.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 05:34:22 -0700 (PDT)
From: Aldo Conte <aldocontelk@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	shuah@kernel.org,
	joshua.crofts1@gmail.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v3 1/8] iio: tcs3472: power down chip on probe failure
Date: Fri, 22 May 2026 14:34:12 +0200
Message-ID: <20260522123420.45495-2-aldocontelk@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522123420.45495-1-aldocontelk@gmail.com>
References: <20260522123420.45495-1-aldocontelk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If tcs3472_probe() fails after enabling the chip (by writing PON | AEN
to the ENABLE register), the error paths return without powering down
the device.

Add an 'error_powerdown' label at the end of the cleanup chain that
calls tcs3472_powerdown() to power down the chip. The existing label
cascade is rerouted to fall through to the new label.

Move tcs3472_powerdown() above tcs3472_probe() so the probe can call
it without a forward declaration.

Found by code inspection while reviewing the probe error paths in
preparation for the devm_ conversion.

Fixes: eb869ade30a6 ("iio: Add tcs3472 color light sensor driver")
Signed-off-by: Aldo Conte <aldocontelk@gmail.com>
---
v3:
- New patch: extracted bug fix from devm conversion.

 drivers/iio/light/tcs3472.c | 38 +++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/iio/light/tcs3472.c b/drivers/iio/light/tcs3472.c
index 12429a3261b3..849ca7885d71 100644
--- a/drivers/iio/light/tcs3472.c
+++ b/drivers/iio/light/tcs3472.c
@@ -440,6 +440,23 @@ static const struct iio_info tcs3472_info = {
 	.attrs = &tcs3472_attribute_group,
 };
 
+static int tcs3472_powerdown(struct tcs3472_data *data)
+{
+	int ret;
+	u8 enable_mask = TCS3472_ENABLE_AEN | TCS3472_ENABLE_PON;
+
+	mutex_lock(&data->lock);
+
+	ret = i2c_smbus_write_byte_data(data->client, TCS3472_ENABLE,
+					data->enable & ~enable_mask);
+	if (!ret)
+		data->enable &= ~enable_mask;
+
+	mutex_unlock(&data->lock);
+
+	return ret;
+}
+
 static int tcs3472_probe(struct i2c_client *client)
 {
 	struct tcs3472_data *data;
@@ -513,7 +530,7 @@ static int tcs3472_probe(struct i2c_client *client)
 	ret = iio_triggered_buffer_setup(indio_dev, NULL,
 		tcs3472_trigger_handler, NULL);
 	if (ret < 0)
-		return ret;
+		goto error_powerdown;
 
 	if (client->irq) {
 		ret = request_threaded_irq(client->irq, NULL,
@@ -536,23 +553,8 @@ static int tcs3472_probe(struct i2c_client *client)
 		free_irq(client->irq, indio_dev);
 buffer_cleanup:
 	iio_triggered_buffer_cleanup(indio_dev);
-	return ret;
-}
-
-static int tcs3472_powerdown(struct tcs3472_data *data)
-{
-	int ret;
-	u8 enable_mask = TCS3472_ENABLE_AEN | TCS3472_ENABLE_PON;
-
-	mutex_lock(&data->lock);
-
-	ret = i2c_smbus_write_byte_data(data->client, TCS3472_ENABLE,
-		data->enable & ~enable_mask);
-	if (!ret)
-		data->enable &= ~enable_mask;
-
-	mutex_unlock(&data->lock);
-
+error_powerdown:
+	tcs3472_powerdown(data);
 	return ret;
 }
 
-- 
2.54.0

