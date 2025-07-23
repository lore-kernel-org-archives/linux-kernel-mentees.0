Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06AB2DCBF5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 23 Jul 2025 14:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753280053; cv=none; b=XWohQy5B5jYQgOsv+oVKhBl4V17Y3yv7WJZAsRK0GkmjGc0XAjxQL7F/scaqZRyVC+osPKZqIQUDXto9105EwsSl4alXZt64nwthma81LxCETMG+/Dwvu2uf5bdVc/m6Bw7yCIdQ1J7islqEhKs3t4RqV9EFOnsTzmRSou2BrFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753280053; c=relaxed/simple;
	bh=HGX2VLgyyt0GtxeLZpC1unio0AwmsC5hJT7R2JwR87U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ST/EMF1I9Prt5dwJ/4d1lbMn3Q2Iz4/eGx8xkeo8kqpmkiH4aJl/ym3aLxoEhqUtklcLNDLg++uf/FuykHrdCn63u6OLHKps1CgT8MgoAnaX0w0qrypb/qYfs5e5YEe2rclj3OZEVNzMl9eM48dC3ydv+ga/cjw/iP/iu9Fl5MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nKVbxF8W; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nKVbxF8W"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C85840E2D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 23 Jul 2025 14:14:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.236
X-Spam-Level: *
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VBfgSzcFNXHh for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Jul 2025 14:14:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=akbansd@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9B15740C5D
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B15740C5D
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nKVbxF8W
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 9B15740C5D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 23 Jul 2025 14:14:11 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-74931666cbcso5470737b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 23 Jul 2025 07:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753280051; x=1753884851; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nGCHphQckRxgoSh5w4iIxG/Rjxd4ND4u2+j5qV3kR94=;
        b=nKVbxF8WG2cMkWk1zLZ/X6HkcPRoAf43NYhauQ0s+IOfa9MY5byjw1WbtvyKFjB3fD
         UR/r9iU9k+Y+2QDnDhj+gr0HT5NWRfBOevVuvELI0pfA+Cmc5QZVBrVvwUAMBTiegMDo
         lJBs2KgCFjCTjC5Bc0iRVswcHZhGn9/XL6Q2aQdusuk3kpaIDWnG7gqSlef00P71vmjP
         j2fGYrGq26N0ypjxWxqCsEjlRPUWo00oHEvorxlOx0E9vJRhwTL4TNdu+ZuPgVIcXLu5
         7kyHZ415fXE0N+f+m/v4PEbLSgRFtDww2ywfeLIyFln4gxILwhpanxB9EnhERBj0AZgK
         VALw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753280051; x=1753884851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nGCHphQckRxgoSh5w4iIxG/Rjxd4ND4u2+j5qV3kR94=;
        b=QhViBvPywxVIH9mklV9THUlQet2ebr3m1Kbd+He3FKqNN17DzT5RGY0WDup5BrkDux
         x/vpfXN6pOnIrshwV0uv+jipmYHsAWbhf/5BuWuaYHykKHTWMHsFswIEDZpLIuSxmYgT
         MVRKsuig7p9Dwco8bO7xkwOUqfQuPsSXcT+rRqvpaVKXprIT1oPnDJDv7YKSCv2VBtXW
         A4o5EuVYn0tLuIDjuPiD8aZugseKZ6NPu4kHEAmHDb28fImAzbsELn/VXV6jj3sLy+P+
         7WE/hcd88U41wjFUQ1fd1WnodChY6+5KGaMANlWm54/SgRL5oIG/Ybt6lhYp0HJaBQqm
         7MfA==
X-Gm-Message-State: AOJu0YzpZzkVcpd+5WK8BrkOJjg2qYcVDGvgOKRvkdNI7sUO5uBo5PC9
	m6U8fGeitBJ82cVuCRJvrDuI2LpfKfRj4EcgvmEg5aXlb2u5srqwc8+m
X-Gm-Gg: ASbGncsmUdxH5RnaCoDTxBAf+RUqpCM7crq0DA7zcuALc7nwA4VliWOLCXYdx04sq9C
	wJm2zj3g6EmHgi9HeXmj5f+FPhJgWpl8T/vimmsgJa02v5jeeG1TxdE1GCjdDRHoBbK7FE55kW1
	Dr0qCEWBPON/PFH3Eo0o+fPpW8EO8PUMIvOTBp5E9o35jrw7urxfTmH6FSwfegu/9J5rK1q18EL
	gw7pWjuWnU9D2R2BHSYQG2nfML/Q34rIPYNQVLQwOiYXK0gMmQO81ZDLPT1+mkwNc6HvMEgOfhU
	nftQ3aFBLGK8IHSs8Vv62g8DBeVqsO7qU2LKItIBz5FVaTm7OWS4qgwK6WpRxJgvtgJieLxIORU
	lytLlrRzuFsaNetGt0Yz0TOxxt3xuvd8=
X-Google-Smtp-Source: AGHT+IE4qt3w/6LB9AAk6kh3kI6NFSk1U9uQtp2nJwSH2r8ih8tpWOApCnByotT7eWt9IywTghyJwA==
X-Received: by 2002:a05:6a00:138f:b0:74e:ac15:10ff with SMTP id d2e1a72fcca58-76034c57330mr5352435b3a.4.1753280050818;
        Wed, 23 Jul 2025 07:14:10 -0700 (PDT)
Received: from localhost.localdomain ([103.49.233.38])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb154006sm9655287b3a.76.2025.07.23.07.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 07:14:10 -0700 (PDT)
From: Akshay Bansod <akbansd@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] iio: st_lsm6dsx: Replace scnprintf with sysfs_emit
Date: Wed, 23 Jul 2025 19:43:59 +0530
Message-ID: <20250723141359.11723-1-akbansd@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the sysfs interface for sampling frequency and scale attributes.
Replace `scnprintf()` with `sysfs_emit_at()` which is PAGE_SIZE-aware
and recommended for use in sysfs.

Signed-off-by: Akshay Bansod <akbansd@gmail.com>
---

changes in v3:
- Use `sysfs_emit_at(buf, len - 1, "\n")` instead of directly modifying `buf[len - 1]`
  for newline termination, aligning with `sysfs_emit_at()` usage.
- Link to v2: https://lore.kernel.org/linux-iio/20250703053900.36530-1-akbansd@gmail.com/

changes in v2:
- Fixed indentation for line wrap
- Link to v1: https://lore.kernel.org/linux-iio/20250702135855.59955-1-akbansd@gmail.com/

Testing:
- Built the driver (`st_lsm6dsx_i2c`) as a module.
- Tested using `i2c-stub` to mock the device.
- Verified that reading sysfs attributes like `sampling_frequency_available`
  works correctly and shows no change in functionality.


---
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
index c65ad4982..f0aab41f3 100644
--- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
+++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
@@ -2035,10 +2035,10 @@ st_lsm6dsx_sysfs_sampling_frequency_avail(struct device *dev,
 
 	odr_table = &sensor->hw->settings->odr_table[sensor->id];
 	for (i = 0; i < odr_table->odr_len; i++)
-		len += scnprintf(buf + len, PAGE_SIZE - len, "%d.%03d ",
-				 odr_table->odr_avl[i].milli_hz / 1000,
-				 odr_table->odr_avl[i].milli_hz % 1000);
-	buf[len - 1] = '\n';
+		len += sysfs_emit_at(buf, len, "%d.%03d ",
+				     odr_table->odr_avl[i].milli_hz / 1000,
+				     odr_table->odr_avl[i].milli_hz % 1000);
+	sysfs_emit_at(buf, len - 1, "\n");
 
 	return len;
 }
@@ -2054,9 +2054,10 @@ static ssize_t st_lsm6dsx_sysfs_scale_avail(struct device *dev,
 
 	fs_table = &hw->settings->fs_table[sensor->id];
 	for (i = 0; i < fs_table->fs_len; i++)
-		len += scnprintf(buf + len, PAGE_SIZE - len, "0.%09u ",
-				 fs_table->fs_avl[i].gain);
-	buf[len - 1] = '\n';
+		len += sysfs_emit_at(buf, len, "0.%09u ",
+				     fs_table->fs_avl[i].gain);
+
+	sysfs_emit_at(buf, len - 1, "\n");
 
 	return len;
 }
-- 
2.49.0

