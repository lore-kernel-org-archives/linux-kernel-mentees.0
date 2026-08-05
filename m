Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A643BBA09
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  5 Aug 2026 04:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785902785; cv=none; b=qv8VN0/rH222r6/e3TYbt1w9JKVDXDE0lp09jZcDMNd5P3fEIQ2AhE2t6HKU5Ytdhp5E5xKWgiEHi03t854CWeC0BeRChGsomdhINOZN9ct3tyW4B6Ia6yOKSu4etY433WQDp/+15cNxZtoBRTp94rF/xF7PTo2hrJnld9dKmxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785902785; c=relaxed/simple;
	bh=K1hRLC2BYPCN8oR7RYpVvCb4izC7Y+GoYerOs/x1PE0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bTuEUo8rLuj8DN+u3alwtVqwFy9tOEv+GSwoH0Gm5OAmNuXszTEgRVzhbiGIdmZiJWuf/fuYrZcJIb3rCrMefOaOpVIVyN2zfAek4kACPovCKFIy9MN5Xd4qajdlsfVNODpv+Ql0YX92UTF4cznVmu1F4e8Qev8uwe5vVoZsM4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p/UhRzS9; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p/UhRzS9"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-92ed19f4d60so39869785a.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 04 Aug 2026 21:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785902783; x=1786507583; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WxaAfBUroPynNZsFayGkalIpvtqiMx7fZUN9X52De4I=;
        b=p/UhRzS9oRjpQF7l0LaAJIEoFzelvvrPLTmQQX9986MSxT1LfUpna72P6uNCFUza6v
         0QiK8A8NcUP9O0LO8AhWFNwfXPws648zVWpJJG09QdPcjZcqUWUOcHIoWYVRN27oCnWT
         tpM+w4ZJZhHx0tzb/HXr1A5hC+ifOuxDfq+Zw1BBgI4nVJDridAw70BnKnGWwCbdWaXm
         LWjAnCFhoZO26nZv9YNAbhry/fqZ971a6c3ow/fZvIu4DYUTLJ4OMoOg0PKuLYrUFx3X
         6kIr0/QtJWbq+xMpqHfE/tyGd8WNRLRN6+pUXsHTLhhWHj3SKWsNr060ae502N/+wgst
         wGLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785902783; x=1786507583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WxaAfBUroPynNZsFayGkalIpvtqiMx7fZUN9X52De4I=;
        b=spkg77mj6k9N9DrBlvddTwXOT8CPhCOsh+qlj7wfZJdUX73L7vlyHx1EbRw2yzr+DS
         OAji5Pta4SqbeMknZnqS9fiyNFDhXvKSXfY1U4e88wH9MdkGYJLxUozh7aq11dIsAqm6
         G6IKA/Vp28idSE/LrYcQbi08CsKDXf6nJd+mpDEIItPoDetyJbhjZgLY1gEwh6OLWB4x
         rMLpg25izxGHV2pNK0dagFzHutEYT195X3Y0Ap7qR1CAxe0G1cA/hhQTyv9Ia8W8pVnC
         HXPfskrEzDX9/w8gyUnv0AafcAos2SEB4mfaftFq3OcWcWN6XLz/gsBDh/X3Wdpl2/WO
         66sw==
X-Forwarded-Encrypted: i=1; AHgh+RoI1TFpeahBvvLb/1Q5IVMa9fPr8AhJdFFjFXzMRnMQhmo+SavDflT9JIUrNRT2ZrBr/hwbViT3Y6VTsGHK9bFHNp0Mmg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwfXDHUzU7WWmmtbK3BWfOfolrXILNqYtJRzft92O00GhdUndC+
	U6hi27QVHkkz5LN9+r7OUovcfQU68xOMOlI4wxFjdoGpoNzFIOm83Yb3
X-Gm-Gg: AR+sD11skWdTq7EhAFRZw3O6ZT8crUv8yGh6iU/Xwa3FkcsvHZdgmfAz62YfaTEAsG3
	LviBcEP+DIjwyPw1/P74FYtVqbxPQbok78SZGwxsfmS3Isk0Vbr+6S2YkhD0oCV0XhDaBFRrqA2
	IUyPsn8hxD0ZXzqf9m0BwzDvYYXvFCGoMCrjr2LTOTeYRa4shypRLfswcoYUU/dSveSAGQJHJsW
	LIyelMygucF5TjzEZfJypIW342ZiAnCq3e2Q/etFXNAhnGzSqxfMMnHpoDUgex9ROqdUpyux/QI
	s6++zU2JVIraJEQ/KWhRHqFS8LfQFIgsVtQuiVoDyDhl2k25wcvYeXEbAT09R83AHGz/UO13dO+
	Lw9ALStGHh1G4ZwDztlxmKP6ueZeGdZy6jzs/ZHuhmd0o54VosgO0gTiR3PQXJ4tgg20QhdNvmj
	LO9FDNulT8jo9WlCTEsnV74vzNaGRFPSJ0yrzx7RH/sls8J7Dp9h5dJA48i8ULQkUOW6Y=
X-Received: by 2002:a05:620a:3f95:b0:92e:5b63:224e with SMTP id af79cd13be357-93631971224mr780414685a.22.1785902782750;
        Tue, 04 Aug 2026 21:06:22 -0700 (PDT)
Received: from localhost ([2600:4808:5693:8201:bb19:d9f0:6e53:91ed])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9364a42b761sm76276385a.13.2026.08.04.21.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 21:06:22 -0700 (PDT)
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
Subject: [PATCH v3] iio: health: max30102: fix NULL dereference in interrupt handler
Date: Wed,  5 Aug 2026 00:06:21 -0400
Message-ID: <20260805040621.84843-1-marcochen.dev@gmail.com>
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

  Unable to handle kernel NULL pointer dereference at virtual address
0000000000000000
  pc : __bitmap_weight+0x64/0x98
  lr : max30102_interrupt_handler+0x48/0x160 [max30102]
  Call trace:
   __bitmap_weight+0x64/0x98 (P)
   max30102_interrupt_handler+0x48/0x160 [max30102]
   irq_thread_fn+0x28/0xa8
   irq_thread+0x184/0x30c
   kthread+0x118/0x124
   ret_from_fork+0x10/0x20

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
Changes in v3:
- Reuse max30102_fifo_count() for the early return instead of reading the
  status register directly, as suggested by Jonathan.
- Return IRQ_HANDLED on cnt <= 0 rather than cnt == 0 so that a failed
  status read also returns early. 

max30102_fifo_count() still has the odd name and int return you mentioned 
in v2, so I will send a follow-up patch once this lands.

Tested on a MAX30102 on Raspberry Pi 4 over I2C.

v1: https://lore.kernel.org/linux-iio/20260731184124.112124-1-marcochen.dev@gmail.com/
v2: https://lore.kernel.org/linux-iio/20260804234355.65319-1-marcochen.dev@gmail.com/

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

