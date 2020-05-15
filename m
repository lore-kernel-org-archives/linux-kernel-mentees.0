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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F2AAC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 May 2020 21:49:12 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E77372073E
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 May 2020 21:49:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vLtLkG7o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E77372073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D9D2087EC9;
	Fri, 15 May 2020 21:49:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KBKQwWvzF0d8; Fri, 15 May 2020 21:49:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2ACA387EB1;
	Fri, 15 May 2020 21:49:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 26D36C0859;
	Fri, 15 May 2020 21:49:11 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BD46EC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 May 2020 21:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B963787EB5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 May 2020 21:49:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E9HvnzRHdg2P
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 May 2020 21:49:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1772C8806D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 May 2020 21:49:08 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id n22so875683qtv.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 May 2020 14:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Eu6zyVAv2okqAu2MpDIX4+uWLByOhOoVUD/ukYkdvtU=;
 b=vLtLkG7odl02XC/8BXHMS37OADc0OmBmZY8vFl7JL14X26aENaY9+cBIJFUT81Ve1g
 A6aX2sbi9qC5fZHLw/EQvAgJa7kGaR2VGSYYIxw3uz5R+fuPMDo7isXzJzQzsbBhujJz
 KjMW9YF0KkGT9uwzduTRChwqF8VAFTY0T06pCvgTH91yn6xxpHCTyHJf3/NEnoiURzjI
 XyBaKAGleH3CDpeUqJzHHwZOeAME/AaMVQS7E9WIONgmWs4iYI2LlELiI1LPsaZY1FMQ
 xN+Q2OTWyAoHXkOaN0sYu/S9jwFUvAPzsmL6RFzSS3mAShe9k4e7imxw3x0H+MW9pYNm
 FBXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Eu6zyVAv2okqAu2MpDIX4+uWLByOhOoVUD/ukYkdvtU=;
 b=kO6kuDsmyryhpWzzFovo5/4snxYeD1aC+tBc6IX2IUYzh1Dr8/JF0e2nxZIk3npLNb
 EVYQ4Qtxi7m/WRc8Q2K5Ki/5UdEi8QV8cQebgXyE9WvVfaZYzGQ3Y3JG132xB5i/2DC0
 N5zlMqiW3ZeWkT/yyPzy78rgG4TkO4wq6PjOMkCxWlWSNu2kwL+af708ldZfri7RWcxB
 /kOd8v+avu1RakYxswAInsBPrZPWs5HkcBdOcvCIwLEAXY1+7CeMjPOryXHc6RhTRELA
 4IRPfYaLJeD6K8Che0/GNFikeKVNkvhzsQHu1SplnBFkX11krmVW10IajRr34ToVetW/
 it3w==
X-Gm-Message-State: AOAM533EIV8ZmHCINwMuJdFbiX6heoUa7iG5cu2ErOZ7+yOzQzyxUeIX
 TPsIpjBeqTDJbrvr+vTvuDc=
X-Google-Smtp-Source: ABdhPJyhJ8tOsaaPizBYByKJoufYWOxHoRFUC9cF7HoffZfGuv6czwh60+m54C1lPNIuUJwiTmQm5Q==
X-Received: by 2002:ac8:18a1:: with SMTP id s30mr3265327qtj.361.1589579346872; 
 Fri, 15 May 2020 14:49:06 -0700 (PDT)
Received: from localhost.localdomain ([2804:18:700e:2692:8980:dd13:6be6:4050])
 by smtp.gmail.com with ESMTPSA id
 m21sm2495019qkh.50.2020.05.15.14.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 14:49:06 -0700 (PDT)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab+huawei@kernel.org, sean@mess.org, kstewart@linuxfoundation.org,
 allison@lohutok.net, tglx@linutronix.de
Date: Fri, 15 May 2020 18:48:11 -0300
Message-Id: <20200515214815.15514-7-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515214815.15514-1-dwlsalmeida@gmail.com>
References: <20200515214815.15514-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [RFC, WIP,
	v5 06/10] media: vidtv: add MPEG TS common code
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
 drivers/media/test-drivers/vidtv/vidtv_ts.c | 157 ++++++++++++++++++++
 drivers/media/test-drivers/vidtv/vidtv_ts.h | 120 +++++++++++++++
 2 files changed, 277 insertions(+)
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_ts.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_ts.h

diff --git a/drivers/media/test-drivers/vidtv/vidtv_ts.c b/drivers/media/test-drivers/vidtv/vidtv_ts.c
new file mode 100644
index 0000000000000..77908c4e85eef
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_ts.c
@@ -0,0 +1,157 @@
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
+#include <linux/types.h>
+#include <asm/byteorder.h>
+
+#include "vidtv_ts.h"
+#include "vidtv_common.h"
+
+static u32 vidtv_ts_write_pcr_bits(u8 *to, u32 to_offset, u64 pcr)
+{
+	/* Exact same from ffmpeg. PCR is a counter driven by a 27Mhz clock */
+	u64 pcr_low = pcr % 300;
+	u64 pcr_high = pcr / 300;
+	u8 *buf = to + to_offset;
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
+	nbytes += vidtv_memcpy(args.dest_buf,
+			       args.dest_offset + nbytes,
+			       args.buf_sz,
+			       &ts_header,
+			       sizeof(ts_header));
+
+	be16_to_cpus(&ts_header.bitfield);
+
+	/*
+	 * Note:
+	 *	This will cause a discontinuity if the buffer is full,
+	 *	effectively dropping the packet, since nothing will get written
+	 *	but the continuity counter will still be incremented. This way,
+	 *	userspace can detect packet losses.
+	 */
+	vidtv_ts_inc_cc(args.continuity_counter);
+
+	/* fill the rest with empty data */
+	nbytes += vidtv_memset(args.dest_buf,
+			       args.dest_offset + nbytes,
+			       args.buf_sz,
+			       TS_FILL_BYTE,
+			       TS_PACKET_LEN - nbytes);
+
+	/* we should have written exactly _one_ 188byte packet */
+	if (nbytes != TS_PACKET_LEN)
+		pr_warn_ratelimited("Expected exactly %d bytes, got %d\n",
+				    TS_PACKET_LEN,
+				    nbytes);
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
+	/* cc is not incremented, but we need it. see 13818-1 clause 2.4.3.3 */
+	ts_header.continuity_counter = *args.continuity_counter;
+	ts_header.payload            = 0;
+	ts_header.adaptation_field   = 1;
+
+	/* 13818-1 clause 2.4.3.5 */
+	ts_adap.length = 183;
+	ts_adap.PCR    = 1;
+
+	/*
+	 * Note:
+	 *	Nothing will get written if the buffer is full, this will
+	 *	essentially drop the packet. The continuity counter is not
+	 *	updated for PCR packets, so it will be as if no PCR packet was
+	 *	sent at all.
+	 */
+
+	cpu_to_be16s(&ts_header.bitfield);
+
+	/* copy TS header */
+	nbytes += vidtv_memcpy(args.dest_buf,
+			       args.dest_offset + nbytes,
+			       args.buf_sz,
+			       &ts_header,
+			       sizeof(ts_header));
+
+	be16_to_cpus(&ts_header.bitfield);
+
+	/* write the adap after the TS header */
+	nbytes += vidtv_memcpy(args.dest_buf,
+			       args.dest_offset + nbytes,
+			       args.buf_sz,
+			       &ts_adap,
+			       sizeof(ts_adap));
+
+	/* write the PCR optional */
+	cpu_to_be64s(&args.pcr);
+	nbytes += vidtv_ts_write_pcr_bits(args.dest_buf,
+					  args.dest_offset + nbytes,
+					  args.pcr);
+	be64_to_cpus(&args.pcr);
+
+	nbytes += vidtv_memset(args.dest_buf,
+			       args.dest_offset + nbytes,
+			       args.buf_sz,
+			       TS_FILL_BYTE,
+			       TS_PACKET_LEN - nbytes);
+
+	/* we should have written exactly _one_ 188byte packet */
+	if (nbytes != TS_PACKET_LEN)
+		pr_warn_ratelimited("Expected exactly %d bytes, got %d\n",
+				    TS_PACKET_LEN,
+				    nbytes);
+
+	return nbytes;
+}
diff --git a/drivers/media/test-drivers/vidtv/vidtv_ts.h b/drivers/media/test-drivers/vidtv/vidtv_ts.h
new file mode 100644
index 0000000000000..b6c638d13d14f
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_ts.h
@@ -0,0 +1,120 @@
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
+#define TS_FILL_BYTE 0xff /* the byte used in packet stuffing */
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
+#error  "Unknown bitfield ordering"
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
+#error  "Unknown bitfield ordering"
+#endif
+	} __packed;
+	struct vidtv_mpeg_ts_adaption adaption[];
+} __packed;
+
+/**
+ * struct pcr_write_args - Arguments for the pcr_write_into function.
+ * @dest_buf: The buffer to write into.
+ * @dest_offset: The byte offset into the buffer.
+ * @pid: The TS PID for the PCR packets.
+ * @buf_sz: The size of the buffer in bytes.
+ * @countinuity_counter: The TS continuity_counter.
+ * @pcr: A sample from the system clock.
+ */
+struct pcr_write_args {
+	void *dest_buf;
+	u32 dest_offset;
+	u16 pid;
+	u32 buf_sz;
+	u8 *continuity_counter;
+	u64 pcr;
+};
+
+/**
+ * struct null_packet_write_args - Arguments for the null_write_into function
+ * @dest_buf: The buffer to write into.
+ * @dest_offset: The byte offset into the buffer.
+ * @buf_sz: The size of the buffer in bytes.
+ * @countinuity_counter: The TS continuity_counter.
+ */
+struct null_packet_write_args {
+	void *dest_buf;
+	u32 dest_offset;
+	u32 buf_sz;
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
