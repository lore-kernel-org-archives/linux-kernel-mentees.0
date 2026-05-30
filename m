Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0AB3AA50A
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 30 May 2026 11:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780141221; cv=none; b=llER+M+6gXRHLTYJEIo3bm0idmIXYWXzbNR5IISeIEhyrS9cqSNFaeG+F4p0jAYErSR6tOoBVC4pdZ28ZJZFaoQB9VhQnwtCg8eh+8sP+Y0u1UhCHE/nntAyny/6GybfLPaYowUEY3mL5HepDph+hU/DVx8jae7ur6OY9YntBus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780141221; c=relaxed/simple;
	bh=NBy+mkNrqimaOWf2ERo+sQjKJUgFdTb/ZQTPXdtPvfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YoaS9XNy+UAMm1ME+Fd/pKrV9Gf3dVR0ROlR4zhwK5iWbFOZITerf9H/GcZKz/v9pznA/Treg20Kk4pWo/OlJJBzlT3Cjgs07J5iQ0IX/c2m0ISHgs2NaYGuWUMhSlgPiIWATWkNkaGVx7BSNoG+39P4jnukkKw7isxaadTtk+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=je6DXnbe; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="je6DXnbe"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-842307472d4so64574b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 30 May 2026 04:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780141219; x=1780746019; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AgCJI2YjM9JuHXtmrKn60x1jsb6A7Po4zShmgNdGeKM=;
        b=je6DXnbejqD5NpCQAikr3IYOLVimonv/BKB0UVnVz95rV0OZozWAxS7qNjlFUNvNw/
         XQcsN4mzGldrfN2B14OrWzuPPIdyYGhv88yF1AppfoR7dnKQdptOLrhUuqveY4Axxhyo
         7YzRZHcQPIeKiu1UxIG/nMqp6FAoI8uABJRAFXi59n35JtXsIVNxSmBvtDd3ccfqrJKy
         0FITvHSmVsDqfDEMb5wgYbz4ETbjATK4sVvq5NY46UOY8n714qS9STbzPxCotauXWDft
         DQ1+uq1JT1MbAFUNjMDw2DNeyWpnpBW1UcdWY/aYCsmeSKTa0ZRD5U35xwr9ovs7vqr1
         a/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780141219; x=1780746019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AgCJI2YjM9JuHXtmrKn60x1jsb6A7Po4zShmgNdGeKM=;
        b=BmarWdUYZu0ADflUUzlH5mIsJynocVjn98R5uUAVaAcsDDoObi/7ndj9v+8nG+u2u/
         QU0GGzQAxAFp3eTJSni8hAXojUteceDEDJ8niX4VQ0n3aE9iUPI3OIn6hXi6jCUzG1M1
         0pJLXUT/T9LWkbu3iL0iUgI/Dnot9Sq+wiU294n9mytOS1E5PZI+DNdTYwFiHDlax+UQ
         muPPt9RBR/7Z/8sy15hfraCkp0zx0va8Qz69bIM9GyB4woPskl4pGEnSMlWjult8Mntk
         cfcY8bEqVdQznDzaycgxXiiEVZ0wecaWYLAMv6KoPlcHcsIcesBbxg1L0fEr74DJ+o0y
         cn1Q==
X-Forwarded-Encrypted: i=1; AFNElJ+OlLA053xOuvAo7IKfzl1TAm8Z4qRGaKG+LNPqXe1+CyWrPtAbDrj1glloK5ICQ2a9JjxJ9nDv/xWpugdgXm/s/DQGTg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwauD8nS/3MNDRvHN3HJonbklBbtwYiRkQGbAc+UItroeybg/+j
	a8JmWLBl0YdAqkcT3yU/vPFzKG2bSAsgnaadqtFJS6i3UjC1Q7r31UWS
X-Gm-Gg: Acq92OFteQSmqA4M3l1eIbTH/jEEV9qjXsf7KkzTGKJSyN+Btl0QwWLsey+YVsocz1H
	UEvaEpanwzvHpVyr/pyqxxOMNHy2Kk6e4UiSYOc3dEaVzmq+sVlfbcmWvSFgaOOTdSsLFjIul7Q
	Xu+me17nZzdCH2eMcfTFM4pI/GAjGIPNvP+xQVZ94I6M7FIx0DlxSvQOLNRW1naueye6MH73PoR
	GqkwxFa/ku/2h/W4ycdvvsuuJLFeFFn1cS/g+RUctBuS1Eyu+xyBN1Q04SExi+bVYqaMk+cb8kl
	YWGOhKNjRViOvHTX0NNPnV2A0JPQ3At/14G3eicRQuiPZ097VGSag9nd8bX/Arm3hibYeOiGFMa
	sXk074qDhFO87f2+XYU5nqpGy6m2fI3AWSEcZFT8MDL2OYYrt6kV3IkqrGXnTpnwJjHIVD9i7mo
	2nMYOb1DErsmCs0e0vxe3ih6eMmogTMRjYXU1+MY7V/HfOuqNnstZC+D/YBX/zeRRf4QSW
X-Received: by 2002:a05:6a00:27a0:b0:833:2398:cde2 with SMTP id d2e1a72fcca58-8422570a361mr2969224b3a.43.1780141219248;
        Sat, 30 May 2026 04:40:19 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214b6797esm5467518b3a.26.2026.05.30.04.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 04:40:18 -0700 (PDT)
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
Subject: [PATCH 3/4] iio: pressure: mpl3115: generalize interrupt pin routing
Date: Sat, 30 May 2026 20:39:37 +0900
Message-ID: <20260530113938.171540-4-suunj1331@gmail.com>
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

Write CTRL_REG5 explicitly for both INT1 and INT2 rather than
relying on power-on defaults when INT2 is selected.

This avoids incorrect interrupt routing after a suspend/resume
cycle where the register may not return to its default state.

Route both DRDY and FIFO interrupts to the selected pin. The
FIFO routing is not yet used but is required by the hardware
FIFO support added in the following patch.

Consolidate polarity configuration into a single code path
that handles both interrupt pins uniformly.

No functional change intended.

Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
---
 drivers/iio/pressure/mpl3115.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/iio/pressure/mpl3115.c b/drivers/iio/pressure/mpl3115.c
index 52a3d0d59769..90e83e34ec43 100644
--- a/drivers/iio/pressure/mpl3115.c
+++ b/drivers/iio/pressure/mpl3115.c
@@ -67,6 +67,7 @@
 #define MPL3115_CTRL4_INT_EN_TTH BIT(2)
 
 #define MPL3115_CTRL5_INT_CFG_DRDY BIT(7)
+#define MPL3115_CTRL5_INT_CFG_FIFO BIT(6)
 
 static const unsigned int mpl3115_samp_freq_table[][2] = {
 	{ 1,      0 },
@@ -624,6 +625,7 @@ static int mpl3115_trigger_probe(struct mpl3115_data *data,
 {
 	struct fwnode_handle *fwnode = dev_fwnode(&data->client->dev);
 	int ret, irq, irq_type, irq_pin = MPL3115_IRQ_INT1;
+	u8 ctrl_reg5;
 
 	irq = fwnode_irq_get_byname(fwnode, "INT1");
 	if (irq < 0) {
@@ -634,6 +636,9 @@ static int mpl3115_trigger_probe(struct mpl3115_data *data,
 		irq_pin = MPL3115_IRQ_INT2;
 	}
 
+	ctrl_reg5 = irq_pin == MPL3115_IRQ_INT1 ?
+	    MPL3115_CTRL5_INT_CFG_DRDY | MPL3115_CTRL5_INT_CFG_FIFO : 0;
+
 	irq_type = irq_get_trigger_type(irq);
 	if (irq_type != IRQF_TRIGGER_RISING && irq_type != IRQF_TRIGGER_FALLING)
 		return -EINVAL;
@@ -643,23 +648,19 @@ static int mpl3115_trigger_probe(struct mpl3115_data *data,
 	if (ret < 0)
 		return ret;
 
-	if (irq_pin == MPL3115_IRQ_INT1) {
-		ret = i2c_smbus_write_byte_data(data->client,
-						MPL3115_CTRL_REG5,
-						MPL3115_CTRL5_INT_CFG_DRDY);
-		if (ret)
-			return ret;
+	ret = i2c_smbus_write_byte_data(data->client, MPL3115_CTRL_REG5,
+					ctrl_reg5);
+	if (ret)
+		return ret;
 
-		if (irq_type == IRQF_TRIGGER_RISING) {
-			ret = i2c_smbus_write_byte_data(data->client,
-							MPL3115_CTRL_REG3,
-							MPL3115_CTRL3_IPOL1);
-			if (ret)
-				return ret;
-		}
-	} else if (irq_type == IRQF_TRIGGER_RISING) {
-		ret = i2c_smbus_write_byte_data(data->client, MPL3115_CTRL_REG3,
-						MPL3115_CTRL3_IPOL2);
+	if (irq_type == IRQF_TRIGGER_RISING) {
+		u8 ipol = irq_pin == MPL3115_IRQ_INT1 ?
+			  MPL3115_CTRL3_IPOL1 :
+			  MPL3115_CTRL3_IPOL2;
+
+		ret = i2c_smbus_write_byte_data(data->client,
+						MPL3115_CTRL_REG3,
+						ipol);
 		if (ret)
 			return ret;
 	}
-- 
2.52.0

