Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E5F79945
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  7 Aug 2024 18:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723054779; cv=none; b=e9TjPB9Hbs08BEnkbHWQn88BctX77Gf4o0CyuDJnftW+D7Sj8AbyFII5kFvaM1QCtEcqPI3addqoTfmr7AZHFfKsVb3BDD8Yalo9VztPOFBSh+bpQe+uP7Hgd/0Rpphg9IAKhI5hTaVE+d+v+nLUQLVVt2vKq4IETHyk15E8L4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723054779; c=relaxed/simple;
	bh=P+T4BKP1YW+rpCuUoCu3NP8xYBTKn2cfdYb5TO1WseY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GTg42a6U/Y6IijhKvhS6vbHnVigQ/HOCfURNC/0g6Sf5Ne3S14XK3FX0en/XIehLXn+Xzes9E/WlDNbsdzsD924jZpkBbMAdiyuuPXfXwjvLXZLNUPg3AyZRB1Vyk+KN40y3PWtSXtQAxZEwdsm5n4qOGUZkgJ2w8OD+qykA3yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K26JLgIX; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K26JLgIX"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 223BE80893
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  7 Aug 2024 18:19:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5EpRPsJcnyLS for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Aug 2024 18:19:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 780CA8087C
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 780CA8087C
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=K26JLgIX
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 780CA8087C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  7 Aug 2024 18:19:37 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2cb55ff1007so183015a91.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 07 Aug 2024 11:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723054776; x=1723659576; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HLh/tGSnf4KVpltLnZCFCEYBN1Sy0qgXLUyy8qKyWvY=;
        b=K26JLgIX9eApjaiNtiGQYl1/5iHndTHMJieo4cabjcsMUf+m+0Y952LkcInM2GH/aF
         CY2Hcb3YlHmkC3Cw2/USq29j8yv9kyJ+5NyCeI66zOOCEApIobn7lk1OLGXa/LBVgGBi
         tO8mdaQ9NTCRSKLdiX+tv3csYWBtG/E/km/5/e8chNP1MdqsKk4mnHwk521OhzQ8Aosy
         LCGsz5rs35dX75MP+Drn73rjSiH7wq3PXjOwmJMHEJeVGiDj/XoBcd8u93uRO3mWNlif
         0oEb60gmSyTuRxdcH6w4WetXMhXXb1gxvVIlQpF2HKNO35nVReT50cwSjifGfsZtwaMd
         Lqzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723054776; x=1723659576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HLh/tGSnf4KVpltLnZCFCEYBN1Sy0qgXLUyy8qKyWvY=;
        b=O3DFXoND/zOVxlC/fA+z9PcgkLGzr/wj67jc7BM/M49lgcFIhC0pq/7OfHKNdHuKo6
         iZcNSjgCdP9qYc61RwmYofj34V08zw537DQE/hOEgDEm+/M0IIF56r7eNLcyQrkgOaoU
         7U1m4JbTMWIyLiO3DEnnF27lQ2vxPWAri1hgAj+DdNhkzJSw4Rx3KWDHGP3FYOFVVn55
         B8IAVvAxWdDjOi2BLN5aVt9aAcMZt3Wr7YNxQ1NR2wv2jDugJm0ki3jYpqLKHt0X9TgY
         pVUHX6zFyE0KMMINI1ueVRqGnb5a9ax1w3+o/o2EJVg/kfIPee5/nEDFhE1zn9BGcJTN
         k5AQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfqczjNJpGG/F2Hji3+xyIwgcQNxpJyt5y20Mv7vjRJw2pXtMPtWcyocETr+zHhPr9kjPizIjwh6jwvUpRDwIodhW2wdlMb088rq6e6YKGXob04lnoE5hjO4sx/xFX
X-Gm-Message-State: AOJu0YwPPpjUQJ+/L0dmvGy7eu7kiLGioEnKSeM4CIpr7xDLDSd9e1wH
	opEdMGWHCmc4Pr26RC+7HloSEJ/hGHM8UIC2rwviakgqVywDYU0G
X-Google-Smtp-Source: AGHT+IEa6XbSxxD+9mFxIUaBupGjgBWy+l5Fv4hGRQwAlhZkls51VFy+7Rfm128EkQxaLmeVuiW+VQ==
X-Received: by 2002:a17:90b:d94:b0:2c9:5f1e:1a62 with SMTP id 98e67ed59e1d1-2cff95401f4mr18063745a91.36.1723054776380;
        Wed, 07 Aug 2024 11:19:36 -0700 (PDT)
Received: from embed-PC.. ([110.225.178.109])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1b374b3cesm1913041a91.48.2024.08.07.11.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 11:19:36 -0700 (PDT)
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: jdelvare@suse.com,
	linux@roeck-us.net
Cc: skhan@linuxfoundation.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (lm93) Return error values on read failure
Date: Wed,  7 Aug 2024 23:47:46 +0530
Message-Id: <20240807181746.508972-1-abhishektamboli9@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the issue of lm93_read_byte() and lm93_read_word() return 0 on
read failure after retries, which could be confused with valid data.

Address the TODO: what to return in case of error?

Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
---
 drivers/hwmon/lm93.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/lm93.c b/drivers/hwmon/lm93.c
index be4853fad80f..b76f3c1c6297 100644
--- a/drivers/hwmon/lm93.c
+++ b/drivers/hwmon/lm93.c
@@ -798,6 +798,7 @@ static unsigned LM93_ALARMS_FROM_REG(struct block1_t b1)
 static u8 lm93_read_byte(struct i2c_client *client, u8 reg)
 {
 	int value, i;
+	int ret;
 
 	/* retry in case of read errors */
 	for (i = 1; i <= MAX_RETRIES; i++) {
@@ -808,14 +809,14 @@ static u8 lm93_read_byte(struct i2c_client *client, u8 reg)
 			dev_warn(&client->dev,
 				 "lm93: read byte data failed, address 0x%02x.\n",
 				 reg);
+			ret = value;
 			mdelay(i + 3);
 		}
 
 	}
 
-	/* <TODO> what to return in case of error? */
 	dev_err(&client->dev, "lm93: All read byte retries failed!!\n");
-	return 0;
+	return ret;
 }
 
 static int lm93_write_byte(struct i2c_client *client, u8 reg, u8 value)
@@ -836,6 +837,7 @@ static int lm93_write_byte(struct i2c_client *client, u8 reg, u8 value)
 static u16 lm93_read_word(struct i2c_client *client, u8 reg)
 {
 	int value, i;
+	int ret;
 
 	/* retry in case of read errors */
 	for (i = 1; i <= MAX_RETRIES; i++) {
@@ -846,14 +848,14 @@ static u16 lm93_read_word(struct i2c_client *client, u8 reg)
 			dev_warn(&client->dev,
 				 "lm93: read word data failed, address 0x%02x.\n",
 				 reg);
+			ret = value;
 			mdelay(i + 3);
 		}
 
 	}
 
-	/* <TODO> what to return in case of error? */
 	dev_err(&client->dev, "lm93: All read word retries failed!!\n");
-	return 0;
+	return ret;
 }
 
 static int lm93_write_word(struct i2c_client *client, u8 reg, u16 value)
-- 
2.34.1

