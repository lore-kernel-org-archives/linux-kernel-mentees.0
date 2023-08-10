Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C762AC04A94
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 10 Aug 2023 07:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E39A4194A;
	Thu, 10 Aug 2023 07:46:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E39A4194A
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=h+7tOucT
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0ut7GY3I8rAi; Thu, 10 Aug 2023 07:46:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id DBC05418FB;
	Thu, 10 Aug 2023 07:46:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBC05418FB
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B660CC0071;
	Thu, 10 Aug 2023 07:46:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8F1D0C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Aug 2023 07:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B23E4194A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Aug 2023 07:46:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B23E4194A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pXDs8w5kHY_B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Aug 2023 07:46:39 +0000 (UTC)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 85CDA418FB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Aug 2023 07:46:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85CDA418FB
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1bc6624623cso5925115ad.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Aug 2023 00:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691653599; x=1692258399;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6gTz6hcoAzVZcSGAehaR348Fo/uyOm0OL4hmIYIrZZA=;
 b=h+7tOucTOdOz8TQvOUT0sabcTzCnlSOWbL7VcjubyhRJs+QRtvKFAzzRM9L9nIdS1P
 nNqSVk11YEy+loiPRdPtrDsxc70BDIN/FdnI/Gv++3cDOqT+dy2jNySYJHJSn74O76VA
 8O++XVsIB+8Am+HaqWRxb46ZiM3DX4Xdt92RorosZGzSSzsjbQqETzrV/kziY0D9qqGY
 Kyi9t12RhX+pLWrsHLReJJRmDedo44LaAn/d07J61w5mgYvc9qqfkOPirZXn1pDuGzJa
 tcqt0dAzZofras8bhHuFKI6PVblJz64hhuhZUeBblGaP4bd8MYWSPLmkBaLMlnLp96NR
 yVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691653599; x=1692258399;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6gTz6hcoAzVZcSGAehaR348Fo/uyOm0OL4hmIYIrZZA=;
 b=lqDsloWhcStW9Orrxa1zgUvoKD94i4pcdOq9+8Y200MWtdp41r1wV8l9xpklWYNqa/
 nDrY0w0Ksi92qTfTPVrO5g2OgHZUCZ3cqCtviw3hVYRrWQ7ZDR/4jdWBsYo0GNNbKo8Z
 DkOavcAQcdqJ37ARkdKEbXLdqJfEF3AGO4NOBErYHTEngm6wOzCvI9wKcPqILHTFoxR8
 lIsSDG77eoj+WGbFjAmqulgrEdNTqJudsghU4Hg8eRxodEu8nrF5r9CwI/dH6iH7wfwg
 RanVxbz0g4Lo/ud+5MrcGCZyZCuhAeeex1llc/NzD/TtxGA4T0/+Ae8c8Edek4ivIOET
 bP9Q==
X-Gm-Message-State: AOJu0YxNg4fN55PtlxrhhmzfnfHkLi5yMSfdqhBbqkQBkjcUqdS/lnyy
 7ZrwSG7cEreYAvir8O9p0fo=
X-Google-Smtp-Source: AGHT+IEdVgZI7BPbqizq8DoWCJq/ZmRAIgZoKv81fEAzLLFHRJbKGVmqf2OVRsvfxWzC9SRZcQGVeQ==
X-Received: by 2002:a17:902:ba86:b0:1b9:ebe9:5f01 with SMTP id
 k6-20020a170902ba8600b001b9ebe95f01mr1637726pls.19.1691653598860; 
 Thu, 10 Aug 2023 00:46:38 -0700 (PDT)
Received: from localhost.localdomain ([2409:40c2:103c:968b:4dc8:d063:71b0:bea])
 by smtp.gmail.com with ESMTPSA id
 a15-20020a170902710f00b001bd99fd1114sm948570pll.288.2023.08.10.00.46.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Aug 2023 00:46:38 -0700 (PDT)
From: coolrrsh@gmail.com
To: linus.walleij@linaro.org, brgl@bgdev.pl, andy@kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] gpio: gpio-imx-scu: Use ARRAY_SIZE for array length
Date: Thu, 10 Aug 2023 13:16:33 +0530
Message-Id: <20230810074633.13111-1-coolrrsh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

From: Rajeshwar R Shinde <coolrrsh@gmail.com>

Use of macro ARRAY_SIZE to calculate array size minimizes
the redundant code and improves code reusability.
This fixes warnings reported by Coccinelle:
drivers/gpio/gpio-imx-scu.c:106:32-33: WARNING: Use ARRAY_SIZE

Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>

---
v1->v2
ARRAY_SIZE calculates array length, so changed 
gc->ngpio = ARRAY_SIZE(scu_rsrc_arr)/sizeof(unsigned int) to
gc->ngpio = ARRAY_SIZE(scu_rsrc_arr)

---
 drivers/gpio/gpio-imx-scu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-imx-scu.c b/drivers/gpio/gpio-imx-scu.c
index e190bde5397d..fb05a53c9712 100644
--- a/drivers/gpio/gpio-imx-scu.c
+++ b/drivers/gpio/gpio-imx-scu.c
@@ -103,7 +103,7 @@ static int imx_scu_gpio_probe(struct platform_device *pdev)
 	gc = &priv->chip;
 	gc->base = -1;
 	gc->parent = dev;
-	gc->ngpio = sizeof(scu_rsrc_arr)/sizeof(unsigned int);
+	gc->ngpio = ARRAY_SIZE(scu_rsrc_arr);
 	gc->label = dev_name(dev);
 	gc->get = imx_scu_gpio_get;
 	gc->set = imx_scu_gpio_set;
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
