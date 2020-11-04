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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B714C4741F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Nov 2020 06:47:52 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 924282222B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Nov 2020 06:47:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TRRDSpAY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 924282222B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 44E40220C1;
	Wed,  4 Nov 2020 06:47:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IzuatSIATfLD; Wed,  4 Nov 2020 06:47:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 89AE02155B;
	Wed,  4 Nov 2020 06:47:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 79A2BC088B;
	Wed,  4 Nov 2020 06:47:50 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 59778C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4296C2155B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:47:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6hS3E-c0DcwI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:47:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 679F020404
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:47:48 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id 10so16499253pfp.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Nov 2020 22:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=TSlwhbTV17TkpJXdKDkhYenknX5pNJ6noEIgEUfNOLo=;
 b=TRRDSpAYA+9b7oCBslKQ1lWAPU2pWq6ePYfuMk7OWIOmCYO2KISt5kjdyQpzts62fb
 8cZOOiZ2ykFmtNemz4KVrHYmB5z6GLxRGFbyxFu+S+u7pRTCB7fI3B00KMK5p1usfE1i
 gWD+Zs9HSeMqduwUmrepY0nmP9KgocDkjAKIYSejUn3u2SS6F2Q82WH7+1hbIaozMHr/
 JDfsWVCSQgojY/XyyC+qQ8nql3/CZ0q3nOa/5CojdFeX33+uhD97CQTGl0HuLjgUTU1v
 3UldhNgw7eXu6XjfSwDWdpFy/Lqop1JX7nNkHVwJ7Fh3MbqsMCBrZl6EBrXO0NWIhh18
 RQgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=TSlwhbTV17TkpJXdKDkhYenknX5pNJ6noEIgEUfNOLo=;
 b=kei2iCQtUIiEP5FBPfgWLMoOFi2fcRBgJUAnimhSu3nCfBQ3BAhMbZnk/771euu9rW
 hUg02EjP0PsPnWOliAlKmMbhlSKBdsZ00IpyR8vJZr/Uys+v85Dw9MnnodeGcOjt1oiH
 ryQ8ebKd8X2UKLABhJyDfvFqzZQfkbHooMkDF5wdWko2gA4EkK0UqN5WBjFS5oxJh8MN
 fhqHuc7jqpA2/pHC+uWKab31eAB4tI8IDaLsBwuU+/GtYmlEhgMpYoc29LeWuRXlmWl3
 YXe5VqwBfyAtKtPI1XsiqWo2BoeuriTEvmdMTn1EiM+3cmH2kuTvIYKH4+P8aPWchd3E
 HnKg==
X-Gm-Message-State: AOAM531JYoZGYsUI+7j7b/54ZqHeDz0wVIj04dHzxQk6a3R6fca7UUca
 yohVyS2uEH/E9176m9RCvrU=
X-Google-Smtp-Source: ABdhPJy0TMDgkqBlyzvxX29fFTS8osZu0OWFz7ImWJTXyD7yV/BujyK/XeYXPKrUXl/A7NUMSWAb+g==
X-Received: by 2002:a17:90a:d3d5:: with SMTP id
 d21mr2897977pjw.168.1604472468086; 
 Tue, 03 Nov 2020 22:47:48 -0800 (PST)
Received: from localhost.localdomain
 ([2402:3a80:16e6:8166:e462:9fba:da9c:beed])
 by smtp.gmail.com with ESMTPSA id s18sm1036873pgh.60.2020.11.03.22.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 22:47:47 -0800 (PST)
From: Himadri Pandya <himadrispandya@gmail.com>
To: johan@kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed,  4 Nov 2020 12:16:53 +0530
Message-Id: <20201104064703.15123-6-himadrispandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201104064703.15123-1-himadrispandya@gmail.com>
References: <20201104064703.15123-1-himadrispandya@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 05/15] usb: serial: cypress_m8: use
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
 drivers/usb/serial/cypress_m8.c | 38 +++++++++++++++++----------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/serial/cypress_m8.c b/drivers/usb/serial/cypress_m8.c
index cc028601c388..4d66cab8eece 100644
--- a/drivers/usb/serial/cypress_m8.c
+++ b/drivers/usb/serial/cypress_m8.c
@@ -341,20 +341,21 @@ static int cypress_serial_control(struct tty_struct *tty,
 			feature_buffer[4]);
 
 		do {
-			retval = usb_control_msg(port->serial->dev,
-					usb_sndctrlpipe(port->serial->dev, 0),
-					HID_REQ_SET_REPORT,
-					USB_DIR_OUT | USB_RECIP_INTERFACE | USB_TYPE_CLASS,
-					0x0300, 0, feature_buffer,
-					feature_len, 500);
+			retval = usb_control_msg_send(port->serial->dev, 0,
+						      HID_REQ_SET_REPORT,
+						      USB_DIR_OUT |
+						      USB_RECIP_INTERFACE |
+						      USB_TYPE_CLASS, 0x0300,
+						      0, feature_buffer,
+						      feature_len, 500,
+						      GFP_KERNEL);
 
 			if (tries++ >= 3)
 				break;
 
-		} while (retval != feature_len &&
-			 retval != -ENODEV);
+		} while (retval != -ENODEV);
 
-		if (retval != feature_len) {
+		if (retval) {
 			dev_err(dev, "%s - failed sending serial line settings - %d\n",
 				__func__, retval);
 			cypress_set_dead(port);
@@ -379,19 +380,20 @@ static int cypress_serial_control(struct tty_struct *tty,
 		}
 		dev_dbg(dev, "%s - retrieving serial line settings\n", __func__);
 		do {
-			retval = usb_control_msg(port->serial->dev,
-					usb_rcvctrlpipe(port->serial->dev, 0),
-					HID_REQ_GET_REPORT,
-					USB_DIR_IN | USB_RECIP_INTERFACE | USB_TYPE_CLASS,
-					0x0300, 0, feature_buffer,
-					feature_len, 500);
+			retval = usb_control_msg_recv(port->serial->dev, 0,
+						      HID_REQ_GET_REPORT,
+						      USB_DIR_IN |
+						      USB_RECIP_INTERFACE |
+						      USB_TYPE_CLASS, 0x0300,
+						      0, feature_buffer,
+						      feature_len, 500,
+						      GFP_KERNEL);
 
 			if (tries++ >= 3)
 				break;
-		} while (retval != feature_len
-						&& retval != -ENODEV);
+		} while (retval != -ENODEV);
 
-		if (retval != feature_len) {
+		if (retval) {
 			dev_err(dev, "%s - failed to retrieve serial line settings - %d\n",
 				__func__, retval);
 			cypress_set_dead(port);
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
