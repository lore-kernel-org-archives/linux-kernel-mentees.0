Return-Path: <SRS0=16qS=AY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02103C4345F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:23:07 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C75612072D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:23:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="va14DwSp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C75612072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id AC54D2201C;
	Mon, 13 Jul 2020 13:23:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rk7qBciobPEZ; Mon, 13 Jul 2020 13:23:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2CFDD21511;
	Mon, 13 Jul 2020 13:23:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1F8D0C0888;
	Mon, 13 Jul 2020 13:23:05 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AA767C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3B8B7876C5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 09VZvZOC7fDb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5763B876C3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:02 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id dr13so17158810ejc.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 06:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=WeyIeoPZJMXK7vhLHL5c0YV2wwYi5JPUEFrxzTX8RvU=;
 b=va14DwSpJTk8Hv73zRY2TzzhxmZEFmEKBsfKXWnt/tzVTOr74i7qtpDWIp4vmQMCAk
 wxYB0bW9tYz22zJj8OOtOi6N6bWeBzWo3lSiWKmps+V96kj1qxSE3QFi9C2Gzqd5YZaX
 6cOeVRPEPWamg1UBvZrCC3b9/xKGFeZ/lvllDTgYQ67sZ6eseA6VrCI4nMR9ipMAdB5V
 8IjA/EOJGUyLhipxOaXpWCoZTwBGBotZf2uFyOnPyLWJMxn4IAzBLMREPrQdOH3U+WJK
 Lo/IdoSaucGHkIZCHDI2TlTI3UEyeqroXs5xoA5KQ2KdyUlT+5/nUpNxnknP4tFcEAJy
 jB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=WeyIeoPZJMXK7vhLHL5c0YV2wwYi5JPUEFrxzTX8RvU=;
 b=GnVDUDUeSpnlZsP/0959f1qyc3QWi6mL1HbGNsnXjbXmNkwZwwBQh+M5dhxO/ReE2z
 QfOIZB6tJQyNxMozt2OCyrZgNBfQKyrkXuPf448qpUAHVnyHQz+vNP9nGQmVF06j0kmI
 F3HmOm6xFFJoN8H5zNgTmK/I4en2X0iNpOjROX3ZnDRiWIdEpb7xIU5ncVYGA8wW1S8y
 XBvEGFtwj3eK5/Y42lxeJTwaPo/Jn7/rGZCmM8oKMLeixCp57zhYrl+0Jf9umFjRYHpk
 6PxODw3ALgw03phGNzIdMr+UNXIoaUz119oUKusQ+tNf6nGgmxMLiXs5tShI03+Yj5ta
 XX/A==
X-Gm-Message-State: AOAM533yS/Dp43B92pEzejuwIMgDYHRsoUqmxCPwHyIhDCWZPjnATWYH
 jHHwfG1QkRe5l1XQSAMD4xk=
X-Google-Smtp-Source: ABdhPJwUjqmZeNSlCTAl57KxA+cutsVpR1kCU85dk+qzkHj4E1FjAK7/IQ+7zYeHb5tZSd31kCRd1A==
X-Received: by 2002:a17:906:4dd4:: with SMTP id
 f20mr77156370ejw.170.1594646580813; 
 Mon, 13 Jul 2020 06:23:00 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id n9sm11806540edr.46.2020.07.13.06.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 06:23:00 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>
Date: Mon, 13 Jul 2020 14:22:29 +0200
Message-Id: <20200713122247.10985-18-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200713122247.10985-1-refactormyself@gmail.com>
References: <20200713122247.10985-1-refactormyself@gmail.com>
Cc: linux-hwmon@vger.kernel.org,
 "Saheed O. Bolarinwa" <refactormyself@gmail.com>, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 17/35] hwmon: (sis5595) Tidy
	Success/Failure checks
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Remove unnecessary check for 0.

Signed-off-by: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
---
This patch depends on PATCH 16/35

 drivers/hwmon/sis5595.c | 13 ++++---------
 drivers/hwmon/via686a.c | 13 ++++---------
 drivers/hwmon/vt8231.c  | 13 ++++---------
 3 files changed, 12 insertions(+), 27 deletions(-)

diff --git a/drivers/hwmon/sis5595.c b/drivers/hwmon/sis5595.c
index 0ea174fb3048..91fdddaa4136 100644
--- a/drivers/hwmon/sis5595.c
+++ b/drivers/hwmon/sis5595.c
@@ -825,8 +825,7 @@ static int sis5595_pci_probe(struct pci_dev *dev,
 		pci_write_config_word(dev, SIS5595_BASE_REG, force_addr);
 	}
 
-	if (0 !=
-	    pci_read_config_word(dev, SIS5595_BASE_REG, &address)) {
+	if (pci_read_config_word(dev, SIS5595_BASE_REG, &address)) {
 		dev_err(&dev->dev, "Failed to read ISA address\n");
 		return -ENODEV;
 	}
@@ -843,17 +842,13 @@ static int sis5595_pci_probe(struct pci_dev *dev,
 		return -ENODEV;
 	}
 
-	if (0 !=
-	    pci_read_config_byte(dev, SIS5595_ENABLE_REG, &enable)) {
+	if (pci_read_config_byte(dev, SIS5595_ENABLE_REG, &enable)) {
 		dev_err(&dev->dev, "Failed to read enable register\n");
 		return -ENODEV;
 	}
 	if (!(enable & 0x80)) {
-		if ((0 !=
-		     pci_write_config_byte(dev, SIS5595_ENABLE_REG,
-					   enable | 0x80))
-		 || (0 !=
-		     pci_read_config_byte(dev, SIS5595_ENABLE_REG, &enable))
+		if ((pci_write_config_byte(dev, SIS5595_ENABLE_REG, enable | 0x80))
+		 || (pci_read_config_byte(dev, SIS5595_ENABLE_REG, &enable))
 		 || (!(enable & 0x80))) {
 			/* doesn't work for some chips! */
 			dev_err(&dev->dev, "Failed to enable HWM device\n");
diff --git a/drivers/hwmon/via686a.c b/drivers/hwmon/via686a.c
index cffea688878f..b8466e2e1435 100644
--- a/drivers/hwmon/via686a.c
+++ b/drivers/hwmon/via686a.c
@@ -863,12 +863,10 @@ static int via686a_pci_probe(struct pci_dev *dev,
 	if (force_addr) {
 		address = force_addr & ~(VIA686A_EXTENT - 1);
 		dev_warn(&dev->dev, "Forcing ISA address 0x%x\n", address);
-		if (0 !=
-		    pci_write_config_word(dev, VIA686A_BASE_REG, address | 1))
+		if (pci_write_config_word(dev, VIA686A_BASE_REG, address | 1))
 			return -ENODEV;
 	}
-	if (0 !=
-	    pci_read_config_word(dev, VIA686A_BASE_REG, &val))
+	if (pci_read_config_word(dev, VIA686A_BASE_REG, &val))
 		return -ENODEV;
 
 	address = val & ~(VIA686A_EXTENT - 1);
@@ -878,8 +876,7 @@ static int via686a_pci_probe(struct pci_dev *dev,
 		return -ENODEV;
 	}
 
-	if (0 !=
-	    pci_read_config_word(dev, VIA686A_ENABLE_REG, &val))
+	if (pci_read_config_word(dev, VIA686A_ENABLE_REG, &val))
 		return -ENODEV;
 	if (!(val & 0x0001)) {
 		if (!force_addr) {
@@ -890,9 +887,7 @@ static int via686a_pci_probe(struct pci_dev *dev,
 		}
 
 		dev_warn(&dev->dev, "Enabling sensors\n");
-		if (0 !=
-		    pci_write_config_word(dev, VIA686A_ENABLE_REG,
-					  val | 0x0001))
+		if (pci_write_config_word(dev, VIA686A_ENABLE_REG, val | 0x0001))
 			return -ENODEV;
 	}
 
diff --git a/drivers/hwmon/vt8231.c b/drivers/hwmon/vt8231.c
index cc1d24c2a2c8..ee6cd6b85f91 100644
--- a/drivers/hwmon/vt8231.c
+++ b/drivers/hwmon/vt8231.c
@@ -987,13 +987,11 @@ static int vt8231_pci_probe(struct pci_dev *dev,
 		dev_warn(&dev->dev, "Forcing ISA address 0x%x\n",
 			 address);
 
-		if (0 !=
-		    pci_write_config_word(dev, VT8231_BASE_REG, address | 1))
+		if (pci_write_config_word(dev, VT8231_BASE_REG, address | 1))
 			return -ENODEV;
 	}
 
-	if (0 != pci_read_config_word(dev, VT8231_BASE_REG,
-							&val))
+	if (pci_read_config_word(dev, VT8231_BASE_REG, &val))
 		return -ENODEV;
 
 	address = val & ~(VT8231_EXTENT - 1);
@@ -1002,15 +1000,12 @@ static int vt8231_pci_probe(struct pci_dev *dev,
 		return -ENODEV;
 	}
 
-	if (0 != pci_read_config_word(dev, VT8231_ENABLE_REG,
-							&val))
+	if (pci_read_config_word(dev, VT8231_ENABLE_REG, &val))
 		return -ENODEV;
 
 	if (!(val & 0x0001)) {
 		dev_warn(&dev->dev, "enabling sensors\n");
-		if (0 !=
-			pci_write_config_word(dev, VT8231_ENABLE_REG,
-							val | 0x0001))
+		if (pci_write_config_word(dev, VT8231_ENABLE_REG, val | 0x0001))
 			return -ENODEV;
 	}
 
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
