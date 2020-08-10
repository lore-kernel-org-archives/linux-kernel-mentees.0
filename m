Return-Path: <SRS0=Vbn0=BU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22254C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Aug 2020 19:00:31 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA96020782
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Aug 2020 19:00:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ivA1aaBU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA96020782
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B8DF5877C9;
	Mon, 10 Aug 2020 19:00:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id alEY0gdIllwt; Mon, 10 Aug 2020 19:00:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B9D0087781;
	Mon, 10 Aug 2020 19:00:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B6977C013C;
	Mon, 10 Aug 2020 19:00:29 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B1A6EC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 19:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AE22A877A7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 19:00:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LsGSjMHYqCpO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 19:00:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2982887781
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 19:00:27 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id f5so1565818plr.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 12:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z0+jOHm8rOkNKyaunCdMu5yjlq5vV0eABQayoJ0528s=;
 b=ivA1aaBUqdfgaLxoUgpllPwcVHSBM7bdP5tm1sTOPej3S/pjrIeus2jhbAdE9ZCRop
 gpw9DTZU6CMqhQ2FTPFyjfblMdEJxh8L03aZXKBEdOKPFbT/eAImT6/HCoVWAVeijQhb
 wQSPdivqd9TnHrk0p1sSpE3hDkzM/sxbQ0NZSJTkVZNWjgd+kvrUhV3mdEGMmEVRyk0Y
 cKew74EKthOegKVQ8badipz12z+tyVUExgN9P74Swhb0zjXBKnckcSS3ngLcheVdW8Jj
 /uSJnGJqPSz+yBss5ED6Es1OvvXbxXKz1KFMi++RJhz8DlNDQdi4soe5evQc45D0yoTW
 Z1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z0+jOHm8rOkNKyaunCdMu5yjlq5vV0eABQayoJ0528s=;
 b=S0iXHiYI3pkzD4wJfaYMf+vN9CdA3diaLy2St8IphmwgW7VEVoSGH3C/4EaMhNq5CR
 COA6VRbPJFGIhXby8hTqwBRvakLi2HRlzq5MzRLgxcFsvD+lXaA5yXmOrPds86rH+D4V
 ijYsemTm9wflA3SrNyc7WARhC3wwyzaDXlvCbywq8Er+mFd3SKGM8JusquibqoGltxMg
 Hc1XfJF4ooAZKG70/jBuJv+UxA+gLT4cUsGXHm5K1pM4P7U4cWjoy0MOBsNMUpwjBh3r
 lQlpDI7eZTBuZT0gU5nYtlRUOopulj1q5WjVLL/KEVbdI6BU9ljIi6tbD9bPw1RBQxpO
 225w==
X-Gm-Message-State: AOAM531Eub7AiluQ6AyIOkOu2rYVaUsLPS/RfmnFx+e9SzYz2UEfTYLX
 6kdWrkVrdyJRu41WVe0w62s=
X-Google-Smtp-Source: ABdhPJw9zh50ift33KPLF0gpYxTpUeEdaP8Jb6WeAkKvYMnGC5Fle9xVNYZuWbaiuMAmoxMIZ8b0+w==
X-Received: by 2002:a17:902:8d94:: with SMTP id
 v20mr14878457plo.298.1597086027479; 
 Mon, 10 Aug 2020 12:00:27 -0700 (PDT)
Received: from varodek.localdomain ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id f27sm22683547pfk.217.2020.08.10.12.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 12:00:27 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>, Paul Mackerras <paulus@samba.org>,
 Russell King <linux@armlinux.org.uk>, Andres Salomon <dilinger@queued.net>,
 Antonino Daplas <adaplas@gmail.com>
Date: Tue, 11 Aug 2020 00:27:20 +0530
Message-Id: <20200810185723.15540-10-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200810185723.15540-1-vaibhavgupta40@gmail.com>
References: <20200810165458.GA292825@ravnborg.org>
 <20200810185723.15540-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-fbdev@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-geode@lists.infradead.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-kernel-mentees] [PATCH v2 09/12] fbdev: i740fb: use generic
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
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
