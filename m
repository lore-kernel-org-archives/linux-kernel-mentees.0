Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52757C71153
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  3 Sep 2023 15:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1EF1400E4;
	Sun,  3 Sep 2023 15:37:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1EF1400E4
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=E4Tc3oAe
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hh7vqGLpJ9XJ; Sun,  3 Sep 2023 15:37:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id AD22D40607;
	Sun,  3 Sep 2023 15:37:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD22D40607
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 895BEC0071;
	Sun,  3 Sep 2023 15:37:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 94379C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  3 Sep 2023 15:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6ED1681E5C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  3 Sep 2023 15:37:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6ED1681E5C
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=E4Tc3oAe
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vs2M-f8DJTV3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  3 Sep 2023 15:37:27 +0000 (UTC)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D292E81E5A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  3 Sep 2023 15:37:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D292E81E5A
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1c0d5b16aacso3118025ad.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 03 Sep 2023 08:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693755447; x=1694360247;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5DfTZHovIdUMYDGPmEpLo2QSNP9WxkZc/VjLrGHKaVw=;
 b=E4Tc3oAesAttX1tXy9m/6Q6Bq8HfT5DgLsIa26tCWHwpGjCNu+pMNWmlIiBJHAaK47
 Y8plgnsKlA+3CO5M2tbTZHYgFOoG+wokkcc297aLbTF7Do9nEbJc9B/diUA7rLNxaYs4
 EGFi0hXQZ5SxfyNcmMyPAh8zbRPrL/LyczN8bZwqHL1bEv7+G5UjmTC9NGLiC/mR58C7
 4TCznXMmCqIkyfDF+Y3ayJlezKP3r1aOpmpVjxGzZPqZElnAuPBXuFxc9sqx0N3mel56
 XgEA4CMaD4/8lOkFoTsyWICqCy+vTTrWrK8mJm+M5D5B85RTFm61ccC02MJA8R1vRr0u
 bZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693755447; x=1694360247;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5DfTZHovIdUMYDGPmEpLo2QSNP9WxkZc/VjLrGHKaVw=;
 b=D93J1DZGTFlDxqQ8xtRzjeHjIP3PLWF8KGdhFi/eT/I1CcyDrO05rx1JY+HuvQfaAG
 Lb0AEgF3ynGDKHg9rOw+QOcG2xUOYFS5gKhRjVTlEPsYHUKeYawbpo1LZGNhcqYpXHKq
 8tMQGT9JIRP/O2UCXH7QggRnTVn/3L8GK/xNhUkHGOVJ7Lx+zFo6QRdzDLREpLoJ6tiv
 H6aXmgxP5p/WZg32ybnc9Au+EX/wAIHeiu1LtT5Cr6+onNjrZUH6QieYBLs2aqfV4qcR
 BG/aqmAYVrXotFYLst4rwgbuj6dq5B/mE+DO55/CG1VUeYwjaNvlmMwJu706mA2CUiOu
 F89A==
X-Gm-Message-State: AOJu0Ywihby/XTDWBzdBvuPkE3353BkX3ontueDyjpnk/Wa2gmaUC4aT
 lNL1LjxLvQIDiuu46HxxN4I=
X-Google-Smtp-Source: AGHT+IE5Z1iNZPydnLBYJhgD3sVTgJOvwuUpePMXEwNvGIyos7aJM3kzjjf4Kq9Pm6xgerSsySzi1w==
X-Received: by 2002:a17:902:b490:b0:1b8:b3f9:58e5 with SMTP id
 y16-20020a170902b49000b001b8b3f958e5mr5831083plr.38.1693755446919; 
 Sun, 03 Sep 2023 08:37:26 -0700 (PDT)
Received: from localhost.localdomain ([2409:40c2:1011:af96:d1f8:ecc9:8e40:2f2])
 by smtp.gmail.com with ESMTPSA id
 21-20020a170902ee5500b001b03cda6389sm6015697plo.10.2023.09.03.08.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 08:37:26 -0700 (PDT)
From: coolrrsh@gmail.com
To: broonie@kernel.org, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] spi: spi-mpc512x-psc: Fix an unsigned comparison that can
 never be negative
Date: Sun,  3 Sep 2023 21:07:20 +0530
Message-Id: <20230903153720.3801-1-coolrrsh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

From: Rajeshwar R Shinde <coolrrsh@gmail.com>

In struct mpc512x_psc_spi, the variable 'irq' is declared as an
unsigned int. The comparison of variable 'irq'  with signed int
operand is incorrect. Also, the return value from the call to
platform_get_irq(pdev,0) is int and it is assigned to an unsigned
int variable 'irq', thus redeclaring the type of variable 'irq'
to signed int.

This fixes warning such as:
drivers/spi/spi-mpc512x-psc.c:493:5-13:
WARNING: Unsigned expression compared with zero: mps -> irq < 0

Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>

---
v1->v2
changed the commit message

---
 drivers/spi/spi-mpc512x-psc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mpc512x-psc.c b/drivers/spi/spi-mpc512x-psc.c
index 99aeef28a..5cecca1be 100644
--- a/drivers/spi/spi-mpc512x-psc.c
+++ b/drivers/spi/spi-mpc512x-psc.c
@@ -53,7 +53,7 @@ struct mpc512x_psc_spi {
 	int type;
 	void __iomem *psc;
 	struct mpc512x_psc_fifo __iomem *fifo;
-	unsigned int irq;
+	int irq;
 	u8 bits_per_word;
 	u32 mclk_rate;
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
