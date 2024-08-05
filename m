Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8FC15EFA6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  5 Aug 2024 17:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722879223; cv=none; b=c4vdsotZGZurj4px2aKSOZgZUfrOrXaS6RyWDamU4gZtjZ5TZxPmnlnhy/E/IhWuXow+SN9eAA2ITbNtkXnfXhl0uZjXbdmvwtsNBt5QigZ5jXoJpmGmfP/o60yZjB1NMmKHMhn42Anjwvf206pqmM1NjSpJy0NVecZljgmqGPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722879223; c=relaxed/simple;
	bh=VDS7j49BPsnFZeqpRirK8AxjIZsyvDDjwjimYbyb+A8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rFYdevyaFMA55fKXUTSmKJWltjuXUy2yDBDw9cEUet8XXPgyR1NaQX8t5DtLIxnMiZXwKVyKS8UJVR9ZQyssAHStHaIJlCixkuEO6Y5tZZEwS3RES0t7fPNYaXcXkVTuCj/2t44lUZNyJzMyEw9s4UM7UoHFQYH09I2Bshr+sXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C3Br970Q; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C3Br970Q"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E704B6065D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  5 Aug 2024 17:33:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QqjpurrLQkaJ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Aug 2024 17:33:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 405E260632
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 405E260632
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=C3Br970Q
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 405E260632
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  5 Aug 2024 17:33:40 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-70d18d4b94cso7821644b3a.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 05 Aug 2024 10:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722879220; x=1723484020; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BC58ALjQ0k/p2Nsr/D+i4BGJm6NI6tNXoREVe12sSXQ=;
        b=C3Br970QOtRzFeQZKsK45Wk0xq++pQ8yV3hS5NqxjA02H54p5fY13gzoxD8mIHcFtA
         /CYIK5bwyUhhP3s1IqT5u5zMGCJhvCIEj2DNJEO80PNwJvG5WdYzjbHj+722sRP8BMgm
         hN022ZGXEotPKI1AwNxyi6mzNRhog7i35jQevAz4L6caOAq87US0MaKbm0NTtJJPbBx+
         BD/4I4aK9YukNaVwNW/8pUPqYgWl9AmIeuj7wqQhRZiK2+A69FOkKYEgp/+iPB7BPO8v
         73riBQtYpSycbtrC1uzjIQIQLFuYdLynlYW6JFwAdzebPp+a74n7T5InqdBtjjgKNL5S
         Kq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722879220; x=1723484020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BC58ALjQ0k/p2Nsr/D+i4BGJm6NI6tNXoREVe12sSXQ=;
        b=CVUCHGyqknUbMRwF5vhppnaZmQQEEbpf9sx0826Hu+lHoT7BPWMAyIOee8Ar+Yg5Pg
         UwVtNEbIwvFN+wIqsnWvx6ThZ5imJhf24g6rFWvPwpgwidzBvdu8XkyeqdZE8vNxRUtz
         nZg7dZSgSt1FoXjt5jiUY8EjUyXmoPQ/2B0OUy2W92win5cJ+EY+VM4iV9o+yzB8SPN6
         VVNAvAYz8VeM9337hPN/TpLtFVLssmeex2NTZCREQQyJBs+iQkqcy7HIXHlR51dajVY4
         wPRUm6h+DkrJl1LVLmvJLkoYXx2IE8puVpGmM13l3Ky3sbx705hGWulOUsTLvTyEvF8g
         Vu1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWyZlqdq6ODxK0v2rNWesNKAOaQn0OWQTcJgZ03iPhkyH0lkZW/l/KYaehWjFKtLuTmUV7KPRdy42h2d3aYZpFB+Gn+GQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yx3YUnRB8kGivpJiMDukqwOkdxUW05XxiRduRtFccY0xWBnUxIR
	6bmXjDJUho0VSha7MlivBd4C13CtHYJojzh6uM5bicbP7uRcdrYK
X-Google-Smtp-Source: AGHT+IG09fbbSSvmY0g0CZtZReU/Xafert7x3pxP12VhBGiXyRrY3gH9XY2qrh3kran4KU/jGnehWg==
X-Received: by 2002:a05:6a00:4b4f:b0:70e:8f75:35b2 with SMTP id d2e1a72fcca58-7106cfa6ddbmr11487080b3a.12.1722879219928;
        Mon, 05 Aug 2024 10:33:39 -0700 (PDT)
Received: from embed-PC.. ([122.169.160.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ecdfed4sm5620807b3a.119.2024.08.05.10.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 10:33:39 -0700 (PDT)
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: jic23@kernel.org
Cc: lars@metafoo.de,
	andriy.shevchenko@linux.intel.com,
	biju.das.jz@bp.renesas.com,
	nuno.sa@analog.com,
	skhan@linuxfoundation.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] iio: accel: bma180: Fix dataready interrupt to use INT2 pin
Date: Mon,  5 Aug 2024 23:02:37 +0530
Message-Id: <20240805173237.475797-1-abhishektamboli9@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the interrupt configuration to use the INT2 pin for
the dataready interrupt.

Address the FIXME: support using the INT2 pin.

Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
---
 drivers/iio/accel/bma180.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/accel/bma180.c b/drivers/iio/accel/bma180.c
index 6581772cb0c4..d44409afffbf 100644
--- a/drivers/iio/accel/bma180.c
+++ b/drivers/iio/accel/bma180.c
@@ -126,7 +126,7 @@ struct bma180_part_info {
 #define BMA250_SUSPEND_MASK	BIT(7) /* chip will sleep */
 #define BMA250_LOWPOWER_MASK	BIT(6)
 #define BMA250_DATA_INTEN_MASK	BIT(4)
-#define BMA250_INT1_DATA_MASK	BIT(0)
+#define BMA250_INT2_DATA_MASK	BIT(7)
 #define BMA250_INT_RESET_MASK	BIT(7) /* Reset pending interrupts */
 
 struct bma180_data {
@@ -425,10 +425,9 @@ static int bma250_chip_config(struct bma180_data *data)
 	if (ret)
 		goto err;
 	/*
-	 * This enables dataready interrupt on the INT1 pin
-	 * FIXME: support using the INT2 pin
+	 * This enables dataready interrupt on the INT2 pin
 	 */
-	ret = bma180_set_bits(data, BMA250_INT_MAP_REG, BMA250_INT1_DATA_MASK, 1);
+	ret = bma180_set_bits(data, BMA250_INT_MAP_REG, BMA250_INT2_DATA_MASK, 1);
 	if (ret)
 		goto err;
 
-- 
2.34.1

