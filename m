Return-Path: <SRS0=ZuYk=KS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46F95C47083
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 May 2021 21:09:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C47416115C
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 May 2021 21:09:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C47416115C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85D6140323;
	Sun, 23 May 2021 21:09:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c4iBVjvMNzEJ; Sun, 23 May 2021 21:09:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 896B140315;
	Sun, 23 May 2021 21:09:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6EA04C000E;
	Sun, 23 May 2021 21:09:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CE9F1C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 May 2021 21:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4AA240318
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 May 2021 21:09:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id heV5C7LBiRWC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 May 2021 21:09:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7816540315
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 May 2021 21:09:20 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id x188so19172905pfd.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 May 2021 14:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=IB9O/onuOCJfiGo3cCn1xQC6qADxQorwK+ixiVlG76Q=;
 b=lRIrsodFwZZAENLZ5mkS+tGezVajr5a5iNeVhU7v0QZta/bQKCxso0vPWl+R3Jobir
 bTIy/+nulorVCQIVWgNhIKzOGMW1D/9Z9gCG+LYk/NOiGLBCJ025jlEUXfuIJAjhoWMJ
 jSzTZ09frJfemTn5wKY3ZeqWQSqqC2vLGkqzZ2ZYr3tZuADTaIJIQAbszytaA4KpBdxS
 gcyVlUK/9pcZXI04a6G1RnVbJHryPwkqv4By6fVQHGjKEcIRe5rZLlicibiDuLfJA/lh
 dstSQyn2kodjqlCjLdvXHgnmwb712qb6CWXjTuEu/0tw6iS0xZp+GW+7wd7Us1pdKEKo
 HDaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=IB9O/onuOCJfiGo3cCn1xQC6qADxQorwK+ixiVlG76Q=;
 b=mKGEOF+xtdkdjqjxrl/RWfOH7WvMyw2G/kpahlk/AiQp+SAJGw7yLPNop4oaMNLRaB
 2mcxFDrJcepOvjxQvUC1HsG47+HX4g/7j8G1B7LPupg3HfAN/ozo2rlJk0iBEQ9mw5Sg
 imNGbpHJMwFXR5WYsxk3b5Tm2Zpuawkd5sgF28PlBsC6KBe445UU47JITuzRQ+L8dTFI
 zvBBYLsJFr9Gf+VaNhQsVjZvhTWo0mIeMEE7Tw29+MqmkU40S++erxI3JPs5byXe1NnR
 yI5Ef1Vq8tD6yhAt+qz6Tt+kqjY88reaj7bbKs8gnv+wqCdtnYwy9SJoFmKCmFGfakl8
 gjDg==
X-Gm-Message-State: AOAM532WFL6x7eN6jRHxMRILjhbRSCX8Xd1/4bB6BQxHDale71yC1wV2
 t8Sefqa7fStpcie8LDJCS+c=
X-Google-Smtp-Source: ABdhPJy7ij8n3XWFurV3WYaYbh1UADV8mZC5Io4JLFY9Tx7UiOM/EArFULzv1ijxNEu+28Jmo/eqAQ==
X-Received: by 2002:a63:34cc:: with SMTP id
 b195mr10033021pga.449.1621804159685; 
 Sun, 23 May 2021 14:09:19 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a93f:c492:941f:bc2a:cc89])
 by smtp.googlemail.com with ESMTPSA id n6sm10034854pgm.79.2021.05.23.14.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 May 2021 14:09:19 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: krzysztof.kozlowski@canonical.com
Subject: [PATCH] NFC: nfcmrvl: fix kernel-doc syntax in file headers
Date: Mon, 24 May 2021 02:39:09 +0530
Message-Id: <20210523210909.5359-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-nfc@lists.01.org, linux-doc@vger.kernel.org, netdev@vger.kernel.org,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org, yashsri421@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
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

The opening comment mark '/**' is used for highlighting the beginning of
kernel-doc comments.
The header for drivers/nfc/nfcmrvl follows this syntax, but the content
inside does not comply with kernel-doc.

This line was probably not meant for kernel-doc parsing, but is parsed
due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
causes unexpected warnings from kernel-doc.
For e.g., running scripts/kernel-doc -none on drivers/nfc/nfcmrvl/spi.c
causes warning:
warning: expecting prototype for Marvell NFC(). Prototype was for SPI_WAIT_HANDSHAKE() instead

Provide a simple fix by replacing such occurrences with general comment
format, i.e. '/*', to prevent kernel-doc from parsing it.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 drivers/nfc/nfcmrvl/fw_dnld.h | 2 +-
 drivers/nfc/nfcmrvl/i2c.c     | 2 +-
 drivers/nfc/nfcmrvl/nfcmrvl.h | 2 +-
 drivers/nfc/nfcmrvl/spi.c     | 2 +-
 drivers/nfc/nfcmrvl/uart.c    | 2 +-
 drivers/nfc/nfcmrvl/usb.c     | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/nfc/nfcmrvl/fw_dnld.h b/drivers/nfc/nfcmrvl/fw_dnld.h
index ee4a339c05fd..058ce77b3cbc 100644
--- a/drivers/nfc/nfcmrvl/fw_dnld.h
+++ b/drivers/nfc/nfcmrvl/fw_dnld.h
@@ -1,4 +1,4 @@
-/**
+/*
  * Marvell NFC driver: Firmware downloader
  *
  * Copyright (C) 2015, Marvell International Ltd.
diff --git a/drivers/nfc/nfcmrvl/i2c.c b/drivers/nfc/nfcmrvl/i2c.c
index 18cd96284b77..c5420616b7bc 100644
--- a/drivers/nfc/nfcmrvl/i2c.c
+++ b/drivers/nfc/nfcmrvl/i2c.c
@@ -1,4 +1,4 @@
-/**
+/*
  * Marvell NFC-over-I2C driver: I2C interface related functions
  *
  * Copyright (C) 2015, Marvell International Ltd.
diff --git a/drivers/nfc/nfcmrvl/nfcmrvl.h b/drivers/nfc/nfcmrvl/nfcmrvl.h
index de68ff45e49a..e84ee18c73ae 100644
--- a/drivers/nfc/nfcmrvl/nfcmrvl.h
+++ b/drivers/nfc/nfcmrvl/nfcmrvl.h
@@ -1,4 +1,4 @@
-/**
+/*
  * Marvell NFC driver
  *
  * Copyright (C) 2014-2015, Marvell International Ltd.
diff --git a/drivers/nfc/nfcmrvl/spi.c b/drivers/nfc/nfcmrvl/spi.c
index 8e0ddb434770..dec0d3eb3648 100644
--- a/drivers/nfc/nfcmrvl/spi.c
+++ b/drivers/nfc/nfcmrvl/spi.c
@@ -1,4 +1,4 @@
-/**
+/*
  * Marvell NFC-over-SPI driver: SPI interface related functions
  *
  * Copyright (C) 2015, Marvell International Ltd.
diff --git a/drivers/nfc/nfcmrvl/uart.c b/drivers/nfc/nfcmrvl/uart.c
index e5a622ce4b95..7194dd7ef0f1 100644
--- a/drivers/nfc/nfcmrvl/uart.c
+++ b/drivers/nfc/nfcmrvl/uart.c
@@ -1,4 +1,4 @@
-/**
+/*
  * Marvell NFC-over-UART driver
  *
  * Copyright (C) 2015, Marvell International Ltd.
diff --git a/drivers/nfc/nfcmrvl/usb.c b/drivers/nfc/nfcmrvl/usb.c
index 888e298f610b..bcd563cb556c 100644
--- a/drivers/nfc/nfcmrvl/usb.c
+++ b/drivers/nfc/nfcmrvl/usb.c
@@ -1,4 +1,4 @@
-/**
+/*
  * Marvell NFC-over-USB driver: USB interface related functions
  *
  * Copyright (C) 2014, Marvell International Ltd.
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
