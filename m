Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E3317BA1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  3 Sep 2024 17:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725384743; cv=none; b=H/Oi2Rj8fCoeoW+qXgJojmDo5j5dUivo7HQxVY+JfF83e8MXyCraR/4kfUxcpSCIsOH9DMqjrj1bPmw1ILVqG8iVE4Bp3S/ugDTIgf/8Q+XzuhW3AJS6L/zZJlLuzis6FHsDw040hiChDIVgyzzw2Ue7b3VjrA6D69X82+nbjKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725384743; c=relaxed/simple;
	bh=veBQh8sTRvFn44RWBv4pf2WLQg8YGyP5+ypecjaJNio=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=H5DIAad3NqOIBPMyRtnUAcVpoGNUk8hh0wSZJ/NQ9V0gwlRgTi+fEOM7AdJ8FYgsS8au1wP2+Wn7FQnKjnWxgm+BbFhGVeuo2k0Dz1GU59zriYmka+v02GQeO5vtUryzQulDKbF5ZwaTk4ThAUdsKzftEPvBA4Qi2udl0rqxdCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iEJCRzup; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iEJCRzup"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E28A80CE3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  3 Sep 2024 17:32:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vz3MLIseE2Mv for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Sep 2024 17:32:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 43C8D80550
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43C8D80550
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iEJCRzup
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 43C8D80550
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  3 Sep 2024 17:32:20 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2057c6c57b5so13275475ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 03 Sep 2024 10:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725384739; x=1725989539; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HiLJoUgwiPwqGNm0lpObn/bqZI0GgOcal7bzp7/tmt0=;
        b=iEJCRzupJB9+F8Jlmic4PdZgV7ipgku+eNfTic4SVdrxNaS8hf3hkFD59wrHOT21+Z
         ms3pKtetfO0/gfvHsn94co0gifBNeUnV/o3trZ+PcOVHkdzAJ/gYSRNq2tzYnrYmym6p
         a7GM4thXQ6N9HK7nQb7wYUNHC8FKyd3MVXHbbHyfc/mHkW5SlhPjX2Mx69wzkynZGgG5
         8+NuZctHDpUH6u8VXrsnfayI2uxt6wjK2liQvktxBeh05yYpmxX8DQdXAwBkTpShZS0P
         YCkBO2gPuEWrUZUHYXkk8Nmd3qZySELDUrXGzGhHg7Qhe9tKYGZ32LlRoLqiZNNXjqmY
         690g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725384739; x=1725989539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HiLJoUgwiPwqGNm0lpObn/bqZI0GgOcal7bzp7/tmt0=;
        b=FP69ALqTuQx3Owd4GfWh/gxEfLLmfnCOtVmSoGXpUe3vhHMuzVWRTMHJCjuflJOB7e
         v9PB67WqEjCtUykAkmfxdl3RvbJyk/F0ll1bu1xYMSN5777KP6nfLCJLiwhTYbECyfBw
         AqCPcIIGr8fLOyYqWnwh2uLL+Wcy0X1bvJch5kEMme4F2crtOV2In8WHPrquQkyjQSbH
         5oQIBHqYzPC4l7veRlnZ27BV6is9p4PTiO1RVQAgaGxLJIykZn/vkgQYQNMCG/T+T8ik
         oAffMmInKEPSWku8ebixeyhE/68lLDsui843MqEmp0TAncZeIc2hU6x9IXtYy6zvGuM0
         7zLw==
X-Forwarded-Encrypted: i=1; AJvYcCXQq0m8Zg7EyWqIc0a7jUlrUp9bedj4tVERpc3rbtj7nHmBRWGg1lhT6vINcDcy/yEDq+76C2iVztJ8DrN7FySwRwl7GA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyJJwBMGp7UO1rlbn2BW+Xv2PCHJQgfsqHIg9LmeuKXM/STASUu
	mb7YKBbgMUQNP5oTjilANMw5edNVL9Gp/qr1NRfuoyzuhdVYmadB
X-Google-Smtp-Source: AGHT+IGdRQdOkVQPkh7f2Sk8ELepHXS+iAMlvClTHLu6I1uh9McKj94RRlPbaPEesRcO8TQ72q997A==
X-Received: by 2002:a17:902:e54e:b0:205:6c15:7b75 with SMTP id d9443c01a7336-2056c157df2mr137582805ad.7.1725384739290;
        Tue, 03 Sep 2024 10:32:19 -0700 (PDT)
Received: from embed-PC.. ([106.222.229.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae9558cfsm1092315ad.101.2024.09.03.10.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 10:32:18 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2] drm/panel: hx83112a: Transition to wrapped mipi_dsi functions
Date: Tue,  3 Sep 2024 23:01:30 +0530
Message-Id: <20240903173130.41784-1-abhishektamboli9@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Transition to mipi_dsi_dcs_write_seq_multi() macros for initialization
sequences. The previous mipi_dsi_dcs_write_seq() macros were
non-intuitive and use other wrapped MIPI DSI functions in the
driver code to simplify the code pattern.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202409040049.2hf8jrZG-lkp@intel.com/
Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
---
Changes in v2:
- Update the commit message to explain the reason for the change.
- Correct the code by changing 'dsi->mode_flags' to 'dsi_ctx.dsi->mode_flags'
This change addresses a build error in v1 reported by kernel test robot
caused by using an undeclared variable 'dsi'.
[v1] : https://lore.kernel.org/all/20240902170153.34512-1-abhishektamboli9@gmail.com/

 drivers/gpu/drm/panel/panel-himax-hx83112a.c | 140 ++++++++-----------
 1 file changed, 60 insertions(+), 80 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx83112a.c b/drivers/gpu/drm/panel/panel-himax-hx83112a.c
index 466c27012abf..6c457d17fd11 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx83112a.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx83112a.c
@@ -58,30 +58,28 @@ static void hx83112a_reset(struct hx83112a_panel *ctx)

 static int hx83112a_on(struct hx83112a_panel *ctx)
 {
-	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
-
-	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+	struct mipi_dsi_multi_context dsi_ctx = {.dsi = ctx->dsi};
+
+	dsi_ctx.dsi->mode_flags |= MIPI_DSI_MODE_LPM;

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

-	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+	dsi_ctx.dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;

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

