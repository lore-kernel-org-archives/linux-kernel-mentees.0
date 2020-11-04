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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 383ECC55178
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Nov 2020 06:48:06 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B41E52222B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Nov 2020 06:48:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EPFgct1d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B41E52222B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 71D9486978;
	Wed,  4 Nov 2020 06:48:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GQYHJfhJx787; Wed,  4 Nov 2020 06:48:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DC0B4868D4;
	Wed,  4 Nov 2020 06:48:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CA15DC088B;
	Wed,  4 Nov 2020 06:48:04 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 57EA7C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 467BC220C1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:48:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QEILUOzuivPg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:48:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 96E752155B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:48:03 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id p4so2502234plr.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Nov 2020 22:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=l8NSTxxpQrexkPYVhXT7jvvYAIXTQNPEWoW4LpKJ/RY=;
 b=EPFgct1dcoqTz7O1M327HwD+IZWgzUe5fzd7bcCEVLeuBTFY+Xh3FiLDgwRbOthgFE
 Mb8aQA1XYkqVQI6I2LazCjQzy6pJStpC4OKpSeOp7T63ju8SGeHQTIzlsOL2KA7WOs8Y
 yicCT3K+Tgj/EBEi9y+0knIqkUokXN/kt93MR+40bEbMTcO4RkEAyCmLaKzLRSmB6f2X
 1qG3ilfmdt9ER3217RFUm2xWame3Df97ffKO+3Zg6IRZvfcg8zmS+7/+VAvGY9Q55GOJ
 1jRESsr4tt8HBjkEVbeLnDZ8zXC934qignZ2vEET2P7QNLaV+/CxG29CjHNDqnZcNYrV
 g8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=l8NSTxxpQrexkPYVhXT7jvvYAIXTQNPEWoW4LpKJ/RY=;
 b=P4JURzl3rOzxRk8N/Cb67vWB8XjCEzx/nc4Hxevw2sCFvP4lnGUXt9rwWfcm5CK8Nl
 8QV7a1KH8VknJFAKoFWHk3klWcwTyXyHqLWf7hVeInnPt7VB0PLwyc7bYJfPVw+i88yF
 dJZjaWVY1QFQPnimoO9lCI2plDT2DaTACZQHURF25h7QachyW13y97hgpWBgp1zZreh5
 NfwTHg58fvqMtJy3UAuXSHq57xQD05hROedXPhWUViGF1Gknf9APSKrlXpo7+RG8y9A+
 Vgo4l8zG5iJ5grY8EzU0yL93hpgdYm6Ncv2RlSJFEY+eWKwjCXVNYbI2UgQ2lD36Dra+
 3UtQ==
X-Gm-Message-State: AOAM531dFbNv4AFI/cugleK0st0yimTTE6I9KOwkNPYRghB9uFTJ5VbT
 V+vQ9S2OkMA6UXl0jwnAa98=
X-Google-Smtp-Source: ABdhPJzPQj7n6uicFaevWxSN0ch/aIA432vzngGoXIpK795g7+01js+d+9OiTwm6HL/9MW7/aUTcCw==
X-Received: by 2002:a17:902:c20a:b029:d6:b2d6:8006 with SMTP id
 10-20020a170902c20ab02900d6b2d68006mr19396172pll.31.1604472483191; 
 Tue, 03 Nov 2020 22:48:03 -0800 (PST)
Received: from localhost.localdomain
 ([2402:3a80:16e6:8166:e462:9fba:da9c:beed])
 by smtp.gmail.com with ESMTPSA id s18sm1036873pgh.60.2020.11.03.22.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 22:48:02 -0800 (PST)
From: Himadri Pandya <himadrispandya@gmail.com>
To: johan@kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed,  4 Nov 2020 12:16:57 +0530
Message-Id: <20201104064703.15123-10-himadrispandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201104064703.15123-1-himadrispandya@gmail.com>
References: <20201104064703.15123-1-himadrispandya@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 09/15] usb: serial: io_edgeport: use
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
 drivers/usb/serial/io_edgeport.c | 73 ++++++++++++--------------------
 1 file changed, 27 insertions(+), 46 deletions(-)

diff --git a/drivers/usb/serial/io_edgeport.c b/drivers/usb/serial/io_edgeport.c
index ba5d8df69518..8479d5684af7 100644
--- a/drivers/usb/serial/io_edgeport.c
+++ b/drivers/usb/serial/io_edgeport.c
@@ -568,34 +568,29 @@ static int get_epic_descriptor(struct edgeport_serial *ep)
 	int result;
 	struct usb_serial *serial = ep->serial;
 	struct edgeport_product_info *product_info = &ep->product_info;
-	struct edge_compatibility_descriptor *epic;
+	struct edge_compatibility_descriptor epic;
 	struct edge_compatibility_bits *bits;
 	struct device *dev = &serial->dev->dev;
 
 	ep->is_epic = 0;
 
-	epic = kmalloc(sizeof(*epic), GFP_KERNEL);
-	if (!epic)
-		return -ENOMEM;
-
-	result = usb_control_msg(serial->dev, usb_rcvctrlpipe(serial->dev, 0),
-				 USB_REQUEST_ION_GET_EPIC_DESC,
-				 0xC0, 0x00, 0x00,
-				 epic, sizeof(*epic),
-				 300);
-	if (result == sizeof(*epic)) {
+	result = usb_control_msg_recv(serial->dev, 0,
+				      USB_REQUEST_ION_GET_EPIC_DESC, 0xC0,
+				      0x00, 0x00, &epic, sizeof(epic), 300,
+				      GFP_KERNEL);
+	if (result) {
 		ep->is_epic = 1;
-		memcpy(&ep->epic_descriptor, epic, sizeof(*epic));
+		memcpy(&ep->epic_descriptor, &epic, sizeof(epic));
 		memset(product_info, 0, sizeof(struct edgeport_product_info));
 
-		product_info->NumPorts = epic->NumPorts;
+		product_info->NumPorts = epic.NumPorts;
 		product_info->ProdInfoVer = 0;
-		product_info->FirmwareMajorVersion = epic->MajorVersion;
-		product_info->FirmwareMinorVersion = epic->MinorVersion;
-		product_info->FirmwareBuildNumber = epic->BuildNumber;
-		product_info->iDownloadFile = epic->iDownloadFile;
-		product_info->EpicVer = epic->EpicVer;
-		product_info->Epic = epic->Supports;
+		product_info->FirmwareMajorVersion = epic.MajorVersion;
+		product_info->FirmwareMinorVersion = epic.MinorVersion;
+		product_info->FirmwareBuildNumber = epic.BuildNumber;
+		product_info->iDownloadFile = epic.iDownloadFile;
+		product_info->EpicVer = epic.EpicVer;
+		product_info->Epic = epic.Supports;
 		product_info->ProductId = ION_DEVICE_ID_EDGEPORT_COMPATIBLE;
 		dump_product_info(ep, product_info);
 
@@ -614,16 +609,12 @@ static int get_epic_descriptor(struct edgeport_serial *ep)
 		dev_dbg(dev, "  IOSPWriteLCR     : %s\n", bits->IOSPWriteLCR	? "TRUE": "FALSE");
 		dev_dbg(dev, "  IOSPSetBaudRate  : %s\n", bits->IOSPSetBaudRate	? "TRUE": "FALSE");
 		dev_dbg(dev, "  TrueEdgeport     : %s\n", bits->TrueEdgeport	? "TRUE": "FALSE");
-
-		result = 0;
-	} else if (result >= 0) {
+	} else {
 		dev_warn(&serial->interface->dev, "short epic descriptor received: %d\n",
 			 result);
 		result = -EIO;
 	}
 
-	kfree(epic);
-
 	return result;
 }
 
@@ -2168,11 +2159,6 @@ static int rom_read(struct usb_serial *serial, __u16 extAddr,
 {
 	int result;
 	__u16 current_length;
-	unsigned char *transfer_buffer;
-
-	transfer_buffer =  kmalloc(64, GFP_KERNEL);
-	if (!transfer_buffer)
-		return -ENOMEM;
 
 	/* need to split these reads up into 64 byte chunks */
 	result = 0;
@@ -2181,25 +2167,18 @@ static int rom_read(struct usb_serial *serial, __u16 extAddr,
 			current_length = 64;
 		else
 			current_length = length;
-		result = usb_control_msg(serial->dev,
-					usb_rcvctrlpipe(serial->dev, 0),
-					USB_REQUEST_ION_READ_ROM,
-					0xC0, addr, extAddr, transfer_buffer,
-					current_length, 300);
-		if (result < current_length) {
-			if (result >= 0)
-				result = -EIO;
+		result = usb_control_msg_recv(serial->dev, 0,
+					      USB_REQUEST_ION_READ_ROM, 0xC0,
+					      addr, extAddr, data,
+					      current_length, 300, GFP_KERNEL);
+		if (result)
 			break;
-		}
-		memcpy(data, transfer_buffer, current_length);
+
 		length -= current_length;
 		addr += current_length;
 		data += current_length;
 
-		result = 0;
 	}
-
-	kfree(transfer_buffer);
 	return result;
 }
 
@@ -2801,10 +2780,12 @@ static void load_application_firmware(struct edgeport_serial *edge_serial)
 	}
 
 	dev_dbg(dev, "sending exec_dl_code\n");
-	response = usb_control_msg (edge_serial->serial->dev,
-				    usb_sndctrlpipe(edge_serial->serial->dev, 0),
-				    USB_REQUEST_ION_EXEC_DL_CODE,
-				    0x40, 0x4000, 0x0001, NULL, 0, 3000);
+	response = usb_control_msg_send(edge_serial->serial->dev, 0,
+					USB_REQUEST_ION_EXEC_DL_CODE,
+					0x40, 0x4000, 0x0001, NULL, 0, 3000,
+					GFP_KERNEL);
+	if (response)
+		dev_err(dev, "failed sending exec_dl_decode %d\n", response);
 
 	release_firmware(fw);
 }
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
