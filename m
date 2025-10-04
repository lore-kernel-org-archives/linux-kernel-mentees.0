Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CBE20E702
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  4 Oct 2025 04:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759550858; cv=none; b=boCyLpHU8dtTSFI/wOCvFLd5VrGESnnMj11Q0FRCEV5FGGgNbW2SaMM8DDx6VuOfVbmRCeuFaleAoIH6NmwvYtiWEgglRUsbVs5Fbm/iL1GhutZ4WACjz2gOEd3D6X/2ENFotKnQGMjrOWSXT5Yy9sRRcJRoiOKGOh1w9UZBR+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759550858; c=relaxed/simple;
	bh=HYJNFwgeKdoDfqPB7ktfqmxusFy0EZVeLUF1A0YhbNM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fzY2fq7zm8rltZMABGi8PXCsV1NRLvBEo6dlyilsueQYuwCXGSK2lAVawVLyCbXboMdjTTinx5f+x86rpxqyO7JtX3doNTO50rbpJjPD3zDEK5Z81S1bq0FC56jfAjI8zDBZHaTesYariFDxWZzKSh445YSSCI/UumN6pULEKug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sd7u56iy; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sd7u56iy"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E827C403C0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  4 Oct 2025 04:07:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o3TNYO9XCZDr for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  4 Oct 2025 04:07:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=bhanuseshukumar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C64C140919
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C64C140919
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Sd7u56iy
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C64C140919
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  4 Oct 2025 04:07:35 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-28e7cd34047so27629285ad.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 03 Oct 2025 21:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759550855; x=1760155655; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Ab/aeZgm1Ct/wesU1VWgrWdl3a/KDYSwn/hRS2/Blo=;
        b=Sd7u56iyWYnnwWKEynj3G2iYMsHxOTK6CdC5mBzsm8lp+/JFolyJXlpyigm9cYl5iN
         8ac4qn8gc6w2BBS09c9yANEiHV5C4Ylk9zuoKPKc3Dx8nl9WFP2vaeQYUlo6hQB08lrq
         m7bAsdoiyljqbx+T2nO7v+s0ih9QhrMFvfjOMrg2BwhCqsvRYDjD6LLYDiMw0Tk5SgxA
         JimF8sLOkL4qSU8itJ2AYgQXNA2REZ/YD/xhdJZSRZ6Ne6IPMb0qJ3Ha+C78NudiqAPs
         mDUV2d6dk7BTP92bhYHUYqiODNfGsSEvgYBcQx9o4vOmBRyCv4gsTvPeiWq7kevzRlHN
         QiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759550855; x=1760155655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Ab/aeZgm1Ct/wesU1VWgrWdl3a/KDYSwn/hRS2/Blo=;
        b=Kc1Mw678QNH99WYuHenN/Mk5hIuR1SHB+ueQa8nGPWncUvSY6YZZyxIc0M3vwmaIPA
         LpWI6YC5j3sZ0VFrN5GUISf4t+BgiUDVCRr1fsg4CKBF9Bmxhyknq2zWgNtNDFGGD2el
         IuPLABsvG8nk0XrX6arfMO3F9J61D6aSBOhrYiI9M9HMY9W+cU5YBzO2ogxpznz2A8fa
         FJvWUOLGfkjOvjo87sCFCmbUY/MLctwlA0VQFDND4DbdmwZF4e+7J1M0rz9UFfR2tugb
         jvmuo2s3WYIaFvzP8QKsJtU5s0uF3MpjF23Sj7rHAGzrxw4W6Py1Pd9qYm7iBOX47Pby
         JjyQ==
X-Forwarded-Encrypted: i=1; AJvYcCU91rOZ2Rk4rwNpFr8wZXjc0+KHF/1pm+StuLvIvpqZ2TW/DhH2drX3lEsCDlocwbMhGwMsR6at5bE3ksxU+qlFKWaLXg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwMOXTNsB/5652owFxpMOiKg2AoJ3avrllUiKygX6ukseY68INR
	qqZr1hcblSJEQordZ1OXknhzm87pgDc5ABhyCHQlA+uut9Ya2JYW/YWz
X-Gm-Gg: ASbGnctgNIuT+f2qDhqVUmd3Ac7q0M8vJVzwLnm2Ft2OVorFhGwYxxg3Ub7IL5u8i4K
	Rs1+nNrIwAY+BsS88P8Aq1c6kRA0WAbESXzWAQYV58hXs6VWkcdmkynPEPNUBTP6rr0R3JkM1cG
	1AhUNvTFu5azn2XbgqrPhAUlerHuJQ2b7f1nAM0Nnl+KiCMGpiYEK6DHkJtKeR3mgAIC5qY0Mei
	8c7KRAyaI36xnq+rWFSP4yhvvOrBtFmmlE0GZikP1Sr2wwJmksT2KjK5ZxEbRfQ9sqvtV7wUDie
	viTIAEF7Un32tOK9wds21gEvUVGPdYuiDqIQ5aToe2o4F0NrMvf1GWkDDgow/7n75+f0yPpCRIX
	+eZ/9HC7M1Kf/hFBzAuF6TYJhHV+5W/RaFsUswv5L4iqDiEH3rBjhEuVBQfTnmiE1t5u9eU6qQy
	A=
X-Google-Smtp-Source: AGHT+IGTlstly6wpNIIUzXdJcqg26KC4+gE2hmAVdLheWI6xhK/cVtI6EOnrc7NPCTVjju8lAhEuEg==
X-Received: by 2002:a17:903:acd:b0:27b:defc:802d with SMTP id d9443c01a7336-28e9a5f7158mr78158925ad.28.1759550854915;
        Fri, 03 Oct 2025 21:07:34 -0700 (PDT)
Received: from ti-am64x-sdk.. ([157.50.90.152])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a4f15857sm5876142a91.1.2025.10.03.21.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 21:07:34 -0700 (PDT)
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
To: Thangaraj Samynathan <Thangaraj.S@microchip.com>,
	Rengarajan Sundararajan <Rengarajan.S@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Cc: khalid@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	bhanuseshukumar@gmail.com,
	netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] net: usb: lan78xx: Fix lost EEPROM write timeout error(-ETIMEDOUT) in lan78xx_write_raw_eeprom
Date: Sat,  4 Oct 2025 09:37:22 +0530
Message-Id: <20251004040722.82882-1-bhanuseshukumar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function lan78xx_write_raw_eeprom failed to properly propagate EEPROM
write timeout errors (-ETIMEDOUT). In the timeout  fallthrough path, it first
attempted to restore the pin configuration for LED outputs and then
returned only the status of that restore operation, discarding the
original timeout error saved in ret.

As a result, callers could mistakenly treat EEPROM write operation as
successful even though the EEPROM write had actually timed out with no
or partial data write.

To fix this, handle errors in restoring the LED pin configuration separately.
If the restore succeeds, return any prior EEPROM write timeout error saved
in ret to the caller.

Suggested-by: Oleksij Rempel <o.rempel@pengutronix.de>
Fixes: 8b1b2ca83b20 ("net: usb: lan78xx: Improve error handling in EEPROM and OTP operations")
Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
---
 Note:
 The patch is compiled and tested.
 The patch was suggested by Oleksij Rempel while reviewing a fix to a bug
 found by syzbot earlier.
 The review mail chain where this fix was suggested is given below.
 https://lore.kernel.org/all/aNzojoXK-m1Tn6Lc@pengutronix.de/

 drivers/net/usb/lan78xx.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index d75502ebbc0d..5ccbe6ae2ebe 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -1174,10 +1174,13 @@ static int lan78xx_write_raw_eeprom(struct lan78xx_net *dev, u32 offset,
 	}
 
 write_raw_eeprom_done:
-	if (dev->chipid == ID_REV_CHIP_ID_7800_)
-		return lan78xx_write_reg(dev, HW_CFG, saved);
-
-	return 0;
+	if (dev->chipid == ID_REV_CHIP_ID_7800_) {
+		int rc = lan78xx_write_reg(dev, HW_CFG, saved);
+		/* If USB fails, there is nothing to do */
+		if (rc < 0)
+			return rc;
+	}
+	return ret;
 }
 
 static int lan78xx_read_raw_otp(struct lan78xx_net *dev, u32 offset,
-- 
2.34.1

