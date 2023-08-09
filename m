Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D7C8C41513
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Aug 2023 17:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E21C0612A4;
	Wed,  9 Aug 2023 17:12:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E21C0612A4
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=m9SLyR5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lU7Z-9c6ziLt; Wed,  9 Aug 2023 17:12:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id F2E4D60FC1;
	Wed,  9 Aug 2023 17:12:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2E4D60FC1
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C9A81C0072;
	Wed,  9 Aug 2023 17:12:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 17CF9C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Aug 2023 17:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D89D5418C9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Aug 2023 17:12:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D89D5418C9
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=m9SLyR5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8NM1WXpyhRFr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Aug 2023 17:12:52 +0000 (UTC)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8D423418CA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Aug 2023 17:12:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D423418CA
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-686f1240a22so2268b3a.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 09 Aug 2023 10:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691601172; x=1692205972;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QeYbOsS7m7Ci+oO9qmLW4YJFfrwZPXuK5PLkDCaWNro=;
 b=m9SLyR5CWKCKowrtvk50dLqs8iMis6jpBIAhdByP4ZJW79BOm4DB7iaJsDvYTXOxI/
 SA8AShuYF5AvXOGeFSyjDF7JIZPKqzr+Li4+3bhmGUMb08ErRhuXVaKlcedACDM/ieCJ
 HslHe6BSV6hvQsRaq1IaAsut3pr3NvZySYTDC/WvyyZutDjCa+zyX/333iUa03CLwGRf
 3HxqJeTH7C/xGOjTVHSZe8iQ2oc983fpxrOe3Gqvz9nRrISd+XBdMEnCHxP/CKCh7ych
 00OXgh3Qq5D9KgOmpYGP3D39DNacc+F5/moXj2LSdh9wBCvZT9f2OjERsxHRua0SMdlZ
 49xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691601172; x=1692205972;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QeYbOsS7m7Ci+oO9qmLW4YJFfrwZPXuK5PLkDCaWNro=;
 b=gl0mGkea6a/UOuEZ3eE/OOpbO8kgFT6Zi3rIcOeySP4s974+n7RHAPtkBUC6P7Amfn
 ti0HpwNWFQsQhHCNu6nHn1xpQwNm+WeR2KyzhhJvP0oOycM2h9GWZ+yueRcnXs8s3GFm
 mLDpTE1o31Nh9/ePYO9aSjzRdDlseb9vyFaRzDJajem+bHolFruW61iOO+bsUSVLmUJA
 RDxTTIE1MiCiD0vz3V1QKWebwru4bzdIMmNORuPC0AAP0j4GnlLIuCuD4sCZ/GV6jpB1
 82qDySVJmzuNJBR2fh8yrdpDlvxh3gFuTvD8zBNXTYXBkeLsfFl0TI3ydgD2DyHNaUYQ
 w0Hw==
X-Gm-Message-State: AOJu0YzjW0sJq5/3sEWJT4IBmO1SrayRXfRz6puT3IQ2baZeyBjVdxxR
 x7Fi4xsdWqmTRqNLLrrFXZ4=
X-Google-Smtp-Source: AGHT+IEQM2P86vJ5xnSvgcE3nb86ErwM/e9/QOs1IeoTEXzT8GSnjWcd8eyauGfAKy+KgXYuB7mtCA==
X-Received: by 2002:a05:6a20:4422:b0:138:1c5b:24c3 with SMTP id
 ce34-20020a056a20442200b001381c5b24c3mr3958967pzb.49.1691601171849; 
 Wed, 09 Aug 2023 10:12:51 -0700 (PDT)
Received: from localhost.localdomain ([2409:40c2:1009:f4c5:4c0f:f2b7:4636:86b])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a170902c38500b001bbd1562e75sm11390069plg.55.2023.08.09.10.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Aug 2023 10:12:50 -0700 (PDT)
From: coolrrsh@gmail.com
To: linus.walleij@linaro.org, brgl@bgdev.pl, andy@kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: gpio-imx-scu: Use ARRAY_SIZE for array length
Date: Wed,  9 Aug 2023 22:42:45 +0530
Message-Id: <20230809171245.92081-1-coolrrsh@gmail.com>
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
+	gc->ngpio = ARRAY_SIZE(scu_rsrc_arr)/sizeof(unsigned int);
 	gc->label = dev_name(dev);
 	gc->get = imx_scu_gpio_get;
 	gc->set = imx_scu_gpio_set;
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
