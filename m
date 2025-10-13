Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31B62D73BB
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 13 Oct 2025 18:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760379451; cv=none; b=orVHAAAfRMHqRiu+XO3KrL41BeflwMcK5Xat1c9qcSqgRzVoVJBLTNR4mkd2PDV+RZHKq6z9GJOpTe7xKhyNrUrpbyTJ6lojh6b7z/P26K6zSHqbdXZCOOxGCsxt1Jcm+A2DMnCElQcA0JIFVXabtZ9Rs5J4vS0lKRGW77Z034s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760379451; c=relaxed/simple;
	bh=lTRDsCs/D5gFRcFqRPKy43626K0S1gYzb3FNCfR30zs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dzmi0PDe83Dz61DpbF2H0VrvLnZmJulh/dkAvd9aYJq5zG33rTXQAo3THqIsv/kY7+bqZKdB6EdRSMeT0LaMFzmdgv8RFg+ViEUUiSsORjBHhrCQACY1QfPLsBnY2wBdde9A4dTSnpPdv63zs2PL75T8acFsxmPFa0jj6sCR0gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VAGQuPaG; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VAGQuPaG"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-27c369f898fso62509455ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 13 Oct 2025 11:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760379449; x=1760984249; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DINigu/lDIdPD/xwaJPV5YAdp8XbvaeBDX23woL7nKQ=;
        b=VAGQuPaG/z0jDfIMnilakY2F153qqN12WFeyxSPsqHeTTZou+DDhNqHOD8haUhMWS6
         eNYOKK9GbEgU4l/g4VfXR16i19w3R+249SSSQVu1LiL0xg3WVnDy7qb+axGpBJ58Iuri
         BlanSATZntNrs1FY1l0zNOJY/eQ19YZ1N9zEhypTpzvj4XM1tPd5D0mydk7o6YcjKmmd
         1vQsOyOEmqBfQPIkn1rW01xbUiQfpG+pAQSlSSzTqz9651duIY0fFReGElFN8UEPSgyf
         SX9X9a4cr3LRQ7j3ZNVR9ZfxqaQHicCWyWyJdCSAcIbujd5FWxxwf4cn3zw+dDCSW2xr
         0Xqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760379449; x=1760984249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DINigu/lDIdPD/xwaJPV5YAdp8XbvaeBDX23woL7nKQ=;
        b=AN4BP4DbmW2vDkawySIBf5mZZR6kRyhAyYrlab23fBib+Kf34T8WvQKxSOaACzC9m4
         E+ZD4ceAn+snw8ICEsxQnFjo6uY7IsmbRHCH8V3vw0KCs6DK1fmBbOJkI9kgyNd9b+pe
         0AskGRlFN15p2Zh4s3p35hsD/0Z7C+0rOTsOOBLITSLSJoYVx98Nv990Q/bj3zpMGbKu
         8+7REnKXEvaSxDKQNeboWxQiCJxa60VNUPNet5xxrxErnXNt7PwG7CCm92qfv3PWL+up
         mPHPpj+bwX1lt+DAnrzWDR9kOW6z9FTJudy1lWltAbDocIgLONJh0vsuAUAlkKExK0hG
         ffBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUM7u+sP0CpcVZOun2F71Awrr1SJQdJpidF9loXSgi1DRVq8+g2hK97s4hRZ9xf/vBUOF1IMGFAu7MclhzinB6jmlWt3w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2RwXv7RopCaYoBHkncTQQq048WNlcmCSjpHT+UOEKsqZgLMXd
	vFnRxsRLxXweFwTB6JqrqudTywfTav0c+1zyMDFGP8nKtI3h7t8ShrdS
X-Gm-Gg: ASbGnctY4OrB473BzCa24ewIXQVCagEf1P1F9QZam/i+PgeZURzVxQxexES7faiNH90
	tj+ade9WI7I/aBVGWOiiQcgRMi109BOopqmJRmvoFpfx/K1mv18Z4U4qhqEZx+eWNcDhkEobhkH
	DTqBtMisfmYdGo+8HbTNtYmCkjiXQT1KJBJN6WGCJ+IaRpHqet1qlX753vj/oz5yq8PNPlDp5xe
	+zcmBDdE9yiaxTfFlm6WojRB9ozNxi95G0WZuxQi2yvY+AxTUARKyxXp5KID+oL53zgtMLaphq3
	WY1PcPy7TCRxsjXWo0kvYwLENT0YkpYCNFdFOFPHAYUQWqlbRISQTp3yRer8vuhK6qNgPrVv4P9
	10rPrVTWyRAJuQwnrZWzK3WpSZoREG7hefBhYnuGSOZU4tuHJ3s972COVUVOQ21bd2StxczgyJx
	8porUg6l7lK06M8UaVkxyUi+tn3jAH4ou2
X-Google-Smtp-Source: AGHT+IG7x5vmQvO6Mjl28H+yolG/h8BvghF5Ba98451r81jzZMgiuy0qWbUXeKg4Zw+kpWpfF0h6HQ==
X-Received: by 2002:a17:903:2343:b0:25c:b543:2da7 with SMTP id d9443c01a7336-290272159e7mr227818555ad.9.1760379448997;
        Mon, 13 Oct 2025 11:17:28 -0700 (PDT)
Received: from debian.domain.name ([223.185.134.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f93b71sm140182275ad.114.2025.10.13.11.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 11:17:28 -0700 (PDT)
From: I Viswanath <viswanathiyyappan@gmail.com>
To: Thangaraj.S@microchip.com,
	Rengarajan.S@microchip.com,
	UNGLinuxDriver@microchip.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	I Viswanath <viswanathiyyappan@gmail.com>
Subject: [PATCH net v2] net: usb: lan78xx: fix use of improperly initialized dev->chipid in lan78xx_reset
Date: Mon, 13 Oct 2025 23:46:48 +0530
Message-ID: <20251013181648.35153-1-viswanathiyyappan@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dev->chipid is used in lan78xx_init_mac_address before it's initialized:

lan78xx_reset() {
    lan78xx_init_mac_address()
        lan78xx_read_eeprom()
            lan78xx_read_raw_eeprom() <- dev->chipid is used here

    dev->chipid = ... <- dev->chipid is initialized correctly here
}

Reorder initialization so that dev->chipid is set before calling
lan78xx_init_mac_address().

Fixes: a0db7d10b76e ("lan78xx: Add to handle mux control per chip id")
Signed-off-by: I Viswanath <viswanathiyyappan@gmail.com>
---
v1:
Link: https://lore.kernel.org/netdev/20251001131409.155650-1-viswanathiyyappan@gmail.com/

v2:
- Add Fixes tag

 drivers/net/usb/lan78xx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index 42d35cc6b421..b4b086f86ed8 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -3247,10 +3247,6 @@ static int lan78xx_reset(struct lan78xx_net *dev)
 		}
 	} while (buf & HW_CFG_LRST_);
 
-	ret = lan78xx_init_mac_address(dev);
-	if (ret < 0)
-		return ret;
-
 	/* save DEVID for later usage */
 	ret = lan78xx_read_reg(dev, ID_REV, &buf);
 	if (ret < 0)
@@ -3259,6 +3255,10 @@ static int lan78xx_reset(struct lan78xx_net *dev)
 	dev->chipid = (buf & ID_REV_CHIP_ID_MASK_) >> 16;
 	dev->chiprev = buf & ID_REV_CHIP_REV_MASK_;
 
+	ret = lan78xx_init_mac_address(dev);
+	if (ret < 0)
+		return ret;
+
 	/* Respond to the IN token with a NAK */
 	ret = lan78xx_read_reg(dev, USB_CFG0, &buf);
 	if (ret < 0)
-- 
2.47.3

