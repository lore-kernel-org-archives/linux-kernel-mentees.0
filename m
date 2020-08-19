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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80A1BC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Aug 2020 18:59:23 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5191E2083B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Aug 2020 18:59:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XRI53D3h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5191E2083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0297B22128;
	Wed, 19 Aug 2020 18:59:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 61Yn0Tnlw5hV; Wed, 19 Aug 2020 18:59:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1D93B22179;
	Wed, 19 Aug 2020 18:59:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 03CC1C07FF;
	Wed, 19 Aug 2020 18:59:21 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4D804C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 18:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3D3E4860F2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 18:59:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yWJeYCmy5l3Q
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 18:59:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B329B860F0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 18:59:18 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id mw10so1542383pjb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 11:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5gu1L1DJx3HZoPEqXvBU7h0G5D/PQrdVvm6X6301gs8=;
 b=XRI53D3hmlnwd6aCroLhIz21NDdW0P2mVstADmsVDG+e0ejag70GGABL3/HXR5kaPQ
 6AgnJQHVfgwQH1Y4r19MSJUL92/LvoOfdo6XIWEyAjIiIx4qlUZRSJppQfsSoF+igE3k
 gaj9S8c+4AQbPaSGREm0duechoKwcUIa1XeBWR61Ey2hbIeQLP6i9yO+pdeYdxoA1GwW
 w1BcEHxHCslecf14xvl5tXlj+my9yEBz3hXxzN2AOP67thiCRGsYSSFFB8dYCCjsKbxm
 v3jyeM13isALOM349gQTJWR5B+c6+x/8lw85ecktWMCTFLc+J+orIRcxchE1CrNAdcbi
 tuyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5gu1L1DJx3HZoPEqXvBU7h0G5D/PQrdVvm6X6301gs8=;
 b=KpijWVnikK7Zf5npp/P1hu3Ysk9/jso8UcCwP6cMeDXHJAN9pmqCLbYSg4F+yYcUnD
 zTAy+df4poYclpLP/UFJzuYxrhQSwW6HuxnQJq1ZquL41cev9XcmCHC97tHWxP3/XXL6
 A754Rz0sK8DvF/N8AYANuk60pgdIEqT4tnRcPtM3kOxDe3hT/Sg1L7DfDP2YfL2pHTKX
 TpV+4LVNTJnX1wbbm3YCTfMkQwEyaAhsasa/QcPQddXppr/QcmZO4e8YKlqoNtafoLQ8
 Ng7YdTQs483Ex2QjccjchIdWNDipevT41j4tj/APicTUWn3kos7tlXIjjuG0T5hFyeyI
 sQ1Q==
X-Gm-Message-State: AOAM533g8vvd7H8S31Jm+MoCGetEWRHfVaj180zvul5xD4a0ximpjjh3
 4JrPG/8AafcS/R/cGSk+LAY=
X-Google-Smtp-Source: ABdhPJzRMuPqM05NiCBiCDG5w1q8EIlZqgTaIxB3DmIfl9PFQS4Xr6+hIyQiWWSHjmx/62qPjMtQNA==
X-Received: by 2002:a17:90b:368c:: with SMTP id
 mj12mr4711893pjb.152.1597863558293; 
 Wed, 19 Aug 2020 11:59:18 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id o134sm29149305pfg.200.2020.08.19.11.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 11:59:17 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>, Paul Mackerras <paulus@samba.org>,
 Russell King <linux@armlinux.org.uk>, Andres Salomon <dilinger@queued.net>,
 Antonino Daplas <adaplas@gmail.com>
Date: Thu, 20 Aug 2020 00:26:45 +0530
Message-Id: <20200819185654.151170-4-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200819185654.151170-1-vaibhavgupta40@gmail.com>
References: <20200819185654.151170-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-geode@lists.infradead.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-kernel-mentees] [PATCH v3 03/12] fbdev: via-core: use
	generic power management
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
define a "struct dev_pm_ops" variable to bind PM callbacks.

The via_suspend() is designed to function only in the case of Suspend.
Thus, the code checked for "if (state.event != PM_EVENT_SUSPEND)". This is
because, in the legacy framework, this callback was invoked even in the
event of Freeze and Hibernate. Hence, added the load of unnecessary
function-calls.

The goal can be achieved by binding the callback with only
"via_pm_ops.suspend" in the new framework. This also avoids the step of
checking "if (state.event != PM_EVENT_SUSPEND)" every time the callback is
invoked.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/video/fbdev/via/via-core.c | 39 ++++++++++++------------------
 include/linux/via-core.h           |  2 --
 2 files changed, 16 insertions(+), 25 deletions(-)

diff --git a/drivers/video/fbdev/via/via-core.c b/drivers/video/fbdev/via/via-core.c
index 703ddee9a244..89d75079b730 100644
--- a/drivers/video/fbdev/via/via-core.c
+++ b/drivers/video/fbdev/via/via-core.c
@@ -558,9 +558,8 @@ static void via_teardown_subdevs(void)
 /*
  * Power management functions
  */
-#ifdef CONFIG_PM
-static LIST_HEAD(viafb_pm_hooks);
-static DEFINE_MUTEX(viafb_pm_hooks_lock);
+static __maybe_unused LIST_HEAD(viafb_pm_hooks);
+static __maybe_unused DEFINE_MUTEX(viafb_pm_hooks_lock);
 
 void viafb_pm_register(struct viafb_pm_hooks *hooks)
 {
@@ -580,12 +579,10 @@ void viafb_pm_unregister(struct viafb_pm_hooks *hooks)
 }
 EXPORT_SYMBOL_GPL(viafb_pm_unregister);
 
-static int via_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused via_suspend(struct device *dev)
 {
 	struct viafb_pm_hooks *hooks;
 
-	if (state.event != PM_EVENT_SUSPEND)
-		return 0;
 	/*
 	 * "I've occasionally hit a few drivers that caused suspend
 	 * failures, and each and every time it was a driver bug, and
@@ -600,24 +597,13 @@ static int via_suspend(struct pci_dev *pdev, pm_message_t state)
 		hooks->suspend(hooks->private);
 	mutex_unlock(&viafb_pm_hooks_lock);
 
-	pci_save_state(pdev);
-	pci_disable_device(pdev);
-	pci_set_power_state(pdev, pci_choose_state(pdev, state));
 	return 0;
 }
 
-static int via_resume(struct pci_dev *pdev)
+static int __maybe_unused via_resume(struct device *dev)
 {
 	struct viafb_pm_hooks *hooks;
 
-	/* Get the bus side powered up */
-	pci_set_power_state(pdev, PCI_D0);
-	pci_restore_state(pdev);
-	if (pci_enable_device(pdev))
-		return 0;
-
-	pci_set_master(pdev);
-
 	/* Now bring back any subdevs */
 	mutex_lock(&viafb_pm_hooks_lock);
 	list_for_each_entry(hooks, &viafb_pm_hooks, list)
@@ -626,7 +612,6 @@ static int via_resume(struct pci_dev *pdev)
 
 	return 0;
 }
-#endif /* CONFIG_PM */
 
 static int via_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
@@ -712,15 +697,23 @@ static const struct pci_device_id via_pci_table[] = {
 };
 MODULE_DEVICE_TABLE(pci, via_pci_table);
 
+static const struct dev_pm_ops via_pm_ops = {
+#ifdef CONFIG_PM_SLEEP
+	.suspend	= via_suspend,
+	.resume		= via_resume,
+	.freeze		= NULL,
+	.thaw		= via_resume,
+	.poweroff	= NULL,
+	.restore	= via_resume,
+#endif
+};
+
 static struct pci_driver via_driver = {
 	.name		= "viafb",
 	.id_table	= via_pci_table,
 	.probe		= via_pci_probe,
 	.remove		= via_pci_remove,
-#ifdef CONFIG_PM
-	.suspend	= via_suspend,
-	.resume		= via_resume,
-#endif
+	.driver.pm	= &via_pm_ops,
 };
 
 static int __init via_core_init(void)
diff --git a/include/linux/via-core.h b/include/linux/via-core.h
index 9e802deedb2d..8737599b9148 100644
--- a/include/linux/via-core.h
+++ b/include/linux/via-core.h
@@ -47,7 +47,6 @@ struct via_port_cfg {
 /*
  * Allow subdevs to register suspend/resume hooks.
  */
-#ifdef CONFIG_PM
 struct viafb_pm_hooks {
 	struct list_head list;
 	int (*suspend)(void *private);
@@ -57,7 +56,6 @@ struct viafb_pm_hooks {
 
 void viafb_pm_register(struct viafb_pm_hooks *hooks);
 void viafb_pm_unregister(struct viafb_pm_hooks *hooks);
-#endif /* CONFIG_PM */
 
 /*
  * This is the global viafb "device" containing stuff needed by
-- 
2.28.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
