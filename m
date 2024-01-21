Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F5C374CC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 21 Jan 2024 14:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705846443; cv=none; b=beGR1pXXZ/M5LqtCTx8gV42QLlaPnTd49/BF2dxLXVxryT29OrYZYFPjDtp4qLFycy9iQ/EkFJLzHjRaKrqn4tZxqnW6dFXXqRgpyCCrTXTAb+fY0iDZ3398mqEdoBMSaTgbVVK+h0onsZJJ+prEyka25UsTdGuMWDzdNa0p4xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705846443; c=relaxed/simple;
	bh=HdFrfv9P6EvASHd1O8Rr2R13V8y8T0EsWDPDl7BPt+U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Zi3dSWJWyRJeU64vaQUUFTJhN3amvhTYFNRA28rk5LC6oBm5XNu4VjcDb9BxCCDwWtFT/0c194WsmRaiINP1GmDS3sIckBOxgyK6E39JmWTTr0yb0qI9Jk1JxddlgLP2aEllVF+N3V4ltWAjzw7XlZmv6be34bk3UuShYWs8N8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gdxvubB6; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gdxvubB6"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8394F415F1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 21 Jan 2024 14:14:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8394F415F1
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gdxvubB6
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HNsiduRyxI3a
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sun, 21 Jan 2024 14:14:00 +0000 (UTC)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D149D415E6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 21 Jan 2024 14:14:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D149D415E6
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1d3eb299e2eso10451585ad.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 21 Jan 2024 06:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705846440; x=1706451240; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3ekJHTnHK4gdigmvMkmUkFgMku9gNL5ydtbrVkOYdWY=;
        b=gdxvubB6ruxGd6IUFgrzLFDU/3Bv8ifhaYrgCaZcWf1I4bwAvjQekozlliHEl6tmrf
         BF4gh+/lUCE7Cw5zBOQOpJpP0EDaMSLphKH3tX4vd5dBGHr/AeTdYImSFFKyu+2TEl96
         I6mbmYLemfCQEWUG57XiXkB8/Cy2mn4CWk7WcfXuKPWRD/rLtnXnuq43Z6wOSTxXceUa
         DbK8iRN1fw3kDWxHGcb0V4FYuUYm6/0m11mqkhVZ+MlNVbeKLTclKEAPfgG/IM+RS7D6
         1XHJh48CJzDGNTxrRyeHgDS+vVNtZGXW6IYneBoNbTMPgbS3AZSR9/466AhxP4NO9+VF
         l8IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705846440; x=1706451240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ekJHTnHK4gdigmvMkmUkFgMku9gNL5ydtbrVkOYdWY=;
        b=t0Ms4gMe8VGYKYYaKSnQ7hvdsbYAInR8cOiQLiEIdQEISmI+JvdY+y/6vNUQRbeM24
         7eqIcCjLFRxSczzF1Aal6Eyh1DrqcpaA0iJa3Y8VHjF+XCwyC9V35Cpr/Cuw49hD+B/y
         qHIhBBWVR75UfWkLqMhg2U24VBZoDT5hvMe8z5brBoq4A2QDL8ooRIeFqjJXo+AT6VVW
         YWq8tYyxYlnNkX8K0CWMgobrwp/DXjthvcy/bOsnkNj/ahizAulPb1kdtivtWMazyy4R
         pqZWIG+VAPETpppK56+a6pgE4YqBR5H9YBoGA4MYGYvEUyZ7AyY+R9Lelv5SSzXnmu9Y
         X1dg==
X-Gm-Message-State: AOJu0YxP6ErDH3vgGq9lgfJk8Qm7IGnTEm4SFOeXuOeKM5tPKeg8LMoY
	CTphWB63deR0eyY/a1dT0sJXa7M4bEVCoxxx4xk/oyuxXpiVOkRG
X-Google-Smtp-Source: AGHT+IGIqsRmF5Fa9LHdTgjaecLhXHxMP8/0FWmvL4StTvOCGQSqElyvo9qozvMmJmbO5PwvT6FxUw==
X-Received: by 2002:a17:902:e5c3:b0:1d4:c98d:40de with SMTP id u3-20020a170902e5c300b001d4c98d40demr1250850plf.71.1705846440147;
        Sun, 21 Jan 2024 06:14:00 -0800 (PST)
Received: from vivek-host.. ([2405:201:d003:7018:e1d4:ba58:9c54:9742])
        by smtp.gmail.com with ESMTPSA id t10-20020a170902d28a00b001d72b3b0ee6sm2607123plc.248.2024.01.21.06.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jan 2024 06:13:59 -0800 (PST)
From: Vivek Yadav <vivekyadav1207731111@gmail.com>
To: skhan@linuxfoundation.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	Vivek Yadav <vivekyadav1207731111@gmail.com>
Subject: [PATCH] Test: Driver: Hello World module accept command line argument
Date: Sun, 21 Jan 2024 19:43:54 +0530
Message-Id: <20240121141354.75893-1-vivekyadav1207731111@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

- This module accept command line argument as string and print
them as well in dmesg.

Signed-off-by: Vivek Yadav <vivekyadav1207731111@gmail.com>
---
 drivers/HelloWorld/HelloWorld-2.c | 37 +++++++++++++++++++++++++++++++
 drivers/HelloWorld/Kconfig        |  1 -
 drivers/HelloWorld/Makefile       |  2 +-
 3 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100644 drivers/HelloWorld/HelloWorld-2.c

diff --git a/drivers/HelloWorld/HelloWorld-2.c b/drivers/HelloWorld/HelloWorld-2.c
new file mode 100644
index 000000000000..4b2661fab6b1
--- /dev/null
+++ b/drivers/HelloWorld/HelloWorld-2.c
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0
+/* This is test file for Linux kernel module
+ * Here I have written a simple Hello World module
+ *
+ * author : Vivek Yadav
+ */
+
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/moduleparam.h>
+
+char *cmd_param = " ";
+int count;
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Vivek Yadav");
+MODULE_DESCRIPTION("Simple Hello World Kernel Module with command line parameters");
+
+module_param(cmd_param, charp, 0644);
+module_param(count, int, 0);
+
+static int __init hello_init_module(void)
+{
+	pr_info("Hello World 2.\n");
+	pr_info("cmd_param = %s\n", cmd_param);
+	pr_info("string count = %d\n", count);
+	return 0;
+}
+
+static void __exit hello_cleanup_module(void)
+{
+	pr_info("Goodbye World 2.\n");
+}
+
+module_init(hello_init_module);
+module_exit(hello_cleanup_module);
diff --git a/drivers/HelloWorld/Kconfig b/drivers/HelloWorld/Kconfig
index 27606645f577..eed8a6c7c40d 100644
--- a/drivers/HelloWorld/Kconfig
+++ b/drivers/HelloWorld/Kconfig
@@ -1,5 +1,4 @@
 menu "Hello Module Kernel Support"
-​
 config HELLO_WORLD
         tristate "Hello Module Driver"
         depends on X86
diff --git a/drivers/HelloWorld/Makefile b/drivers/HelloWorld/Makefile
index 03c1da296446..8ffb53ac21e7 100644
--- a/drivers/HelloWorld/Makefile
+++ b/drivers/HelloWorld/Makefile
@@ -1 +1 @@
-obj-$(CONFIG_HELLO_WORLD)	+= HelloWorld-1.o
+obj-$(CONFIG_HELLO_WORLD)	+= HelloWorld-1.o HelloWorld-2.o
-- 
2.34.1

