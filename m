Return-Path: <SRS0=dZpl=65=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B274DC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 May 2020 21:48:45 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 810D32070A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 May 2020 21:48:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="frXfUUqE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 810D32070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 54F0E88E6D;
	Fri, 15 May 2020 21:48:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mSKS80hoYAQh; Fri, 15 May 2020 21:48:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E000A88E6C;
	Fri, 15 May 2020 21:48:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CF876C0859;
	Fri, 15 May 2020 21:48:44 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 131BBC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 May 2020 21:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0298288E6C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 May 2020 21:48:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oSgT1kSlNl1S
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 May 2020 21:48:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6888A88E16
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 May 2020 21:48:43 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id i5so4173745qkl.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 May 2020 14:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/bMUwdeTMh2W9i+EOVv7dhyz664fp1ziAg67LLNKBOI=;
 b=frXfUUqE34wjGzrPt/UpX6qWWgh222sCoLJ9clKhWElbz17fHBYpYXjAI4efHyhqNh
 nhK45dynSmhoiiVVdg4BFVtA9cI9qnJCP14a2zgekPK6WytP1ZA3+DTlAcHVq0R/BJdk
 cNOqXpLcH1NG1SasrtTmnG7szh0NQcyz+lYAV2vVaXlIDHqyCBLrAURYfrajxa9x/m2H
 JQEDINlKlG2D6fHnVsl1YydjCIez+BLbYIujtMXwJh6SDsj+BUdMkc3agTpBNEy2DyHo
 fR+kT75oT2Q7WTPCg7XpoNzZzMX8Ivusd+o7fM4WDQIQuDEr58DEVUNDMUjby39VMy1M
 CRwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/bMUwdeTMh2W9i+EOVv7dhyz664fp1ziAg67LLNKBOI=;
 b=KF9ZxiEeujCOORig9wOGAxJujtcI+AUIveev2xAo4oHaGg8D8ssYfcISsAggN13AEW
 RYWJML3Fw4rQi1u/PRUoETeo4I6U8kD7bvabHzAX5LzRCPvhqlSdHov4ox5PkctNsmTR
 19Uq+YcQtYTRd3g2XhlKEOSjfmVPxhw/3v/uZzhg+KEqnMX4Zo/UOyvL/0hyV6G/Muzb
 k9VTkqc1lQkCROCE01pWkNsbVonI4hoxRxjDJ3BNfgiOZpZtBtfe3u9gOpvvn6Q/ZBbj
 2Cn2UwfT6zSIxtjxrSrnIMxwgNk7C+L4EofAHMd/Mm0Hvqst3SIo8fz9H+BAjz2Avl6b
 bzlA==
X-Gm-Message-State: AOAM531s55VBUwQ9Xc1iL404X3mLFlaGPgInvcbpchjP2ldXvaMbTo+z
 /JtT9VtI5yMmRqKvHeRHbjY=
X-Google-Smtp-Source: ABdhPJxBYveqgHbL6PYIQcIWYaOZD3nhsEZ/WdrV3LcpuHRSJ+RZzaYXaSvg11WdbuNMWUdbck0ZmQ==
X-Received: by 2002:a37:7403:: with SMTP id p3mr5656512qkc.339.1589579322358; 
 Fri, 15 May 2020 14:48:42 -0700 (PDT)
Received: from localhost.localdomain ([2804:18:700e:2692:8980:dd13:6be6:4050])
 by smtp.gmail.com with ESMTPSA id
 m21sm2495019qkh.50.2020.05.15.14.48.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 14:48:41 -0700 (PDT)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab+huawei@kernel.org, sean@mess.org, kstewart@linuxfoundation.org,
 allison@lohutok.net, tglx@linutronix.de
Date: Fri, 15 May 2020 18:48:06 -0300
Message-Id: <20200515214815.15514-2-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515214815.15514-1-dwlsalmeida@gmail.com>
References: <20200515214815.15514-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [RFC, WIP,
	v5 01/10] media: vidtv: add Kconfig entry
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

Add the necessary Kconfig entries and a dummy Makefile to compile the new
virtual DVB test driver (vidtv).

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/test-drivers/Kconfig        | 10 ++++++++++
 drivers/media/test-drivers/Makefile       |  1 +
 drivers/media/test-drivers/vidtv/Kconfig  | 11 +++++++++++
 drivers/media/test-drivers/vidtv/Makefile |  2 ++
 4 files changed, 24 insertions(+)
 create mode 100644 drivers/media/test-drivers/vidtv/Kconfig
 create mode 100644 drivers/media/test-drivers/vidtv/Makefile

diff --git a/drivers/media/test-drivers/Kconfig b/drivers/media/test-drivers/Kconfig
index 188381c855939..7d273a8a7acc2 100644
--- a/drivers/media/test-drivers/Kconfig
+++ b/drivers/media/test-drivers/Kconfig
@@ -4,6 +4,10 @@ menuconfig V4L_TEST_DRIVERS
 	bool "V4L test drivers"
 	depends on VIDEO_DEV
 
+menuconfig DVB_TEST_DRIVERS
+	bool "DVB test drivers"
+	depends on DVB_CORE && MEDIA_SUPPORT && I2C
+
 if V4L_TEST_DRIVERS
 
 source "drivers/media/test-drivers/vimc/Kconfig"
@@ -24,3 +28,9 @@ config VIDEO_VIM2M
 source "drivers/media/test-drivers/vicodec/Kconfig"
 
 endif #V4L_TEST_DRIVERS
+
+if DVB_TEST_DRIVERS
+
+source "drivers/media/test-drivers/vidtv/Kconfig"
+
+endif #DVB_TEST_DRIVERS
diff --git a/drivers/media/test-drivers/Makefile b/drivers/media/test-drivers/Makefile
index 74410d3a9f2d2..9f0e4ebb2efe7 100644
--- a/drivers/media/test-drivers/Makefile
+++ b/drivers/media/test-drivers/Makefile
@@ -7,3 +7,4 @@ obj-$(CONFIG_VIDEO_VIMC)		+= vimc/
 obj-$(CONFIG_VIDEO_VIVID)		+= vivid/
 obj-$(CONFIG_VIDEO_VIM2M)		+= vim2m.o
 obj-$(CONFIG_VIDEO_VICODEC)		+= vicodec/
+obj-$(CONFIG_DVB_VIDTV)			+= vidtv/
diff --git a/drivers/media/test-drivers/vidtv/Kconfig b/drivers/media/test-drivers/vidtv/Kconfig
new file mode 100644
index 0000000000000..22c4fd39461f1
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/Kconfig
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config DVB_VIDTV
+	tristate "Virtual DVB Driver (vidtv)"
+	depends on DVB_CORE && MEDIA_SUPPORT && I2C
+	help
+	  The virtual DVB test driver serves as a reference DVB driver and helps
+	  validate the existing APIs in the media subsystem. It can also aid developers
+	  working on userspace applications.
+
+
+	  When in doubt, say N.
diff --git a/drivers/media/test-drivers/vidtv/Makefile b/drivers/media/test-drivers/vidtv/Makefile
new file mode 100644
index 0000000000000..d1558d84eeaed
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+
-- 
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
