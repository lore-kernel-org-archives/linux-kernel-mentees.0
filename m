Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4B72820C6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  2 Jul 2025 13:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751464776; cv=none; b=cZUgHppgKwLv5/mg/xXl/gN8H46DWj6/RTdOyae98QnqXojbeV32oHV/OZ8CF2o9idG8x/GPwN/Xl9h7nGcRlXdpLj0+QHbShdgPcl+ZnnYMAlT9jrWuSpAqBGPisYeCQBsEknVNaVS9ads46Q9Mi9f91mPCNJo8sfAISNFKHTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751464776; c=relaxed/simple;
	bh=+z/pyj4SUuWOCUUWNHIbttFGlxzh7+YiGzzHAMi1ArA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nncb/Kbhk55D/vkuWu++fqbt1PooQ95l4w+YjSmvEPUhVUhBGAdX7hDdxSQN2AICXjBAZeyLfLUP8kLRfwv/TgkpfMZduFNblqF8TrncRF5ne4n2JxFqprVNI5/Ik9fawQOhXnSR1VaMfb10MA5rkmT5sjbelwp8dXsRFhG17zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H1hviwTt; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H1hviwTt"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C28CC4197F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  2 Jul 2025 13:59:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fAnxCAa2Lbhj for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Jul 2025 13:59:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=akbansd@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 32BAE419B3
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32BAE419B3
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=H1hviwTt
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 32BAE419B3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  2 Jul 2025 13:59:34 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso4169956b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 02 Jul 2025 06:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751464773; x=1752069573; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uG2cVUfdVKK+VnskBFnudLceDCCRLKIh6XoDBmMRx/Y=;
        b=H1hviwTtzmyAEdcOzAl9FTjzX2g4gFKWftbV4fjx4qS/04q9gE9hmNlWwRt75WJYxM
         RLEqG50hDlKklJ29NSY4U4K239Q8IRbb015+He5SAK4J/E/P5d7BgA7qXoNoq+i/Weeu
         pZUijEipmB0L3PukRaJehgO01csrU+EmlogCd5phlvxkCzLT6MI1hDJvCqPWekqiB6rE
         I0V1WmTeoq0lwotSccj4+TczUkdIuvl9lMgIRugSGa/p7F/t1xesbMA18q+5o8L8HgEt
         xlFI5mX4nMSZnbbYzn+GwvAkwYGei5OQ+pugA4hnafrg6x+Ljz0zA/RZ4K7G2/C3EChH
         aNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751464773; x=1752069573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uG2cVUfdVKK+VnskBFnudLceDCCRLKIh6XoDBmMRx/Y=;
        b=ST/AkpWOrECa1znzKvYdxeAScPG6xf09XuPZuJYg7C3RDCgnBnY2OIerQPKr41DcUp
         uHBIMiLz6zb+KxLO9mMM5GV/ICGghlte9G4EaIesoT0fJuON8duNOPcCjEyVkyIBllN7
         bi9OSVxNUyOmLPo89qiQsl7y7prXeIeXa9Y2Ql05sfZyN/5nGMzcpU/6d7+Ci4ZtLDIA
         VZdmejO3D6lYXlq3iL/632wC4ril9QHbf/klQc/MjmySDKjE36rhhz3ULEIMEBdOzagF
         F1qARR9D+CV5WV8kPcpQjbAYsC2MyI62qwwBNomkGUC7S+vIk3/LLngYASt4UiV/xGVm
         Abdw==
X-Gm-Message-State: AOJu0YzAtzJHKkaLuZsXIc4KFFtGzzQ5r9t3Ds73I0Bs46Ffb0SIVGTp
	A4EyatFuOEUnrctq3Rzkqbi1a6XJAKNoDnwZRs7OxRS3hzYx9WKqzYhb
X-Gm-Gg: ASbGncstzyIASBaisuJI0xmIron6pGeQR7CtFXlH7F9OdCyIfSGHPajzB7JSLJ/wO1g
	susnEtAa2OZa0UgY1HA2QwvnWkL0G7OeLbqUZsJPbu/zTDqh0t/PRFrsg4e6RBGB5IgtNoeBkKl
	5t4fdsOQaLRfV8ubXGbrLvDVr5aUjScGSKsHd4tVBFCnbS3t3gvwALS8uLQenHGcXZBbKUPApDq
	m6prBfTwQWCMDPiGSz66uu4tIAoyEwMalm373+ly/Dm12tOynCsn/g3bvhHqFsxIk06Pj2gf+Th
	EwnyYok4GX90MY0ia0nA6eK3QzN9QMEbOrAjQCZAnrgd0D6h0VbQkOWPRZWOFcrD5pkytCc=
X-Google-Smtp-Source: AGHT+IGoIJTyN7a6y/nAlqjM8UO2CTT19q+9ZhHui8cXpmy25QIZ9nb0qQ0kk3cJnPI4P2Bm/a0WuA==
X-Received: by 2002:a05:6a21:6b16:b0:21f:d0f6:13ba with SMTP id adf61e73a8af0-222d7dc4f84mr4825622637.1.1751464773339;
        Wed, 02 Jul 2025 06:59:33 -0700 (PDT)
Received: from localhost.localdomain ([36.50.162.229])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af541c38esm14459329b3a.46.2025.07.02.06.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:59:32 -0700 (PDT)
From: Akshay Bansod <akbansd@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] iio: st_lsm6dsx: Replace scnprintf with sysfs_emit
Date: Wed,  2 Jul 2025 19:28:54 +0530
Message-ID: <20250702135855.59955-1-akbansd@gmail.com>
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

Testing:
- Built the driver (`st_lsm6dsx_i2c`) as a module.
- Tested using `i2c-stub` to mock the device.
- Verified that reading sysfs attributes like `sampling_frequency_available`
  works correctly and shows no change in functionality.

 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
index c65ad4982..1cef10919 100644
--- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
+++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
@@ -2035,7 +2035,7 @@ st_lsm6dsx_sysfs_sampling_frequency_avail(struct device *dev,
 
 	odr_table = &sensor->hw->settings->odr_table[sensor->id];
 	for (i = 0; i < odr_table->odr_len; i++)
-		len += scnprintf(buf + len, PAGE_SIZE - len, "%d.%03d ",
+		len += sysfs_emit_at(buf, len, "%d.%03d ",
 				 odr_table->odr_avl[i].milli_hz / 1000,
 				 odr_table->odr_avl[i].milli_hz % 1000);
 	buf[len - 1] = '\n';
@@ -2054,7 +2054,7 @@ static ssize_t st_lsm6dsx_sysfs_scale_avail(struct device *dev,
 
 	fs_table = &hw->settings->fs_table[sensor->id];
 	for (i = 0; i < fs_table->fs_len; i++)
-		len += scnprintf(buf + len, PAGE_SIZE - len, "0.%09u ",
+		len += sysfs_emit_at(buf, len, "0.%09u ",
 				 fs_table->fs_avl[i].gain);
 	buf[len - 1] = '\n';
 
-- 
2.49.0

