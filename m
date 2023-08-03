Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 411A0EB64DD
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  3 Aug 2023 15:30:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7DF44007C;
	Thu,  3 Aug 2023 15:30:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7DF44007C
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=n3Y1l7AK
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rG6jImi0Kzcq; Thu,  3 Aug 2023 15:30:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id EF81E41EED;
	Thu,  3 Aug 2023 15:30:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF81E41EED
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CEA9DC0072;
	Thu,  3 Aug 2023 15:30:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 74CD0C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Aug 2023 15:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 429FE60D59
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Aug 2023 15:30:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 429FE60D59
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=n3Y1l7AK
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YIwVvXiGtxRu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Aug 2023 15:30:23 +0000 (UTC)
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 05ECD60AE5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Aug 2023 15:30:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05ECD60AE5
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-1bb571ea965so763277fac.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 03 Aug 2023 08:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691076622; x=1691681422;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sj2V1iph8YBdqh+zvb4+vH4P/YUd3FpRJz1b4pwKt6A=;
 b=n3Y1l7AKPSXX4w1grOcTNKAqKhG+sGcvMyBTnuU32hRaLq4BaIkV4fZCj8uiIDRt+c
 B1Cor2+4wwLs1WuL9h7wjZr1L2VoE69YWNRFM3AXAmEomfMVCmQfgAC5G8nK2qw4KS/C
 1CgEaZr/dA4kZZd694TMOjOTTspRxEy6NFcbEH/hRKieZkZziCsXZY3aoo9FXcRMcv91
 1IvjYg9wOKFZJB1oEg0SKuHoiyqPoQn2jO+Bqh9o52tOldrqiwvNFCo+cPY4PbgNpW1x
 HAN4mP8aJliHFaYePtgqKh97I8cJMlAEEbWJYXufvQdYUPY780rwS74lHwYkrF/QNEM/
 r+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691076622; x=1691681422;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sj2V1iph8YBdqh+zvb4+vH4P/YUd3FpRJz1b4pwKt6A=;
 b=PrLLDTeCfl+n54KOMvCb+ynk+HwMIj/7/EWg5/NmsLGEqpsycFkTtOFGM7QX7VJdKx
 ZqKkZa6GBMlGymqWeQhddOBArQ80hqPYBchNg1/uc3UHVcx2H2vygVxHtBTf+7j4MMEr
 fwXWTg4Mn7r1PBJpdpk7QpMrDKZXrBHTuBkNwbSHTjZTXFFs0ISrelBIrxXDGlA++qNm
 CRomh0Y+r1K2fwkWhwbJerANQHcfTIVEb639dmicarvykw86j+S4DIcfnpqZwhSCNCHB
 E39Ba1ER9de9VISziuGl0+pLaj7SmFY8m5LtglbXQemHIzvDECxwS6wIDJCt4n9LI6mo
 G0Ig==
X-Gm-Message-State: ABy/qLaI8a9nVG6fXOcPVkpm8LmYK5ECkA6/WAADEU7RmWR/W3hjDW/Y
 7GJuOVvtx3oXVB1nWpDJfBM=
X-Google-Smtp-Source: APBJJlHHZyDlNjTGFtdITWvrpAZ3sGKbPyP/i7T7vXVHb+u+jTw8dapdFEE8xbRF4xtajbRtiyo5+g==
X-Received: by 2002:a05:6870:538c:b0:19f:4dc2:428e with SMTP id
 h12-20020a056870538c00b0019f4dc2428emr20708123oan.14.1691076621854; 
 Thu, 03 Aug 2023 08:30:21 -0700 (PDT)
Received: from localhost.localdomain ([2409:40c2:100e:4034:19a2:fe9:9d1b:5681])
 by smtp.gmail.com with ESMTPSA id
 pj1-20020a17090b4f4100b00263d3448141sm102956pjb.8.2023.08.03.08.30.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 08:30:21 -0700 (PDT)
From: coolrrsh@gmail.com
To: broonie@kernel.org, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 10/10] Added a valid hyperlink
Date: Thu,  3 Aug 2023 21:00:14 +0530
Message-Id: <20230803153014.25378-2-coolrrsh@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230803153014.25378-1-coolrrsh@gmail.com>
References: <20230803153014.25378-1-coolrrsh@gmail.com>
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

The hyperlink to datasheet in website are subject to change.
Created stable hyperlinks to view datasheets.

Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>
---
 Documentation/spi/spi-lm70llp.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/spi/spi-lm70llp.rst b/Documentation/spi/spi-lm70llp.rst
index 0144e12d9..f6a416468 100644
--- a/Documentation/spi/spi-lm70llp.rst
+++ b/Documentation/spi/spi-lm70llp.rst
@@ -6,7 +6,7 @@ Supported board/chip:
 
   * National Semiconductor LM70 LLP evaluation board
 
-    Datasheet: http://www.national.com/pf/LM/LM70.html
+    Datasheet: https://nbviewer.org/github/spidocs/spi-lm70llp/blob/main/LM70-LLP.pdf
 
 Author:
         Kaiwan N Billimoria <kaiwan@designergraphix.com>
@@ -28,7 +28,7 @@ Hardware Interfacing
 The schematic for this particular board (the LM70EVAL-LLP) is
 available (on page 4) here:
 
-  http://www.national.com/appinfo/tempsensors/files/LM70LLPEVALmanual.pdf
+  https://nbviewer.org/github/spidocs/spi-lm70llp/blob/main/LM70-LLP_schematic.pdf
 
 The hardware interfacing on the LM70 LLP eval board is as follows:
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
