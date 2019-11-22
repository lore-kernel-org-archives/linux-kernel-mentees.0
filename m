Return-Path: <SRS0=fwyv=ZO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1221DC432C3
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 22 Nov 2019 03:55:15 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D81802068D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 22 Nov 2019 03:55:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sxmjshlz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D81802068D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B1BD08722F;
	Fri, 22 Nov 2019 03:55:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a84gwmt2NL_X; Fri, 22 Nov 2019 03:55:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 48CC786C31;
	Fri, 22 Nov 2019 03:55:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3DD49C1DD8;
	Fri, 22 Nov 2019 03:55:14 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8357C18DA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Nov 2019 03:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id CFB7688A37
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Nov 2019 03:55:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zl5xQtJX2fae
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Nov 2019 03:55:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3277F88A05
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Nov 2019 03:55:12 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id h15so5081727qka.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Nov 2019 19:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qJgHMdwa86FwHH2BnJx9o+uMlPWtDWtUBpBKhEzQlcY=;
 b=Sxmjshlz5yQTTOAu4nNlUJS9ai2wiwJeX0ygWPGzFMWcijwQNby78HeDWMV3GcWFGr
 dKFhOWQ+5YutSHLh/72G2qH+4/W/9tSp4AA31Y17O1jJPG6dwxRTnkOdA6du+xVZ+quh
 EoZTOmtQLwoPJaAEegsbqDbIgy0UZpXXwViXBAgv7b3Xe9y06o8mZPHcEABc4PUQqYup
 9OqZ8KgEUA3NgMcEitln6PK2S1p99eQMyVYhWJCxOIuUEoSSP2jamezxHyVeU5pMMa2r
 oJn7oOSLBcxArtpGepvPTBLbKlJz2OGAk5n3usrTUVmWwKNXBS2W5JxY0x+ZE9sw+ZF8
 gHXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qJgHMdwa86FwHH2BnJx9o+uMlPWtDWtUBpBKhEzQlcY=;
 b=t/7pZFkBpzKkUGxYcrSs61S2bnorOsmN8Pj3JbfKrvL5VFE2kDNcFOiUN7mVjLDgva
 ecYHznWOkMfBogFSpQpLH6D7XiBWL5ovykkhWlBJs23Psr+JbOPnCePdR0Yfq4mWB3ut
 XlLRSeN8fhsEihuLUxoiz1Tdlt/kwtyu2ck4i89lQtwfI4OmxhPPXm99RyPRW0Xe6WbP
 IJa60VhOSY/DMkM9tmPJSgDMzBNdcY6CLDg5ewZJTn43c51LIhZkqULhqd0gitB4r/QJ
 EdOO9DA8y1Pdi7a/YhNxCUAEgeJ59lse6bebnD2nSGF0Mwvx5phh4FSxtHnQb4s7qSJg
 2nRA==
X-Gm-Message-State: APjAAAVTNQt3QPmFK/tJNAmZYRqbWmmx8phA5czuGpyWkyivRhOkM8mS
 llOZ9aZE2zWLEEWcqeDuL5w=
X-Google-Smtp-Source: APXvYqyUtQvoeHjTF0Q5RJf3zqSSH2BrJdKM5Vc34ZQusjqABGdyO8t9oxG78TRsAwjdEakEXLs4mw==
X-Received: by 2002:a37:4884:: with SMTP id v126mr11657411qka.45.1574394910917; 
 Thu, 21 Nov 2019 19:55:10 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id p54sm2873833qta.39.2019.11.21.19.55.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 19:55:10 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: linus.walleij@linaro.org,
	corbet@lwn.net,
	bgolaszewski@baylibre.com
Date: Fri, 22 Nov 2019 00:47:02 -0300
Message-Id: <20191122034702.58563-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH] Documentation: gpio: driver.rst: Fix
	warnings
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

Fix warnings due to incorrect rst markup. Also improved the presentation
a little without changing the underlying content.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 Documentation/driver-api/gpio/driver.rst | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/Documentation/driver-api/gpio/driver.rst b/Documentation/driver-api/gpio/driver.rst
index 3fdb32422f8a..c58f54783237 100644
--- a/Documentation/driver-api/gpio/driver.rst
+++ b/Documentation/driver-api/gpio/driver.rst
@@ -5,7 +5,7 @@ GPIO Driver Interface
 This document serves as a guide for writers of GPIO chip drivers.
 
 Each GPIO controller driver needs to include the following header, which defines
-the structures used to define a GPIO driver:
+the structures used to define a GPIO driver::
 
 	#include <linux/gpio/driver.h>
 
@@ -398,12 +398,15 @@ provided. A big portion of overhead code will be managed by gpiolib,
 under the assumption that your interrupts are 1-to-1-mapped to the
 GPIO line index:
 
-  GPIO line offset   Hardware IRQ
-  0                  0
-  1                  1
-  2                  2
-  ...                ...
-  ngpio-1            ngpio-1
+.. csv-table::
+    :header: GPIO line offset, Hardware IRQ
+
+    0,0
+    1,1
+    2,2
+    ...,...
+    ngpio-1, ngpio-1
+
 
 If some GPIO lines do not have corresponding IRQs, the bitmask valid_mask
 and the flag need_valid_mask in gpio_irq_chip can be used to mask off some
@@ -413,7 +416,7 @@ The preferred way to set up the helpers is to fill in the
 struct gpio_irq_chip inside struct gpio_chip before adding the gpio_chip.
 If you do this, the additional irq_chip will be set up by gpiolib at the
 same time as setting up the rest of the GPIO functionality. The following
-is a typical example of a cascaded interrupt handler using gpio_irq_chip:
+is a typical example of a cascaded interrupt handler using gpio_irq_chip::
 
   /* Typical state container with dynamic irqchip */
   struct my_gpio {
@@ -448,7 +451,7 @@ is a typical example of a cascaded interrupt handler using gpio_irq_chip:
   return devm_gpiochip_add_data(dev, &g->gc, g);
 
 The helper support using hierarchical interrupt controllers as well.
-In this case the typical set-up will look like this:
+In this case the typical set-up will look like this::
 
   /* Typical state container with dynamic irqchip */
   struct my_gpio {
-- 
2.24.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
