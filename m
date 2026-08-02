Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64D2489874
	for <linux-kernel-mentees@lists.linux.dev>; Sun,  2 Aug 2026 01:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785634428; cv=none; b=K28Scikm0lKC7ps+FlF36J4j13ZcWYoTit9bEmird0zaAyVpPkmKR7k4ia2taRvqDJ92bdIgyKC8lCuguMPrRmOOq7sN6b1yIcdBiLl1L9+8NlW236KdEWnXI5Meo74aRRzOraTjbYmIfzyPzVeoaRoxUiHRA7T3GPK25Zyo6SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785634428; c=relaxed/simple;
	bh=8XgKdcDVm1dedbv+A3HJy02Wfi+TEkX1z4ilW05XfLE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RpM3lrmBqec3fbrKXiEiRonVgpjNUL0H05mwFLHUf5Vt7k98fFcE791QTafVC331k5RXhzrsbL2MKGzuw/kJR1M2wlUAv2w1IlDEd5l994QkP82B5MIZld3fFOayv/epMLu7ezOuEQkxn2NlZWFMmb7d1NcYXJrXUvtNcWDgMX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HtDhd+iU; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HtDhd+iU"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84830c774a0so2216948b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 01 Aug 2026 18:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785634427; x=1786239227; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YOIbm829ZfJ26Ah+Z6Fui0r72XIqQRshi3Akci2D9rM=;
        b=HtDhd+iU62oN0Y1dEEQvAvF9xelu9jAipI0VbxsIvui/ZyCBiD4Z9ir5ehLyYvd6dt
         aQpwXpCOQcpJ8SmptDc1drfHQfIPlDYb4z228/fqyzWfk440HTmU7m8n66bb/Moja+8n
         QMFgWdHoWzqn8YFLVDkaOWRJ5vxULWlt6K7wycxSHKGrbGnbJHrxjQbpLuXTZV6ooeIX
         g3mN+Flk5FKy4Sc3AxJ6DjLcfkbdxeSbRpnQ4l2sww06EUaHax+YK91PZVMSVA4nQ9Up
         9Pv9kdN+KcEdgBQcKiG2v0dGVJGlk4s0KabkzSDXqVN+NfnJa3Mg4sZOS+AU5+oyZXrb
         jYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785634427; x=1786239227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YOIbm829ZfJ26Ah+Z6Fui0r72XIqQRshi3Akci2D9rM=;
        b=AwLjkRggt83qonEyYD/KdUIClqM4PPEakXYORuBRyZxpSEIX0CXJ4Uz4aUOh5PEoOu
         AfwZEHUEGxHmfPT0AWoqy8jetepGlYyxh8UW6L/6/Rer7mQ2QNoUSp0Duq43F4ZcJFn0
         VsjtR69/lunQJeyRFdZh2FPgeI3PqkV5WaKZLfjG8ce4k70WpmJ0pjUeVJSk6zhJ5Lr/
         lq/U3cvnWQCwtmUm8oxaURNH8oi/y5BGxn5JkU/UMR5k2N3bxcRFa0Ufc9utVvfsvAFh
         dPdDMqFSu5r8IC8S1qLuWTcY4+cuyhzKhIIfdChD5DxXC1eIehWIMYGZ9/6r3Fd8yz7k
         C3Ig==
X-Gm-Message-State: AOJu0Yw1KmCRh/guP3r24FtBeFpSRbCOGywK0/MDoA2K786z0g5G/LPx
	urFLEDcp2iaz2By69JMYa8n0JlmSJK/AjUNaM27ywHkqnbrNHzfen7gh
X-Gm-Gg: AR+sD11sRJnlerzG9pOhRVtB8g4pDBumJK2YMyu5qqXBcGELfkYsN/xoPZPzRSzC5HS
	ibn+FayMpW3LJzv2bFNoKdHCQco+bcCj+5wjFhoxAJ5XprlcjUCfemqamkv4+61fnXFlAFD7WSZ
	qxZchTQsBZQJ9Sfq1tw+IaNiPEt5Ft+xOYpX32opZsySaX7NRdUGa7tYaKmXtPHwpmeYLk+/VzI
	OewxT2bje++GsMehlTLd99mMfEc7+5Eg4QcbrUMS0hLyVP+bI8VdaB92WAqcXARs4dF3Nyee6SU
	Wmi76WjkywpNtgGOk9+nVqcVftlP70GtPvg7P/8dXT5x8D6K7yLRzzIMRBVx2ExZ0DtQj7Jt16a
	PbmfrpBTr/MjD6k5B0btHDi8L065G84BWJb5xNJbhVXg7JQNq5ehhOCi6c24ETveZ+Xqfig5+Nb
	gpMzvVjksrJE77GY8Lf/u7+Mf3sZ/5R+h7EXPjZvv1QFsMOAEruJV5m5c3gIH3bxsnHShcwTV/t
	xqj/b1W5Z9+lgch1jEDUJDRKI6iS5rKg8aQrwN9YQJMfDgnjuiY6WlTt8XCuA==
X-Received: by 2002:a05:6a21:6b13:b0:3bf:c07b:a9ab with SMTP id adf61e73a8af0-3c92a8f3f66mr5088929637.55.1785634426934;
        Sat, 01 Aug 2026 18:33:46 -0700 (PDT)
Received: from debian13.localdomain (bb219-75-96-14.singnet.com.sg. [219.75.96.14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c1casm21757626eec.10.2026.08.01.18.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 18:33:46 -0700 (PDT)
From: Adi Nata <adinata.softwareengineer@gmail.com>
To: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	u.kleine-koenig@baylibre.com,
	adinata.softwareengineer@gmail.com,
	dakr@kernel.org,
	bhelgaas@google.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] iio: humidity: htu21: Fix checkpatch tabstop warn
Date: Sun,  2 Aug 2026 09:33:31 +0800
Message-ID: <20260802013333.12689-1-adinata.softwareengineer@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Checkpatch warning:

WARNING:TABSTOP: Statements should start on a tabstop
+        }

WARNING:TABSTOP: Statements should start on a tabstop
+        }

Signed-off-by: Adi Nata <adinata.softwareengineer@gmail.com>
---
 drivers/iio/humidity/htu21.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/humidity/htu21.c b/drivers/iio/humidity/htu21.c
index a9dbf08b4f1a..908661c64eb9 100644
--- a/drivers/iio/humidity/htu21.c
+++ b/drivers/iio/humidity/htu21.c
@@ -105,12 +105,12 @@ static const struct iio_chan_spec htu21_channels[] = {
 		.type = IIO_TEMP,
 		.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_PROCESSED),
 		.info_mask_shared_by_all = BIT(IIO_CHAN_INFO_SAMP_FREQ),
-	 },
+	},
 	{
 		.type = IIO_HUMIDITYRELATIVE,
 		.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_PROCESSED),
 		.info_mask_shared_by_all = BIT(IIO_CHAN_INFO_SAMP_FREQ),
-	 }
+	}
 };
 
 /*
@@ -122,7 +122,7 @@ static const struct iio_chan_spec ms8607_channels[] = {
 		.type = IIO_HUMIDITYRELATIVE,
 		.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_PROCESSED),
 		.info_mask_shared_by_all = BIT(IIO_CHAN_INFO_SAMP_FREQ),
-	 }
+	}
 };
 
 static ssize_t htu21_show_battery_low(struct device *dev,
-- 
2.47.3

