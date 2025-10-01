Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EC22EC54D
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  1 Oct 2025 13:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759324467; cv=none; b=TLoV+ttY9rEABL8AsUQQkpVnU4bd6992Qp4dKkSJkZnleo4yKC4pjY22TckhzNN5axahPKaANR5BVaI1887p2XHv4SsB+0wkudwoio8VRIOMzL1CbuAKC1iUCE/QZiKkB4PPdH3PZo6M/8yuV2yQMfZThnIUg654CUgmXNmvwFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759324467; c=relaxed/simple;
	bh=5o423ZijRvd8zuSTV5jup258SDTngq09c6GvYer2C1c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oBFpCwmgiYVn9cZvIGfFxLM2A+29/pkpWMpXUnBMKIgBSqyMS7FSpTkmuU2dbvCqzxowasJOsY3t7w8xxoL7M8x5LXtegP/iZ7B7MiMel2UDNjnKqJF5qRYCDxd9Cb9F2DVf3vAtlnXPHNChBByo2N4i4Rh6G3RdLn6Idx74W88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IADu9DkM; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IADu9DkM"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so7380996b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 01 Oct 2025 06:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759324465; x=1759929265; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QCTEJhugcYnaoj/BbhJFZS8Yru0sn+mS/h4vRBTxOWU=;
        b=IADu9DkMLMSZxyPs19ioNkK+TJaYwLCbLYDFeNozsWuhYP3LrqwiZwrgaAuzeyxwsx
         BJG6oc4UylTvMl9Ke0fXYw/asmKa2c/9oavh7q/ukkiRKjVsZIyMke67VPj9LAs9rtR7
         ooyctkRqkIoOU9FzSrudJgCTO7byOfc0Vl0kG8W6bdehH43RK9amTpk6oeXQipm7z/sK
         3Qmc8nbaUv2DMDQV2vByYZqmMmUptNP3/k4KLJk1hSNDDd43LlHVS9TRynYll4oBPNQA
         KP689n+idDL8gROUvz11tDRfqqindQ3KsxloBX7YoSRbEE36WWc/QuNwV+5hQjUFlDGR
         8Hzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759324465; x=1759929265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QCTEJhugcYnaoj/BbhJFZS8Yru0sn+mS/h4vRBTxOWU=;
        b=HjdhBiqZkADmhwBw+geamShtMd/wNFOV6bxzGg/Ou3j9aF6TKysdsn0GaJbSB4jnXj
         AAHnNt4m40E5W3djHJ1V2kOmkLHmFf/F8PRFOdE58AkssEcGmhSNRQ55I+PJJbKdhTGn
         yv0OrMxZoozIZZF/Hq79UHpD+2reDynrnnsaUfpkxD5yqL1ow5Ec62+/SJ8BuyvOTfla
         MmnTHyjLUH3Tw/ru3ljtfokoIQiJIF76sL5VBXlLh81w3CAnreGC7943MUNhaC79Zv1/
         gn/lFHTZ410jh5vrduRLbAyo1GMOs9YnQThI2+pl14sEdLFFJU+VPYDOpJe3Ws0JVEO1
         Xi5g==
X-Forwarded-Encrypted: i=1; AJvYcCW3fLPUYiGRqsRnx+Uq6Tr1JLSFvs97vdNWIOfms/4s19qxrvaE+paf/utazvhJhin3An2hCswyjVmX8B6Hrtq3Meceig==@lists.linux.dev
X-Gm-Message-State: AOJu0YyJhvIRYrzoSpz/HtzbJ3yLXUPoiJyEFs7kukCbWjOwEDuAZt4C
	q2bvNTt1ps20i7gevgWY3wdDirUYVeITRORMYyPHv8wNmoPidsSa4r/e
X-Gm-Gg: ASbGncvN9hxM+UM5u0BMppgMwanp4BtJj3FAfCyob5g6rHggz2j3AzQcdPcTNmtX+t8
	H2fA/jUqPLeA5neZ0F7eDBm3wZvtYEeuIToNMNe7abbs3KNyoip/NleUHS+oRPLfjoJ1orEnGr/
	CLsIsE78g0FIHV19dZm7Ns+EhbDwTWwZ+kgcL/szEBXQvg44BvMk0FhWhn9zVAdCeV3y6YhD+As
	LZyYgtHrdl8rIm0b8VWMkbOhdev35vCaiGUBCn75goQldLvN/mxMMOCAvzNkT4xInhL+0sd9xgE
	c66/CNXzFX4Khew03apD9wCRMElR4Arv+pZqtwewr8Wbb5SZ9tCfRqAKaHrJ9JqEplNjMEZTPXM
	L5ch3nhAZn+RFDKFwy9/4fhweBduJzdhdAgOCIvsUS5gJLuTDQd/C8ga6PGOrUGlyziRpjprCgm
	JjrXxscJjn8AbPcLCzlWVQ5MBxnB5jBo/a6CvwFOyobhor15I=
X-Google-Smtp-Source: AGHT+IEmzoGxhoPxh6/P3t6DmI1zkLDTL0S0tBdY+wi8AVFx9T7GOFm/8D8Q0FXSalhenNgGW0DD0A==
X-Received: by 2002:a05:6a00:98f:b0:781:1a9f:2abb with SMTP id d2e1a72fcca58-78af422e5admr4501627b3a.24.1759324464584;
        Wed, 01 Oct 2025 06:14:24 -0700 (PDT)
Received: from debian.domain.name ([223.185.128.16])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102b231ebsm16308139b3a.52.2025.10.01.06.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 06:14:23 -0700 (PDT)
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
	I Viswanath <viswanathiyyappan@gmail.com>
Subject: [PATCH net] net: usb: lan78xx: fix use of improperly initialized dev->chipid in lan78xx_reset
Date: Wed,  1 Oct 2025 18:44:09 +0530
Message-ID: <20251001131409.155650-1-viswanathiyyappan@gmail.com>
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

Signed-off-by: I Viswanath <viswanathiyyappan@gmail.com>
---
 
KMSAN didn't detect this issue because dev->chipid is zero
initialized from alloc_etherdev

 drivers/net/usb/lan78xx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index 1ff25f57329a..f3831ecaaec1 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -3238,10 +3238,6 @@ static int lan78xx_reset(struct lan78xx_net *dev)
 		}
 	} while (buf & HW_CFG_LRST_);
 
-	ret = lan78xx_init_mac_address(dev);
-	if (ret < 0)
-		return ret;
-
 	/* save DEVID for later usage */
 	ret = lan78xx_read_reg(dev, ID_REV, &buf);
 	if (ret < 0)
@@ -3250,6 +3246,10 @@ static int lan78xx_reset(struct lan78xx_net *dev)
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

