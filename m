Return-Path: <SRS0=0o+h=I3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68B4AC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Mar 2021 13:51:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA4EB6198F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Mar 2021 13:51:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA4EB6198F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A928C8377F;
	Mon, 29 Mar 2021 13:51:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sAvDmJoZUEfV; Mon, 29 Mar 2021 13:51:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id C347982E1A;
	Mon, 29 Mar 2021 13:51:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 90E4EC000B;
	Mon, 29 Mar 2021 13:51:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E4AE7C000A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 13:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4207400E1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 13:51:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mOpj_4qvCJRS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 13:51:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CC325400A8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 13:51:20 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 kk2-20020a17090b4a02b02900c777aa746fso5937183pjb.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 06:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=g6MGypQezVtHLiXCLKeIkg+BTfToRXpmNx+Fhvih524=;
 b=RmZVrOs/Xv6ZMvjON31XrBzpiNonLabyrdWo/pSVmegntHjtDII1lrl3jhlny0jSfe
 Yw7ih/0CCagLRHylRs4mEsI2QDpW68bDZXQ75S4u2VzCdI+hzkamqFcvcMj5B5otf8YI
 MmRTxtANSQoN+iy0EUJqvCAQjHFgiLyXtOCQgtSHH0jZxfZ6WZLz2brskEo3vZrm12yZ
 d0ANtskJRkXCR/GL1QI/zUup/m/0//seluOxapFIVFqCmNcwcdo0jzO9+atMN1t/QTnP
 LMCrxHAeGZLib9SjD9IVj1W+GN3ulHLiD0qBp/0Hits1Hl3ZrO4UuYWJpAlpf9w9S5y8
 KkhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=g6MGypQezVtHLiXCLKeIkg+BTfToRXpmNx+Fhvih524=;
 b=YbxmvxOSM5IP5AjYnFc/PQ8KEYIGKn3oRxTEVAz7ojXu44OMUZ8hFVzCUSyC1G9QJ/
 P/Nq6tK8p8lyui9XkyishUNaC2vVQwlKhyVL3E57eOxJHwgOoCyxGr7IU+IxI5LIhODc
 pbwX7mhMYamitsDUprgaGfjvr/gqPxFDr+lvGhVnOnEDJVebl4btgHtTP6lZ+5GUlojF
 FmUuDgQaOJt4aQjX6Yf7i4gMxNGiUDABuyC5Im40o42s9mEOYZuhCSdVONAokysNyefS
 YLTfn2c4ZVSkN2Lgaq6FveMEnb6sj8YaP/p0WYZydZTjUQ9i5g+E7ZXqzeRapLyDRtwF
 Y/Aw==
X-Gm-Message-State: AOAM530lPNnhXoOzATraMzWk9Z/I/8TogFDjGFFnBhh4s1T7oLnT+I6o
 a1Io92Hm6NOCN4s197z6HF0=
X-Google-Smtp-Source: ABdhPJwOf99fPjyShSZ07RL9cICcdUqyhTG71ttWjJnb7jcJExZZeM7z9zMCbhmt2Dw5Q2iN/dvltg==
X-Received: by 2002:a17:902:d202:b029:e4:55cd:dde8 with SMTP id
 t2-20020a170902d202b02900e455cddde8mr28519192ply.51.1617025880092; 
 Mon, 29 Mar 2021 06:51:20 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a089:4ed:8f53:adc7:b574])
 by smtp.googlemail.com with ESMTPSA id
 w84sm17429226pfc.142.2021.03.29.06.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 06:51:19 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: balbi@kernel.org
Subject: [PATCH] usb: dwc3: fix incorrect kernel-doc comment syntax in files
Date: Mon, 29 Mar 2021 19:21:08 +0530
Message-Id: <20210329135108.27128-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-usb@vger.kernel.org, linux-doc@vger.kernel.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

The opening comment mark '/**' is used for highlighting the beginning of
kernel-doc comments.
There are certain files in drivers/usb/dwc3, which follow this syntax,
but the content inside does not comply with kernel-doc.
Such lines were probably not meant for kernel-doc parsing, but are parsed
due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
causes unexpected warnings from kernel-doc.

E.g., presence of kernel-doc like comment in drivers/usb/dwc3/io.h at
header causes this warnings by kernel-doc:
"warning: expecting prototype for h(). Prototype was for __DRIVERS_USB_DWC3_IO_H() instead"

Similarly for other files too.

Provide a simple fix by replacing such occurrences with general comment
format, i.e. '/*', to prevent kernel-doc from parsing it.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
* Applies perfectly on next-20210326

 drivers/usb/dwc3/debug.h         | 2 +-
 drivers/usb/dwc3/debugfs.c       | 2 +-
 drivers/usb/dwc3/dwc3-keystone.c | 2 +-
 drivers/usb/dwc3/dwc3-pci.c      | 2 +-
 drivers/usb/dwc3/io.h            | 2 +-
 drivers/usb/dwc3/trace.c         | 2 +-
 drivers/usb/dwc3/trace.h         | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/dwc3/debug.h b/drivers/usb/dwc3/debug.h
index 8ab394942360..db231de46bb3 100644
--- a/drivers/usb/dwc3/debug.h
+++ b/drivers/usb/dwc3/debug.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-/**
+/*
  * debug.h - DesignWare USB3 DRD Controller Debug Header
  *
  * Copyright (C) 2010-2011 Texas Instruments Incorporated - https://www.ti.com
diff --git a/drivers/usb/dwc3/debugfs.c b/drivers/usb/dwc3/debugfs.c
index 5da4f6082d93..b0e3f434d219 100644
--- a/drivers/usb/dwc3/debugfs.c
+++ b/drivers/usb/dwc3/debugfs.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-/**
+/*
  * debugfs.c - DesignWare USB3 DRD Controller DebugFS file
  *
  * Copyright (C) 2010-2011 Texas Instruments Incorporated - https://www.ti.com
diff --git a/drivers/usb/dwc3/dwc3-keystone.c b/drivers/usb/dwc3/dwc3-keystone.c
index 057056c0975e..1317959294e6 100644
--- a/drivers/usb/dwc3/dwc3-keystone.c
+++ b/drivers/usb/dwc3/dwc3-keystone.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-/**
+/*
  * dwc3-keystone.c - Keystone Specific Glue layer
  *
  * Copyright (C) 2010-2013 Texas Instruments Incorporated - https://www.ti.com
diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c
index 4c5c6972124a..4698c43af5ae 100644
--- a/drivers/usb/dwc3/dwc3-pci.c
+++ b/drivers/usb/dwc3/dwc3-pci.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-/**
+/*
  * dwc3-pci.c - PCI Specific glue layer
  *
  * Copyright (C) 2010-2011 Texas Instruments Incorporated - https://www.ti.com
diff --git a/drivers/usb/dwc3/io.h b/drivers/usb/dwc3/io.h
index 76b73b116862..1e96ea339d48 100644
--- a/drivers/usb/dwc3/io.h
+++ b/drivers/usb/dwc3/io.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-/**
+/*
  * io.h - DesignWare USB3 DRD IO Header
  *
  * Copyright (C) 2010-2011 Texas Instruments Incorporated - https://www.ti.com
diff --git a/drivers/usb/dwc3/trace.c b/drivers/usb/dwc3/trace.c
index 1b45a9723eeb..088995885678 100644
--- a/drivers/usb/dwc3/trace.c
+++ b/drivers/usb/dwc3/trace.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-/**
+/*
  * trace.c - DesignWare USB3 DRD Controller Trace Support
  *
  * Copyright (C) 2014 Texas Instruments Incorporated - https://www.ti.com
diff --git a/drivers/usb/dwc3/trace.h b/drivers/usb/dwc3/trace.h
index 97f4f1125a41..60883268adfc 100644
--- a/drivers/usb/dwc3/trace.h
+++ b/drivers/usb/dwc3/trace.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-/**
+/*
  * trace.h - DesignWare USB3 DRD Controller Trace Support
  *
  * Copyright (C) 2014 Texas Instruments Incorporated - https://www.ti.com
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
