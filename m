Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086B43DA5A9
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  9 Apr 2026 13:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775742717; cv=none; b=b13arUMGWTVsRq7bjxpIhnPilcOw+ZPeSonzN9cTyqmwgA4T26WV5dHB0xdEsvTUA7rzdDSRg8o+n5LBw6ECNWBylpB55JLC700ARSnHyWQM9uG9y1cFVGSmQovjMKL4yfCV37Rl2NgX+Xiowci/awOhPP1g2HKcM3vl2967Q/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775742717; c=relaxed/simple;
	bh=FRKDWcaI2dd+q/YHsz5EPwK/dwR9fegXhSXr8oRgp+4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B6gr8Y19T+k6G9aZptbe56yZJIHw6b7K8mDZDTXqOeiKsSZWyOC6EVchEXnBP3lSciiloIAWVgePydm1g1mFrDgzrejB71tUSmxhwXXaeL6BUY4dlVT7XSTV3BgrIGfcIRXSltokTcNWfH/EyIH9ddfs/92NOSvWAz64fXmRooY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OlMWkqT8; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OlMWkqT8"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2b0ba3bfe16so6378575ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 09 Apr 2026 06:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775742710; x=1776347510; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lqVqgMnpwts9PCufMDBF0YteLxaKZEFLyzQXe30weDc=;
        b=OlMWkqT8wzo9uJAWWlV3LHFew4u+wrE9VcdWrnOotxw2no8jA7OmG4AG2ntQ65B3vy
         7mpf1THZpJTaHwVkRxfLgzXHqbh2WqkPQMGr3h6PLE8gYvcA9QFRr8dZZeMiyNSUQfHV
         bG1OiM66QNybjCFMJQfqCZiwcr0jcpRBFVZskiT9a+e8+SfbdfNoz3Us1gH5aznrmlzf
         cD6VzvtHqEKJSgo/Iiwx/J6TQgazJGW+vK85Rr3VYJgoPXeEvr7GJuXdQO4/4vef1hVV
         p2aetOPRtkS4w85FfBADUDchHu3HrHM2yeRhCws09PPTHJtGBSO20MfxpgLDYTC+MUd1
         t6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775742710; x=1776347510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lqVqgMnpwts9PCufMDBF0YteLxaKZEFLyzQXe30weDc=;
        b=OONdNyyERxqkC1baCe+DWJ7fcHkG2E5MSUFjPrU+xdj4SdPoCtInqMhZA2ktYhZU8g
         f3wkYcQquYFL9BPUH27dOdHz6UHz08WMYY23pIr8NeSmkrBZdFKdW1uMIOrSDJotMaPG
         qY6sVpR5+8aJamobdi8I+ok5cD+goUof07D4hBtQ42Vmk8aDh640S6agU/j2NFlSM28O
         Osa6Zu+1pxIctg/seZi6MTsdr+1gOQ0t0vCoaG1jApaRBbwv+xvZNwPgIomhkAkuJ3F7
         E3UdoCZn3FELZuVmCVjU2WkbvzRl+NIweGI/SWeMI6s8I5XsfOOVW8RoqEaGJIbeCHQI
         xvBw==
X-Forwarded-Encrypted: i=1; AJvYcCXjl4gjhid81Qk0xMaYAcLnQY7s0Y7YEbGm1DOmsBHEK06quCNQrSBQvq5MlhoefPCaEPecCKz3krR9gO4G614zW4y+tQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwBOtsAT78ASYcjmkA76dMZzfc8NbGnGKT4kxE2JJQPkrjq6CDv
	GmQTzPXk9mXzEV9PpR8o3OaQEWtLaYXvZhZ3Op7ES6t6ihY4BV69jQqg
X-Gm-Gg: AeBDietq6IEZHoC3ArCR8c/XB8VcQD9jdfuKrdhDeZawHgUk3r3H5DHjITzQ/t4qM4b
	mNJPhFqcnuORT4BycIJ4LhKIxO1NWECQpEUIci4KPSY5XdQpCesTWQ9kscchfs7uEMmvF4qxsho
	59Ctopomx8CwcvQ8ae8QciDnM0dgX+u0zUhDxSF/hmAQR084gt9P6LkXsXtKw/8X1nS6Qo7+3/6
	xXGMruY8koICnuuA3Vy1rF8ePX37NDk0l256QO1FEUw92kkfHaQzNLnbp+SMuGHkJj3VQwlq/YY
	chj9Tn85Q7blqOCi9DKBvr4bnrC66ANBPM2DXBUzuU9+g2Y8sC4fKNdHpu/fiW/2hCoujV4qEOB
	U3QmwJeC5VujYaeAb4KebiInSMg0eX3AVTpEx5XNJhfdUVaBPh1mizU/z8cQXi2NSKqnplqWrZ8
	/nEuNI9HgHIKFkdZW1NCk0aNQC/F8tEE+xoialemuJU1sWhAx8MTI=
X-Received: by 2002:a17:902:b18f:b0:2b2:4f43:b49a with SMTP id d9443c01a7336-2b2c736e506mr23268085ad.22.1775742710472;
        Thu, 09 Apr 2026 06:51:50 -0700 (PDT)
Received: from localhost.localdomain ([111.125.237.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478945asm315288855ad.28.2026.04.09.06.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 06:51:50 -0700 (PDT)
From: Prithvi Tambewagh <activprithvi@gmail.com>
To: gregkh@linuxfoundation.org,
	abrahamadekunle50@gmail.com,
	b9788213@gmail.com,
	straube.linux@gmail.com,
	tmimiharoen@gmail.com,
	filippo.muschera@gmail.com,
	ethantidmore06@gmail.com,
	andriy.shevchenko@linux.intel.com,
	rayfraytech@gmail.com,
	david@cardinalsystem.net,
	weibu@redadmin.org,
	dharanitharan725@gmail.com,
	ignacio.pena87@gmail.com,
	dan.carpenter@linaro.org,
	karanja99erick@gmail.com,
	luka.gejak@linux.dev,
	khushalchitturi@gmail.com,
	suunj1331@gmail.com,
	s9430939@naver.com,
	nikolayof23@gmail.com,
	bryant.boatright@proton.me,
	ysinghcin@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Prithvi Tambewagh <activprithvi@gmail.com>
Subject: [PATCH v4 5/5] staging: rtl8723bs: remove duplicate rate checks in PHY_GetTxPowerIndexBase()
Date: Thu,  9 Apr 2026 19:20:26 +0530
Message-Id: <20260409135026.137904-6-activprithvi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260409135026.137904-1-activprithvi@gmail.com>
References: <20260409135026.137904-1-activprithvi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code previously checked (Rate >= MGN_MCS0 && Rate <= MGN_MCS7)
condition twice - once for the (BandWidth == CHANNEL_WIDTH_20) check and
once for the (BandWidth == CHANNEL_WIDTH_40) check. Fix if statement
formatting to move that if check as an outer if check to improve code
formatting.

Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index 2746da0a9846..45dbe1782bae 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -473,11 +473,10 @@ u8 PHY_GetTxPowerIndexBase(
 	if ((Rate >= MGN_6M && Rate <= MGN_54M) && !IS_CCK_RATE(Rate))
 		txPower += pHalData->OFDM_24G_Diff[RFPath][TX_1S];
 
-	if (BandWidth == CHANNEL_WIDTH_20) { /*  BW20-1S, BW20-2S */
-		if (MGN_MCS0 <= Rate && Rate <= MGN_MCS7)
+	if (Rate >= MGN_MCS0 && Rate <= MGN_MCS7) {
+		if (BandWidth == CHANNEL_WIDTH_20) /*  BW20-1S, BW20-2S */
 			txPower += pHalData->BW20_24G_Diff[RFPath][TX_1S];
-	} else if (BandWidth == CHANNEL_WIDTH_40) { /*  BW40-1S, BW40-2S */
-		if (MGN_MCS0 <= Rate && Rate <= MGN_MCS7)
+		else if (BandWidth == CHANNEL_WIDTH_40) /*  BW40-1S, BW40-2S */
 			txPower += pHalData->BW40_24G_Diff[RFPath][TX_1S];
 	}
 
-- 
2.34.1

