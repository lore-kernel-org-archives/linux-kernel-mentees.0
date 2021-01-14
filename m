Return-Path: <SRS0=ZZOl=GR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D69EDC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 14 Jan 2021 11:57:44 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BA7E2310E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 14 Jan 2021 11:57:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BA7E2310E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 34C3C868E8;
	Thu, 14 Jan 2021 11:57:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DQnQq_cUSo10; Thu, 14 Jan 2021 11:57:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CF79186880;
	Thu, 14 Jan 2021 11:57:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CB160C088B;
	Thu, 14 Jan 2021 11:57:43 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D57B6C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jan 2021 11:57:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C03BA86880
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jan 2021 11:57:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m8_B-lsKsbSf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jan 2021 11:57:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A0C53869BE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jan 2021 11:57:41 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id x18so2787269pln.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jan 2021 03:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aE8Gpce0dusI5ufIrjvwfjO/RPhWK1H8CVWXZPRQ1bg=;
 b=ePQFrPvQmQWHau9JTuzYSKkg2wRECTDCJLUujoltBw3cIcB+ShZZQblwreb7cJXj7M
 MmD76EmvTK0GgvEJr+/KA1HyI1Gu/5dbg9d1o1ZAZxkIfQ2nIPexZxe0pmsx0LcJ8I7A
 9tc+l2b0teCDELNU2kQThm1GfwDuD/UUyjSQKwZcQvYVKyg8ExJ9rQckQwh6bRfKBBvZ
 8NZpdW3vQHU2bCNPMBtaYjhupqfoBekRmxxg+AIdvOwnSQyYv+faeiL84i/88JvIp5Gv
 eRbNdQhI5hlmL0pC3sZ7dPmO0Egx5P+g7F2bFscNhqnmLZUr1AzalFvMTbVkF2rxU8nj
 SYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aE8Gpce0dusI5ufIrjvwfjO/RPhWK1H8CVWXZPRQ1bg=;
 b=QMiECAj7KNixPHVeWNS9L4bvqVWYz5QEJ8ske37ct1wNtSmMPLKcS/rm0domA0Nh3z
 eP3n9z71lUHgxZOdCtzXagZCEdFPb7+lYX6BXV8wElMz/JO75Pn6wUwxg2CE310oJ1zd
 3+ulfEijM1fj+VuDbCltLQ4/5yWjXUuNPcZ7XCZMv21kRTCyP9xxpze8/yWo3oRyDJia
 8Y132SdYUo0zb7pG4+RfPKdrWxabNSFVyF/snvYceRmruYzUy0oeDfwxVzOg47qtGaxL
 w6BthroFYiJ95FY5VqStBTyyyUSOvai/pWjvLG2X8TJs2+rpeh7Bu7R9Qb6MI5SI2l+v
 kgYQ==
X-Gm-Message-State: AOAM531xkLNfHidjJGvnVfBxad7uHlOBY9jtbf6Lt4X5ENtO6juLkRMk
 CovVZmWePpC7J40Od8TXNMg=
X-Google-Smtp-Source: ABdhPJy7kieV/fIXINVZvKUSOp+Z8ie1D+czt4R7bDu8iDW2M+2z8f1vy89JJQ9yFavgV8iP/hWimA==
X-Received: by 2002:a17:90a:5303:: with SMTP id
 x3mr4755040pjh.54.1610625461297; 
 Thu, 14 Jan 2021 03:57:41 -0800 (PST)
Received: from varodek.localdomain ([223.190.37.127])
 by smtp.gmail.com with ESMTPSA id t4sm5107914pfe.212.2021.01.14.03.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 03:57:40 -0800 (PST)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 Joshua Morris <josh.h.morris@us.ibm.com>,
 Philip Kelleher <pjk1939@linux.ibm.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>
Date: Thu, 14 Jan 2021 17:24:22 +0530
Message-Id: <20210114115423.52414-3-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210114115423.52414-1-vaibhavgupta40@gmail.com>
References: <20200722083335.50068-1-vaibhavgupta40@gmail.com>
 <20210114115423.52414-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-block@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v4 2/3] rsxx: use generic power
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

Drivers using legacy power management .suspen()/.resume() callbacks
have to manage PCI states and device's PM states themselves. They also
need to take care of standard configuration registers.

Switch to generic power management framework using a single
"struct dev_pm_ops" variable to take the unnecessary load from the driver.
This also avoids the need for the driver to directly call most of the PCI
helper functions and device power state control functions, as through
the generic framework PCI Core takes care of the necessary operations,
and drivers are required to do only device-specific jobs.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/block/rsxx/core.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/block/rsxx/core.c b/drivers/block/rsxx/core.c
index 63f549889f87..937ad8a28e85 100644
--- a/drivers/block/rsxx/core.c
+++ b/drivers/block/rsxx/core.c
@@ -1032,12 +1032,15 @@ static void rsxx_pci_remove(struct pci_dev *dev)
 	kfree(card);
 }
 
-static int rsxx_pci_suspend(struct pci_dev *dev, pm_message_t state)
+static int __maybe_unused rsxx_pci_suspend(
+	__attribute__((unused)) struct device *dev)
 {
 	/* We don't support suspend at this time. */
 	return -ENOSYS;
 }
 
+#define rsxx_pci_resume NULL
+
 static void rsxx_pci_shutdown(struct pci_dev *dev)
 {
 	struct rsxx_cardinfo *card = pci_get_drvdata(dev);
@@ -1073,12 +1076,14 @@ static const struct pci_device_id rsxx_pci_ids[] = {
 
 MODULE_DEVICE_TABLE(pci, rsxx_pci_ids);
 
+static SIMPLE_DEV_PM_OPS(rsxx_pci_pm_ops, rsxx_pci_suspend, rsxx_pci_resume);
+
 static struct pci_driver rsxx_pci_driver = {
 	.name		= DRIVER_NAME,
 	.id_table	= rsxx_pci_ids,
 	.probe		= rsxx_pci_probe,
 	.remove		= rsxx_pci_remove,
-	.suspend	= rsxx_pci_suspend,
+	.driver.pm	= &rsxx_pci_pm_ops,
 	.shutdown	= rsxx_pci_shutdown,
 	.err_handler    = &rsxx_err_handler,
 };
-- 
2.30.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
