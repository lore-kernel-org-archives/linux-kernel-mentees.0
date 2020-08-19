Return-Path: <SRS0=uOMe=B5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E28A9C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Aug 2020 18:59:59 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B35A8207FF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Aug 2020 18:59:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WvDYup/K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B35A8207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 707BB8761E;
	Wed, 19 Aug 2020 18:59:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3V5udKaarN5X; Wed, 19 Aug 2020 18:59:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AB92685BCC;
	Wed, 19 Aug 2020 18:59:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9AA62C07FF;
	Wed, 19 Aug 2020 18:59:58 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5009DC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 18:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3F358860F0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 18:59:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IlwCMmFxzihB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 18:59:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B433B85E98
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 18:59:56 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 17so12147810pfw.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 11:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mos/Rf0TNw2iPmzlPoU65K3iMb1m4mvroOxp61hE7Bc=;
 b=WvDYup/Kp1NP5gsb3QLWv7Jw7zQT9EK0LsuAPX29ihhdIYei2e6sP8ZOSwFbJBVA7A
 ta2CILvXyFXMkCKX1E3BhS7dgpZEurOt3qSG40eL6bvDwDjQyCIdmnK3NU9w0J4j2BgC
 JJZUCVs3oSeiJClFYUixNODeI5caI1l6/cYxvQErqUZ+qF5k8O+TUH7FVa5pULf+/AWO
 uqLQdyb5Z7Qz0ayAJOVWiVRNPc7iZioUD1GrHfM30nBFXUVftE4ibvYfffXNe8hM488y
 d9HcZpaPJqC70ZvkdmRfMqp8kUEffjDVwNmtD3oJPusUE94/S01C7o/XL/NmeYKBcn2m
 mGug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mos/Rf0TNw2iPmzlPoU65K3iMb1m4mvroOxp61hE7Bc=;
 b=S+BQoqAb0CoGRgn2T2Mi/SSLJ7WktPJ8vUG/HW4IsPS46rCNwNCXxA/dETDKpT0Uxi
 ZiTEfmDhrI1vHu1wD3Y1VHLr7CBk65TpHdg4gzK2HqU89Ix2KjF9C3N8kTi7/pjyOykN
 qW2yEa/6yeiq1HBL8oeUaoYNHXWH+A9M6WOaC4jGWyOVn3G/uIODEbsm35924KoaJ106
 9X21k5WL8lF6UGJQg3M4yolDRTnozq6q5qkdfctxKUSKv9oYhVUXwS+H7DJgdplD+rm5
 TS7+RuiRZdNhUZh/AM9KPlH8eKoChOMjOlBT6OcUdt2ysHda97WV3SQMcNX3788zzQfZ
 8qIg==
X-Gm-Message-State: AOAM530Aav0dN5hNYwGjPBeXWU1lLTwJz6g9fMEMavXl+KP0upqfnYRc
 C5iUmUyGG+5YzrJQdWexT/0=
X-Google-Smtp-Source: ABdhPJwDsXvmSlbi9dGwbb/sMCjJSWXePcYUjMwpqIZJfFJhndLVz+PO9CUrhtWaRPyT2nFY++fp4g==
X-Received: by 2002:a63:5552:: with SMTP id f18mr16741377pgm.298.1597863596269; 
 Wed, 19 Aug 2020 11:59:56 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id o134sm29149305pfg.200.2020.08.19.11.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 11:59:55 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>, Paul Mackerras <paulus@samba.org>,
 Russell King <linux@armlinux.org.uk>, Andres Salomon <dilinger@queued.net>,
 Antonino Daplas <adaplas@gmail.com>
Date: Thu, 20 Aug 2020 00:26:51 +0530
Message-Id: <20200819185654.151170-10-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200819185654.151170-1-vaibhavgupta40@gmail.com>
References: <20200819185654.151170-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-geode@lists.infradead.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-kernel-mentees] [PATCH v3 09/12] fbdev: i740fb: use generic
	power management
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

Drivers should do only device-specific jobs. But in general, drivers using
legacy PCI PM framework for .suspend()/.resume() have to manage many PCI
PM-related tasks themselves which can be done by PCI Core itself. This
brings extra load on the driver and it directly calls PCI helper functions
to handle them.

Switch to the new generic framework by updating function signatures and
define a "struct dev_pm_ops" variable to bind PM callbacks. Also, remove
unnecessary calls to the PCI Helper functions along with the legacy
.suspend & .resume bindings.

The i740fb_suspend() is not designed to function in the case of Freeze.
Thus, the code checked for "if (state.event == PM_EVENT_FREEZE....)". This
is because, in the legacy framework, this callback was invoked even in the
event of Freeze. Hence, added the load of unnecessary function-call.

The goal can be achieved by binding the callback with only ".suspend" and
".poweroff" in the "i740fb_pm_ops" const variable. This also avoids the
step of checking "if (state.event == PM_EVENT_FREEZE....)" every time the
callback is invoked.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/video/fbdev/i740fb.c | 40 +++++++++++++++---------------------
 1 file changed, 16 insertions(+), 24 deletions(-)

diff --git a/drivers/video/fbdev/i740fb.c b/drivers/video/fbdev/i740fb.c
index c65ec7386e87..8d7f06fc8a5a 100644
--- a/drivers/video/fbdev/i740fb.c
+++ b/drivers/video/fbdev/i740fb.c
@@ -1175,16 +1175,11 @@ static void i740fb_remove(struct pci_dev *dev)
 	}
 }
 
-#ifdef CONFIG_PM
-static int i740fb_suspend(struct pci_dev *dev, pm_message_t state)
+static int __maybe_unused i740fb_suspend(struct device *dev)
 {
-	struct fb_info *info = pci_get_drvdata(dev);
+	struct fb_info *info = dev_get_drvdata(dev);
 	struct i740fb_par *par = info->par;
 
-	/* don't disable console during hibernation and wakeup from it */
-	if (state.event == PM_EVENT_FREEZE || state.event == PM_EVENT_PRETHAW)
-		return 0;
-
 	console_lock();
 	mutex_lock(&(par->open_lock));
 
@@ -1197,19 +1192,15 @@ static int i740fb_suspend(struct pci_dev *dev, pm_message_t state)
 
 	fb_set_suspend(info, 1);
 
-	pci_save_state(dev);
-	pci_disable_device(dev);
-	pci_set_power_state(dev, pci_choose_state(dev, state));
-
 	mutex_unlock(&(par->open_lock));
 	console_unlock();
 
 	return 0;
 }
 
-static int i740fb_resume(struct pci_dev *dev)
+static int __maybe_unused i740fb_resume(struct device *dev)
 {
-	struct fb_info *info = pci_get_drvdata(dev);
+	struct fb_info *info = dev_get_drvdata(dev);
 	struct i740fb_par *par = info->par;
 
 	console_lock();
@@ -1218,11 +1209,6 @@ static int i740fb_resume(struct pci_dev *dev)
 	if (par->ref_count == 0)
 		goto fail;
 
-	pci_set_power_state(dev, PCI_D0);
-	pci_restore_state(dev);
-	if (pci_enable_device(dev))
-		goto fail;
-
 	i740fb_set_par(info);
 	fb_set_suspend(info, 0);
 
@@ -1231,10 +1217,17 @@ static int i740fb_resume(struct pci_dev *dev)
 	console_unlock();
 	return 0;
 }
-#else
-#define i740fb_suspend NULL
-#define i740fb_resume NULL
-#endif /* CONFIG_PM */
+
+static const struct dev_pm_ops i740fb_pm_ops = {
+#ifdef CONFIG_PM_SLEEP
+	.suspend	= i740fb_suspend,
+	.resume		= i740fb_resume,
+	.freeze		= NULL,
+	.thaw		= i740fb_resume,
+	.poweroff	= i740fb_suspend,
+	.restore	= i740fb_resume,
+#endif /* CONFIG_PM_SLEEP */
+};
 
 #define I740_ID_PCI 0x00d1
 #define I740_ID_AGP 0x7800
@@ -1251,8 +1244,7 @@ static struct pci_driver i740fb_driver = {
 	.id_table	= i740fb_id_table,
 	.probe		= i740fb_probe,
 	.remove		= i740fb_remove,
-	.suspend	= i740fb_suspend,
-	.resume		= i740fb_resume,
+	.driver.pm	= &i740fb_pm_ops,
 };
 
 #ifndef MODULE
-- 
2.28.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
