Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A08818785F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 12 Aug 2024 17:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723482696; cv=none; b=eC20JDm+ScU0L6fouP1uKfnDXKZg33GefPbpSlEebDX8898KTGBCBcC5lRhzFwpAQk3MicmbrLMY0B+Whn9JIqI6s6XLoyTlYiU7+pvg5harqenhkiNI8RB6m8JC2m7siQjGtUrKb/cKo3A+YZrf67oZtY/PRZDz1H8XatSLICA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723482696; c=relaxed/simple;
	bh=P1zWlqma/MYjqN1eJ3463pbdO62vV2dvVfq2ZsWRxOg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UcEa/EVPXVY2XXZKladXQEv29MnbzJ548SWneEPmtQbD7F1FESRCakVt4bwnIENOQaIvrY8bYF+bOmY0HlerMFnk11LByvKXdoNPZ28xFaDtL8njshOEDelpKWk0p4AqrlKy3Sqb8pTRM2snxvbygCMsMYDiu+zSKnl4YsGjxuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EfbSZSLC; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EfbSZSLC"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D64F640602
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 12 Aug 2024 17:11:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t9fsKFofDeX9 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Aug 2024 17:11:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E18C7400B9
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E18C7400B9
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EfbSZSLC
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	by smtp2.osuosl.org (Postfix) with ESMTPS id E18C7400B9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 12 Aug 2024 17:11:33 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1fc5549788eso41753895ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 12 Aug 2024 10:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723482693; x=1724087493; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JLVMznJSLt/JlEkp0OXnrYKaDgBuNrpLyNsFl4Y6DAA=;
        b=EfbSZSLC5Z+xP4PHzAiQ02fzegvF3MXq+klQgtBBxiuKO0o+PphJwI0/Ns/WL65dbj
         xzFOeMvmerVfnr8GHGzebxW8Ot50R6xk7M+VCRggtUXuvqnD5rGIPAuiUKiKbHBcRW6A
         HlRDQwNO6eFlhlMK7MvCUdSImoBm2Vj9D4UO6L9IlrvoJ3TQ+Eqx+7HNUdNxhTS66TYy
         /4MNZpk02jFYXzbdUYgcy41or8FY11pLFdJv2l8z7M9f4wDW39hOeKoN3iQrK2xJ3rnM
         97Ftv5qdta/Ebxmsfa29ldjDTE+kYUBfdzH2RDiFz6SCNMNqBB9NN/+1ZEJVZh4r3I5Y
         rH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723482693; x=1724087493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JLVMznJSLt/JlEkp0OXnrYKaDgBuNrpLyNsFl4Y6DAA=;
        b=IP9JNccLXchxbunTU8yxrmnmvHFgJZvWZoFTsxr1b9vQzATOv8plxDjAtXDzAxIALJ
         fQjXTFPt7eJKylmIM89L+gAzLoIPmXvJkIT4J8XL8jgsmGwafSKCfa+AqJZyk24EIpQe
         +AfWR/gxeD/aMAxgIWGYoaN+WK5Qy4+JsTyidJ1z7+xlVfzqWvUPoccq+RiLPOspIiXT
         Cj1CwsErZW1n9UZ8GWKSi5Tps1Z3d/mx8mw4fvWBrjACcZWr3WFpCmdmBSGaD7ABq3HC
         N472p1ObA8o5MNoiDK8ARD/CcQBOG5TV7y5jeEl9npiX4PgC/rfZn4K3wu/bc0TDZKSu
         dNYg==
X-Forwarded-Encrypted: i=1; AJvYcCURUjqwyuBf3OQUE22seTwT33Tfkx7m8itIRxTYPkxie4SPaHMS+IAWMzJ+7koujYi+J3nnAZLAgPZzco2CIJIOQ7zEKQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyTWQM/WJaS6qi/3DGMJa+V3YYENoe8QHXiPcOIQG7gWMsIXNIx
	PyuYVy/0ypx0m0QEfzqzJDtFibic9VvX34MmgjlZ1cFGUGGEPgJA
X-Google-Smtp-Source: AGHT+IELEK6p5g611Ie65ft5OPx5Mcq5RXC0yVwYjMfCBbR99xO2ydlSWcoM5PsEkzp0Bznrw0ZmbQ==
X-Received: by 2002:a17:902:ec86:b0:1fb:779e:4fd0 with SMTP id d9443c01a7336-201ca1a246dmr9679275ad.24.1723482692871;
        Mon, 12 Aug 2024 10:11:32 -0700 (PDT)
Received: from embed-PC.. ([122.177.118.36])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-200bbb3a270sm40264765ad.279.2024.08.12.10.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 10:11:32 -0700 (PDT)
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: neil.armstrong@linaro.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	daniel@ffwll.ch
Cc: quic_jesszhan@quicinc.com,
	dri-devel@lists.freedesktop.org,
	skhan@linuxfoundation.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel: ili9341: Add comments for ILI9341 register
Date: Mon, 12 Aug 2024 22:40:19 +0530
Message-Id: <20240812171019.561321-1-abhishektamboli9@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TODO : Add missing comments for ILI9341 register definition.

Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
index 775d5d5e828c..cba6a6952568 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
@@ -121,19 +121,19 @@ struct ili9341_config {
 	const struct drm_display_mode mode;
 	/* ca: TODO: need comments for this register */
 	u8 ca[ILI9341_CA_LEN];
-	/* power_b: TODO: need comments for this register */
+	/* power_b: Power control B (CFh) */
 	u8 power_b[ILI9341_POWER_B_LEN];
-	/* power_seq: TODO: need comments for this register */
+	/* pdtcaower_seq: Power on sequence control (EDh) */
 	u8 power_seq[ILI9341_POWER_SEQ_LEN];
-	/* dtca: TODO: need comments for this register */
+	/* dtca: Driver timing control A (E8h) */
 	u8 dtca[ILI9341_DTCA_LEN];
-	/* dtcb: TODO: need comments for this register */
+	/* dtcb: Driver timing control B (EAh) */
 	u8 dtcb[ILI9341_DTCB_LEN];
-	/* power_a: TODO: need comments for this register */
+	/* power_a: Power control A (CBh) */
 	u8 power_a[ILI9341_POWER_A_LEN];
 	/* frc: Frame Rate Control (In Normal Mode/Full Colors) (B1h) */
 	u8 frc[ILI9341_FRC_LEN];
-	/* prc: TODO: need comments for this register */
+	/* prc: Pump ratio control (F7h) */
 	u8 prc;
 	/* dfc_1: B6h DISCTRL (Display Function Control) */
 	u8 dfc_1[ILI9341_DFC_1_LEN];
@@ -147,7 +147,7 @@ struct ili9341_config {
 	u8 vcom_2;
 	/* address_mode: Memory Access Control (36h) */
 	u8 address_mode;
-	/* g3amma_en: TODO: need comments for this register */
+	/* g3amma_en: Enable 3G (F2h) */
 	u8 g3amma_en;
 	/* rgb_interface: RGB Interface Signal Control (B0h) */
 	u8 rgb_interface;
--
2.34.1

