Return-Path: <SRS0=dZpl=65=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE26DC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 May 2020 21:49:06 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 924802070A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 May 2020 21:49:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6JQzLS5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 924802070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2D81986252;
	Fri, 15 May 2020 21:49:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3eQbPS5KUaQy; Fri, 15 May 2020 21:49:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7CE98833C6;
	Fri, 15 May 2020 21:49:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6D2A9C0859;
	Fri, 15 May 2020 21:49:05 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6A90FC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 May 2020 21:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5328E20390
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 May 2020 21:49:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xrO-J32RQfPU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 May 2020 21:49:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 00AEC21546
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 May 2020 21:49:02 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id 4so3327997qtb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 May 2020 14:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=llFN1b4IyM2NmP1m0ZO+FT2673CkYgwiHGyYGvoTCac=;
 b=V6JQzLS5IPik6GglApB4QLQr3Rk+BCjB8x+3A9tOoC3C3imphXlKmhUgrKAZxavmyx
 q4qe66XDQCBdVO1q8/ssUlVuQTgZ0rqGgiqsnhzlcFQIVnmY9UcSOI6+3qqKnBnqC/R4
 I7ntrrH1h1SDo7BQj/GX9PHIgd6mhuNRmcAuUDW8hNoZh9/kBHRToYXUUqJ0Fgygx4/Z
 gRAzFld1GON9AOXJ0hUTLYG/3Oos5EwISVfPUPLP28SyY1ImelHdCawfXHLpBj0DMi1/
 e65Kh79Nips7EtVciqldL3mrDRpB3lY5qtxDyBMwj0zH8/Wp2+PgBNi3fMEDiTvEvhf1
 x2Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=llFN1b4IyM2NmP1m0ZO+FT2673CkYgwiHGyYGvoTCac=;
 b=S0Tj2A7Gi3e7BdM8WgQPNohuWxz8y5OxzgkUs1hrMpsa3ERJs1DfgcLuQUP4sF3lrQ
 JDugcoDKinA1sOrG0CJMXU1r8GgtcKKj6zIdz29QpFHDjpO+dOa4ED+EJ2puy49DyY/h
 KV5qszMLGliKAVnvHYB8vuI0tG4FYgKdz5+uB1znjJV5MZ/VNxexEIA+Nez+mTsPSGV/
 qsm1bZoJOZc37HNq2FTPxqs/wq43Ds/qIJ9MP0HVD8mhbLt5GnOQvk0JN8RQxMHorj5Y
 oAVQRxInBcH7iDZz8b3Xrq5MtKJbgmOvx2nZ88Bg8cGsn4VjyDf4WCDOuBUv9q2Umgoo
 cLTQ==
X-Gm-Message-State: AOAM531tmBBWeVJdWqTRNmL7ZEl+CUENcUtAf84oCdtoFuJkUODAvbIs
 xoeqxfG4me08cu8g2zvYl94=
X-Google-Smtp-Source: ABdhPJyK6pyDmQBPYu9OmmQLKHe4TfmPSRCircJ4ofbXp6a1jaBRckDdpXWQS4OLcC874uTz7KE1hA==
X-Received: by 2002:ac8:51c5:: with SMTP id d5mr5794502qtn.232.1589579341933; 
 Fri, 15 May 2020 14:49:01 -0700 (PDT)
Received: from localhost.localdomain ([2804:18:700e:2692:8980:dd13:6be6:4050])
 by smtp.gmail.com with ESMTPSA id
 m21sm2495019qkh.50.2020.05.15.14.48.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 14:49:01 -0700 (PDT)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab+huawei@kernel.org, sean@mess.org, kstewart@linuxfoundation.org,
 allison@lohutok.net, tglx@linutronix.de
Date: Fri, 15 May 2020 18:48:10 -0300
Message-Id: <20200515214815.15514-6-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515214815.15514-1-dwlsalmeida@gmail.com>
References: <20200515214815.15514-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [RFC, WIP,
	v5 05/10] media: vidtv: add wrappers for memcpy and memset
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
 .../media/test-drivers/vidtv/vidtv_common.c   | 86 +++++++++++++++++++
 .../media/test-drivers/vidtv/vidtv_common.h   | 27 ++++++
 2 files changed, 113 insertions(+)
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_common.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_common.h

diff --git a/drivers/media/test-drivers/vidtv/vidtv_common.c b/drivers/media/test-drivers/vidtv/vidtv_common.c
new file mode 100644
index 0000000000000..944f77625c12c
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_common.c
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * The Virtual DVB test driver serves as a reference DVB driver and helps
+ * validate the existing APIs in the media subsystem. It can also aid
+ * developers working on userspace applications.
+ *
+ * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ":%s, %d: " fmt, __func__, __LINE__
+
+#include <linux/types.h>
+#include <linux/string.h>
+#include <linux/printk.h>
+#include <linux/ratelimit.h>
+
+#include "vidtv_common.h"
+
+/**
+ * vidtv_memcpy() - wrapper routine to be used by MPEG-TS
+ *	generator, in order to avoid going past the
+ *	output buffer.
+ * @to:	Starting element to where a MPEG-TS packet will
+ *	be copied.
+ * @to_offset:	Starting position of the @to buffer to be filled.
+ * @to_size:	Size of the @to buffer.
+ * @from:	Starting element of the buffer to be copied.
+ * @len:	Number of elements to be copy from @from buffer
+ *	into @to+ @to_offset buffer.
+ *
+ * Note:
+ *	Real digital TV demod drivers should not have memcpy
+ *	wrappers. We use it here because emulating MPEG-TS
+ *	generation at kernelspace requires some extra care.
+ *
+ * Return:
+ *	Returns the number of bytes written
+ */
+u32 vidtv_memcpy(void *to,
+		 size_t to_offset,
+		 size_t to_size,
+		 const void *from,
+		 size_t len)
+{
+	if (unlikely(to_offset + len > to_size)) {
+		pr_err_ratelimited("overflow detected, skipping. Try increasing the buffer size\n");
+		return 0;
+	}
+
+	memcpy(to + to_offset, from, len);
+	return len;
+}
+
+/**
+ * vidtv_memset() - wrapper routine to be used by MPEG-TS
+ *	generator, in order to avoid going past the
+ *	output buffer.
+ * @to:	Starting element to set
+ * @to_offset:	Starting position of the @to buffer to be filled.
+ * @to_size:	Size of the @to buffer.
+ * @from:	Starting element of the buffer to be copied.
+ * @ten:	Number of elements to be copy from @from buffer
+ *	into @to+ @to_offset buffer.
+ *
+ * Note:
+ *	Real digital TV demod drivers should not have memset
+ *	wrappers. We use it here because emulating MPEG-TS
+ *	generation at kernelspace requires some extra care.
+ *
+ * Return:
+ *	Returns the number of bytes written
+ */
+u32 vidtv_memset(void *to,
+		 size_t to_offset,
+		 size_t to_size,
+		 const int c,
+		 size_t len)
+{
+	if (unlikely(to_offset + len > to_size)) {
+		pr_err_ratelimited("overflow detected, skipping. Try increasing the buffer size\n");
+		return 0;
+	}
+
+	memset(to + to_offset, c, len);
+	return len;
+}
diff --git a/drivers/media/test-drivers/vidtv/vidtv_common.h b/drivers/media/test-drivers/vidtv/vidtv_common.h
new file mode 100644
index 0000000000000..a3cb303cc7423
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_common.h
@@ -0,0 +1,27 @@
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
+
+u32 vidtv_memcpy(void *to,
+		 size_t to_offset,
+		 size_t to_size,
+		 const void *from,
+		 size_t len);
+
+u32 vidtv_memset(void *to,
+		 size_t to_offset,
+		 size_t to_size,
+		 int c,
+		 size_t len);
+
+#endif // VIDTV_COMMON_H
-- 
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
