Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB40C3A71BE
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 30 May 2026 11:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780141216; cv=none; b=ZsKILDtDN8n5zkuvcwa3JNutxhzE8nKxKUoVIT9jNpHP712hUz5ekrRSPVkx7p4RwF2U1iVbj8ciNSe3xfh/k+Qfm1j6bqgXy5UD5HJRqm4nVGf88s5mRsulA2rkb8UPvkbmOiJrTXbv4tFIdYM9h5s1X/u9supx0Z53P9Xnljs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780141216; c=relaxed/simple;
	bh=Tjpk0UGo7UJkZtCc2AlC0a6mEIDVKO9WL9yPpEY8ksE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mnX5ZJzJiEfwsz2jw/Dzh9yzp5aixqZAlOTVSBgBWGv/IwBfpU1eWMdeLDcw9vHGVViV0unVpl/P9Wq9DkKzoLj0EOc6hOBuaBHZ80GeyJYxVJ5KkXr91gPfsnSemuadjxD1FuE46F4t8VIHsh4nS7Z5MkAc/NqhEL5VRGJFvZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cPctHrps; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cPctHrps"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-842319576d5so117528b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 30 May 2026 04:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780141215; x=1780746015; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=86sSBgbx9kKkCfgAmFq6bHEkr4eE6POT886tx7GLE3I=;
        b=cPctHrpsqs9AlV3r6z4KX4DuwF52eDliUMzaIIuBX0iep2PxeKaNbSF4daUphP1225
         CtQBAjm2RNxSYcJ/FED/1gLOF45iOv91RBbrqFHh+php+rFqtxLeKJfDRt1QPADCTus+
         oQG+3QgzQqnJ9if+YnuiFC71vh8NH+aHD+L6bIsNQ6Svf8vkVi0ny6yZqch1c/pmv7tk
         gL12w35AehrOInbALvthOAvYRoezwTYCXloaptMUGhQicYrHkYRvRj5RBXxApO0lvKb6
         EuI46iIIIfG5adjMjcucQYN77XsGDOK7DP3hwE8cvM0oyz5uEzNS7QpUEu3CxCp+V0Li
         t+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780141215; x=1780746015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=86sSBgbx9kKkCfgAmFq6bHEkr4eE6POT886tx7GLE3I=;
        b=kHy60hiQKc0x2paL9xE8/nqI8MeRDmmTVkXIlS0SYlA2RB85/LDmpCadr2RN/x9xAK
         556pokZqrm9iKzwxELrGlT0Mh5ROpXlyLQUrSRVd9VqOAXjA/N9K/J07T4QkHnEqNkhj
         hlyMU3KPGpcUb1aa5kALkzZBPMC8vvrZovcDFo7UZEWtQj7Yvtf0pvQVNmDy0OXADV7e
         hvD7T0v++qA1P4Xo/0n6/ns68Ht36G9Jx8H/tKTFgsesTgUSTXQa49YhXFzyyKkYt7Pl
         ZRJdf1s40eA3F7I0+NtleRSBtwVNpLrcgiWQmVn5nTJTzIYQQeH3qRYAukiV+SP7AWS5
         BH1Q==
X-Forwarded-Encrypted: i=1; AFNElJ8SkPvTFjSXBNIQPtlzm9qKVCNnr2KSYRWB45pdFD68WwkC1BNgO4I7FEMEho65EiJZDWnjdvx6DYW/JIDSMtIi0g2HJQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxxE2qAm31Xxrr/RYmIzwc3V8K1E48t48tHRn34RVM9wMFRWKN7
	yNz8qGcR61kO0mcq3QApufZRnybRFa3b/rFhgbpAXo6IcJSckRtXImsU
X-Gm-Gg: Acq92OGDI1MB+kAaPquxPTuOPgx0AtzL81Gt/2iy3j9q5/b7ISSrQtY7ie4w38Td1rY
	2yzoouMwtvGR+cgmkE5R2vKfj5HyKm+Xvsfh+LL6Dzmj2mizD1fC4CbxzRexOTBXa0lYJW9JXSt
	Pxdv3wpa9O/sMn1Vda9j18O/P28KecmQkujQNEeW9HYmkx4/FkuB2DP4lYARY6lGPFquYwx5P4W
	GRrgdadACwx5g/8ir+9+jYAAYMCurBQYYpUsyklvIqIkZ5672qtVCTOYYp1bkO0/f8FoP9Z4Xyh
	v0eqyD5KF/Rasxuc2JmN9D4CttWF8+2GpQZyB83Bm/lrKzCZxCF1hQSWnQ3sZraAtaQXDoMZQTe
	99hobrpZjsCr4jukGKOCHpjIvMDnOz9ObAU5huY7mabyTjwZ0OOX0YH/9DOuRb5F79HL68GrbbW
	K0HGg6oMGrHffV0lnmb/j0Ldq9vinPDhxc4yVz9qYsMMlHg2UDhMLA5BF72g==
X-Received: by 2002:aa7:8889:0:b0:823:9b7:9c0e with SMTP id d2e1a72fcca58-84225493ba1mr3250783b3a.34.1780141215015;
        Sat, 30 May 2026 04:40:15 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214b6797esm5467518b3a.26.2026.05.30.04.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 04:40:14 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: jic23@kernel.org,
	linux-iio@vger.kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	apokusinski01@gmail.com,
	me@brighamcampbell.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH 2/4] iio: pressure: mpl3115: clean up interrupt handling and locking
Date: Sat, 30 May 2026 20:39:36 +0900
Message-ID: <20260530113938.171540-3-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260530113938.171540-1-suunj1331@gmail.com>
References: <20260530113938.171540-1-suunj1331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Return IRQ_NONE instead of IRQ_HANDLED when reading
INT_SOURCE fails.

On shared interrupt lines, returning IRQ_HANDLED after a
failed register read may prevent other handlers from being
invoked.

Switch the trigger handler from explicit mutex_lock/unlock
to scoped_guard() for consistency with the locking style
used elsewhere in the driver.

Move mpl3115_config_interrupt() above the interrupt handler
in preparation for the FIFO support added in a subsequent
patch.

No functional change intended.

Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
---
 drivers/iio/pressure/mpl3115.c | 59 +++++++++++++++++-----------------
 1 file changed, 29 insertions(+), 30 deletions(-)

diff --git a/drivers/iio/pressure/mpl3115.c b/drivers/iio/pressure/mpl3115.c
index befb6d48efa9..52a3d0d59769 100644
--- a/drivers/iio/pressure/mpl3115.c
+++ b/drivers/iio/pressure/mpl3115.c
@@ -308,9 +308,8 @@ static irqreturn_t mpl3115_trigger_handler(int irq, void *p)
 	u8 buffer[16] __aligned(8) = { };
 	int ret;
 
-	mutex_lock(&data->lock);
-	ret = mpl3115_fill_trig_buffer(indio_dev, buffer);
-	mutex_unlock(&data->lock);
+	scoped_guard(mutex, &data->lock)
+		ret = mpl3115_fill_trig_buffer(indio_dev, buffer);
 	if (ret)
 		goto done;
 
@@ -322,6 +321,32 @@ static irqreturn_t mpl3115_trigger_handler(int irq, void *p)
 	return IRQ_HANDLED;
 }
 
+static int mpl3115_config_interrupt(struct mpl3115_data *data,
+				    u8 ctrl_reg1, u8 ctrl_reg4)
+{
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(data->client, MPL3115_CTRL_REG1,
+					ctrl_reg1);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_write_byte_data(data->client, MPL3115_CTRL_REG4,
+					ctrl_reg4);
+	if (ret < 0)
+		goto reg1_cleanup;
+
+	data->ctrl_reg1 = ctrl_reg1;
+	data->ctrl_reg4 = ctrl_reg4;
+
+	return 0;
+
+reg1_cleanup:
+	i2c_smbus_write_byte_data(data->client, MPL3115_CTRL_REG1,
+				  data->ctrl_reg1);
+	return ret;
+}
+
 static const struct iio_event_spec mpl3115_temp_press_event[] = {
 	{
 		.type = IIO_EV_TYPE_THRESH,
@@ -381,7 +406,7 @@ static irqreturn_t mpl3115_interrupt_handler(int irq, void *private)
 
 	ret = i2c_smbus_read_byte_data(data->client, MPL3115_INT_SOURCE);
 	if (ret < 0)
-		return IRQ_HANDLED;
+		return IRQ_NONE;
 
 	if (!(ret & (MPL3115_INT_SRC_TTH | MPL3115_INT_SRC_PTH |
 		     MPL3115_INT_SRC_DRDY)))
@@ -420,32 +445,6 @@ static irqreturn_t mpl3115_interrupt_handler(int irq, void *private)
 	return IRQ_HANDLED;
 }
 
-static int mpl3115_config_interrupt(struct mpl3115_data *data,
-				    u8 ctrl_reg1, u8 ctrl_reg4)
-{
-	int ret;
-
-	ret = i2c_smbus_write_byte_data(data->client, MPL3115_CTRL_REG1,
-					ctrl_reg1);
-	if (ret < 0)
-		return ret;
-
-	ret = i2c_smbus_write_byte_data(data->client, MPL3115_CTRL_REG4,
-					ctrl_reg4);
-	if (ret < 0)
-		goto reg1_cleanup;
-
-	data->ctrl_reg1 = ctrl_reg1;
-	data->ctrl_reg4 = ctrl_reg4;
-
-	return 0;
-
-reg1_cleanup:
-	i2c_smbus_write_byte_data(data->client, MPL3115_CTRL_REG1,
-				  data->ctrl_reg1);
-	return ret;
-}
-
 static int mpl3115_set_trigger_state(struct iio_trigger *trig, bool state)
 {
 	struct iio_dev *indio_dev = iio_trigger_get_drvdata(trig);
-- 
2.52.0

