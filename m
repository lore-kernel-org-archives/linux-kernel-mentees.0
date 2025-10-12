Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB0E26B97D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 12 Oct 2025 11:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760269435; cv=none; b=GhDOxRinrIhmefyEWcm9o3QY+d/zhYm0r0GAtA06BMfoXVT4/QqubnVZ5yqCxzeCWtmyvyfMBSq3/Fg7Kkm403UGM7FQlrcxQkhfzP/cqlGl69H7QFAlCHMcOHzdhq+Q/XfkuckfonqncTkxLUfbJBuDgNRb7hjmYYKYX1w7I14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760269435; c=relaxed/simple;
	bh=6y/+Ym+lfn1LpRZEISDxrN4k0+KtYrti9fdNPHotsvE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=uHRntX1Wu/8S2Lc0ose6x/Cx9r1d9CS7jajqMfkS8GLNSo7aDPY6lJg7vnkH9rahpLAC2l8cMzkthLVe0JbVqToASz6edL7aR7Yj+tkhAtKwdhCwnp/3SogQdSSMVU/6BqQyf86gy7NPYqtPtu9Dmi7K5LwQ3N8+nMHczTGvufw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dj52toql; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dj52toql"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6B2181DCA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 12 Oct 2025 11:43:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5PVLUXNdaW_Q for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 12 Oct 2025 11:43:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=vnranganath.20@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4B34681DB2
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B34681DB2
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Dj52toql
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4B34681DB2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 12 Oct 2025 11:43:53 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2699ef1b4e3so6904495ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 12 Oct 2025 04:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760269432; x=1760874232; darn=lists.linuxfoundation.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=USHDG0+JmOBcx0jbr24WMthkctDA2Gayuw3MyojmYCQ=;
        b=Dj52toqlHi8ibsrYqiIf8IzNumml9bXwYrcRPHu7uNTlqtcV4QwR/pDIoqJz3ZtNuJ
         8L7tdqeS+DO3gfEgoP6EpAz24xFLTvqoQh8bCI8muGszJY9ARyPN7tN3+Df0ZEfQ/kPu
         Bg6ZRdTu008C3RNsAsoIOfW+WHWOwoJCEcpIbzb59uRrY4hcfKaYFilVJKivxlsoqTjr
         h2kZXu/jjoKIULbEkg+zXWE23MAbA16ixu28oJwA+vMsRGw5KVrFSjTJr0Kr5Xl2taqb
         MbbIllilxAIKzTpJemq88iFANAjynAE8cDbOQ2NwdnFYrkUB9lwxZGLCSykOCubWtot8
         rTYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760269432; x=1760874232;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=USHDG0+JmOBcx0jbr24WMthkctDA2Gayuw3MyojmYCQ=;
        b=UI5m++xyqv3IjP4zdzPcy2J6XnnbtxGNiVnRZgqJVKmke7LDFH0HfwWY83ttOl2Akw
         qVW/p1G0GVZFA85AgCmeCKNiafdxDilkMM/T/29oeIiaMdLAqjhzDjJTKPx/1OGDMKf3
         dlvY327Fzz2Oiktvefgp7LY2zTQhYEVdXzovlEH9JXmBvk07Y9cCIEYGCYVP7gyjWTZo
         e7muE5qIlLvWJrpdlNZCd6Cbl6XVlnbJFx2PTkyKaIucMxaQkifZg4wqri6R2Av02X0I
         5Ecaup9cEBQ2suFKm5NjNb4x2YzU6O1YFxvy8nTHC25oeVuQoYXMrTcGNsssaJ+dsdJ5
         wx4g==
X-Forwarded-Encrypted: i=1; AJvYcCXBhc5ov5UJ+Je5TdYyN7VJZsbOtFW9YDCv5Cn+FnjHd+zZLSnv3QQZq6JSNZ0hUTONkvoWlEDRnDzuyxk5oJRDDJWBaw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Ywqdl6988xpmqukQmxYmpEjiiaLIRBIkzMJeA1oR8Px2OI5JqCJ
	aG7nNA4RGVSXYypAnBiROxCIFnuUMJ/KNbj1EYSNnPHJnLyMY1wRUs08
X-Gm-Gg: ASbGncvCbcBtgDsx/4EHhCEK3zUzRt7N4ZVAuISWR+HIRK1/0ksor4/wLAFasapUB6k
	3qt8XnurRPPAavx6Wekw3YGG14qv2YZDYil48zt5DQdHAuDjSpCohaBQRjiRaLVeKrrV2kzXH+9
	Qt4rDcvZ29ia1XlM2x/zaZILmi50JQbNegcqtaVdYB2wNzvM5gdVga/jq3SgTm5gPfAqg0ES911
	ynx9H7FKkhDHzEmNZejMOAxTUH7eS7Mcq3Z6833o3aOxiyEMPQDI9a1IAHeubtrRwXqTMfInk65
	j1DkEdO+Ntd9KbfbjCtElDVRFMumjnItpFFGA8yl3iVep1Xbghrr7yKYz/Z9aV4vkxRdkTzaPuD
	e3YHyfmpojwXvz4+vWC14mo0vV02Xfh72/J5dhyW18mDgEX6zrlQWgeqLLFaC
X-Google-Smtp-Source: AGHT+IGypspxQsTm5Mkv7DMf7X8k8qJOWGtMt9Bw/674OqX23p3nDn2lBbAGZaVVMBIMGceLwJVYEQ==
X-Received: by 2002:a17:902:c40b:b0:267:b312:9cd8 with SMTP id d9443c01a7336-290273038efmr116023985ad.8.1760269432532;
        Sun, 12 Oct 2025 04:43:52 -0700 (PDT)
Received: from [127.0.1.1] ([2406:7400:98:ffd0:f64e:1796:666b:a343])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b678df2799esm6454765a12.29.2025.10.12.04.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 04:43:51 -0700 (PDT)
From: Ranganath V N <vnranganath.20@gmail.com>
Date: Sun, 12 Oct 2025 17:13:27 +0530
Subject: [PATCH] hwmon: sht3x: initialize variable 'ret' in
 update_interval_write().
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251012-my_driver_work-v1-1-9e5fe6de51f4@gmail.com>
X-B4-Tracking: v=1; b=H4sIAF6U62gC/x3M0QpAMBSA4VfRubayI2leRRJzcJLRWQ0t7265/
 C7+P4InYfLQZBGEAns+XILOM7Dr4BZSPCUDFljpQqPan34SDiT9dcim6npEtFgaMgZSdArNfP/
 DtnvfDwQrpJZgAAAA
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com, khalid@kernel.org, 
 linux-kernel-mentees@lists.linuxfoundation.org, 
 Ranganath V N <vnranganath.20@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760269428; l=1589;
 i=vnranganath.20@gmail.com; s=20250816; h=from:subject:message-id;
 bh=6y/+Ym+lfn1LpRZEISDxrN4k0+KtYrti9fdNPHotsvE=;
 b=c32/ZK7DyB+6pjgQZVueqDLfafDQshNuAblaXCyCNg+tKBhX5RvTz3FbAK5Fih8rmsxzW5UIE
 tk3EPXRTEnGAmnat/t6dYfp9H2GaW7t6k2be6+6nAhF9POM4VyLRxCT
X-Developer-Key: i=vnranganath.20@gmail.com; a=ed25519;
 pk=7mxHFYWOcIJ5Ls8etzgLkcB0M8/hxmOh8pH6Mce5Z1A=

fix for the smatch errors:
drivers/hwmon/sht3x.c:606 update_interval_write() error: uninitialized symbol 'ret'.

The warning can occur when both the data->mode and mode which is
derived from get_mode_from_update_interval() are zero.
In this case, no i2c command is sent and ret remains undefined
before reaching the coman return path.

When both data->mode and mode are zero, the device remains in
single shot mode and no configuration change is required.
In such cases, it is correct to treat the operation as successful
without issuing any i2c transfer.

To address this, initialize 'ret' to 'SHT3X_CMD_LENGTH'. this makes
the no-operation path return success while keeping the existing error
to all other paths.

This change removes the smatch errors. Tested by compiling.

Signed-off-by: Ranganath V N <vnranganath.20@gmail.com>
---
 drivers/hwmon/sht3x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
index 557ad3e7752a..4b52d57eaad8 100644
--- a/drivers/hwmon/sht3x.c
+++ b/drivers/hwmon/sht3x.c
@@ -553,7 +553,7 @@ static int update_interval_read(struct device *dev)
 static int update_interval_write(struct device *dev, int val)
 {
 	u8 mode;
-	int ret;
+	int ret = SHT3X_CMD_LENGTH;
 	const char *command;
 	struct sht3x_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;

---
base-commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a
change-id: 20251012-my_driver_work-77b22c239e99

Best regards,
-- 
Ranganath V N <vnranganath.20@gmail.com>

