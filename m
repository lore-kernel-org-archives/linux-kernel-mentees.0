Return-Path: <SRS0=91P4=AK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 832E0C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 07:37:42 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5895123142
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 07:37:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AytPDfT2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5895123142
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 39BE38937B;
	Mon, 29 Jun 2020 07:37:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LfXPfFYkdNnM; Mon, 29 Jun 2020 07:37:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BFA3889379;
	Mon, 29 Jun 2020 07:37:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AB216C07FF;
	Mon, 29 Jun 2020 07:37:41 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AC06AC016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 07:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9BD628937B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 07:37:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QzIwhgvQ+a+d
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 07:37:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1C99C89379
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 07:37:39 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id x3so2008090pfo.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 00:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EssEWRuUlyUMovXvf1Owqev660e7KUxdmLM0BPnhB2U=;
 b=AytPDfT240W61C3o6D7il9CG8AFES77CMBtW6PtMpoZtIZ4KUdiQDw1kr6rk7xC86+
 7k6MyyuKeQFCdf1UOQ8mUKDDAEUHUNO27DZOIbiAxYZ92HjCHrCO74ymPfH6IzHoI4F2
 dg/oTA9EYIkdFwhDeIXc3zqe8+xOI1iWbid8trljq5ton6TrgnctIjozgEpiblxiGEwC
 hB5J8pu+waxM5vczpiCP7zzWsnjrbzgTFgqL01m6SKvIXxvRCaB39XawcGdxvVGRk5kq
 IOW1PNZ/V4LFOqXaa6mcn1Q6YjKrvBoeP3eM5vYfL5ln0FxnNM4orwSLWc5M5GsZchPE
 hoNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EssEWRuUlyUMovXvf1Owqev660e7KUxdmLM0BPnhB2U=;
 b=K0pSzdYBLFEErAsXWBNjnHsIvOmKC9Jd7a1Bf18Q8F/YTw841zbCKOTifJMVMURRt0
 50ZcXuaHBudVsEwsHlOdNmDN1O8LBlsjOizMpZmmx+bkR6IIa8mYKlfj9LWtf69e98hc
 zYCgLbinnN011zB2W+HouoaCWXGaXfe87kNZpU9T9UBGBnNxKWAQeSPRBIEh1bwhKSsN
 ifi8PmincNnIlnTzi+DbXKv+xqLqKOpvYG4Nr7S9X52cnJdSijdZH6oqcyd5x/4ycKwk
 1Q/DctTDgG4coP5uguesJSrvgKj/q9AodVRaDD0j2CaWlaw4LmtKOPx/cTSiHqjdLVC1
 LKHw==
X-Gm-Message-State: AOAM531t8MV6lqkecjpmKSBXOH4EBPk8F5jlgWp1oWrXYbeCWYN1duOH
 LdIMz8Nyxr7bm7rvefGo+rs=
X-Google-Smtp-Source: ABdhPJwzhiGQLxmqe1ZN2rfVRGk+dNFXyDLy1Krsxxp130ZsiGww/UHMfamqU+y8FseQr5GY8llZdg==
X-Received: by 2002:a63:3603:: with SMTP id d3mr8298304pga.200.1593416258709; 
 Mon, 29 Jun 2020 00:37:38 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id q10sm34673004pfk.86.2020.06.29.00.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 00:37:38 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Date: Mon, 29 Jun 2020 13:06:02 +0530
Message-Id: <20200629073604.205478-5-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200629073604.205478-1-vaibhavgupta40@gmail.com>
References: <20200629073604.205478-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-media@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1 4/6] [media] cx88: use generic
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

With legacy PM, drivers themselves were responsible for managing the
device's power states and takes care of register states.

After upgrading to the generic structure, PCI core will take care of
required tasks and drivers should do only device-specific operations.

The driver was invoking PCI helper functions like pci_save/restore_state(),
pci_enable/disable_device() and pci_set_power_state(), which is not
recommended.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/media/pci/cx88/cx88-video.c | 52 ++++++++---------------------
 1 file changed, 13 insertions(+), 39 deletions(-)

diff --git a/drivers/media/pci/cx88/cx88-video.c b/drivers/media/pci/cx88/cx88-video.c
index ba0e9660a047..a06d5b8f31b9 100644
--- a/drivers/media/pci/cx88/cx88-video.c
+++ b/drivers/media/pci/cx88/cx88-video.c
@@ -1551,10 +1551,9 @@ static void cx8800_finidev(struct pci_dev *pci_dev)
 	kfree(dev);
 }
 
-#ifdef CONFIG_PM
-static int cx8800_suspend(struct pci_dev *pci_dev, pm_message_t state)
+static int __maybe_unused cx8800_suspend(struct device *dev_d)
 {
-	struct cx8800_dev *dev = pci_get_drvdata(pci_dev);
+	struct cx8800_dev *dev = dev_get_drvdata(dev_d);
 	struct cx88_core *core = dev->core;
 	unsigned long flags;
 
@@ -1575,40 +1574,17 @@ static int cx8800_suspend(struct pci_dev *pci_dev, pm_message_t state)
 	/* FIXME -- shutdown device */
 	cx88_shutdown(core);
 
-	pci_save_state(pci_dev);
-	if (pci_set_power_state(pci_dev,
-				pci_choose_state(pci_dev, state)) != 0) {
-		pci_disable_device(pci_dev);
-		dev->state.disabled = 1;
-	}
+	dev->state.disabled = 1;
 	return 0;
 }
 
-static int cx8800_resume(struct pci_dev *pci_dev)
+static int __maybe_unused cx8800_resume(struct device *dev_d)
 {
-	struct cx8800_dev *dev = pci_get_drvdata(pci_dev);
+	struct cx8800_dev *dev = dev_get_drvdata(dev_d);
 	struct cx88_core *core = dev->core;
 	unsigned long flags;
-	int err;
-
-	if (dev->state.disabled) {
-		err = pci_enable_device(pci_dev);
-		if (err) {
-			pr_err("can't enable device\n");
-			return err;
-		}
-
-		dev->state.disabled = 0;
-	}
-	err = pci_set_power_state(pci_dev, PCI_D0);
-	if (err) {
-		pr_err("can't set power state\n");
-		pci_disable_device(pci_dev);
-		dev->state.disabled = 1;
 
-		return err;
-	}
-	pci_restore_state(pci_dev);
+	dev->state.disabled = 0;
 
 	/* FIXME: re-initialize hardware */
 	cx88_reset(core);
@@ -1631,7 +1607,6 @@ static int cx8800_resume(struct pci_dev *pci_dev)
 
 	return 0;
 }
-#endif
 
 /* ----------------------------------------------------------- */
 
@@ -1647,15 +1622,14 @@ static const struct pci_device_id cx8800_pci_tbl[] = {
 };
 MODULE_DEVICE_TABLE(pci, cx8800_pci_tbl);
 
+static SIMPLE_DEV_PM_OPS(cx8800_pm_ops, cx8800_suspend, cx8800_resume);
+
 static struct pci_driver cx8800_pci_driver = {
-	.name     = "cx8800",
-	.id_table = cx8800_pci_tbl,
-	.probe    = cx8800_initdev,
-	.remove   = cx8800_finidev,
-#ifdef CONFIG_PM
-	.suspend  = cx8800_suspend,
-	.resume   = cx8800_resume,
-#endif
+	.name      = "cx8800",
+	.id_table  = cx8800_pci_tbl,
+	.probe     = cx8800_initdev,
+	.remove    = cx8800_finidev,
+	.driver.pm = &cx8800_pm_ops,
 };
 
 module_pci_driver(cx8800_pci_driver);
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
