Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC981A0BC9
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  2 Apr 2025 17:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743614716; cv=none; b=H0V9hR8Lp+n8VAtQkag9C4C88H2KITwJLhzaCdTCDXBKBaJeKnk7TFSoMIRH7e7dUK/9dkKB5eLRsdCTUFD+UF+9fI6nn+A1v/RUYHlEgNWvhhr855F/lW7PppaTbV4IQr2HIaGmRIjcBlQtDODU6W4A58YbvMkhKWFqqzYnkgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743614716; c=relaxed/simple;
	bh=0I4gf4qOzqd/dz3inFosaXWL+uusZbW4kRowm48cadc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=de8/Kii1OStaLpuN3x8S9AQz1ueED6Rfn9EBgD8ob4RUrkwKaxOyaeYXW9909m19Yj0kQwowpcc3IgyctK91fF/Htk/053XfAlWkufR0SxhNhCpEhyNy4MsmI95waKJOMDM6VuRrIB67aFGNj6j6oLciCPu+ou/B/7JrqPm3veo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZvLYXRO8; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZvLYXRO8"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c14016868so55486f8f.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 02 Apr 2025 10:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743614711; x=1744219511; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VFKKbFIB0gA4Lwa0ZRTmZZ0kPFvmHe9B0sAjPCWOPmI=;
        b=ZvLYXRO8FlEYdOJ5DwuQg7i6RMvLp1sMQYGcS4S3r7ApNZFK538gI04xcavofLlaE7
         nLyJWCK9fMHWDJaOQxCm6IcU0uqk1cuqSyZ+Tn+3aw2F8I2y8c8x16JyVm0GEGMzhnNa
         4k/yPvs9kLPWj1Rna2zEi549V1mROLFdYRinnoBiW6HyDfN6rOIrehPmYGjPErfYW0cQ
         xMyHQ7B1cFKhLS2vwmlWrMxGGyKiDtv6YT3DmYyASO2YVpEXj+sLdwgC+n25OTsGVI6Z
         2Yb7wFpFLmnx6WQPb8vNTacZD10mp2WH/N/Yfv7jMUrUqKH6Tgl9s7lOppn9P9bInLks
         NN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743614711; x=1744219511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VFKKbFIB0gA4Lwa0ZRTmZZ0kPFvmHe9B0sAjPCWOPmI=;
        b=KEJfT8jGdicQnBItNZmDzVVtju5JiwWNxmZUCN4QzJjiSMbbql9JfdWQN2KpWd/UxS
         WBBSUzT9iVgnYUcMkBW61aPktj+9g4x5pB3AgZzjFQgVod32r7pgW4mkeo595bRGOoXP
         g8Md03YzdaRsKMBK5n/EWUu6E/l/h2MOFXMxRyE+g1WDPMF0Ix2+h/lCewJmR5y5i268
         0m32ZxIdu/QBGQo1AucoEOm34MxmUWVn2wxieERgbWFw+ev9nmdYjfB9PJKqTGZRjQNn
         eAdTEeKTmbxdcufZYskKCoXP0KCPJTmBfR3OGqlxnoGHJFxZhurdoymDLuXfAbjxroKN
         Bmcg==
X-Forwarded-Encrypted: i=1; AJvYcCVzmf1eMpHAsoaJqQ3H65zweurpsbAATXyOPVsN5FiLf1/GdoCXmSgC9V1+LrlrSZbPALPwlUSHJt1wjoCQDiACrYCxLg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxj+cMWtU83DkyDNr90jCdVkX3sBfS+fdslNbVDUDbgRVLM+hoM
	50VZZ5tC2oHHoFQQ0nr/43NQySxt8DJ1sMFsYG2Lg3TzEadYPIyOCX5VOntPJF70yA==
X-Gm-Gg: ASbGncuox5NJ1Abl/X1KOjMzo7JLrovAmYXUeMVuEp/nnNRM0FwyJjfqv6eSWcH625V
	H0NIU6LCzif5d8cYfPBpM1ju8UJJ4crTmplzjj4ibAyDCXwID6BBKV+8W475Xvj266eG+80RgJ9
	9bsRNU+waeDT/9Br00Htby29GXTuvEkR5aPclDocOTSTUhB47sOOzdFScfIr10nl75jzzqbGNHV
	AVGZ2l/EHfaU0u4j/jsMbx/2XdjeN/113l7yQRezbIj60WzHOj2JIj6HR0pmw5xa0zAxU0Tsc7P
	HBJPJSHXBsMd3Frftdlo3mDP3noucPSeBQljEXIpymkRaY9oQU/GJ2ys+ls=
X-Google-Smtp-Source: AGHT+IFoN9OKQZvEAPW0TgURl/4JHMogdjPbJRS9b++IQ3ngDtteLtDe+TYiljYQr3uSBN5W86+M1Q==
X-Received: by 2002:a5d:64c3:0:b0:38f:2a32:abbb with SMTP id ffacd0b85a97d-39c120cb586mr12147320f8f.4.1743614711132;
        Wed, 02 Apr 2025 10:25:11 -0700 (PDT)
Received: from localhost.localdomain ([78.170.183.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b79e0basm17854445f8f.63.2025.04.02.10.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:25:10 -0700 (PDT)
From: goralbaris <goralbaris@gmail.com>
To: martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	goralbaris <goralbaris@gmail.com>
Subject: [PATCH] change strncpy to strscpy strncpy is now depricated. It may not NUL-terminate the destination string, resulting in potential memory content exposures, unbounded reads, or crashes. Link: https://github.com/KSPP/linux/issues/90
Date: Wed,  2 Apr 2025 20:25:04 +0300
Message-Id: <20250402172504.101576-1-goralbaris@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: goralbaris <goralbaris@gmail.com>
---
 drivers/target/target_core_configfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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

