Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64767C001DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Aug 2023 14:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF82761078;
	Mon,  7 Aug 2023 14:50:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF82761078
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Sroup4QU
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZUxsU5tu26cz; Mon,  7 Aug 2023 14:50:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 0241F61085;
	Mon,  7 Aug 2023 14:50:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0241F61085
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D68C8C0071;
	Mon,  7 Aug 2023 14:50:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 54281C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Aug 2023 14:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36BB6408FB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Aug 2023 14:50:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36BB6408FB
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Sroup4QU
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Goj2COpqqm7K
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Aug 2023 14:49:59 +0000 (UTC)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6D648401C3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Aug 2023 14:49:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D648401C3
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-686f0d66652so4379726b3a.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 07 Aug 2023 07:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691419798; x=1692024598;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MVJ1NMXrZLpfm1TC5o9BlBqLzQ7UhV92PKS85S8rFNs=;
 b=Sroup4QU3HZ7LerI3fPwMoENwg0kBChAlLlahHdIe5ucOHVSbEpVo+ZcfpOC86jqnL
 41WK8xWU6Sb4NixCabglANoa8//xn/56r6m1jWsHNhEug7rzGL+rW/dsZsVn5ob4YH+R
 L3i91RmJmpV9CNCnrppAQS3BsumCDChhd4De712R5yR2/KV7DhkKQaWz+QlGHJWXs2Yw
 WFm+A2/3VqAJSkdS1khuK74NF4YQ9YZbGj9BJO2IcwUYwUJAMF4OZw5+HBoNvMuvyAwC
 QfIcb3XiJ4U6EX3u5KEvgf9i7ypvt8VVsT3JiGYJMHS4NjPOn1CeK/HOCn15tsACs+3a
 q/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691419798; x=1692024598;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MVJ1NMXrZLpfm1TC5o9BlBqLzQ7UhV92PKS85S8rFNs=;
 b=VnMU4Te3bxIev+JlPFfxys/mLbpkP548KkLcOfIFgS+G4nuTPwnjgX5GjRj/1WBfGy
 03zfgFewSMlw2sSV5ytW4YjVhjOhrILImSrUmEifKkqku2N6wxGQ/A8NIggXQ1/cXJOW
 PixnZUU5CZhxYKBzFOy4KOXS4KJ2sIFhD9+ZP21ejbZmvuMJbzSDK5yso5L/VjVH5vLG
 8C/Ei6U5TkU6VTwHwSOrAuBQsSTAmS98DFa1bvc00N51Xun9QAXQ2LqsZRO5jx8+0tqi
 18PQ6LN444izBT4NXSWx5n1ZgbG46ObDCgNMfh0w8tfpCLK2Q8J8shukb9rZRY5vj+mv
 iInw==
X-Gm-Message-State: AOJu0YwiRNuf09xluTdDnY4HtjoS66UaHPWmWnQDDqFbTHsV8ISg0XLy
 8JztwHgQwRLyNIRbwv2o7h4=
X-Google-Smtp-Source: AGHT+IFxCA9Hh9AGaKvSkXYR503KWYhOuOlfrvrHCVIxaYrFzl1ziRZ0VuWFV8rpmy8d+cxHJY21ag==
X-Received: by 2002:a05:6a20:549f:b0:12f:bc36:4c67 with SMTP id
 i31-20020a056a20549f00b0012fbc364c67mr12099566pzk.61.1691419798413; 
 Mon, 07 Aug 2023 07:49:58 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:40c2:1035:32cd:7d2b:8acf:815f:3f79])
 by smtp.gmail.com with ESMTPSA id
 q24-20020a62e118000000b006826df9e286sm6417461pfh.143.2023.08.07.07.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 07:49:56 -0700 (PDT)
From: coolrrsh@gmail.com
To: broonie@kernel.org, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] spi: spi-mpc52xx-psc: Fix an unsigned comparison that can
 never be negative 
Date: Mon,  7 Aug 2023 20:19:42 +0530
Message-Id: <20230807144942.30317-2-coolrrsh@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230807144942.30317-1-coolrrsh@gmail.com>
References: <20230807144942.30317-1-coolrrsh@gmail.com>
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

In struct mpc52xx_psc_spi, the variable 'irq' is declared as an unsigned int.
The comparison of variable 'irq'  with signed int operand is incorrect. Also,
the return value from the call to platform_get_irq(pdev,0) is int and it is 
assigned to an unsigned int variable 'irq', thus redeclaring the type of
variable 'irq' to signed int.

This fixes warning such as:
drivers/spi/spi-mpc52xx-psc.c:332:5-13:
WARNING: Unsigned expression compared with zero: mps -> irq < 0

Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>

---
v1->v2
changed the commit message 

---
 drivers/spi/spi-mpc52xx-psc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mpc52xx-psc.c b/drivers/spi/spi-mpc52xx-psc.c
index 9a1a080fb..795c08594 100644
--- a/drivers/spi/spi-mpc52xx-psc.c
+++ b/drivers/spi/spi-mpc52xx-psc.c
@@ -29,7 +29,7 @@ struct mpc52xx_psc_spi {
 	/* driver internal data */
 	struct mpc52xx_psc __iomem *psc;
 	struct mpc52xx_psc_fifo __iomem *fifo;
-	unsigned int irq;
+	int irq;
 	u8 bits_per_word;
 
 	struct completion done;
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
