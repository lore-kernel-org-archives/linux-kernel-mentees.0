Return-Path: <SRS0=N6Le=6Q=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A51E5C47256
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  2 May 2020 03:23:01 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79D522184D
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  2 May 2020 03:23:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WAnk+iEh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79D522184D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 588C287572;
	Sat,  2 May 2020 03:23:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 21jBQpjnBmeF; Sat,  2 May 2020 03:23:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A6896873F0;
	Sat,  2 May 2020 03:23:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9232AC0864;
	Sat,  2 May 2020 03:23:00 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 11D7FC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 May 2020 03:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0188387572
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 May 2020 03:22:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d4MH-8DUJPc3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 May 2020 03:22:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2609B873F0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 May 2020 03:22:58 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id e17so9516478qtp.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 01 May 2020 20:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j9T0sUjzus57nQX3/1aTAi2/PzSdq5kO5uH1qanv+VM=;
 b=WAnk+iEhDMCNqbqS9lfGR85tTSPeKzmUkI25Zwao4HFSD1euRhc9gOOVQ+Kh4io4LA
 EM517TClNjTAJj87a5rqr46N81wsIrWtEoo7mqplYfaqGVvUdVV4/WS2KhlvhfeyCqq7
 74+pEsDMyiP1aWtHTLitrWViRn6G/EqGPG5MFplWqA59ORU0eTBE1YvwXl/77w+rzAjp
 e4ngl55bWXiTxUs2Rs+0vdPpV/TYTu+8H91UgQtMAmpxuS/Sj5TpDVtJMdFOqyzEla0l
 /0eDA/tGN+KHGHgxwixBdLVLzCeN2rqDwT/6Q/dWSydCTZF+1u2U+2l/kq+Bo0NYU4Dj
 QhMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j9T0sUjzus57nQX3/1aTAi2/PzSdq5kO5uH1qanv+VM=;
 b=bru2cepZ6GVnrHttNkI4+ZJpGI2MhmAHsoi3WqSE0uTOuHURhUU4LTwcEUFP/BTmqd
 aHd/vw0CehSQx3IMLrmaAKFI0hO180n2/guEVH8az+eQz/RRUoRCW5B/RfGf0uHnRZAZ
 8mIirh7ikiMC1YhW6Ryn4gqFbdO146IZ3V/5ZiHCCaC+AJD/zoQf9XajDfAuZU2FSn9D
 suw+KhnDVebvSULH/bnN5O0uFndNesXHM5Hj9G0Rd9XkbWg4TZzp0/jdvE8I6dTaukqu
 wMXmL2TSXrULudgugYDQkS1ttO7iAef8/9mNuAHfcNAwg66zq3HWBKMvcl6Rp7Ker579
 pRdQ==
X-Gm-Message-State: AGi0PuYw0PXVc25ylB1s/6p3XIIEhrQNzqPL15j+3KqZXHy8fw69paBN
 5CEkfk17tLYqMuzSiqpFjG4=
X-Google-Smtp-Source: APiQypL9x3757gA7ZdWFRnQp5KbLEBJY3dJZUvR9zlkavh6HA0rHE8slrfDimJ2b38nuhzxEGGxv4w==
X-Received: by 2002:ac8:720f:: with SMTP id a15mr6656883qtp.207.1588389777113; 
 Fri, 01 May 2020 20:22:57 -0700 (PDT)
Received: from localhost.localdomain ([2804:18:602b:723a:1b2a:57a1:a611:34ed])
 by smtp.gmail.com with ESMTPSA id
 c41sm4410399qta.96.2020.05.01.20.22.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2020 20:22:56 -0700 (PDT)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab+huawei@kernel.org, sean@mess.org, kstewart@linuxfoundation.org,
 allison@lohutok.net, tglx@linutronix.de
Date: Sat,  2 May 2020 00:22:12 -0300
Message-Id: <20200502032216.197977-8-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200502032216.197977-1-dwlsalmeida@gmail.com>
References: <20200502032216.197977-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [RFC, WIP,
	v4 07/11] media: vidtv: add MPEG TS common code
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

Add code to work with MPEG TS packets, such as TS headers, adaptation
fields, PCR packets and NULL packets.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/test-drivers/vidtv/Makefile   |   2 +-
 drivers/media/test-drivers/vidtv/vidtv_ts.c | 130 ++++++++++++++++++++
 drivers/media/test-drivers/vidtv/vidtv_ts.h | 103 ++++++++++++++++
 3 files changed, 234 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_ts.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_ts.h

diff --git a/drivers/media/test-drivers/vidtv/Makefile b/drivers/media/test-drivers/vidtv/Makefile
index 9ea9485d42189..92001bc348615 100644
--- a/drivers/media/test-drivers/vidtv/Makefile
+++ b/drivers/media/test-drivers/vidtv/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
 vidtv_demod-objs := vidtv_common.o
-vidtv_bridge-objs := vidtv_common.o
+vidtv_bridge-objs := vidtv_common.o vidtv_ts.o
 
 obj-$(CONFIG_DVB_VIDTV)	+= vidtv_tuner.o vidtv_demod.o vidtv_bridge.o
diff --git a/drivers/media/test-drivers/vidtv/vidtv_ts.c b/drivers/media/test-drivers/vidtv/vidtv_ts.c
new file mode 100644
index 0000000000000..f545c45c0fe7c
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_ts.c
@@ -0,0 +1,130 @@
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
+#include <asm/byteorder.h>
+#include "vidtv_ts.h"
+#include "vidtv_common.h"
+
+static u32 vidtv_ts_write_pcr_bits(u8 *buf, u64 pcr)
+{
+	/* Exact same from ffmpeg. PCR is a counter driven by a 27Mhz clock */
+	u64 pcr_low = pcr % 300, pcr_high = pcr / 300;
+
+	*buf++ = pcr_high >> 25;
+	*buf++ = pcr_high >> 17;
+	*buf++ = pcr_high >>  9;
+	*buf++ = pcr_high >>  1;
+	*buf++ = pcr_high <<  7 | pcr_low >> 8 | 0x7e;
+	*buf++ = pcr_low;
+
+	return 6;
+}
+
+void vidtv_ts_inc_cc(u8 *continuity_counter)
+{
+	++*continuity_counter;
+	if (*continuity_counter > TS_CC_MAX_VAL)
+		*continuity_counter = 0;
+}
+
+u32 vidtv_ts_null_write_into(struct null_packet_write_args args)
+{
+	u32    nbytes                  = 0;
+	struct vidtv_mpeg_ts ts_header = {0};
+
+	ts_header.sync_byte          = TS_SYNC_BYTE;
+	ts_header.pid                = TS_NULL_PACKET_PID;
+	ts_header.payload            = 1;
+	ts_header.continuity_counter = *args.continuity_counter;
+
+	cpu_to_be16s(&ts_header.bitfield);
+
+	/* copy TS header */
+	nbytes += vidtv_memcpy(args.dest_buf + args.dest_offset + nbytes,
+			       &ts_header,
+			       sizeof(ts_header),
+			       args.dest_offset + nbytes,
+			       args.buf_sz);
+
+	be16_to_cpus(&ts_header.bitfield);
+
+	vidtv_ts_inc_cc(args.continuity_counter);
+
+	/* fill the rest with empty data */
+	nbytes += vidtv_memset(args.dest_buf + args.dest_offset + nbytes,
+			       0xff,
+			       TS_PACKET_LEN - nbytes,
+			       args.dest_offset + nbytes,
+			       args.buf_sz);
+
+	/* we should have written exactly _one_ 188byte packet */
+	WARN_ON(nbytes != TS_PACKET_LEN);
+
+	return nbytes;
+}
+
+u32 vidtv_ts_pcr_write_into(struct pcr_write_args args)
+{
+	u32    nbytes                         = 0;
+	struct vidtv_mpeg_ts ts_header        = {0};
+	struct vidtv_mpeg_ts_adaption ts_adap = {0};
+
+	ts_header.sync_byte     = TS_SYNC_BYTE;
+	ts_header.tei           = 0;
+	ts_header.payload_start = 0;
+	ts_header.pid           = args.pid;
+	ts_header.priority      = 0;
+	ts_header.scrambling    = 0;
+	/* cc is not incremented, see 13818-1 clause 2.4.3.3 */
+	ts_header.continuity_counter = *args.continuity_counter;
+	ts_header.payload            = 0;
+	ts_header.adaptation_field   = 1;
+
+	/* 13818-1 clause 2.4.3.5 */
+	ts_adap.length = 183;
+	ts_adap.PCR    = 1;
+
+	cpu_to_be16s(&ts_header.bitfield);
+
+	/* copy TS header */
+	nbytes += vidtv_memcpy(args.dest_buf + args.dest_offset + nbytes,
+			       &ts_header,
+			       sizeof(ts_header),
+			       args.dest_offset + nbytes,
+			       args.buf_sz);
+
+	be16_to_cpus(&ts_header.bitfield);
+
+	/* write the adap after the TS header */
+	nbytes += vidtv_memcpy(args.dest_buf + args.dest_offset + nbytes,
+			       &ts_adap,
+			       sizeof(ts_adap),
+			       args.dest_offset + nbytes,
+			       args.buf_sz);
+
+	/* write the PCR optional */
+	cpu_to_be64s(&args.pcr);
+	nbytes += vidtv_ts_write_pcr_bits(args.dest_buf +
+					  args.dest_offset +
+					  nbytes,
+					  args.pcr);
+	be64_to_cpus(&args.pcr);
+
+	nbytes += vidtv_memset(args.dest_buf + args.dest_offset + nbytes,
+			       0xff,
+			       TS_PACKET_LEN - nbytes,
+			       args.dest_offset + nbytes,
+			       args.buf_sz);
+
+	/* we should have written exactly _one_ 188byte packet */
+	WARN_ON(nbytes != TS_PACKET_LEN);
+
+	return nbytes;
+}
diff --git a/drivers/media/test-drivers/vidtv/vidtv_ts.h b/drivers/media/test-drivers/vidtv/vidtv_ts.h
new file mode 100644
index 0000000000000..2c07bddc46119
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_ts.h
@@ -0,0 +1,103 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * The Virtual DVB test driver serves as a reference DVB driver and helps
+ * validate the existing APIs in the media subsystem. It can also aid
+ * developers working on userspace applications.
+ *
+ * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
+ */
+
+#ifndef VIDTV_TS_H
+#define VIDTV_TS_H
+
+#include <linux/types.h>
+#include <asm/byteorder.h>
+
+#define TS_SYNC_BYTE 0x47
+#define TS_PACKET_LEN 188
+#define TS_PAYLOAD_LEN 184
+#define TS_NULL_PACKET_PID 0x1fff
+#define TS_CC_MAX_VAL 0x0f /* 4 bits */
+#define TS_LAST_VALID_PID 8191
+
+struct vidtv_mpeg_ts_adaption {
+	u8 length;
+	struct {
+#if defined(__LITTLE_ENDIAN_BITFIELD)
+		u8 extension:1;
+		u8 private_data:1;
+		u8 splicing_point:1;
+		u8 OPCR:1;
+		u8 PCR:1;
+		u8 priority:1;
+		u8 random_access:1;
+		u8 discontinued:1;
+#elif defined(__BIG_ENDIAN_BITFIELD)
+		u8 discontinued:1;
+		u8 random_access:1;
+		u8 priority:1;
+		u8 PCR:1;
+		u8 OPCR:1;
+		u8 splicing_point:1;
+		u8 private_data:1;
+		u8 extension:1;
+#else
+#error  "Please fix <asm/byteorder.h>"
+#endif
+	} __packed;
+	u8 data[];
+} __packed;
+
+struct vidtv_mpeg_ts {
+	u8 sync_byte;
+	union {
+		u16 bitfield;
+		struct {
+			u16 pid:13;
+			u16 priority:1;
+			u16 payload_start:1;
+			u16 tei:1;
+		} __packed;
+	} __packed;
+	struct {
+#if defined(__LITTLE_ENDIAN_BITFIELD)
+		u8 continuity_counter:4;
+		u8 payload:1;
+		u8 adaptation_field:1;
+		u8 scrambling:2;
+#elif defined(__BIG_ENDIAN_BITFIELD)
+		u8 scrambling:2;
+		u8 adaptation_field:1;
+		u8 payload:1;
+		u8 continuity_counter:4;
+#else
+#error  "Please fix <asm/byteorder.h>"
+#endif
+	} __packed;
+	struct vidtv_mpeg_ts_adaption adaption[];
+} __packed;
+
+struct pcr_write_args {
+	void *dest_buf; /* The buffer to write into */
+	u32 dest_offset; /* The byte offset into the buffer */
+	u16 pid; /* the TS PID for the PCR packets */
+	u32 buf_sz; /* protect against overflow when this field is not zero */
+	u8 *continuity_counter;
+	u64 pcr; /* A sample from the system clock */
+};
+
+struct null_packet_write_args {
+	void *dest_buf;/* The buffer to write into */
+	u32 dest_offset;/* The byte offset into the buffer */
+	u32 buf_sz; /* protect against overflow when this field is not zero */
+	u8 *continuity_counter;
+};
+
+/* Increment the continuity counter */
+void vidtv_ts_inc_cc(u8 *continuity_counter);
+
+u32 vidtv_ts_null_write_into(struct null_packet_write_args args);
+
+u32 vidtv_ts_pcr_write_into(struct pcr_write_args args);
+
+#endif //VIDTV_TS_H
-- 
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
