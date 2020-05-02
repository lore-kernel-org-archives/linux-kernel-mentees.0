Return-Path: <SRS0=N6Le=6Q=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72F83C47254
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  2 May 2020 03:22:56 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45E852184D
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  2 May 2020 03:22:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PKcEoF52"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45E852184D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 39A5C8844C;
	Sat,  2 May 2020 03:22:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IRy2DlC95vFM; Sat,  2 May 2020 03:22:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 92945883CC;
	Sat,  2 May 2020 03:22:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 817EAC0864;
	Sat,  2 May 2020 03:22:55 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4D675C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 May 2020 03:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4A34A87572
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 May 2020 03:22:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2JvW06zYkXrD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 May 2020 03:22:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9F06387552
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 May 2020 03:22:53 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id f83so3848115qke.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 01 May 2020 20:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wLSxbksYe7vFAl+dAChpvHeW8F9QhUMpS/+xzmVyhR4=;
 b=PKcEoF52OoEQuSEvPnG7/F79zFA430vYjff3uLEaOAC77ileYYAVSA3SXQsDIKw+M3
 HcDrfcuFrS/QUQDnpcCexhoyiNE6QsrA6UfmN9q4uiJTghyxQeUsPDShKXdG/o3qdYrU
 9zeUjwc62srL/KTat/i1wO8BwvcelbUaGQUnZ4LmUpjrXbThKdrTP0i33IZVSfiIXT7W
 S7hxlYaUwhbEEaJkdnH+zwPfiAqI8DD3GGTLqEd6e0e9T+MDbfP3IVSDoTgMEDF0h/HM
 tsdL8nF1s3fr3RLhxwQybv0usgeJCk5BKLikcnCnJv0EdFROOp9pOVkcxoG2XGRwlTWj
 Ndbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wLSxbksYe7vFAl+dAChpvHeW8F9QhUMpS/+xzmVyhR4=;
 b=snYiUCUjsSNM8iCDGG1VbNghyjszkgDuvdlt5ez3Z8qYpVMOSRsHW7WCoFyHx4Dns7
 yWdVLlrr3Q0yL0yMCtNht/ALfpO4XPM54PmXve/EnJyqKKZ4OmstFsgauAU0epSqJb7j
 W5IYuD85cCXyrHedM9plWTU/6jqCdPPUoyG3/EdkCK9Kv9rlvgE/B2RAZPfB+U95748/
 lpPdgN9yQMVWKmN3eQ9lkU1YNEUNgPRYOX7frwmHte0tSWnk9cenTEUClsNE7Tc/+fo2
 1iYwcaNNzuRdrlmK0mv5lAwXeZgukLADWkkJK17hSXKv+2hia0j9AATaliGN1sRMu8IP
 d1LQ==
X-Gm-Message-State: AGi0PuZBCkfniMwXUr3rLByACSMCUd7pDL8bL7YO0mwxwyEyJayXXR5d
 LFV32Vo5rv0F1k2tixmPb1ob/eUVXY0=
X-Google-Smtp-Source: APiQypJb3IAWNuPS7msR8bj0xvAODcxZmScGMJAQQ2/JpuoFHKaMLO78YDuwxGvzgaCnE85MOVC0nw==
X-Received: by 2002:a37:792:: with SMTP id 140mr6325361qkh.58.1588389772555;
 Fri, 01 May 2020 20:22:52 -0700 (PDT)
Received: from localhost.localdomain ([2804:18:602b:723a:1b2a:57a1:a611:34ed])
 by smtp.gmail.com with ESMTPSA id
 c41sm4410399qta.96.2020.05.01.20.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2020 20:22:52 -0700 (PDT)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab+huawei@kernel.org, sean@mess.org, kstewart@linuxfoundation.org,
 allison@lohutok.net, tglx@linutronix.de
Date: Sat,  2 May 2020 00:22:11 -0300
Message-Id: <20200502032216.197977-7-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200502032216.197977-1-dwlsalmeida@gmail.com>
References: <20200502032216.197977-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [RFC, WIP,
	v4 06/11] media: vidtv: add wrappers for memcpy and memset
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

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

A lot of code in this driver is for serializing structures. This is
error prone.

Therefore, prevent buffer overflows by wrapping memcpy and memset,
comparing the requested length against the buffer size.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/test-drivers/vidtv/Makefile     |  3 ++
 .../media/test-drivers/vidtv/vidtv_common.c   | 44 +++++++++++++++++++
 .../media/test-drivers/vidtv/vidtv_common.h   | 28 ++++++++++++
 3 files changed, 75 insertions(+)
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_common.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_common.h

diff --git a/drivers/media/test-drivers/vidtv/Makefile b/drivers/media/test-drivers/vidtv/Makefile
index a9f1993dd5443..9ea9485d42189 100644
--- a/drivers/media/test-drivers/vidtv/Makefile
+++ b/drivers/media/test-drivers/vidtv/Makefile
@@ -1,3 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
+vidtv_demod-objs := vidtv_common.o
+vidtv_bridge-objs := vidtv_common.o
+
 obj-$(CONFIG_DVB_VIDTV)	+= vidtv_tuner.o vidtv_demod.o vidtv_bridge.o
diff --git a/drivers/media/test-drivers/vidtv/vidtv_common.c b/drivers/media/test-drivers/vidtv/vidtv_common.c
new file mode 100644
index 0000000000000..28f10630499a9
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_common.c
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * The Virtual DVB test driver serves as a reference DVB driver and helps
+ * validate the existing APIs in the media subsystem. It can also aid
+ * developers working on userspace applications.
+ *
+ * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
+ */
+
+#include <linux/types.h>
+#include <linux/string.h>
+#include <linux/printk.h>
+
+u32 vidtv_memcpy(void *to,
+		 const void *from,
+		 size_t len,
+		 u32 offset,
+		 u32 buf_sz)
+{
+	if (buf_sz && offset + len > buf_sz) {
+		pr_err("%s: overflow detected, skipping. Try increasing the buffer size",
+		       __func__);
+		return 0;
+	}
+
+	memcpy(to, from, len);
+	return len;
+}
+
+u32 vidtv_memset(void *to,
+		 int c,
+		 size_t len,
+		 u32 offset,
+		 u32 buf_sz)
+{
+	if (buf_sz && offset + len > buf_sz) {
+		pr_err("%s: overflow detected, skipping. Try increasing the buffer size",
+		       __func__);
+		return 0;
+	}
+
+	memset(to, c, len);
+	return len;
+}
diff --git a/drivers/media/test-drivers/vidtv/vidtv_common.h b/drivers/media/test-drivers/vidtv/vidtv_common.h
new file mode 100644
index 0000000000000..64072c010dc66
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_common.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * The Virtual DVB test driver serves as a reference DVB driver and helps
+ * validate the existing APIs in the media subsystem. It can also aid
+ * developers working on userspace applications.
+ *
+ * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
+ */
+
+#ifndef VIDTV_COMMON_H
+#define VIDTV_COMMON_H
+
+#include <linux/types.h>
+#include <media/dvb_frontend.h>
+
+u32 vidtv_memcpy(void *to,
+		 const void *from,
+		 size_t len,
+		 u32 offset,
+		 u32 buf_sz);
+
+u32 vidtv_memset(void *to,
+		 int c,
+		 size_t len,
+		 u32 offset,
+		 u32 buf_sz);
+
+#endif // VIDTV_COMMON_H
-- 
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
