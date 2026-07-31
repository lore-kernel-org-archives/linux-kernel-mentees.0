Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC2E43D4EC
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 31 Jul 2026 18:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785523295; cv=none; b=H4AmcWQG1t8WtFWHs5kL8ll3qCMZ2GU2iM7N8StSS/S5+dijxG3mJa5vivLo0rXlFnNUZZPwkBck0fHA/g/cbEQlt5QaUEmGUnGk0DAqklEzD3uFvxymhTtAaAjU6GbysotVPJhSmTJFThCfI2Wx3WL4EmuuioE66uNcwzeF5ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785523295; c=relaxed/simple;
	bh=7LNFTMs6nkB60Ajw7pQWpTWA3laGLhCMvmJrV0QSrCU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u55nzDThJ4ZNRZz3wGmtZIfe0mDktu4moKokQ3Y8gaK+Lu68rOmKOGhjlwykTsNM1TCNdCG9/Y/4nIeKxbWNgzyN9u0ZdMaufGxAkt3dELtHEQsJntQRLZxHmeUi8JI58GVmETPGOQCdNVbq2rrUuzgW3exHM9cMR8X3TQJwhcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=abP+JzOp; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="abP+JzOp"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-908239232adso7147356d6.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 31 Jul 2026 11:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785523292; x=1786128092; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CTMjmGFusOMu1vcQVsEPcYR4aahhp3Y9Dwu7CieMQ38=;
        b=abP+JzOpvL4PDCKs1rebbr6r2YRREUpxaosK6swpZDdH6um8pHQrbVfNmfZ+eJeraE
         DzSzmI7fW+j24PSdL+T1qPdG77BmTy372xCursFae/zPnrW5XaSH0deyusCOL5lBKZSs
         IENRtZRGnqY1Li2sobermi84OYsEeUf5da+VtzYJeezUTExlfw/Mgq71gQDgNdia7Nv/
         vk6bKaGwI+ebCbgtevRwVZn+zbnvtPXJbSJ3pFLo3e223yj9zPaKH0e58oy6XTV8lbp2
         5QKtxibjyRYhcGf/muWulROEisSB3+KpSciUehBjmaafLP1fvKkV+V1F9wlptnU2EDjS
         ZkwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785523292; x=1786128092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CTMjmGFusOMu1vcQVsEPcYR4aahhp3Y9Dwu7CieMQ38=;
        b=JH5oJOy1WzfxCTdpi5tSv1ZkhrXWBP4ecS/pR1B9OxqWJIzm31cpqNGQvX88AfZVNu
         vIv8Tq2sxu16DbHuBd+GYsi30nHaOCWJ32jhorZwoEwU9W29ekdLWgjArxmqfhoTm62A
         jmsorjuLpkZQVYuVJjT7IR2XrlHg+W6dvzPKSp9E2C+kCdP5cuf1IB6W+z8oem3pfZzo
         +J1vg/doZVxJfrYZWolOsZ6zWJIHgPUFbnEofif1LkVpbD9xn9fGs4WcWx/ZpW+ozwqR
         c9hm7/faCmcQY9G0Oyg9lJEZmSgxbpJZX9SEIDOG/HCnCBNxtjC+BCI5HP0cE5ljNxHt
         b6kw==
X-Forwarded-Encrypted: i=1; AHgh+Rq7E6Web7IDMFViqNdEh7r/gkMIA8R3eR5YAn/ERgssa0QQGcvhGWzG3Caw1hKb080qlAqhtER21zCkqxvKuPfOgUmzVw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzYzza9m+Hrd8E+uhnAn6yuSJjVhtCcrxqPfigpKf67NFDUUfnA
	+fU4bhcYzDb0PO94sb8/2/0rVV1zgZbqZWnOkaS1diSX7IdA2ir/CJ8e
X-Gm-Gg: AR+sD11ToLEUOnoE4O+A1uZ3hzhQPw7fHBheV53mHZW12c0YpynFWZ9bl+uX7LsbSGn
	4XAnBn7lYcxYZIxfSCRcrgVbAC8xaJ4qs1Jvemg/1xZ5F4GlrOxYMiGELjabzNny7y/wgzovweT
	Q5vko0FJ+QB7Ij+UpeHT91QohRF+1MdRTuXSEG1hjdq0Zi3jaFONDYiSolVG3S9rWw3GDieJrzV
	wel4zgNqwzogIC7mTMQT2nXRGK6uqHJCLW659foObuWZi/QFZthsKYwMZm2STIxVAXxTxbL7XKZ
	eEbDQhHDgixBwFfY2v/7LnjTaUHiBm9OLxAkgtiLG7BF6u/aCZLasrX2UO5ILfbwlqY1CE2teVC
	yp1LosOxCS3IwSb7lVCWCeHLrjnPJhJQdJAgxiSKkrqr6CgmCGtI9X2zbM7P7D6TI8PKq54mnv3
	xsIfiZBlxmZv1oeZiisVriNuz5ZucaF0BdBd5+47YvduaSxd5P6d8WXthcjTC2UpUtUbs=
X-Received: by 2002:a05:6214:590d:b0:8e9:cd74:87bb with SMTP id 6a1803df08f44-908431e1f25mr60578946d6.18.1785523292065;
        Fri, 31 Jul 2026 11:41:32 -0700 (PDT)
Received: from localhost ([2600:4808:5693:8201:bb19:d9f0:6e53:91ed])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908436071b7sm16241546d6.48.2026.07.31.11.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 11:41:31 -0700 (PDT)
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
Subject: [PATCH v1] iio: health: max30102: fix NULL dereference in interrupt handler
Date: Fri, 31 Jul 2026 14:41:23 -0400
Message-ID: <20260731184124.112124-1-marcochen.dev@gmail.com>
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

Return early when no buffer is enabled. The interrupt status register is
read before returning, since reading it deasserts the chip's active-low
interrupt pin. Otherwise the pin would stay asserted and no further
edges would be delivered.

Fixes: 90579b69e94b ("iio: health: max30102: Add MAX30105 support")
Signed-off-by: Marco Chen <marcochen.dev@gmail.com>
---
I ran into this while interfacing with the MAX30102 over I2C on a
Raspberry Pi 4 running the IIO subsystem tree testing branch and
learning the IIO sysfs interface for the first time. When physically
rearranging INT pin wiring with no buffer enabled, the kernel oopsed.
This happened because max30102_interrupt_handler() attempted to
dereference active_scan_mask, which is NULL because no buffer is
enabled. With this patch, the same situation no longer oopses
and the buffered capture was tested to work normally afterward.

Some things I am unsure about though:
- Is IRQ_HANDLED or IRQ_NONE preferred here? I chose IRQ_HANDLED 
  because of the status register read to deassert the INT pin, but 
  I am not 100% confident on this choice.
- Should the regmap_read() return value be checked? I did not add a 
  check because I do not see a useful recovery path from this I2C failure, 
  but I can add a check in a v2 if it is better.
Thank you.

drivers/iio/health/max30102.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/health/max30102.c b/drivers/iio/health/max30102.c
index c37316c86f14..c30b029ba8aa 100644
--- a/drivers/iio/health/max30102.c
+++ b/drivers/iio/health/max30102.c
@@ -290,10 +290,23 @@ static irqreturn_t max30102_interrupt_handler(int irq, void *private)
 {
 	struct iio_dev *indio_dev = private;
 	struct max30102_data *data = iio_priv(indio_dev);
-	unsigned int measurements = bitmap_weight(indio_dev->active_scan_mask,
-						  iio_get_masklength(indio_dev));
+	unsigned int measurements, val;
 	int ret, cnt = 0;
 
+	if (!indio_dev->active_scan_mask) {
+		/*
+		 * No buffer is enabled so there is nothing to read. Read the
+		 * status register anyway to deassert the max30102's interrupt
+		 * pin; otherwise it would stay asserted and further edges
+		 * would not be delivered.
+		 */
+		regmap_read(data->regmap, MAX30102_REG_INT_STATUS, &val);
+		return IRQ_HANDLED;
+	}
+
+	measurements = bitmap_weight(indio_dev->active_scan_mask,
+				     iio_get_masklength(indio_dev));
+
 	mutex_lock(&data->lock);
 
 	while (cnt || (cnt = max30102_fifo_count(data)) > 0) {
-- 
2.55.0

