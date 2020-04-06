Return-Path: <SRS0=pM+b=5W=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48503C2BA2B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Apr 2020 23:21:14 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A9A6206C3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Apr 2020 23:21:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sy5/SLnk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A9A6206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E5C3984A92;
	Mon,  6 Apr 2020 23:21:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D5ONyWNLMt5g; Mon,  6 Apr 2020 23:21:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7F1D084B1F;
	Mon,  6 Apr 2020 23:21:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6C7BFC1AE2;
	Mon,  6 Apr 2020 23:21:13 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BD561C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Apr 2020 23:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B9C63884D3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Apr 2020 23:21:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dtfDoSHCJUiG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Apr 2020 23:21:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 238AD883A4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Apr 2020 23:21:12 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id z12so1334399qtq.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 06 Apr 2020 16:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qYLbut/xX+hjmPe9RzWA90KmfgDd7VcddBEKSA5kQ5c=;
 b=Sy5/SLnkA+S9bkiFDB2dfPAELaCJGzkQc6kHCaXQngzyYZ0prZ0RlndfkF6lPoyBRN
 bTYOGckd/UNuBPFrPOmCeXv4tPQTaWmwftmDtfDwHEdlIoAx7Gzig4V7uHqWER5VP8Hp
 GJAlYD0wgGNnORPAzRpTqGQutMi47FtxEjbl8L1aybXAfGdhNg0nZz4D4zAJ+Ky2h1Mr
 4dKZGrA7r0v3jMatsjRtc+agfb5v7oifmHTY7fiwXoRdYbMxObraspqBfZWv2Z+9RxJU
 zlde1Y2RTMA8J5y2Dd5t0vO2WhgYMRX7ExauHvv9+7gRN3g+nuSiUuX39ichdi2ANR9R
 dF6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qYLbut/xX+hjmPe9RzWA90KmfgDd7VcddBEKSA5kQ5c=;
 b=F+XRTliWp5of0Zt/j3IMYr1Hk7SXnLVhDe7lSRH2z04c5c5rmwcVZ1CCTfTSMSKb1f
 NcvkBGfSy0QNdqZnBIh3mLnANf0a7+obJvIa0MCuUiQ/Ugn+k7J3D7lcZaNHfJoEkUdw
 TtmrxM7dRZCkoVnMlnCm77D4V0gZ1S8TToyxHIEcvvsAk1kXz/zAoG09ItE/23y6XWtA
 pdheh+ZY7UYBdnUMIfra5o+wTsME9OAsZaj4/RIdKS46sPItC7IqBNKASTEV4937Z18/
 FXJEqnIcb++yP9L+TJ3S9Q+DMi1IEezfWNIco982lU0rZtuwhywhN1Ifocs/CygPSSM/
 cE+g==
X-Gm-Message-State: AGi0PuYftmrRks/0uaQhc/xaGh/Y8092N2bYTl3Fe1iIEbPfUDYjHQDL
 viUGaWyBt9KI/6RfgXegcpU=
X-Google-Smtp-Source: APiQypKFyGFHbTWdKNBlwKIiKmcWH5TlE7cQwKz3a2q7rHfDcj87BH2mA0YWa2SsZHsZsuKR9Bdh8A==
X-Received: by 2002:ac8:1684:: with SMTP id r4mr1974418qtj.287.1586215271062; 
 Mon, 06 Apr 2020 16:21:11 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
 by smtp.gmail.com with ESMTPSA id u26sm1490978qku.54.2020.04.06.16.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 16:21:10 -0700 (PDT)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab+huawei@kernel.org, sean@mess.org, kstewart@linuxfoundation.org,
 allison@lohutok.net, tglx@linutronix.de
Date: Mon,  6 Apr 2020 20:20:50 -0300
Message-Id: <20200406232055.1023946-2-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200406232055.1023946-1-dwlsalmeida@gmail.com>
References: <20200406232055.1023946-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [RFC, WIP,
	v3 1/6] media: vidtv: add Kconfig entry
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
 drivers/media/test_drivers/Kconfig        | 10 ++++++++++
 drivers/media/test_drivers/Makefile       |  1 +
 drivers/media/test_drivers/vidtv/Kconfig  | 11 +++++++++++
 drivers/media/test_drivers/vidtv/Makefile |  2 ++
 4 files changed, 24 insertions(+)
 create mode 100644 drivers/media/test_drivers/vidtv/Kconfig
 create mode 100644 drivers/media/test_drivers/vidtv/Makefile

diff --git a/drivers/media/test_drivers/Kconfig b/drivers/media/test_drivers/Kconfig
index 9f4a9cfbacc9c..997594ab3842a 100644
--- a/drivers/media/test_drivers/Kconfig
+++ b/drivers/media/test_drivers/Kconfig
@@ -6,6 +6,10 @@ menuconfig V4L_TEST_DRIVERS
 	bool "V4L test drivers"
 	depends on VIDEO_DEV
 
+menuconfig DVB_TEST_DRIVERS
+	bool "DVB test drivers"
+	depends on DVB_CORE && MEDIA_SUPPORT && I2C
+
 if V4L_TEST_DRIVERS
 
 source "drivers/media/test_drivers/vimc/Kconfig"
@@ -25,4 +29,10 @@ source "drivers/media/test_drivers/vicodec/Kconfig"
 
 endif #V4L_TEST_DRIVERS
 
+if DVB_TEST_DRIVERS
+
+source "drivers/media/test_drivers/vidtv/Kconfig"
+
+endif #DVB_TEST_DRIVERS
+
 endif #MEDIA_TEST_SUPPORT
diff --git a/drivers/media/test_drivers/Makefile b/drivers/media/test_drivers/Makefile
index 74410d3a9f2d2..9f0e4ebb2efe7 100644
--- a/drivers/media/test_drivers/Makefile
+++ b/drivers/media/test_drivers/Makefile
@@ -7,3 +7,4 @@ obj-$(CONFIG_VIDEO_VIMC)		+= vimc/
 obj-$(CONFIG_VIDEO_VIVID)		+= vivid/
 obj-$(CONFIG_VIDEO_VIM2M)		+= vim2m.o
 obj-$(CONFIG_VIDEO_VICODEC)		+= vicodec/
+obj-$(CONFIG_DVB_VIDTV)			+= vidtv/
diff --git a/drivers/media/test_drivers/vidtv/Kconfig b/drivers/media/test_drivers/vidtv/Kconfig
new file mode 100644
index 0000000000000..22c4fd39461f1
--- /dev/null
+++ b/drivers/media/test_drivers/vidtv/Kconfig
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
diff --git a/drivers/media/test_drivers/vidtv/Makefile b/drivers/media/test_drivers/vidtv/Makefile
new file mode 100644
index 0000000000000..d1558d84eeaed
--- /dev/null
+++ b/drivers/media/test_drivers/vidtv/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+
-- 
2.26.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
