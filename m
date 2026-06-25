Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9253D2459C5
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 25 Jun 2026 23:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782431462; cv=none; b=I2pRV8Uyv6dNJ0WLRRox6GuzwAbHDE1uoPQPRa2OadbtldiSX0NgyABpeLMJ7LZQM+d8ePFvZ0mbrWwK/hnt7ZGJ4Q+zsZNFNIZYn9E3ioahrUREHNLRuCG3ixLWIJJRaMjpwvPRxYyVPS9EoylO4g/YwXy1B3ysrgRPZgHwaHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782431462; c=relaxed/simple;
	bh=he76//56YME9jSWTiGsiGo7sY90s/qVXcUe5rVo2hP4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j5pugLeg/NWOxZuYWh1WkWoa/QsfQvDQJGC+VnNKCUdhw99v61orGlVm/LLntIZmWLLq5BgS0gd98q0zfZMUW1ZCjTC02VWl66kzfybeG2JjkQLojQhCVhafzYM0mkukOa0umoPict+mWX19igD+gXTYKGwYpqnlyolmzvkPKSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T1L08U96; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T1L08U96"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-845b733e82cso181911b3a.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 25 Jun 2026 16:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782431461; x=1783036261; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vB7wM8cMcHCRy2B7PVI6rXtb1cm+oM7TlYvGymfkF+4=;
        b=T1L08U96Ato0zYYOedK0Wr+z9V7bZfq4jqav7NBK1DoqZdkto6u0nbOTZdLg+e7v+1
         yDIX2Lxp6WoVlSMPTuW4ZsEYVRH5buZesf87XP0D5d5MNNh4MocWpS/bfca4gWGFqjkx
         cyCkwW/DXwccyXYaof181ME423WYGAW265vVYbObKK4Lx8Gv1dpKgcXqjyiJN6oopMFu
         RKw/Kn1pn7fIPUnALwG1dH/vsThhBJa7AufwJpfyz6D0VLmSCrHiduBge0Mur0rYVSvT
         DY+32SBlbt7D2N+clopCNy/emgmapC4xUUWxeYqDVM6bkCCulh6mStEzLLu0tNUtj/kC
         Pr9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782431461; x=1783036261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vB7wM8cMcHCRy2B7PVI6rXtb1cm+oM7TlYvGymfkF+4=;
        b=kjR0BCAU0Lovtx8kuHj5bBa0AC8rmXa5RtzgtLkXVO/mxR1elmqMeDFo0d6ZDCgRjt
         2PXcG4r7K2a5NiwIvJd3kad+hCI8GoBzoAsEF+Ja6p8zf1AOGYVQ/AAkd6AfNwwV0w4H
         VsEoLWRJ0N+NwdXmpxk9QDINs/QIgSDbnesEZR/cdnskyk5QxWD0HHp1fp6O7kKszByR
         qa67cO2QBufTrRQVDnv+HztsEb0Fe9N4P9RG/D0H/cYpeU55RiMdhllgSjWsfSB68ckP
         63BTfDWQIACGXetBFF58aUDkQgN0d50gftHSJPss9tmZdUUZXn7+103eaLeRRuNfIwnA
         M5wQ==
X-Forwarded-Encrypted: i=1; AHgh+RpF1Do1rcYDOJ+b7Q0rA16Ng2dotkqwnVGMfiT7j+AFsJH01o60d8fkPmLo8nJQ/f+BkWixRyuxlFWvLH1rDgJCoXwDOw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3aFrhncjmv3qnlGgkt+W/RC/A/tiJAKVYAu8OKx4/09nvZnjk
	7LjTfbquvlDMBy2NywV4SEQE5a7T6ssh2q9eNTL38Of2bKWIyei8kNPM
X-Gm-Gg: AfdE7ckl67Km1SZFgnScD2AZ3CJXDX/cfVsCjV+0vG/9IF0YsGLNR4Kh5rFm31afPUl
	JcubqFw7iw8s4Ac0Q19oahFra1LaHec79W1XqINRo7jy0DN7IfR27pEvroNz6Gex9JhyXdgRxXV
	QmYek2tiCdwlL5zhaqY6DmPJ2TvpBeuCkzyDk1vBSnxFMWTYW7VUovcBinksKoSn4HPok2nDpty
	2BBQm4l3nzbXCo6FcAFpURGrnEufl5RYa0oH8LDwvn9C0GQ4gIsLKdrun4cHW2Y8l8ROrHXvvoa
	seolKRsUofosbblyyYj9bJV6mhyCoJmqcyNTCVA962vqZXgwXYyFkeFpC9RC4gonQZxgRj6IZEw
	270p0HsGGI0RMuCIjPqG5u0PQyzpUKuAatZaZ0nP0jU9Cb/++y203uNdr+qqSbNTmwYJLUuBqFz
	drDavTwad+cz37HhWLqKBb4rLHbzfdJ4HaT6UT
X-Received: by 2002:a05:6a00:390b:b0:845:6252:f69b with SMTP id d2e1a72fcca58-845b3b09722mr5604830b3a.46.1782431460796;
        Thu, 25 Jun 2026 16:51:00 -0700 (PDT)
Received: from x1c ([2405:9800:b670:b64b:acd1:19e:37f9:15e4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845c7c935f6sm159448b3a.19.2026.06.25.16.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 16:51:00 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH v2] media: imx219: fix test pattern ordering and add patterns
Date: Fri, 26 Jun 2026 06:50:51 +0700
Message-ID: <20260625235051.5784-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The test pattern menu currently maps 1 to color bars and 2 to a solid
color, whereas the imx219 datasheet specifies the reverse layout. fix
the ordering to align with the hardware specification.

Additionally, add 5 missing test patterns to complete the available
hardware test patterns.

The changes were validated on a raspberry pi 5 with an imx219 sensor
using v4l2-ctl and rpicam-still.

Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
Changes in v2:
	- Fix typo in commit message: correct current color bars 
	index to 1 and solid color to 2 
	- No code changes from v1

 drivers/media/i2c/imx219.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 223d3753c..8f0c04afd 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -110,11 +110,16 @@
 
 /* Test Pattern Control */
 #define IMX219_REG_TEST_PATTERN		CCI_REG16(0x0600)
-#define IMX219_TEST_PATTERN_DISABLE	0
-#define IMX219_TEST_PATTERN_SOLID_COLOR	1
-#define IMX219_TEST_PATTERN_COLOR_BARS	2
-#define IMX219_TEST_PATTERN_GREY_COLOR	3
-#define IMX219_TEST_PATTERN_PN9		4
+#define IMX219_TEST_PATTERN_DISABLE			0
+#define IMX219_TEST_PATTERN_SOLID_COLOR			1
+#define IMX219_TEST_PATTERN_COLOR_BARS			2
+#define IMX219_TEST_PATTERN_GREY_COLOR			3
+#define IMX219_TEST_PATTERN_PN9				4
+#define IMX219_TEST_PATTERN_16SPLIT_COLOR_BARS		5
+#define IMX219_TEST_PATTERN_16SPLIT_INV_COLOR_BARS	6
+#define IMX219_TEST_PATTERN_COLUMN_COUNTER		7
+#define IMX219_TEST_PATTERN_INV_COLUMN_COUNTER		8
+#define IMX219_TEST_PATTERN_PN31			9
 
 /* Test pattern colour components */
 #define IMX219_REG_TESTP_RED		CCI_REG16(0x0602)
@@ -235,18 +240,28 @@ static const s64 imx219_link_freq_4lane_menu[] = {
 
 static const char * const imx219_test_pattern_menu[] = {
 	"Disabled",
-	"Color Bars",
 	"Solid Color",
+	"Color Bars",
 	"Grey Color Bars",
-	"PN9"
+	"PN9",
+	"16 Split Color Bars",
+	"16 Split Inverted Color Bars",
+	"Column Counter",
+	"Inverted Column Counter",
+	"PN31"
 };
 
 static const int imx219_test_pattern_val[] = {
 	IMX219_TEST_PATTERN_DISABLE,
-	IMX219_TEST_PATTERN_COLOR_BARS,
 	IMX219_TEST_PATTERN_SOLID_COLOR,
+	IMX219_TEST_PATTERN_COLOR_BARS,
 	IMX219_TEST_PATTERN_GREY_COLOR,
 	IMX219_TEST_PATTERN_PN9,
+	IMX219_TEST_PATTERN_16SPLIT_COLOR_BARS,
+	IMX219_TEST_PATTERN_16SPLIT_INV_COLOR_BARS,
+	IMX219_TEST_PATTERN_COLUMN_COUNTER,
+	IMX219_TEST_PATTERN_INV_COLUMN_COUNTER,
+	IMX219_TEST_PATTERN_PN31
 };
 
 /* regulator supplies */
-- 
2.53.0

