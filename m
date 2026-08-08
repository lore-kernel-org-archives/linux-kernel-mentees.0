Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF914B0493
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  8 Aug 2026 19:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786218894; cv=none; b=P5zRLvxloqmKyCOD+HbrVSScLaCx3VPUD3RcrO48H6wtQHw4X+kAhrZnuC34+121KmGrxa0a8utOsMwlc89wImCHWd5Dv8ymhOOb0LeyXnlYGASZb+n9VgvNPGJytvXrv9/lIPvWB9ejV6PgaladsvW4QM22h7D6+pP7zYXhhG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786218894; c=relaxed/simple;
	bh=LAYdKgYH2LETrInYKwmyGak5xlAjQWWRuxSevJGDLRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZaFUpLfHk0kgf6CeUvANCKVH/LPoRli6Fn68zI9rB1JkvS/a/dghbWQDHJzmNRejJ7ToCQ2ZvuU3XBMMV6qIxjKbtna1BViOzeX8lu+WUCLlVb+bEwrF5krw+8hUivl2sqZmAeRuMyGbPEBbv+ki2qiAfMvh1YK7XFL2bg4NAlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bmp1T30Q; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bmp1T30Q"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-92edb12cdf2so33509585a.3
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 08 Aug 2026 12:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786218892; x=1786823692; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sOAgnp60dRGNij8DkDy6LUPtj+NkpvT/nYa8rtSuzhk=;
        b=Bmp1T30QXSmTGv0uiBGQ8shZ/cDEAvGLJ7aP6hrtXCcX7mSu+A+GK6QsQ8ptW4f51H
         CfGDpujO1fytXFkb4+egngDlPLUbEsvYGNFoFXII4qP7jBlerzvhWPOv5NnJF43H4I5O
         vgsAAdXjMw2CMCfmxTEEDFYOGt0wq8tQ/wiBOA6v/KBgk1oKKCbv5G4Ko8zvBcwUnf5t
         Nb1FfBzk6GNXUkmChIb6MRXNHaCv/qZ1cNstNeeO78/9xEoAmh4DtlNNSi/Mi/X22Pzr
         kV/0UH6EUgBiDzBDb2vdymyRbtg0gaThfuOi/uvz8JoIDeFGf3zGcaJXJYCMr47/whCZ
         X5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786218892; x=1786823692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sOAgnp60dRGNij8DkDy6LUPtj+NkpvT/nYa8rtSuzhk=;
        b=LCK1i2vPTL1hveBa9CjmrMlSJS1/J+rXx7TiSGJBBOZLAivy24NGbhwCmU+FMaXy6z
         FaA40hRiK2YCFew4Tw+IFvNilar3LkIA0FyDywf2jYibJJXopTdPXxm2du533X+Jsh0d
         s05815vAv7ixz8NJLyylu26Ynvc1QTvtrdqqbxVoeT7/LKiag6BlHPH6F7dipoEVPAmS
         BlQx4MXJocntw87g0qyw2z8+kFLs0ReDCH25arNEAIU5MabIlCC7GwekMHY5q/tuWwz3
         gu0mUqwQXuPxaG2BpBUJWp3odhdAj1wXStgN/jNCzuaJ7QwBGMuYbA+AaDTKcxPUcAzp
         T01w==
X-Forwarded-Encrypted: i=1; AHgh+Rp/vs72QlzkkckuQShEC/glaLsf4srH2cW7+nhAO4BjfrwL0fw81XRaaHyigqso8j653jcrGX4WWrOSmc4KmEcBxVv6NQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+gsddke9zb1pogjCfAzA9oKsAIWITUSs/acEJW+3yy3aHSVo1
	6bYclW8Vr+7tDIa/jU6YdNxaUJRKO6H1qc9Ya4SU1exVFRbg0/mWq42U
X-Gm-Gg: AR+sD1099omX9zQhgjFGjrrvAM8kv6o+IsI0TydmBo0I7LCVm6WFmASpqbDhLsFPeVy
	oR54QA949lpu2SiIFfHXU8nYrrJcMDqE/BJyKd8/4BaX8UQBuLK+WhXj4U26Eg0xhagLDtEO/0M
	gfbtjUAkjMTX0/CD0QDGjihBbDgtTEkfNsVyURuVjtHDawuE1BA6dlDKyqOxkecBSLSl/bA+wHh
	VtB34LgwqJW97jiMLfBYwvoakjmf8VJzIaviF6oQcuDscnB9nfv8DgYLuueKm3RHGVCed+rEMWR
	L3u/iO4Uq1Btv+kMh8XB7eNq7BdpRtEjHGfnytnOtIThW4YDzUp5wzvVC0DuJGeWzOXys1Mg33L
	hZHhK+HZqShPoJYPyTz8vLefNQiuwzCV/7GdEwSH+KUwQBriyqrod/E0DRhAXZKXuVrsl6awG9U
	iqgcq35RDqtK68aUb4eQcGM6yF1nEZAQe4PWmPV+xwd3ygAsUpnd8X/bf/PMyq3ulwYXs=
X-Received: by 2002:a05:620a:440b:b0:930:b19a:9d5e with SMTP id af79cd13be357-93671b4bd40mr1229795085a.1.1786218892023;
        Sat, 08 Aug 2026 12:54:52 -0700 (PDT)
Received: from localhost ([2600:4808:5693:8201:394e:8b9f:994c:b59f])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9366e02d54esm429122085a.6.2026.08.08.12.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 12:54:51 -0700 (PDT)
From: Marco Chen <marcochen.dev@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	pmeerw@pmeerw.net,
	matt@ranostay.sg,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v4] iio: health: max30102: fix NULL dereference in interrupt handler
Date: Sat,  8 Aug 2026 15:54:50 -0400
Message-ID: <20260808195450.25420-1-marcochen.dev@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The interrupt is requested in max30102_probe() and stays enabled
for the lifetime of the device, but indio_dev->active_scan_mask is only
valid while a buffer is enabled. When an interrupt arrives while no
buffer is enabled, the handler dereferences the NULL active_scan_mask:

  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
  Call trace:
   __bitmap_weight+0x64/0x98 (P)
   max30102_interrupt_handler+0x48/0x160 [max30102]

Call max30102_fifo_count() at the top of the handler and return early
unless it reports a FIFO sample is ready. Because FIFO_RDY is the only
interrupt source enabled in max30102_chip_init(), an invocation of
max30102_interrupt_handler() without the FIFO_RDY interrupt status bit
set carries no data to read and can return before touching
active_scan_mask. A negative return from max30102_fifo_count()
indicates a failed interrupt status read and is treated the same way.

Fixes: 90579b69e94b ("iio: health: max30102: Add MAX30105 support")
Suggested-by: Jonathan Cameron <jic23@kernel.org>
Signed-off-by: Marco Chen <marcochen.dev@gmail.com>
---
Changes in v4:
- Trim the backtrace to only relevant frames and unwrap the first line
  as suggested by Andy.

max30102_fifo_count() still has the odd name and int return you mentioned
in v2, so I will send a follow-up patch once this lands.

Tested on a MAX30102 on Raspberry Pi 4 over I2C.

v1: https://lore.kernel.org/linux-iio/20260731184124.112124-1-marcochen.dev@gmail.com/
v2: https://lore.kernel.org/linux-iio/20260804234355.65319-1-marcochen.dev@gmail.com/
v3: https://lore.kernel.org/linux-iio/20260805040621.84843-1-marcochen.dev@gmail.com/

 drivers/iio/health/max30102.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/health/max30102.c b/drivers/iio/health/max30102.c
index c37316c86f14..aee96167f01e 100644
--- a/drivers/iio/health/max30102.c
+++ b/drivers/iio/health/max30102.c
@@ -290,9 +290,15 @@ static irqreturn_t max30102_interrupt_handler(int irq, void *private)
 {
 	struct iio_dev *indio_dev = private;
 	struct max30102_data *data = iio_priv(indio_dev);
-	unsigned int measurements = bitmap_weight(indio_dev->active_scan_mask,
-						  iio_get_masklength(indio_dev));
-	int ret, cnt = 0;
+	unsigned int measurements;
+	int ret, cnt;
+
+	cnt = max30102_fifo_count(data);
+	if (cnt <= 0)
+		return IRQ_HANDLED;
+
+	measurements = bitmap_weight(indio_dev->active_scan_mask,
+				     iio_get_masklength(indio_dev));
 
 	mutex_lock(&data->lock);
 
-- 
2.55.0

