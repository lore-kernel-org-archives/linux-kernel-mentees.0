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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DA52C2D0A3
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Nov 2020 06:48:18 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA5142222B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Nov 2020 06:48:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GoC8DcFI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA5142222B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id ACF1286B76;
	Wed,  4 Nov 2020 06:48:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2p52YHPkZy9w; Wed,  4 Nov 2020 06:48:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2266186B43;
	Wed,  4 Nov 2020 06:48:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1060AC088B;
	Wed,  4 Nov 2020 06:48:17 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5CD6DC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4C0D7868D4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:48:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E+HccgXpV7D1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:48:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8D66F86B4D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:48:15 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id b12so9837755plr.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Nov 2020 22:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=s90dzJNynJlXhu5PFXW3xxoyQNWm3vOkTOAC4HZYz6M=;
 b=GoC8DcFIeGeve61407Y1kAJsW0emtoExF3ZW1bYgNGvd8lw2rSd/bX2YMnzsHSfLP4
 WLxx1vZ9gYbUzyYG7pn5TyQ0O6Cp1nIAtE62V4UMmRL9yoCClSIRAlLqB2igWMJ6+gEO
 Yfo4nrQZzwM832c+C14C+bWbXgEiX11EczJp77IA4p2SL53F473qZkyJn5tdJSLRvVOe
 lDY9E9Y9LDz0nNbuBw9liCcQAvLiljJP+prf2mZHyXZZljlyEjVKWrl2+UD2Ll/HKbt7
 +Q4yAb2r3mRUlgeFpDRNc6as/L9Lv4RUsXhLc2pkVGl+1/QPfUEtpQ6vgfdT/EsKaD9M
 t3Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=s90dzJNynJlXhu5PFXW3xxoyQNWm3vOkTOAC4HZYz6M=;
 b=mAuGMd6ZK2HV81Hn0G966QITREJD9RPxMPlpyt08BslpaUZjBFFCR+PTHDSPGSIDO3
 nKgQUHeOfhP/+W2F4KtA5DS2yEwqrQmI1/vvTDeb1uZnRwt64p8ag09o8RD4sHm/FzNO
 lMtNsT1lOYwUYobmVqxpNjMLtwmAB9Yo+xiK8tn7QfJd5NM/RmogQp8mY1tA5zVHFul/
 ShqOYaqjtpb7l9SlEncRAxuD8f2lUktBXlvGvRQ4u5fF0L6iv4oq+4z2Om2iKPg0Qnlq
 xOh51WMkpGTgx8l1lMzm8ufzhvniypi+ewu7vYv8B6iFDXbqnAdXPFReE29Bwv6wVHoa
 BHRg==
X-Gm-Message-State: AOAM533Mt2R8cwJ1BovA53/NeyyU6bphskTtHu7XoL3pTsux/aryduMW
 5IOX2VIjtzzT2APVLdTiv6k=
X-Google-Smtp-Source: ABdhPJwozhFZg8sFa6GjYjDZ6TJ0QDReAQ3JswDWFl8ldK9dTIXvTW7GEenCRHqg9sWFdeBDO9IaMg==
X-Received: by 2002:a17:902:864b:b029:d3:ce46:2829 with SMTP id
 y11-20020a170902864bb02900d3ce462829mr29662922plt.16.1604472495216; 
 Tue, 03 Nov 2020 22:48:15 -0800 (PST)
Received: from localhost.localdomain
 ([2402:3a80:16e6:8166:e462:9fba:da9c:beed])
 by smtp.gmail.com with ESMTPSA id s18sm1036873pgh.60.2020.11.03.22.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 22:48:14 -0800 (PST)
From: Himadri Pandya <himadrispandya@gmail.com>
To: johan@kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed,  4 Nov 2020 12:17:00 +0530
Message-Id: <20201104064703.15123-13-himadrispandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201104064703.15123-1-himadrispandya@gmail.com>
References: <20201104064703.15123-1-himadrispandya@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 12/15] usb: serial: ipw: use
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

The new usb_control_msg_send() nicely wraps usb_control_msg() with proper
error check. Hence use the wrapper instead of calling usb_control_msg()
directly.

Signed-off-by: Himadri Pandya <himadrispandya@gmail.com>
---
 drivers/usb/serial/ipw.c | 107 +++++++++++++--------------------------
 1 file changed, 36 insertions(+), 71 deletions(-)

diff --git a/drivers/usb/serial/ipw.c b/drivers/usb/serial/ipw.c
index d04c7cc5c1c2..3c3895b4dff8 100644
--- a/drivers/usb/serial/ipw.c
+++ b/drivers/usb/serial/ipw.c
@@ -134,26 +134,16 @@ static int ipw_open(struct tty_struct *tty, struct usb_serial_port *port)
 	struct usb_device *udev = port->serial->dev;
 	struct device *dev = &port->dev;
 	u8 buf_flow_static[16] = IPW_BYTES_FLOWINIT;
-	u8 *buf_flow_init;
 	int result;
 
-	buf_flow_init = kmemdup(buf_flow_static, 16, GFP_KERNEL);
-	if (!buf_flow_init)
-		return -ENOMEM;
-
 	/* --1: Tell the modem to initialize (we think) From sniffs this is
 	 *	always the first thing that gets sent to the modem during
 	 *	opening of the device */
 	dev_dbg(dev, "%s: Sending SIO_INIT (we guess)\n", __func__);
-	result = usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
-			 IPW_SIO_INIT,
-			 USB_TYPE_VENDOR | USB_RECIP_INTERFACE | USB_DIR_OUT,
-			 0,
-			 0, /* index */
-			 NULL,
-			 0,
-			 100000);
-	if (result < 0)
+	result = usb_control_msg_send(udev, 0, IPW_SIO_INIT, USB_TYPE_VENDOR |
+				      USB_RECIP_INTERFACE | USB_DIR_OUT, 0,
+				      0,  NULL, 0, 100000, GFP_KERNEL);
+	if (result)
 		dev_err(dev, "Init of modem failed (error = %d)\n", result);
 
 	/* reset the bulk pipes */
@@ -166,31 +156,22 @@ static int ipw_open(struct tty_struct *tty, struct usb_serial_port *port)
 
 	/*--3: Tell the modem to open the floodgates on the rx bulk channel */
 	dev_dbg(dev, "%s:asking modem for RxRead (RXBULK_ON)\n", __func__);
-	result = usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
-			 IPW_SIO_RXCTL,
-			 USB_TYPE_VENDOR | USB_RECIP_INTERFACE | USB_DIR_OUT,
-			 IPW_RXBULK_ON,
-			 0, /* index */
-			 NULL,
-			 0,
-			 100000);
-	if (result < 0)
+	result = usb_control_msg_send(udev, 0, IPW_SIO_RXCTL, USB_TYPE_VENDOR |
+				      USB_RECIP_INTERFACE | USB_DIR_OUT,
+				      IPW_RXBULK_ON, 0, NULL, 0, 100000,
+				      GFP_KERNEL);
+	if (result)
 		dev_err(dev, "Enabling bulk RxRead failed (error = %d)\n", result);
 
 	/*--4: setup the initial flowcontrol */
-	dev_dbg(dev, "%s:setting init flowcontrol (%s)\n", __func__, buf_flow_init);
-	result = usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
-			 IPW_SIO_HANDFLOW,
-			 USB_TYPE_VENDOR | USB_RECIP_INTERFACE | USB_DIR_OUT,
-			 0,
-			 0,
-			 buf_flow_init,
-			 0x10,
-			 200000);
-	if (result < 0)
+	dev_dbg(dev, "%s:setting init flowcontrol (%s)\n", __func__, buf_flow_static);
+	result = usb_control_msg_send(udev, 0, IPW_SIO_HANDFLOW,
+				      USB_TYPE_VENDOR | USB_RECIP_INTERFACE |
+				      USB_DIR_OUT, 0, 0, &buf_flow_static, 0x10,
+				      200000, GFP_KERNEL);
+	if (result)
 		dev_err(dev, "initial flowcontrol failed (error = %d)\n", result);
 
-	kfree(buf_flow_init);
 	return 0;
 }
 
@@ -223,26 +204,20 @@ static void ipw_dtr_rts(struct usb_serial_port *port, int on)
 
 	dev_dbg(dev, "%s: on = %d\n", __func__, on);
 
-	result = usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
-			 IPW_SIO_SET_PIN,
-			 USB_TYPE_VENDOR | USB_RECIP_INTERFACE | USB_DIR_OUT,
-			 on ? IPW_PIN_SETDTR : IPW_PIN_CLRDTR,
-			 0,
-			 NULL,
-			 0,
-			 200000);
-	if (result < 0)
+	result = usb_control_msg_send(udev, 0, IPW_SIO_SET_PIN,
+				      USB_TYPE_VENDOR | USB_RECIP_INTERFACE |
+				      USB_DIR_OUT,
+				      on ? IPW_PIN_SETDTR : IPW_PIN_CLRDTR, 0,
+				      NULL, 0, 200000, GFP_KERNEL);
+	if (result)
 		dev_err(dev, "setting dtr failed (error = %d)\n", result);
 
-	result = usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
-			 IPW_SIO_SET_PIN, USB_TYPE_VENDOR |
-					USB_RECIP_INTERFACE | USB_DIR_OUT,
-			 on ? IPW_PIN_SETRTS : IPW_PIN_CLRRTS,
-			 0,
-			 NULL,
-			 0,
-			 200000);
-	if (result < 0)
+	result = usb_control_msg_send(udev, 0, IPW_SIO_SET_PIN,
+				      USB_TYPE_VENDOR | USB_RECIP_INTERFACE |
+				      USB_DIR_OUT,
+				      on ? IPW_PIN_SETRTS : IPW_PIN_CLRRTS,
+				      0, NULL, 0, 200000, GFP_KERNEL);
+	if (result)
 		dev_err(dev, "setting rts failed (error = %d)\n", result);
 }
 
@@ -254,30 +229,20 @@ static void ipw_close(struct usb_serial_port *port)
 
 	/*--3: purge */
 	dev_dbg(dev, "%s:sending purge\n", __func__);
-	result = usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
-			 IPW_SIO_PURGE, USB_TYPE_VENDOR |
-			 		USB_RECIP_INTERFACE | USB_DIR_OUT,
-			 0x03,
-			 0,
-			 NULL,
-			 0,
-			 200000);
-	if (result < 0)
+	result = usb_control_msg_send(udev, 0, IPW_SIO_PURGE, USB_TYPE_VENDOR |
+				      USB_RECIP_INTERFACE | USB_DIR_OUT, 0x03,
+				      0, NULL, 0, 200000, GFP_KERNEL);
+	if (result)
 		dev_err(dev, "purge failed (error = %d)\n", result);
 
 
 	/* send RXBULK_off (tell modem to stop transmitting bulk data on
 	   rx chan) */
-	result = usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
-			 IPW_SIO_RXCTL,
-			 USB_TYPE_VENDOR | USB_RECIP_INTERFACE | USB_DIR_OUT,
-			 IPW_RXBULK_OFF,
-			 0, /* index */
-			 NULL,
-			 0,
-			 100000);
-
-	if (result < 0)
+	result = usb_control_msg_send(udev, 0, IPW_SIO_RXCTL, USB_TYPE_VENDOR |
+				      USB_RECIP_INTERFACE | USB_DIR_OUT,
+				      IPW_RXBULK_OFF, 0, NULL, 0, 100000, GFP_KERNEL);
+
+	if (result)
 		dev_err(dev, "Disabling bulk RxRead failed (error = %d)\n", result);
 
 	usb_wwan_close(port);
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
