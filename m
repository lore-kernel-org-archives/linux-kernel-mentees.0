Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F214FC00528
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  6 Aug 2023 08:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 674A14031D;
	Sun,  6 Aug 2023 08:37:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 674A14031D
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=KzgTJeju
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ucO6QEyOgD2A; Sun,  6 Aug 2023 08:37:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7C23940134;
	Sun,  6 Aug 2023 08:37:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C23940134
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60E8CC0072;
	Sun,  6 Aug 2023 08:37:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 97F4BC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Aug 2023 08:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D69F4022B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Aug 2023 08:37:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D69F4022B
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=KzgTJeju
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H6x-yf_qVP8x
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Aug 2023 08:37:40 +0000 (UTC)
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9F5A440EC1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Aug 2023 08:37:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F5A440EC1
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-55b0e7efb1cso1854449a12.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 06 Aug 2023 01:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691311060; x=1691915860;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=y/VsbE0slEMRhZ8TGMIdWLlmOlT7Ip9MoAgWWsTSAm8=;
 b=KzgTJejuxzMjf7uHhJZ1yYeDin/Jxg2lr0jvwD1a2ZB0FOHX1cWxEidzAj2xBDkv1A
 6RZGS47QIYBBfFWTWHCIJAccg2aNjxoSrEz7VGUNQWOIYeD1GtiwBFC7ZOjw0Tt/eLis
 dSVrChsTtepG4sT13WoxwAq2bULnjIeo93EZmwLYOTO7EevsicYjme9BfsYwxKPmCzTW
 sxopvfmh3WgJjbierzs+xoEm0BzzA8X/+Lq4ConhV6PqcM+67bwrwn2ZPatD02udTbqW
 0oBWwcW3wBlkmBSNRmpFiciBUThVlLiUlvHvfRRK6/8NsW1aW/Bt/TdXcvmGZFqg65+w
 H5cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691311060; x=1691915860;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y/VsbE0slEMRhZ8TGMIdWLlmOlT7Ip9MoAgWWsTSAm8=;
 b=BWeW5Hb9QBQXRlJSS5Icm3I22JZS28yt0GgYMyJH+y9Dig/ppo8No83TQ1W0fDRHUV
 CVeMF5ttOKE8HqjW1yer2ngOWmG+ise6F6iXDXdfjXUE19V4rU3RGYMhkp/3hHJ91/Gq
 G1/BjOc786HWM9bya6tXpPGIRh4RJm6c2nKcNjvroPHypMcI2STeeDSJhOyzusRQvGc/
 rstyOcGoLR5CLa2gjjKNhodh5I4jR74RpXV9PdhU52RuRpVWanQ4sgbXvv3ag/CVqZKq
 yA571E5lZeoWJDiy8nbnxFZhZoHeII/Tc74JJKHYxxBQx8voy1/QLhyX0PNi8Bfatqua
 Tt4Q==
X-Gm-Message-State: AOJu0Yx0L6uKTJ8k37ZAJA4fbP2M0bA66uBTdrYwVk8BTh0IEDHgSKJf
 r3H9px0R9ByIHfSAnjLnnK8=
X-Google-Smtp-Source: AGHT+IG7mAl6KpNhqZSM2ZAq57uyOgALa53jlvIRprYxgC5XwMf2mDueVaeumtqB2y4Dp2eKUnCFQQ==
X-Received: by 2002:a17:90a:f287:b0:268:5558:de4c with SMTP id
 fs7-20020a17090af28700b002685558de4cmr4980313pjb.38.1691311059896; 
 Sun, 06 Aug 2023 01:37:39 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:40c2:1028:5dc5:7c0a:52e1:6b87:38ef])
 by smtp.gmail.com with ESMTPSA id
 i4-20020a17090a64c400b0026307fa0442sm6580403pjm.49.2023.08.06.01.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Aug 2023 01:37:39 -0700 (PDT)
From: coolrrsh@gmail.com
To: broonie@kernel.org, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] spi: spi-mpc512x-psc: Fix an unsigned comparison that can
 never be negative 
Date: Sun,  6 Aug 2023 14:07:33 +0530
Message-Id: <20230806083734.7685-1-coolrrsh@gmail.com>
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

In struct mpc512x_psc_spi, the variable 'irq' is declared as an unsigned int.
The comparison of variable 'irq'  with signed int operand is incorrect. Also,
the return value from the call to platform_get_irq(pdev,0) is int and it is 
assigned to an unsigned int variable 'irq', thus redeclaring the type of 
variable 'irq' to signed int.

This fixes warning such as:
drivers/spi/spi-mpc512x-psc.c:493:5-13: 
WARNING: Unsigned expression compared with zero: mps -> irq < 0

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
