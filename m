Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FF9C04A94
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Aug 2023 11:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9C4340179;
	Fri,  4 Aug 2023 11:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9C4340179
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=RkXaPq+y
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e9kyb63fqAGQ; Fri,  4 Aug 2023 11:51:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8EECC42018;
	Fri,  4 Aug 2023 11:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EECC42018
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 687C9C0071;
	Fri,  4 Aug 2023 11:51:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2D41FC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 11:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF63860F15
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 11:51:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF63860F15
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=RkXaPq+y
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CWo9LKcBppcy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 11:51:30 +0000 (UTC)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6B0E160F89
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 11:51:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B0E160F89
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-564b6276941so626804a12.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 04 Aug 2023 04:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691149889; x=1691754689;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e2EtyOVR4achsHfoqHulXQMM4qvU1Tc5rB6swnOUt9A=;
 b=RkXaPq+y0NMC78lUo79YLQxkRdl8QVxoFjh2/Pb8teHzMojIAmXpeIkvM6to9j2877
 ZlWpuWKOaunJeaN0afmlmfGTHThR7/9oH9Cfkmjksy1Hr+lxB2vVnGHuBe8RdqhtS3NQ
 uPNeTOoZhwCHV0zk2g+heC6yoYCdTu59n+tUsBevLutgQ8Yn2cR6lOeG/d2lExMrhWBz
 FxriyZomUg1pWe6+93XUC/2Y5Ch0myj0nvZ5dOM2+4Up6AXxklX1ehN4uwOCY4hJKu9U
 zvPdv3PCad31AL1uoYo0RdQ+9jSA6Z7kR78z518SUTclU2ElQEjfMU+qLcg7sP58AhBw
 rBUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691149889; x=1691754689;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e2EtyOVR4achsHfoqHulXQMM4qvU1Tc5rB6swnOUt9A=;
 b=WLsdimP+gWUw75iXxgftbJAjXNwx07Fn5IQ+4aGImGZTcEtpd66JRA2zZsQSnYSm1n
 W70U4iQEF/tNQoCJxGI7nB5cdWlIIMkQgVh6cBWYqomRkS18M+roSKuZmjBfvq6oPaPu
 8mBGlV01+0u/vIfX++Qq8JqSe/VienaMMbaPi/v/wlLkzgcF/OTBf55eU40kHPd3yVVL
 QbO61HQxZmdcrvalXKmeFh5qsd0A2Wx3WqCVltWaXRO5rd3X+sOQ4YMjj42z7Amjam0+
 9vfGrwhVi/YDBkx6y3xQLGKtEAE8TpuU4hJzYorObpxUQCUZZFP/XcmqKEuSlF1nBb+T
 X82Q==
X-Gm-Message-State: AOJu0YwP5cytSYxdDXK3uh0VD5eorzIVx7kIKUvpw62GUaJTVKTWDV8V
 cAfwIX01n6MuDHvVpzRATW2/qoMDL2I=
X-Google-Smtp-Source: AGHT+IFrlm4tOx+dZl0DNygmKZUm3g3WWUWZy8C2IkoWH/jLQBTmJeONwoqQItdqyH7rurNQ6Cd9rw==
X-Received: by 2002:a17:90a:dc06:b0:261:2a59:dc38 with SMTP id
 i6-20020a17090adc0600b002612a59dc38mr1602346pjv.25.1691149889549; 
 Fri, 04 Aug 2023 04:51:29 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:40c2:1022:c939:1859:30f6:c95a:3e44])
 by smtp.gmail.com with ESMTPSA id
 je19-20020a170903265300b001b9dab0397bsm1587773plb.29.2023.08.04.04.51.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 04:51:29 -0700 (PDT)
From: coolrrsh@gmail.com
To: broonie@kernel.org, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] fixes warning
Date: Fri,  4 Aug 2023 17:21:21 +0530
Message-Id: <20230804115121.34035-2-coolrrsh@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230804115121.34035-1-coolrrsh@gmail.com>
References: <20230804115121.34035-1-coolrrsh@gmail.com>
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

drivers/spi/spi-mpc52xx-psc.c:332:5-13:
WARNING: Unsigned expression compared with zero: mps -> irq < 0

Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>
---
 drivers/spi/spi-mpc52xx-psc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mpc52xx-psc.c b/drivers/spi/spi-mpc52xx-psc.c
index 9a1a080..7452bc9 100644
--- a/drivers/spi/spi-mpc52xx-psc.c
+++ b/drivers/spi/spi-mpc52xx-psc.c
@@ -329,7 +329,7 @@ static int mpc52xx_psc_spi_of_probe(struct platform_device *pdev)
 	mps->fifo = ((void __iomem *)mps->psc) + sizeof(struct mpc52xx_psc);
 
 	mps->irq = platform_get_irq(pdev, 0);
-	if (mps->irq < 0)
+	if ((int)mps->irq < 0)
 		return mps->irq;
 
 	ret = devm_request_irq(dev, mps->irq, mpc52xx_psc_spi_isr, 0,
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
