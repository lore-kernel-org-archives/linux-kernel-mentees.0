Return-Path: <SRS0=8Gt8=LL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_RED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 146E5C48BE5
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Jun 2021 18:52:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7F7B60C3D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Jun 2021 18:52:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7F7B60C3D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 709D94223D;
	Thu, 17 Jun 2021 18:52:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7XdhO1TLZvk2; Thu, 17 Jun 2021 18:51:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 55AC1421DE;
	Thu, 17 Jun 2021 18:51:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2C1CFC000D;
	Thu, 17 Jun 2021 18:51:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4A1B8C000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Jun 2021 18:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31E29842DC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Jun 2021 18:51:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tFiiviFyajAV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Jun 2021 18:51:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 16692842D9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Jun 2021 18:51:56 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id m21so12133333lfg.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Jun 2021 11:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=40iSRLWtvPNc31eMVSQCNXCOo1P/U4f/2ame7W8s7LA=;
 b=rsxaC1znzCn7fziXWptJz1qN5MODcSouxR5lI+u78WoyFsSgt3dsGIF5Tv44ipxQv6
 kemni53G002ljSgD21taefI9UNC1Yl7M7R4+qVdy+RBLWlayR3c0ovbFqzU+rq1dReE0
 lHNahHTvby841ZMPr/rNIrzJj6klsQMbCh0mVbpGclEZ72IeBmHO3+BjP+MY8xfP/8mv
 uFhLWqW9/WtLcbShF3YxfE3G3NeayGKkIFZGyEfmd+TF+P9wiFsKQhbSMue5CNRUfzLi
 2bvHsgkDWLIADU5pn48jsGYd7xhP078ZpP6u0El9alolLXxEnA+rXUN08/L9CLA5i2xx
 JEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=40iSRLWtvPNc31eMVSQCNXCOo1P/U4f/2ame7W8s7LA=;
 b=dNVrf8YQBS1q5Oec97FN6to+jSes4whgg4DdvIhUnXArlzEphCQAY/ikhWtQr3WWdq
 OAOWZy1Gq0ODZ0KIhJ9VCE5eTDv+FTaMdn5ehIx/WByEjl4R1MPdVcE/uj+5P1iazXBp
 /9b9ZLbLsa5SImU0voACSBFfobV4oFSw6B5FcVlxe5f503dd2e9wsI6RAqo5WL84chsE
 rGIgsHS8/Zf//ONOkZkysEbsjtNbmdZ9NClNr5GaB02U005J7e+t5Wph6kGgLih+6lo9
 WervN8k8ByVgN1tHC+ufbqoU6DhqaW1Kcnzm5c4np7dggU0iUiYFihGwz2/Sr2khNKW+
 oEpA==
X-Gm-Message-State: AOAM533w7tSF8pg0jj7mxMOO2rCI5eUlfyvPaAaQ4DrqT/AMVvi4cj4m
 ONDmh+r671+AqL9bhBXc510=
X-Google-Smtp-Source: ABdhPJxSIdVAbppcnUgVPWZU81UNJMf0YO8KayLnXtSZpBuvMAVk8l2cBRtQr9dzR26muqB+cJO9Tw==
X-Received: by 2002:a19:c10:: with SMTP id 16mr5184114lfm.54.1623955913761;
 Thu, 17 Jun 2021 11:51:53 -0700 (PDT)
Received: from localhost.localdomain ([94.103.229.24])
 by smtp.gmail.com with ESMTPSA id i130sm655175lfd.304.2021.06.17.11.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 11:51:53 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: wg@grandegger.com,
	mkl@pengutronix.de,
	davem@davemloft.net
Subject: [PATCH] net: can: fix use-after-free in ems_usb_disconnect
Date: Thu, 17 Jun 2021 21:51:30 +0300
Message-Id: <20210617185130.5834-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-can@vger.kernel.org
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

In ems_usb_disconnect() dev pointer, which is
netdev private data, is used after free_candev() call:

	if (dev) {
		unregister_netdev(dev->netdev);
		free_candev(dev->netdev);

		unlink_all_urbs(dev);

		usb_free_urb(dev->intr_urb);

		kfree(dev->intr_in_buffer);
		kfree(dev->tx_msg_buffer);
	}

Fix it by simply moving free_candev() at the end of
the block.

Fail log:
 BUG: KASAN: use-after-free in ems_usb_disconnect
 Read of size 8 at addr ffff88804e041008 by task kworker/1:2/2895

 CPU: 1 PID: 2895 Comm: kworker/1:2 Not tainted 5.13.0-rc5+ #164
 Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.14.0-0-g155821a-rebuilt.opensuse.4
 Workqueue: usb_hub_wq hub_event
 Call Trace:
     dump_stack (lib/dump_stack.c:122)
     print_address_description.constprop.0.cold (mm/kasan/report.c:234)
     kasan_report.cold (mm/kasan/report.c:420 mm/kasan/report.c:436)
     ems_usb_disconnect (drivers/net/can/usb/ems_usb.c:683 drivers/net/can/usb/ems_usb.c:1058)

Fixes: 702171adeed3 ("ems_usb: Added support for EMS CPC-USB/ARM7 CAN/USB interface")
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/net/can/usb/ems_usb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/can/usb/ems_usb.c b/drivers/net/can/usb/ems_usb.c
index 5af69787d9d5..0a37af4a3fa4 100644
--- a/drivers/net/can/usb/ems_usb.c
+++ b/drivers/net/can/usb/ems_usb.c
@@ -1053,7 +1053,6 @@ static void ems_usb_disconnect(struct usb_interface *intf)
 
 	if (dev) {
 		unregister_netdev(dev->netdev);
-		free_candev(dev->netdev);
 
 		unlink_all_urbs(dev);
 
@@ -1061,6 +1060,8 @@ static void ems_usb_disconnect(struct usb_interface *intf)
 
 		kfree(dev->intr_in_buffer);
 		kfree(dev->tx_msg_buffer);
+
+		free_candev(dev->netdev);
 	}
 }
 
-- 
2.32.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
