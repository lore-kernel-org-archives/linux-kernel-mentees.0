Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD07C04A6A
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Aug 2023 14:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0EE560BB3;
	Sun, 13 Aug 2023 14:25:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0EE560BB3
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=V2+H/lgm
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n6nHm1VhrWaG; Sun, 13 Aug 2023 14:25:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id DC88560A80;
	Sun, 13 Aug 2023 14:25:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC88560A80
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C4DECC0072;
	Sun, 13 Aug 2023 14:25:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 80AC8C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 14:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B66940176
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 14:25:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B66940176
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=V2+H/lgm
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0hidBEGtCafL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 14:25:38 +0000 (UTC)
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 62F1F40127
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 14:25:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62F1F40127
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-26b2beae166so936556a91.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 07:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691936738; x=1692541538;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YV2EKTSmF4ZF8Dc6kXfO6H86j6vsqSlyX5k6d36xNA8=;
 b=V2+H/lgmyfoGT60GcYPH/BEH4PJSPhRWustW9sRtT+dyVYgRSMum42e3V/5LHdj4Xn
 4aMY+rm/coQ5rHQ4mzQ43aR5gvj5N52NobDx0z5oy4jTXodp5dgCIOMRW9nQC4d646J9
 FTpZFs+CTb2zkn/AM1mcltQhmgDLorAhXGrcaJjVk3HBPqbqvB4AqMZy8WaYoRxsGLF8
 NqwhSl2u+2/Bd9EajwJUJIlO0k8b+t5uHiOBfG6UtBU1Ecfdi7f/kRGFHP0fpKTGghPo
 hcZ95bDvGrBQqPLavHkr7Z14+GG4TaQifhtJbe9oQDeQun1fGATUZy8SP3pS9E+3yZMd
 gt4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691936738; x=1692541538;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YV2EKTSmF4ZF8Dc6kXfO6H86j6vsqSlyX5k6d36xNA8=;
 b=jdY2t8C6pjdLs6KjWdTCcb3nmpNAdaSu8H+KoiAV10k0hVJcK9xZluJzjKSliOBUb2
 Q3FTq83PHPw23gG0sSOoTVDwF9Fk4CZQlDyecJtMN81WxAL8S9qDY1HD+T4DXE70q8ez
 ixw4UuSC6Ce0mf6wuS1coITugCvrsrQBIHIj+KN8SpflrA3yRbtCPOmoloZxT92MZCb8
 5IF/dYhGGysgnXocq5JnAXzaw/9bLu+9dWVzA6Nqq61vGyNAcx840J0dyXgryZza26mi
 NItSeK7+zUN69o5aBBAMwMPsESJhJZ1WCN5Ggr1Y5o2SSlQYuxP6KpSoVtivWjRU4OcF
 tqwA==
X-Gm-Message-State: AOJu0YyBR0te53TIB8NkDXFXdCxZtX5TNzQ7sNuiR7SYZkE8AeTXg1lJ
 Kt0we5BUeaATO7CEU+vyVyA=
X-Google-Smtp-Source: AGHT+IG0f/0942t0FEoLb+nx/Kb0bjN4H3y6V6fqm5/MzgET3ad3DxqzvTqJRPv86vv+xPCyooHDWA==
X-Received: by 2002:a17:90a:6941:b0:269:3771:7342 with SMTP id
 j1-20020a17090a694100b0026937717342mr4393892pjm.18.1691936737648; 
 Sun, 13 Aug 2023 07:25:37 -0700 (PDT)
Received: from localhost.localdomain ([2409:40c2:1022:f538:d00a:1992:423:e24e])
 by smtp.gmail.com with ESMTPSA id
 n22-20020a170902969600b001b5247cac3dsm7440361plp.110.2023.08.13.07.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Aug 2023 07:25:37 -0700 (PDT)
From: coolrrsh@gmail.com
To: broonie@kernel.org, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] Documentation: spi: Added a valid hyperlink
Date: Sun, 13 Aug 2023 19:55:32 +0530
Message-Id: <20230813142532.150744-1-coolrrsh@gmail.com>
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
