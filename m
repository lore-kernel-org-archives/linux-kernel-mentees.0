Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED72C16415
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 24 Mar 2024 09:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711272568; cv=none; b=eto67f6JIKUqkMrV1dBvqXteVFnzGDqSRx6ng7TkJ/cMlnHMQ+jYXGh8EPmM/MLQkHIsdy0garg5V484dpIDudaxvTVJmuBTvTIB2pN/Rp2Lu5GgO1QNAEL8tKEY/JCh17m2o5lJve6hzPCFCBQDiZKH+GboG+RL1VFaFB9W3fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711272568; c=relaxed/simple;
	bh=kJA1ENfcVIOkNw3avk4+tDK8aEfaH/g6voWzg9aHL18=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nwDc1MEgj+Qaydl078IQt/2fy1gWF2NwaYzmX/Q6R17uFgwkgniMnx5f5q13tPm3W3w2lIwR7T/QEZniVogmNrPdtiBcUDdCZOmgBTLvy3RplfpjZhWFtJCn5D+KkT/ruoQS8n42EgEssaM17UzjE1nhcpOf5hS9g/jmLidnc0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VskwaR1B; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VskwaR1B"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 691254057C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 24 Mar 2024 09:29:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aHq0QuRadW6U for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Mar 2024 09:29:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=coolrrsh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 94D4D4057A
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94D4D4057A
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VskwaR1B
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 94D4D4057A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 24 Mar 2024 09:29:25 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1dddbeac9f9so21548485ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 24 Mar 2024 02:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711272565; x=1711877365; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o611cLqDFm70Z0Jt+IMAjJ8j+5plaV1gN+jC5Ar2By4=;
        b=VskwaR1BV//wkdhRsb+GkY8EQgPmQ0ofefdpIiwLiXepYEnrzQU8lX6n2G4rbdcMnt
         KgxZLRBPLXRU4Woit2CP0et5XuST8Vds4rri3XffOMi3h9F8tTRbJfSG182xzGn5K6Gj
         4FWc/7OqOh96+W6/jOsUPBCnqpqGyATLmLFVrQeT6k2qd6hDpNcswFcoiW1/goJP4iYs
         wQfNSK01tnXFye4WkvxRq69VXHBiySN1I7TFP5zZ5RddRq+wMEPVCVpLajLKMo5+KuzG
         DUzug6cPQsoOTunqIwAP/tbrsQBbpyrya5/p3JJKVU3KRjiVGI9XxaczUWbeg1lKNZk8
         PBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711272565; x=1711877365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o611cLqDFm70Z0Jt+IMAjJ8j+5plaV1gN+jC5Ar2By4=;
        b=iGUWDfqteL0C7nVuizXHrvvI/QSqQKMqcIvZZYIdUjAWLEZlalI+bGwBWghSAonyJ+
         IAud+XUkkJkrzYQxVPqLcbZO6JkwKxO78s+I5y0n7zy4JFuQJrNYzo5HCL0WtEsvg1Kf
         vIdQvFXonhp8VHKmcBvC2GOq+3S05nP5jQ/+7Dq0o2A+vxgC+hwiI7dA2O0Z48KYF2qd
         kTRlAe8OKVfkt6IVU52z+h6ANWB/5XFK7ai7qWWNassmIiSoiPosXMbRrA5hDZ43RMgn
         +2YiL+c9w37m5ixVjCZDkBFeJ6u4eIR4E3viCzafvybR8pbS4OoEQGeHsuQOfBrMYLxj
         IbYw==
X-Gm-Message-State: AOJu0Yz4GjboOcuDzAN+umPB0CLBYVEgjy8TrJcttaWjDVpoRFKs4b+y
	1PgwnumH6HbnCP05skOWVmw9dqvwbV+piaPhVanOK5GVkXMr+bxG
X-Google-Smtp-Source: AGHT+IFvawNc97ardr5RtDisvgJA38GFboOggdtFCS3O754mL/vF+2DKsMyOKtUSOxQENHyFOa9F6Q==
X-Received: by 2002:a17:902:e542:b0:1e0:b5d4:9fcb with SMTP id n2-20020a170902e54200b001e0b5d49fcbmr1110472plf.34.1711272564702;
        Sun, 24 Mar 2024 02:29:24 -0700 (PDT)
Received: from localhost.localdomain ([2409:40c2:1004:e7c1:d108:f4f6:f7c6:2fde])
        by smtp.gmail.com with ESMTPSA id y12-20020a170902ed4c00b001e0a28f61d0sm2717347plb.70.2024.03.24.02.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Mar 2024 02:29:24 -0700 (PDT)
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
Subject: [PATCH v1] staging: media: remove duplicates
Date: Sun, 24 Mar 2024 14:59:17 +0530
Message-Id: <20240324092917.19177-1-coolrrsh@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rajeshwar R Shinde <coolrrsh@gmail.com>

In Kconfig, the kernel configuration VIDEO_DEV is defined twice.
To prevent doing repeated checks, the redundant code was replaced.

Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>

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

