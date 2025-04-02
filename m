Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9C62AF14
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  2 Apr 2025 19:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743623153; cv=none; b=Wo+VFNt+2vaKzTzuQ9VHHLeBpsE1bnlqNoVeJfU5IQsvFZaNbugkgl3Zl0tQP5e6HYpKwzhOqB10XhQMRvlPEpvIxvG95+xmHMB+YuiqFJoMOuaUyzNOKDVABhyWZdvXCPLAaShwEvx4rrs29za28jhz0mdMLueUTuU4f0bUFIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743623153; c=relaxed/simple;
	bh=gn+dqD8kHKTwNOr095wyo0YLN79ewCDgi/1n3vknIDk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CQyOXMVJblOkPbp99MFZcez6XClAyMd740+sT+/S1S8a2rau/Eba4Ymi0p40rE29gQ0D+UxpG+XrXFhYU8+Gy60PNjkZs06FYrs1eA8cs5eUPLyXeaCdBPnA9cl/zXR2HGD9khKV55RE/6VK2efxC1ZmWDpTgt78BCOTOUKwdP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aYDkJyF+; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aYDkJyF+"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso995065e9.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 02 Apr 2025 12:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743623150; x=1744227950; darn=lists.linux.dev;
        h=content-transfer-encoding:signed-off-by:link:mime-version
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x5CNQtgarLi54ozXaIyLzjauBHWd3izyv2KLVPB+Zag=;
        b=aYDkJyF+UMYCJIUN54qioUOK7r1wuHUpbvNOn+lHxK4rcrahaKRyQsn0v+3HbzIF9G
         HNMjRdIRxd9NGXmiZ8X9Yud291o6CHHTXI+FWzo25YY1Psqj8wOCO363lJD4Fi6OjfvK
         oYfAADvqhUd+SrdCUJQRU1T3BDBqAxUYEdWuGARsVojdGzeHTH1I4QjTVIRtXzuYede4
         yWZ/OMmt01fYYVNRKaqcuuwz4s398mX9Y6UQKhdvNDHFR0TJ5CjVBU2Z16pwnvtAEfiG
         23cBxWlCKZtnQzXIcxHwPGQq5iTFBUjzahGyV7lZDPDSGtDPMGWbDEbcsKEPaFusZYQR
         lF+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743623150; x=1744227950;
        h=content-transfer-encoding:signed-off-by:link:mime-version
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x5CNQtgarLi54ozXaIyLzjauBHWd3izyv2KLVPB+Zag=;
        b=pcfpS1U6zi8rOpTFCMSWeGD/uJ0v7RKSxEojyK1MqfLJ8abg9sAUX2pTf7HVbrULwG
         +vfsxqKs6FYWBmKNSjO2QI1jIx9inNQMZPFRNtFG0JwXCLQeHdQc7ipu7OO/Hcd6iJ3a
         W+iIGz0sS/kPgmOepNwtfbsHldg5vgygqIX/f7959h54u0dabxWVIAj96Vcr0B04l+Mw
         54Her/WhTPGgapkbRwgpiFnhf2ZhHjo7DtV4HZj2ydimT84FyNJRNgxTZpKOmsnLd/O8
         J3YY25umPnP8uSuHQPh9VDRvCV2WeethoNuM0m1EA4fhnIoVoKP3ifJIpL9Y3cuaXki9
         9TIw==
X-Forwarded-Encrypted: i=1; AJvYcCVV3d4OOPelkhOt2FdWXMVAnHT/MEg1JtdjsUpAXEJ30X6t28CjFx/FTAxr5opn+/YWweTyBZ/W4eGOYnC8d0347Ku2KA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxBsgX8cJ+d1mEoJNtsmstEetDw3mxlSbWtQOjxlMtwwMRXMijK
	Erpe6L+Tj6OWSVB3vLnaOzr4uZvBFny7Kwz3+LG3kCrj+pOCxCeU
X-Gm-Gg: ASbGncsa9wqW8Csc/GsNQD7LfwZCqRRcu3L2GxG5Ef6KGrRV1iAfpaoPIkN5F7GfjPV
	LhfLEUOhpPvx9Mu3nBX9+CEkw4UsU3lfvWFqNJnfaylfJZklWY1nuJedNU3G1A6V9oH5r8JfHij
	0m9G23ZRkVIVBqmgo8fK5l3Vil2oUOc2br4yqsKTA9+M3WEY9dBqM1TC9Hzr8feXARNBMwM3me5
	Sj0xSfNiS3RqFkgK7F6i0ouTuPx+tPJ2IMPHplwlEoE/TzOF1S7dJzOIkFzMu1QCnEJDukOYYZ9
	4XdETQi9wqugJHq805bkd5RT6cfGcpYbUF9zSUzxI6E+5g6EX9blb4/g+JX4cc/YIrdOEw==
X-Google-Smtp-Source: AGHT+IG3x4qoJSXA6gTEIfgC39jrq+mPmuEnWmWyqOZlkJEE9EwdmcwoJH4GOTWhm3kskgzmWXFimg==
X-Received: by 2002:a05:600c:34d1:b0:43c:fffc:7855 with SMTP id 5b1f17b1804b1-43ec13ecacfmr789565e9.15.1743623150078;
        Wed, 02 Apr 2025 12:45:50 -0700 (PDT)
Received: from localhost.localdomain ([78.170.183.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb5fd138esm30309445e9.13.2025.04.02.12.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 12:45:49 -0700 (PDT)
From: Baris Can Goral <goralbaris@gmail.com>
To: martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Baris Can Goral <goralbaris@gmail.com>
Subject: [[PATCH v2]] transform strncpy into strscpy
Date: Wed,  2 Apr 2025 22:40:11 +0300
Message-Id: <20250402194010.194562-1-goralbaris@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Link: [1] https://github.com/KSPP/linux/issues/90 Changes from v2: -Description added -User Name corrected
Signed-off-by: Baris Can Goral <goralbaris@gmail.com>
Content-Transfer-Encoding: 8bit

diff --git a/drivers/target/target_core_configfs.c b/drivers/target/target_core_configfs.c
index c40217f44b1b..5c0b74e76be2 100644
--- a/drivers/target/target_core_configfs.c
+++ b/drivers/target/target_core_configfs.c
@@ -143,7 +143,7 @@ static ssize_t target_core_item_dbroot_store(struct config_item *item,
 	}
 	filp_close(fp, NULL);
 
-	strncpy(db_root, db_root_stage, read_bytes);
+	strscpy(db_root, db_root_stage, read_bytes);
 	pr_debug("Target_Core_ConfigFS: db_root set to %s\n", db_root);
 
 	r = read_bytes;
@@ -3664,7 +3664,7 @@ static void target_init_dbroot(void)
 	}
 	filp_close(fp, NULL);
 
-	strncpy(db_root, db_root_stage, DB_ROOT_LEN);
+	strscpy(db_root, db_root_stage, DB_ROOT_LEN);
 	pr_debug("Target_Core_ConfigFS: db_root set to %s\n", db_root);
 }
 
-- 
2.34.1

