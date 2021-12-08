Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 627DCC433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  8 Dec 2021 19:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 057738283D;
	Wed,  8 Dec 2021 19:25:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8n9qKck8kOWG; Wed,  8 Dec 2021 19:25:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 14E4C82893;
	Wed,  8 Dec 2021 19:25:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EA92BC002F;
	Wed,  8 Dec 2021 19:25:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4BE92C0012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Dec 2021 19:25:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28A0C403FB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Dec 2021 19:25:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tp4Qf-6mfHv7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Dec 2021 19:25:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E699403A4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Dec 2021 19:25:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 86AA5B82271;
 Wed,  8 Dec 2021 19:25:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCEC4C00446;
 Wed,  8 Dec 2021 19:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638991507;
 bh=8vyuFB78UlBf9oj4qyNlqvw2Y5owe7cuGBLG7rfajMQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O2nxT0QF017bQkv7nttdePTZG8VfptmRW46a+ahpbY9wSlBob6LLX68ybWJBBcDbd
 OJDglUuwPRGBUdcLcgQy/7h77Lz7mem+S02SbK1Oh25j+QeDsrAMSBQ9oDhKFKUpTY
 OuKrUFI7H7GOpOmpiXoqz4BP81+sB7Q5tIo6k6IExkocm6xLwa4bhyXdplnVmDfROP
 5pfhGWujUV7/ia92KW6ECo6Wzic2uctjCoIaVGHCIYhf99b+Tj0n30+sBNgXezVywx
 PeJMyIWuUAvSPf9rv7X3kX+/yubC3tKTr0D5HXlW1Ijl4IZfdCtbbmLNrhNRMAt2+7
 1efdkxI97dmFg==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jens Axboe <axboe@kernel.dk>, Joshua Morris <josh.h.morris@us.ibm.com>,
 Philip Kelleher <pjk1939@linux.ibm.com>
Subject: [PATCH v5 2/4] mtip32xx: remove pointless drvdata lookups
Date: Wed,  8 Dec 2021 13:24:47 -0600
Message-Id: <20211208192449.146076-3-helgaas@kernel.org>
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

Previously we passed a struct pci_dev * to mtip_check_surprise_removal(),
which immediately looked up the driver_data.  But all callers already have
the driver_data pointer, so just pass it directly and skip the extra
lookup.  No functional change intended.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/block/mtip32xx/mtip32xx.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/block/mtip32xx/mtip32xx.c b/drivers/block/mtip32xx/mtip32xx.c
index 8677ac4c3431..894020aaaaeb 100644
--- a/drivers/block/mtip32xx/mtip32xx.c
+++ b/drivers/block/mtip32xx/mtip32xx.c
@@ -136,16 +136,15 @@ struct mtip_compat_ide_task_request_s {
  * return value
  *	 true if device removed, else false
  */
-static bool mtip_check_surprise_removal(struct pci_dev *pdev)
+static bool mtip_check_surprise_removal(struct driver_data *dd)
 {
 	u16 vendor_id = 0;
-	struct driver_data *dd = pci_get_drvdata(pdev);
 
 	if (dd->sr)
 		return true;
 
        /* Read the vendorID from the configuration space */
-	pci_read_config_word(pdev, 0x00, &vendor_id);
+	pci_read_config_word(dd->pdev, 0x00, &vendor_id);
 	if (vendor_id == 0xFFFF) {
 		dd->sr = true;
 		if (dd->queue)
@@ -447,7 +446,7 @@ static int mtip_device_reset(struct driver_data *dd)
 {
 	int rv = 0;
 
-	if (mtip_check_surprise_removal(dd->pdev))
+	if (mtip_check_surprise_removal(dd))
 		return 0;
 
 	if (mtip_hba_reset(dd) < 0)
@@ -727,7 +726,7 @@ static inline void mtip_process_errors(struct driver_data *dd, u32 port_stat)
 		dev_warn(&dd->pdev->dev,
 			"Port stat errors %x unhandled\n",
 			(port_stat & ~PORT_IRQ_HANDLED));
-		if (mtip_check_surprise_removal(dd->pdev))
+		if (mtip_check_surprise_removal(dd))
 			return;
 	}
 	if (likely(port_stat & (PORT_IRQ_TF_ERR | PORT_IRQ_IF_ERR))) {
@@ -752,7 +751,7 @@ static inline irqreturn_t mtip_handle_irq(struct driver_data *data)
 		/* Acknowledge the interrupt status on the port.*/
 		port_stat = readl(port->mmio + PORT_IRQ_STAT);
 		if (unlikely(port_stat == 0xFFFFFFFF)) {
-			mtip_check_surprise_removal(dd->pdev);
+			mtip_check_surprise_removal(dd);
 			return IRQ_HANDLED;
 		}
 		writel(port_stat, port->mmio + PORT_IRQ_STAT);
@@ -796,7 +795,7 @@ static inline irqreturn_t mtip_handle_irq(struct driver_data *data)
 		}
 
 		if (unlikely(port_stat & PORT_IRQ_ERR)) {
-			if (unlikely(mtip_check_surprise_removal(dd->pdev))) {
+			if (unlikely(mtip_check_surprise_removal(dd))) {
 				/* don't proceed further */
 				return IRQ_HANDLED;
 			}
@@ -915,7 +914,7 @@ static int mtip_quiesce_io(struct mtip_port *port, unsigned long timeout)
 
 		msleep(100);
 
-		if (mtip_check_surprise_removal(port->dd->pdev))
+		if (mtip_check_surprise_removal(port->dd))
 			goto err_fault;
 
 		active = mtip_commands_active(port);
@@ -980,7 +979,7 @@ static int mtip_exec_internal_command(struct mtip_port *port,
 		return -EFAULT;
 	}
 
-	if (mtip_check_surprise_removal(dd->pdev))
+	if (mtip_check_surprise_removal(dd))
 		return -EFAULT;
 
 	rq = blk_mq_alloc_request(dd->queue, REQ_OP_DRV_IN, BLK_MQ_REQ_RESERVED);
@@ -1022,7 +1021,7 @@ static int mtip_exec_internal_command(struct mtip_port *port,
 				fis->command, int_cmd->status);
 		rv = -EIO;
 
-		if (mtip_check_surprise_removal(dd->pdev) ||
+		if (mtip_check_surprise_removal(dd) ||
 			test_bit(MTIP_DDF_REMOVE_PENDING_BIT,
 					&dd->dd_flag)) {
 			dev_err(&dd->pdev->dev,
@@ -2513,7 +2512,7 @@ static int mtip_ftl_rebuild_poll(struct driver_data *dd)
 		if (unlikely(test_bit(MTIP_DDF_REMOVE_PENDING_BIT,
 				&dd->dd_flag)))
 			return -EFAULT;
-		if (mtip_check_surprise_removal(dd->pdev))
+		if (mtip_check_surprise_removal(dd))
 			return -EFAULT;
 
 		if (mtip_get_identify(dd->port, NULL) < 0)
@@ -2891,7 +2890,7 @@ static int mtip_hw_init(struct driver_data *dd)
 		 time_before(jiffies, timeout)) {
 		mdelay(100);
 	}
-	if (unlikely(mtip_check_surprise_removal(dd->pdev))) {
+	if (unlikely(mtip_check_surprise_removal(dd))) {
 		timetaken = jiffies - timetaken;
 		dev_warn(&dd->pdev->dev,
 			"Surprise removal detected at %u ms\n",
@@ -4098,7 +4097,7 @@ static void mtip_pci_remove(struct pci_dev *pdev)
 	list_add(&dd->remove_list, &removing_list);
 	spin_unlock_irqrestore(&dev_lock, flags);
 
-	mtip_check_surprise_removal(pdev);
+	mtip_check_surprise_removal(dd);
 	synchronize_irq(dd->pdev->irq);
 
 	/* Spin until workers are done */
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
