Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F45C00528
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Aug 2023 11:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88DEC60EF7;
	Fri,  4 Aug 2023 11:51:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88DEC60EF7
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Q+yg1h+A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 15txa5Y9tlTS; Fri,  4 Aug 2023 11:51:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 76A1A60F15;
	Fri,  4 Aug 2023 11:51:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76A1A60F15
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 49B94C0071;
	Fri,  4 Aug 2023 11:51:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 922D9C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 11:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66CA1820A8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 11:51:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66CA1820A8
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Q+yg1h+A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5GmMdeoG-Nuy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 11:51:27 +0000 (UTC)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D007E81A9C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 11:51:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D007E81A9C
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1b9c5e07c1bso17254015ad.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 04 Aug 2023 04:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691149887; x=1691754687;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EpCoMosoIXOO1/gDhVlRe3nSdzU9AxF1CUsvfhuvl64=;
 b=Q+yg1h+AqmExFO6I6PkkJXrz9I9Q0PZyKNpQsaP5rDr7Yp2ajIjHjOxLY1wIktXqzL
 8ovTZi9IZViFTdNhfs1tzTNtnjrJIRji390eUIhUU0AyRIghbjY7PbBvTTlOC1NjVmiy
 Spt3ki4F0evyXTOXxIJnRUe7P3e6bgdj/W/s7qUOVmtlWnCbgSu5rkMRgIoOY5G69lQG
 BrwBmcUnl6/Vhe2Pod6t6yKtH7tjzFqZ1JOYu8/11D2QRCaZGf0//ROoBQEGMm8LyArY
 PSivE6WHV3zUUnOc6Cosa9OD/JQQYPSEWNe2CDi+bQkxF0FxETe34gnMgi25hFftMi5e
 OhNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691149887; x=1691754687;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EpCoMosoIXOO1/gDhVlRe3nSdzU9AxF1CUsvfhuvl64=;
 b=PN+bLz76TeNP1vMvWxcNib4FL2BQag31lrBoFe0WTTUsOmxcukcW/Zx7+hZ0mxbc27
 VqZS/DALHbHyVFnQlxorchW7VH+Os7RT5+mIIypxdBjFruJqnuSRtxBDAJQ9vVsMGTHc
 /709vvpvV7OzvTFcHtWjl1Dnj6TJVqB2c8Rns7iNz2ElbxdIaaqCm8DO7lIj0gwUz85k
 jz6aMI0y205VRBWeTQRL8sLpjdFA39IGVdKOX+y3u72SM4B06ABEwvFU/58oov+bN1Rb
 TY1xKvOeRY4vmm2WkJaFvRoJszCHx/5H5GTMog8c1YpkJx9rlCzscRKCMXgy08ShyQv5
 /Fkg==
X-Gm-Message-State: AOJu0YzGk2A3o1gZgVQy4KEij5DOmIQ93Dyaaf8M1Hqmijwu57BMrZYa
 0/5wPDCa69qRtZ8/AeFZgkM=
X-Google-Smtp-Source: AGHT+IH8TzRuRlHcKcXfFTrYBjw0CCIesfPCEfbmWNWXvGmi6iSEXk400b8aRkLxVaP8Yf4nSuGW5g==
X-Received: by 2002:a17:903:41c1:b0:1b1:9233:bbf5 with SMTP id
 u1-20020a17090341c100b001b19233bbf5mr1811114ple.57.1691149887016; 
 Fri, 04 Aug 2023 04:51:27 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:40c2:1022:c939:1859:30f6:c95a:3e44])
 by smtp.gmail.com with ESMTPSA id
 je19-20020a170903265300b001b9dab0397bsm1587773plb.29.2023.08.04.04.51.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 04:51:26 -0700 (PDT)
From: coolrrsh@gmail.com
To: broonie@kernel.org, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] fixes warning
Date: Fri,  4 Aug 2023 17:21:20 +0530
Message-Id: <20230804115121.34035-1-coolrrsh@gmail.com>
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

drivers/spi/spi-mpc512x-psc.c:493:5-13:
WARNING: Unsigned expression compared with zero: mps -> irq < 0

Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>
---
 drivers/spi/spi-mpc512x-psc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mpc512x-psc.c b/drivers/spi/spi-mpc512x-psc.c
index 99aeef2..50a4f31 100644
--- a/drivers/spi/spi-mpc512x-psc.c
+++ b/drivers/spi/spi-mpc512x-psc.c
@@ -490,7 +490,7 @@ static int mpc512x_psc_spi_of_probe(struct platform_device *pdev)
 		(struct mpc512x_psc_fifo *)(tempp + sizeof(struct mpc52xx_psc));
 
 	mps->irq = platform_get_irq(pdev, 0);
-	if (mps->irq < 0)
+	if ((int)mps->irq < 0)
 		return mps->irq;
 
 	ret = devm_request_irq(dev, mps->irq, mpc512x_psc_spi_isr, IRQF_SHARED,
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
