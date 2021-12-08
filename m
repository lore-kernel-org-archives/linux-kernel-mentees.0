Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5883FC433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  8 Dec 2021 19:25:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 060FC4092C;
	Wed,  8 Dec 2021 19:25:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MsFIfMpHDD_l; Wed,  8 Dec 2021 19:25:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 4BB12408FA;
	Wed,  8 Dec 2021 19:25:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2BFB3C002F;
	Wed,  8 Dec 2021 19:25:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A2000C0012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Dec 2021 19:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82BFB403A4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Dec 2021 19:25:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 40ivYXTWWoHL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Dec 2021 19:25:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8C7E440394
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Dec 2021 19:25:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id C3011CE2339;
 Wed,  8 Dec 2021 19:25:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1000C341CF;
 Wed,  8 Dec 2021 19:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638991512;
 bh=vP6f/W58TP3IqHAcgDPaq9RdV/xPL90lUKpkB6Lv618=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pNOqjKq7ezrlERusPHPdRP9XugUOMPlfIQ4iSdbzrYdSDe/ejHEbZ8yn7W6HVOE6i
 aECrEKgA5A1JdZaeKiuHv5bLYBt23Dc4vKSUvbUpjRxxpOjMMdhWwrc53tvAOa6h7u
 4sNA9wEVcDYqW2sLsTbQHPqI40/noCEp3/+JdvVm680MQ+6kaqJqntknG5c+4jJkXW
 AB6QmECkW8aJMS5ifFiOMZg1cfyj85mQ8FmoZu2XSIGI2Pn/CH0coxWYTAypXp518K
 /DdLyDDDpqFtieYy10VoFwc0n97ihKmw81j52Wl+RfVON8dh8E9JsJa3NMMKRX/o9+
 grptupHmds9pg==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jens Axboe <axboe@kernel.dk>, Joshua Morris <josh.h.morris@us.ibm.com>,
 Philip Kelleher <pjk1939@linux.ibm.com>
Subject: [PATCH v5 4/4] rsxx: Drop PCI legacy power management
Date: Wed,  8 Dec 2021 13:24:49 -0600
Message-Id: <20211208192449.146076-5-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211208192449.146076-1-helgaas@kernel.org>
References: <20211208192449.146076-1-helgaas@kernel.org>
MIME-Version: 1.0
Cc: Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

From: Bjorn Helgaas <bhelgaas@google.com>

The rsxx driver doesn't support device suspend, so remove
rsxx_pci_suspend(), the legacy PCI .suspend() method, completely.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/block/rsxx/core.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/block/rsxx/core.c b/drivers/block/rsxx/core.c
index 8d9d69f5dfbc..19b85d16d711 100644
--- a/drivers/block/rsxx/core.c
+++ b/drivers/block/rsxx/core.c
@@ -1037,12 +1037,6 @@ static void rsxx_pci_remove(struct pci_dev *dev)
 	kfree(card);
 }
 
-static int rsxx_pci_suspend(struct pci_dev *dev, pm_message_t state)
-{
-	/* We don't support suspend at this time. */
-	return -ENOSYS;
-}
-
 static void rsxx_pci_shutdown(struct pci_dev *dev)
 {
 	struct rsxx_cardinfo *card = pci_get_drvdata(dev);
@@ -1083,7 +1077,6 @@ static struct pci_driver rsxx_pci_driver = {
 	.id_table	= rsxx_pci_ids,
 	.probe		= rsxx_pci_probe,
 	.remove		= rsxx_pci_remove,
-	.suspend	= rsxx_pci_suspend,
 	.shutdown	= rsxx_pci_shutdown,
 	.err_handler    = &rsxx_err_handler,
 };
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
