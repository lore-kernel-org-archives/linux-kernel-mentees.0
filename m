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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75FD5C433F1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 03:58:59 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A58421741
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 03:58:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L7uBE6cD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A58421741
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1A052882F0;
	Fri, 17 Jul 2020 03:58:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9mo5alKDfUuU; Fri, 17 Jul 2020 03:58:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A922A882E3;
	Fri, 17 Jul 2020 03:58:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A4D01C0893;
	Fri, 17 Jul 2020 03:58:58 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6CABFC0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 03:58:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5082B882F0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 03:58:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JgGnfQymu6aK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 03:58:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D6ACA882E3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 03:58:56 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id t15so5744824pjq.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 20:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DRaWMxjlA+y9G9x8PTReSZmOggDcJdYbq3Dmt0Z1Wlg=;
 b=L7uBE6cDRVMj0gHPJGOHTDiheKAZMJIZrfqbe00VOVr73uD1dK32hSHLBzu75ld5A+
 Ai5h0vpfZWBpdF4SA7BpWBHNdDJdwXGXaH74ccr49lkrPvAjHPLRynhdvE264lupkpx0
 uOy4IgUC98Eea9OqYKG7WdHC3U25kORnT7fwiIbjHv6DMpYc9oHkzsiSv2xSoPV32QNW
 RCowtyc3gssZ40NB14OMin2AG3R5MK3JRGYAaUNeDoNrDyH62j/Mwb/uQ1zs9Sf01NaP
 sPebEiexTuE+hAmVvTA2+QZi+dJRN/FcXKpRY5VaWvxlmopInSontbSzsOF/Q+Cvpk1v
 2ClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DRaWMxjlA+y9G9x8PTReSZmOggDcJdYbq3Dmt0Z1Wlg=;
 b=qu2gBh/BiTY8GSdvW/DSXEoT09TBtm7OWznDN5W1RDRIKNZ12Tpb1bRJXy56Hkz2hg
 C6mdsR/DJNIHIQ44AFx+iFq3UB3bcH/jp2AGyyuHiw+fzl14dxvXuyZaPOwatYW1cBEF
 5Dd1ikM7R6AFwW5IwyLLAkIzxQG8zooljT7sFvJ9+O1AD0DgAeeIXniDDrTmO76teD8I
 7klCs4b6hLjJjI9sIBMHGdhawVpWa1Rb5q4Z7R0bYaHiCl38KW8YpNKmlRxQdeXHV1La
 8YUARyEI1/+JCsxXl3vUbf8V8NSGTgNqhqek8xO4ANxKkiC4tOYRyRuWDQA6h6INb0kh
 sZag==
X-Gm-Message-State: AOAM533H8day1cHDKv4F33bE6iwLeIWqCfWKYr+d9jA9QA3I9CwFYQJ6
 e31WcfU34dbpdFHQbd8TKms=
X-Google-Smtp-Source: ABdhPJz9RWNqG7kqo+L+MFtbo2hzekR4x6yLSqYQDRE2NFenzzMNtalvwVlrAFC3Z8cmn2EAqPWygQ==
X-Received: by 2002:a17:90a:cc0f:: with SMTP id
 b15mr7949017pju.83.1594958336419; 
 Thu, 16 Jul 2020 20:58:56 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id v11sm6227907pgs.22.2020.07.16.20.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 20:58:55 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Date: Fri, 17 Jul 2020 09:26:08 +0530
Message-Id: <20200717035608.97254-7-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717035608.97254-1-vaibhavgupta40@gmail.com>
References: <20200717035608.97254-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-media@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v2 6/6] tw68: use generic power
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

With legacy PM, drivers themselves were responsible for managing the
device's power states and takes care of register states.

After upgrading to the generic structure, PCI core will take care of
required tasks and drivers should do only device-specific operations.

The driver was invoking PCI helper functions like pci_save/restore_state()
which is not recommended.

Compile-Tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/media/pci/tw68/tw68-core.c | 30 +++++++++++-------------------
 1 file changed, 11 insertions(+), 19 deletions(-)

diff --git a/drivers/media/pci/tw68/tw68-core.c b/drivers/media/pci/tw68/tw68-core.c
index b45f3ffa3de5..065420b09250 100644
--- a/drivers/media/pci/tw68/tw68-core.c
+++ b/drivers/media/pci/tw68/tw68-core.c
@@ -359,10 +359,9 @@ static void tw68_finidev(struct pci_dev *pci_dev)
 	v4l2_device_unregister(&dev->v4l2_dev);
 }
 
-#ifdef CONFIG_PM
-
-static int tw68_suspend(struct pci_dev *pci_dev , pm_message_t state)
+static int __maybe_unused tw68_suspend(struct device *dev_d)
 {
+	struct pci_dev *pci_dev = to_pci_dev(dev_d);
 	struct v4l2_device *v4l2_dev = pci_get_drvdata(pci_dev);
 	struct tw68_dev *dev = container_of(v4l2_dev,
 				struct tw68_dev, v4l2_dev);
@@ -373,24 +372,19 @@ static int tw68_suspend(struct pci_dev *pci_dev , pm_message_t state)
 
 	synchronize_irq(pci_dev->irq);
 
-	pci_save_state(pci_dev);
-	pci_set_power_state(pci_dev, pci_choose_state(pci_dev, state));
 	vb2_discard_done(&dev->vidq);
 
 	return 0;
 }
 
-static int tw68_resume(struct pci_dev *pci_dev)
+static int __maybe_unused tw68_resume(struct device *dev_d)
 {
-	struct v4l2_device *v4l2_dev = pci_get_drvdata(pci_dev);
+	struct v4l2_device *v4l2_dev = dev_get_drvdata(dev_d);
 	struct tw68_dev *dev = container_of(v4l2_dev,
 					    struct tw68_dev, v4l2_dev);
 	struct tw68_buf *buf;
 	unsigned long flags;
 
-	pci_set_power_state(pci_dev, PCI_D0);
-	pci_restore_state(pci_dev);
-
 	/* Do things that are done in tw68_initdev ,
 		except of initializing memory structures.*/
 
@@ -408,19 +402,17 @@ static int tw68_resume(struct pci_dev *pci_dev)
 
 	return 0;
 }
-#endif
 
 /* ----------------------------------------------------------- */
 
+static SIMPLE_DEV_PM_OPS(tw68_pm_ops, tw68_suspend, tw68_resume);
+
 static struct pci_driver tw68_pci_driver = {
-	.name	  = "tw68",
-	.id_table = tw68_pci_tbl,
-	.probe	  = tw68_initdev,
-	.remove	  = tw68_finidev,
-#ifdef CONFIG_PM
-	.suspend  = tw68_suspend,
-	.resume   = tw68_resume
-#endif
+	.name	   = "tw68",
+	.id_table  = tw68_pci_tbl,
+	.probe	   = tw68_initdev,
+	.remove	   = tw68_finidev,
+	.driver.pm = &tw68_pm_ops,
 };
 
 module_pci_driver(tw68_pci_driver);
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
