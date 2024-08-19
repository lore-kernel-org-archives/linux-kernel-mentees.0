Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A3016132E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 19 Aug 2024 17:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724089959; cv=none; b=n7RJ33QhRLW90WfnPVjD5qpf57Cjda7+f4KIIGMMCL5q1YYuvo2Hk1uk0MBWrPPlMWi66M9pxGZ7jTJGzaWp5xHwUIrjSOPQm8pIP14MFvcHGSBPo1DfhNp1EWEcNKno98TKqMBg9S66CVaCFEy9PzW4F6h/9ZavnDabZRAIUOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724089959; c=relaxed/simple;
	bh=y1QwZTuvE2ZkvmNKtJwqxK9L/MdUdDFAHSOWf/9ogNQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KpJHPTW1VoKW+WchWqlDINCQOxmHu6j1Rvvlxilz1Y2+jbHBvBcxgmbbXuB3IalQW79NS+BocaFp6lCT8uZ9ivARh8/eB0a1EXzOkWgRxU+I1+ExIAsY4I2JXyjjM3seVNXlt3BPfUpnA/RkBWLy1AxfmWahMTHgM7wewclZIxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BJ84t375; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BJ84t375"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 533D46060B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 19 Aug 2024 17:52:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KkHEgidGSz_S for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Aug 2024 17:52:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8E2C560600
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E2C560600
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BJ84t375
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 8E2C560600
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 19 Aug 2024 17:52:37 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2d439583573so870880a91.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 19 Aug 2024 10:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724089957; x=1724694757; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vrl19mqws/+cluViI8m9rcTcYnyGlPjI1zYV7NRxDIE=;
        b=BJ84t375BvQMe2aNLwy1+rkgqDKaTrFQrXoRR/GYzzo9JkUe6gOfp3equrEpcYiKVD
         EoaV9Ns0PIt3anZnD6bhTCnX5AxdvClwa+9dq311/WzNV38hyahoaVnoBQiZQgbCSSLZ
         3KqCUHsesuvcNqBrFC+7ARI6uMcdnHYR9pDGE2j4H0ipIfcHgkCyqPf5q+JNsSYpvXVL
         usGAboDyQ7pqz2OTWV4R6zsrevj9kAycwedhdrn3RuMDodBwhfvwzj60hBMCBjiClW4o
         vq10RIC03YeKusykNNDbPrj8Cz1mUAVdrkUKlrklmlutzvTHd42Y1DFScGIhB7IX51mr
         gBvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724089957; x=1724694757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vrl19mqws/+cluViI8m9rcTcYnyGlPjI1zYV7NRxDIE=;
        b=SxItNF1fjWdOEqEKTk3WMM61OrQtL2jNrPofi7nBMP8ntZknG1T0L2AgX6dLt2/AZk
         IIZQ//wQaBulvsjyzXjT2Vy1ZNrdDIpxnnPX9sf0YXaqwzmQ6uf0LVLK9Kx/gUobPnCc
         mAZ9swkeJfn0ABhgWH3+bqv/ZJx4qTVjR1dH+10/fEzf14ZUQlTvzbPfg/WO9uHB2v6K
         hAVCuzW4apujUtERA2/G9kgjxitEtWZ151SlnNgSXly0rdEjmnJybozF86PgLAv2rsB4
         jvGSMfHAQdX8BVea4GpFU6tRzdJBRJkm4hD1KoSWzs4Vub9DTFeCEa2C1Fhs3vHWgkkf
         jIBA==
X-Forwarded-Encrypted: i=1; AJvYcCVQxblXgDDeiLZpw5Z3EPC846p0Q2thJuECl6pLanIFnA5sDuFNBcFRBbiXq7bMytvJAN3Y2oFLFNtcZ1J8D7BFiFbsOtCtMKZz1eSAs7HRPIbBIuIBmRcs5NDFgRdl
X-Gm-Message-State: AOJu0Yyno6j/UZ2BI1aXqjEAXpp8hlDpwGUGkFFbISx3o99cTVE2U/TO
	iC6ixJLhMvH2oVqSrsennDxHa8VLK56iEmu2pIGeB6YUBaZihFZA
X-Google-Smtp-Source: AGHT+IHvY5FsJmcFyBLd68H463HEg+9AYFBSgdZgFa0Uo2yp0Vuaagu34O0T61d8e5QdpKKdaRHXNQ==
X-Received: by 2002:a17:90b:234f:b0:2cf:28c1:4cc9 with SMTP id 98e67ed59e1d1-2d3dfc2ae5bmr10731210a91.3.1724089956692;
        Mon, 19 Aug 2024 10:52:36 -0700 (PDT)
Received: from embed-PC.. ([106.222.231.54])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d3e317527csm7538297a91.26.2024.08.19.10.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 10:52:35 -0700 (PDT)
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
Subject: [PATCH v2] drm/panel: ili9341: Add comments for registers in ili9341_config()
Date: Mon, 19 Aug 2024 23:21:22 +0530
Message-Id: <20240819175122.33176-1-abhishektamboli9@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add detail comments for registers definitions in struct ili9341_config().
Replace TODO with comment for each registers.

Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
---
Changes in v2:
- Rephrased the commit message.

 drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
index 775d5d5e828c..1fbc5d433d75 100644
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
+	/* power_seq: Power on sequence control (EDh) */
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

