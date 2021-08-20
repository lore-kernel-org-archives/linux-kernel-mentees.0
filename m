Return-Path: <SRS0=59bo=NL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98404C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Aug 2021 19:01:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 422BB61057
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Aug 2021 19:01:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 422BB61057
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=anirudhrb.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15F5E81A95;
	Fri, 20 Aug 2021 19:01:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m3XZU-XDqO9I; Fri, 20 Aug 2021 19:01:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E18E78104C;
	Fri, 20 Aug 2021 19:01:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CE191C0010;
	Fri, 20 Aug 2021 19:01:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 36C2DC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 19:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A6978104C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 19:01:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V7BxxqeqkDdH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 19:01:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sender4-of-o53.zoho.com (sender4-of-o53.zoho.com
 [136.143.188.53])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E1EB814B5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 19:01:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1629486095; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=FYC8OsfGdON7NA1wELVDR6mQwrzHTDVXeg0X6QPfhT7/DeDMA3L7uO6Ztcl9Hrmyxn16V8+rMfcfFsAyyCYVfBMWWD9zzJ9HTa9FkU5Px1BK6VHcrG17xJlDaVXdV45FZkx2WLFbHuVefvfcV1aZ4bxiFVbxViSMk3zAccuTzqc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1629486095;
 h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=l54DrbdzOOm54TU8lbIEydM8EqA2Xe62mFtORV3rvJ4=; 
 b=eqhm70cot17LWxWOSJORlj4bPprCboxzeCBllHPQXMlyPf2KwyqrzYINIDK8ne8z932AzXLarecGj+UO+E/+I9JAVapOMQYEK149OEIFictzbtQaSqWe1PRyHUasOkaSdNM12M80ryYwXtxSYqnRQVhiueoY00Khe5LMQdI5sq4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=anirudhrb.com;
 spf=pass  smtp.mailfrom=mail@anirudhrb.com;
 dmarc=pass header.from=<mail@anirudhrb.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1629486095; 
 s=zoho; d=anirudhrb.com; i=mail@anirudhrb.com;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
 bh=l54DrbdzOOm54TU8lbIEydM8EqA2Xe62mFtORV3rvJ4=;
 b=o8mZYVIZUfudBbmim9rWBcB5jSH0y/e0vM9T4ZN4b7UhNupsd6Zy2CCvRAMQ0kbB
 UUBmY5VfzHHK5mjFsKpQkXM6lGBh5tvaDyny86Amiefvicky2dmGQnboooFzly0/G6l
 L3rvhRWIfQYoyJ8X+tYn0ymZyyNKBWUzrLokuTXU=
Received: from localhost.localdomain (106.51.111.164 [106.51.111.164]) by
 mx.zohomail.com with SMTPS id 1629486094736528.1520859464648;
 Fri, 20 Aug 2021 12:01:34 -0700 (PDT)
From: Anirudh Rayabharam <mail@anirudhrb.com>
To: valentina.manea.m@gmail.com, shuah@kernel.org, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] usbip: clean up code in vhci_device_unlink_cleanup
Date: Sat, 21 Aug 2021 00:31:22 +0530
Message-Id: <20210820190122.16379-3-mail@anirudhrb.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210820190122.16379-1-mail@anirudhrb.com>
References: <20210820190122.16379-1-mail@anirudhrb.com>
MIME-Version: 1.0
X-ZohoMailClient: External
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

The cleanup code for unlink_tx and unlink_rx lists is almost the same.
So, extract it into a new function and call it for both unlink_rx and
unlink_tx. Also, remove unnecessary log messages.

Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>
---
 drivers/usb/usbip/vhci_hcd.c | 52 +++++++++---------------------------
 1 file changed, 12 insertions(+), 40 deletions(-)

diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
index 190bd3d1c1f0..b5b31a1d40b6 100644
--- a/drivers/usb/usbip/vhci_hcd.c
+++ b/drivers/usb/usbip/vhci_hcd.c
@@ -945,7 +945,8 @@ static int vhci_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
 	return 0;
 }
 
-static void vhci_device_unlink_cleanup(struct vhci_device *vdev)
+static void vhci_cleanup_unlink_list(struct vhci_device *vdev,
+		struct list_head *unlink_list)
 {
 	struct vhci_hcd *vhci_hcd = vdev_to_vhci_hcd(vdev);
 	struct usb_hcd *hcd = vhci_hcd_to_hcd(vhci_hcd);
@@ -956,12 +957,9 @@ static void vhci_device_unlink_cleanup(struct vhci_device *vdev)
 	spin_lock_irqsave(&vhci->lock, flags);
 	spin_lock(&vdev->priv_lock);
 
-	list_for_each_entry_safe(unlink, tmp, &vdev->unlink_tx, list) {
+	list_for_each_entry_safe(unlink, tmp, unlink_list, list) {
 		struct urb *urb;
 
-		/* give back urb of unsent unlink request */
-		pr_info("unlink cleanup tx %lu\n", unlink->unlink_seqnum);
-
 		urb = pickup_urb_and_free_priv(vdev, unlink->unlink_seqnum);
 		if (!urb) {
 			list_del(&unlink->list);
@@ -986,45 +984,19 @@ static void vhci_device_unlink_cleanup(struct vhci_device *vdev)
 		kfree(unlink);
 	}
 
-	while (!list_empty(&vdev->unlink_rx)) {
-		struct urb *urb;
-
-		unlink = list_first_entry(&vdev->unlink_rx, struct vhci_unlink,
-			list);
-
-		/* give back URB of unanswered unlink request */
-		pr_info("unlink cleanup rx %lu\n", unlink->unlink_seqnum);
-
-		urb = pickup_urb_and_free_priv(vdev, unlink->unlink_seqnum);
-		if (!urb) {
-			pr_info("the urb (seqnum %lu) was already given back\n",
-				unlink->unlink_seqnum);
-			list_del(&unlink->list);
-			kfree(unlink);
-			continue;
-		}
-
-		urb->status = -ENODEV;
-
-		usb_hcd_unlink_urb_from_ep(hcd, urb);
-
-		list_del(&unlink->list);
-
-		spin_unlock(&vdev->priv_lock);
-		spin_unlock_irqrestore(&vhci->lock, flags);
-
-		usb_hcd_giveback_urb(hcd, urb, urb->status);
-
-		spin_lock_irqsave(&vhci->lock, flags);
-		spin_lock(&vdev->priv_lock);
-
-		kfree(unlink);
-	}
-
 	spin_unlock(&vdev->priv_lock);
 	spin_unlock_irqrestore(&vhci->lock, flags);
 }
 
+static void vhci_device_unlink_cleanup(struct vhci_device *vdev)
+{
+	/* give back URB of unsent unlink request */
+	vhci_cleanup_unlink_list(vdev, &vdev->unlink_tx);
+
+	/* give back URB of unanswered unlink request */
+	vhci_cleanup_unlink_list(vdev, &vdev->unlink_rx);
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
