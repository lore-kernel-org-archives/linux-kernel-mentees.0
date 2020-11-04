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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B98CBC55178
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Nov 2020 06:48:30 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 528F022384
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Nov 2020 06:48:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YzNxGd//"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 528F022384
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E38D98746C;
	Wed,  4 Nov 2020 06:48:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eivFJktUMK2W; Wed,  4 Nov 2020 06:48:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 536D787493;
	Wed,  4 Nov 2020 06:48:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 431D5C088B;
	Wed,  4 Nov 2020 06:48:29 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 24125C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1326286B3B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:48:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FdBnlMQVtlHQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:48:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5FE06868D4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:48:27 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id z3so1072590pfb.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Nov 2020 22:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ysHUcVNbp38AUgn7NKxkH5Q5DIwpvOeEqm2kZUXUKmU=;
 b=YzNxGd//p6RpHxyQKY/zhdc1gm8gz0LIfXvR7h5InWiRax8cOhO7XTjfgvIru0w46l
 X4w55YlLlkCPHdQ7hCo/wgNXiRwUQwoMCmLOrB7YdM0Y48n/40OymgK1fgJjk6oKvAfv
 7uVVyrGgzpO3DjwzTf0pMKZR7HXCHLU9ELAqbDeQjWMGAk/QECCKqV4RXooBd9RDzTz6
 rt2B2eYb6efu4pg9hoDN0oc5SJwuch2gDNxkXMhM7SuNI9JPZJKNLZ6YnkBP4dLq7yky
 lgLbjZy9wNJl65sC7/5OOztv1vKFyROkxORu4j8Oz0KhdlhkPT1JUIlf8ZkgP5xaQWoD
 8v0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ysHUcVNbp38AUgn7NKxkH5Q5DIwpvOeEqm2kZUXUKmU=;
 b=NvX/ufboWUtZqnoeOw4k6+7BvoLC+snzc08NeUo5t+Hoo6gT8C4H1jQLtIwGIAPKM1
 gN12KaNzHh1e644Py7lbIQZaj2xwvWemnToVIN8gRQoTqOWAED8fXouz1jV6V91yTiz+
 vyu+w1cIJ4nS8nv48yO/hXq3cXx2ACdbtsQ7OAsrj7y7LBkTuJMoja99WhwZ6ryorUQ7
 mqodNYsuvplesA5Nc/9ivkiACXSPmjn+tVO5x38oaGv6DdbWNF3wfHs4lLfPDYOdWDKp
 xkJvPLOqbajPRXMz+2ID2EfNTjikqDCyrU9MRj//PXlsuBA7ViILV3hyDD5d4xw+r4E5
 2oWQ==
X-Gm-Message-State: AOAM532InPNfzJLZdGCuA4V6u0n+Jgn4984W939Ua9LciuY7ukBoOa+4
 IJY/29cnLh5JkddbpB5mQvA=
X-Google-Smtp-Source: ABdhPJzuiIEqTk+1+1eFZRvLotka0QLSy6Ky8iB1wyY+65k+2+Lj+I04P2RisE3gcfbxPM73VqZifA==
X-Received: by 2002:a17:90b:34f:: with SMTP id
 fh15mr3075738pjb.66.1604472507072; 
 Tue, 03 Nov 2020 22:48:27 -0800 (PST)
Received: from localhost.localdomain
 ([2402:3a80:16e6:8166:e462:9fba:da9c:beed])
 by smtp.gmail.com with ESMTPSA id s18sm1036873pgh.60.2020.11.03.22.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 22:48:26 -0800 (PST)
From: Himadri Pandya <himadrispandya@gmail.com>
To: johan@kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed,  4 Nov 2020 12:17:03 +0530
Message-Id: <20201104064703.15123-16-himadrispandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201104064703.15123-1-himadrispandya@gmail.com>
References: <20201104064703.15123-1-himadrispandya@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 15/15] usb: serial: kl5kusb105: use
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
instead of calling usb_control_msg() directly

Signed-off-by: Himadri Pandya <himadrispandya@gmail.com>
---
 drivers/usb/serial/kl5kusb105.c | 94 +++++++++++++++------------------
 1 file changed, 44 insertions(+), 50 deletions(-)

diff --git a/drivers/usb/serial/kl5kusb105.c b/drivers/usb/serial/kl5kusb105.c
index 5ee48b0650c4..75cfd1c907f3 100644
--- a/drivers/usb/serial/kl5kusb105.c
+++ b/drivers/usb/serial/kl5kusb105.c
@@ -124,16 +124,17 @@ static int klsi_105_chg_port_settings(struct usb_serial_port *port,
 {
 	int rc;
 
-	rc = usb_control_msg(port->serial->dev,
-			usb_sndctrlpipe(port->serial->dev, 0),
-			KL5KUSB105A_SIO_SET_DATA,
-			USB_TYPE_VENDOR | USB_DIR_OUT | USB_RECIP_INTERFACE,
-			0, /* value */
-			0, /* index */
-			settings,
-			sizeof(struct klsi_105_port_settings),
-			KLSI_TIMEOUT);
-	if (rc < 0)
+	rc = usb_control_msg_send(port->serial->dev, 0,
+				  KL5KUSB105A_SIO_SET_DATA,
+				  USB_TYPE_VENDOR | USB_DIR_OUT |
+				  USB_RECIP_INTERFACE,
+				  0, /* value */
+				  0, /* index */
+				  settings,
+				  sizeof(struct klsi_105_port_settings),
+				  KLSI_TIMEOUT,
+				  GFP_KERNEL);
+	if (rc)
 		dev_err(&port->dev,
 			"Change port settings failed (error = %d)\n", rc);
 
@@ -167,28 +168,21 @@ static int klsi_105_get_line_state(struct usb_serial_port *port,
 				   unsigned long *line_state_p)
 {
 	int rc;
-	u8 *status_buf;
+	u8 status_buf[2];
 	__u16 status;
 
-	status_buf = kmalloc(KLSI_STATUSBUF_LEN, GFP_KERNEL);
-	if (!status_buf)
-		return -ENOMEM;
-
 	status_buf[0] = 0xff;
 	status_buf[1] = 0xff;
-	rc = usb_control_msg(port->serial->dev,
-			     usb_rcvctrlpipe(port->serial->dev, 0),
-			     KL5KUSB105A_SIO_POLL,
-			     USB_TYPE_VENDOR | USB_DIR_IN,
-			     0, /* value */
-			     0, /* index */
-			     status_buf, KLSI_STATUSBUF_LEN,
-			     10000
-			     );
-	if (rc != KLSI_STATUSBUF_LEN) {
+	rc = usb_control_msg_recv(port->serial->dev, 0,
+				  KL5KUSB105A_SIO_POLL,
+				  USB_TYPE_VENDOR | USB_DIR_IN,
+				  0, /* value */
+				  0, /* index */
+				  &status_buf, KLSI_STATUSBUF_LEN,
+				  10000,
+				  GFP_KERNEL);
+	if (rc) {
 		dev_err(&port->dev, "reading line status failed: %d\n", rc);
-		if (rc >= 0)
-			rc = -EIO;
 	} else {
 		status = get_unaligned_le16(status_buf);
 
@@ -198,7 +192,6 @@ static int klsi_105_get_line_state(struct usb_serial_port *port,
 		*line_state_p = klsi_105_status2linestate(status);
 	}
 
-	kfree(status_buf);
 	return rc;
 }
 
@@ -283,16 +276,17 @@ static int  klsi_105_open(struct tty_struct *tty, struct usb_serial_port *port)
 		goto err_free_cfg;
 	}
 
-	rc = usb_control_msg(port->serial->dev,
-			     usb_sndctrlpipe(port->serial->dev, 0),
-			     KL5KUSB105A_SIO_CONFIGURE,
-			     USB_TYPE_VENDOR|USB_DIR_OUT|USB_RECIP_INTERFACE,
-			     KL5KUSB105A_SIO_CONFIGURE_READ_ON,
-			     0, /* index */
-			     NULL,
-			     0,
-			     KLSI_TIMEOUT);
-	if (rc < 0) {
+	rc  = usb_control_msg_send(port->serial->dev, 0,
+				   KL5KUSB105A_SIO_CONFIGURE,
+				   USB_TYPE_VENDOR | USB_DIR_OUT |
+				   USB_RECIP_INTERFACE,
+				   KL5KUSB105A_SIO_CONFIGURE_READ_ON,
+				   0, /* index */
+				   NULL,
+				   0,
+				   KLSI_TIMEOUT,
+				   GFP_KERNEL);
+	if (rc) {
 		dev_err(&port->dev, "Enabling read failed (error = %d)\n", rc);
 		retval = rc;
 		goto err_generic_close;
@@ -314,14 +308,14 @@ static int  klsi_105_open(struct tty_struct *tty, struct usb_serial_port *port)
 	return 0;
 
 err_disable_read:
-	usb_control_msg(port->serial->dev,
-			     usb_sndctrlpipe(port->serial->dev, 0),
+	usb_control_msg_send(port->serial->dev, 0,
 			     KL5KUSB105A_SIO_CONFIGURE,
 			     USB_TYPE_VENDOR | USB_DIR_OUT,
 			     KL5KUSB105A_SIO_CONFIGURE_READ_OFF,
 			     0, /* index */
 			     NULL, 0,
-			     KLSI_TIMEOUT);
+			     KLSI_TIMEOUT,
+			     GFP_KERNEL);
 err_generic_close:
 	usb_serial_generic_close(port);
 err_free_cfg:
@@ -335,15 +329,15 @@ static void klsi_105_close(struct usb_serial_port *port)
 	int rc;
 
 	/* send READ_OFF */
-	rc = usb_control_msg(port->serial->dev,
-			     usb_sndctrlpipe(port->serial->dev, 0),
-			     KL5KUSB105A_SIO_CONFIGURE,
-			     USB_TYPE_VENDOR | USB_DIR_OUT,
-			     KL5KUSB105A_SIO_CONFIGURE_READ_OFF,
-			     0, /* index */
-			     NULL, 0,
-			     KLSI_TIMEOUT);
-	if (rc < 0)
+	rc = usb_control_msg_send(port->serial->dev, 0,
+				  KL5KUSB105A_SIO_CONFIGURE,
+				  USB_TYPE_VENDOR | USB_DIR_OUT,
+				  KL5KUSB105A_SIO_CONFIGURE_READ_OFF,
+				  0, /* index */
+				  NULL, 0,
+				  KLSI_TIMEOUT,
+				  GFP_KERNEL);
+	if (rc)
 		dev_err(&port->dev, "failed to disable read: %d\n", rc);
 
 	/* shutdown our bulk reads and writes */
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
