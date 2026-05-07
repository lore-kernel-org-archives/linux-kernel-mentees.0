Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387DC3D6CB2
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  7 May 2026 10:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778148803; cv=none; b=sV40AqNQVoC5gypLoLFtz7Dd4lz/WYzhqDl9G7XyykWXOdHXvBHvR+Rqlq/wgav3JxQ3QiA/vE/5S2XMmYpC2NVS2UMlKfeWkaIqGkw03rcepkLIL70MyNM7VKngoc5KV5alCO7Nbmy8zX4j7vuk5fH11cwOusSTnluAlsztrD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778148803; c=relaxed/simple;
	bh=k4GyIjdLbYgaUSdzQuPr/Z0UMqJ70IDsVBrK35Vp1n4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CBh85F7nt6mb3WVIAxnGqs6ahLLbR2bx9IvIHiNI/8vQkRW+7KFK0RMOnLPJx5r6Q9tltP9TgaVXkRaxxGufaZ1dhy9ocMl59LOU9hRAurne/y9XnWHjhNzOjtwm+dGGMQD/83suS4hYZRU4EWRXckahR6WHYBi1s7C2f9QCSqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3et1gSY; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3et1gSY"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8296d553142so384120b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 07 May 2026 03:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778148800; x=1778753600; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dy+ItK45HyR1sGSCwF/1GxRLdvnupH/Yv9vU0vjlJL0=;
        b=h3et1gSY7a2/N0BsOZwu3dy9j95YBI834RLMO+tuIw3gsRyoahw+db3LCzjOc4WEgY
         kSI3lUWmEn0+K/kWe1mTTivP24uLY8Cf6wlh/LHxMnD+vlwsZkVXz+5jO/fD0NNb0ps5
         E3xYEvuBs0HjLkrgTUP4iNTTwXvjpElmsYHC97Bup6GAJ8FoXhQgRGohmHlXrz4CbppW
         WQkLwxv39t8BbwiH7oJvR9iLKGt+YHM4GQ35IDNv47MqifKQT3b44iDzjtnXZwMOnlKa
         Fvsxhbnr59ClnLf+IaCmKS7schth6niWP/S4fk3V+OnCCFe8BEYxexTtaEP2Yi2gcYtM
         55kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778148800; x=1778753600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dy+ItK45HyR1sGSCwF/1GxRLdvnupH/Yv9vU0vjlJL0=;
        b=XH82i0U+TXpupFlY2nmE6Oka6ZDehfcGAGaWJnQfPMvZR6DanltDEEzTDw8FnRay5a
         A/+exSsqZfruNj2btN0eF7yjYyEgjdpVdzuRfepJZMpWD8Gdla3hn6wX+KXOiDkqsUDa
         W0wpBi5dDzjxNJTc6zwJ9q4DnBy413rfHleGeuRjyUGXOQK3cjO2AQEiooa5CYzSwrsq
         B4oXeXPN9LbhprzrffU+eZoK8kxx0/62jkFykfXyN/wnfnmc/np2tdnS6pGipjn1tYMg
         2yS5WZN6paRwQhvSaIrIDwm29mQ7RtBKYkN1ZriR7NzumwzD4GB8zAX8pHqB8b1XMZya
         kmmA==
X-Forwarded-Encrypted: i=1; AFNElJ/0icYY4dKcM9lc213EEjRB1CNtEOCDmUDkJRhYgSRWbVCxkdD4bH4gv0yruIJPc2A4ItHg4OUor7pz6oP+jM6oBTVifA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyE57NNwPTUJK47PfQAkdYJ42weHezm5xNm3DLrcued3d77mTSE
	XSdtLWMx5geU6OlgSmGEk/fAK9CWvAjl9P1fxfIYpoxn7In2Q1NhCQRlaCUmTAi3zWg=
X-Gm-Gg: AeBDies5Ozd6XuENShSohSkx8Z5KBF0B5fG4JR0ZlExUoPtkPv0DSIG0UrJAE7vr1Gr
	xsJEyQKWBc+fr6p3Jm4y784tyiUx8obcaTcF12KMMX//idDmG2L5ioGS45ufkFtQRUVD8aErpQM
	T8Ss8DuEllAwm0H8INgVLIiFNpkSSpq57ohBCmJ4dCr6aZjLMBGfApHLDJUyut7iIEVC7JApykT
	1p76bLdbZpkKVptjBc3aaAFwQcYCAwzYj95rVn4faGktw8TXtsFN10CDx7wH2YKh+i7aLNECN+r
	F00UJZXgEBt6cU5Kmu+ugZagghFubcfiS8vSjWsqaz8G9D8aKeYV9+0+xeZ/C++Q5bNAI7XvwKE
	6e/ZhB4LbPGIixqsMRPFgpDY3Hy65cluU1M6LZiR0PvXVLjMZE0V1Nc2uPkDgVxOLz7/19fkLAf
	D0HPMRay4IAmSByK5rxMcz5xqYwt89s0tyg3INJOnXFwY9Oruk9Znko7YG4ArZ7CEizQnYcQbZZ
	VkdfhPwu3t1pcgF2QWK52yaruIdpg==
X-Received: by 2002:a05:6a00:4516:b0:81f:852b:a925 with SMTP id d2e1a72fcca58-83a5b2d2c8cmr6536577b3a.1.1778148799952;
        Thu, 07 May 2026 03:13:19 -0700 (PDT)
Received: from fedora ([103.181.54.100])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbcf16sm9797998b3a.40.2026.05.07.03.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 03:13:19 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev,
	Ninad Naik <ninadnaik07@gmail.com>
Subject: [PATCH 3/3] hwmon: lm93: Remove else blocks after break or return for consistency
Date: Thu,  7 May 2026 15:41:43 +0530
Message-ID: <20260507101143.559475-4-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260507101143.559475-1-ninadnaik07@gmail.com>
References: <20260507101143.559475-1-ninadnaik07@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl warnings by removing multiple else blocks after break
or return statement to follow latest kernel code style.
Compiled the file and verified the changes. No functional changes are made.

Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
---
 drivers/hwmon/lm93.c | 39 +++++++++++++++------------------------
 1 file changed, 15 insertions(+), 24 deletions(-)

diff --git a/drivers/hwmon/lm93.c b/drivers/hwmon/lm93.c
index 1a3b5da924b2..ddc4c4377128 100644
--- a/drivers/hwmon/lm93.c
+++ b/drivers/hwmon/lm93.c
@@ -403,10 +403,9 @@ static u8 LM93_IN_REL_TO_REG(unsigned int val, int upper, int vid)
 	if (upper) {
 		uv_offset = clamp_val(uv_offset, 12500, 200000);
 		return (u8)((uv_offset /  12500 - 1) << 4);
-	} else {
-		uv_offset = clamp_val(uv_offset, -400000, -25000);
-		return (u8)((uv_offset / -25000 - 1) << 0);
 	}
+	uv_offset = clamp_val(uv_offset, -400000, -25000);
+	return (u8)((uv_offset / -25000 - 1) << 0);
 }
 
 /*
@@ -811,15 +810,12 @@ static u8 lm93_read_byte(struct i2c_client *client, u8 reg)
 	/* retry in case of read errors */
 	for (i = 1; i <= MAX_RETRIES; i++) {
 		value = i2c_smbus_read_byte_data(client, reg);
-		if (value >= 0) {
+		if (value >= 0)
 			return value;
-		} else {
-			dev_warn(&client->dev,
+		dev_warn(&client->dev,
 				 "lm93: read byte data failed, address 0x%02x.\n",
 				 reg);
-			mdelay(i + 3);
-		}
-
+		mdelay(i + 3);
 	}
 
 	/* <TODO> what to return in case of error? */
@@ -849,15 +845,12 @@ static u16 lm93_read_word(struct i2c_client *client, u8 reg)
 	/* retry in case of read errors */
 	for (i = 1; i <= MAX_RETRIES; i++) {
 		value = i2c_smbus_read_word_data(client, reg);
-		if (value >= 0) {
+		if (value >= 0)
 			return value;
-		} else {
-			dev_warn(&client->dev,
-				 "lm93: read word data failed, address 0x%02x.\n",
-				 reg);
-			mdelay(i + 3);
-		}
-
+		dev_warn(&client->dev,
+			 "lm93: read word data failed, address 0x%02x.\n",
+			 reg);
+		mdelay(i + 3);
 	}
 
 	/* <TODO> what to return in case of error? */
@@ -895,14 +888,12 @@ static void lm93_read_block(struct i2c_client *client, u8 fbn, u8 *values)
 		result = i2c_smbus_read_block_data(client,
 			lm93_block_read_cmds[fbn].cmd, lm93_block_buffer);
 
-		if (result == lm93_block_read_cmds[fbn].len) {
+		if (result == lm93_block_read_cmds[fbn].len)
 			break;
-		} else {
-			dev_warn(&client->dev,
-				 "lm93: block read data failed, command 0x%02x.\n",
-				 lm93_block_read_cmds[fbn].cmd);
-			mdelay(i + 3);
-		}
+		dev_warn(&client->dev,
+			 "lm93: block read data failed, command 0x%02x.\n",
+			 lm93_block_read_cmds[fbn].cmd);
+		mdelay(i + 3);
 	}
 
 	if (result == lm93_block_read_cmds[fbn].len) {
-- 
2.54.0

