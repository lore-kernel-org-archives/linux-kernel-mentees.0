Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D271C6B4
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  4 Oct 2025 08:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759564906; cv=none; b=l0gP+EOW/lmslKLGJ2m/DDrOPm6bOMiWCEJA79kHZrgUQjeC4tN0SCNajG2nzGF8gju2L0q7YVCnXIPXN5oJEeueXjDcnzFndAXliRc90uMEed+XdovYc38sYujhhrbirkUgUvXFy1SdCcRNLIgJfowdpYbXSs818fB5kxm69rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759564906; c=relaxed/simple;
	bh=KjAy/lvyyRZ8zGb/5b2zhZlwN6xjwOXL9DkAX4lt92Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AXf67oeXCsY+eNqnAh8latCGliaifoFQYsKGWw3BjTxKQuPyThiaqHvTnIequ6xmQg34Xt/D0l1Mf3nhDz1zj2fMFYph+mRND5O7yO3eUsBwGq1jSqXBjaEkekJlkVuxTlbtEF3vTfYAVtGKmXaAsEWwMknzACDuViTunKpzgNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d4Td6erV; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d4Td6erV"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b5526b7c54eso2097683a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 04 Oct 2025 01:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759564904; x=1760169704; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h0HHNpXXNcTkL+nhU/xsbqvNsp+K5n0NS1hpW71SqOE=;
        b=d4Td6erVgG9VLD0qsVXBkxUiidPDP+e+iNFBQpBjAvKXEK13zAxKg4YFaptLKdbLa1
         rbPeswo5ZIMWSs4ixre0gwcna3m9DKj9f0Yez5HUEYUD3ZdKKyyeDgnblR93GOhogSeo
         IHg3qbSMA7cwhnYCgBLvOxC2RZ5gZmSPUBKu93EJXrWpup98MIH4rdQMqfKLQRqh9hGP
         dXLic+SMq+RyIEs/wgQsolwTa2yVC2P1FvYzrovzU8o8guMuJ0nccvk06fRPTNSTw+dd
         zafM0aVMajIDaE4Go4TubxLKh1wKf3bWDfMrBYKNhdJuKkL8PgQ+yGUbFvvOS0U4dOqc
         V0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759564904; x=1760169704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h0HHNpXXNcTkL+nhU/xsbqvNsp+K5n0NS1hpW71SqOE=;
        b=Al6e8XDf8g1M+KIHFxMkOkSIAiBdqIYGKyQOFFhYC4KMaZVTjvJNCqVy4xqKhf22Uf
         TmtiTxxPLMqaEre2dPclrOWgjXHjjjf3Uf8XgAdaPzhCKz9jozNRisfIT9P5pChg586i
         ujxfP7K9TawbAjlWWNRDRKy4GdesqS0LGfIESLdRgF5Wmea6ushtJUKytexudjyE5FKg
         h78RQL340ciyhkGn2B8zQZyG2m2Uytt5N3sLxoo+zGuUx6vZdy2wt0rLwi2CydolaBbR
         ihNexrpIi8MdGMAbNFSrt1kmpDz3F6ZD6GIQaEeNu0DUV57eVgvf3jbHFKF3muTqrdxI
         7nTw==
X-Forwarded-Encrypted: i=1; AJvYcCXVvFmLcLssBnGpI7AAAeaBsEO8bF3D3eP8OPmOUIYILP2fwBiQYsXGtj9JSqOOkwCCIZZsTPCmQ06zTs6/oJPAY+/ukw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwzqPq51GWIQcO1MNvxFn3aztIHnUr/qRpXsuagkqv6E6YhuEac
	9s/oAwY9qRXad02SS0aRj6Hmtv+kPuPrGpOp8MH60Wc9Th7MHBYBTG+I
X-Gm-Gg: ASbGncvnRsIaBtaNf38EwIQOuWDrjmyaDNgFGiSDe16ZG0Set2Pw+r1QbHOKPmvs87O
	JtrRkj2etgR+IN82WfAlY1/bqRJwW9hhbY66Xsfi9eXXstP29hrkHJ/jI5HImcddAY1PxkZozRx
	BO0pyIPovu9uWib7RxKwfAacYTScxk/M1wB3I5pCh9eWIp4cR6INVkMG7lPrTEzohHBCfqrDi+d
	aRam2EXeQagdAo8F0zsoOjdOnJLmkW6+kr9QKAaitUOIP5ZG47sRUwCrVCAO73mc5//gxFKO8Zm
	eE398+7F6Z+ySyik122/hKy6fgVAgiyDqcKZfkV41m3NRlzDcs7cZiwOXqoq40h2jT61/0Vchc8
	S1lPW4Px7dbTTBubd4ueeSux5g9A+xJHST3rxxbexzS4pU2ft04vGBhs14g8AhA==
X-Google-Smtp-Source: AGHT+IFXUEH4SoswhGENnhaBYTvA3J2cAJeazeigS8wwqtI9GXK/ebBTvKu4N8A/XRv+TrDANyOIIA==
X-Received: by 2002:a17:902:c94f:b0:269:9a71:dc4a with SMTP id d9443c01a7336-28e9a648547mr61572455ad.41.1759564904400;
        Sat, 04 Oct 2025 01:01:44 -0700 (PDT)
Received: from mentee25.. ([2405:201:d003:7033:7b72:2259:4f28:5ecc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a701bf31sm10238056a91.19.2025.10.04.01.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Oct 2025 01:01:42 -0700 (PDT)
From: vivekyadav1207731111@gmail.com
To: johan@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	david.hunter.linux@gmail.com,
	Vivek Yadav <vivekyadav1207731111@gmail.com>
Subject: [PATCH] usb: serial: fix: trainling statements `break` should be on next line
Date: Sat,  4 Oct 2025 13:31:23 +0530
Message-ID: <20251004080123.98285-1-vivekyadav1207731111@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vivek Yadav <vivekyadav1207731111@gmail.com>

Run `checkpatch.pl` script on path `drivers/usb/serial/*`
Find ERROR: trailing statements should be on next line

Doesn't claim any functionality changes in any of the modified
file.

Signed-off-by: Vivek Yadav <vivekyadav1207731111@gmail.com>
---
 drivers/usb/serial/mct_u232.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/serial/mct_u232.c b/drivers/usb/serial/mct_u232.c
index 2bce8cc03aca..41b80a075b87 100644
--- a/drivers/usb/serial/mct_u232.c
+++ b/drivers/usb/serial/mct_u232.c
@@ -153,16 +153,17 @@ static int mct_u232_calculate_baud_rate(struct usb_serial *serial,
 		   divider = 115200/value;
 		   real baud = 115200/divider */
 		switch (value) {
-		case 300: break;
-		case 600: break;
-		case 1200: break;
-		case 2400: break;
-		case 4800: break;
-		case 9600: break;
-		case 19200: break;
-		case 38400: break;
-		case 57600: break;
-		case 115200: break;
+		case 300:
+		case 600:
+		case 1200:
+		case 2400:
+		case 4800:
+		case 9600:
+		case 19200:
+		case 38400:
+		case 57600:
+		case 115200:
+			break;
 		default:
 			value = 9600;
 			*result = 9600;
-- 
2.43.0

