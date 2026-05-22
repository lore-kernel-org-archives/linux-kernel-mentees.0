Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27DE3BB9E1
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 22 May 2026 12:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779453270; cv=none; b=DWCsSHPNbdqKWeWhw9OES4EEuxSyccFopEf6pJVe+Rwpq7+CIWJtFW+9kQ1VK3KbRYxasaId8JdtQZ8UogBtrMacofz9/BgkvM0axXL5wGNpxpQiltO5enSHFZgmUNRkYstKpt5NfaSOlSomPvFBu45HP+f0rkrx+eGL6U1ICM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779453270; c=relaxed/simple;
	bh=GgdK1NdF3v1bW+YEFIuLHRfz4sXog4cMyMCRp7zuipk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pbypfo3ccXLVvVVPoQCT//pcoB820pADGf9lpl4JCcf/vTYBFy3bLle+hviE80l3xozevO7vH9GPsJdGoP4R5gXsew7AmHhXjGST4l+GuGreLMh5oGsMja+h3iAUe1q3lUUPDELZpjMig4PF75PvAjZ2fEpPLY3b33wy/Yb3330=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A9/IvXuW; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A9/IvXuW"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49042aeeb75so11039705e9.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 22 May 2026 05:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779453267; x=1780058067; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/9MVD6i7sa82Oj//XUlVTMNpu1VIZIfx70ZqUMN7z/Y=;
        b=A9/IvXuW3lvWlbM4jKP/UEecmSCvpKZEOn3iWkDcyzsYI6crxgOCQc1XDKGer7C/yy
         npEeyEX20Pmda70Ob+fhipg4LZGacXKLQvEdHqm02i5UiEkUIMh6elzerG7ULdqjHQL8
         EUJL+RCmyWw1s94BDEnwVW45CHu1K/r0hn0wBIGLjBZghq/ZcZxZsF0z8tMCT66BY9bO
         LMVrDzeM+8rl8bcThQWXA1PukOXJ4abQmrX5b/9i7F23wvStfjQ7RlPVPRcURBzFqNKj
         gvRVUnJXoch1IJ1DM2OXjqtCG4VOdNn0Ez9Bz4t51KrRXmoOqe2SO5jNXBEbL6MS0jnQ
         Ty/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779453267; x=1780058067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/9MVD6i7sa82Oj//XUlVTMNpu1VIZIfx70ZqUMN7z/Y=;
        b=lM5RzYSGliV3UEUNUA9XdBW3Az74zL/IJL4EwUJRkaZwb3DBVlxINSDtCXL7wn3Omr
         ijs96gwfBNjbap1/ekBmLpIq2hfXgatJ0+qKAl4HwxUTsvWRtXmKxv0mWpHTy6DOVKi2
         RsdYrI+zjf7C7v+5fgRAnHL22XSPuOExR+OPnkHSjaq4SiWk3W9NwG6A9BBkcJc2Bh4B
         kH/63O9DDQpFEqNOjDYQ8zqZ/h5lG+2CsS6v6FSeh1uyqSXuupvY8gT3Ec6skcDm1mB3
         mB4m2taSKSiALWoRQiLsk7o0ArbRCYpgjwXZZKeOOsr6PeKR5w0YhkrKj/Ymt72ayqIU
         6fUg==
X-Forwarded-Encrypted: i=1; AFNElJ9Ux7YzW0yoFgDAHYyuCbNGfFoIrIf1lxvUQsYDNAPGGucHMPFimAG+fk/ruWqizruqzdeunlFppPnpgKb5rtkOBupciQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyhuydpnMroM4vCtJEfsG5OQvF+ylG7zFSAveUib+fybWDR+0Vc
	b/nyZuB0K+qh9Nbv+aVejyaILZTbYJRIoi7IroK8d62UzSkci8RXrGG4
X-Gm-Gg: Acq92OHCVZNkldxZbuIi9W4vUN4ixjW5gIBw8CNYbu7E0piwLw6v8yliP2I6397mN/8
	bdlSFD1ycuLd5AcIh0ahq4RgkvqtzBc+9IN/xT1UJwY1WIJ2WCkHtDFK5rNwGNciJSl7ePmx9S+
	F4s5EFWvlFxDing5Sb42zAy86i5JNt6FLU4EZKMLii8OJgo0p3gGSXM4d65d7T5kJ5zrsJdBub7
	7FdWqdwWyTFEZEEXoB27NKi/FXa9QgO9V8S1Wc5mIOORtEDppJWo7XVa0nM763o+PpXGqOx5CFs
	HvgaeGP1C/GPK36acaDKTdZNEK5pEtA9SeUcj4Q9/h0etTA9z8z4Pkx20tGsUaCCM1ouiG8lBZ4
	9BMPOAbg4MoDWeQ4tbFNvJqVc9BR60yXnk/OkjiNkGq9fmiO69/tUEr+NxHL0dc7RMm3lWTDPDB
	m4BR0nHzDRDGTOvIZEts4Hnm/acSvZbMG8tdGX3DsZevpju/+YuOxY
X-Received: by 2002:a05:600d:108:10b0:48f:fe2a:107b with SMTP id 5b1f17b1804b1-4904249d1f9mr36827575e9.7.1779453266742;
        Fri, 22 May 2026 05:34:26 -0700 (PDT)
Received: from aldo-conte-t14.tailf68ad9.ts.net ([217.61.173.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49042af0ac1sm14760175e9.31.2026.05.22.05.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 05:34:26 -0700 (PDT)
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
Subject: [PATCH v3 5/8] iio: tcs3472: use devm for resource management
Date: Fri, 22 May 2026 14:34:16 +0200
Message-ID: <20260522123420.45495-6-aldocontelk@gmail.com>
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

Convert the driver to use device-managed resource allocation:
- Add tcs3472_powerdown_action() and register it with
  devm_add_action_or_reset() to ensure the device is powered down on
  cleanup.
- Replace iio_triggered_buffer_setup() with
  devm_iio_triggered_buffer_setup().
- Replace request_threaded_irq() with devm_request_threaded_irq().
- Replace iio_device_register() with devm_iio_device_register().
- Replace mutex_init() with devm_mutex_init().
- Remove tcs3472_remove() as all cleanup is now handled by devm.

Use a local 'dev = &client->dev' in tcs3472_probe() to keep the devm
calls compact.

Signed-off-by: Aldo Conte <aldocontelk@gmail.com>
---
v3:
- Drop Suggested-by: Andy (inappropriate tag).
- Drop powerdown bug fix (now patch 1).
- Drop powerdown/resume RMW refactor (now in guard patch).
- Drop TCS3472_ENABLE_RUN define (now in wait time patch).
- Drop dev_info() conversion (now in separate patch).
- Add devm_mutex_init() for the lock (suggested by Joshua).

 drivers/iio/light/tcs3472.c | 63 +++++++++++++++----------------------
 1 file changed, 26 insertions(+), 37 deletions(-)

diff --git a/drivers/iio/light/tcs3472.c b/drivers/iio/light/tcs3472.c
index d7b5805108f6..4966abf83c18 100644
--- a/drivers/iio/light/tcs3472.c
+++ b/drivers/iio/light/tcs3472.c
@@ -17,6 +17,7 @@
 #include <linux/delay.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/pm.h>
 
 #include <linux/iio/buffer.h>
@@ -445,20 +446,28 @@ static int tcs3472_powerdown(struct tcs3472_data *data)
 	return 0;
 }
 
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
 	if (!indio_dev)
 		return -ENOMEM;
 
 	data = iio_priv(indio_dev);
 	i2c_set_clientdata(client, indio_dev);
 	data->client = client;
-	mutex_init(&data->lock);
+	ret = devm_mutex_init(dev, &data->lock);
+	if (ret)
+		return ret;
 
 	indio_dev->info = &tcs3472_info;
 	indio_dev->name = TCS3472_DRV_NAME;
@@ -515,46 +524,27 @@ static int tcs3472_probe(struct i2c_client *client)
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
-		goto error_powerdown;
+		return ret;
 
 	if (client->irq) {
-		ret = request_threaded_irq(client->irq, NULL,
-					   tcs3472_event_handler,
-					   IRQF_TRIGGER_FALLING | IRQF_SHARED |
-					   IRQF_ONESHOT,
-					   client->name, indio_dev);
+		ret = devm_request_threaded_irq(dev, client->irq, NULL,
+						tcs3472_event_handler,
+						IRQF_TRIGGER_FALLING |
+						IRQF_SHARED |
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
-error_powerdown:
-	tcs3472_powerdown(data);
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
@@ -598,7 +588,6 @@ static struct i2c_driver tcs3472_driver = {
 		.pm	= pm_sleep_ptr(&tcs3472_pm_ops),
 	},
 	.probe		= tcs3472_probe,
-	.remove		= tcs3472_remove,
 	.id_table	= tcs3472_id,
 };
 module_i2c_driver(tcs3472_driver);
-- 
2.54.0

