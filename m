Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1223B47D3
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 25 Jun 2026 16:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782403368; cv=none; b=Z2l65PPP0yPa8vcYDGre4VUFs4v82dsCmQkzCVnyIkLS8rair3pRlSqJD9tAXM5VmpwzlXdHEwE5x2sZ+8gzyegVcPKRrrWT5gHPMqwLuu2900b9IdZWi5PHMkCzj+zSyigoj8HZ+jYPU1dQOVafu46THbw0I7izznXyk/xSiGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782403368; c=relaxed/simple;
	bh=JAd+cR8sgstyy12UKF09HY7WWm4Idsqycue8Bj1EjmE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q1C4Nx2Hteqf/SxATvqQ6s4o2AIzXO8/OBMOtDMFKXvLhhckunK8i3BcCfKKNthZN7MsOGA7LPp6LBl7kgFXrhyLYjma6TkXOucGO4zZ2CXe+puVpjnf8ot3ZiiLuTZytNaENDWZFsIIRsdrcv2pKvDfEcoEfVCJ/Ek/xS9wpZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ecwBXB4t; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ecwBXB4t"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c8fee9f63d5so27748a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 25 Jun 2026 09:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782403367; x=1783008167; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iTdXuJRwQWuWhpRTPjq4OadQQRtkoHUaafxDWZmt37Q=;
        b=ecwBXB4tEtUYmmP44e/LGuYhWzP48JakR+SAombrKEphD3vVrZhj2kbWJ7gyc8qE5k
         x8uinGmEugGq8IKfjHT12XSwD0HKjjEsNhB1oThlEK052Vb0QZgcwLwRzv73DXn80h2a
         6WXBwefkRVLdaCxgYtC5iVKR6EJiPOQk/H7z8YoyrdrRPo7esbpgw2mKMfklW8RiidwG
         LnCsMwKT4j0ZVSSNkHa3vj7j9JSDCWewGgZM2GdO5C1s/fwx/i3EBakkO9409wuAbF1t
         xqx+kb28HPf2DHwFo6ULKXfy9hSWjboQipwJr2HLZghG/c3sdifMWYkfa1OuWcknsWKW
         CBWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782403367; x=1783008167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iTdXuJRwQWuWhpRTPjq4OadQQRtkoHUaafxDWZmt37Q=;
        b=n5J+FqTHAvQVEAan2B6ypxLlelehwdmF7jPqN5yJ8b/6Icn5SH2PjT4byzbAcy1vzI
         eFDBjMgZ7bMzWgUFR9ZLsyx045qHV0M2HZQQgsQ6duPfh16mzTt+X4TURv4/49VsTED9
         tRk0ExMWxmyEbJGNZ5Roho6jwcQBDP3HFm94aY9r+pLdHE4aTbNuw5N72TbZv6pGiOHO
         yJzm8Npw7QhWpiXw2tLPYivQH9eVDpu7XG2qkCBvlfLCOp3veR9aIYTYlSHKYnWAGpP8
         okS9aeYVBwVTi8J0gkR0tqsoj2Lgkgv59JUy8r4fVxdjmem6qmJAZ1Sf2eisaPjtmlec
         HQgA==
X-Forwarded-Encrypted: i=1; AHgh+RpoBSk22gS6OiY986AzXvugxuyrGebi4/C66AXWFOSkNXUHOrS0MaHyalEVg703M56YLtLMeGpbmgxSjYnaKz9fexvmUA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzAO9FEBE00ab6jiL5YEyIro7wyKRjIBaYCOmPK4zFEHbw4f7hN
	ymoA3tRd5spCQEQhuISbmeSzCQ2Y7q3s26p5OKt5UiM8kDcQbK1a5VLm
X-Gm-Gg: AfdE7clzA7dJBqlwmS0U7cLVWxTXslpHCZzh52f3V+Wsd0zekqo6q/mzaxFqjibpL8H
	O74qqIiXdcDIrQg9P6PIhPNffhOOJuxEy4O1IylAS1ZAne2fyIfHNW5HY5IlrD1GS/Df94pWfTF
	l/tSdI3GqUPE/usmF16bV3GKY2YFgYqgN3D5Ov5/+rtMW8PXWBTjnQ89sVskNqdUPg1ygjwBMe+
	8kbMEsd/4C+SOdjpxJLnxH8tR/zS1UtGtc+zDCKcAQ7xEv9lCRdBLYqjHXb7HdNpKBu5mLJ5b2M
	H1tbT0Y3x0Nd9oOF3Nqabma8lgTnSAAhF+v39101dqvQaJbzad/SkEG3fliQog6rtTRH073zDaL
	wyxDz0DgsVtoh5P2qhQ+N7FmDLRItXskarXLe8RTfTCmoux8V9FxVidldkEcaaOZuX6fRG4pRgm
	kBw+Ub/UIIGjHIa3Ps6pGT/qpfyIuT+51NPhDDUw==
X-Received: by 2002:a17:902:fc46:b0:2c6:dab1:6690 with SMTP id d9443c01a7336-2c7fc70a348mr32734355ad.4.1782403366320;
        Thu, 25 Jun 2026 09:02:46 -0700 (PDT)
Received: from x1c ([2405:9800:b670:b64b:dc20:2c07:f8e5:16cd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63b287esm22998445ad.51.2026.06.25.09.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 09:02:45 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH] media: imx219: fix test pattern ordering and add patterns
Date: Thu, 25 Jun 2026 23:02:28 +0700
Message-ID: <20260625160228.59672-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The test pattern menu currently maps 0 to color bars and 1 to a solid
color, whereas the imx219 datasheet specifies the reverse layout. fix
the ordering to align with the hardware specification.

Additionally, add 5 missing test patterns to complete the available
hardware test patterns.

The changes were validated on a raspberry pi 5 with an imx219 sensor
using v4l2-ctl and rpicam-still.

Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
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

base-commit: 06cb687a5132fcffe624c0070576ab852ac6b568
-- 
2.53.0

