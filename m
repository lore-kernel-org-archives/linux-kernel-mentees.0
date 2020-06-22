Return-Path: <SRS0=5DCt=AD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8356C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Jun 2020 11:44:19 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A74EF206BE
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Jun 2020 11:44:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bOs13kjt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A74EF206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8748088B24;
	Mon, 22 Jun 2020 11:44:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wc2pVqdbVWMp; Mon, 22 Jun 2020 11:44:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1B3A0887E5;
	Mon, 22 Jun 2020 11:44:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0B11FC0891;
	Mon, 22 Jun 2020 11:44:19 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DF412C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 11:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CECD1862BC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 11:44:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KhpQxmBxwceX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 11:44:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6229B862AB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 11:44:16 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id z63so8310214pfb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 04:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kGnJOhO4SDYQP4rIHcqc+jo7CYqIdXY8MtdWzsoIdCI=;
 b=bOs13kjt6xy7YNxCUBgjD5k9fmCgmyX2SS4xWIWAQlvC5MvA5oTmblZRMWNsBNC/ul
 ULrMAs8Vr76/7RP5upSYHmUzXj43Hg9b8WYrc3mlv9KyffbrFyATHbKkdKhBs86C6k9c
 HOfZh6I0l4ZUq2UBL8FloPUkvCiUNj8aOisbAg4f00lTUypZ8v7eqBA1W4dewDB3NdyG
 Pt7ifMfDSuDm+x/fnMMmDJdVyioMsanuXPh75c659IQaA6uOb7bsepo4d/JuWTj53uNt
 EyotPx4DMmJlmPySOyisyJ0kBk/Tw/+MJGGPDvuFO42rirhiRHdW0QUQUTpR61bCnqFt
 FedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kGnJOhO4SDYQP4rIHcqc+jo7CYqIdXY8MtdWzsoIdCI=;
 b=d5ZFvrSbTwYIN1lTGNcAWE07VlUl0esPzAnmpCgPrQVmmPr/OsrJvD+/G4Ha44aBlV
 v7AMgGUOQae65A09YUhEGgl8K8+TYNUqPZ+wwSpHruzqGTynxxeWLzE6gI6uHjtT/WX1
 X6bJAKaYb9j83YgqpQAwPC8PTTCC6j4xVAgATiwnPPwl2vnUEd8FcKqN5wA9OXOo1Jco
 UF6PzaXvOqpW2YGGeOTzspGEQ47EsqiVAXSPQTywfJ1dMzzMZngqPQXNHGDt7L9UoKgL
 dk0/peY2fdZoiRD45xVo2zR1oa40I632aHa+Xijv8QHVQ6N9ouSqC4AlkVLDhXSpCbOe
 4FGg==
X-Gm-Message-State: AOAM532p8xRtXFi5rXQnlK+7cOBXLmRyHGnYmdNKIaWsKQdBThUHVkJy
 tQv8rGZ+D+uz7Iocxf0AWRg=
X-Google-Smtp-Source: ABdhPJymCgIHPEgnF1nd3ZAxp1jzRQj5T7dU3KfC+xW015Y6+X/L/kwwJFSB0Tp0cxzOSCtEpyOMzA==
X-Received: by 2002:a62:5c03:: with SMTP id q3mr20118520pfb.58.1592826255851; 
 Mon, 22 Jun 2020 04:44:15 -0700 (PDT)
Received: from varodek.localdomain ([2401:4900:b8b:123e:d7ae:5602:b3d:9c0])
 by smtp.gmail.com with ESMTPSA id j17sm14081032pjy.22.2020.06.22.04.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 04:44:15 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Vaibhav Gupta <vaibhav.varodek@gmail.com>
Date: Mon, 22 Jun 2020 17:12:25 +0530
Message-Id: <20200622114228.60027-3-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200622114228.60027-1-vaibhavgupta40@gmail.com>
References: <20200622114228.60027-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-parisc@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v1 2/5] tulip: windbond-840: use
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

With stable support of generic PM callbacks, drivers no longer need to use
legacy .suspend() and .resume() in which they had to maintain PCI states
changes and device's power state themselves.

Earlier, .resume() was invoking pci_enable_device(). Drivers should not
call PCI legacy helper functions, hence, it was removed. This should not
change the behavior of the device as this function is called by PCI core
if somehow pm_ops is not able to bind with the driver, else, required tasks
are managed by the core itself.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/net/ethernet/dec/tulip/winbond-840.c | 26 ++++++--------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/dec/tulip/winbond-840.c b/drivers/net/ethernet/dec/tulip/winbond-840.c
index 4d5e4fa53023..5dcc66f60144 100644
--- a/drivers/net/ethernet/dec/tulip/winbond-840.c
+++ b/drivers/net/ethernet/dec/tulip/winbond-840.c
@@ -1530,8 +1530,6 @@ static void w840_remove1(struct pci_dev *pdev)
 	}
 }
 
-#ifdef CONFIG_PM
-
 /*
  * suspend/resume synchronization:
  * - open, close, do_ioctl:
@@ -1555,9 +1553,9 @@ static void w840_remove1(struct pci_dev *pdev)
  * Detach must occur under spin_unlock_irq(), interrupts from a detached
  * device would cause an irq storm.
  */
-static int w840_suspend (struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused w840_suspend(struct device *dev_d)
 {
-	struct net_device *dev = pci_get_drvdata (pdev);
+	struct net_device *dev = dev_get_drvdata(dev_d);
 	struct netdev_private *np = netdev_priv(dev);
 	void __iomem *ioaddr = np->base_addr;
 
@@ -1590,21 +1588,15 @@ static int w840_suspend (struct pci_dev *pdev, pm_message_t state)
 	return 0;
 }
 
-static int w840_resume (struct pci_dev *pdev)
+static int __maybe_unused w840_resume(struct device *dev_d)
 {
-	struct net_device *dev = pci_get_drvdata (pdev);
+	struct net_device *dev = dev_get_drvdata(dev_d);
 	struct netdev_private *np = netdev_priv(dev);
-	int retval = 0;
 
 	rtnl_lock();
 	if (netif_device_present(dev))
 		goto out; /* device not suspended */
 	if (netif_running(dev)) {
-		if ((retval = pci_enable_device(pdev))) {
-			dev_err(&dev->dev,
-				"pci_enable_device failed in resume\n");
-			goto out;
-		}
 		spin_lock_irq(&np->lock);
 		iowrite32(1, np->base_addr+PCIBusCfg);
 		ioread32(np->base_addr+PCIBusCfg);
@@ -1622,19 +1614,17 @@ static int w840_resume (struct pci_dev *pdev)
 	}
 out:
 	rtnl_unlock();
-	return retval;
+	return 0;
 }
-#endif
+
+static SIMPLE_DEV_PM_OPS(w840_pm_ops, w840_suspend, w840_resume);
 
 static struct pci_driver w840_driver = {
 	.name		= DRV_NAME,
 	.id_table	= w840_pci_tbl,
 	.probe		= w840_probe1,
 	.remove		= w840_remove1,
-#ifdef CONFIG_PM
-	.suspend	= w840_suspend,
-	.resume		= w840_resume,
-#endif
+	.driver.pm	= &w840_pm_ops,
 };
 
 static int __init w840_init(void)
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
