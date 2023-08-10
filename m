Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7CEC001E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 10 Aug 2023 13:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F7B34174F;
	Thu, 10 Aug 2023 13:06:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F7B34174F
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=mvkL5E2P
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qljZvF9TRzKJ; Thu, 10 Aug 2023 13:06:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5AD38416D1;
	Thu, 10 Aug 2023 13:06:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AD38416D1
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 35403C0072;
	Thu, 10 Aug 2023 13:06:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 05412C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Aug 2023 13:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C61AC83B0D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Aug 2023 13:06:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C61AC83B0D
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=mvkL5E2P
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZQcKPmoF6A6Y
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Aug 2023 13:06:06 +0000 (UTC)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB0238190B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Aug 2023 13:06:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB0238190B
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1bc73a2b0easo6966575ad.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Aug 2023 06:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691672766; x=1692277566;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Yu0+RXr2S4MvxeQNmu1NcD/c8jFJvuQbNcDr/8nKhYI=;
 b=mvkL5E2PVotM+rjp1G+ko5KR+EKPWXBKQk4h3a0qqt/HvFTaVhgWA6PLxU0wOhb6Pq
 S2qikBsKnGUIPu7hOO9kG2KhJRoeXSi7sRnhWkAzJHaSMobZxLxV3/1Sl4Vv7PLkdDG1
 SUggydQvO5reD8kJHNyowOW/hf7egSFjAHBzmLmmvdCju/xwXYT0VqvXnoK8ruMGWnW6
 ul6wiF39L5mAg9m+SdnO/6klfqcYsV718ZkYWC4FBnlhkvHLC5aAKJUqvhSwgnu5n+mm
 dFZdD0WxQ24eGt0oGx7ypaPzFOrtjNuuR03/gQOyx8Kn8Jaq3TswcgT93mGn+acy6aXp
 soug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691672766; x=1692277566;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Yu0+RXr2S4MvxeQNmu1NcD/c8jFJvuQbNcDr/8nKhYI=;
 b=HB7affiH4f6ZRIDMNgLviEp3yNJLe/casSb59cV3YAKZSkxJUf8dk3Jc4w+h/pL4pO
 3H9BtzZIYyjmKdaXgSIYm/S300aivasi/Mo+0phF97ewlFCSaq9oIiw+wLC1B89LpLbK
 p2pnKiWO3ut9aAecJ9pIOFq/Zh4tCrwmEG9PbFmXY6Nbpa4dqAOLxkXLdyluMS04VqKE
 RAKE2is02NmQRKovTk8cl/O7Ni44Q/uPSIso/m7D/9R5+ioFNg/BziDTb3EY1FJ3aW4G
 Y7H4j4qbcW9ahPMohjxh/l1WVmBAA8m+ucIGWlBGk99L6QqnlNBPQIK8z3b8ey2dCP04
 s+yA==
X-Gm-Message-State: AOJu0YxVzbziXchsP1QE1Wmt9vOaISQ0Wcqxh4n5hDVsxsaUfcXdasNA
 MgWhlyvDJh+U5+/LuEXqZN0=
X-Google-Smtp-Source: AGHT+IHBMTYk7Cy1rw/ils4wjf31OPgZv6xAbp1PZXZ8GoiLulv2zz8hU+aeGynxHxSfg0/Fxw+j6Q==
X-Received: by 2002:a17:903:191:b0:1b8:af7f:6331 with SMTP id
 z17-20020a170903019100b001b8af7f6331mr2050532plg.55.1691672765844; 
 Thu, 10 Aug 2023 06:06:05 -0700 (PDT)
Received: from localhost.localdomain ([2409:40c2:1057:1bce:4dc8:d063:71b0:bea])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a17090a880f00b00267fbd521dbsm3350790pjn.5.2023.08.10.06.06.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Aug 2023 06:06:05 -0700 (PDT)
From: coolrrsh@gmail.com
To: linus.walleij@linaro.org, brgl@bgdev.pl, andy@kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] gpio: gpio-imx-scu: Use ARRAY_SIZE for array length
Date: Thu, 10 Aug 2023 18:36:00 +0530
Message-Id: <20230810130600.25616-1-coolrrsh@gmail.com>
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

v2->v3
added linux/kernel.h containing ARRAY_SIZE definition

---
 drivers/gpio/gpio-imx-scu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-imx-scu.c b/drivers/gpio/gpio-imx-scu.c
index e190bde5397d..13baf465aedf 100644
--- a/drivers/gpio/gpio-imx-scu.c
+++ b/drivers/gpio/gpio-imx-scu.c
@@ -6,6 +6,7 @@
  * to control the PIN resources on SCU domain.
  */
 
+#include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/gpio/driver.h>
 #include <linux/platform_device.h>
@@ -103,7 +104,7 @@ static int imx_scu_gpio_probe(struct platform_device *pdev)
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
