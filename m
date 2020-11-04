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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C521C388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Nov 2020 06:48:27 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 134362222B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Nov 2020 06:48:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iDOmSv+7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 134362222B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 98DD02284F;
	Wed,  4 Nov 2020 06:48:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IhX3YE-PHJoP; Wed,  4 Nov 2020 06:48:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3359F2155B;
	Wed,  4 Nov 2020 06:48:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2FD99C088B;
	Wed,  4 Nov 2020 06:48:25 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5C17FC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4B00386B43
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:48:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aCDbMR1nZENA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:48:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6C713868D4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:48:23 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id o129so16514462pfb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Nov 2020 22:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=KB7CZf3CU86Z0He3UNjFkiBM0LUE2H0157Uy00zeVnM=;
 b=iDOmSv+7rnBajXf+cgmft9pCQRr9KEydAxoL7P7WFn9jTTjy8yotjsRt8yRcI0fP+T
 nrbtCWwMxIW04SbdFr0mlOVMSI9IasE3xah8/XxIY7efTVIz5IrZt3sphQ56WpfoV6hG
 FS3vbjAzq4y7Bd0XsUqj8rZS/FvfazwHUccVApgtsqAZPQ56kkfA4FO45aKuvjYAyfU/
 11MZFLdps7sowj0mG+/EJQR+oOOkljGyawOkNqhwyP1McQHsP9pW/3dhN5gvp7AcI0aX
 MUjuqRcIbKAOxnexRylpMPuQoTYBfWSM3Fpf2sf0rYbL096Fygr9rlkkBHpXBnJIAjdl
 8M8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=KB7CZf3CU86Z0He3UNjFkiBM0LUE2H0157Uy00zeVnM=;
 b=qPqVOP8edKd+8gtVsNJLEixYiqQ8sFdYeMvnP1AZ5+MVpt6XX1E0cuO95irknCXsmP
 3mTzpFTb46KlaEG3tSo14RyRlQfu1TcAM8CKj268gC2NO0N7uz5rLFOdpUw4H2qLFe8W
 8ENSqdxFzMNGXFJByR64rme++8XxzTHJXgRvfgiTS9jeiLIg2th0WxpkCoezcD6EtfUF
 RfKWKvGdfDRxcGobfPsFctyx8935e3bBGPVH0WYCdThKQTDB3vQqvcTmOtvXx/QL3IU9
 werBtr2dqNSLO/09EP+IMCEfg5brATTcza3w7qO/N8D1d3KBcMTURB8PggskZR74V60F
 hbKg==
X-Gm-Message-State: AOAM5316812D+6d2EJS0mdK90d6F3HgW0Lg0Zy6T5Qh9iyIgzN+n2Uwn
 dVWcqo3oahr3vW+Lf/LRZbg=
X-Google-Smtp-Source: ABdhPJxs0MkrmUYxezpuHa4boCFPRLOvuB9Nud9oWd6sw5dUNBePOgrl+hKFsnFyKeXvFpEe4oYnbA==
X-Received: by 2002:a17:90a:df0d:: with SMTP id
 gp13mr3045148pjb.92.1604472503048; 
 Tue, 03 Nov 2020 22:48:23 -0800 (PST)
Received: from localhost.localdomain
 ([2402:3a80:16e6:8166:e462:9fba:da9c:beed])
 by smtp.gmail.com with ESMTPSA id s18sm1036873pgh.60.2020.11.03.22.48.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 22:48:22 -0800 (PST)
From: Himadri Pandya <himadrispandya@gmail.com>
To: johan@kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed,  4 Nov 2020 12:17:02 +0530
Message-Id: <20201104064703.15123-15-himadrispandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201104064703.15123-1-himadrispandya@gmail.com>
References: <20201104064703.15123-1-himadrispandya@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 14/15] usb: serial: keyspan_pda: use
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
 drivers/usb/serial/keyspan_pda.c | 172 +++++++++++++------------------
 1 file changed, 72 insertions(+), 100 deletions(-)

diff --git a/drivers/usb/serial/keyspan_pda.c b/drivers/usb/serial/keyspan_pda.c
index c1333919716b..44e1c4490fa9 100644
--- a/drivers/usb/serial/keyspan_pda.c
+++ b/drivers/usb/serial/keyspan_pda.c
@@ -115,17 +115,17 @@ static void keyspan_pda_request_unthrottle(struct work_struct *work)
 
 	/* ask the device to tell us when the tx buffer becomes
 	   sufficiently empty */
-	result = usb_control_msg(serial->dev,
-				 usb_sndctrlpipe(serial->dev, 0),
-				 7, /* request_unthrottle */
-				 USB_TYPE_VENDOR | USB_RECIP_INTERFACE
-				 | USB_DIR_OUT,
-				 16, /* value: threshold */
-				 0, /* index */
-				 NULL,
-				 0,
-				 2000);
-	if (result < 0)
+	result = usb_control_msg_send(serial->dev, 0,
+				      7, /* request_unthrottle */
+				      USB_TYPE_VENDOR | USB_RECIP_INTERFACE
+				      | USB_DIR_OUT,
+				      16, /* value: threshold */
+				      0, /* index */
+				      NULL,
+				      0,
+				      2000,
+				      GFP_KERNEL);
+	if (result)
 		dev_dbg(&serial->dev->dev, "%s - error %d from usb_control_msg\n",
 			__func__, result);
 }
@@ -269,17 +269,18 @@ static speed_t keyspan_pda_setbaud(struct usb_serial *serial, speed_t baud)
 
 	/* rather than figure out how to sleep while waiting for this
 	   to complete, I just use the "legacy" API. */
-	rc = usb_control_msg(serial->dev, usb_sndctrlpipe(serial->dev, 0),
-			     0, /* set baud */
-			     USB_TYPE_VENDOR
-			     | USB_RECIP_INTERFACE
-			     | USB_DIR_OUT, /* type */
-			     bindex, /* value */
-			     0, /* index */
-			     NULL, /* &data */
-			     0, /* size */
-			     2000); /* timeout */
-	if (rc < 0)
+	rc = usb_control_msg_send(serial->dev, 0,
+				  0, /* set baud */
+				  USB_TYPE_VENDOR
+				  | USB_RECIP_INTERFACE
+				  | USB_DIR_OUT, /* type */
+				  bindex, /* value */
+				  0, /* index */
+				  NULL, /* &data */
+				  0, /* size */
+				  2000, /* timeout */
+				  GFP_KERNEL);
+	if (rc)
 		return 0;
 	return baud;
 }
@@ -296,11 +297,12 @@ static void keyspan_pda_break_ctl(struct tty_struct *tty, int break_state)
 		value = 1; /* start break */
 	else
 		value = 0; /* clear break */
-	result = usb_control_msg(serial->dev, usb_sndctrlpipe(serial->dev, 0),
-			4, /* set break */
-			USB_TYPE_VENDOR | USB_RECIP_INTERFACE | USB_DIR_OUT,
-			value, 0, NULL, 0, 2000);
-	if (result < 0)
+	result = usb_control_msg_send(serial->dev, 0,
+				      4, /* set break */
+				      USB_TYPE_VENDOR | USB_RECIP_INTERFACE |
+				      USB_DIR_OUT,
+				      value, 0, NULL, 0, 2000, GFP_KERNEL);
+	if (result)
 		dev_dbg(&port->dev, "%s - error %d from usb_control_msg\n",
 			__func__, result);
 	/* there is something funky about this.. the TCSBRK that 'cu' performs
@@ -359,22 +361,11 @@ static int keyspan_pda_get_modem_info(struct usb_serial *serial,
 				      unsigned char *value)
 {
 	int rc;
-	u8 *data;
-
-	data = kmalloc(1, GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
-
-	rc = usb_control_msg(serial->dev, usb_rcvctrlpipe(serial->dev, 0),
-			     3, /* get pins */
-			     USB_TYPE_VENDOR|USB_RECIP_INTERFACE|USB_DIR_IN,
-			     0, 0, data, 1, 2000);
-	if (rc == 1)
-		*value = *data;
-	else if (rc >= 0)
-		rc = -EIO;
-
-	kfree(data);
+	rc = usb_control_msg_recv(serial->dev, 0,
+				  3, /* get pins */
+				  USB_TYPE_VENDOR | USB_RECIP_INTERFACE |
+				  USB_DIR_IN, 0, 0, value, 1, 2000,
+				  GFP_KERNEL);
 	return rc;
 }
 
@@ -383,10 +374,11 @@ static int keyspan_pda_set_modem_info(struct usb_serial *serial,
 				      unsigned char value)
 {
 	int rc;
-	rc = usb_control_msg(serial->dev, usb_sndctrlpipe(serial->dev, 0),
-			     3, /* set pins */
-			     USB_TYPE_VENDOR|USB_RECIP_INTERFACE|USB_DIR_OUT,
-			     value, 0, NULL, 0, 2000);
+	rc = usb_control_msg_send(serial->dev, 0,
+				  3, /* set pins */
+				  USB_TYPE_VENDOR | USB_RECIP_INTERFACE |
+				  USB_DIR_OUT, value, 0, NULL, 0, 2000,
+				  GFP_KERNEL);
 	return rc;
 }
 
@@ -481,36 +473,25 @@ static int keyspan_pda_write(struct tty_struct *tty,
 	   device how much room it really has.  This is done only on
 	   scheduler time, since usb_control_msg() sleeps. */
 	if (count > priv->tx_room && !in_interrupt()) {
-		u8 *room;
-
-		room = kmalloc(1, GFP_KERNEL);
-		if (!room) {
-			rc = -ENOMEM;
-			goto exit;
+		u8 room;
+
+		rc = usb_control_msg_recv(serial->dev, 0,
+					  6, /* write_room */
+					  USB_TYPE_VENDOR | USB_RECIP_INTERFACE
+					  | USB_DIR_IN,
+					  0, /* value: 0 means "remaining room" */
+					  0, /* index */
+					  &room,
+					  1,
+					  2000,
+					  GFP_KERNEL);
+		if (rc == 0) {
+			dev_dbg(&port->dev, "roomquery says %d\n", room);
+			priv->tx_room = room;
 		}
 
-		rc = usb_control_msg(serial->dev,
-				     usb_rcvctrlpipe(serial->dev, 0),
-				     6, /* write_room */
-				     USB_TYPE_VENDOR | USB_RECIP_INTERFACE
-				     | USB_DIR_IN,
-				     0, /* value: 0 means "remaining room" */
-				     0, /* index */
-				     room,
-				     1,
-				     2000);
-		if (rc > 0) {
-			dev_dbg(&port->dev, "roomquery says %d\n", *room);
-			priv->tx_room = *room;
-		}
-		kfree(room);
-		if (rc < 0) {
-			dev_dbg(&port->dev, "roomquery failed\n");
-			goto exit;
-		}
-		if (rc == 0) {
-			dev_dbg(&port->dev, "roomquery returned 0 bytes\n");
-			rc = -EIO; /* device didn't return any data */
+		if (rc) {
+			dev_dbg(&port->dev, "roomquery failed %d\n", rc);
 			goto exit;
 		}
 	}
@@ -613,36 +594,28 @@ static int keyspan_pda_open(struct tty_struct *tty,
 					struct usb_serial_port *port)
 {
 	struct usb_serial *serial = port->serial;
-	u8 *room;
+	u8 room;
 	int rc = 0;
 	struct keyspan_pda_private *priv;
 
-	/* find out how much room is in the Tx ring */
-	room = kmalloc(1, GFP_KERNEL);
-	if (!room)
-		return -ENOMEM;
-
-	rc = usb_control_msg(serial->dev, usb_rcvctrlpipe(serial->dev, 0),
-			     6, /* write_room */
-			     USB_TYPE_VENDOR | USB_RECIP_INTERFACE
-			     | USB_DIR_IN,
-			     0, /* value */
-			     0, /* index */
-			     room,
-			     1,
-			     2000);
-	if (rc < 0) {
-		dev_dbg(&port->dev, "%s - roomquery failed\n", __func__);
-		goto error;
-	}
-	if (rc == 0) {
-		dev_dbg(&port->dev, "%s - roomquery returned 0 bytes\n", __func__);
-		rc = -EIO;
+	rc = usb_control_msg_recv(serial->dev, 0,
+				  6, /* write_room */
+				  USB_TYPE_VENDOR | USB_RECIP_INTERFACE |
+				  USB_DIR_IN,
+				  0, /* value */
+				  0, /* index */
+				  &room,
+				  1,
+				  2000,
+				  GFP_KERNEL);
+	if (rc) {
+		dev_dbg(&port->dev, "%s - roomquery failed %d\n", __func__, rc);
 		goto error;
 	}
+
 	priv = usb_get_serial_port_data(port);
-	priv->tx_room = *room;
-	priv->tx_throttled = *room ? 0 : 1;
+	priv->tx_room = room;
+	priv->tx_throttled = room ? 0 : 1;
 
 	/*Start reading from the device*/
 	rc = usb_submit_urb(port->interrupt_in_urb, GFP_KERNEL);
@@ -651,7 +624,6 @@ static int keyspan_pda_open(struct tty_struct *tty,
 		goto error;
 	}
 error:
-	kfree(room);
 	return rc;
 }
 static void keyspan_pda_close(struct usb_serial_port *port)
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
