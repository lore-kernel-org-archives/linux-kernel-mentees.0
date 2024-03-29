Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851413E493
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 29 Mar 2024 05:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711691098; cv=none; b=EI5XaCecXpO/QczxUjXCQ7Na+/N3UfYv1mH2eJ51UFewrG4QlgX362wYHPpLI9CqIKh4xGKK3rmWoS9H6l8bwNypnykoyO+JH3dDx21AhBshfawI36hGsZbOyWIz+BsSdPnh48fXEuhw+VwFutyZR96YAkMBF5uHBt8/hXuSxG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711691098; c=relaxed/simple;
	bh=Chsh0Y6imvACPZqM0aZBL2mZYFk82NHt7OzDTWuPeoQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SQ5AubQDQsmMXBzr88I90tMeMrPtMgcyh+c5grhnfNrUJHPHQcp3xoRHEbrPT6TF8/BhUIEyIACTIWd6yB02kq/gMWP9UdVVxx4PuWsLY8m7mqMe/R07DpQYsMwVNDMpJ+2UVRx6jkX9KocuJRxrnEtKU8lHc+ocf7hYvrlZfog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BOYsbajW; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BOYsbajW"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C91740471
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 29 Mar 2024 05:44:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rRxOFK4IIMwd for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Mar 2024 05:44:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::236; helo=mail-oi1-x236.google.com; envelope-from=coolrrsh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 559734042B
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 559734042B
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BOYsbajW
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 559734042B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 29 Mar 2024 05:44:56 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3c3d7ce5c69so1071982b6e.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 28 Mar 2024 22:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711691095; x=1712295895; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fwjYyV1xedFSqTP36VO0uSIhJUQea6nzzcBnO8oLakQ=;
        b=BOYsbajWXUR8xHDsz3sGwG+JxOV4ridzYU3qaqzuvHZUYTNq54txJFDPdQb5nz8DVL
         fCkalzFjIdCfOhH6oaGHA/jeBs5XVpG5psKqVFtX7NvJCmRXTQdt2odyqGdHG97EQVCf
         ZzVQDX13vDbT6Biui2Fu86Ncqpr4/SW0Lol6kFtxU++buEYp1A8cbsKf9/ylimmdXAOa
         C7+mttUlSYSKJjHNJFk8PQY4xNhzCDOyonaM5r0KcD+12wAb1EYzkzAMcdbh7YxX+nm/
         UgNg8czKDCkunt/y1N1lLJhVyIFB6IMcsNVZbxtb1OTKuQcRZvjnkfu2Wv0Cj2iYKEp7
         zY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711691095; x=1712295895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fwjYyV1xedFSqTP36VO0uSIhJUQea6nzzcBnO8oLakQ=;
        b=MB2n5MgNzbRinXsLSa81FCtK5mNLLmMwZ8HcMryFvjdFjTGQA8KK5737+pGEbkXQC3
         /8rbNJc9/JmnOJgmKb17cwRYpmVg3zpiGQNZPswRf7yXZsFOP0bCwh+HiC8CBASjzrEl
         QqwslFZzHTx4u9jTHBjzMRF96AmYdayEWrLm7EpHYmv/8j3oa+XK/dKG3fapHL9GOffr
         cTRZzaS5UC5fcqkxaPXkTQIFQLDAmmVE75cHjGZNvf8w6VIQQlBgJXCe2svQHm2Lq5vI
         OwwVyqHYy05HVDTM5kOoeESpHyu8W4EcgVbZYNW+qEGhpmwtnbTuTiBzC5/vlGq68bP0
         zNxA==
X-Gm-Message-State: AOJu0Yy9Iy5xODzEcj0RRifeJHb1UCWruJKpWmx151+fOYuAB+lC2HYZ
	ibNMKtPDpkuC8Fe+HTdOVuDMfHq79HjopiZrNfgnj4fXiYvCIZko
X-Google-Smtp-Source: AGHT+IFDwMv1sfBpVAUxu6Mc2Bi3QSJQkBrer5BK2llVjxSCi4SL/46S6aRYY65dN4uWzKxG3Vi07A==
X-Received: by 2002:a05:6808:211f:b0:3c1:c7a8:5ede with SMTP id r31-20020a056808211f00b003c1c7a85edemr1577604oiw.46.1711691095092;
        Thu, 28 Mar 2024 22:44:55 -0700 (PDT)
Received: from localhost.localdomain ([2409:40c2:100f:826c:582e:d62c:addc:15b1])
        by smtp.gmail.com with ESMTPSA id d15-20020aa7814f000000b006e47e57d976sm2315495pfn.166.2024.03.28.22.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 22:44:54 -0700 (PDT)
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
Subject: [PATCH v4] staging: media: imx: Remove duplicate Kconfig dependency
Date: Fri, 29 Mar 2024 11:14:46 +0530
Message-Id: <20240329054446.33523-1-coolrrsh@gmail.com>
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
Thus, the duplicate Kconfig dependency is removed.

Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>

---
v1->v2
changed the commit message
v2->v3
changed the subject
v3->v4
changed the commit message and subject 

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

