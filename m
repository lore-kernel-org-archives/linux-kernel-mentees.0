Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7ADE19EEC2
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 16 Sep 2025 00:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757984210; cv=none; b=e26vMOVtyTA63TPexq+eQa1t9feaKW5cRJYgXvmqPl/QzcTITu5c2WSB6lwJTIEPrt8J9kQReN1MJuMIfdrR0eSySgd9w1Z/ISHMHF8g4AJQvTeGak9aBr5QUcNOXjbee/PSO/C34Uych/Q4Yq9KMxa0VxpbEGAJDfLQIJUqwmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757984210; c=relaxed/simple;
	bh=Qy71Ms5YFMmHBNBNOUjSdAy0OrAHc4jC5Kj1qyilACU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g/L/A1g8FfuxXKOxb0sNnlv3gMLRQrDwU14gFuCtkAWG+BBQ+3nkcvzogJWKIOtqbCIUArBy22sUD0/Un1zfyNfqt969jJOtG4n7/oSdTHZj+AyuDWH3265b5Nn3Pac0Yr0VBgR6qxpAcRzmJ8ZPmTyQD7T2TA949YrKsKBdfGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qv2iyOz3; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qv2iyOz3"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b4cb3367d87so3185540a12.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 15 Sep 2025 17:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757984208; x=1758589008; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LeqZlInGPp3SGFJdjB62EJO8F13RY/cKYxhUSIsMLkk=;
        b=Qv2iyOz37espPAI2dfCSpnSqPET+KJ77vpTn3QZ2TH6/FN61L1mOsDVV3kOwzLfnPP
         jNiJZhNmHIWVYb0E8jxw1fuar9UHZvEotMUsfUbDuEvhZwDSkbgW85CYwvtqVJ8aBizm
         plOziXbLzM7WUf5u+Rx6tCPF9i4MSciN6TcSaZUwS7aIXzyHM3TyeT8q5D1MQX6tYipB
         qAsFZkkjYp088qWUAf1aoZ6ETA2J/AjpskxnNRHPSlX0ivWgG8fDjw2B451k6+Re18Wv
         BXwQ1vKjhdzp0ah4eaJfnovSjEwuqs/dzahFYNPq8mPCZ/q04cVBfUCC6Xo5uEnwFwoS
         yDIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757984208; x=1758589008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LeqZlInGPp3SGFJdjB62EJO8F13RY/cKYxhUSIsMLkk=;
        b=e7VhOnVXfTUg6qqWWdzM4DWoFHBBYQHg4JpDV49gtJKRckaHaksvVCPdPDSQLbkzXk
         XzkBHK61aLZUWa5NcLiNGSHYWLYaJebgIOUCQ4HWHflzcZh89xPbkGSkW0fevmmCPNp7
         KGEOJ+Bq8HHP4yQ77R8uVWznnOgBSodS3HXmNZTMWHviesA95TJoooOCbO5FDePeuCW4
         eDrX52lEmpVbjpjDTX9QAPR+cF1zSqVI/xEh0Wgl+XG5MNcNFtQL9tqF22uPc5CokEKG
         DIMkr7Z4xOUym3qPviv8OW74XDndL+xHo1dp+nQDV17uG+UOhmZ52UnZGWulfTcazLQ3
         RaAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtZTHRYFpHOBdr60Oi+gc8yiJiHFCrUByQYPAzIRrtL/DfmNdUJc6SuH+QLqfTXE+0cbLPjdy77LJaSiT8RIGQITOBmA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyLVgMWHDD8wErB9np0MC/1EVRbrKl+k34DN/cYN7M0PhlYx8rv
	ssPNm9NDUUCl1oYLBn+WaqSSX2wYO3IjSjjcJYgglwQcWWkv23GbJjxq
X-Gm-Gg: ASbGncu5Jucwhz3/CnStT2nbgk6vQ+TGu8+wRceVSBkuPB1zDz0BsEQYhJEkExgUPO1
	nMNW1gpUHnmc7iWTD3fji7bEfS7D2MOdEoLVrtN6I5KgmxkoyamZDfSpf48qu4W3q4lAPsPI0cC
	PUPwiiRVdjh1qhbHgbJ+Ve9XEo0qH0Z2+QHQEaApRzB/lmlC6oQE3oVHZUI/bbZBflan6lhIL8d
	qth9yNyGRdHTwx2MSJb6VG/kGqXnVirMe03jEIf28wuG8a7BM/AX2TFgxwxUYHrFIiEXb234TRG
	NXARH4sAKX7ACk0W5d5CButWls8TofUbXPdjgCOv+GPKZmp3iGXD+0X8xk57fcroBBuP8BWvNvZ
	2JXTU5cmm2HNrWbvU3G6pJ94a2nyTa2fAobUQvDwP
X-Google-Smtp-Source: AGHT+IG8hhTJUBQOJBQwfVlneT/Gr2URBGX24fPocs1cx/+EfgjCvVldYUoFdG5SzWtoUpwFLFSGRQ==
X-Received: by 2002:a17:90b:1dce:b0:32d:d714:b3eb with SMTP id 98e67ed59e1d1-32de4e63c46mr18038247a91.4.1757984207847;
        Mon, 15 Sep 2025 17:56:47 -0700 (PDT)
Received: from cortexauth ([2401:4900:1c7b:db3a:1c7b:a123:6d26:f0bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607b3603asm14142918b3a.84.2025.09.15.17.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 17:56:47 -0700 (PDT)
From: Deepak Sharma <deepak.sharma.472935@gmail.com>
To: jikos@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Deepak Sharma <deepak.sharma.472935@gmail.com>,
	syzbot+7617e19c8a59edfbd879@syzkaller.appspotmail.com
Subject: [PATCH] HID: cp2112: Add parameter validation to data length
Date: Tue, 16 Sep 2025 06:24:51 +0530
Message-ID: <20250916005451.303072-1-deepak.sharma.472935@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Syzkaller reported a stack OOB access in cp2112_write_req caused by lack
of parameter validation for the user input in I2C SMBUS ioctl codeflow
in the report

I2C device drivers are "responsible for checking all the parameters that
come from user-space for validity" as specified at Documentation/i2c/dev-interface

Add the parameter validation for the data->block[0] to be bounded by 32
or return EINVAL

Reported-by: syzbot+7617e19c8a59edfbd879@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=7617e19c8a59edfbd879
Signed-off-by: Deepak Sharma <deepak.sharma.472935@gmail.com>
---
 drivers/hid/hid-cp2112.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-cp2112.c b/drivers/hid/hid-cp2112.c
index 482f62a78c41..90292ce3d363 100644
--- a/drivers/hid/hid-cp2112.c
+++ b/drivers/hid/hid-cp2112.c
@@ -689,7 +689,10 @@ static int cp2112_xfer(struct i2c_adapter *adap, u16 addr,
 			count = cp2112_write_read_req(buf, addr, read_length,
 						      command, NULL, 0);
 		} else {
-			count = cp2112_write_req(buf, addr, command,
+			if (data->block[0] > 32)
+				count = -EINVAL;
+			else
+				count = cp2112_write_req(buf, addr, command,
 						 data->block + 1,
 						 data->block[0]);
 		}
@@ -700,7 +703,10 @@ static int cp2112_xfer(struct i2c_adapter *adap, u16 addr,
 						      I2C_SMBUS_BLOCK_MAX,
 						      command, NULL, 0);
 		} else {
-			count = cp2112_write_req(buf, addr, command,
+			if (data->block[0] > 32)
+				count = -EINVAL;
+			else
+				count = cp2112_write_req(buf, addr, command,
 						 data->block,
 						 data->block[0] + 1);
 		}
@@ -709,7 +715,10 @@ static int cp2112_xfer(struct i2c_adapter *adap, u16 addr,
 		size = I2C_SMBUS_BLOCK_DATA;
 		read_write = I2C_SMBUS_READ;
 
-		count = cp2112_write_read_req(buf, addr, I2C_SMBUS_BLOCK_MAX,
+		if (data->block[0] > 32)
+			count = -EINVAL;
+		else
+			count = cp2112_write_read_req(buf, addr, I2C_SMBUS_BLOCK_MAX,
 					      command, data->block,
 					      data->block[0] + 1);
 		break;
-- 
2.51.0

