Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 213A6C04E69
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  3 Aug 2023 15:30:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB8EE83B87;
	Thu,  3 Aug 2023 15:30:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB8EE83B87
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=DhC2UPtI
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HtnBkbxWfo-Y; Thu,  3 Aug 2023 15:30:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DDC1483A79;
	Thu,  3 Aug 2023 15:30:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDC1483A79
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AC168C0072;
	Thu,  3 Aug 2023 15:30:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D45FEC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Aug 2023 15:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB2A441EED
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Aug 2023 15:30:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB2A441EED
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=DhC2UPtI
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dH6XtVFpNy5G
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Aug 2023 15:30:20 +0000 (UTC)
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E9A5E41EFC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Aug 2023 15:30:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9A5E41EFC
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-26826f93a1fso660520a91.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 03 Aug 2023 08:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691076619; x=1691681419;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uIsx14YgPYJW5lTdhQ19poi53WNF65BBIWAeixCNdYI=;
 b=DhC2UPtIcqkXYEvGs0tQ5/Dj39qY2eHDZU5BlRigku214hAaVeUkPYgr8FTOOc7iFY
 XNkUCWdJUyPAR002CqlYUdfJ7uE3icNki+9JpzjjYKYaxDAabxguAqVWIsPvXesDmbG5
 bC23Bp0DaSToNjK/Nuq+MItRLMBAoNWMn9jmMq3SPCSW0FHijAqWZdrSB2bXbLYYgE0v
 ClyQxUy0Emai0YS+nMt8vDuLnBuKFEst2lPuhacNt1aSKa5egaVtRfoRSiGzWf8He/z6
 w/DY7dDDIp6zfYCVjq52Ms8HvQR/ZeFNrTf4Jm/8PIYBIfGmd4aG4ZgvytqNPzPKTv+t
 gdtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691076619; x=1691681419;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uIsx14YgPYJW5lTdhQ19poi53WNF65BBIWAeixCNdYI=;
 b=cnRxVPyyEUzcEsLzDpX98EVdA5v/07ChPJMCAipBYh9zwXiIioxmkNMCHuRWdHG0OF
 70Tca1GTB636Qateuc0A6KRMVB9cAyDYWcH4Jm79yG0Ha6pr24gxCKv7TVkD1gA/vdWV
 WzSU2+5a4UwsI0gjwQoP/oeGJPXe3rq0gCw/eLhPCUL6YLvP8G19Ke991wm25mF2qLPo
 5AIkvMRKsIfDicF9xn6kmCm8h23fq7wvL2DgRqfJqzL6m4WPfrxM5waPLHGpXGyKPsrO
 iGBIlEk9a/O1Isj2NYqp4fn13OaKWf+ObQwrro2Vdy4ksB/5d/57gPJmshJzKL/l9PqN
 T+Ww==
X-Gm-Message-State: ABy/qLaRAvaL4UAZPDuQa/qSMrHrzULR3CyOQl3opTy8W1hDOkIEOOwQ
 o5sgaQTfzr2EoUHJGmqgakk=
X-Google-Smtp-Source: APBJJlHPMyTfc1DNnjbkEPW0Bsld07yS3uKJqxfCHrQh85vjAv60tXFYGILAOhju8yCxCBlfW0lYmA==
X-Received: by 2002:a17:90a:17a5:b0:268:ac3:b1f6 with SMTP id
 q34-20020a17090a17a500b002680ac3b1f6mr17030287pja.24.1691076619220; 
 Thu, 03 Aug 2023 08:30:19 -0700 (PDT)
Received: from localhost.localdomain ([2409:40c2:100e:4034:19a2:fe9:9d1b:5681])
 by smtp.gmail.com with ESMTPSA id
 pj1-20020a17090b4f4100b00263d3448141sm102956pjb.8.2023.08.03.08.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 08:30:18 -0700 (PDT)
From: coolrrsh@gmail.com
To: broonie@kernel.org, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 8/8] Added a valid hyperlink
Date: Thu,  3 Aug 2023 21:00:13 +0530
Message-Id: <20230803153014.25378-1-coolrrsh@gmail.com>
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
 Documentation/spi/spi-sc18is602.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/spi/spi-sc18is602.rst b/Documentation/spi/spi-sc18is602.rst
index 4ab9ca346..0dd7e3b95 100644
--- a/Documentation/spi/spi-sc18is602.rst
+++ b/Documentation/spi/spi-sc18is602.rst
@@ -6,7 +6,7 @@ Supported chips:
 
   * NXP SI18IS602/602B/603
 
-    Datasheet: https://www.nxp.com/documents/data_sheet/SC18IS602_602B_603.pdf
+    Datasheet: https://nbviewer.org/github/spidocs/spi-sc18is602/blob/main/spi-sc18is602.pdf
 
 Author:
         Guenter Roeck <linux@roeck-us.net>
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
