Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64762C04FDF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Aug 2023 20:07:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D499360BE1;
	Fri,  4 Aug 2023 20:07:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D499360BE1
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=qRShR6hI
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f2LbL05qE1we; Fri,  4 Aug 2023 20:07:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id DE43060AE3;
	Fri,  4 Aug 2023 20:07:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE43060AE3
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C735FC0071;
	Fri,  4 Aug 2023 20:07:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7BEA3C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 20:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 462AC41841
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 20:07:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 462AC41841
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=qRShR6hI
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uNLWH1wChQzV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 20:07:20 +0000 (UTC)
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 99AB4405F4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 20:07:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99AB4405F4
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-53482b44007so1459689a12.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 04 Aug 2023 13:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691179640; x=1691784440;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TtS43VRN+wQ8hITEdXVbnPip0UGeJtnpKDCpHqfHLZ0=;
 b=qRShR6hITtCBjV+oK0KgZCb+6sv+cl9TdFrYsKET2tthiuttb8IK2pDgViMHnXYsil
 94QrwcteZ6XYPoXXNWkIIo7mjPZOFzWgrdfC0FAqW8CcHawAhI1MgSFsB9ocaGgYLjiG
 W2QR0btpWXuTaFkmRU+Ss3Jmrcc8LyTsG8BYRbTZ3nEFxJCvNkEpeGdKr7Bni+YqwSEK
 psu65ava9S9T3/yZBkLoZNEB/DBNUo8XZXzM1AGYhY4GKD0i/w/lLiZ5nR78O0PU9KxD
 aOfy/hfMj6TOQf6Kb1Dwiqd8OxcPDB3k1Oweh8yDrbm5s7kvxDCX9tVnDOglqWE+6/DN
 nwaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691179640; x=1691784440;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TtS43VRN+wQ8hITEdXVbnPip0UGeJtnpKDCpHqfHLZ0=;
 b=iittHwUJY4sBVcNLCbQ9JC+235+pXLCH9JLNL1uLMIv716ZhX6Sfg8w/EmC7YrDef0
 qbm+5Z3USN8RnR/Phan/D+6CGh0Rwb2XWZf/Rj7500bq1BtQyz1aUffkOvkoWDhaKLOw
 DuhXmeQxGWa8c7ZYdXL2MOErSRyOkmobx55bzQ/y4WER1Dgn1HzbE12Qz1e+MXJpQbUC
 AjALdY2nbL+0NemqNe4k05DTmxlon41KSJ3gGZHau9UDRtZt3Zt5NkdHvcpL7AVGuEFk
 WHXAHqU8WbNgRL0XYFc94yS8DcAi2Au+QaUCUpduP9H2ZpMl+PB/LYp3Ky3vbOPXAENY
 qWow==
X-Gm-Message-State: AOJu0Yyrjb0/yrl7vKh39+72VWTq58dcoFs66UJRvPVNO19jnTBORj8t
 NGjjsaComNY4+2svD7AXEWc=
X-Google-Smtp-Source: AGHT+IEyWUYvrH/JemdEKPGi4U2p6ZES9M//wAnNICsyd8RzpEAx4vwqKv3W+aBTx7dE+oqKc3wacA==
X-Received: by 2002:a17:90b:889:b0:268:352c:9d13 with SMTP id
 bj9-20020a17090b088900b00268352c9d13mr2467096pjb.0.1691179639882; 
 Fri, 04 Aug 2023 13:07:19 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:40c2:1056:ada3:1859:30f6:c95a:3e44])
 by smtp.gmail.com with ESMTPSA id
 ge13-20020a17090b0e0d00b0024e4f169931sm4534070pjb.2.2023.08.04.13.07.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 13:07:19 -0700 (PDT)
From: coolrrsh@gmail.com
To: broonie@kernel.org, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] fixes warning
Date: Sat,  5 Aug 2023 01:37:11 +0530
Message-Id: <20230804200711.65750-2-coolrrsh@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230804200711.65750-1-coolrrsh@gmail.com>
References: <20230804200711.65750-1-coolrrsh@gmail.com>
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

Typecasting the interrupt number from "unsigned int" to "signed int" to compare with 0(signed int by default).
Declaring interrupt number as "signed int" would violate kernel standards. So typecasting is the possible approach.
The fix is for spi-mpc52xx.

This fixes warning such as:
drivers/spi/spi-mpc52xx-psc.c:332:5-13: WARNING: Unsigned expression compared with zero: mps -> irq < 0

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
