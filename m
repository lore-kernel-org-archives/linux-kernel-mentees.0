Return-Path: <SRS0=f3wf=LM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14931C48BE8
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Jun 2021 16:14:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD52361139
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Jun 2021 16:14:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD52361139
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A30B0607AD;
	Fri, 18 Jun 2021 16:14:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aOpJSQ5PoGKv; Fri, 18 Jun 2021 16:14:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B98AB605DD;
	Fri, 18 Jun 2021 16:14:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 98B52C000D;
	Fri, 18 Jun 2021 16:14:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 52815C000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 16:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4EB32607AD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 16:14:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n_NB_Cglvz24
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 16:14:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 904C5605DD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 16:14:52 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id a21so9786536ljj.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 09:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pmmBYlRHWMosP77C0Ii9Ste9VmkpwQxWPopXChKoX8U=;
 b=MiWyikh06egv+CM+dP0DpbAtt8nVnjcXBSwZfudsgaHkFKpVWZdO1XgMC8Vfqv87yF
 kXEDIHkcjUwTI3NI9TFzFxLPuqWp0a0Zizi60a09ip1Fse/VqAclrZd685Gtc+gFfEMh
 gd8XYo8ZB+Wq7C4e1mB0k53cCnvLWXZHV/hTYCuhPj+j674yehtwuJah9zH3TYCqY/21
 jMDkvaf6/wOEd+3cFQRNJsTDAXgeg++xj+y6mj+uzQwo0UttB/pAaStzyqKAgWHYcLHu
 hZp1buRIco2EGghQKo4zLSdT4HQhOVOxrbCgqGkZ9pcVs6sBUZbQVSlQ0Ys8t5paX6tb
 JvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pmmBYlRHWMosP77C0Ii9Ste9VmkpwQxWPopXChKoX8U=;
 b=T29zRJPN7jbVzRI6+43eZLVqvHSqRCJfnlY13B9O7DjQEIGyBR4YcfCn+uCTjDqRLa
 17pzwJU+rBtZZ+7Tyt8JFa5H2MxQj36dFCWcSQdK+n4DmZlbrku4E5xa+3/WL6fWljhp
 QyxLlRBUPXq9EklXR4dhfIcExrXmWGx6mKtldwmALDTRfULnLbOLdsD+V+axz60yj7Yo
 NHs7qVSskL7rNqYLbs58XlgbjcXTey/PAXA36FvCti0ggeV/tX4Wkg7mSUi2hsYke2YV
 SMFw8EdHqHWl8bgdhBHNwB0LhymUnSq32uleT38zUE/PLcJlBN+qF0ADRZGVcUzOjkI9
 MWfg==
X-Gm-Message-State: AOAM530oqSVLkMmMPV69s4ZzrLPvS0Q7QkqS7t7hjpuVYQ/hjpyMIUYD
 NWUTdNPBvdnkaOFoa4/2E0E=
X-Google-Smtp-Source: ABdhPJxfdpCMQB64fi+Tq38fP/1PEKy84mwF7jCmbBdPM+AUz90aStt4Wp6ix1eYPrqW3yEixSjXqg==
X-Received: by 2002:a05:651c:201d:: with SMTP id
 s29mr10262196ljo.258.1624032890195; 
 Fri, 18 Jun 2021 09:14:50 -0700 (PDT)
Received: from localhost.localdomain ([94.103.229.24])
 by smtp.gmail.com with ESMTPSA id h19sm951025lfc.225.2021.06.18.09.14.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 09:14:49 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: davem@davemloft.net, kuba@kernel.org, andrew@lunn.ch, michael@walle.cc,
 abrodkin@synopsys.com, talz@ezchip.com, noamc@ezchip.com
Subject: [PATCH 3/3] net: ethernet: ezchip: fix error handling
Date: Fri, 18 Jun 2021 19:14:47 +0300
Message-Id: <422b1921ce3ff8f29da93d9a2c99e1d34cf66c77.1624032669.git.paskripkin@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1624032669.git.paskripkin@gmail.com>
References: <cover.1624032669.git.paskripkin@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
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

As documented at drivers/base/platform.c for platform_get_irq:

 * Gets an IRQ for a platform device and prints an error message if finding the
 * IRQ fails. Device drivers should check the return value for errors so as to
 * not pass a negative integer value to the request_irq() APIs.

So, the driver should check that platform_get_irq() return value
is _negative_, not that it's equal to zero, because -ENXIO (return
value from request_irq() if irq was not found) will
pass this check and it leads to passing negative irq to request_irq()

Fixes: 0dd077093636 ("NET: Add ezchip ethernet driver")
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/net/ethernet/ezchip/nps_enet.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ezchip/nps_enet.c b/drivers/net/ethernet/ezchip/nps_enet.c
index c562a1e83913..f9a288a6ec8c 100644
--- a/drivers/net/ethernet/ezchip/nps_enet.c
+++ b/drivers/net/ethernet/ezchip/nps_enet.c
@@ -607,7 +607,7 @@ static s32 nps_enet_probe(struct platform_device *pdev)
 
 	/* Get IRQ number */
 	priv->irq = platform_get_irq(pdev, 0);
-	if (!priv->irq) {
+	if (priv->irq < 0) {
 		dev_err(dev, "failed to retrieve <irq Rx-Tx> value from device tree\n");
 		err = -ENODEV;
 		goto out_netdev;
-- 
2.32.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
