Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263611CC14E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 27 Aug 2024 15:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724772399; cv=none; b=gH2n2xQjOFD5Z9RIVJr224XReXC01eDxg2/hdBXvaxUjB6PKp8O6moE68hXTZXZpDGRteu6yyujRmtD600XYb6aokSpZpm4khY4WU4dtXsvqcoWjZCtsGxsVp9GzeiWzTvbU8oHz9IKoC7C23sD0ZQci0toT+8IK9Y2w9WTx44M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724772399; c=relaxed/simple;
	bh=Y4d2sk2iyKmcRy6LpWzCZ0z8rHGcMIyRPr860S9y8UY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=C1JiwU/DS+qS5UcxfL+KkUBZQ9hSyoJKjZqKhBODO0r2EBkjWpK4WZVIMuh1mi6oWNpDkrpY4H5LkwzEQ+Enm/EyPmRUHqxGydCEhylxL/upS0KMOxQftqLEzKxJ2a0HVrHKmOStBFeNQPzcK0Dn0SZxAYypFa0MMuvII6sHt8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JVooRPRZ; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JVooRPRZ"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA37C4009A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 27 Aug 2024 15:26:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TgpkKVbhoCGE for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Aug 2024 15:26:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 07F544006A
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07F544006A
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JVooRPRZ
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 07F544006A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 27 Aug 2024 15:26:35 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-7163489149eso3440906a12.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 27 Aug 2024 08:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724772395; x=1725377195; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hYlQtcQmfKln1ihXfkWiLgtxMPMDmfCOW/C2P4hL6ts=;
        b=JVooRPRZdyq4E6qhnwbiikW6XD1AxXk3v4Ton96/0xXajuBp58eV1kF7sqsvCvKdq1
         oW6pU3Hv2PqIhovS5BdgkruoeCIJkm/+rJTSQy8yCxpblTeT0Z/jiwzzj6xhEthDHAHu
         lRYOCeoGK0w9/tVJBdNKkCisc1KXs20yL/bLV3ChkbjwrrIDunnNWkEKFaABLgd50tpY
         wgDIx1F3CGfnM4PbthyLrjSCGACYwafJfqGhKA74jzyhsszo+GXnUXsQPtpAWzQPTw5d
         DWGrFlzIS7OOmScLD2VDEmDtuEwnrapL8Q/KfyGhAgAInb06YoE0mh1POlXhKydJiueA
         6H0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724772395; x=1725377195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hYlQtcQmfKln1ihXfkWiLgtxMPMDmfCOW/C2P4hL6ts=;
        b=Y2vuuLEl1cGgUacGW6rCWfQeExZdQeClr5H51QCSKkQsh/rxd6GBmLLh0kphpj91Pw
         O8ph3u1FjxBpyiSjOmwp9Gw5geb1KmIEBCdqHp5i4F/IQyTbKKXCBjlhR12Nx8M8x3Zz
         aiDVPM+ytk80Z7bOpuOlTOtmjkFZ1vmneOz98/FffEK3myCx2k948KKmQ79isjBEiSp1
         kODvLyqpVSQg8OZqeHDA6RRGdJYKBsRC61RxmbZGbO+1Rc9BIZw0ff5t1TeFl3L91khH
         IT5gRT9Pp49vgBcJV9cbSFrde8Q+C7Zn8NueBAylAtxZsp7Z2c/MBcXSvWbgsVYg6S3N
         N71w==
X-Forwarded-Encrypted: i=1; AJvYcCWPAjcoESGBMcz1dZuSaR24mu/lANzEJK7wsB5ntT61iN1rtBcjMCLxNvMxH5D3aklwNWCk3kzem3LezJJCGdrqK8C/Kw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxJLzrpjFGsBmsREEI8K22ksfAVTnVYUYZdE+hZ2TdXRo2ta0NE
	JB4HwT1NBaceoB05l+xylEpdnYV4ZnBG5va2CVdc8/OjYTyPB+SH
X-Google-Smtp-Source: AGHT+IF1A9V5bgQe5VU0NOhj/6T8vFiBCWBIC6CqO0cOOIwivqbOPpz7LGBVHbm1lX1cvj5+agkoxg==
X-Received: by 2002:a17:90b:4c0a:b0:2c9:754d:2cba with SMTP id 98e67ed59e1d1-2d646b9342cmr16974591a91.3.1724772394783;
        Tue, 27 Aug 2024 08:26:34 -0700 (PDT)
Received: from embed-PC.. ([106.222.235.177])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d613b1cb38sm12219612a91.50.2024.08.27.08.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 08:26:33 -0700 (PDT)
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: neil.armstrong@linaro.org,
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
Subject: [PATCH] drm/panel: nv3051d: Transition to mipi_dsi_dcs_write_seq_multi
Date: Tue, 27 Aug 2024 20:55:04 +0530
Message-Id: <20240827152504.30586-1-abhishektamboli9@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace deprecated 'mipi_dsi_dcs_write_seq()' macro
to 'mipi_dsi_dcs_write_seq_multi' macro in
panel_nv3051d_init_sequence function.

Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
---
 .../gpu/drm/panel/panel-newvision-nv3051d.c   | 367 +++++++++---------
 1 file changed, 184 insertions(+), 183 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
index 94d89ffd596b..5d115ecd5dd4 100644
--- a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
+++ b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
@@ -47,195 +47,196 @@ static inline struct panel_nv3051d *panel_to_panelnv3051d(struct drm_panel *pane
 static int panel_nv3051d_init_sequence(struct panel_nv3051d *ctx)
 {
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
+	struct mipi_dsi_multi_context dsi_ctx = {.dsi = dsi};

 	/*
 	 * Init sequence was supplied by device vendor with no
 	 * documentation.
 	 */

-	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x30);
-	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x52);
-	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0xE3, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x03, 0x40);
-	mipi_dsi_dcs_write_seq(dsi, 0x04, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x05, 0x03);
-	mipi_dsi_dcs_write_seq(dsi, 0x24, 0x12);
-	mipi_dsi_dcs_write_seq(dsi, 0x25, 0x1E);
-	mipi_dsi_dcs_write_seq(dsi, 0x26, 0x28);
-	mipi_dsi_dcs_write_seq(dsi, 0x27, 0x52);
-	mipi_dsi_dcs_write_seq(dsi, 0x28, 0x57);
-	mipi_dsi_dcs_write_seq(dsi, 0x29, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x2A, 0xDF);
-	mipi_dsi_dcs_write_seq(dsi, 0x38, 0x9C);
-	mipi_dsi_dcs_write_seq(dsi, 0x39, 0xA7);
-	mipi_dsi_dcs_write_seq(dsi, 0x3A, 0x53);
-	mipi_dsi_dcs_write_seq(dsi, 0x44, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x49, 0x3C);
-	mipi_dsi_dcs_write_seq(dsi, 0x59, 0xFE);
-	mipi_dsi_dcs_write_seq(dsi, 0x5C, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x91, 0x77);
-	mipi_dsi_dcs_write_seq(dsi, 0x92, 0x77);
-	mipi_dsi_dcs_write_seq(dsi, 0xA0, 0x55);
-	mipi_dsi_dcs_write_seq(dsi, 0xA1, 0x50);
-	mipi_dsi_dcs_write_seq(dsi, 0xA4, 0x9C);
-	mipi_dsi_dcs_write_seq(dsi, 0xA7, 0x02);
-	mipi_dsi_dcs_write_seq(dsi, 0xA8, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0xA9, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0xAA, 0xFC);
-	mipi_dsi_dcs_write_seq(dsi, 0xAB, 0x28);
-	mipi_dsi_dcs_write_seq(dsi, 0xAC, 0x06);
-	mipi_dsi_dcs_write_seq(dsi, 0xAD, 0x06);
-	mipi_dsi_dcs_write_seq(dsi, 0xAE, 0x06);
-	mipi_dsi_dcs_write_seq(dsi, 0xAF, 0x03);
-	mipi_dsi_dcs_write_seq(dsi, 0xB0, 0x08);
-	mipi_dsi_dcs_write_seq(dsi, 0xB1, 0x26);
-	mipi_dsi_dcs_write_seq(dsi, 0xB2, 0x28);
-	mipi_dsi_dcs_write_seq(dsi, 0xB3, 0x28);
-	mipi_dsi_dcs_write_seq(dsi, 0xB4, 0x33);
-	mipi_dsi_dcs_write_seq(dsi, 0xB5, 0x08);
-	mipi_dsi_dcs_write_seq(dsi, 0xB6, 0x26);
-	mipi_dsi_dcs_write_seq(dsi, 0xB7, 0x08);
-	mipi_dsi_dcs_write_seq(dsi, 0xB8, 0x26);
-	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x30);
-	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x52);
-	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x02);
-	mipi_dsi_dcs_write_seq(dsi, 0xB1, 0x0E);
-	mipi_dsi_dcs_write_seq(dsi, 0xD1, 0x0E);
-	mipi_dsi_dcs_write_seq(dsi, 0xB4, 0x29);
-	mipi_dsi_dcs_write_seq(dsi, 0xD4, 0x2B);
-	mipi_dsi_dcs_write_seq(dsi, 0xB2, 0x0C);
-	mipi_dsi_dcs_write_seq(dsi, 0xD2, 0x0A);
-	mipi_dsi_dcs_write_seq(dsi, 0xB3, 0x28);
-	mipi_dsi_dcs_write_seq(dsi, 0xD3, 0x28);
-	mipi_dsi_dcs_write_seq(dsi, 0xB6, 0x11);
-	mipi_dsi_dcs_write_seq(dsi, 0xD6, 0x0D);
-	mipi_dsi_dcs_write_seq(dsi, 0xB7, 0x32);
-	mipi_dsi_dcs_write_seq(dsi, 0xD7, 0x30);
-	mipi_dsi_dcs_write_seq(dsi, 0xC1, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0xE1, 0x06);
-	mipi_dsi_dcs_write_seq(dsi, 0xB8, 0x0A);
-	mipi_dsi_dcs_write_seq(dsi, 0xD8, 0x0A);
-	mipi_dsi_dcs_write_seq(dsi, 0xB9, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0xD9, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0xBD, 0x13);
-	mipi_dsi_dcs_write_seq(dsi, 0xDD, 0x13);
-	mipi_dsi_dcs_write_seq(dsi, 0xBC, 0x11);
-	mipi_dsi_dcs_write_seq(dsi, 0xDC, 0x11);
-	mipi_dsi_dcs_write_seq(dsi, 0xBB, 0x0F);
-	mipi_dsi_dcs_write_seq(dsi, 0xDB, 0x0F);
-	mipi_dsi_dcs_write_seq(dsi, 0xBA, 0x0F);
-	mipi_dsi_dcs_write_seq(dsi, 0xDA, 0x0F);
-	mipi_dsi_dcs_write_seq(dsi, 0xBE, 0x18);
-	mipi_dsi_dcs_write_seq(dsi, 0xDE, 0x18);
-	mipi_dsi_dcs_write_seq(dsi, 0xBF, 0x0F);
-	mipi_dsi_dcs_write_seq(dsi, 0xDF, 0x0F);
-	mipi_dsi_dcs_write_seq(dsi, 0xC0, 0x17);
-	mipi_dsi_dcs_write_seq(dsi, 0xE0, 0x17);
-	mipi_dsi_dcs_write_seq(dsi, 0xB5, 0x3B);
-	mipi_dsi_dcs_write_seq(dsi, 0xD5, 0x3C);
-	mipi_dsi_dcs_write_seq(dsi, 0xB0, 0x0B);
-	mipi_dsi_dcs_write_seq(dsi, 0xD0, 0x0C);
-	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x30);
-	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x52);
-	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x03);
-	mipi_dsi_dcs_write_seq(dsi, 0x00, 0x2A);
-	mipi_dsi_dcs_write_seq(dsi, 0x01, 0x2A);
-	mipi_dsi_dcs_write_seq(dsi, 0x02, 0x2A);
-	mipi_dsi_dcs_write_seq(dsi, 0x03, 0x2A);
-	mipi_dsi_dcs_write_seq(dsi, 0x04, 0x61);
-	mipi_dsi_dcs_write_seq(dsi, 0x05, 0x80);
-	mipi_dsi_dcs_write_seq(dsi, 0x06, 0xC7);
-	mipi_dsi_dcs_write_seq(dsi, 0x07, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x08, 0x82);
-	mipi_dsi_dcs_write_seq(dsi, 0x09, 0x83);
-	mipi_dsi_dcs_write_seq(dsi, 0x30, 0x2A);
-	mipi_dsi_dcs_write_seq(dsi, 0x31, 0x2A);
-	mipi_dsi_dcs_write_seq(dsi, 0x32, 0x2A);
-	mipi_dsi_dcs_write_seq(dsi, 0x33, 0x2A);
-	mipi_dsi_dcs_write_seq(dsi, 0x34, 0x61);
-	mipi_dsi_dcs_write_seq(dsi, 0x35, 0xC5);
-	mipi_dsi_dcs_write_seq(dsi, 0x36, 0x80);
-	mipi_dsi_dcs_write_seq(dsi, 0x37, 0x23);
-	mipi_dsi_dcs_write_seq(dsi, 0x40, 0x82);
-	mipi_dsi_dcs_write_seq(dsi, 0x41, 0x83);
-	mipi_dsi_dcs_write_seq(dsi, 0x42, 0x80);
-	mipi_dsi_dcs_write_seq(dsi, 0x43, 0x81);
-	mipi_dsi_dcs_write_seq(dsi, 0x44, 0x11);
-	mipi_dsi_dcs_write_seq(dsi, 0x45, 0xF2);
-	mipi_dsi_dcs_write_seq(dsi, 0x46, 0xF1);
-	mipi_dsi_dcs_write_seq(dsi, 0x47, 0x11);
-	mipi_dsi_dcs_write_seq(dsi, 0x48, 0xF4);
-	mipi_dsi_dcs_write_seq(dsi, 0x49, 0xF3);
-	mipi_dsi_dcs_write_seq(dsi, 0x50, 0x02);
-	mipi_dsi_dcs_write_seq(dsi, 0x51, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x52, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0x53, 0x03);
-	mipi_dsi_dcs_write_seq(dsi, 0x54, 0x11);
-	mipi_dsi_dcs_write_seq(dsi, 0x55, 0xF6);
-	mipi_dsi_dcs_write_seq(dsi, 0x56, 0xF5);
-	mipi_dsi_dcs_write_seq(dsi, 0x57, 0x11);
-	mipi_dsi_dcs_write_seq(dsi, 0x58, 0xF8);
-	mipi_dsi_dcs_write_seq(dsi, 0x59, 0xF7);
-	mipi_dsi_dcs_write_seq(dsi, 0x7E, 0x02);
-	mipi_dsi_dcs_write_seq(dsi, 0x7F, 0x80);
-	mipi_dsi_dcs_write_seq(dsi, 0xE0, 0x5A);
-	mipi_dsi_dcs_write_seq(dsi, 0xB1, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xB4, 0x0E);
-	mipi_dsi_dcs_write_seq(dsi, 0xB5, 0x0F);
-	mipi_dsi_dcs_write_seq(dsi, 0xB6, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0xB7, 0x07);
-	mipi_dsi_dcs_write_seq(dsi, 0xB8, 0x06);
-	mipi_dsi_dcs_write_seq(dsi, 0xB9, 0x05);
-	mipi_dsi_dcs_write_seq(dsi, 0xBA, 0x0F);
-	mipi_dsi_dcs_write_seq(dsi, 0xC7, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xCA, 0x0E);
-	mipi_dsi_dcs_write_seq(dsi, 0xCB, 0x0F);
-	mipi_dsi_dcs_write_seq(dsi, 0xCC, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0xCD, 0x07);
-	mipi_dsi_dcs_write_seq(dsi, 0xCE, 0x06);
-	mipi_dsi_dcs_write_seq(dsi, 0xCF, 0x05);
-	mipi_dsi_dcs_write_seq(dsi, 0xD0, 0x0F);
-	mipi_dsi_dcs_write_seq(dsi, 0x81, 0x0F);
-	mipi_dsi_dcs_write_seq(dsi, 0x84, 0x0E);
-	mipi_dsi_dcs_write_seq(dsi, 0x85, 0x0F);
-	mipi_dsi_dcs_write_seq(dsi, 0x86, 0x07);
-	mipi_dsi_dcs_write_seq(dsi, 0x87, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0x88, 0x05);
-	mipi_dsi_dcs_write_seq(dsi, 0x89, 0x06);
-	mipi_dsi_dcs_write_seq(dsi, 0x8A, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x97, 0x0F);
-	mipi_dsi_dcs_write_seq(dsi, 0x9A, 0x0E);
-	mipi_dsi_dcs_write_seq(dsi, 0x9B, 0x0F);
-	mipi_dsi_dcs_write_seq(dsi, 0x9C, 0x07);
-	mipi_dsi_dcs_write_seq(dsi, 0x9D, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0x9E, 0x05);
-	mipi_dsi_dcs_write_seq(dsi, 0x9F, 0x06);
-	mipi_dsi_dcs_write_seq(dsi, 0xA0, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x30);
-	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x52);
-	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x02);
-	mipi_dsi_dcs_write_seq(dsi, 0x01, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x02, 0xDA);
-	mipi_dsi_dcs_write_seq(dsi, 0x03, 0xBA);
-	mipi_dsi_dcs_write_seq(dsi, 0x04, 0xA8);
-	mipi_dsi_dcs_write_seq(dsi, 0x05, 0x9A);
-	mipi_dsi_dcs_write_seq(dsi, 0x06, 0x70);
-	mipi_dsi_dcs_write_seq(dsi, 0x07, 0xFF);
-	mipi_dsi_dcs_write_seq(dsi, 0x08, 0x91);
-	mipi_dsi_dcs_write_seq(dsi, 0x09, 0x90);
-	mipi_dsi_dcs_write_seq(dsi, 0x0A, 0xFF);
-	mipi_dsi_dcs_write_seq(dsi, 0x0B, 0x8F);
-	mipi_dsi_dcs_write_seq(dsi, 0x0C, 0x60);
-	mipi_dsi_dcs_write_seq(dsi, 0x0D, 0x58);
-	mipi_dsi_dcs_write_seq(dsi, 0x0E, 0x48);
-	mipi_dsi_dcs_write_seq(dsi, 0x0F, 0x38);
-	mipi_dsi_dcs_write_seq(dsi, 0x10, 0x2B);
-	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x30);
-	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x52);
-	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x36, 0x02);
-	mipi_dsi_dcs_write_seq(dsi, 0x3A, 0x70);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xFF, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xFF, 0x52);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xFF, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xE3, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x05, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0x12);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x25, 0x1E);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x26, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x27, 0x52);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x28, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x29, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2A, 0xDF);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x38, 0x9C);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0xA7);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3A, 0x53);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x49, 0x3C);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0xFE);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5C, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x91, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x92, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xA0, 0x55);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xA1, 0x50);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xA4, 0x9C);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xA7, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xA8, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xA9, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xAA, 0xFC);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xAB, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xAC, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xAD, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xAE, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xAF, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB0, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB1, 0x26);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB2, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB3, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB4, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB5, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB6, 0x26);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB7, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB8, 0x26);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xFF, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xFF, 0x52);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xFF, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB1, 0x0E);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xD1, 0x0E);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB4, 0x29);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xD4, 0x2B);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB2, 0x0C);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xD2, 0x0A);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB3, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xD3, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB6, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xD6, 0x0D);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB7, 0x32);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xD7, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xC1, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xE1, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB8, 0x0A);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xD8, 0x0A);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB9, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xD9, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xBD, 0x13);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xDD, 0x13);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xBC, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xDC, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xBB, 0x0F);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xDB, 0x0F);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xBA, 0x0F);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xDA, 0x0F);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xBE, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xDE, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xBF, 0x0F);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xDF, 0x0F);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xC0, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xE0, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB5, 0x3B);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xD5, 0x3C);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB0, 0x0B);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xD0, 0x0C);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xFF, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xFF, 0x52);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xFF, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x2A);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x2A);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0x2A);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x2A);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x61);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x05, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x06, 0xC7);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x07, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x08, 0x82);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x83);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x30, 0x2A);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x31, 0x2A);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x32, 0x2A);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x33, 0x2A);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x34, 0x61);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x35, 0xC5);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x36, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x23);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x40, 0x82);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x41, 0x83);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x42, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x43, 0x81);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x45, 0xF2);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x46, 0xF1);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x47, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x48, 0xF4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x49, 0xF3);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x50, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x51, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x52, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x53, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x54, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0xF6);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x56, 0xF5);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x57, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x58, 0xF8);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0xF7);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7E, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7F, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xE0, 0x5A);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB1, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB4, 0x0E);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB5, 0x0F);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB6, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB7, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB8, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xB9, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xBA, 0x0F);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xC7, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xCA, 0x0E);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xCB, 0x0F);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xCC, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xCD, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xCE, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xCF, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xD0, 0x0F);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x81, 0x0F);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x84, 0x0E);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x85, 0x0F);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x86, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x87, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x88, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x89, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x8A, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x97, 0x0F);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x9A, 0x0E);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x9B, 0x0F);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x9C, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x9D, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x9E, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x9F, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xA0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xFF, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xFF, 0x52);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xFF, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0xDA);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0xBA);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0xA8);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x05, 0x9A);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x06, 0x70);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x07, 0xFF);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x08, 0x91);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x90);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0A, 0xFF);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0B, 0x8F);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0C, 0x60);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0D, 0x58);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0E, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0F, 0x38);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x10, 0x2B);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xFF, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xFF, 0x52);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xFF, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x36, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3A, 0x70);

 	dev_dbg(ctx->dev, "Panel init sequence done\n");

--
2.34.1

