Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F2D47A76
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 24 Jul 2024 17:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721843678; cv=none; b=u/YMX4p87kcRiAsFONyLP0+y15JvmGv5f/0ihvnFOdAoS9apSu1FIUXfktg0x6rMVQQCFj+3svZsL0RJhixKt8CJLfW8hFZsDPgAtzlmMGQKyllrj49YgWnMuzdnOfPgLoX8xIF0BybrneLHFyTt2S7gL7DLsrDozCmoKuNMnsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721843678; c=relaxed/simple;
	bh=/IWh2c/iGDcV85EwzBtLMmaINhmCLqhakPkzcvy5woE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=m7NKxyl/pLp/azdRrkxr2GH60m5C3nzzB4TOQQkb5f/Iziml44kHccPIaCJ6U7xfZAspJvsnAH7CAC9xV4UKQLSRHq36+UdAwH5YfnhasWAvS9zBGj9qdDT7W/nyM6fn7JkgCk6Otn5tgKrhtC/UlokAZUGcOJ0YJYHoGakkuO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lAdyrm0F; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lAdyrm0F"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FD648130D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 24 Jul 2024 17:54:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mJ2ntIM_yWtS for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Jul 2024 17:54:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 96ECD8130C
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96ECD8130C
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lAdyrm0F
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 96ECD8130C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 24 Jul 2024 17:54:36 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1fc6a017abdso440045ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 24 Jul 2024 10:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721843676; x=1722448476; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZeMvaTqF6nVC8+TTPXCBAeC27R72xrtkyB8OCewfWY4=;
        b=lAdyrm0Fcr4CSE2OURdqZuGweSjylSVpki5iIuWtvz30z619GUjhmkBiQ7oML5Ke/I
         vKOahvH2FvUXB+IFKf5454QXkmU+zGlL8rORIcLpu9Q6c3L0DeEUv/MyzFfPuERHP9lC
         cwEd3X+UFdmsPSGSMM0F36laP8Yy9NiueLjkMxuyGrLWRwJYdrfbp3Zungcfbdz3cKMl
         0CNe1ZwwzIb11dVaeBJP+eByQBueGIKh5ov5r5o/h2lABhnOHoXIzbsYlTWybLqcUz1a
         EntH38VPLWEmhsfIC9uBHdkj/RU1Bhk4pT0OUDUIthWqVj9j+58vKulUFTQ/s4yCRLlR
         UTfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721843676; x=1722448476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZeMvaTqF6nVC8+TTPXCBAeC27R72xrtkyB8OCewfWY4=;
        b=VssAhiqi3eVbZ0NEmHrHw2t2X2bfJW9pFmS2eoN2L7j/P6noU3sm/ralWWLGbAnXO0
         RnBVgyyXaIs9cLklVQrnUWAp5+KO3wA3zjg8N0I3vSlJ3KwBUEsdc0/7LQ3kkEhNkcN7
         6QCsSQRoGA2dxvBP7MgWxAaB2TdP/zjdC6ardBAZZQ93MLnb7Pkz/a8xlLTsgIXfWq/Y
         +Z3YSFEvOyeKp4ZzKrp8RQq5zDpDJj4UJXVuqlf72MkKcRSFQILJXD3AOPE3x9ztOR6M
         9VbJo82yWJJl548OqwTs2qUkh5Td+wH5glJoMIUB0f5QV2ri3I9uOkDJOz5LdTopL3Uh
         2/Wg==
X-Forwarded-Encrypted: i=1; AJvYcCXOifkp7hCMMVeTCmTokSuh7qnA+L9Ywn7/6FH0vl9EqlkdhFcRs2mTSSAsDP1WVEc4LAueLyFf0jV9p5hphxcT76knGOQhIt7vp8EAo15gPvZjFfhwRXoXOVB/773A
X-Gm-Message-State: AOJu0YyokOOEQKczdKtIHSiSuyld/dW2fswaKs2i6pDtev2FAeI2Plfm
	KmMUN/Rup0dvOFVfi7lwcaWiNMOmFUHT1H/dxOCjmZDOc5kHe+HF
X-Google-Smtp-Source: AGHT+IFUycfF2BPrsXjk1R8U+2PiWCnVeWgqd/XGw1a2IyeonzKrWsGYZ9XXWG1J32fNw6Xkf6/3Sg==
X-Received: by 2002:a17:902:e812:b0:1fd:69d6:856d with SMTP id d9443c01a7336-1fed38607cemr4234205ad.17.1721843674654;
        Wed, 24 Jul 2024 10:54:34 -0700 (PDT)
Received: from embed-PC.. ([122.161.119.73])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f25ac88sm97165815ad.6.2024.07.24.10.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 10:54:34 -0700 (PDT)
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: airlied@gmail.com,
	daniel@ffwll.ch,
	harry.wentland@amd.com,
	sunpeng.li@amd.com,
	Rodrigo.Siqueira@amd.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	Xinhui.Pan@amd.com
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	rbmarliere@gmail.com,
	marcelomspessoto@gmail.com,
	aurabindo.pillai@amd.com,
	adnelson@amd.com,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] drm/amd/display: Fix documentation warning for mpc.h
Date: Wed, 24 Jul 2024 23:24:23 +0530
Message-Id: <20240724175423.18075-1-abhishektamboli9@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix documentation compile warning by adding description
for program_3dlut_size function.

Remove the following warning:
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:1043: warning: Function parameter or struct member 'program_3dlut_size' not described in 'mpc_funcs'

Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
index 40a9b3471208..615c69d966e7 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
@@ -1039,7 +1039,21 @@ struct mpc_funcs {
 	*/
 	void (*program_lut_mode)(struct mpc *mpc, const enum MCM_LUT_ID id, const enum MCM_LUT_XABLE xable,
 			bool lut_bank_a, int mpcc_id);
-	void (*program_3dlut_size)(struct mpc *mpc, bool is_17x17x17, int mpcc_id);
+	/**
+	 * @program_3dlut_size:
+	 *
+	 * Program 3D LUT size.
+	 *
+	 * Parameters:
+	 * - [in/out] mpc - MPC context.
+	 * - [in] is_17x17x17 - Boolean Flag.
+	 * - [in] mpcc_id - MPCC physical instance.
+	 *
+	 * Return:
+	 *
+	 * void
+	 */
+	 void (*program_3dlut_size)(struct mpc *mpc, bool is_17x17x17, int mpcc_id);
 };
 
 #endif
-- 
2.34.1

