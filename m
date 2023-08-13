Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A86C001DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Aug 2023 14:25:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27BEB4038B;
	Sun, 13 Aug 2023 14:25:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27BEB4038B
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Luouxj5L
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id djKJiElzNARM; Sun, 13 Aug 2023 14:25:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 1D5BA40127;
	Sun, 13 Aug 2023 14:25:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D5BA40127
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F0F8CC0072;
	Sun, 13 Aug 2023 14:25:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A1234C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 14:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2DF08817A7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 14:25:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DF08817A7
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Luouxj5L
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FRkB1QnvHn6R
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 14:25:52 +0000 (UTC)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 47EE3817A2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 14:25:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47EE3817A2
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-686e0213c0bso2223649b3a.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 07:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691936751; x=1692541551;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u+Bbe2ATRUNZ2U0iDFw/4l0wbzl0ApUtMQF0UvPw22Q=;
 b=Luouxj5LwU8rtQTxzvqFr9qhwbgELf2N2f8Cy0zZbcAcaRzDs1EfNC6Io7lAcUBrXc
 zOC5Yv3xoAbrAKvAWH5jug8gxRatuXtAjL4IYR18uI5n2EcnbUB8giIJMclwT2ZLInW7
 zxp57FEHcXTBMizJUwRPcv4YaGmyJEoWx9t8W1lgcrXt7B4kc33uDFF0RULSa5tmdr2s
 hBYGATj9ySQ4VEEJur46OPikEm+JsY03JmGoN0rH95c4GVfg1CLBs/9Ma/tCrxYhNiO2
 xUK5bkNd3gPnp9w6tTaihYx0hrA6muz9oixiGsNnFaQn9Lq8ZfzHIKzl08njGgYgiDjB
 Q1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691936751; x=1692541551;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u+Bbe2ATRUNZ2U0iDFw/4l0wbzl0ApUtMQF0UvPw22Q=;
 b=NMS52GdNVdvETwerkzngjVaQGEz2EsecmwDUKkf/lx7jsbyEWQcCUHOvHWBaziR862
 wKXA2pLy7RAAxwH7wttOCUs2VjChWfZzgimVE5f9mRJOWXrqplWLff/emhAKGy0KzXgp
 N3rkClyyALGLzQjuH/wbvIIk+J7pAVxiS5sSUtxnMU6zNpowGyhcN5w4s8FTeytM2W4a
 n/dR1Ah/FW6He1zJPSRnfKGxPxT0xE/J6ScY4WxfzNxzu/FJtzZe0uplnTIBxmJTq3WD
 ItMba81ygFQfW2+RpR2yalmgMfaJwdA6HTj57wlmTfJ94CTpAh0rHMIM0TMWGk0IXknx
 Z/JQ==
X-Gm-Message-State: AOJu0Yxd8liCQY/ST1T+rEzpUr9ZSYBOrZH8M1TpcIuQOqk6/1D8xWAt
 g8SFVGpQ3UhjeAyrFgTYeqDFQncvo4g=
X-Google-Smtp-Source: AGHT+IHmz/gnjtoFiqwnQfwKPpTKrfpr3OSJ3X5BmGB76Tvs5u7NacAzNSMRJtPnOXO61WT/7vXimw==
X-Received: by 2002:a05:6a20:100d:b0:13c:8e50:34b8 with SMTP id
 gs13-20020a056a20100d00b0013c8e5034b8mr4980193pzc.35.1691936751531; 
 Sun, 13 Aug 2023 07:25:51 -0700 (PDT)
Received: from localhost.localdomain ([2409:40c2:1022:f538:d00a:1992:423:e24e])
 by smtp.gmail.com with ESMTPSA id
 fk1-20020a056a003a8100b006765cb3255asm6296626pfb.68.2023.08.13.07.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Aug 2023 07:25:51 -0700 (PDT)
From: coolrrsh@gmail.com
To: broonie@kernel.org, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] Documentation: spi: Added a valid hyperlink
Date: Sun, 13 Aug 2023 19:55:46 +0530
Message-Id: <20230813142546.150799-1-coolrrsh@gmail.com>
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

The hyperlink to datasheet in website are subject to change.
Created stable hyperlinks to view datasheets.

Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>

---
v1->v2
changed the commit message

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
