Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 618A3C001DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Aug 2023 14:49:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D77D86108F;
	Mon,  7 Aug 2023 14:49:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D77D86108F
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=sWF0QXNH
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sakmDWYqd5Uh; Mon,  7 Aug 2023 14:49:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D0A3B61084;
	Mon,  7 Aug 2023 14:49:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0A3B61084
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AE3A3C0071;
	Mon,  7 Aug 2023 14:49:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A3EB7C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Aug 2023 14:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F3C461077
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Aug 2023 14:49:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F3C461077
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pIJ52khVUTlZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Aug 2023 14:49:55 +0000 (UTC)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CD17C606E6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Aug 2023 14:49:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD17C606E6
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-686ed1d2594so4434533b3a.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 07 Aug 2023 07:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691419794; x=1692024594;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=manx55rXTBvaqxGz9G2eNlyGDJ5fD2gP+HFfKEjL4GU=;
 b=sWF0QXNHlaTAVhPmuX6j4ld3K60S6RM56ZBwkgf0Fy933B/1Z1E3ZQAAEnx4cPlkRr
 yeHpVQUWywjzavhwxDy5QkepIkD4gI7T3wGCWGGGh8241VuUM5tLeJ+ZvLm8Xf5zuMJp
 lAn/7oQE7BoPEnms3qqyL9qzLro3+rDBQVUf1FJHFSymrsFnL+29t3JhPLuID/INgaOX
 mZh3Bih+q7vrCr2wf2/XqVg2T/yFo2WSVQt5umEk1SgDH0kXb0xxwGLjBEM1YQLHMxuY
 4jEWkXh+i9NV8oFrSYmDC5zghdVw3JLWktCIohzg3opgqHRwFjMgyMAcTRNbpRTRAlW/
 HJeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691419794; x=1692024594;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=manx55rXTBvaqxGz9G2eNlyGDJ5fD2gP+HFfKEjL4GU=;
 b=VpKcgFT+njatr3Y1Ue04QB758xQf4N5+xD7FPNepXfiQnvVurvooIKP/f1dLnoiqMa
 HoiLQsb7FdCJecIpseUqgf3B8qGYRkeIKrXDJKjh5fkz2PpWs5fllUszMjKTZUp00giq
 g9GsQXKcm7J7lulewBlKRjatAewp0aZHUpj7mOHjLCjQta1M8PDs5Crq5btVlADGP29L
 KMGH3S3Fj3Fc/eoaC5bQHItFXEO2asqspncHiuGof4jCGfyaVt9fYvEYA/7P8XDEDCS1
 7Kgew+88a+8oX4tOEJMe2Fj1StQcTlR5N/61kJFJ0WuySynJNiG0wnnyoXYLD/ZoS91K
 BiBw==
X-Gm-Message-State: AOJu0Yx1zG5wzZlZKTf3hBPhZFd6FmLJ1Ja9YBuEjjNdCbLNvvlG9RP+
 7CotGUxDZFTnR+/V4N/5Zi0=
X-Google-Smtp-Source: AGHT+IHSF2LjhCwFeQ9exe3vk3rKcmGFd9zuiy0O5vO0KOXNIP4cDVzDNZUx2ai2UjTwQ9bvQVghPg==
X-Received: by 2002:a05:6a20:258b:b0:13e:e3aa:d871 with SMTP id
 k11-20020a056a20258b00b0013ee3aad871mr12459029pzd.53.1691419793906; 
 Mon, 07 Aug 2023 07:49:53 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:40c2:1035:32cd:7d2b:8acf:815f:3f79])
 by smtp.gmail.com with ESMTPSA id
 q24-20020a62e118000000b006826df9e286sm6417461pfh.143.2023.08.07.07.49.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 07:49:50 -0700 (PDT)
From: coolrrsh@gmail.com
To: broonie@kernel.org, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] spi: spi-mpc512x-psc: Fix an unsigned comparison that can
 never be negative 
Date: Mon,  7 Aug 2023 20:19:41 +0530
Message-Id: <20230807144942.30317-1-coolrrsh@gmail.com>
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
