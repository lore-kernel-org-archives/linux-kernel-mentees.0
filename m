Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B37D481FD2
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  1 Jul 2026 12:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782910670; cv=none; b=hcILQ258F+uOvqOgb6ame5e+2+XD4Exc7vP2N+DiMj39YCtTTj/9px3BKiQ+oUa+JjFXA+Mo9tiveWBcQuW7eH18lBRd/24A0nJxu+eFI4ubuSkecqJryQpMq7G/uhejmIGf/d2o2U/9/O1fdTaAZelt+Xc+mzpaTzE8qSMbMtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782910670; c=relaxed/simple;
	bh=H7mKrhs3dR62pLwn9IOckqVu033msifC1M1GZ/jJKMY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=omMBLhPQ0BE7VcuqJzhWCy/ssFc6LzmjSSAnLa+EmAR9D3GXVUogjTIfys8e9RD8RNrBPm5mYnhpcDSOrcQ8AZkByipMbXeoOb03lme77EN9YhNK4CDOPHKo/+6Awyca/sR6BIDyQOmfS2gLDY21ARq8mTyBAwxX0RGx03pmoyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tGp/elJa; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tGp/elJa"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-37fdee9276fso499815a91.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 01 Jul 2026 05:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782910668; x=1783515468; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WJy96jzCfjKqCU6bDuPUUrm0AXO+B20B1H6OT1/qUxY=;
        b=tGp/elJaHtNFlNQHDW4xvETyFLq8gwMFFvi9/JDuFMniA5skJAaE8dsplEIuivchqs
         PXa3ktObS+kVpPDyUzCP4nmV1FW5c3dhz0SZxLcb0K0xmt4qfYBLfPDgaxK6HRb26HDX
         NTo831e7DIb5qvV6r1rLQxpCozrlmxvzoahxk5yUrcYpmWCzw7UbJVK6sQGg/5TXWtXx
         yTvDIWLVx8sbwL4KOQvxx8uXceNVoNXclFVqJQN5h88jIW9KvxX31ImSBnSJT4VRUnr9
         A+saHckwHsfD9Ta6DSt2V7a0Pth60zQUPRYDHZyH+NBPx4suG8NXKmOWuABeVTEx+igZ
         DpCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910668; x=1783515468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJy96jzCfjKqCU6bDuPUUrm0AXO+B20B1H6OT1/qUxY=;
        b=Utb61x5nR2frCvv67UqRh3yVDKosWFw4RM3DhOLhgfDDj5WbFFZ3lfm7b3K8fvT9GW
         7yQKP37yGRuVTGxGHcS3x5Wr9YP9bFyNmWFVzhrzZj9UxkViS3+wSCI8pG9uSV6Dt2fs
         ukwT9E95OeWh2kPvHp9oM2RYHnBk+KICiSRyNcX7l7OfN4CdB6eNtLkLoDlP69YbraLz
         ipj9pUNnN/wtpydNHRxaKueCZ8WcFkQJ23MBEmIEO3IoyO11OGYQz1lmqIxlmJuKm30K
         q34M21xtEnb03mHQRRq0fwi6/zyDjX7equDOiJ80eU3RxJO19GqHnMUSh8fLYEI70xV/
         SG5w==
X-Forwarded-Encrypted: i=1; AHgh+RpUdcyeYXfyI3nvUKatRIK0sYRfAE5hBPPyBCDPr+zoAL61OWGjBfS6f+WT1WNkwi6avKa2oeiOLNaUq1n77uSxIO0aSw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7ywNJRFvJkBtrGEZel8yc1FyyUs5NgThq9q/7v32uvixhmR+o
	RXyknrkpmWnDDdyx5kMVpoYQv+UPbRVpeLsOBCMtoZtCUUrVCrxvBveg
X-Gm-Gg: AfdE7cna34K0aqx/GnNlpt6FIUCbxwlPrbZKmk1KiwpfHoc5UG3z/A9Cjhlyb3JXjlR
	Vpry6Fe92Hi/C4dz9fVuV6BS+Xm34RtdoI7PO1Sgr3aBACSxiDMCJMALvA0lShZSO1jxnahD9dI
	ppwyPhzBcUVXKW+Z0ViEcbPfszI2/FlzFsDuC4Xm1xDUV0st83ER2T51Xhj6YKivAW+Fggrx44X
	PCXgCRWIE4sxPgGE/t3lRpfdgbH2Q0etnwcgFrpL0hilrX3wzTYACM3Qb5tSuwPUaH5ZvukpQz1
	/aSu3rC90nkzwbAPh07pRaK588mqVf0cS0XdTaBzKLJvMMnHYrlk7isNaaqX8OP7ODmiQH0hMV4
	llws8hH/QuUGzJ7efHM6ybMOC1DJpZmerTjSRgAz2AcMcPQWuOXPCTq0BkoinTr8Tf01B+ejExS
	NUA6hBYlxtK1M9s+gMFyVxsOF7jx2RWlPC1y6TlA==
X-Received: by 2002:a17:90b:4c84:b0:37f:9ce1:cda4 with SMTP id 98e67ed59e1d1-380baa74659mr638284a91.26.1782910668536;
        Wed, 01 Jul 2026 05:57:48 -0700 (PDT)
Received: from x1c ([2405:9800:b670:b64b:adee:3e1d:849b:494a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca6853f616sm14197275ad.37.2026.07.01.05.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:57:48 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	jai.luthra@ideasonboard.com,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH v3] media: imx219: add test patterns
Date: Wed,  1 Jul 2026 19:57:38 +0700
Message-ID: <20260701125738.6384-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add 5 missing test patterns to complete the available
hardware test patterns.

The original mapping for color bars and solid color in the menu
is preserved to prevent existing userspace application and automated
vendor capture tests.

The changes were validated on a raspberry pi 5 with an imx219 sensor
using v4l2-ctl and rpicam-still.

Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
Changes in v3:
	- Revert the change to the original test pattern mapping
	to avoid breaking userspace applications
Changes in v2:
	- Fix typo in commit message: correct the color bars index
	to 1 and solid color to 2
	- No code changes from v1
 drivers/media/i2c/imx219.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 223d3753c..9571f3622 100644
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
@@ -238,7 +243,12 @@ static const char * const imx219_test_pattern_menu[] = {
 	"Color Bars",
 	"Solid Color",
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
@@ -247,6 +257,11 @@ static const int imx219_test_pattern_val[] = {
 	IMX219_TEST_PATTERN_SOLID_COLOR,
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

