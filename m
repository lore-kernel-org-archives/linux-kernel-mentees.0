Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2495F3C183C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 25 Mar 2024 03:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711337678; cv=none; b=k20s168xHjM4D9edxxxYQ3KdQcS0NQkEv4pvdO7ShYJJHISFn9O7Rwc6MaKznRhIRmMVD3RHt1M9w8YDf6crVSyS8THedOkYJFYCVCZXkKiFV0684d5vXFPWEVylWoo84H0v8Eb9+SF0yaCtJWW2Xe36+AhHpksYVaSxg7XpHe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711337678; c=relaxed/simple;
	bh=dgHhWcmK4wzqyaiiERdmFMSqnnE06qaplwlkFBXUdIA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ntoLHFm+gDJ8yFa4OiFGJCC+D9jVaLwbPTorN0fVhtsxqiDNcyKoEa59XhY9gRMtRVdnvGWA9lAvPvymf3MSsBm85uQS3UrO825o6Xxb+9bhfTO+OimbiH2BFo57TOw0fSuFRBj75bE1lAiIcLwXiHospndoOXX5r+XGpv43vI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HmLndzSG; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HmLndzSG"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD09181831
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 25 Mar 2024 03:34:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g9rNTZyKpKiy for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Mar 2024 03:34:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4860:4864:20::2f; helo=mail-oa1-x2f.google.com; envelope-from=coolrrsh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F347F81771
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F347F81771
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HmLndzSG
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
	by smtp1.osuosl.org (Postfix) with ESMTPS id F347F81771
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 25 Mar 2024 03:34:35 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-22a1e72f683so682440fac.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 24 Mar 2024 20:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711337674; x=1711942474; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KMpIxPMCcxDzGX2UXAJvTPFkeya4KxDWX8GZFo5s2Gc=;
        b=HmLndzSGJ+EoEDqzDVMcKSPBV0FoKo8fIRo/+WqTsYOEYcNoTjm8JLGBZVXnrsCJPn
         VzzrcOyTyPUrtSardY1sKM/jXlxa7pZlSuitveSNkr0eH33iL0meuT/w1iP0s+wV2RQV
         aninXKiAnjqzcoGQxf0hF39elw9SHS599x/nM8gjSS3RqhsKttyeReYysyoZmoMRrU/r
         q9TCJWn5/AhncigUtzaFN5tmmuJ/QozJCYownErq9c7Qc2nMseAYb8K95EU7D3aTADn6
         BcOiCef1aEplVrySWCDPPI81Cle2nfsgubK1FbfM3tW8y8YnSITeYKkPGcV88l1w8Gbe
         EGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711337674; x=1711942474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KMpIxPMCcxDzGX2UXAJvTPFkeya4KxDWX8GZFo5s2Gc=;
        b=mIApl0im4x5kQOxVOX3mHFsZCQloCK8mDxgXDXLTBYrixM31mZy9hm5Qanf1b3ozCv
         hlaGioFqXl8ot/VYEQIwIipitX2AeWRFnuZKlhuMDygMFmPcziCUebsJn7tUTFCX1A+U
         mNDDpDC4ykvlTUwU2bM43umIxD6tsKkiHW+DpGhyCipV/IvRLRKig72v/5jmuS+mbFKD
         bopk/59nDS1hYebmAs2nqukXqVCJylfgIZrq+GMGYa0QlFnVt+pHpZPmWMWnjkoiR84e
         T5qLW15XmAR09gvNBpNU1S6lac29hp4mg+FytADiigoCyocFDwCoJuMW58trDoFGtwhQ
         CMUA==
X-Gm-Message-State: AOJu0YxzB41EmxJ89PfTdiRj3xbq9gfslYlOm7oBBYAIszr05nAw+FiM
	CIGrdtifaqMWDK+Bx2h0g5+GiY7HTSNgsh1prBlEB5YskcW5IBQR
X-Google-Smtp-Source: AGHT+IGSrQDNPv9m6amL42+SaReUA0caWi4XU01dj8E7zHNP41xfBJTTfNqiPAlE6na2wTOq0RYS1g==
X-Received: by 2002:a05:6870:2183:b0:222:b950:6785 with SMTP id l3-20020a056870218300b00222b9506785mr6717232oae.28.1711337674272;
        Sun, 24 Mar 2024 20:34:34 -0700 (PDT)
Received: from localhost.localdomain ([2409:40c2:1010:877d:14ff:b313:5f57:6762])
        by smtp.gmail.com with ESMTPSA id i25-20020aa787d9000000b006e66a76d877sm3310747pfo.153.2024.03.24.20.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Mar 2024 20:34:33 -0700 (PDT)
From: coolrrsh@gmail.com
To: slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	Rajeshwar R Shinde <coolrrsh@gmail.com>
Subject: [PATCH v2] staging: media: remove duplicates
Date: Mon, 25 Mar 2024 09:04:27 +0530
Message-Id: <20240325033427.4708-1-coolrrsh@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rajeshwar R Shinde <coolrrsh@gmail.com>

The kernel configuration VIDEO_DEV is defined twice in Kconfig.
Thus, the redundant code is removed.

Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>

---
v1->v2
modified the subject and commit message

---
 drivers/staging/media/imx/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/imx/Kconfig b/drivers/staging/media/imx/Kconfig
index 21fd79515042..772f49b1fe52 100644
--- a/drivers/staging/media/imx/Kconfig
+++ b/drivers/staging/media/imx/Kconfig
@@ -4,7 +4,6 @@ config VIDEO_IMX_MEDIA
 	depends on ARCH_MXC || COMPILE_TEST
 	depends on HAS_DMA
 	depends on VIDEO_DEV
-	depends on VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select V4L2_FWNODE
 	select V4L2_MEM2MEM_DEV
-- 
2.25.1

