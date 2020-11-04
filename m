Return-Path: <SRS0=I1jd=EK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD44EC2D0A3
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Nov 2020 06:47:55 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5305C22277
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Nov 2020 06:47:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m+E6aOeg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5305C22277
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0BEFF22708;
	Wed,  4 Nov 2020 06:47:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jENM+M8dGm+U; Wed,  4 Nov 2020 06:47:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 999702155B;
	Wed,  4 Nov 2020 06:47:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 88B23C088B;
	Wed,  4 Nov 2020 06:47:53 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A832BC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 87A1D22708
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:47:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sSWSqPeubeGX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:47:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 00CAF20404
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:47:51 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id o3so15722339pgr.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Nov 2020 22:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=XBI1Crl/gsGXbbSC9BdECEbU8Eop484Fu7YnX4s2KCI=;
 b=m+E6aOegAQX7/eaZA7zz/VkVlNlQU1g1l4KUxB/l05xKwUXlPo91NshtD7iV/dNcP8
 pUIhatW7I6vplsSlVMkbHyP+Rkw8OqMqkuptDmJK5WgR1tvOrmVH6lehbvz/Z0IJCmeI
 HvJEBWb7e70+rlWkFwuNT1NrCLkk5p5FoPPKW6x0tCTgmIlLyFoT+FFlbLlcTib1oy1R
 pn8XwZIFTv6hWjkX++sYVO67pRewBrWKuTci2KPuWF3q5mQZQi68xhRbHQNwN69E9WSn
 z9exQzlAZglQXOEJbMfgSNmFDj8arz1I/ygfxQa39D/jTd7qYTPwJxpoPckGD+b8rPN7
 FYYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=XBI1Crl/gsGXbbSC9BdECEbU8Eop484Fu7YnX4s2KCI=;
 b=LbyhtagcyqIjfij6GZbXlKCJSjxKu0U3CjSD5OulILGg/lUThtg3qsqCKMFKyyrDQm
 W1s/GNH6rFQXRYfsKbhEobM/llcmTuAnbndwPDnngfR+dWg3y3ZoFJCwJRkb8LCogMpr
 afp9KDstqq6ezcwNk9hNtiTuad921EAgnsC8PsBRtLad8Q55YGvbop320ojAu3EdBPqD
 ro43ThUlanrKmdNmgO6P56ABoaMLB8RoQUXpHboA7rhUk6Ej9/8Hat81ya6qMJjcXx8v
 aUHSFnwhczdcmFkWm9gCiMDEO2SmJAs5xh3LVKcmfYrbOO6x4jJ9EMS+fZxbS4kiQeFv
 w+8g==
X-Gm-Message-State: AOAM530MKEARlIbgcu26EpQPXfiTSBE/qwT7mrbbt1QTAkgpqIxR+ugk
 z3ndmIYt7PBPKxtAXkj8pL4=
X-Google-Smtp-Source: ABdhPJxyahSG3Vg1L10IOgHREuHBbGgfWEMvNNEfg8kcJOgNP3l4vTYkhWXcdi1L8TDTBk4Blnx9nQ==
X-Received: by 2002:a63:4825:: with SMTP id v37mr20000208pga.256.1604472471640; 
 Tue, 03 Nov 2020 22:47:51 -0800 (PST)
Received: from localhost.localdomain
 ([2402:3a80:16e6:8166:e462:9fba:da9c:beed])
 by smtp.gmail.com with ESMTPSA id s18sm1036873pgh.60.2020.11.03.22.47.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 22:47:51 -0800 (PST)
From: Himadri Pandya <himadrispandya@gmail.com>
To: johan@kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed,  4 Nov 2020 12:16:54 +0530
Message-Id: <20201104064703.15123-7-himadrispandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201104064703.15123-1-himadrispandya@gmail.com>
References: <20201104064703.15123-1-himadrispandya@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 06/15] usb: serial: f81232: use
	usb_control_msg_recv() and usb_control_msg_send()
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

The new usb_control_msg_recv() and usb_control_msg_send() nicely wraps
usb_control_msg() with proper error check. Hence use the wrappers
instead of calling usb_control_msg() directly.

Signed-off-by: Himadri Pandya <himadrispandya@gmail.com>
---
 drivers/usb/serial/f81232.c | 88 ++++++++-----------------------------
 1 file changed, 18 insertions(+), 70 deletions(-)

diff --git a/drivers/usb/serial/f81232.c b/drivers/usb/serial/f81232.c
index 0c7eacc630e0..78107feef8a8 100644
--- a/drivers/usb/serial/f81232.c
+++ b/drivers/usb/serial/f81232.c
@@ -139,71 +139,36 @@ static int calc_baud_divisor(speed_t baudrate, speed_t clockrate)
 static int f81232_get_register(struct usb_serial_port *port, u16 reg, u8 *val)
 {
 	int status;
-	u8 *tmp;
 	struct usb_device *dev = port->serial->dev;
 
-	tmp = kmalloc(sizeof(*val), GFP_KERNEL);
-	if (!tmp)
-		return -ENOMEM;
-
-	status = usb_control_msg(dev,
-				usb_rcvctrlpipe(dev, 0),
-				F81232_REGISTER_REQUEST,
-				F81232_GET_REGISTER,
-				reg,
-				0,
-				tmp,
-				sizeof(*val),
-				USB_CTRL_GET_TIMEOUT);
-	if (status != sizeof(*val)) {
+	status = usb_control_msg_recv(dev, 0, F81232_REGISTER_REQUEST,
+				      F81232_GET_REGISTER, reg, 0, val,
+				      sizeof(*val), USB_CTRL_GET_TIMEOUT,
+				      GFP_KERNEL);
+	if (status) {
 		dev_err(&port->dev, "%s failed status: %d\n", __func__, status);
 
-		if (status < 0)
-			status = usb_translate_errors(status);
-		else
-			status = -EIO;
-	} else {
-		status = 0;
-		*val = *tmp;
+		status = usb_translate_errors(status);
 	}
 
-	kfree(tmp);
 	return status;
 }
 
 static int f81232_set_register(struct usb_serial_port *port, u16 reg, u8 val)
 {
 	int status;
-	u8 *tmp;
 	struct usb_device *dev = port->serial->dev;
 
-	tmp = kmalloc(sizeof(val), GFP_KERNEL);
-	if (!tmp)
-		return -ENOMEM;
-
-	*tmp = val;
-
-	status = usb_control_msg(dev,
-				usb_sndctrlpipe(dev, 0),
-				F81232_REGISTER_REQUEST,
-				F81232_SET_REGISTER,
-				reg,
-				0,
-				tmp,
-				sizeof(val),
-				USB_CTRL_SET_TIMEOUT);
-	if (status != sizeof(val)) {
+	status = usb_control_msg_send(dev, 0,
+				      F81232_REGISTER_REQUEST,
+				      F81232_SET_REGISTER, reg, 0,
+				      &val, sizeof(val), USB_CTRL_SET_TIMEOUT,
+				      GFP_KERNEL);
+	if (status) {
 		dev_err(&port->dev, "%s failed status: %d\n", __func__, status);
 
-		if (status < 0)
-			status = usb_translate_errors(status);
-		else
-			status = -EIO;
-	} else {
-		status = 0;
+		status = usb_translate_errors(status);
 	}
-
-	kfree(tmp);
 	return status;
 }
 
@@ -866,32 +831,16 @@ static int f81534a_ctrl_set_register(struct usb_interface *intf, u16 reg,
 	struct usb_device *dev = interface_to_usbdev(intf);
 	int retry = F81534A_ACCESS_REG_RETRY;
 	int status;
-	u8 *tmp;
-
-	tmp = kmemdup(val, size, GFP_KERNEL);
-	if (!tmp)
-		return -ENOMEM;
 
 	while (retry--) {
-		status = usb_control_msg(dev,
-					usb_sndctrlpipe(dev, 0),
-					F81232_REGISTER_REQUEST,
-					F81232_SET_REGISTER,
-					reg,
-					0,
-					tmp,
-					size,
-					USB_CTRL_SET_TIMEOUT);
-		if (status < 0) {
+		status = usb_control_msg_send(dev, 0, F81232_REGISTER_REQUEST,
+					      F81232_SET_REGISTER, reg, 0, val,
+					      size, USB_CTRL_SET_TIMEOUT, GFP_KERNEL);
+		if (status) {
+			/* Retry on error or short transfers */
 			status = usb_translate_errors(status);
 			if (status == -EIO)
 				continue;
-		} else if (status != size) {
-			/* Retry on short transfers */
-			status = -EIO;
-			continue;
-		} else {
-			status = 0;
 		}
 
 		break;
@@ -902,7 +851,6 @@ static int f81534a_ctrl_set_register(struct usb_interface *intf, u16 reg,
 				reg, status);
 	}
 
-	kfree(tmp);
 	return status;
 }
 
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
