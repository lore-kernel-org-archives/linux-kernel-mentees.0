Return-Path: <SRS0=nKGu=A4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31486C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 07:51:46 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01AF220704
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 07:51:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VzTODCjH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01AF220704
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D7B3A86101;
	Fri, 17 Jul 2020 07:51:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NvQ5WiofUHaK; Fri, 17 Jul 2020 07:51:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 77EBC860FF;
	Fri, 17 Jul 2020 07:51:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 667E5C0893;
	Fri, 17 Jul 2020 07:51:45 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BE867C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 07:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B7D2886126
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 07:51:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k2Ip_Zymv_-y
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 07:51:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 59B1C8610F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 07:51:44 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id md7so6006934pjb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 00:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zNW9uGCCyuNVj0zzY42fxPcN6t0OrV/LrjNayMGPkQU=;
 b=VzTODCjH9JpZgBV2q+hOkDevdJ48kMuEhf5B5qyChStHn1ij1kJSK8BljZ+qDpoUkg
 yseIQ2cKFjHldhbr1a1xNxv8qm+ptqRBM+5M8oDrgls6NrRhnOIlRJ61cggS8/9e+Osg
 ndn4P+pguRaQCq6yzwISTb5S4n4xZnrSnZvPmseRt9vnoepDxQf/pjX4f/jG3i9pNgb/
 7Fm2LcV3R4xKnZ+bKXS0eLoolghiY+XtGVgUH7IoNuM7sdRjOcpXkvE84av/NPfKF8qW
 U8gMr5jhvOlOqhrOYQ0dyj37V2cSZqulhfQ4FOTW+g4hFoRcOgO62bcERyygoJsZ+xmp
 LQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zNW9uGCCyuNVj0zzY42fxPcN6t0OrV/LrjNayMGPkQU=;
 b=kstg+A2ypxSgCnMrU4WqrOwF9Tcw4y5JCLWZq/4VWF7TieT5C6Lzv7w2l+cajlfmVj
 AbtwqMQ9AB7mD6QjwrBZXzCSy5qk0fXMsq3ywPkqEWz1NsYy6DULMcOqhR4O+JpFW0cu
 QkMeKokhN1hrAcx34Lr2ujYnlupBgmwJGRm3O/Fu9ExzPgtb1fcP3d1e3ieFbofehC2e
 RenXKe61kiVxLxip+Aq0cP7gdPutPYYPzn6qyqXABQBfuxKrTPs4fvAuaXi0fTRPMERY
 N2nbRPnEIER8VQNS6QokCc292r5OnKYM0hZUdgAar+8EkDn9DRB43Bjb0Z3J9PV2dUNw
 trYA==
X-Gm-Message-State: AOAM532/Yof6HUDHNmZHNFFBi/T4c5B1QlqyDqXDqM2QS24io0s+M4fl
 LXC4i877bMcGnSW9g3mdjWI=
X-Google-Smtp-Source: ABdhPJwD1SfN9j2JmbPCc+Vz3/Y96fIz7igGol5/BhSuBVM/yI1O17VPNMnGuhY7TLfAdCilMOLyyg==
X-Received: by 2002:a17:902:10e:: with SMTP id
 14mr6368688plb.297.1594972303853; 
 Fri, 17 Jul 2020 00:51:43 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id s68sm1924332pjb.38.2020.07.17.00.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 00:51:43 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, David Airlie <airlied@linux.ie>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Fri, 17 Jul 2020 13:19:37 +0530
Message-Id: <20200717074937.296192-4-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717074937.296192-1-vaibhavgupta40@gmail.com>
References: <20200717074937.296192-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1 3/3] via-agp: use generic power
	management
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

Drivers using legacy PM have to manage PCI states and device's PM states
themselves. They also need to take care of configuration registers.

With improved and powerful support of generic PM, PCI Core takes care of
above mentioned, device-independent, jobs.

This driver makes use of PCI helper functions like
pci_save/restore_state() and pci_set_power_state() to do required
operations. In generic mode, they are no longer needed.

Change function parameter in .resume() to "struct device*" type. Use
to_pci_dev() to get "struct pci_dev*" variable.

After upgrading, .suspend() became an empty-body function, hence defined as
NULL.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/char/agp/via-agp.c | 25 +++++--------------------
 1 file changed, 5 insertions(+), 20 deletions(-)

diff --git a/drivers/char/agp/via-agp.c b/drivers/char/agp/via-agp.c
index 87a92a044570..afa941df7d44 100644
--- a/drivers/char/agp/via-agp.c
+++ b/drivers/char/agp/via-agp.c
@@ -492,22 +492,11 @@ static void agp_via_remove(struct pci_dev *pdev)
 	agp_put_bridge(bridge);
 }
 
-#ifdef CONFIG_PM
+#define agp_via_suspend NULL
 
-static int agp_via_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused agp_via_resume(struct device *dev)
 {
-	pci_save_state (pdev);
-	pci_set_power_state (pdev, PCI_D3hot);
-
-	return 0;
-}
-
-static int agp_via_resume(struct pci_dev *pdev)
-{
-	struct agp_bridge_data *bridge = pci_get_drvdata(pdev);
-
-	pci_set_power_state (pdev, PCI_D0);
-	pci_restore_state(pdev);
+	struct agp_bridge_data *bridge = dev_get_drvdata(dev);
 
 	if (bridge->driver == &via_agp3_driver)
 		return via_configure_agp3();
@@ -517,8 +506,6 @@ static int agp_via_resume(struct pci_dev *pdev)
 	return 0;
 }
 
-#endif /* CONFIG_PM */
-
 /* must be the same order as name table above */
 static const struct pci_device_id agp_via_pci_table[] = {
 #define ID(x) \
@@ -567,16 +554,14 @@ static const struct pci_device_id agp_via_pci_table[] = {
 
 MODULE_DEVICE_TABLE(pci, agp_via_pci_table);
 
+static SIMPLE_DEV_PM_OPS(agp_via_pm_ops, agp_via_suspend, agp_via_resume);
 
 static struct pci_driver agp_via_pci_driver = {
 	.name		= "agpgart-via",
 	.id_table	= agp_via_pci_table,
 	.probe		= agp_via_probe,
 	.remove		= agp_via_remove,
-#ifdef CONFIG_PM
-	.suspend	= agp_via_suspend,
-	.resume		= agp_via_resume,
-#endif
+	.driver.pm	= &agp_via_pm_ops,
 };
 
 
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
