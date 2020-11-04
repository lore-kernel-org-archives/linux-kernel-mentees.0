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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C99CEC2D0A3
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Nov 2020 06:47:40 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4262D2222B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Nov 2020 06:47:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="It3dft3O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4262D2222B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B3066861FF;
	Wed,  4 Nov 2020 06:47:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mJcVRvWJo6e2; Wed,  4 Nov 2020 06:47:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3985F8610F;
	Wed,  4 Nov 2020 06:47:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3653BC088B;
	Wed,  4 Nov 2020 06:47:39 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C07C0C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id BBBCC20532
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:47:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lgnZ6A6V+zaT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:47:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 7A63020404
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:47:37 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id o129so16512993pfb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Nov 2020 22:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vnMYTYPWpL/m30915j5zLtve0vatdenqyPp6S7vmLgE=;
 b=It3dft3OWinLT6cIhmfl1Xv4H4P0etg2tdyYAgpuFPVb5m0GvsMP7aDS00s3nNcknq
 gPPq0cHV/5+JvxAyR5IoozAo8INdiK+/U1PS0GcwX37ZNTZzD9kWbc2/bLlEGj+A0pBf
 YKDvw7/YoUAq/iisroJq59zIUmq+Gk3FwnTAbRngVlxh+VR0H3UFiR6TG8JlnbAehl4Q
 8QGM81Uvs5cdtzaVAuR+3jBxCtCMwIAjVQSSw+DcLwsw5F0UmX20kYTRM3nRkHDsy4Fv
 D9qXpd5SkiCWtFlcckNq1Yt+Ned9A8E4QMvOjgQ34Y1zl63ROHxvtiNoU7mDH1XjCkCy
 HJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=vnMYTYPWpL/m30915j5zLtve0vatdenqyPp6S7vmLgE=;
 b=KICNJQzyCI/zfBzHPKGvzkaz9iucUlbPKrw+WKULnqxQjcrjv3S+3QYJqMQXZVCgNi
 hh0k1nlQnSew4oo7U1HNXNT8bf/vSvTd7rqZDJWuBdVyvp+4f60asZWNphQ5b2r3I3+l
 P1MsiOVw+D4oLiZ0yLM2tRpA2wskh3WVtpzfbIh/zTK+1CStcIUDQOgd6Oll7aHrohma
 lWDIRxTd2TdfOPwlUGtN8vDT0Gp7TqlcUI328V0xNWnln1BXv6GQElmTMqoM/Y9/Brf5
 sqO31y1t/YZDfVtsH61x3lhHjvjQvDCPZnCZTv9P8tR3sacRKm3ujBF3xDomCt7dv2jV
 0tVA==
X-Gm-Message-State: AOAM5304nRjVYJ3qFr1ZpnJuR4Qt+6aHd+Za4+ozD4dBHgK0JzwadOR1
 CfywDknkVy/MWKdgItDyH6o=
X-Google-Smtp-Source: ABdhPJwnNQfXO7AjHXWMn/tpTXzV0nUf1dFk+DWr2khbTMJSk39gkNgezJp4Wv7vki3qJV0KgjGvpg==
X-Received: by 2002:a62:2e47:0:b029:155:853a:80d5 with SMTP id
 u68-20020a622e470000b0290155853a80d5mr28804533pfu.29.1604472457118; 
 Tue, 03 Nov 2020 22:47:37 -0800 (PST)
Received: from localhost.localdomain
 ([2402:3a80:16e6:8166:e462:9fba:da9c:beed])
 by smtp.gmail.com with ESMTPSA id s18sm1036873pgh.60.2020.11.03.22.47.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 22:47:36 -0800 (PST)
From: Himadri Pandya <himadrispandya@gmail.com>
To: johan@kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed,  4 Nov 2020 12:16:50 +0530
Message-Id: <20201104064703.15123-3-himadrispandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201104064703.15123-1-himadrispandya@gmail.com>
References: <20201104064703.15123-1-himadrispandya@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 02/15] usb: serial: belkin_sa: use
	usb_control_msg_send()
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

The new usb_control_msg_send() nicely wraps usb_control_msg() with
proper error check. Hence use the wrapper instead of calling
usb_control_msg() directly.

Signed-off-by: Himadri Pandya <himadrispandya@gmail.com>
---
 drivers/usb/serial/belkin_sa.c | 35 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/serial/belkin_sa.c b/drivers/usb/serial/belkin_sa.c
index 9bb123ab9bc9..a5ff55f48303 100644
--- a/drivers/usb/serial/belkin_sa.c
+++ b/drivers/usb/serial/belkin_sa.c
@@ -105,9 +105,10 @@ struct belkin_sa_private {
 #define WDR_TIMEOUT 5000 /* default urb timeout */
 
 /* assumes that struct usb_serial *serial is available */
-#define BSA_USB_CMD(c, v) usb_control_msg(serial->dev, usb_sndctrlpipe(serial->dev, 0), \
-					    (c), BELKIN_SA_SET_REQUEST_TYPE, \
-					    (v), 0, NULL, 0, WDR_TIMEOUT)
+#define BSA_USB_CMD(c, v) usb_control_msg_send(serial->dev, 0, (c), \
+					       BELKIN_SA_SET_REQUEST_TYPE, \
+					       (v), 0, NULL, 0, WDR_TIMEOUT, \
+					       GFP_KERNEL)
 
 static int belkin_sa_port_probe(struct usb_serial_port *port)
 {
@@ -309,12 +310,11 @@ static void belkin_sa_set_termios(struct tty_struct *tty,
 		/* reassert DTR and (maybe) RTS on transition from B0 */
 		if ((old_cflag & CBAUD) == B0) {
 			control_state |= (TIOCM_DTR|TIOCM_RTS);
-			if (BSA_USB_CMD(BELKIN_SA_SET_DTR_REQUEST, 1) < 0)
+			if (BSA_USB_CMD(BELKIN_SA_SET_DTR_REQUEST, 1))
 				dev_err(&port->dev, "Set DTR error\n");
 			/* don't set RTS if using hardware flow control */
 			if (!(old_cflag & CRTSCTS))
-				if (BSA_USB_CMD(BELKIN_SA_SET_RTS_REQUEST
-								, 1) < 0)
+				if (BSA_USB_CMD(BELKIN_SA_SET_RTS_REQUEST, 1))
 					dev_err(&port->dev, "Set RTS error\n");
 		}
 	}
@@ -330,18 +330,18 @@ static void belkin_sa_set_termios(struct tty_struct *tty,
 
 		/* Report the actual baud rate back to the caller */
 		tty_encode_baud_rate(tty, baud, baud);
-		if (BSA_USB_CMD(BELKIN_SA_SET_BAUDRATE_REQUEST, urb_value) < 0)
+		if (BSA_USB_CMD(BELKIN_SA_SET_BAUDRATE_REQUEST, urb_value))
 			dev_err(&port->dev, "Set baudrate error\n");
 	} else {
 		/* Disable flow control */
 		if (BSA_USB_CMD(BELKIN_SA_SET_FLOW_CTRL_REQUEST,
-						BELKIN_SA_FLOW_NONE) < 0)
+				BELKIN_SA_FLOW_NONE))
 			dev_err(&port->dev, "Disable flowcontrol error\n");
 		/* Drop RTS and DTR */
 		control_state &= ~(TIOCM_DTR | TIOCM_RTS);
-		if (BSA_USB_CMD(BELKIN_SA_SET_DTR_REQUEST, 0) < 0)
+		if (BSA_USB_CMD(BELKIN_SA_SET_DTR_REQUEST, 0))
 			dev_err(&port->dev, "DTR LOW error\n");
-		if (BSA_USB_CMD(BELKIN_SA_SET_RTS_REQUEST, 0) < 0)
+		if (BSA_USB_CMD(BELKIN_SA_SET_RTS_REQUEST, 0))
 			dev_err(&port->dev, "RTS LOW error\n");
 	}
 
@@ -352,7 +352,7 @@ static void belkin_sa_set_termios(struct tty_struct *tty,
 						: BELKIN_SA_PARITY_EVEN;
 		else
 			urb_value = BELKIN_SA_PARITY_NONE;
-		if (BSA_USB_CMD(BELKIN_SA_SET_PARITY_REQUEST, urb_value) < 0)
+		if (BSA_USB_CMD(BELKIN_SA_SET_PARITY_REQUEST, urb_value))
 			dev_err(&port->dev, "Set parity error\n");
 	}
 
@@ -377,7 +377,7 @@ static void belkin_sa_set_termios(struct tty_struct *tty,
 			urb_value = BELKIN_SA_DATA_BITS(8);
 			break;
 		}
-		if (BSA_USB_CMD(BELKIN_SA_SET_DATA_BITS_REQUEST, urb_value) < 0)
+		if (BSA_USB_CMD(BELKIN_SA_SET_DATA_BITS_REQUEST, urb_value))
 			dev_err(&port->dev, "Set data bits error\n");
 	}
 
@@ -385,8 +385,7 @@ static void belkin_sa_set_termios(struct tty_struct *tty,
 	if ((cflag & CSTOPB) != (old_cflag & CSTOPB)) {
 		urb_value = (cflag & CSTOPB) ? BELKIN_SA_STOP_BITS(2)
 						: BELKIN_SA_STOP_BITS(1);
-		if (BSA_USB_CMD(BELKIN_SA_SET_STOP_BITS_REQUEST,
-							urb_value) < 0)
+		if (BSA_USB_CMD(BELKIN_SA_SET_STOP_BITS_REQUEST, urb_value))
 			dev_err(&port->dev, "Set stop bits error\n");
 	}
 
@@ -407,7 +406,7 @@ static void belkin_sa_set_termios(struct tty_struct *tty,
 		if (bad_flow_control)
 			urb_value &= ~(BELKIN_SA_FLOW_IRTS);
 
-		if (BSA_USB_CMD(BELKIN_SA_SET_FLOW_CTRL_REQUEST, urb_value) < 0)
+		if (BSA_USB_CMD(BELKIN_SA_SET_FLOW_CTRL_REQUEST, urb_value))
 			dev_err(&port->dev, "Set flow control error\n");
 	}
 
@@ -422,7 +421,7 @@ static void belkin_sa_break_ctl(struct tty_struct *tty, int break_state)
 	struct usb_serial_port *port = tty->driver_data;
 	struct usb_serial *serial = port->serial;
 
-	if (BSA_USB_CMD(BELKIN_SA_SET_BREAK_REQUEST, break_state ? 1 : 0) < 0)
+	if (BSA_USB_CMD(BELKIN_SA_SET_BREAK_REQUEST, break_state ? 1 : 0))
 		dev_err(&port->dev, "Set break_ctl %d\n", break_state);
 }
 
@@ -476,13 +475,13 @@ static int belkin_sa_tiocmset(struct tty_struct *tty,
 	spin_unlock_irqrestore(&priv->lock, flags);
 
 	retval = BSA_USB_CMD(BELKIN_SA_SET_RTS_REQUEST, rts);
-	if (retval < 0) {
+	if (retval) {
 		dev_err(&port->dev, "Set RTS error %d\n", retval);
 		goto exit;
 	}
 
 	retval = BSA_USB_CMD(BELKIN_SA_SET_DTR_REQUEST, dtr);
-	if (retval < 0) {
+	if (retval) {
 		dev_err(&port->dev, "Set DTR error %d\n", retval);
 		goto exit;
 	}
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
