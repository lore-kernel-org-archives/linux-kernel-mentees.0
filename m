Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E598B210B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 20 Jan 2024 17:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705773024; cv=none; b=cpoYLzTSbyTyiLpkvB8zCYh0GLfrkgqF+L83xKsKBpHM1YalmTc307QpcSnLNarXNUpcONzI+byxdYAXcRYg1LuxRi/G6dZN0cNf8OgQwlZ8KYdyX4cLCzPOHOM2QfJvWO8iGlsJmh3GcBNR4aLDuF3U1vysKKcTXHosgcsErDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705773024; c=relaxed/simple;
	bh=ZH2cgyhXMAapdXDyYPTI26w4PVx1Wkx8CaqXEecxrq8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=txQllfoe58ze24L+X6s0YSiPIVXeOybV6auvH+RXK6wsVnubRFSb9OdhhQDVBs2BUlGuFWXhEr7E5MGwvVFom+JZFmmq2RI+mitsIqTJ19oqSx1ub/1H2osij2G9WXE/wcMdiN/9Rst2ZT72PazwSk5qUXqFmH0itlNfS5u/nVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rmr/Mujw; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rmr/Mujw"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68F3E40A53
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 20 Jan 2024 17:50:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68F3E40A53
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Rmr/Mujw
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aqX2BumNGHrs
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sat, 20 Jan 2024 17:50:21 +0000 (UTC)
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 393A740253
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 20 Jan 2024 17:50:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 393A740253
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3bd562d17dcso1538442b6e.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 20 Jan 2024 09:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705773020; x=1706377820; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RdTcSw6dCRqmz3LKAL0ooCIVlHU/JbvVbB0EYBrgpLY=;
        b=Rmr/MujwROpUsvzVbJTFtdUgioVE3QElfMQ7s21H3TFX61qCLCJ/bRiYBlMMGwnXWV
         pCdQGgNdixq/55XUo+UfglIN1ulbglkz8oGtuRueMeUIOuCNqDvuQjR4a2BpIvdsb9nV
         frPCz8rlm72rOl+oN7XT02QwozSfq9l9bMq0eskrWwYtwO6NP7aP3D4gBHEgl96WD9m5
         CyKw6HKEeshG9QF4Sb15/FkI4jp16wuLs5flU9MyPPHgoDYMrnxZdRLau2nywcq9e2Yj
         UN/xUraAKyvrJaqBhWb+cG757AcTIRD6gr4r9N0ohyrL9L2i0+swoL9nbQH9xyqoTmLy
         xkzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705773020; x=1706377820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RdTcSw6dCRqmz3LKAL0ooCIVlHU/JbvVbB0EYBrgpLY=;
        b=H9vfJHpvubuDW0xtaKhF/1rB1D4NDC6IGFmQg1t/8aAkpNR8QiRSS6o8OlEWAgmSAE
         hcN8KvpxEr8w/DQe28SYGdw1NO3dzcQ4/vpOG1Ku1QYz24f4FmkbzrYSCdU4Hzd9AmBO
         kt3XhnIrOmQBe6PmUT1PuSL7oiISKobQ0Gf2GlVVsLbxUiu0L+0X6zF2E7z1x87okyaz
         TOHX/MYzG4FD2L9FrZgsnbnzJsKl3iwt/4U2sc4CaRBbHxoBlg17w8t3zRPVVpiQ3F8w
         1zdFm5CzMUyh701IfBK1UREYY7VFZhspu3KcG+xB4ZRZ6n9uMmTF40HBBkQvy+CwOsqz
         CXhw==
X-Gm-Message-State: AOJu0Yww0fU1G90q2B6oJd3uCCnCYdp39b1KLO95+ZgaR47yWRcV8L/Z
	0CdFOTxnUpyllLizZiWRejym/t5qmc9R9f6vAxWwDzNyLf9lIToz
X-Google-Smtp-Source: AGHT+IFFx20b7c10FL1Kkd5Q0zw6xXP25Pp6cveZf56kL0phBTkqyz/Ecud5J6QeaQ4gnuBoXqBbcg==
X-Received: by 2002:a05:6808:2e94:b0:3bd:58c5:8ca2 with SMTP id gt20-20020a0568082e9400b003bd58c58ca2mr2722590oib.41.1705773020138;
        Sat, 20 Jan 2024 09:50:20 -0800 (PST)
Received: from vivek-host.. ([2405:201:d003:7018:e1d4:ba58:9c54:9742])
        by smtp.gmail.com with ESMTPSA id qa10-20020a17090b4fca00b002908558b3d6sm205073pjb.57.2024.01.20.09.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jan 2024 09:50:19 -0800 (PST)
From: Vivek Yadav <vivekyadav1207731111@gmail.com>
To: skhan@linuxfoundation.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	Vivek <vivekyadav1207731111@gmail.com>
Subject: [PATCH 2/2] Test: Driver: Hello World module
Date: Sat, 20 Jan 2024 23:20:14 +0530
Message-Id: <20240120175014.4270-1-vivekyadav1207731111@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Vivek <vivekyadav1207731111@gmail.com>

- Hello World module added with Kconfig and Makefile
Also check with `make menuconfig`.

Signed-off-by: Vivek <vivekyadav1207731111@gmail.com>
---
 drivers/HelloWorld/HelloWorld-1.c | 27 +++++++++++++++++++++++++++
 drivers/HelloWorld/Kconfig        |  9 +++++++++
 drivers/HelloWorld/Makefile       |  1 +
 drivers/Kconfig                   |  2 ++
 drivers/Makefile                  |  2 ++
 5 files changed, 41 insertions(+)
 create mode 100644 drivers/HelloWorld/HelloWorld-1.c
 create mode 100644 drivers/HelloWorld/Kconfig
 create mode 100644 drivers/HelloWorld/Makefile

diff --git a/drivers/HelloWorld/HelloWorld-1.c b/drivers/HelloWorld/HelloWorld-1.c
new file mode 100644
index 000000000000..3dd1c32c9ec6
--- /dev/null
+++ b/drivers/HelloWorld/HelloWorld-1.c
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0
+/* This is test file for Linux kernel module
+ * Here I have written a simple Hello World module
+ *
+ * author : Vivek Yadav
+ */
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+
+static int __init hello_init_module(void)
+{
+	pr_info("Hello World 1.\n");
+	return 0;
+}
+
+static void __exit hello_cleanup_module(void)
+{
+	pr_info("Goodbye World 1.\n");
+}
+
+module_init(hello_init_module);
+module_exit(hello_cleanup_module);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Vivek Yadav");
+MODULE_DESCRIPTION("Simple Hello World Kernel Module");
diff --git a/drivers/HelloWorld/Kconfig b/drivers/HelloWorld/Kconfig
new file mode 100644
index 000000000000..27606645f577
--- /dev/null
+++ b/drivers/HelloWorld/Kconfig
@@ -0,0 +1,9 @@
+menu "Hello Module Kernel Support"
+​
+config HELLO_WORLD
+        tristate "Hello Module Driver"
+        depends on X86
+        help
+		Select this option to run a Hello World Module!
+		It is just simple driver for testing.
+endmenu
diff --git a/drivers/HelloWorld/Makefile b/drivers/HelloWorld/Makefile
new file mode 100644
index 000000000000..03c1da296446
--- /dev/null
+++ b/drivers/HelloWorld/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_HELLO_WORLD)	+= HelloWorld-1.o
diff --git a/drivers/Kconfig b/drivers/Kconfig
index 7bdad836fc62..509ecadffa26 100644
--- a/drivers/Kconfig
+++ b/drivers/Kconfig
@@ -245,4 +245,6 @@ source "drivers/cdx/Kconfig"
 
 source "drivers/dpll/Kconfig"
 
+source "drivers/HelloWorld/Kconfig"
+
 endmenu
diff --git a/drivers/Makefile b/drivers/Makefile
index 37fd6ce3bd7f..13f26fa34fc7 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -198,3 +198,5 @@ obj-$(CONFIG_CDX_BUS)		+= cdx/
 obj-$(CONFIG_DPLL)		+= dpll/
 
 obj-$(CONFIG_S390)		+= s390/
+
+obj-$(CONFIG_HELLO_WORLD)	+= HelloWorld/
-- 
2.34.1

