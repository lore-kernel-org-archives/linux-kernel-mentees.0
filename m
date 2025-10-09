Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291B4253359
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Oct 2025 05:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759987835; cv=none; b=RExGwPO9dpN07YvKM1f+8VAAFiAsTcwxhZmOXUr/A1b7UFl3ldj4k/Kv30aWIzNjDxmqimCN99lUTSSYGlaarG9nb4VgWjGSN5x0eRpuqkKinvSLhziJdq1bHyq6KirXQwyi+LldFsDlRZpNJas5T+/modqMmzSNibw92ad9owk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759987835; c=relaxed/simple;
	bh=MWPOM5X1rJDtoAagIpIGV2JeSDedkvNxa+Z2Lzxv2gM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MJu7qBb25bTEUEcNTHGJDqxoJ6fsLotyybUc0l++UBoW6jdkNFUSX7nO7Hz8056ENff67FlVgpto5g4TeOuOxUP26nwIRQz8CJ1hNjDhUInZ8DYtmX2ahmZQk+JA1rL1hpAau9zU3RDOm/Bthz82oKvjamlKnj/x77GQEZqBQhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nLFLTkWo; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nLFLTkWo"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AEFB040BC7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Oct 2025 05:30:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NdImCsbQsHVW for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Oct 2025 05:30:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=bhanuseshukumar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E155840E65
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E155840E65
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nLFLTkWo
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	by smtp2.osuosl.org (Postfix) with ESMTPS id E155840E65
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Oct 2025 05:30:32 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-28832ad6f64so6229275ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 08 Oct 2025 22:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759987832; x=1760592632; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=66mxYYm1lwUDKT8s1UNwAUuURZhUpzHNJdGMWk83R+M=;
        b=nLFLTkWohdsIkwlHVZcQAmsn+AKf4twshg6ynf9B/1T+SYuPDkOXn0BNTYGZR2sc2p
         GAZbD6Gv1g9ELmAUzLcn0OgfepH//URDeeqlTTDHiedJbDEreGaTzaZCtZWUJpXWlQTm
         mFrfOXhNhpv5yDsNY+Jy0rxDH4vNJW6rS4UJb3R7GCnNxeK+h2MfhlXWDjkKezhPsSL9
         USSe4fPAkHLqVH/UL9xSniQll1FJ1VcXJ2wvIdEAtwmPdMRg8JivmyPTNu+yMLnGqdNC
         opo/PrSFrpvmKJeQJIT/P4IgMTkPhUwe1c0xhgLc/9XtE5k23Pa29lT3PDlVfILLOa2w
         aOZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759987832; x=1760592632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=66mxYYm1lwUDKT8s1UNwAUuURZhUpzHNJdGMWk83R+M=;
        b=c+s/0Nk5GYJDOWLSyMZNP/ezA8marMKxMEEOvczpYniqEZtXWeoMavkUeXIPBvhfl+
         dSsn7XFx3M61wS5xezcbbYpsOhTZ7nUvg4AtCUD+lvM6hCUBYkLfApX2wtShWbv/hdwV
         Vo6HGFN+7Hg+L0FlKF5GcRwVPaRcwWcgdGRIq8nmRA++po7DFPpsBm8fGGpezUQ+Sf+l
         gUvH9gLGvw0oFg4u2ecBmNu93J3yRvVE3JxoRoI4ZlZ2jlkLHbONIR4fvID81Gr5jSUT
         a+KuG0i0EfZYbWxVnfDegrH8lmAK0CpIBkz+49EgMhsmc/vOfe06nmzLI8k/m/SxGGvR
         xVLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUik/OgGcTyEKPVeXlS8T2w4r7VYOBQo5ewI72yI5NA97sFAXl9dSuvVEcU+7xX8CdyW6OW93avyvniH1ZdcfSss9cxIw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yyn7AFSpdoxrI8n6FC9LSfD+CIuHgSHhLV9LeAi/SLruuacQKoH
	21yIDcPD1gXTIzfKjws1nDjZWsokXrEb9MIX+SwzN0msb3fehUnu7ZRv
X-Gm-Gg: ASbGncvuX9KNpiI7XQ7B0u4Z12zjfQ8DyhppxGKCybmUo5wSW8Z2fIZc/cC9QCNja69
	PXTmdQZ9ZoV0DIny2rdyFy3VFX+qIajueQ7AINLOttwWC1wr8EKbEB1YjH7t1rVifIcj+PCYtFx
	ePlg/12GRRYcWcF2ikXlFT6KBMRDV/Xn50XiGfNqHxC4+MDrIK3m+mKC21VximPzB1ybtQoye+1
	oAscjR29/cVxdkfNEUqwTg7Wia1Z07OyqLKyssnuz0S4sUSBdE+5cIMjJSY5mvZ2063NTaO6hzW
	08DPD4hcIsB34PTYypvBMb2LSuES9+1rbCKJNpkfgqukEy9eozo0/SIr4Lu5RC+buPlZKTJggoo
	Gxi3Ik+Ft/5uYNJztr2hcpG53cmuHrcDU5NoMCQuZhXn6czSAUTkzfBNmsqkXcb4MZ/X4VUVBOH
	PEWAhHaA==
X-Google-Smtp-Source: AGHT+IE96/521TZFyW+4rJmoBB3kl0SaMviXP79e4HfzlRSMb+fmXr9G8IIVQlVxI8d73u5bPmUKyQ==
X-Received: by 2002:a17:903:2408:b0:28e:7fce:667e with SMTP id d9443c01a7336-2902723f51emr92430835ad.17.1759987832087;
        Wed, 08 Oct 2025 22:30:32 -0700 (PDT)
Received: from ti-am64x-sdk.. ([14.98.178.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de54c7sm15651395ad.10.2025.10.08.22.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 22:30:31 -0700 (PDT)
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
Cc: netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	bhanuseshukumar@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] net: usb: lan78xx: Fix lost EEPROM write timeout error(-ETIMEDOUT) in lan78xx_write_raw_eeprom
Date: Thu,  9 Oct 2025 11:00:09 +0530
Message-Id: <20251009053009.5427-1-bhanuseshukumar@gmail.com>
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
cc: stable@vger.kernel.org
Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
---
 Note:
 The patch is compiled and tested using EVB-LAN7800LC.
 The patch was suggested by Oleksij Rempel while reviewing a fix to a bug
 found by syzbot earlier.
 The review mail chain where this fix was suggested is given below.
 https://lore.kernel.org/all/aNzojoXK-m1Tn6Lc@pengutronix.de/

 ChangeLog:
 v1->v2:
  Added cc:stable tag as asked during v1 review.
  V1 Link : https://lore.kernel.org/all/20251004040722.82882-1-bhanuseshukumar@gmail.com/

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

