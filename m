Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB2A28E61E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  3 Jul 2025 05:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751521154; cv=none; b=sJgq4TYTV5D8WZ00s5RHT4o8BJQEE8AG1YLNWwcYc9cICP3vgUff6M3D6oVrnxV1Yitx00xW7lJvaXApvNfZvyraToV3/2X7qBDRHa9DluRq2chiADYV3PmQIsDv/mNtAdoyxgsCN/dIhVRJujfnroFvd6uARnZA1iBW+v2Cl9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751521154; c=relaxed/simple;
	bh=voxJZHqltY56Ox9RRMfA577Eifwyg8mdiTW3GT0aRTI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K0QqRRGH6Q868d9SwPU8qF1lBlxrEBKtmm5uY2bVo+2/0U+XKsu19EaZOWUGCL2arbpr8fCbdMwFaeRwEJoru3GiFaJ+O87v8Sy5o4eZzzyH8vZorf6cklaJxsGt7Qmxepp1npjCeGCNdwuzLOoYzl9Swzuo9JcgKM9l0jVLGsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XMXdjZwy; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XMXdjZwy"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D8E260D78
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  3 Jul 2025 05:39:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nGFkbHMEkXdL for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Jul 2025 05:39:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=akbansd@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7DEBC60F95
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DEBC60F95
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XMXdjZwy
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7DEBC60F95
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  3 Jul 2025 05:39:12 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-235e1d710d8so91086875ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 02 Jul 2025 22:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751521152; x=1752125952; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0IrjhUcneeUdhM9TWLddICq65bCdlGpr1v8MgRUFY40=;
        b=XMXdjZwyu5rHvdt6y2aiUXgamHU9thpg5TQBnleATnQDVutF0nGyvd1im/ytYs6KRX
         ++R3r4z8N3MPQE99ixd9MU6X1aUoGs5WO6iJ6dSSDDyBGteW4JwRuqq7VVLWm+eLY5Y3
         liKJuWO0TjrIkZZDKrL/LzNSfd71Ismw91objaQROu4DG0GH8iA+P9CJJhR07sO9yc78
         tLwk0aC4soYnBecXm7FpBrxZqiodYkEs6qC/jb2vnbpOqJ6fnHr8p5E8oomitqhVoc8W
         WsDO8hDGINsYw9W07afYI0Np8KGctKh7YsloOsH2eXYxcgVRW/iGmokK77yS67BmKlcX
         +qgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751521152; x=1752125952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0IrjhUcneeUdhM9TWLddICq65bCdlGpr1v8MgRUFY40=;
        b=uX+slBnqOk+aHvDkj9Fe5Fe+vcpiTmg8Cs0CD8gn7JQyYrVc/efODED7mSHioHf3W+
         WYM/iN1kuP3iuoqbuPpTiczhJEXzbKJn8/CATAJmB0Tmow0dTSmAMaTaxtL2ADB7xAf6
         0Hg5x2r4BDw2/V6+g/l12WBcP5ig4CVkXdatALR9gCgDMcGwbqKejdk8A6c/GneDd0dG
         B8TeW+nt1Igw65qIh1lcPMYq1/6BzcWbJijTxyA662qXiRgEMyr38DCCxocOLVikUlUL
         p8E/+LpOW59j6+5KdFdcCS/jD/baGcHgVY4UQnX1U0x6zYbH0rkgQZPBOzZOrGxrCt2w
         iqeA==
X-Gm-Message-State: AOJu0YylA/0lekFIPUwowg8UdZwjihrXNLvsLZ0zl2ND21z+ki0+sx3w
	jTulYrUoeeZXbZF5LbSX29q27UiJYTy+9qnyWfj7soDLiriLmvpJH0rH
X-Gm-Gg: ASbGncsaaDONYMgiW/Dffnc7MRYWqQDsqmt83K7OcxB+tuQPOXcdkalm27xUaq0+88w
	BEC9XWiFntgfkQXsTUGmpRTcRuIst5AKJ2fo0thglHf3T99cy2wMu8j6O924yUV9vi4RlWa18oh
	4qLpLSNLFB8XodeJ9otzRJejVhZ7sVsX3i9H9UrYLRKghA/RT5MLyfhyf8xBTGd9IIqtYN9dlG9
	Tp88bL1FsUrbVlD2qm05sRc9L/UM8oBsRxBEWxjXwz/j7scxg0JI9jc29rEMBH+Iv62ro04B0nL
	FhqwOuTZ7Tx+7K3PkOIbbWQT6/+3G17mSvC6Sv8urlOpgyt0yE9eGJwScrl9F+Dqvq5MT1Y=
X-Google-Smtp-Source: AGHT+IHoh6t/sQ++4eoZ53OHZp5DSnQdMVsEROn6XefgxlvjoM2122L64NtRIINhq6KoVx3i32clcQ==
X-Received: by 2002:a17:902:db10:b0:236:15b7:62e8 with SMTP id d9443c01a7336-23c6e591e5bmr83382435ad.25.1751521151702;
        Wed, 02 Jul 2025 22:39:11 -0700 (PDT)
Received: from localhost.localdomain ([36.50.162.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2f1d72sm153629405ad.66.2025.07.02.22.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 22:39:11 -0700 (PDT)
From: Akshay Bansod <akbansd@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] iio: st_lsm6dsx: Replace scnprintf with sysfs_emit
Date: Thu,  3 Jul 2025 11:08:59 +0530
Message-ID: <20250703053900.36530-1-akbansd@gmail.com>
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
changes in v2:
- Fixed indentation for line wrap
- Link to v1: https://lore.kernel.org/linux-iio/20250702135855.59955-1-akbansd@gmail.com/

Testing:
- Built the driver (`st_lsm6dsx_i2c`) as a module.
- Tested using `i2c-stub` to mock the device.
- Verified that reading sysfs attributes like `sampling_frequency_available`
  works correctly and shows no change in functionality.


---
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
index c65ad4982..7689ca39a 100644
--- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
+++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
@@ -2035,9 +2035,9 @@ st_lsm6dsx_sysfs_sampling_frequency_avail(struct device *dev,
 
 	odr_table = &sensor->hw->settings->odr_table[sensor->id];
 	for (i = 0; i < odr_table->odr_len; i++)
-		len += scnprintf(buf + len, PAGE_SIZE - len, "%d.%03d ",
-				 odr_table->odr_avl[i].milli_hz / 1000,
-				 odr_table->odr_avl[i].milli_hz % 1000);
+		len += sysfs_emit_at(buf, len, "%d.%03d ",
+				     odr_table->odr_avl[i].milli_hz / 1000,
+				     odr_table->odr_avl[i].milli_hz % 1000);
 	buf[len - 1] = '\n';
 
 	return len;
@@ -2054,8 +2054,8 @@ static ssize_t st_lsm6dsx_sysfs_scale_avail(struct device *dev,
 
 	fs_table = &hw->settings->fs_table[sensor->id];
 	for (i = 0; i < fs_table->fs_len; i++)
-		len += scnprintf(buf + len, PAGE_SIZE - len, "0.%09u ",
-				 fs_table->fs_avl[i].gain);
+		len += sysfs_emit_at(buf, len, "0.%09u ",
+				     fs_table->fs_avl[i].gain);
 	buf[len - 1] = '\n';
 
 	return len;
-- 
2.49.0

