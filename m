Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D1F29BDA9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 11 Aug 2025 16:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754931431; cv=none; b=WhVFSJyMy35o9D/KOl4jvi72X3UmLVHJrFF5kIuTPoEerSdI3JUyvuPQO9qjgtZGOWbuYLF3PXCTgLrlTa+8zKmgaLOe0bg9rgwLsHpz6utKDQhUQZibtcyS8t9BW+RHXqHjd4zmtynNiH7KG1Pm/AvvSSk4wTtOgsIHIDh3BbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754931431; c=relaxed/simple;
	bh=9zPnPHkgpiU4tEsuYcbnxA/jyHS4x3gGPa24HIh889k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dI4Arg4hmGOEmXAn+XrIRH2Jpvnm9ZYTiXJfGPfIWzu+D75zHWq03h36XKUh6K3QJgWSUIukzmzSugVxCagWrZXkoxHJh+J3MUpHe3wa8iAHWsZOkTiP+k0hTHxt5TCosyRVxbJsfSzRCMHGFeQaqx60EXRIm+Bp8cpqU2qRp98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lswy/BSm; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lswy/BSm"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F375E83F10
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 11 Aug 2025 16:57:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P6VQLfepbc11 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Aug 2025 16:57:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=akbansd@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DFE77837A4
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFE77837A4
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Lswy/BSm
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DFE77837A4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 11 Aug 2025 16:57:08 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-76be8e4b59aso3889595b3a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 11 Aug 2025 09:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754931428; x=1755536228; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W1Yi7C8gEQP4bWpuAGELa858nfVqle4iUeljO1dFUIw=;
        b=Lswy/BSmLInBtYUz6amRFdRf7EyEkTM29V9bvnW5ljWKqeW/RiUaKq5EoqGzWl6JYT
         HsaLLIbvgZXzZEisYaP/pLPNdpC1CRg1OdZtWwe3ZrVlVjrjoaKvUnGB8WFwitDRsokr
         pSc9JIOKzMPr4hdo44mgFZjYDprhaNxBHm3fBPDkxMTMtpFRq1oNThei4yugBZ3mVW1I
         gSlAJrvnFZ3t1njUYJKf739+qPpaOOykb+VowZvKOMd3fmCMiUnGu0iW49o4sRfMmLhr
         PKUdshR1ToPbrpOEv6jUCqc82Urpp/oSxKs7VfuiZZivDckiyoLzWXrJAdqVzvBkoE/E
         xVMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754931428; x=1755536228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W1Yi7C8gEQP4bWpuAGELa858nfVqle4iUeljO1dFUIw=;
        b=NeOwB24ZRvu6eKefsZOmxvsZRrxUBHaFpscYrOVAI1k2adJYsimgcXv78gkRCCPGtf
         d+WM1ySF7JKYhiu7qvC0UK0o1Xb6qDAB1a51vW3LYJJ7wySrMre+KJ8wzQpbBTBPSAXb
         AtrbVJhLh1Mx/hF1b/yiAm94d7vFhODFrJIDT2303K38+Tnq0myw5mm7W2dtIIs0jJn+
         Vs5XKZrM1+YfTYOGT9XxtiRYxOtlzcDYKBv/5FnNzpnf0scQUFjo/0xvtYsjYYtR2uC9
         F4oGnn/m9IavwN2jVH3f5l3OyiqaxHGH/qilGTk9LXsGK3cR9DKv+OoeaQGdxMdAbZgt
         vezA==
X-Gm-Message-State: AOJu0YzSFkOfKGTQX5yebr1ErT6eQQ+aL6gMmsVuXMO7O0XoHsTMyV2g
	tH2GUd2f2g9jiuvWGn2Gw2hRQyb5aF//Ene4pfE1y9WLhsTdNkrnjS4g
X-Gm-Gg: ASbGnct9ix3DIaXaFpKy5KNitkWGDGoOhUbRviit8peDrOPh0EejBECT3JVDGW68m0G
	mSlZdVw+xUEFjf96jnj7TNUbUdFGRuaAWsHTscNom70vxuELJuM975jU42LvSGwW6edgaTrUI2o
	pUcAGuhvLI/02Gk5Kfc2Nmy1x2WMwj0Eu5q5iedK3MN5L26ItbwbIEv0A2gSbyaAJw/G18jkVvt
	7LWaD+HCxGEuDClbKjCbVyO2fMu+TAHv1ESt6W0o3s+fAo6Ke8PXmA4nH0uMNyBRleCV+R+OIBo
	pPOHdj8FCWvwQlBCn00N5YXwU6KZC+jrD4vTOauNwz8bwVnCFWgtzXHjuub2oohiuJgPuuZUhf6
	40X+8LsBJhlIlTS5eHT8BXpYRwFq9XWA1ca5v
X-Google-Smtp-Source: AGHT+IEkqrWoNzQeigT/AEoxekcMwPOO3clsp9fVXxpzh+JPN0nMFS0LQhGp/ytq+YFsSTqg1y1bFQ==
X-Received: by 2002:a17:902:fc8f:b0:242:b42b:1335 with SMTP id d9443c01a7336-242c2059ca6mr223948205ad.22.1754931428119;
        Mon, 11 Aug 2025 09:57:08 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f3a:31cb:81d4:471d:6f8e:380b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e89a6ec2sm277124085ad.145.2025.08.11.09.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 09:57:07 -0700 (PDT)
From: Akshay Bansod <akbansd@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] iio: st_lsm6dsx: Replace scnprintf with sysfs_emit
Date: Mon, 11 Aug 2025 22:26:40 +0530
Message-ID: <20250811165641.1214347-1-akbansd@gmail.com>
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

changes in v4:
- reformatted as per sugessions, used ternary operator
- Link to v3: https://lore.kernel.org/linux-iio/20250723141359.11723-1-akbansd@gmail.com/

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
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
index c65ad4982..d8cb4b021 100644
--- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
+++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
@@ -2035,10 +2035,10 @@ st_lsm6dsx_sysfs_sampling_frequency_avail(struct device *dev,
 
 	odr_table = &sensor->hw->settings->odr_table[sensor->id];
 	for (i = 0; i < odr_table->odr_len; i++)
-		len += scnprintf(buf + len, PAGE_SIZE - len, "%d.%03d ",
-				 odr_table->odr_avl[i].milli_hz / 1000,
-				 odr_table->odr_avl[i].milli_hz % 1000);
-	buf[len - 1] = '\n';
+	     len += sysfs_emit_at(buf, len, "%d.%03d%c",
+				  odr_table->odr_avl[i].milli_hz / 1000,
+				  odr_table->odr_avl[i].milli_hz % 1000,
+				  (i == odr_table->odr_len - 1) ? '\n' : ' ');
 
 	return len;
 }
@@ -2054,9 +2054,9 @@ static ssize_t st_lsm6dsx_sysfs_scale_avail(struct device *dev,
 
 	fs_table = &hw->settings->fs_table[sensor->id];
 	for (i = 0; i < fs_table->fs_len; i++)
-		len += scnprintf(buf + len, PAGE_SIZE - len, "0.%09u ",
-				 fs_table->fs_avl[i].gain);
-	buf[len - 1] = '\n';
+	     len += sysfs_emit_at(buf, len, "0.%09u%c",
+				  fs_table->fs_avl[i].gain,
+				  (i == fs_table->fs_len - 1) ? '\n' : ' ');
 
 	return len;
 }
-- 
2.49.0

