Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5C7136E3F
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 26 Sep 2025 14:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758895786; cv=none; b=ZfKqWLSJPJxHAGIN3IgzFR0hMnj/BrfMV4mkK3hvjT3qLAr+S54lN/j0kiqSArVkfnupvr3wFEGjfzdepeNSRfjF/JFeQTFT7nEPD7tgTp2wq6aE7jIlcy3XGCsUEcv/XB7ZLm16pi9RYUhjK59Vj6+3TjDlgQEHcSiaLYVjkAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758895786; c=relaxed/simple;
	bh=I6/9jdTp8/1MngmdCZph5ifXgKWMK/EdqCPinxqQuNY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O6OVSsZzbQAY77IyY5WGNJjhxWTgTrrxDrq8kRtzEX6e4wHVkYh0q9h4uDPGpO4AEmCY2eruLqfhJHs9qNx5nMp6agP1dBI+La7IYbrT//n8bGeaZWwcc3k3BhNoBWwVtKlUqoD0JYExXQpwi/lU8LtstyniuSqX+q1FmSs3MU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lYHpPsKP; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lYHpPsKP"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-244580523a0so24102365ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 26 Sep 2025 07:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758895784; x=1759500584; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wKdZW0ftr/OUszuEc5uNz8JRSH+vp4e+yPjDngAenyY=;
        b=lYHpPsKPjsAbGZx75EBNi/sZINYBvSKJ2pXo6vb1VXH8GQRYDEVUzAvHzX/MftfbC4
         XBBWnEYI9VCU+t1JyGpk/xw7p4UeklZBAfb+tkANkAWGVoVwhN4GIXlB8hH5To9T8BeF
         mYe6HintCazJDQU09rffjTxYXdi5Jg/m06QJv+xI9O4XqzAnUOR3neG8HsiLVs/NHhNv
         +VU2JVZrDglerg6vo6CEzwMd/AL+FEIXN0gCMLJeQCmV118nDbiYsA/9vEb6cuCMJthK
         jLfXysdzgFWies2Z3bDuSPsTEv22lED9cYSSFpeZUgEjbSvIcaF/HHSph28SF1aw6b7i
         jWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758895784; x=1759500584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wKdZW0ftr/OUszuEc5uNz8JRSH+vp4e+yPjDngAenyY=;
        b=uh0OcLxq0ymlVLxgjn8L7l4UyJvJWJZnyRlk4yVQfmYchlW70axUOWbRZjaMiPDDC0
         Uuj6ImqrmKP7uYoF3IpF8d8u5RvdM0iTD/lgY1RaZIqGHbAh1n6f2A4YwIbxt8xnZoMr
         FA1U9BboOOi111jTg2LlROHoY5RSase3cBqyNpULn4yYwWxkFe9U4pXkSMfWWbfTw5M4
         wCgKdX/Wt2NFjtsU+LLpu7Jtbm2U4xkDbsuqCXQoU8UmmxP/6OEMeRjSmkSgCpYllPYB
         Oxs8HVfZjOqyaXFgKqnFQWhFAla+Dk4vGSAYdjNfSxsEKtIRS0ymDnSkdJXa9V7jLT8g
         BRJw==
X-Forwarded-Encrypted: i=1; AJvYcCUgq29d+g6Z5lwOYnH90Sjc9S0BDL/+gja8V1kIVbROmtrwauC/UwXqgVNNdgQAEBacoYI7CPGfZqT3keOr+iuaO0YpYg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9bf72VNvaSE8ll+KruKUQS1r6arNpXN49mvMIwH8uipkR4M0H
	6MRopOew2FWehLEc0x7C3AcPQmZ7tzhXR4POtMuif2Jr66MpGUarLB8g
X-Gm-Gg: ASbGncvCRq5SEoY5ObzZTxSYbPhuSa6dtilmQZktYco2Vruc6H3RS64n75BvkZJheuH
	/truElsupdthqwJEH7JtUv/J6zJq6NLi6qNtQN5ounwAjeBKzBGxUY9la8XvUPdOimxcxysPRW0
	74MvHJFQbXiy3UibF2Qg1vNtsUNyeA2Qc3sXOxb3arUHYh1yX6aqjIrxNDQV/5NSFMJg+6l6PHZ
	wpE2CnXz2HbC1QR3oU/0WIXoAKgvcJhGG00ttLjNZiCYNpqUyTzW31q3d/A06TMJ5CtnLzyTEzv
	UjKgeOISToy4MbJqSiQGKLAm8ZFuznc/F6f3goe2LPQczYyxQfqyWNOP9KGPaGCPF8ZYoX9DxME
	F9PR8TrZ1N2uVtmGuJJCb2WfrIehWNFfdMrnClRJVnBCrtBhQqhPWqywQEQ5n
X-Google-Smtp-Source: AGHT+IFkJc22u8I/AG9PpYdgB1qjcf+eKead7izUDftEMVWslMjY/E8jHFiu8jtsc2e7QyFDi6xRHg==
X-Received: by 2002:a17:903:1a2d:b0:24b:11c8:2d05 with SMTP id d9443c01a7336-27ed4a4bbaamr80629225ad.45.1758895783883;
        Fri, 26 Sep 2025 07:09:43 -0700 (PDT)
Received: from cortexauth ([2401:4900:889b:7045:558:5033:2b7a:fd84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6ac94ffsm54797165ad.136.2025.09.26.07.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 07:09:43 -0700 (PDT)
From: Deepak Sharma <deepak.sharma.472935@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	Deepak Sharma <deepak.sharma.472935@gmail.com>,
	syzbot+7617e19c8a59edfbd879@syzkaller.appspotmail.com
Subject: [PATCH RESEND v2] HID: cp2112: Add parameter validation to data length
Date: Fri, 26 Sep 2025 19:37:29 +0530
Message-ID: <20250926140729.267766-1-deepak.sharma.472935@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v2 for the earlier patch, where a few bounds check were
unnecessarily strict. This patch also removes the use of magic numbers

Syzkaller reported a stack OOB access in cp2112_write_req caused by lack
of parameter validation for the user input in I2C SMBUS ioctl codeflow
in the report

I2C device drivers are "responsible for checking all the parameters that
come from user-space for validity" as specified at Documentation/i2c/dev-interface

Add the parameter validation for the data->block[0] to be bounded by
I2C_SMBUS_BLOCK_MAX + the additional compatibility padding

Reported-by: syzbot+7617e19c8a59edfbd879@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=7617e19c8a59edfbd879
Tested-by: syzbot+7617e19c8a59edfbd879@syzkaller.appspotmail.com
Signed-off-by: Deepak Sharma <deepak.sharma.472935@gmail.com>
---
 drivers/hid/hid-cp2112.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-cp2112.c b/drivers/hid/hid-cp2112.c
index 482f62a78c41..13dcd2470d92 100644
--- a/drivers/hid/hid-cp2112.c
+++ b/drivers/hid/hid-cp2112.c
@@ -689,7 +689,14 @@ static int cp2112_xfer(struct i2c_adapter *adap, u16 addr,
 			count = cp2112_write_read_req(buf, addr, read_length,
 						      command, NULL, 0);
 		} else {
-			count = cp2112_write_req(buf, addr, command,
+			/* Copy starts from data->block[1] so the length can
+			 * be at max I2C_SMBUS_CLOCK_MAX + 1
+			 */
+			
+			if (data->block[0] > I2C_SMBUS_BLOCK_MAX + 1)
+				count = -EINVAL;
+			else
+				count = cp2112_write_req(buf, addr, command,
 						 data->block + 1,
 						 data->block[0]);
 		}
@@ -700,7 +707,14 @@ static int cp2112_xfer(struct i2c_adapter *adap, u16 addr,
 						      I2C_SMBUS_BLOCK_MAX,
 						      command, NULL, 0);
 		} else {
-			count = cp2112_write_req(buf, addr, command,
+			/* data_length here is data->block[0] + 1
+			 * so make sure that the data->block[0] is
+			 * less than or equals I2C_SMBUS_BLOCK_MAX + 1
+			*/
+			if (data->block[0] > I2C_SMBUS_BLOCK_MAX + 1)
+				count = -EINVAL;
+			else
+				count = cp2112_write_req(buf, addr, command,
 						 data->block,
 						 data->block[0] + 1);
 		}
@@ -709,7 +723,14 @@ static int cp2112_xfer(struct i2c_adapter *adap, u16 addr,
 		size = I2C_SMBUS_BLOCK_DATA;
 		read_write = I2C_SMBUS_READ;
 
-		count = cp2112_write_read_req(buf, addr, I2C_SMBUS_BLOCK_MAX,
+		/* data_length is data->block[0] + 1, so 
+		 * so data->block[0] should be less than or
+		 * equal to the I2C_SMBUS_BLOCK_MAX + 1
+		*/
+		if (data->block[0] > I2C_SMBUS_BLOCK_MAX + 1)
+			count = -EINVAL;
+		else
+			count = cp2112_write_read_req(buf, addr, I2C_SMBUS_BLOCK_MAX,
 					      command, data->block,
 					      data->block[0] + 1);
 		break;
-- 
2.51.0

