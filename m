Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795804003;
	b=4uodJKpQ0JxeD1YpC/c+0J/lsl3YCfyPZQwaBmPoMwLQ2mQOJzoKpp5K1uOG8Yozo+Fr
	 Ia3E3Kl1it4aig2al1NGiL1bse331ixfWIPg6UDvE2MtUYCqKmNcSC1oLzTxNFVgwzc1P
	 m+cFRoxOIPxNXoluDPox1zncM10PvBFywjuwgmZ1TA9YZYRF7v1GOov1MEtbCqm8XLljQ
	 xLBvjTR79cxpW/Q0uE8kIpFhXwddSBcOxVWRECf3HJuE9uOnOcbNFaiCKbqDIR+ISQPqt
	 pmsj1IQo2RWzD0GlIJ9qOInwGDtXFg/9e01Qt0/j+nTgMnIdxasH3J8vdQdOfh38gIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oC6y9f/aOyEQ84R7NW1NilnGjZfRr+uYTRuXBDVTwZQ=;
	b=GgEhOZ4NJ1a2KKyiLecjAPsRnyJoPfP94WcADwmv9C3wuEyzfHV2enR1eiXIxrczOgSc
	 4Fi+nJ6czykW7/9ETP3Ry7YJFBTb7vUlI/imP0nFQClU6NZSqybBex6CJAx9ygsXhjLcI
	 OIlSlzjLmDkXvmrmeT0W2sfJkeuJg095/gnWzMbRCBQipVtGjN6pzC4eEyQo7KR6JO8So
	 6KAGUPfNMgwB/7p94IETTwPks9LIZC4+uD67bDU644F2g1C5wjl6leNKHdNscXih7T9rn
	 ZCZUp056ySXQlTr0I7OC43yZ/LDz8d4MRN4BxWEaguuxclyqh/p3g2pcyFjdsKvXtzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rg1b+mpB;
	arc=none smtp.remote-ip=209.85.217.53
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E25606A330
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 27 Nov 2026 18:26:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97E25606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rg1b+mpB
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7d6554d96d3so4698282137.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 27 Nov 2026 10:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795804002; x=1796408802; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oC6y9f/aOyEQ84R7NW1NilnGjZfRr+uYTRuXBDVTwZQ=;
        b=Rg1b+mpB/+a6rNttqJ0rHpmKvqp9hxnTAs2EeY2v3/5aPfD0IzA8hCfDy73Q9HYKJq
         kFFkWVvG84R8mutpm8tLtMdbhqz2QjWYJhmByH37MBhfyTvcKzhUJqia//DjmfL4qLpb
         ExgKtoexAhtqvCg/Cr0YC03uUoZOI3mwPgwXPAXkJ7F5k5c+yAW5tPhs//esQ9SwAbme
         +8CKgDMsTHNYDBMa7KdaWcml7G2FK3GdhCsvttI4LBr8AH8qN+ff5Q0vhUnxnSKol1Em
         GgU1vDiJzfJrmeWiSWJkPAq9DSaLOR2yfh9a5LlFKYorFEnHRurIJbE9GkfAkL8FDBx5
         JoDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795804002; x=1796408802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oC6y9f/aOyEQ84R7NW1NilnGjZfRr+uYTRuXBDVTwZQ=;
        b=1n8K9m9TOF7hqqzNA1cwCn9S3bu5MxJM9wXlzpPim9CSWhTorP+Y2AtEEc+VXRUUNv
         ujcYxQ1/QZ58dgpXWIX+PQJriG47cj5lCUX7nKmjRPn8JY+sVzGpjO8lIyPL8vRewmp/
         AOAfp31L+5bdTarquvcq45CZ/LvHeGpeVFIm+FQ5+18hKuPDhRO1efb4V7nKoIpX72Dj
         DNWeLU7K74DxiLA8kyraeoYZJ5dzW9CA3E+FIEawmGxYYzuzkBEpuNsT5vfKwUFQuD9A
         4GvaGi86NSIwiGFAap5/QVeSJBD0Pco2QkFDfxb9LDwo31gdNSb8P5/xziomMSu4XaIh
         TPhg==
X-Forwarded-Encrypted: i=1; AL+hErHdDREw5wZe9JsDh1LRfhlbI+kwVOz+Rsf9S/hCIXfVTpx0o79GmyOhFNsmX4zFlcuwfhGc7xR9OvFz1SE8g2tQN28vDw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9A2AovC5r2mnZ7LtjWx9lQO7CWYAp6yNvl5dDkDF3G8a5kYqrO
	JdxcPiqsa7HbSu3wx+RxrgGLSHOgqJDNO7QELLckRh0aXcQEE6QVFOzsc/THUUkS++c=
X-Gm-Gg: AZFdTZerPz6ALpG74Fszl7RlyAqf+7Gd3zFhC6Xh7fHZDuAmX7PgryRmMH0qGSZfWzn
	daKJxZ30hRtQjzBE/XCxLfdx6zGOKYdwgGLRNmlpsYkkW877hzEPXJg+2h5c64tX4uK+jsI20WW
	2wK/B7g641piSWpf4wQXXeqUV8EtowOyL/D6o2kBagAhtZS7+87ul38BurdfnGJ+FYupmAYg3j1
	foWy6b2sC3PkLEsPMS4rBFuprjNaqxr4Zk6kZ26e4C0apw3Ga0728CNkRGzpPoLfZZnf34VGJBu
	chNVBFe+ouHu1nPW9g7JwPQDDKGNy0tTP63qTwqeFuGIWzu3fnLa4WWNY9SPLrIVt2HF827y4A+
	tsvYum8dtg4dXULCT585EW2IwcV5qQB54B+q1Qg2OQ0R5K261qzKhdUqdHx5MGxpEesWZjamors
	czV+j08uFuJmAO0WQyiRQNrdrDLgbDlWiY3mVMzUy/RR3yaGQDAiv1majLo87QdvkFr+xJF+t8j
	itkIK5OFhqkxYMCTYLzcU9Hf9Y8XU3TqhRezhEvs2Yx2Yd++mL0/YRGSoTGk30MEInir/sgdx3K
	VZtfZ6XPyfGAW5hats+Ees0JR3apfw5a16CxG8xzSvL8TdSHN6iwUddP
X-Received: by 2002:a05:6102:a54:b0:7bc:1de3:39b0 with SMTP id ada2fe7eead31-7d7396670b7mr15146004137.32.1795804002520;
        Fri, 27 Nov 2026 10:26:42 -0800 (PST)
Received: from localhost ([2600:4808:5693:8201:394e:8b9f:994c:b59f])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921787fd72asm83361756d6.12.2026.11.27.10.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:26:42 -0800 (PST)
From: Marco Chen <marcochen.dev@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	pmeerw@pmeerw.net,
	matt@ranostay.sg,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH 1/2] iio: health: max30102: rename fifo_count() to fifo_ready()
Date: Fri, 27 Nov 2026 13:26:35 -0500
Message-ID: <20261127182636.83803-2-marcochen.dev@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127182636.83803-1-marcochen.dev@gmail.com>
References: <20261127182636.83803-1-marcochen.dev@gmail.com>
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Post: <mailto:linux-kernel-mentees@lists.linux.dev>
List-Help: <mailto:linux-kernel-mentees+help@lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-kernel-mentees+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The max30102_fifo_count() function does not count anything. It only
reports whether the FIFO_RDY bit is set, or a negative error value.

Rename max30102_fifo_count() to max30102_fifo_ready() and make it return
a bool. A failed status read returns false, which the handler already
treats as no data being available.

With a bool, the use of cnt in max30102_interrupt_handler() is no longer
needed, and a do/while loop can re-check the status after each sample.
The sequence of status and FIFO reads is the same as before.

Suggested-by: Jonathan Cameron <jic23@kernel.org>
Signed-off-by: Marco Chen <marcochen.dev@gmail.com>
---
Follow-up to Jonathan's comment on v2 of the NULL-dereference fix from
a few months ago
https://lore.kernel.org/linux-iio/20260805015826.2b558119@jic23-huawei/#R
Thank you.

 drivers/iio/health/max30102.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/iio/health/max30102.c b/drivers/iio/health/max30102.c
index aee96167f01e..a553c0e011e0 100644
--- a/drivers/iio/health/max30102.c
+++ b/drivers/iio/health/max30102.c
@@ -235,20 +235,17 @@ static const struct iio_buffer_setup_ops max30102_buffer_setup_ops = {
 	.predisable = max30102_buffer_predisable,
 };
 
-static inline int max30102_fifo_count(struct max30102_data *data)
+static inline bool max30102_fifo_ready(struct max30102_data *data)
 {
 	unsigned int val;
 	int ret;
 
 	ret = regmap_read(data->regmap, MAX30102_REG_INT_STATUS, &val);
 	if (ret)
-		return ret;
+		return false;
 
 	/* FIFO has one sample slot left */
-	if (val & MAX30102_REG_INT_STATUS_FIFO_RDY)
-		return 1;
-
-	return 0;
+	return val & MAX30102_REG_INT_STATUS_FIFO_RDY;
 }
 
 #define MAX30102_COPY_DATA(i) \
@@ -291,10 +288,9 @@ static irqreturn_t max30102_interrupt_handler(int irq, void *private)
 	struct iio_dev *indio_dev = private;
 	struct max30102_data *data = iio_priv(indio_dev);
 	unsigned int measurements;
-	int ret, cnt;
+	int ret;
 
-	cnt = max30102_fifo_count(data);
-	if (cnt <= 0)
+	if (!max30102_fifo_ready(data))
 		return IRQ_HANDLED;
 
 	measurements = bitmap_weight(indio_dev->active_scan_mask,
@@ -302,14 +298,13 @@ static irqreturn_t max30102_interrupt_handler(int irq, void *private)
 
 	mutex_lock(&data->lock);
 
-	while (cnt || (cnt = max30102_fifo_count(data)) > 0) {
+	do {
 		ret = max30102_read_measurement(data, measurements);
 		if (ret)
 			break;
 
 		iio_push_to_buffers(data->indio_dev, data->processed_buffer);
-		cnt--;
-	}
+	} while (max30102_fifo_ready(data));
 
 	mutex_unlock(&data->lock);
 
-- 
2.56.1

