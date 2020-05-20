Return-Path: <SRS0=jt7Q=7C=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18EDAC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 20 May 2020 07:03:50 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D42F720756
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 20 May 2020 07:03:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HbXqbch2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D42F720756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id AB8AB87668;
	Wed, 20 May 2020 07:03:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gEHjJGgbQlVq; Wed, 20 May 2020 07:03:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2F4408569B;
	Wed, 20 May 2020 07:03:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 23CE3C089E;
	Wed, 20 May 2020 07:03:49 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7F856C088A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 May 2020 07:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6C5CF862BC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 May 2020 07:03:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BeSze7TD1I5S
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 May 2020 07:03:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D1B3C85B4D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 May 2020 07:03:47 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id v4so1790948qte.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 May 2020 00:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/bMUwdeTMh2W9i+EOVv7dhyz664fp1ziAg67LLNKBOI=;
 b=HbXqbch2rS5fgngKGR1Sm2dQbxdU192Y5c3MlFvEYaUbXvLcOFAvcMRrdfLzHlamaq
 GhvMmpQebC0AYLWCvrbPlqfnCjqZyJGVAb4lIRN4mqmJQrbEWGYTBriUdrRHsykASyh3
 F0MKWsaWjJd7WmioFTsxJaOtNRcAuItHQraJ82XyuiTds0UFzYA+c6hwhU7tcHYc9aBc
 LIyOl1KCOrzAVJtmorc3+3WPVf+gOWAGD7yUL7koovgVdGWKx3DMsu/xOFuXzhjhxUuo
 2u5WpAE9JVhnFmJf9xzz8WfN0LVytt5Tsp7V3sKDhVmrjJLUxT9Q5peLOEMG7j//GHZT
 CIJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/bMUwdeTMh2W9i+EOVv7dhyz664fp1ziAg67LLNKBOI=;
 b=nR5xLXCbOznVcIo3L3CVmN4+MNF+IpeXdGAx0QUhS9TpEE3GA7q9hHb6R1gBtJZFcm
 BH+Ruf885Db30KlMYd/Ac6ib1LAOvgyt8sNA4OnrgkZRHXXhG4ASPaEG9HSbwZe0Q2Ip
 glZx61KipQ81MqmKUiyVX9CovoyfW2fEUsF8bPDyI9rNfgp8lvXZPoh8IFnsdrIQNQdI
 yAi5Lndz3Lx178QiDHyCaLM8c+oHEWWU7Oah5gFf1wIKEqt/7JcmYBxutQNACsxibKK9
 R9QcK/xcC71zc3KNwrFOAmAkBGB2b9MESC6Xhej2IzxTrVsVROSuFANE6Nh7xZ9azuB5
 EqVA==
X-Gm-Message-State: AOAM533RJykPM/6e0W4DwXVOvjGucJgrZ5Hr3uKWUNXRtGMciYEQ3pZb
 gEkGQYLZ5t0DCm4ZeTcYGHk=
X-Google-Smtp-Source: ABdhPJyXyN7PbTHQV1zOP1vLExnTCKYT4/Ja78kVZ23F83MSq4XOLVctvtmRZuYna4uILW1uNsBKBQ==
X-Received: by 2002:ac8:2f64:: with SMTP id k33mr3813298qta.105.1589958226820; 
 Wed, 20 May 2020 00:03:46 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id i23sm1598893qke.65.2020.05.20.00.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 00:03:46 -0700 (PDT)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab+huawei@kernel.org, sean@mess.org, kstewart@linuxfoundation.org,
 allison@lohutok.net, tglx@linutronix.de
Date: Wed, 20 May 2020 04:03:25 -0300
Message-Id: <20200520070334.1778751-2-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200520070334.1778751-1-dwlsalmeida@gmail.com>
References: <20200520070334.1778751-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [RFC, WIP,
	v6 01/10] media: vidtv: add Kconfig entry
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
