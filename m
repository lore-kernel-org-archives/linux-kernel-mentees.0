Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEF51AB6D2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  2 Sep 2024 17:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725296530; cv=none; b=Um9LZ70eg3zrRaoLv9+7+HLe+a0ng8ALu+hxZFvQieke8zrL8Jx2e45E6qGynRxEv34JWdXNShwGw9ctbb1JFoFbrlPivtDUt8AIdR0sJrkDzm9xirzhfDxg0KXZZINBZdUCItx824qS7vPmQQXyGbu+lwu2Gql1UzF9rrIdeBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725296530; c=relaxed/simple;
	bh=I1N/VWl2ypyggbc7gY2JPAb2fjvbsaa4+Mqhx6+ujLw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mAb98aachVFQgOj5jkmhNDajnOavC5hwaGaydSMcz+8YPE8LxQUlbRWGjhWuCzX5CDGwtJVB8ECuSmH3z9EZTa6PI7SQG5A5BLDl2QceieJfPUMnVl+4W2fMOPCYSdBmWlAkEZZ8qh+UfQp/k7T0XDHIxFJdoDMTxyb9yhuO5Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BiMvmzFf; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BiMvmzFf"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68FAF4027E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  2 Sep 2024 17:02:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ugvgDNA78cHD for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Sep 2024 17:02:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F3F96401F8
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3F96401F8
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BiMvmzFf
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	by smtp4.osuosl.org (Postfix) with ESMTPS id F3F96401F8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  2 Sep 2024 17:02:06 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-6e7b121be30so2602432a12.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 02 Sep 2024 10:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725296526; x=1725901326; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=15gdF/5rednKwRR/H/BsMJwPars63vsN9aTaORv5oqw=;
        b=BiMvmzFfH1Gj2qIA6qI3ByfiMATlVAz8SP1nusDlgzByivU9Gg/bt6Z7f/KxeH/xQ8
         oO6l3AN16WXMKw9MteeLKNbObzSOD7zGQUapvDuz+VkZoGvUlHZV8iHV/0E98VDF2K8x
         0hhVP4LGdsrTHFbkcXZtmoYGEU3SAxNSR1ONqCY5g2bzzMvigNj9m6Hraf1iaGeUteee
         ncpOJ05JjrOjnupAwguP737EIn7ZIDId4XIu4v3a4ZqF6Hsh07kzT5k4n3Bhl1Ss86bG
         UK8tyLa2pfDMW7ssMDFkZZfCd0EELwGAqrqMzrZeGMU+aKX8RvfTH7bSuq0/tKMSvuCb
         jBhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725296526; x=1725901326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=15gdF/5rednKwRR/H/BsMJwPars63vsN9aTaORv5oqw=;
        b=CNDY8g6tRwAqhgQEPgxrWIQkLonb+mQZC64Giow1e9JsE5pUwjZoQErbgtcZBRmL3W
         L1l9aqq4ORe6XfsdUTNglCDvoKN6xA/CMufmna2wIldcfllkaExISRcfE1TL/wlN8TB/
         dQqho8drNDKXzCvZ8/+mvdtofSnmQ+eapLbnjiiRjYHtOsjuCxYhWbcsDWMjB6asNwJZ
         0tcyDyGOrUoP+AFmKMdtCEJNnlqENlrt+n/Eu6pTW5CGHEBtvF0gi/SzHuwjxXbieo3/
         BJZsU+XPDBrXysKRQA7WMGoWNSu7zNIl5kQ93zqVcFTWiFqYbUlLbkEDIKZShJL056bJ
         aq7w==
X-Forwarded-Encrypted: i=1; AJvYcCXlva2lTP76Dhc7MME8B26eeoXjHIMTg8cOlTb91CwNgswlwv9q1GksyHi8CPwwFHkueZFfZaf2TqQhaXgfZMVyvetx8A==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyWme7c2+gpRUUTckhPtA8bHIkZpvTqHdMSafHPezNnsBQoCmBL
	Py3/2N2gwhlt2+0P7WNJNGziymQJwgvDWXg0VkZ9QC5XHNFp1zJ/
X-Google-Smtp-Source: AGHT+IEOeGwc/ueFhc4jL1/9jEQVaqu/D1yKXQv70d2uYnmjo9MscuUKA73/xo1KCWn0ztiudhOprg==
X-Received: by 2002:a17:902:e88b:b0:205:6566:cb07 with SMTP id d9443c01a7336-2056566cd79mr42995265ad.17.1725296525710;
        Mon, 02 Sep 2024 10:02:05 -0700 (PDT)
Received: from embed-PC.. ([106.222.229.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205682cdc5dsm24124215ad.243.2024.09.02.10.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 10:02:05 -0700 (PDT)
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
Subject: [PATCH] drm/panel: hx83112a: Switch to wrapped mipi_dsi functions
Date: Mon,  2 Sep 2024 22:31:53 +0530
Message-Id: <20240902170153.34512-1-abhishektamboli9@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the new mipi_dsi_*_multi wrapped function in hx83112a_on
and hx83112a_disable function.

Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
---
 drivers/gpu/drm/panel/panel-himax-hx83112a.c | 136 ++++++++-----------
 1 file changed, 58 insertions(+), 78 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx83112a.c b/drivers/gpu/drm/panel/panel-himax-hx83112a.c
index 466c27012abf..391684e62d24 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx83112a.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx83112a.c
@@ -58,30 +58,28 @@ static void hx83112a_reset(struct hx83112a_panel *ctx)
 
 static int hx83112a_on(struct hx83112a_panel *ctx)
 {
-	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
-
+	struct mipi_dsi_multi_context dsi_ctx = {.dsi = ctx->dsi};
+
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETEXTC, 0x83, 0x11, 0x2a);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETPOWER1,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETEXTC, 0x83, 0x11, 0x2a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETPOWER1,
 			       0x08, 0x28, 0x28, 0x83, 0x83, 0x4c, 0x4f, 0x33);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETDISP,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETDISP,
 			       0x00, 0x02, 0x00, 0x90, 0x24, 0x00, 0x08, 0x19,
 			       0xea, 0x11, 0x11, 0x00, 0x11, 0xa3);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETDRV,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETDRV,
 			       0x58, 0x68, 0x58, 0x68, 0x0f, 0xef, 0x0b, 0xc0,
 			       0x0b, 0xc0, 0x0b, 0xc0, 0x00, 0xff, 0x00, 0xff,
 			       0x00, 0x00, 0x14, 0x15, 0x00, 0x29, 0x11, 0x07,
 			       0x12, 0x00, 0x29);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x02);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETDRV,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETDRV,
 			       0x00, 0x12, 0x12, 0x11, 0x88, 0x12, 0x12, 0x00,
 			       0x53);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x03);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETDGCLUT,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETDGCLUT,
 			       0xff, 0xfe, 0xfb, 0xf8, 0xf4, 0xf1, 0xed, 0xe6,
 			       0xe2, 0xde, 0xdb, 0xd6, 0xd3, 0xcf, 0xca, 0xc6,
 			       0xc2, 0xbe, 0xb9, 0xb0, 0xa7, 0x9e, 0x96, 0x8d,
@@ -90,8 +88,8 @@ static int hx83112a_on(struct hx83112a_panel *ctx)
 			       0x06, 0x05, 0x02, 0x01, 0x00, 0x00, 0xc9, 0xb3,
 			       0x08, 0x0e, 0xf2, 0xe1, 0x59, 0xf4, 0x22, 0xad,
 			       0x40);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x02);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETDGCLUT,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETDGCLUT,
 			       0xff, 0xfe, 0xfb, 0xf8, 0xf4, 0xf1, 0xed, 0xe6,
 			       0xe2, 0xde, 0xdb, 0xd6, 0xd3, 0xcf, 0xca, 0xc6,
 			       0xc2, 0xbe, 0xb9, 0xb0, 0xa7, 0x9e, 0x96, 0x8d,
@@ -100,8 +98,8 @@ static int hx83112a_on(struct hx83112a_panel *ctx)
 			       0x06, 0x05, 0x02, 0x01, 0x00, 0x00, 0xc9, 0xb3,
 			       0x08, 0x0e, 0xf2, 0xe1, 0x59, 0xf4, 0x22, 0xad,
 			       0x40);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETDGCLUT,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETDGCLUT,
 			       0xff, 0xfe, 0xfb, 0xf8, 0xf4, 0xf1, 0xed, 0xe6,
 			       0xe2, 0xde, 0xdb, 0xd6, 0xd3, 0xcf, 0xca, 0xc6,
 			       0xc2, 0xbe, 0xb9, 0xb0, 0xa7, 0x9e, 0x96, 0x8d,
@@ -110,13 +108,13 @@ static int hx83112a_on(struct hx83112a_panel *ctx)
 			       0x06, 0x05, 0x02, 0x01, 0x00, 0x00, 0xc9, 0xb3,
 			       0x08, 0x0e, 0xf2, 0xe1, 0x59, 0xf4, 0x22, 0xad,
 			       0x40);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETDGCLUT, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETTCON,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETDGCLUT, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETTCON,
 			       0x70, 0x00, 0x04, 0xe0, 0x33, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETPANEL, 0x08);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETPOWER2, 0x2b, 0x2b);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETGIP0,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETPANEL, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETPOWER2, 0x2b, 0x2b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETGIP0,
 			       0x80, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x08,
 			       0x08, 0x03, 0x03, 0x22, 0x18, 0x07, 0x07, 0x07,
 			       0x07, 0x32, 0x10, 0x06, 0x00, 0x06, 0x32, 0x10,
@@ -124,105 +122,87 @@ static int hx83112a_on(struct hx83112a_panel *ctx)
 			       0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x08,
 			       0x09, 0x30, 0x00, 0x00, 0x00, 0x06, 0x0d, 0x00,
 			       0x0f);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETGIP0,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETGIP0,
 			       0x00, 0x00, 0x19, 0x10, 0x00, 0x0a, 0x00, 0x81);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETGIP1,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETGIP1,
 			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
 			       0xc0, 0xc0, 0x18, 0x18, 0x19, 0x19, 0x18, 0x18,
 			       0x40, 0x40, 0x18, 0x18, 0x18, 0x18, 0x3f, 0x3f,
 			       0x28, 0x28, 0x24, 0x24, 0x02, 0x03, 0x02, 0x03,
 			       0x00, 0x01, 0x00, 0x01, 0x31, 0x31, 0x31, 0x31,
 			       0x30, 0x30, 0x30, 0x30, 0x2f, 0x2f, 0x2f, 0x2f);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETGIP2,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETGIP2,
 			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
 			       0x40, 0x40, 0x18, 0x18, 0x18, 0x18, 0x19, 0x19,
 			       0x40, 0x40, 0x18, 0x18, 0x18, 0x18, 0x3f, 0x3f,
 			       0x24, 0x24, 0x28, 0x28, 0x01, 0x00, 0x01, 0x00,
 			       0x03, 0x02, 0x03, 0x02, 0x31, 0x31, 0x31, 0x31,
 			       0x30, 0x30, 0x30, 0x30, 0x2f, 0x2f, 0x2f, 0x2f);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETGIP3,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETGIP3,
 			       0xaa, 0xea, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xea,
 			       0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xea, 0xab, 0xaa,
 			       0xaa, 0xaa, 0xaa, 0xea, 0xab, 0xaa, 0xaa, 0xaa);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETGIP3,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETGIP3,
 			       0xaa, 0x2e, 0x28, 0x00, 0x00, 0x00, 0xaa, 0x2e,
 			       0x28, 0x00, 0x00, 0x00, 0xaa, 0xee, 0xaa, 0xaa,
 			       0xaa, 0xaa, 0xaa, 0xee, 0xaa, 0xaa, 0xaa, 0xaa);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x02);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETGIP3,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETGIP3,
 			       0xaa, 0xff, 0xff, 0xff, 0xff, 0xff, 0xaa, 0xff,
 			       0xff, 0xff, 0xff, 0xff);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x03);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETGIP3,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETGIP3,
 			       0xaa, 0xaa, 0xea, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa,
 			       0xea, 0xaa, 0xaa, 0xaa, 0xaa, 0xff, 0xff, 0xff,
 			       0xff, 0xff, 0xaa, 0xff, 0xff, 0xff, 0xff, 0xff);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETTP1,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETTP1,
 			       0x0e, 0x0e, 0x1e, 0x65, 0x1c, 0x65, 0x00, 0x50,
 			       0x20, 0x20, 0x00, 0x00, 0x02, 0x02, 0x02, 0x05,
 			       0x14, 0x14, 0x32, 0xb9, 0x23, 0xb9, 0x08);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETTP1,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETTP1,
 			       0x02, 0x00, 0xa8, 0x01, 0xa8, 0x0d, 0xa4, 0x0e);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x02);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETTP1,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETTP1,
 			       0x00, 0x00, 0x08, 0x00, 0x01, 0x00, 0x00, 0x00,
 			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00,
 			       0x00, 0x00, 0x00, 0x02, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_UNKNOWN1, 0xc3);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETCLOCK, 0xd1, 0xd6);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_UNKNOWN1, 0x3f);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_UNKNOWN1, 0xc6);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETPTBA, 0x37);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_UNKNOWN1, 0x3f);
-
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
-		return ret;
-	}
-	msleep(150);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_UNKNOWN1, 0xc3);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETCLOCK, 0xd1, 0xd6);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_UNKNOWN1, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_UNKNOWN1, 0xc6);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETPTBA, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_UNKNOWN1, 0x3f);
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display on: %d\n", ret);
-		return ret;
-	}
-	msleep(50);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 150);
 
-	return 0;
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 50);
+
+	return dsi_ctx.accum_err;
 }
 
 static int hx83112a_disable(struct drm_panel *panel)
 {
 	struct hx83112a_panel *ctx = to_hx83112a_panel(panel);
-	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = {.dsi = ctx->dsi};
 
 	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display off: %d\n", ret);
-		return ret;
-	}
-	msleep(20);
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 20);
 
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
-		return ret;
-	}
-	msleep(120);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int hx83112a_prepare(struct drm_panel *panel)
-- 
2.34.1

