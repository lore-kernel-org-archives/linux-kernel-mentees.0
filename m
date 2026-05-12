Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872223A75B5
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 12 May 2026 22:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778625144; cv=none; b=WM7+Aj2Gf65i0/giWXZTZg+zYtcAj6zI+LSHNqnyFQe5kY8yJrEZVQzjdvA+RTVYY4QqX0nkq5gKPLhHir8p7H/ALlPysSHAq7e6rgQ/jAmN+/oKE/npiHjBHZ5ZLcFtV14D0Piym+87669a8HN9TqIerPj8fL0vSabi5IkRVqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778625144; c=relaxed/simple;
	bh=OxzII+fOTTxXBAPQvr40pTgzrSo9pzEfYKV4fx4Ik4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tBCOC6Hw2OGk1PhkD/CII/Dg+B7myBioGzTXz/ODjWxJIDgDFlOKvhSHHmZWSjdzQDczFgOrCHZt9njB9R8C0q5hiut0Uhksh/62HW2Rzm+IrARfRZNlra2aPEUchVktR+M9nEkm7iH0OFrFdqsvLDJgi7razQYMH/nDMnoKJ0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XYB1i5K5; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XYB1i5K5"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so67769205e9.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 12 May 2026 15:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778625141; x=1779229941; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZwtfBXvrnH+M3GRfA8qi3bYkua4D8Thb1Hd5ff45dQ=;
        b=XYB1i5K5CKQVqSSVfV52iHafQAQitWBls+Z5rUyHo5jUQqzkNdRoHsjfy6ALj9ZADY
         Bb9i4BARtt+c3tExtNI+PuDlyn3KTEyrzs1NcKOXag6Ca5CjlV/X5OQGEi2y8kwmpP0d
         CUhX03K8/NgtLhGySpPU9mszmY6oQ/bR/3rucRE0rhL8W89DF1VNcZ7E57YrWiymD0Xm
         +hEkER21vjZSFqaOB++X1qfunEXuGRkUnHSXxKU27/DU/uMGXq0hTVsq1d/cdUaq5aiO
         qM+ytEJAjPWMOMD541b0Hongg2MTCe+H9AkDl2IhEwRVNN05T6Xax+nlqWR4wcIMFh8N
         ewtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778625141; x=1779229941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EZwtfBXvrnH+M3GRfA8qi3bYkua4D8Thb1Hd5ff45dQ=;
        b=TzPVZrrIAsZg8GlnjTh8OwhXxkjDNAEC26Vt48uFZu3T/v7SIehSHLUChm48n9c+FZ
         h3yp+ebR2TSs2Rxf2QXu5woCVXxIOgq1B7AowtG7Z1D7btjNWurdAkCEdUyLVr8ppCqm
         oRPcXLyAr+J6NlOcfMnuTMWuv5ISHC6bxL4LXFUDfg7INL8salSOUyLUvm7fd8y8DgCM
         ew1dc0QE0r9uxBYOcN8XPnT/yD0CWYwdFzwyfQ5YEk6FwpZlMxL3F4cpFWU6YeJjv0OZ
         eZ2FRqqLjzzISn8kKasdZGy8sAGy+1pD7qsczMbDbVZTqXsHEPh8LukLHig2+5cultik
         yCjw==
X-Forwarded-Encrypted: i=1; AFNElJ9HMspUKTSYNqhcigAs+EKWKKJrPxjlfDt2LzKFCej14c7jcc84avR0NCcJnxrIWqbMa/enp1YXIv5L4ONqedE2Eqx+Rw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzer/jWtBTzPKWEqPrHyaM2Sbp7BgDrUKilE8MTSNrYKd5VGkv0
	VxXJzfia4Yu0swDsI9TDD8MtYEk/X3LG6EaJAjHTZnZiUqH4rpkEHLS9
X-Gm-Gg: Acq92OE19ukvXar46Bf5xTNrilJFlWfAhCQZnogFgy9X1qW6Vhbc8LCuW8j29VZuB58
	IrS0JHmtokuzmwElHyn48kuJu4/rOL9hRqckfbVhe9jkMVdj3oeu3o2f4+2V69wcX1ygEWNsQjr
	nmszO56o+g25Ma5HLBFtR4B4t++FE69R3G8K9RJSChX+ia+GB1EkcU+dvkkXVgu6XksmJBtfvLS
	DH4Oqe9wAUDN91DztCu4wSJfKu997C28C1ZTm8n2xkBkfjoj/AugzLcPEKjHOsGpSgv/xMOCwsA
	C2c/WxV2REURFGzt7LqPOGx9ypMZoDMLDe8Ia1e+GQea7tnipXnpW9mnzj+qfXIbPM3WJHB7ado
	WlAV03WJTRAR4wOA0FJ7cULDzcssQLsbrAL2bEsyBch9BRHMic6UEBSBBMzzXZAgkD2xs6BM9/e
	nQt4M6jZW95nU/LKbHhiULUH3prcolzwGF5MZmvkT/EzvIfmzAhx2Hv+A=
X-Received: by 2002:a05:600c:8b75:b0:488:7ff6:1f75 with SMTP id 5b1f17b1804b1-48fc9a3b8e2mr8939265e9.21.1778625141046;
        Tue, 12 May 2026 15:32:21 -0700 (PDT)
Received: from aldo-conte-t14.tailf68ad9.ts.net ([2a01:e11:5402:d840:f1ee:c5d:74e4:6e19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f3c65f2sm47377375e9.1.2026.05.12.15.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 15:32:20 -0700 (PDT)
From: Aldo Conte <aldocontelk@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	shuah@kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v2 3/5] iio: light: tcs3472: use devm for resource management
Date: Wed, 13 May 2026 00:32:13 +0200
Message-ID: <20260512223215.25596-4-aldocontelk@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260512223215.25596-1-aldocontelk@gmail.com>
References: <20260512223215.25596-1-aldocontelk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the driver to use device-managed resource allocation:
- Add tcs3472_powerdown_action() and register it with
  devm_add_action_or_reset() to ensure the device is powered down on
  cleanup. Before this patch, the chip remained powered if probe
  failed after enabling it.
- Replace iio_triggered_buffer_setup() with
  devm_iio_triggered_buffer_setup().
- Replace request_threaded_irq() with devm_request_threaded_irq().
- Replace iio_device_register() with devm_iio_device_register().
- Remove tcs3472_remove() as all cleanup is now handled by devm.

Rewrite the read-modify-write pattern in tcs3472_powerdown() and
tcs3472_resume() so the new register value is computed first, written
to the chip, and committed to data->enable only on success.

Use a local 'dev = &client->dev' in tcs3472_probe() to keep the devm
calls compact.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Aldo Conte <aldocontelk@gmail.com>
---
v2:
(Suggested by Andy)
- Rewrote read-modify-write in tcs3472_powerdown() and tcs3472_resume()
- Use local 'struct device *dev = &client->dev' in probe.
- Dropped "Compiled with W=1" and test details from the commit message.

 drivers/iio/light/tcs3472.c | 107 +++++++++++++++++-------------------
 1 file changed, 51 insertions(+), 56 deletions(-)

diff --git a/drivers/iio/light/tcs3472.c b/drivers/iio/light/tcs3472.c
index 4fd4fd74d0d6..7a6dc8360326 100644
--- a/drivers/iio/light/tcs3472.c
+++ b/drivers/iio/light/tcs3472.c
@@ -427,13 +427,38 @@ static const struct iio_info tcs3472_info = {
 	.attrs = &tcs3472_attribute_group,
 };
 
+static int tcs3472_powerdown(struct tcs3472_data *data)
+{
+	u8 enable_mask = TCS3472_ENABLE_AEN | TCS3472_ENABLE_PON;
+	u8 value;
+	int ret;
+
+	guard(mutex)(&data->lock);
+
+	value = data->enable & ~enable_mask;
+
+	ret = i2c_smbus_write_byte_data(data->client, TCS3472_ENABLE, value);
+	if (ret)
+		return ret;
+
+	data->enable = value;
+
+	return 0;
+}
+
+static void tcs3472_powerdown_action(void *data)
+{
+	tcs3472_powerdown(data);
+}
+
 static int tcs3472_probe(struct i2c_client *client)
 {
+	struct device *dev = &client->dev;
 	struct tcs3472_data *data;
 	struct iio_dev *indio_dev;
 	int ret;
 
-	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
+	indio_dev = devm_iio_device_alloc(dev, sizeof(*data));
 	if (indio_dev == NULL)
 		return -ENOMEM;
 
@@ -453,9 +478,9 @@ static int tcs3472_probe(struct i2c_client *client)
 		return ret;
 
 	if (ret == 0x44)
-		dev_info(&client->dev, "TCS34721/34725 found\n");
+		dev_info(dev, "TCS34721/34725 found\n");
 	else if (ret == 0x4d)
-		dev_info(&client->dev, "TCS34723/34727 found\n");
+		dev_info(dev, "TCS34723/34727 found\n");
 	else
 		return -ENODEV;
 
@@ -497,59 +522,26 @@ static int tcs3472_probe(struct i2c_client *client)
 	if (ret < 0)
 		return ret;
 
-	ret = iio_triggered_buffer_setup(indio_dev, NULL,
-		tcs3472_trigger_handler, NULL);
+	ret = devm_add_action_or_reset(dev, tcs3472_powerdown_action, data);
+	if (ret)
+		return ret;
+
+	ret = devm_iio_triggered_buffer_setup(dev, indio_dev, NULL,
+					      tcs3472_trigger_handler, NULL);
 	if (ret < 0)
 		return ret;
 
 	if (client->irq) {
-		ret = request_threaded_irq(client->irq, NULL,
-					   tcs3472_event_handler,
-					   IRQF_TRIGGER_FALLING | IRQF_SHARED |
-					   IRQF_ONESHOT,
-					   client->name, indio_dev);
+		ret = devm_request_threaded_irq(dev, client->irq, NULL,
+						tcs3472_event_handler,
+						IRQF_TRIGGER_FALLING | IRQF_SHARED |
+						IRQF_ONESHOT,
+						client->name, indio_dev);
 		if (ret)
-			goto buffer_cleanup;
+			return ret;
 	}
 
-	ret = iio_device_register(indio_dev);
-	if (ret < 0)
-		goto free_irq;
-
-	return 0;
-
-free_irq:
-	if (client->irq)
-		free_irq(client->irq, indio_dev);
-buffer_cleanup:
-	iio_triggered_buffer_cleanup(indio_dev);
-	return ret;
-}
-
-static int tcs3472_powerdown(struct tcs3472_data *data)
-{
-	int ret;
-	u8 enable_mask = TCS3472_ENABLE_AEN | TCS3472_ENABLE_PON;
-
-	guard(mutex)(&data->lock);
-
-	ret = i2c_smbus_write_byte_data(data->client, TCS3472_ENABLE,
-		data->enable & ~enable_mask);
-	if (!ret)
-		data->enable &= ~enable_mask;
-
-	return ret;
-}
-
-static void tcs3472_remove(struct i2c_client *client)
-{
-	struct iio_dev *indio_dev = i2c_get_clientdata(client);
-
-	iio_device_unregister(indio_dev);
-	if (client->irq)
-		free_irq(client->irq, indio_dev);
-	iio_triggered_buffer_cleanup(indio_dev);
-	tcs3472_powerdown(iio_priv(indio_dev));
+	return devm_iio_device_register(dev, indio_dev);
 }
 
 static int tcs3472_suspend(struct device *dev)
@@ -563,17 +555,21 @@ static int tcs3472_resume(struct device *dev)
 {
 	struct tcs3472_data *data = iio_priv(i2c_get_clientdata(
 		to_i2c_client(dev)));
-	int ret;
 	u8 enable_mask = TCS3472_ENABLE_AEN | TCS3472_ENABLE_PON;
+	u8 value;
+	int ret;
 
 	guard(mutex)(&data->lock);
 
-	ret = i2c_smbus_write_byte_data(data->client, TCS3472_ENABLE,
-		data->enable | enable_mask);
-	if (!ret)
-		data->enable |= enable_mask;
+	value = data->enable | enable_mask;
 
-	return ret;
+	ret = i2c_smbus_write_byte_data(data->client, TCS3472_ENABLE, value);
+	if (ret)
+		return ret;
+
+	data->enable = value;
+
+	return 0;
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(tcs3472_pm_ops, tcs3472_suspend,
@@ -591,7 +587,6 @@ static struct i2c_driver tcs3472_driver = {
 		.pm	= pm_sleep_ptr(&tcs3472_pm_ops),
 	},
 	.probe		= tcs3472_probe,
-	.remove		= tcs3472_remove,
 	.id_table	= tcs3472_id,
 };
 module_i2c_driver(tcs3472_driver);
-- 
2.54.0

