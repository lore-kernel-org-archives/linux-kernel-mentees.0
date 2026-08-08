Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFE43B8939
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  8 Aug 2026 09:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786179671; cv=none; b=tuzLzb08ej7SUohgzRFnheEz6fHlBxt/isCu1ixywvaXsiiQcjnPLZmpG03h23lCaY8s+57h0XIfFdsottEZDs7FvZWNNSd/3IqNgmShVrKZQaZ/w+zbmV1IrB0JgdvNs4VdHHc5l27AWPIGU+z8xMJ62gCZYkuYZjr1zXp78ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786179671; c=relaxed/simple;
	bh=EHfaoi/H5aVDlNxnEr2yGng8APrb8ROD3VYBvv0JVis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tth4y+Q9RT6wWmr653DfKl1ZRszTHzGdzMBiqVpHBXAi/yzYlkwsOEdSDyWwckGNnH0Gl0o3oEKDnYYbzn9qt8GpP3CpP+wbqVlZxJnWvjjBkFZq6K55P/MrAxo5DlVpUjPzW0UOXB9s9hJdzZo51PCq3uKSavDYDKdPnIPumpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=be5af1cr; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="be5af1cr"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84862b0d5f8so214236b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 08 Aug 2026 02:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786179668; x=1786784468; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y0kd4BZdCcR2jnnA1HcZjBK3ddxINoAkrrsu0qcIwIE=;
        b=be5af1criSCoyqO7MsWthc28d/cGCXn2+2oX2y+3NWCLS8/02XI/NziHyaAWcTGFcD
         XMJMIsrRbmfUCloirg4H0CY++/pm0VPNw5ahhSYHsoocQe4WCZLolF4eojySH8gn6kNM
         vIEyzdDVnOPOc0r6eBxue8+V6WLv5y9vXjoxDtQpUdIQJ7ZEIqT8DmOcYhAnYLbNOV4M
         5H4y/YmuVpdyBcn+ZokSCHoQCqR+f8Hd9yPH5dTMwRVJhzbTNGJvg51Qcycxi1fz5gEi
         zyI4TBZLo2BK+WAiy3bfqQ7k4lzLcMBTWERO0t0YPUDSGOPrjQfk5hGtto6wfr5Av6oO
         fttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786179668; x=1786784468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y0kd4BZdCcR2jnnA1HcZjBK3ddxINoAkrrsu0qcIwIE=;
        b=OvwBwZI8zBe433HEsfrmgZax/HGQTZn8F2C9Om7VOcgJNsXDAW10Sj+o8OotDPVg1e
         p7SIhB+Vi0qJu0UXTJo/K/fzpoHw7S7CVe+B9Q6gElVbI2TRe72dh9OmPJn+4e1n4fzz
         zk9Mh6E8M4/Ozb+oLGS1m390uprAfKZSkoo6bZqsm9Nkd1FYxjWIXL3SRcBkPZTjlGXm
         5cP2aO0qdg+eqVejs7ZJzh+xSRD+nd5no6fUaDG1D6eyyMM35CSxj9CKlYYJzkzNaup5
         VcpHpG7T91dRPTgShswbq55FlxdRFj7gOW9FX+G1zFJnfuuiYiiZ3YSlT21KRnJlCW88
         nhqg==
X-Gm-Message-State: AOJu0Yxpa/byWuW02v8DV6wNhp0q98ezaDjEp7XtdjHMic371hmUj8WE
	c6As5ewzS3oB8o3W0aEmBSRcFNMI2uYt3u01IPnt0o5V7LCj/kyqyZt8
X-Gm-Gg: AR+sD130d0TMoFIY6Kojhw0gtk5HpT3oukPGxric0GSv5e3bL66RR/8l3E0U9S3fthe
	hFldJjabkdcsGqhBLPKcwA8ax3phPN7keUe11Gm4NXk5c2CvJzwVAL4BntR1sHjqsgIA/CT4TjZ
	rP1X2KTssY1UK/dYltNIvmdaVck9TIkaXYKbAx85+Vhjy5Xk8VoHnjc8oz7KkqRKigXVNqD2aJ7
	nKcKLju83EehCWg0oIW/WNIdocKHDtyzH+6XF4wKNWuI7xVScwQ3UHSSKqSEc1sJEm6prMcIh6C
	yg4PA+rzM5kWNtr+328qXC1dY3NdlNPSSumQWvC3bW365DsQdIUKNsJ5XGyMpYR8BbT0SViMykE
	NSfm1S6Axi4hGKPxTyEEq3ks5ZmvNsZVzinz/QnEJAZmlNnQZSGhi4FEvMHVvrHqeiYb9b7gcwo
	yDDYwON0rhc2JByypGnA9QcQEtpO/6n9+Gt3N3n7k3Z9DkRSuaSX/+ObDFm9JkS1KRVJEVmIKbf
	nc6My3vb2By8QIeiBYpOIlvoP1iYe42cliPlThdX2U5n82urK9EDt6ZNqQrKA==
X-Received: by 2002:a05:6a00:8d1:b0:845:ba94:a56 with SMTP id d2e1a72fcca58-84f4fd9f82amr15992649b3a.5.1786179668348;
        Sat, 08 Aug 2026 02:01:08 -0700 (PDT)
Received: from debian13.localdomain (bb219-75-96-14.singnet.com.sg. [219.75.96.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a51e9f0sm1973871b3a.28.2026.08.08.02.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 02:01:07 -0700 (PDT)
From: Adi Nata <adinata.softwareengineer@gmail.com>
To: lorenzo@kernel.org,
	jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linux.dev,
	Adi Nata <adinata.softwareengineer@gmail.com>
Subject: [PATCH 3/5] iio: humidity: hts221: Allow unknown whoami for DT fallback
Date: Sat,  8 Aug 2026 17:00:24 +0800
Message-ID: <20260808090026.34187-4-adinata.softwareengineer@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260808090026.34187-1-adinata.softwareengineer@gmail.com>
References: <20260808090026.34187-1-adinata.softwareengineer@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The WHOAMI check currently returns -ENODEV when the chip ID is not
0xbc. That rejects Device Tree fallback compatibles.

Keep failing if the WHOAMI register cannot be read. On an unexpected
ID, log it and continue so OF fallback matching can work.

Use dev_err_probe() for the read-failure path.

Signed-off-by: Adi Nata <adinata.softwareengineer@gmail.com>
---
 drivers/iio/humidity/hts221_core.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/iio/humidity/hts221_core.c b/drivers/iio/humidity/hts221_core.c
index 76a391f421f5..da773d2edc80 100644
--- a/drivers/iio/humidity/hts221_core.c
+++ b/drivers/iio/humidity/hts221_core.c
@@ -139,16 +139,13 @@ static int hts221_check_whoami(struct hts221_hw *hw)
 	int err, data;
 
 	err = regmap_read(hw->regmap, HTS221_REG_WHOAMI_ADDR, &data);
-	if (err < 0) {
-		dev_err(hw->dev, "failed to read whoami register\n");
-		return err;
-	}
+	if (err < 0)
+		return dev_err_probe(hw->dev, err,
+				     "failed to read whoami register\n");
 
-	if (data != HTS221_REG_WHOAMI_VAL) {
-		dev_err(hw->dev, "wrong whoami {%02x vs %02x}\n",
-			data, HTS221_REG_WHOAMI_VAL);
-		return -ENODEV;
-	}
+	if (data != HTS221_REG_WHOAMI_VAL)
+		dev_info(hw->dev,
+			 "unexpected whoami 0x%02x, continuing\n", data);
 
 	return 0;
 }
-- 
2.47.3

