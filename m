Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB972F5A35
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Oct 2025 20:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761337992; cv=none; b=ci43c9kCFMUYMzcyBL2QJrkMu58iVuziai9Yjz+eOwCHZcYP2KOVoBbpcLW22tj8+d0i5IChlpPndUn4X7QDNmi+V9sXrpYgIr+0Chk6vw2HRKVgNVb8kpiN9Hl7nSli/+rUmlWUlht9zf6mNssHnXL5GHUtLau8B+q7Q4PMcko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761337992; c=relaxed/simple;
	bh=M+QKMmvV0bNnfc2WljclJUjnbTezHccdmqdJwxLZIfU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PzlPTRWsdoAsrRKfLM4ISwGWpK2Zv2hZmsIovfL9M0xJ2rG7qxwxRPrvSNx4H1cgsgn5uLfHFHIzUG7VPrtvwmUf5UXYRYJoVHEkhGyOKKS6Dta1Mt6cRqI4dp1/XHAHbCdO6NHedpJN7fflvcbJbvjJGM0iooqbioDUpzF27YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mzcjzb91; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mzcjzb91"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4268040176
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Oct 2025 20:33:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1d-mV6AeaiKQ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Oct 2025 20:33:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=nirbhay.lkd@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9C81140A1B
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C81140A1B
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Mzcjzb91
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 9C81140A1B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Oct 2025 20:33:08 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-781997d195aso1856892b3a.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Oct 2025 13:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761337988; x=1761942788; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HT9OXi9xpvGg82iMjJaDP+584hWboOuM7qgkAJ2wEJk=;
        b=Mzcjzb91+W5r44KLyvslHIM8xGrWXtMobMzBVqjr5OcJQHt8oKGBdn0AyuqPmgCnDQ
         47MOP8k2ZwEKx0smobOfaJL5EHVK7cxP3UNmtT4yoCR0E6r2DgpHe63pskAnkTcH1sUC
         5E+cmTqofFk9hZ/zTbV48JPnVQEE8PUCuuUAJ0kFs7w5ArRHI8uRxYBVP5UBzBqu8lL4
         MJnoAAjI1M88eoRniMI2cJMProVRhYnNI07Na3kVN3CsmcyeT+QajxzugVBs3sg6zo8z
         P9/RlzXdgfqfcpUlqUXIcybkiZBiKbWoXUlKjS6tBuqoljZ7nL8i0a3TObnRSb5Q1FLa
         vOyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761337988; x=1761942788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HT9OXi9xpvGg82iMjJaDP+584hWboOuM7qgkAJ2wEJk=;
        b=SRouAexBMqZ2ZkrSOu4QbLdAIUxK3bYzykrWjcPdX5iMK1JPbU+0mo2giRTzBJlueu
         aMDyBechTT8n2m5HeYhx7mMQmLFt9qmTKzDdiEnkCrmE3FVBa8iBUeDGOW7IRx7TiIqn
         ygWPZ6fNwWcYtti4Mq/H32I/XPH7WvwHx4b2jWyb4TzYYaq4WSgNiJevsz6zHvRyeuMJ
         85a96YP/GEDU++1HzmmpyHPO0WPjhpTmjzXiTNXPl8jJQVn6E8nj6VhBL01i34gqeLje
         1qLwJFjQmu1FlLa0qwEUI9CbL80cJfIxREs3Xv/1IbIBjSuvUqqpzNDqY/G5KmpggctD
         CNJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVb95ffKPwqxJzhAeaa9LPXaHF9aTxWxJ5TKImab5s5oqqVEQzdshoR99XchdMHoFzLDxYEWVxUpUi2IBkPua+5BFdrag==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzraYUIjQ1rAzbEJbszQhfeIvnSS6mCN6Mm5+Rab0so9UixAEw4
	IfYQ74wilDflPBXVyRAV3LuNyuxFDfmSlhW5UScnU4xbc7Srip/5Y1tY
X-Gm-Gg: ASbGncuxb4yFhK8h2wVAalWb93laVXoNp5GgKjO/4MMtfz+uh4lV7B7mRfZN6dGIY0B
	hzenXMuGbgwMpWUQV9xYuz1UuuDXiRU/9+k5LRgO1T1qLmLxu5SLjQb7QgUTfcLTBuvz2XJCPNB
	fz4y747c8LPrMpXFdgwX8kSD1RSsM1xZHOAsyYcp8kizPztJHta88/MgSK1g5o2YBxA1efyn814
	Tco2wLRZl38LjU5qJNHXYsdFti9mPZwebz+VnwJ6h4aEy91EkEDAVeC6VWH2v8uxAu/fIeNM7fa
	x1Onorn8GZpWddltu2fIwBiRJy6moFhNa7DZts8YS3sSNw2KJr3GzkNnft4NgC3FOfojJIqaTef
	niy7MtRtHZzZ5GH1KovXlhF+4o7KYQ/oRmtk5mxzgUWrXkriv4xcyUwzHuTu+cuXbQHyr5GXZXp
	/nToi9J4+CwvnywCWbJ3Zsgi+h7NXRzzr4tNh5nhUo9myQL0I2Q+LV995LlSxNMpSBrw==
X-Google-Smtp-Source: AGHT+IGM1Dfat1jFWLD+mla/ZVzpPBcGl/Gp9rm91qQtIDrO11XCxDElasjpjla05zS4qVgbiHDugg==
X-Received: by 2002:a05:6a00:92aa:b0:79a:fd01:dfa9 with SMTP id d2e1a72fcca58-7a286765c70mr4265309b3a.6.1761337987653;
        Fri, 24 Oct 2025 13:33:07 -0700 (PDT)
Received: from prakrititz-UB.. ([2a09:bac5:3c3b:a82::10c:5b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a41402e570sm113125b3a.15.2025.10.24.13.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 13:33:07 -0700 (PDT)
From: Nirbhay Sharma <nirbhay.lkd@gmail.com>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Nirbhay Sharma <nirbhay.lkd@gmail.com>
Subject: [PATCH] firewire: init_ohci1394_dma: add missing function parameter documentation
Date: Sat, 25 Oct 2025 02:02:19 +0530
Message-ID: <20251024203219.101990-2-nirbhay.lkd@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing kernel-doc parameter descriptions for five functions
in init_ohci1394_dma.c to fix documentation warnings when building
with W=1.

This patch addresses the following warnings:
- init_ohci1394_wait_for_busresets: missing @ohci description
- init_ohci1394_enable_physical_dma: missing @ohci description
- init_ohci1394_reset_and_init_dma: missing @ohci description
- init_ohci1394_controller: missing @num, @slot, @func descriptions
- setup_ohci1394_dma: missing @opt description

Tested with GCC 13.2.0 and W=1 flag. All documentation warnings
for these functions have been resolved.

Signed-off-by: Nirbhay Sharma <nirbhay.lkd@gmail.com>
---
 drivers/firewire/init_ohci1394_dma.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/firewire/init_ohci1394_dma.c b/drivers/firewire/init_ohci1394_dma.c
index 48b879e9e831..121f0c2f6401 100644
--- a/drivers/firewire/init_ohci1394_dma.c
+++ b/drivers/firewire/init_ohci1394_dma.c
@@ -167,6 +167,7 @@ static inline void __init init_ohci1394_initialize(struct ohci *ohci)
 
 /**
  * init_ohci1394_wait_for_busresets - wait until bus resets are completed
+ * @ohci: Pointer to the OHCI-1394 controller structure
  *
  * OHCI1394 initialization itself and any device going on- or offline
  * and any cable issue cause a IEEE1394 bus reset. The OHCI1394 spec
@@ -189,6 +190,8 @@ static inline void __init init_ohci1394_wait_for_busresets(struct ohci *ohci)
 
 /**
  * init_ohci1394_enable_physical_dma - Enable physical DMA for remote debugging
+ * @ohci: Pointer to the OHCI-1394 controller structure
+ *
  * This enables remote DMA access over IEEE1394 from every host for the low
  * 4GB of address space. DMA accesses above 4GB are not available currently.
  */
@@ -201,6 +204,8 @@ static inline void __init init_ohci1394_enable_physical_dma(struct ohci *ohci)
 
 /**
  * init_ohci1394_reset_and_init_dma - init controller and enable DMA
+ * @ohci: Pointer to the OHCI-1394 controller structure
+ *
  * This initializes the given controller and enables physical DMA engine in it.
  */
 static inline void __init init_ohci1394_reset_and_init_dma(struct ohci *ohci)
@@ -230,6 +235,10 @@ static inline void __init init_ohci1394_reset_and_init_dma(struct ohci *ohci)
 
 /**
  * init_ohci1394_controller - Map the registers of the controller and init DMA
+ * @num: PCI bus number
+ * @slot: PCI device number
+ * @func: PCI function number
+ *
  * This maps the registers of the specified controller and initializes it
  */
 static inline void __init init_ohci1394_controller(int num, int slot, int func)
@@ -284,6 +293,7 @@ void __init init_ohci1394_dma_on_all_controllers(void)
 
 /**
  * setup_ohci1394_dma - enables early OHCI1394 DMA initialization
+ * @opt: Kernel command line parameter string
  */
 static int __init setup_ohci1394_dma(char *opt)
 {
-- 
2.48.1

