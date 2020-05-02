Return-Path: <SRS0=N6Le=6Q=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D79DAC47247
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  2 May 2020 03:22:35 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A234720731
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  2 May 2020 03:22:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FANSfkIB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A234720731
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 77A9E873F0;
	Sat,  2 May 2020 03:22:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DHVC2e96RzNo; Sat,  2 May 2020 03:22:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id ACB7F87552;
	Sat,  2 May 2020 03:22:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9C6D7C0864;
	Sat,  2 May 2020 03:22:34 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7F361C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 May 2020 03:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6CE8987552
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 May 2020 03:22:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xYmvb4YTZUBU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 May 2020 03:22:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9E49787286
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 May 2020 03:22:32 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id g26so5682838qtv.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 01 May 2020 20:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/bMUwdeTMh2W9i+EOVv7dhyz664fp1ziAg67LLNKBOI=;
 b=FANSfkIBdsdts7VxUCboxxpikHryJy5QikgpmBM55Bp0YmsRcr6F3V9jQC0D0K+/5R
 qZouMJxes353v5Y/J9marUqnDfGkurq74bDqdW0ngcsEdE0PZwq//bV6b6RAsGj7SeJW
 3hU0bqn36fz0CRuLqNOsVNdWxfQByyzIhXjrdUHLq6m3++HH41fy2JC9a3IW9x6v8pmK
 nKizn31xWpquTXYzYPnrL/iP4/mi590dvWrc3NpkvQk8FLGvEAuH1hhJAFBAvToWasDt
 nZZ4FFgCvB1vMgFPgso+O0yCRLYXGYVRkp0wwTR88WGgmduCgCzYFj5m5pVBFyM2oWZE
 ZQSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/bMUwdeTMh2W9i+EOVv7dhyz664fp1ziAg67LLNKBOI=;
 b=swQ9vp4ioFHRhoc8cg5W9/X8x3773J8s/o2HuVc04DqqNRshX0Ms2QTvRFGlVCUR2/
 4jdwl95hhR7a3cpXM71LXVTql9iEJOdDMxb0ZmqtdIkESrje5Nab2FqvD+Hjyqxthw+I
 ts0XeTNbGfButcOMV4CzJP0+fwiT3zuqxQ/7iUfrIDxVfRpzvjFNzmYmWf4UK2pXdVI8
 YneGysGyAAYDJ4kmta6ycsB5XXzW+ySvrNOXGML83SdowyuNHD6PFIJS1u82zJbd0Q5d
 33r5TGJ6OdZJM/g4/xTRf5lXpWxfULTeGNK2Xty982gVU4a/BkbV8oZ7srfQ5IpiE8Lq
 3yTA==
X-Gm-Message-State: AGi0PuZ7aPkb8i8/orRVHZj4qpLGwrMkikaBwcvJnoI/Z7MrvWSXkhtW
 a137Yj7GOheqLeeT4AfHqyc=
X-Google-Smtp-Source: APiQypIMzIR8/Ng+dJ8wepy8MQb8xYjhyQiwV+O/vZXG3B+0Pm9D2SiwKiqUSQBBz3qvj1cFVYEXYA==
X-Received: by 2002:ac8:4c8d:: with SMTP id j13mr6830790qtv.142.1588389751538; 
 Fri, 01 May 2020 20:22:31 -0700 (PDT)
Received: from localhost.localdomain ([2804:18:602b:723a:1b2a:57a1:a611:34ed])
 by smtp.gmail.com with ESMTPSA id
 c41sm4410399qta.96.2020.05.01.20.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2020 20:22:31 -0700 (PDT)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab+huawei@kernel.org, sean@mess.org, kstewart@linuxfoundation.org,
 allison@lohutok.net, tglx@linutronix.de
Date: Sat,  2 May 2020 00:22:06 -0300
Message-Id: <20200502032216.197977-2-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200502032216.197977-1-dwlsalmeida@gmail.com>
References: <20200502032216.197977-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [RFC, WIP,
	v4 01/11] media: vidtv: add Kconfig entry
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
