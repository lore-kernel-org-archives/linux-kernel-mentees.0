Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A441F12F4
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 26 Sep 2025 15:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758898827; cv=none; b=IPLwMkD5TQR0mCTrESOuCEcX6p6/QQwDK0/U+lp9kwzzIiOwLLpqtwgjmNVmufwZQplbh4ymIvfKK754eFUWqB5Gwxj2NbXtUxhEjExlWP5UZj9EgTs2g801PRMFiFdBaw63CsZ1BSQzQDVwYTEtsSBFJUGUueBFPwjcbeIswSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758898827; c=relaxed/simple;
	bh=9H4Iy5ZQioUbGAt3cq2QPsffBJRpfU6SmMhpX/U27b8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OcSg+Ld1n1aGb8znU33U/V8iUTYd08dfgN7q7gRwg02pRNEdNh9hAJZGpdkA1kqYRyPXWI+thkuCDBSHtkRtIUAM2fElN3JWA8dX0pUGKq3BQydPqGL+YHRlT7PWtU7VO6ZJNkjBu9jDtEF+jAfx4CCVLP5SyONhsPNoUWfZAf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BnipZrbs; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BnipZrbs"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-77e87003967so1261763b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 26 Sep 2025 08:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758898825; x=1759503625; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6D/jsLcW0Gr7inyVqcSEs7jW1/FD06YYHLSEbTVz1zU=;
        b=BnipZrbsuMR5b1KfvxtJLTAVCRt2StyiQZiN0dXd5MmkQAEUFtplIfC9AKyGKUiztH
         xKBfL2EH8HctYaQV6znm76XjdODuwnMhrXGKAWJZjiKx9k6Ybq7vjVcgZIdUvpTKvYis
         u2NxZC3ikLb/A7BWu9A34cJ367JzvmiDspjNIWkbE6+/+//VYq3iVCqXhJvNByxrmjk6
         RMwZoQXHVlG9SjB7c1fKljPasKqttso5K3gb47M2jc+2+KuVgZmnQkrWfwgbYEvTIpM8
         0KDOL6UPI7wSeB8zUhKaBhMgMk/Cm3kkLyuVfKmF0LxUSqPH3ob/Orzcds92GWL7VGkZ
         YzgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758898825; x=1759503625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6D/jsLcW0Gr7inyVqcSEs7jW1/FD06YYHLSEbTVz1zU=;
        b=H6a0hos7VpthcUkYm1mDvvEckyTeyLSYEug49Rg72QPf1MZcXjufDesU7TsDRB0yqA
         I9Yeup/I/vgiemRCMotpBaHSwpNfpp3DDkOSxhba/ah8UGF7k7XU38WF6ZJypHABoAQb
         5SCW+wyFWTw9PO2Ikj7YewqAYrDatwtPF9iP997ODDmSYiefqBae7RwndKXLD5+K88ch
         eNj7wsB6tMNrKab0C9uZkVPVNzJMAXHRxAOoalbkTIZww4XBDLFubI7cR73XOO0+Erq+
         QqBXHmMngSFMMMa3ChlSmSz3fu6rNaTLJ3KB/huD3ql5jVyeY/e8TV75PN9PAU2t75ev
         SIGg==
X-Forwarded-Encrypted: i=1; AJvYcCUMbmaI0RYe+s1royPEFZsYN61+qvknZ6uuAMbEGkJ4gtlNwEg1ljxR5I5xMcjuyS+1gSPOT5JOwi0lXSSGEAmcIhT4TA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxAL9P0RDlH1QcCzgG7FhQa3sapxn6TIrc3T4SNTub703sqIEZn
	4gL5aujGr4fewbZ3DDc6XlOn3i1NdhmDsObDyBYTpzQg9+p8VPDkKEbI
X-Gm-Gg: ASbGncvtOiJBXl0diw6wCpPh8yMLK9nQYOo201iazxHhqpLU0bDhAqFzZdbcGXV5U0S
	flxjTrlMRH9TJJ5AWTPoGKcL4+LFjD9BBqRgiXAKMCCjwJvXr/TZXPUPxs7+AKHnectNVgCMe0x
	qNblGPc8t537g9AT8S+jljjDCEKp4ovJC4COSk+NSmebK7Q1W94Km/KitVIcGljobh4uwDieL57
	IFWMdCMnedBIh/73x5p0EDyYyWXyK+ARsTNCUZ+Dt+fNmoKx4dlAauTl5C1/4p337DTT64wUgp5
	Qv8fN3yta7pkA7mbu6zXyAgvfDXYZUhDqMgggTzU0Iul/EIKIlZX1mYBzkKFlDDOW7W+eZY6fRz
	a9sNt7DRZhuFW6pGUX7LCDqD4HxA7vz8bfVDyXcg=
X-Google-Smtp-Source: AGHT+IE+iWzUhddIAroqnNSYAnKwkrlMRDpTbw935pYA9Du0mnB7k0yS2TSf6oe63ECHy0yPKHl+DA==
X-Received: by 2002:a05:6a00:2d06:b0:772:301a:fbb6 with SMTP id d2e1a72fcca58-780fcea2dc8mr7639643b3a.19.1758898824647;
        Fri, 26 Sep 2025 08:00:24 -0700 (PDT)
Received: from cortexauth ([2401:4900:889b:7045:558:5033:2b7a:fd84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c06af6sm4586044b3a.88.2025.09.26.08.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 08:00:23 -0700 (PDT)
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
Subject: [PATCH v3] HID: cp2112: Add parameter validation to data length
Date: Fri, 26 Sep 2025 20:28:11 +0530
Message-ID: <20250926145811.273174-1-deepak.sharma.472935@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Syzkaller reported a stack OOB access in cp2112_write_req caused by lack
of parameter validation for the user input in I2C SMBUS ioctl in cp2112
driver

Add the parameter validation for the data->block[0] to be bounded by
I2C_SMBUS_BLOCK_MAX + the additional compatibility padding

Reported-by: syzbot+7617e19c8a59edfbd879@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=7617e19c8a59edfbd879
Tested-by: syzbot+7617e19c8a59edfbd879@syzkaller.appspotmail.com
Signed-off-by: Deepak Sharma <deepak.sharma.472935@gmail.com>
---
v3:
 - Fix the commit message to not include the changelog

v2:
 - Get rid of magic numbers
 - Improve the bounds check

v1:
 - Add bound checks on the input parameters at the driver

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

