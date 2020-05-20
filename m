Return-Path: <SRS0=jt7Q=7C=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CA6FC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 20 May 2020 07:04:13 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D01A520885
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 20 May 2020 07:04:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p/lyKf/G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D01A520885
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id ACF6C8815D;
	Wed, 20 May 2020 07:04:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qMPa7dBP28hq; Wed, 20 May 2020 07:04:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id F1F7D87FD8;
	Wed, 20 May 2020 07:04:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E1D4BC088A;
	Wed, 20 May 2020 07:04:11 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A6299C0176
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 May 2020 07:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8FCD820553
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 May 2020 07:04:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FxoDRG-8-xV1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 May 2020 07:04:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by silver.osuosl.org (Postfix) with ESMTPS id CF29C2094E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 May 2020 07:04:03 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id 142so2577102qkl.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 May 2020 00:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B45hogykBorpQm91C/FLYv1RqOa4QVoaffagDFE18Qs=;
 b=p/lyKf/Gdc+2iVQRO4CL5QgtxU90uvVYQTbXEtDJ+qJkmEBdaHBzZtg3EYouUtnqDv
 KX2OGCe9H50xiuG+xKF1wH7SqNELgTrbP2RYwvBz02CJFpY0vjJWF8oQqAB9I2H1wOlP
 7X4ha9uaAyBX4eTHzApnO71O8pp+lba37+gc7wCW2szngDosTNGKkLGYrYMMYKZCNFLF
 S61Vyck5CVkVVEFJUuqJog26l/S2luLWpWPps1mtevZcnEG1AuGGVZ26PtNzgU553sqM
 RXywEVAS29Cfen0buKuwimEi7TGKP9xThToFZIYl3QXzeA9jfGwt1n2p7dca09hqpFDk
 cMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B45hogykBorpQm91C/FLYv1RqOa4QVoaffagDFE18Qs=;
 b=BI9qNFbi4xxlQJDjHdrI6m2XsYHxIe1B6bwshnC+M/MBQdjkT0u+oL9cxcN6o8ACjA
 fOwxLEOzckHta5Dusmj2n3p3DA6GurH0pHdYnj2MEz/i2K0Y3LVUfGKBLVhA4Kg0C9Dl
 /a3XI8uxwNe5M4JI83N8QDF7Bgj4GYt9ChBbYgcFQvWIWGhj3ydxlmLUNMiNa08UhRtR
 O9tIep9Z8tfGl6glIyqZg+r1k0yLU+jzniLHun+2iHY4xf4QPBnTrpVvBOlrcu5YoDRC
 MdNhtt35tv5+3haW8iwq4wIgHmnOgCFfedTTXcSbNNmFhXP1MRvNAGW48mhHAHrVpwRC
 d4AQ==
X-Gm-Message-State: AOAM530GHGlP9sb8l0OMPYpoDIfQa9sItN2z6ZFSQ+ovGAQYDIeGdb79
 UKp1maDLu7gJDpTEBVtnOEQ=
X-Google-Smtp-Source: ABdhPJx/lvWZHJwUMrKvIsNzP2GHGpkP7hzzOjMX5m5YuAIDHeHmG50gFRYcLQ/uu8woz2yFi3/vhQ==
X-Received: by 2002:a37:6e42:: with SMTP id j63mr3198105qkc.495.1589958242727; 
 Wed, 20 May 2020 00:04:02 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id i23sm1598893qke.65.2020.05.20.00.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 00:04:01 -0700 (PDT)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab+huawei@kernel.org, sean@mess.org, kstewart@linuxfoundation.org,
 allison@lohutok.net, tglx@linutronix.de
Date: Wed, 20 May 2020 04:03:29 -0300
Message-Id: <20200520070334.1778751-6-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200520070334.1778751-1-dwlsalmeida@gmail.com>
References: <20200520070334.1778751-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [RFC, WIP,
	v6 05/10] media: vidtv: add wrappers for memcpy and memset
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
index 0000000000000..6810212087c17
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
+#include <linux/printk.h>
+#include <linux/ratelimit.h>
+#include <linux/string.h>
+#include <linux/types.h>
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
