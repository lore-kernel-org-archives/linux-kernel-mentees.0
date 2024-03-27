Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C759A12E55
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 27 Mar 2024 02:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711506836; cv=none; b=XKwU4rQUB+72CoofwNmsJX9b1Yrh6442m7E6k9kqUZkhL/EPhH1/W8bD80+ROuht6R6k9Wkt5DKVLNQiKFctARRZebZ4nomH2Zgp5dC58UpqYilDRhOamg/BPC9mK662sMRBm2Bj+ZtDXsqAtbWP8Xb+UApOPS07URqDDcpJxhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711506836; c=relaxed/simple;
	bh=fqxbjdG/J9dPK4Wf42csZTCr+nu7BxaXdN+9IM5WVuk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=o6aQv5r2WadLZp9rEQJVHXI/nX708tfk2LW6HKE/EYETpS/Xx0epg/qH1rFVrEUC1ErVTQwqCQ6CPoOaSUgSsjIR4mgQlNW22FdR7fKOmssSGUFMO20HCnXbmO+xWOsZlIB5ABUq3FgCdZQE8mut54sFLpTdqLSs9c8tgdWANPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kDdZ3HmO; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kDdZ3HmO"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43EC88121E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 27 Mar 2024 02:33:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 69pQejCdPIBv for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Mar 2024 02:33:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=coolrrsh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 872D3811F7
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 872D3811F7
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kDdZ3HmO
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 872D3811F7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 27 Mar 2024 02:33:54 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6ea8ee55812so3784570b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 26 Mar 2024 19:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711506834; x=1712111634; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mFE/WKj5+GBAYBCA9TZu6+BYrqSKo8UWK4STAPr+tFI=;
        b=kDdZ3HmOkoYeMnbWPNOJNrcSti/fFqn+omXkC3QljyqwINj2vToE8OT7QMPGAYUBmN
         FNVEvqPnrrexz4AEQnXqcx1/jxx29VtL6Pf3/e7Nzt+8X6qz40Aci0hGCEJoTOH2oGeU
         K9GgkH+G5v9/EC8k6hblY7IbofADyRcoA5oU66LmaxoDLED+6s6Bg0PRieaCMJTkdVFS
         s9rXYn635h0Ou/ws8BxlcGoEViB6Fynq1tdSI83hsxMhFIjFfYazmEIVQxGvutplEuTu
         FLwX+gPc0HqvgTEqy1FrG5Vs14CHPnIfEDpwqhtLq7aCUfFhaY1IWcUkxyD4NxKUUsZB
         dAEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711506834; x=1712111634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mFE/WKj5+GBAYBCA9TZu6+BYrqSKo8UWK4STAPr+tFI=;
        b=mg3WKEKT0brzDvQwZ1yCzOWnbPYwusHAfEypU45SR+uxyV9LzRxa0C4fQwEU5BujwF
         5BUkMDUfDVsxwYAz0qT5FCIEIvuoe6YA6QrZCUslxUL+wKWopt83jFE859vhtCWV3pGA
         FioBQGDYOFPY2YWf0IMSDYr3EdmUJsazDDZNWJipfXy9S7JDIW+t8LIauBW3EymFHYEQ
         6H9JR1+M+NPU1gD1J3mF/so+ymuVOb6Tr3E82bgs6YTdrjFo+zuqLagnHJgHlKcNYLOn
         Ank7MGEft+bN6gJMnMoXi9xZlDURN47UWF4lY/RVw5jRKBQXRoG56cjzolnCmHSUj2rq
         pLHA==
X-Gm-Message-State: AOJu0YxooTJmkKJfZ5QDlExihvJevfmaHmKDRFw6HOd/fzix15ARSF5v
	BM1RygF3JRb5AYxW1SWHNXBQPaJjTSbDYRavmPAIDl0yNLqMJel3
X-Google-Smtp-Source: AGHT+IHALrwx+sm0l+OwSsy7AtHVrSvCQg1e5TSoosF5tEtKe338lI3N4UKnH3zPdgfXjfwA/xQdsg==
X-Received: by 2002:a05:6a00:3d51:b0:6e6:88c3:8b7d with SMTP id lp17-20020a056a003d5100b006e688c38b7dmr15983050pfb.10.1711506833394;
        Tue, 26 Mar 2024 19:33:53 -0700 (PDT)
Received: from localhost.localdomain ([2409:40c2:1161:203b:4df1:bb4e:1183:2058])
        by smtp.gmail.com with ESMTPSA id s2-20020aa78d42000000b006eac41e9674sm1008168pfe.146.2024.03.26.19.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 19:33:53 -0700 (PDT)
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
Subject: [PATCH v3] staging: media: remove duplicate line
Date: Wed, 27 Mar 2024 08:03:40 +0530
Message-Id: <20240327023340.3710-1-coolrrsh@gmail.com>
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
changed the commit message
v2->v3
changed the subject

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

