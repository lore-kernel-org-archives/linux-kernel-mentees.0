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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E9F3C388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Nov 2020 06:47:50 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C393E2222B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Nov 2020 06:47:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JOAa2k//"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C393E2222B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 548F786B41;
	Wed,  4 Nov 2020 06:47:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2x6f0aKvWh1q; Wed,  4 Nov 2020 06:47:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 78E2C869E5;
	Wed,  4 Nov 2020 06:47:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 68FB9C088B;
	Wed,  4 Nov 2020 06:47:46 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ADB5EC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9CE078749A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:47:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6tlwyzWYi-VP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:47:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D0D738746C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:47:44 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id f38so15761283pgm.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Nov 2020 22:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=JQfRVw+JvA74WyL79cIHLhMk0a8vhCik+EDNpAkK11o=;
 b=JOAa2k//H2LnYBr6zCUXT3mo7GQRsBnXapbrGhnCmYWZ2QAeLaOWDCe7zYe2/WDPVe
 s0zpM8nolDsOeY593GLTZgIDjgPBYh/xA9wXOftzJ2oeMZyMC0acLVWSu59g8HEqwwDj
 VuU8mUyLGQFTwVwwec+hDOx88Aio5/PvW2DsQIf5w7vdtFxzQU032wIioNqtdX1DxwFq
 kPqvgq9ni0ZoAOo0VoNRFPrAkPNzI+QzqNSOVQEhD4u6oyliVuxoZuBImAgtW4nhM0vv
 nYREEePI1FuK20PZWJ8H3kyABTzTAjEu1FCliQZY2sRXeC3DsufEMsMEpbLvXmq9/FK3
 c3YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=JQfRVw+JvA74WyL79cIHLhMk0a8vhCik+EDNpAkK11o=;
 b=BBa1bF33TbJ/cxh3MoyhxwUcdNh+7TosaGO7bKjO/+PeA3hIjkDU4qdBGF6WXt003H
 CjEVHXWHvaw4/m6xC8SX/71F1L6l5vRUgLd4JtopEBuSbE97x7fXtE5DB1RJ2pjl1fBf
 D1fbiPzwctrulVWjyyi37uZlI+GVZVAUmrGOQlBNvr7EwhNKZ70heWNBjfsqyTmvwbGy
 bTy6Ibp/LjedHYjpe6w1t04QBLeO9hn+t4pt/NnpFOUop3GsFZlbvDgRN5bDbbWhB5gJ
 akMosvhfh/1u7934ujcxkBX/41xKbZvLcN11HcRZgXR2Dm3eb9a12Aq3jn3XBW/MDV5f
 2Ufg==
X-Gm-Message-State: AOAM532Qy+wlQvIL+WMMkZNZsgtyPQZpUz4keBzI95JkFA8IGnp0O7u7
 LeQvC1wGygFrhpBKLJbVGEg=
X-Google-Smtp-Source: ABdhPJyufrA29PcX5wXFdrhYrNw4mqJ16vQXCCFgpbRsiOI8kfTHHT7jyHUtfZ7BZz3bkgL4+deiFQ==
X-Received: by 2002:a63:ec57:: with SMTP id r23mr20660997pgj.257.1604472464508; 
 Tue, 03 Nov 2020 22:47:44 -0800 (PST)
Received: from localhost.localdomain
 ([2402:3a80:16e6:8166:e462:9fba:da9c:beed])
 by smtp.gmail.com with ESMTPSA id s18sm1036873pgh.60.2020.11.03.22.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 22:47:43 -0800 (PST)
From: Himadri Pandya <himadrispandya@gmail.com>
To: johan@kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed,  4 Nov 2020 12:16:52 +0530
Message-Id: <20201104064703.15123-5-himadrispandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201104064703.15123-1-himadrispandya@gmail.com>
References: <20201104064703.15123-1-himadrispandya@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 04/15] usb: serial: cp210x: use
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
 drivers/usb/serial/cp210x.c | 148 ++++++++++--------------------------
 1 file changed, 42 insertions(+), 106 deletions(-)

diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
index d0c05aa8a0d6..29436ab392e8 100644
--- a/drivers/usb/serial/cp210x.c
+++ b/drivers/usb/serial/cp210x.c
@@ -555,31 +555,15 @@ static int cp210x_read_reg_block(struct usb_serial_port *port, u8 req,
 {
 	struct usb_serial *serial = port->serial;
 	struct cp210x_port_private *port_priv = usb_get_serial_port_data(port);
-	void *dmabuf;
 	int result;
 
-	dmabuf = kmalloc(bufsize, GFP_KERNEL);
-	if (!dmabuf) {
-		/*
-		 * FIXME Some callers don't bother to check for error,
-		 * at least give them consistent junk until they are fixed
-		 */
-		memset(buf, 0, bufsize);
-		return -ENOMEM;
-	}
-
-	result = usb_control_msg(serial->dev, usb_rcvctrlpipe(serial->dev, 0),
-			req, REQTYPE_INTERFACE_TO_HOST, 0,
-			port_priv->bInterfaceNumber, dmabuf, bufsize,
-			USB_CTRL_SET_TIMEOUT);
-	if (result == bufsize) {
-		memcpy(buf, dmabuf, bufsize);
-		result = 0;
-	} else {
+	result = usb_control_msg_recv(serial->dev, 0, req,
+				      REQTYPE_INTERFACE_TO_HOST, 0,
+				      port_priv->bInterfaceNumber, buf, bufsize,
+				      USB_CTRL_SET_TIMEOUT, GFP_KERNEL);
+	if (result) {
 		dev_err(&port->dev, "failed get req 0x%x size %d status: %d\n",
-				req, bufsize, result);
-		if (result >= 0)
-			result = -EIO;
+			req, bufsize, result);
 
 		/*
 		 * FIXME Some callers don't bother to check for error,
@@ -588,8 +572,6 @@ static int cp210x_read_reg_block(struct usb_serial_port *port, u8 req,
 		memset(buf, 0, bufsize);
 	}
 
-	kfree(dmabuf);
-
 	return result;
 }
 
@@ -648,29 +630,16 @@ static int cp210x_read_u8_reg(struct usb_serial_port *port, u8 req, u8 *val)
 static int cp210x_read_vendor_block(struct usb_serial *serial, u8 type, u16 val,
 				    void *buf, int bufsize)
 {
-	void *dmabuf;
 	int result;
 
-	dmabuf = kmalloc(bufsize, GFP_KERNEL);
-	if (!dmabuf)
-		return -ENOMEM;
-
-	result = usb_control_msg(serial->dev, usb_rcvctrlpipe(serial->dev, 0),
-				 CP210X_VENDOR_SPECIFIC, type, val,
-				 cp210x_interface_num(serial), dmabuf, bufsize,
-				 USB_CTRL_GET_TIMEOUT);
-	if (result == bufsize) {
-		memcpy(buf, dmabuf, bufsize);
-		result = 0;
-	} else {
+	result = usb_control_msg_recv(serial->dev, 0, CP210X_VENDOR_SPECIFIC,
+				      type, val, cp210x_interface_num(serial),
+				      buf, bufsize, USB_CTRL_GET_TIMEOUT,
+				      GFP_KERNEL);
+	if (result)
 		dev_err(&serial->interface->dev,
 			"failed to get vendor val 0x%04x size %d: %d\n", val,
 			bufsize, result);
-		if (result >= 0)
-			result = -EIO;
-	}
-
-	kfree(dmabuf);
 
 	return result;
 }
@@ -685,14 +654,13 @@ static int cp210x_write_u16_reg(struct usb_serial_port *port, u8 req, u16 val)
 	struct cp210x_port_private *port_priv = usb_get_serial_port_data(port);
 	int result;
 
-	result = usb_control_msg(serial->dev, usb_sndctrlpipe(serial->dev, 0),
-			req, REQTYPE_HOST_TO_INTERFACE, val,
-			port_priv->bInterfaceNumber, NULL, 0,
-			USB_CTRL_SET_TIMEOUT);
-	if (result < 0) {
+	result = usb_control_msg_send(serial->dev, 0, req,
+				      REQTYPE_HOST_TO_INTERFACE, val,
+				      port_priv->bInterfaceNumber, NULL, 0,
+				      USB_CTRL_SET_TIMEOUT, GFP_KERNEL);
+	if (result)
 		dev_err(&port->dev, "failed set request 0x%x status: %d\n",
 				req, result);
-	}
 
 	return result;
 }
@@ -706,28 +674,17 @@ static int cp210x_write_reg_block(struct usb_serial_port *port, u8 req,
 {
 	struct usb_serial *serial = port->serial;
 	struct cp210x_port_private *port_priv = usb_get_serial_port_data(port);
-	void *dmabuf;
 	int result;
 
-	dmabuf = kmemdup(buf, bufsize, GFP_KERNEL);
-	if (!dmabuf)
-		return -ENOMEM;
+	result = usb_control_msg_send(serial->dev, 0, req,
+				      REQTYPE_HOST_TO_INTERFACE, 0,
+				      port_priv->bInterfaceNumber, buf, bufsize,
+				      USB_CTRL_SET_TIMEOUT, GFP_KERNEL);
 
-	result = usb_control_msg(serial->dev, usb_sndctrlpipe(serial->dev, 0),
-			req, REQTYPE_HOST_TO_INTERFACE, 0,
-			port_priv->bInterfaceNumber, dmabuf, bufsize,
-			USB_CTRL_SET_TIMEOUT);
 
-	kfree(dmabuf);
-
-	if (result == bufsize) {
-		result = 0;
-	} else {
+	if (result)
 		dev_err(&port->dev, "failed set req 0x%x size %d status: %d\n",
 				req, bufsize, result);
-		if (result >= 0)
-			result = -EIO;
-	}
 
 	return result;
 }
@@ -752,29 +709,17 @@ static int cp210x_write_u32_reg(struct usb_serial_port *port, u8 req, u32 val)
 static int cp210x_write_vendor_block(struct usb_serial *serial, u8 type,
 				     u16 val, void *buf, int bufsize)
 {
-	void *dmabuf;
 	int result;
 
-	dmabuf = kmemdup(buf, bufsize, GFP_KERNEL);
-	if (!dmabuf)
-		return -ENOMEM;
-
-	result = usb_control_msg(serial->dev, usb_sndctrlpipe(serial->dev, 0),
-				 CP210X_VENDOR_SPECIFIC, type, val,
-				 cp210x_interface_num(serial), dmabuf, bufsize,
-				 USB_CTRL_SET_TIMEOUT);
-
-	kfree(dmabuf);
+	result = usb_control_msg_send(serial->dev, 0, CP210X_VENDOR_SPECIFIC,
+				      type, val, cp210x_interface_num(serial),
+				      buf, bufsize, USB_CTRL_SET_TIMEOUT,
+				      GFP_KERNEL);
 
-	if (result == bufsize) {
-		result = 0;
-	} else {
+	if (result)
 		dev_err(&serial->interface->dev,
 			"failed to set vendor val 0x%04x size %d: %d\n", val,
 			bufsize, result);
-		if (result >= 0)
-			result = -EIO;
-	}
 
 	return result;
 }
@@ -995,27 +940,19 @@ static int cp210x_get_tx_queue_byte_count(struct usb_serial_port *port,
 {
 	struct usb_serial *serial = port->serial;
 	struct cp210x_port_private *port_priv = usb_get_serial_port_data(port);
-	struct cp210x_comm_status *sts;
+	struct cp210x_comm_status sts;
 	int result;
 
-	sts = kmalloc(sizeof(*sts), GFP_KERNEL);
-	if (!sts)
-		return -ENOMEM;
-
-	result = usb_control_msg(serial->dev, usb_rcvctrlpipe(serial->dev, 0),
-			CP210X_GET_COMM_STATUS, REQTYPE_INTERFACE_TO_HOST,
-			0, port_priv->bInterfaceNumber, sts, sizeof(*sts),
-			USB_CTRL_GET_TIMEOUT);
-	if (result == sizeof(*sts)) {
-		*count = le32_to_cpu(sts->ulAmountInOutQueue);
-		result = 0;
-	} else {
+	result = usb_control_msg_recv(serial->dev, 0,
+				      CP210X_GET_COMM_STATUS,
+				      REQTYPE_INTERFACE_TO_HOST, 0,
+				      port_priv->bInterfaceNumber, &sts,
+				      sizeof(sts), USB_CTRL_GET_TIMEOUT,
+				      GFP_KERNEL);
+	if (result == 0)
+		*count = le32_to_cpu(sts.ulAmountInOutQueue);
+	else
 		dev_err(&port->dev, "failed to get comm status: %d\n", result);
-		if (result >= 0)
-			result = -EIO;
-	}
-
-	kfree(sts);
 
 	return result;
 }
@@ -1624,13 +1561,12 @@ static void cp210x_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
 	} else {
 		u16 wIndex = buf.state << 8 | buf.mask;
 
-		result = usb_control_msg(serial->dev,
-					 usb_sndctrlpipe(serial->dev, 0),
-					 CP210X_VENDOR_SPECIFIC,
-					 REQTYPE_HOST_TO_DEVICE,
-					 CP210X_WRITE_LATCH,
-					 wIndex,
-					 NULL, 0, USB_CTRL_SET_TIMEOUT);
+		result = usb_control_msg_send(serial->dev, 0,
+					      CP210X_VENDOR_SPECIFIC,
+					      REQTYPE_HOST_TO_DEVICE,
+					      CP210X_WRITE_LATCH,
+					      wIndex, NULL, 0,
+					      USB_CTRL_SET_TIMEOUT, GFP_KERNEL);
 	}
 
 	usb_autopm_put_interface(serial->interface);
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
