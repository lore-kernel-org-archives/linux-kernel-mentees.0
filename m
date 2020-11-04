Return-Path: <SRS0=I1jd=EK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 217F0C388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Nov 2020 06:48:05 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A058A2222B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Nov 2020 06:48:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MYE0aP2s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A058A2222B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 05AAB8615E;
	Wed,  4 Nov 2020 06:48:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 72Gn1fYuNB00; Wed,  4 Nov 2020 06:48:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CAB5B8614A;
	Wed,  4 Nov 2020 06:48:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B9FEEC088B;
	Wed,  4 Nov 2020 06:48:02 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AA9DDC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:48:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9946D220C1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:48:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CzuAh9-+xnsn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:48:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 517E52155B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:48:00 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id r186so15771715pgr.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Nov 2020 22:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dpWiQNpplpqqXHZdrnmhkGJL1ecVpKlvWB6beWz5Buc=;
 b=MYE0aP2sTJ28zHydRlEZpqrjSq0Ni8YgJJcdXzKs6AtEoJiQPXeJYtidrVhHQFJGgq
 Et08mk2FJgezufH4+f2VACRRq3eKJD1J1e3RluUuUGYJr+5jGegsig0SXTZpis6CWzX0
 YzAkaPdmL21C96QDOFFCJXClajtC36ifWWpSet9CJIFA951Bv7CYpE1zBkXvLk1fhK5b
 uh5nQHsGzlWW6ToVv/bErPFFDUGRaaJEktup8ID8TVHgQe5L3qdYBjGbeoV57/ckjtu5
 2A8658/P3R8kVOgqtPHE9DgJBQATqr1TIHGl4g+EbB3B5+205Aurj17ADH0n31Pz69SU
 w5XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dpWiQNpplpqqXHZdrnmhkGJL1ecVpKlvWB6beWz5Buc=;
 b=PyDCu75+7RAi9YfSTIB+DpZmwIzLuHTV+6NMz74J/PSwhjljGvgDmKGJg03J4n3Z7w
 rsQaBoWJvIdB8D30/FhLpFP4ommc3p+d8qRXxszSvyYGROKA3g/yKltmxgey2uqw3Ofx
 zig7cNPdDp3PORD8IAkTxHBKre93lHGeItVh1ise1fesZaheB7w42z6OO0sYB3QEvz04
 dciPkmedViPtnis9zP7XSzBi48a1uCaJXZ+hecYkZhRp+lKz9dG1h/bT1WzvRR5eiQTN
 eh78dKp/zO5CJo8sYwQdP92tV6n1w2tqQuzOGmIDRM++oHKoMhMJjuXGctzyvBsl2n6o
 wLWA==
X-Gm-Message-State: AOAM5328e0tK0VmpqReh4x9ykfRXB/Xk53Y1Cr07oBKBFJaBMCBI906x
 yIxwmOicoPaGxoQDgSZj0mo=
X-Google-Smtp-Source: ABdhPJw0JU8dTd5DFfKgoSD0DK+rO+h/ugVmblHCRx0FgcpjSvB7Yg3dLqGfeFFqMKtKs8IGjzrz3w==
X-Received: by 2002:a63:b10:: with SMTP id 16mr1119840pgl.309.1604472479959;
 Tue, 03 Nov 2020 22:47:59 -0800 (PST)
Received: from localhost.localdomain
 ([2402:3a80:16e6:8166:e462:9fba:da9c:beed])
 by smtp.gmail.com with ESMTPSA id s18sm1036873pgh.60.2020.11.03.22.47.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 22:47:59 -0800 (PST)
From: Himadri Pandya <himadrispandya@gmail.com>
To: johan@kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed,  4 Nov 2020 12:16:56 +0530
Message-Id: <20201104064703.15123-9-himadrispandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201104064703.15123-1-himadrispandya@gmail.com>
References: <20201104064703.15123-1-himadrispandya@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 08/15] usb: serial: ftdi_sio: use
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
 drivers/usb/serial/ftdi_sio.c | 182 +++++++++++++++-------------------
 1 file changed, 78 insertions(+), 104 deletions(-)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index e0f4c3d9649c..37e9e75b90d0 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -1245,13 +1245,12 @@ static int update_mctrl(struct usb_serial_port *port, unsigned int set,
 		value |= FTDI_SIO_SET_DTR_HIGH;
 	if (set & TIOCM_RTS)
 		value |= FTDI_SIO_SET_RTS_HIGH;
-	rv = usb_control_msg(port->serial->dev,
-			       usb_sndctrlpipe(port->serial->dev, 0),
-			       FTDI_SIO_SET_MODEM_CTRL_REQUEST,
-			       FTDI_SIO_SET_MODEM_CTRL_REQUEST_TYPE,
-			       value, priv->interface,
-			       NULL, 0, WDR_TIMEOUT);
-	if (rv < 0) {
+	rv = usb_control_msg_send(port->serial->dev, 0,
+				  FTDI_SIO_SET_MODEM_CTRL_REQUEST,
+				  FTDI_SIO_SET_MODEM_CTRL_REQUEST_TYPE,
+				  value, priv->interface,
+				  NULL, 0, WDR_TIMEOUT, GFP_KERNEL);
+	if (rv) {
 		dev_dbg(dev, "%s Error from MODEM_CTRL urb: DTR %s, RTS %s\n",
 			__func__,
 			(set & TIOCM_DTR) ? "HIGH" : (clear & TIOCM_DTR) ? "LOW" : "unchanged",
@@ -1393,12 +1392,11 @@ static int change_speed(struct tty_struct *tty, struct usb_serial_port *port)
 		index = (u16)((index << 8) | priv->interface);
 	}
 
-	rv = usb_control_msg(port->serial->dev,
-			    usb_sndctrlpipe(port->serial->dev, 0),
-			    FTDI_SIO_SET_BAUDRATE_REQUEST,
-			    FTDI_SIO_SET_BAUDRATE_REQUEST_TYPE,
-			    value, index,
-			    NULL, 0, WDR_SHORT_TIMEOUT);
+	rv = usb_control_msg_send(port->serial->dev, 0,
+				  FTDI_SIO_SET_BAUDRATE_REQUEST,
+				  FTDI_SIO_SET_BAUDRATE_REQUEST_TYPE,
+				  value, index,
+				  NULL, 0, WDR_SHORT_TIMEOUT, GFP_KERNEL);
 	return rv;
 }
 
@@ -1417,13 +1415,12 @@ static int write_latency_timer(struct usb_serial_port *port)
 
 	dev_dbg(&port->dev, "%s: setting latency timer = %i\n", __func__, l);
 
-	rv = usb_control_msg(udev,
-			     usb_sndctrlpipe(udev, 0),
-			     FTDI_SIO_SET_LATENCY_TIMER_REQUEST,
-			     FTDI_SIO_SET_LATENCY_TIMER_REQUEST_TYPE,
-			     l, priv->interface,
-			     NULL, 0, WDR_TIMEOUT);
-	if (rv < 0)
+	rv = usb_control_msg_send(udev, 0,
+				  FTDI_SIO_SET_LATENCY_TIMER_REQUEST,
+				  FTDI_SIO_SET_LATENCY_TIMER_REQUEST_TYPE,
+				  l, priv->interface,
+				  NULL, 0, WDR_TIMEOUT, GFP_KERNEL);
+	if (rv)
 		dev_err(&port->dev, "Unable to write latency timer: %i\n", rv);
 	return rv;
 }
@@ -1432,27 +1429,16 @@ static int _read_latency_timer(struct usb_serial_port *port)
 {
 	struct ftdi_private *priv = usb_get_serial_port_data(port);
 	struct usb_device *udev = port->serial->dev;
-	unsigned char *buf;
+	u8 buf;
 	int rv;
 
-	buf = kmalloc(1, GFP_KERNEL);
-	if (!buf)
-		return -ENOMEM;
-
-	rv = usb_control_msg(udev,
-			     usb_rcvctrlpipe(udev, 0),
-			     FTDI_SIO_GET_LATENCY_TIMER_REQUEST,
-			     FTDI_SIO_GET_LATENCY_TIMER_REQUEST_TYPE,
-			     0, priv->interface,
-			     buf, 1, WDR_TIMEOUT);
-	if (rv < 1) {
-		if (rv >= 0)
-			rv = -EIO;
-	} else {
-		rv = buf[0];
-	}
-
-	kfree(buf);
+	rv = usb_control_msg_recv(udev, 0,
+				  FTDI_SIO_GET_LATENCY_TIMER_REQUEST,
+				  FTDI_SIO_GET_LATENCY_TIMER_REQUEST_TYPE,
+				  0, priv->interface,
+				  &buf, 1, WDR_TIMEOUT, GFP_KERNEL);
+	if (rv == 0)
+		rv = buf;
 
 	return rv;
 }
@@ -1731,13 +1717,12 @@ static ssize_t event_char_store(struct device *dev,
 
 	dev_dbg(&port->dev, "%s: setting event char = 0x%03x\n", __func__, v);
 
-	rv = usb_control_msg(udev,
-			     usb_sndctrlpipe(udev, 0),
-			     FTDI_SIO_SET_EVENT_CHAR_REQUEST,
-			     FTDI_SIO_SET_EVENT_CHAR_REQUEST_TYPE,
-			     v, priv->interface,
-			     NULL, 0, WDR_TIMEOUT);
-	if (rv < 0) {
+	rv = usb_control_msg_send(udev, 0,
+				  FTDI_SIO_SET_EVENT_CHAR_REQUEST,
+				  FTDI_SIO_SET_EVENT_CHAR_REQUEST_TYPE,
+				  v, priv->interface,
+				  NULL, 0, WDR_TIMEOUT, GFP_KERNEL);
+	if (rv) {
 		dev_dbg(&port->dev, "Unable to write event character: %i\n", rv);
 		return -EIO;
 	}
@@ -1805,12 +1790,12 @@ static int ftdi_set_bitmode(struct usb_serial_port *port, u8 mode)
 		return result;
 
 	val = (mode << 8) | (priv->gpio_output << 4) | priv->gpio_value;
-	result = usb_control_msg(serial->dev,
-				 usb_sndctrlpipe(serial->dev, 0),
-				 FTDI_SIO_SET_BITMODE_REQUEST,
-				 FTDI_SIO_SET_BITMODE_REQUEST_TYPE, val,
-				 priv->interface, NULL, 0, WDR_TIMEOUT);
-	if (result < 0) {
+	result = usb_control_msg_send(serial->dev, 0,
+				      FTDI_SIO_SET_BITMODE_REQUEST,
+				      FTDI_SIO_SET_BITMODE_REQUEST_TYPE, val,
+				      priv->interface, NULL, 0, WDR_TIMEOUT,
+				      GFP_KERNEL);
+	if (result) {
 		dev_err(&serial->interface->dev,
 			"bitmode request failed for value 0x%04x: %d\n",
 			val, result);
@@ -1866,32 +1851,21 @@ static int ftdi_read_cbus_pins(struct usb_serial_port *port)
 {
 	struct ftdi_private *priv = usb_get_serial_port_data(port);
 	struct usb_serial *serial = port->serial;
-	unsigned char *buf;
+	u8 buf;
 	int result;
 
 	result = usb_autopm_get_interface(serial->interface);
 	if (result)
 		return result;
 
-	buf = kmalloc(1, GFP_KERNEL);
-	if (!buf) {
-		usb_autopm_put_interface(serial->interface);
-		return -ENOMEM;
-	}
-
-	result = usb_control_msg(serial->dev,
-				 usb_rcvctrlpipe(serial->dev, 0),
-				 FTDI_SIO_READ_PINS_REQUEST,
-				 FTDI_SIO_READ_PINS_REQUEST_TYPE, 0,
-				 priv->interface, buf, 1, WDR_TIMEOUT);
-	if (result < 1) {
-		if (result >= 0)
-			result = -EIO;
-	} else {
-		result = buf[0];
-	}
+	result = usb_control_msg_recv(serial->dev, 0,
+				      FTDI_SIO_READ_PINS_REQUEST,
+				      FTDI_SIO_READ_PINS_REQUEST_TYPE, 0,
+				      priv->interface, &buf, 1, WDR_TIMEOUT,
+				      GFP_KERNEL);
+	if (result == 0)
+		result = buf;
 
-	kfree(buf);
 	usb_autopm_put_interface(serial->interface);
 
 	return result;
@@ -2311,6 +2285,7 @@ static int ftdi_NDI_device_setup(struct usb_serial *serial)
 {
 	struct usb_device *udev = serial->dev;
 	int latency = ndi_latency_timer;
+	int ret;
 
 	if (latency == 0)
 		latency = 1;
@@ -2320,12 +2295,12 @@ static int ftdi_NDI_device_setup(struct usb_serial *serial)
 	dev_dbg(&udev->dev, "%s setting NDI device latency to %d\n", __func__, latency);
 	dev_info(&udev->dev, "NDI device with a latency value of %d\n", latency);
 
-	/* FIXME: errors are not returned */
-	usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
-				FTDI_SIO_SET_LATENCY_TIMER_REQUEST,
-				FTDI_SIO_SET_LATENCY_TIMER_REQUEST_TYPE,
-				latency, 0, NULL, 0, WDR_TIMEOUT);
-	return 0;
+	ret = usb_control_msg_send(udev, 0,
+				   FTDI_SIO_SET_LATENCY_TIMER_REQUEST,
+				   FTDI_SIO_SET_LATENCY_TIMER_REQUEST_TYPE,
+				   latency, 0, NULL, 0, WDR_TIMEOUT,
+				   GFP_KERNEL);
+	return ret;
 }
 
 /*
@@ -2424,12 +2399,11 @@ static void ftdi_dtr_rts(struct usb_serial_port *port, int on)
 
 	/* Disable flow control */
 	if (!on) {
-		if (usb_control_msg(port->serial->dev,
-			    usb_sndctrlpipe(port->serial->dev, 0),
-			    FTDI_SIO_SET_FLOW_CTRL_REQUEST,
-			    FTDI_SIO_SET_FLOW_CTRL_REQUEST_TYPE,
-			    0, priv->interface, NULL, 0,
-			    WDR_TIMEOUT) < 0) {
+		if (usb_control_msg_send(port->serial->dev, 0,
+					 FTDI_SIO_SET_FLOW_CTRL_REQUEST,
+					 FTDI_SIO_SET_FLOW_CTRL_REQUEST_TYPE,
+					 0, priv->interface, NULL, 0,
+					 WDR_TIMEOUT, GFP_KERNEL)) {
 			dev_err(&port->dev, "error from flowcontrol urb\n");
 		}
 	}
@@ -2617,12 +2591,11 @@ static void ftdi_break_ctl(struct tty_struct *tty, int break_state)
 	else
 		value = priv->last_set_data_value;
 
-	if (usb_control_msg(port->serial->dev,
-			usb_sndctrlpipe(port->serial->dev, 0),
-			FTDI_SIO_SET_DATA_REQUEST,
-			FTDI_SIO_SET_DATA_REQUEST_TYPE,
-			value , priv->interface,
-			NULL, 0, WDR_TIMEOUT) < 0) {
+	if (usb_control_msg_send(port->serial->dev, 0,
+				 FTDI_SIO_SET_DATA_REQUEST,
+				 FTDI_SIO_SET_DATA_REQUEST_TYPE,
+				 value, priv->interface,
+				 NULL, 0, WDR_TIMEOUT, GFP_KERNEL)) {
 		dev_err(&port->dev, "%s FAILED to enable/disable break state (state was %d)\n",
 			__func__, break_state);
 	}
@@ -2754,11 +2727,11 @@ static void ftdi_set_termios(struct tty_struct *tty,
 	   - but is or'ed with this value  */
 	priv->last_set_data_value = value;
 
-	if (usb_control_msg(dev, usb_sndctrlpipe(dev, 0),
-			    FTDI_SIO_SET_DATA_REQUEST,
-			    FTDI_SIO_SET_DATA_REQUEST_TYPE,
-			    value , priv->interface,
-			    NULL, 0, WDR_SHORT_TIMEOUT) < 0) {
+	if (usb_control_msg_send(dev, 0,
+				 FTDI_SIO_SET_DATA_REQUEST,
+				 FTDI_SIO_SET_DATA_REQUEST_TYPE,
+				 value, priv->interface,
+				 NULL, 0, WDR_SHORT_TIMEOUT, GFP_KERNEL)) {
 		dev_err(ddev, "%s FAILED to set databits/stopbits/parity\n",
 			__func__);
 	}
@@ -2767,11 +2740,11 @@ static void ftdi_set_termios(struct tty_struct *tty,
 no_data_parity_stop_changes:
 	if ((cflag & CBAUD) == B0) {
 		/* Disable flow control */
-		if (usb_control_msg(dev, usb_sndctrlpipe(dev, 0),
-				    FTDI_SIO_SET_FLOW_CTRL_REQUEST,
-				    FTDI_SIO_SET_FLOW_CTRL_REQUEST_TYPE,
-				    0, priv->interface,
-				    NULL, 0, WDR_TIMEOUT) < 0) {
+		if (usb_control_msg_send(dev, 0,
+					 FTDI_SIO_SET_FLOW_CTRL_REQUEST,
+					 FTDI_SIO_SET_FLOW_CTRL_REQUEST_TYPE,
+					 0, priv->interface,
+					 NULL, 0, WDR_TIMEOUT, GFP_KERNEL)) {
 			dev_err(ddev, "%s error from disable flowcontrol urb\n",
 				__func__);
 		}
@@ -2806,11 +2779,12 @@ static void ftdi_set_termios(struct tty_struct *tty,
 
 	index |= priv->interface;
 
-	ret = usb_control_msg(dev, usb_sndctrlpipe(dev, 0),
-			FTDI_SIO_SET_FLOW_CTRL_REQUEST,
-			FTDI_SIO_SET_FLOW_CTRL_REQUEST_TYPE,
-			value, index, NULL, 0, WDR_TIMEOUT);
-	if (ret < 0)
+	ret = usb_control_msg_send(dev, 0,
+				   FTDI_SIO_SET_FLOW_CTRL_REQUEST,
+				   FTDI_SIO_SET_FLOW_CTRL_REQUEST_TYPE,
+				   value, index, NULL, 0, WDR_TIMEOUT,
+				   GFP_KERNEL);
+	if (ret)
 		dev_err(&port->dev, "failed to set flow control: %d\n", ret);
 }
 
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
