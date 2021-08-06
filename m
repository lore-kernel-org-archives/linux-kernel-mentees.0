Return-Path: <SRS0=Fc4Z=M5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01D09C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Aug 2021 16:40:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90CB961181
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Aug 2021 16:40:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 90CB961181
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=anirudhrb.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5352283268;
	Fri,  6 Aug 2021 16:40:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tAwI-BsRt84M; Fri,  6 Aug 2021 16:40:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6A5A5831CB;
	Fri,  6 Aug 2021 16:40:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 46DFAC001A;
	Fri,  6 Aug 2021 16:40:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A24B5C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Aug 2021 16:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C7D560859
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Aug 2021 16:40:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=anirudhrb.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pIbNFvK8SNL7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Aug 2021 16:40:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sender4-of-o53.zoho.com (sender4-of-o53.zoho.com
 [136.143.188.53])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A316E605FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Aug 2021 16:40:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1628268032; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=VjQJn9Yo2OOs2lPyzpvrg2ToDE4Vp7D2uB0cA68eq8P+NJHkuvncFWhQOG0hGf1qlATGtouPxN7sPQwYow0U0S1VB5hgbDUUm2STg61vE0iMLlWZ3ToYLNerAyUgvixcgWS4olWVJKJ60IoSxLMGusVbPXQeghAspWjxUVeho34=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1628268032;
 h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
 bh=U9Xt7jrxQ/s2c7DQyTWN6yPX3RSqwfnsXbplw4auAIs=; 
 b=GVmCaGAQMDWJVUp8ajik39ajOVQyBNiy52AOcpdcqAr7xG1cPCyg9CK5uGqr1N4KXOx42bU8LKo1wDLlSldxruFNfCoOy/QeRNQ38aeTBm64LNCGE/jarK3ctStuQP/V/E6AIDiKgGtXMb1OgMUTVo1GuJAZFC6yvFv5lIFcCw4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=anirudhrb.com;
 spf=pass  smtp.mailfrom=mail@anirudhrb.com;
 dmarc=pass header.from=<mail@anirudhrb.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1628268032; 
 s=zoho; d=anirudhrb.com; i=mail@anirudhrb.com;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;
 bh=U9Xt7jrxQ/s2c7DQyTWN6yPX3RSqwfnsXbplw4auAIs=;
 b=rmdYF9QZwZjLaNHbgvxOMTrM7e98RiqJCp861A2CcrgJcK2WXjz/ngQvOHopLw2u
 v4u+4dyvJ1zrXZGy6i3hWGp6pnZIi6iqpZf+d7uFP39houJq5roVmyNcQpNT/9BVbKL
 c5jWAse35mxLZTU1G34GIdhGm7/9Xf1IfVQrGgLM=
Received: from localhost.localdomain (106.51.104.154 [106.51.104.154]) by
 mx.zohomail.com with SMTPS id 1628268027927634.6221552768395;
 Fri, 6 Aug 2021 09:40:27 -0700 (PDT)
From: Anirudh Rayabharam <mail@anirudhrb.com>
To: Valentina Manea <valentina.manea.m@gmail.com>,
 Shuah Khan <shuah@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] usbip: give back URBs for unsent unlink requests during
 cleanup
Date: Fri,  6 Aug 2021 22:10:14 +0530
Message-Id: <20210806164015.25263-1-mail@anirudhrb.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-ZohoMailClient: External
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-usb@vger.kernel.org,
 syzbot+74d6ef051d3d2eacf428@syzkaller.appspotmail.com
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

In vhci_device_unlink_cleanup(), the URBs for unsent unlink requests are
not given back. This sometimes causes usb_kill_urb to wait indefinitely
for that urb to be given back. syzbot has reported a hung task issue [1]
for this.

To fix this, give back the urbs corresponding to unsent unlink requests
(unlink_tx list) similar to how urbs corresponding to unanswered unlink
requests (unlink_rx list) are given back. Since the code is almost the
same, extract it into a new function and call it for both unlink_rx and
unlink_tx lists.

[1]: https://syzkaller.appspot.com/bug?id=08f12df95ae7da69814e64eb5515d5a85ed06b76

Reported-by: syzbot+74d6ef051d3d2eacf428@syzkaller.appspotmail.com
Tested-by: syzbot+74d6ef051d3d2eacf428@syzkaller.appspotmail.com
Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>
---
 drivers/usb/usbip/vhci_hcd.c | 47 ++++++++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
index 4ba6bcdaa8e9..45f98aa12895 100644
--- a/drivers/usb/usbip/vhci_hcd.c
+++ b/drivers/usb/usbip/vhci_hcd.c
@@ -945,7 +945,8 @@ static int vhci_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
 	return 0;
 }
 
-static void vhci_device_unlink_cleanup(struct vhci_device *vdev)
+static void __vhci_cleanup_unlink_list(struct vhci_device *vdev,
+		struct list_head *unlink_list)
 {
 	struct vhci_hcd *vhci_hcd = vdev_to_vhci_hcd(vdev);
 	struct usb_hcd *hcd = vhci_hcd_to_hcd(vhci_hcd);
@@ -953,23 +954,25 @@ static void vhci_device_unlink_cleanup(struct vhci_device *vdev)
 	struct vhci_unlink *unlink, *tmp;
 	unsigned long flags;
 
+	if (unlink_list != &vdev->unlink_tx
+			&& unlink_list != &vdev->unlink_rx) {
+		pr_err("Invalid list passed to __vhci_cleanup_unlink_list\n");
+		BUG();
+		return;
+	}
+
 	spin_lock_irqsave(&vhci->lock, flags);
 	spin_lock(&vdev->priv_lock);
 
-	list_for_each_entry_safe(unlink, tmp, &vdev->unlink_tx, list) {
-		pr_info("unlink cleanup tx %lu\n", unlink->unlink_seqnum);
-		list_del(&unlink->list);
-		kfree(unlink);
-	}
-
-	while (!list_empty(&vdev->unlink_rx)) {
+	list_for_each_entry_safe(unlink, tmp, unlink_list, list) {
 		struct urb *urb;
 
-		unlink = list_first_entry(&vdev->unlink_rx, struct vhci_unlink,
-			list);
-
-		/* give back URB of unanswered unlink request */
-		pr_info("unlink cleanup rx %lu\n", unlink->unlink_seqnum);
+		if (unlink_list == &vdev->unlink_tx)
+			pr_info("unlink cleanup tx %lu\n",
+					unlink->unlink_seqnum);
+		else
+			pr_info("unlink cleanup rx %lu\n",
+					unlink->unlink_seqnum);
 
 		urb = pickup_urb_and_free_priv(vdev, unlink->unlink_seqnum);
 		if (!urb) {
@@ -1001,6 +1004,24 @@ static void vhci_device_unlink_cleanup(struct vhci_device *vdev)
 	spin_unlock_irqrestore(&vhci->lock, flags);
 }
 
+static inline void vhci_cleanup_unlink_tx(struct vhci_device *vdev)
+{
+	__vhci_cleanup_unlink_list(vdev, &vdev->unlink_tx);
+}
+
+static inline void vhci_cleanup_unlink_rx(struct vhci_device *vdev)
+{
+	__vhci_cleanup_unlink_list(vdev, &vdev->unlink_rx);
+}
+
+static void vhci_device_unlink_cleanup(struct vhci_device *vdev)
+{
+	/* give back URBs of unsent unlink requests */
+	vhci_cleanup_unlink_tx(vdev);
+	/* give back URBs of unanswered unlink requests */
+	vhci_cleanup_unlink_rx(vdev);
+}
+
 /*
  * The important thing is that only one context begins cleanup.
  * This is why error handling and cleanup become simple.
-- 
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
