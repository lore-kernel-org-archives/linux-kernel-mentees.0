Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C89195805
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 Aug 2024 16:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724689267; cv=none; b=qhYH0HDNOvMslPIlMni5RhnHW56dO7Fyw7pMxX91iakk58VOZsQZPL3VehdHUXpOKNt/wAmUY0lF0U6GrL1Em3BQC6X7FjgeI2FQ7BdsiBXVoZ2WLHv3werMyEFY+bGEJBv/PCIoUwT7Yjb7Gx11qolGXWLI5HliE7p17oH6eZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724689267; c=relaxed/simple;
	bh=65mwwAzTqveSbIVeRdWT+IRD9chpaIVji0wmTNJwTs4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GK+cn1snYHeCr4r7VrZkTz1Q5vcvXmQqXlCWHdoDimyZ7R5lWpcc6B5iKgJqJo5ECDqYCmLs1G01moGkCBbgt1Fy2OvWTS7Ma8OtsitjT6NNfL++6QhpP36Y3qVyKiZ+e+FLmVXZOV9vF5sG2ZVTmKnTfQcSP2LZAMTUoyKPybA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iYiV3drH; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iYiV3drH"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCBD280DB2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 Aug 2024 16:21:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 71FUWOmzv-xs for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Aug 2024 16:21:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4860:4864:20::2c; helo=mail-oa1-x2c.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4889A80D94
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4889A80D94
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iYiV3drH
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4889A80D94
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 Aug 2024 16:21:01 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-2703967b10cso3242143fac.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 Aug 2024 09:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724689260; x=1725294060; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0AslJABVo00gPblnVR8gYUn7zUqkgg9WhvvpyeH5H28=;
        b=iYiV3drHLeIY59b/l+6B4kR5r1V7KWp0dB+K0E0Q+TIFHhXtOPQZKxeW2d734M8b8v
         H0CzSViLgMxA81RD8bV0cAU34FZkNI84N25zFIsqf8Z9b87c8vq7XhbOOBZTbJkkYUX5
         38NIB1bucUdd+Fs+7FaZBgIFL2hcdtYZVtY1QTa/bKUbNXPJBf69sS7luyUiAWb1J8nx
         S0JWTAFlKIAxek257oC5Bh3AJ5tc1TO/tVL2qsceJu7pOPHoZURN38rUMZOw5rreUREW
         eZtUzqMIvp5TUnCxQrbDAivpElfvOifIG1ARmXjB4p1pvBbOasVv+0sYSppDdbhgEhMD
         Ft3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724689260; x=1725294060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0AslJABVo00gPblnVR8gYUn7zUqkgg9WhvvpyeH5H28=;
        b=Vzo0yDeUtep6z8msqfA3CFr/KgNTav2mghoLDsa5/hLFIp845ld6GJQtuAagbEp9Fa
         7tG3AVFAjMfKTxKMCR2rvYwW1ec3IhQSwPrMuVavPzUeZ57AxtxcZXbVJ4XV/lBp7PKr
         xB26g5fd7Wwp2txwK24Y0JyWsfUOTeJtQKDj9PRxoT1Dx1iqUBoZxRhRm1y6P/sJ2f/l
         eA+jl1XHgDwLonff12KjoagAlmlf3USDCudTugDB3da3mvaRrE6WXlD50iYCv9kF00H5
         K9rDfE1KMNnK7Y3FIYHgFhkNyVh5RsOjgY3/hHtpRMiPAh8f86pELdG243fmarSzMP6s
         Wj0w==
X-Forwarded-Encrypted: i=1; AJvYcCUR4oLSp9L613/l06nZwactum37iofRDrgFZJibDTNOlH4AkZXbU/IAiCdBO08gyNROEfw0nLde/ui2uADZGF3ZyvoDcA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxSvkc4R9AZk7JAb1Ha3RzB5cee1iZRDm9Smmz6El5J5Wa5RCYs
	c847CUyS8FvNLlZrp8Zo9xr17of+dkNyl9VmqKju4v0CeHbJsf4N
X-Google-Smtp-Source: AGHT+IHmikhzl0qq17V3DT9TnvIBp3tik8f35GSxDiprCSyIs8GKTKsExxUf5g1DWQ+fSIxEePrWcg==
X-Received: by 2002:a05:6870:2250:b0:261:142:7b95 with SMTP id 586e51a60fabf-273e654b961mr11669552fac.25.1724689260094;
        Mon, 26 Aug 2024 09:21:00 -0700 (PDT)
Received: from embed-PC.. ([106.222.235.177])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9acdb54asm7830742a12.42.2024.08.26.09.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 09:20:59 -0700 (PDT)
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: agx@sigxcpu.org,
	kernel@puri.sm,
	neil.armstrong@linaro.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	daniel@ffwll.ch
Cc: quic_jesszhan@quicinc.com,
	skhan@linuxfoundation.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel: mantix: Transition to multi-context write sequence
Date: Mon, 26 Aug 2024 21:33:28 +0530
Message-Id: <20240826160328.12685-1-abhishektamboli9@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace deprecated 'mipi_dsi_generic_write_seq()' macro
to 'mipi_dsi_generic_write_seq_multi()' macro in mantix_init_sequence
function.

Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
---
 .../gpu/drm/panel/panel-mantix-mlaf057we51.c  | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
index ea4a6bf6d35b..f276c65cc9bb 100644
--- a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
+++ b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
@@ -49,22 +49,25 @@ static int mantix_init_sequence(struct mantix *ctx)
 {
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
 	struct device *dev = ctx->dev;
+	struct mipi_dsi_multi_context dsi_ctx = {
+		.dsi = dsi
+	};

 	/*
 	 * Init sequence was supplied by the panel vendor.
 	 */
-	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A);

-	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_INT_CANCEL, 0x03);
-	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A, 0x03);
-	mipi_dsi_generic_write_seq(dsi, 0x80, 0xA9, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MANTIX_CMD_INT_CANCEL, 0x03);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A, 0x03);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x80, 0xA9, 0x00);

-	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A, 0x09);
-	mipi_dsi_generic_write_seq(dsi, 0x80, 0x64, 0x00, 0x64, 0x00, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A, 0x09);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x80, 0x64, 0x00, 0x64, 0x00, 0x00);
 	msleep(20);

-	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_SPI_FINISH, 0xA5);
-	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x00, 0x2F);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MANTIX_CMD_SPI_FINISH, 0xA5);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x00, 0x2F);
 	msleep(20);

 	dev_dbg(dev, "Panel init sequence done\n");
--
2.34.1

