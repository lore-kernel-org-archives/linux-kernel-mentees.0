Return-Path: <SRS0=yQZp=EE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A3C2C56202
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 29 Oct 2020 13:23:41 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B78C02067D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 29 Oct 2020 13:23:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ba+fdg0/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B78C02067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3077285F4E;
	Thu, 29 Oct 2020 13:23:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 240328ywTjii; Thu, 29 Oct 2020 13:23:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9289D85EBE;
	Thu, 29 Oct 2020 13:23:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7B762C088B;
	Thu, 29 Oct 2020 13:23:39 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 06C3EC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Oct 2020 13:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E84EE85F80
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Oct 2020 13:23:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BRolqQOPL49a
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Oct 2020 13:23:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CE58D85EBE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Oct 2020 13:23:36 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id o9so1274004plx.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Oct 2020 06:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GXWZRuxu4VR36pF/cjVXXRZb5YESqKLE2k0JDNWMpBU=;
 b=Ba+fdg0/mxmgFjx3BLhYuwhBgDs7yEH1xttYt57NG88+f0TEcVpfvrejTKwXT6T9Jv
 zd+bPE4ayZFtQJ7MoOoMci+vPQs/fDnVQH9S+u2G0VNACi+uUEOdXhga+LZF8Wm7rBhP
 LM2/qFbrQ3anWMpqrW3f4TjSyECdwmt4D7T4zqGuoa/9MNQ6hDJZap2lMFf2PZeZvSaR
 O9Lg8fF1fV01q7Loptb/jRBtEk8XS+YDdjeeVgGOsWWEdHY1WnKTT1nBVYU2zczf9EKB
 UjFya2ka4Pp1fMueAV1fJQq2xy3acTYSNR7dmiYoXPsbgEAClxUBfpMMtvbQ+UA7gr5/
 B7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GXWZRuxu4VR36pF/cjVXXRZb5YESqKLE2k0JDNWMpBU=;
 b=tGpaozaa4/HNl4x4T2fXpW/8n26eg/t01tAhYYfvxyC/+Kg0B0l/YsN0HoRBuIwDYv
 ihmccKCGPqNZoYYKH31+vpfDeCnwcTrqcMcC8RA4He2hcZEIzgDWMPnG7awjjsDlsnMA
 ZGvpSDSPUoaJ4L82J6EgzIHnjXtldBVo8EHQaSI2eIqLkdzemWsfdYK5GyTTSUjKpbpd
 1Yt81AlVAYLsUvtAe5DZtYqNDAjRw8snIvlX56PhUVJOIrNxSyDFmWa5GrjyLol2WI1b
 M/VfL0WAWv0xpBQhO7kp3m0mvl0PDW2KjZj/D26QRik2R8GmEJxdIxc8iFymdQfFDDRw
 gM/g==
X-Gm-Message-State: AOAM530RDvnkyJ6ojuiukSA/YuFduglcpoY4TIMq4dqEt/WX0cotYLLd
 43vU2YfE8rwvWR86waX2ujA=
X-Google-Smtp-Source: ABdhPJwOTAUNTtIHl2nJJxRVPqBOxgwW3ox58eG5wvfAmz1vNeMZX5wHcOnEQ6xyE0OJ2VNHkuFomQ==
X-Received: by 2002:a17:902:690b:b029:d6:41d8:bdc7 with SMTP id
 j11-20020a170902690bb02900d641d8bdc7mr3918041plk.7.1603977816207; 
 Thu, 29 Oct 2020 06:23:36 -0700 (PDT)
Received: from localhost.localdomain ([49.207.222.191])
 by smtp.gmail.com with ESMTPSA id i1sm2795872pfa.168.2020.10.29.06.23.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 06:23:35 -0700 (PDT)
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
To: Oliver Neukum <oneukum@suse.com>, "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>
Date: Thu, 29 Oct 2020 18:52:56 +0530
Message-Id: <20201029132256.11793-1-anant.thazhemadam@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201010065623.10189-1-anant.thazhemadam@gmail.com>
References: <20201010065623.10189-1-anant.thazhemadam@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, Anant Thazhemadam <anant.thazhemadam@gmail.com>,
 linux-usb@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v2] net: usb: usbnet: update
	__usbnet_{read|write}_cmd() to use new API
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

Currently, __usbnet_{read|write}_cmd() use usb_control_msg(),
and thus consider potential partial reads/writes being done to 
be perfectly valid.
Quite a few callers of usbnet_{read|write}_cmd() don't enforce
checking for partial reads/writes into account either, automatically
assuming that a complete read/write occurs.

However, the new usb_control_msg_{send|recv}() APIs don't allow partial
reads and writes.
Using the new APIs also relaxes the return value checking that must
be done after usbnet_{read|write}_cmd() is called.

Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
---
Changes in v2:
	* Fix build error

This patch has been compile and build tested with a .config file that
was generated using make allyesconfig, and the build error has been 
fixed.
Unfortunately, I wasn't able to get my hands on a usbnet adapter for testing,
and would appreciate it if someone could do that.

 drivers/net/usb/usbnet.c | 52 ++++++++--------------------------------
 1 file changed, 10 insertions(+), 42 deletions(-)

diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
index bf6c58240bd4..2f7c7b7f4047 100644
--- a/drivers/net/usb/usbnet.c
+++ b/drivers/net/usb/usbnet.c
@@ -1982,64 +1982,32 @@ EXPORT_SYMBOL(usbnet_link_change);
 static int __usbnet_read_cmd(struct usbnet *dev, u8 cmd, u8 reqtype,
 			     u16 value, u16 index, void *data, u16 size)
 {
-	void *buf = NULL;
-	int err = -ENOMEM;
 
 	netdev_dbg(dev->net, "usbnet_read_cmd cmd=0x%02x reqtype=%02x"
 		   " value=0x%04x index=0x%04x size=%d\n",
 		   cmd, reqtype, value, index, size);
 
-	if (size) {
-		buf = kmalloc(size, GFP_KERNEL);
-		if (!buf)
-			goto out;
-	}
-
-	err = usb_control_msg(dev->udev, usb_rcvctrlpipe(dev->udev, 0),
-			      cmd, reqtype, value, index, buf, size,
-			      USB_CTRL_GET_TIMEOUT);
-	if (err > 0 && err <= size) {
-        if (data)
-            memcpy(data, buf, err);
-        else
-            netdev_dbg(dev->net,
-                "Huh? Data requested but thrown away.\n");
-    }
-	kfree(buf);
-out:
-	return err;
+	return usb_control_msg_recv(dev->udev, 0,
+			      cmd, reqtype, value, index, data, size,
+			      USB_CTRL_GET_TIMEOUT, GFP_KERNEL);
 }
 
 static int __usbnet_write_cmd(struct usbnet *dev, u8 cmd, u8 reqtype,
 			      u16 value, u16 index, const void *data,
 			      u16 size)
 {
-	void *buf = NULL;
-	int err = -ENOMEM;
-
 	netdev_dbg(dev->net, "usbnet_write_cmd cmd=0x%02x reqtype=%02x"
 		   " value=0x%04x index=0x%04x size=%d\n",
 		   cmd, reqtype, value, index, size);
 
-	if (data) {
-		buf = kmemdup(data, size, GFP_KERNEL);
-		if (!buf)
-			goto out;
-	} else {
-        if (size) {
-            WARN_ON_ONCE(1);
-            err = -EINVAL;
-            goto out;
-        }
-    }
-
-	err = usb_control_msg(dev->udev, usb_sndctrlpipe(dev->udev, 0),
-			      cmd, reqtype, value, index, buf, size,
-			      USB_CTRL_SET_TIMEOUT);
-	kfree(buf);
+	if (size && !data) {
+		WARN_ON_ONCE(1);
+		return -EINVAL;
+	}
 
-out:
-	return err;
+	return usb_control_msg_send(dev->udev, 0,
+			cmd, reqtype, value, index, data, size,
+			USB_CTRL_SET_TIMEOUT, GFP_KERNEL);
 }
 
 /*
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
