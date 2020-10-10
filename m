Return-Path: <SRS0=QZ3P=DR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F08AC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 10 Oct 2020 06:57:08 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EE41207CD
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 10 Oct 2020 06:57:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DnDBEoue"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EE41207CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A86B886FAE;
	Sat, 10 Oct 2020 06:57:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7B8mmtEZOlpj; Sat, 10 Oct 2020 06:57:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 21B3A86F9A;
	Sat, 10 Oct 2020 06:57:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 077FBC07FF;
	Sat, 10 Oct 2020 06:57:07 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 529DEC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 06:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3AE96203DD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 06:57:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zoN-9AUD9cTu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 06:57:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 642B42037E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 06:57:04 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id b26so8783993pff.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 09 Oct 2020 23:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TbBIbqC8DAFbPFSiL7x/czfUd8Ri1dHtd4Wy4OMwCtE=;
 b=DnDBEoueu5yY2GmrVTAMYaxr2x810ufN9NJ9yfrpmWCC/2rAaJNFp9t47zAxovadkw
 tYWnpiCZxa+9VG4OPh6xpLy56bOn1FCgeQSYbsqVlCLLAuzt2Nk/dDEo0y6Fmdh6oMe9
 i4t2NgCZ+bWQJymdN4Nrq4ShgC66aO78ei2cvLjsYFXYOe7E+AGypQnRYXrfE4cpkBcF
 NLleiKF6RDP6NiSF2Tdn4Q7qya16I88bgKQUwDYDEXConVNEBlyFlCcacJTtlV3V6ZBA
 PCTN2SfEQD35Sdo8Gv93x1+qu6LrmgvRfZRg5qxldp9EHrWjBijPrHPsVzH2LfQjEr9+
 Ll2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TbBIbqC8DAFbPFSiL7x/czfUd8Ri1dHtd4Wy4OMwCtE=;
 b=NVjV54Ix2iTn3RWBKCgXI8SR5RCtcFrKiFYoeORAr6C4LcaNzdTDtdCFRDdeG3z1II
 ym4Fb4VVHHDm2AyZgd6x/ZwW3JCR5VTuuqnr1dMCRvMemZpH+tipvzON8hHPpZelnqgw
 jfDoVnFbyTrQ+GMObiLRkfUUZ/iNNlWEPp/g9J3p5Cvb2TH3pgFSdx8tTCoIAdhzJ7ug
 WvYEKVLW5TVNvWvudCVJ+DtAYjPK7vQ2aJJYJg/a9B8iCKcEk0h3LmfRGUI21K5O70ns
 HL0VfI5z1PC4mFs7v3iDuQa6tGsiJezSda70LtJS3tLkPq/+3g3Xr72lYMVczCovipYO
 UpvQ==
X-Gm-Message-State: AOAM531r82/r+XEVaN0ewmnfX3H8H1YDhm+mPXDZoa6+hzIxU+eZof+2
 H7ptyZkTKodiA3aW369Raw3VGhdU8qYs20tSO8I=
X-Google-Smtp-Source: ABdhPJxK3n4NYTLiNOVehda6ZI4fd68di0A5O3p4cFTtXkGxfTq+DvTtTbUQOEd4JfHQ+QH+VuoqcA==
X-Received: by 2002:a17:90a:c285:: with SMTP id
 f5mr9026834pjt.87.1602313023069; 
 Fri, 09 Oct 2020 23:57:03 -0700 (PDT)
Received: from localhost.localdomain ([49.207.200.2])
 by smtp.gmail.com with ESMTPSA id g3sm13947340pjl.6.2020.10.09.23.56.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2020 23:57:02 -0700 (PDT)
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
To: 
Date: Sat, 10 Oct 2020 12:26:23 +0530
Message-Id: <20201010065623.10189-1-anant.thazhemadam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Anant Thazhemadam <anant.thazhemadam@gmail.com>, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, Oliver Neukum <oneukum@suse.com>,
 linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-kernel-mentees] [PATCH] net: usb: usbnet: update
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

Currently, __usbnet_{read|write}_cmd() use usb_control_msg().
However, this could lead to potential partial reads/writes being
considered valid, and since most of the callers of
usbnet_{read|write}_cmd() don't take partial reads/writes into account
(only checking for negative error number is done), and this can lead to
issues.

However, the new usb_control_msg_{send|recv}() APIs don't allow partial
reads and writes.
Using the new APIs also relaxes the return value checking that must
be done after usbnet_{read|write}_cmd() is called.

Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
---
Since not all callers of usbnet_{read|write}_cmd() check if a complete 
read/write happened, partial reads can go unnoticed.

This issue was briefly mentioned here.
	https://lore.kernel.org/linux-usb/1565777764.25764.4.camel@suse.com/

Using the new API in place of the old one doesn't break anything.
This is mainly because usb_control_msg_{send|recv}() returns 0 on success
and a negative error number on failure (which includes partial reads/writes).

Thus, the error checking condition provided by the present callers of 
usbnet_{read|write}_cmd() for failure (return value < 0 is considered as an 
error) will hold. 
And similarly, the condition checked by some callers for 'success' 
(return value >= 0 && return value < length/size) will also hold.

However, if I have missed out on any caller that this might cause problems with,
please let me know, and I will fix that up as well.

 drivers/net/usb/usbnet.c | 52 ++++++++--------------------------------
 1 file changed, 10 insertions(+), 42 deletions(-)

diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
index bf6c58240bd4..dd9fe530a374 100644
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
+			USB_CTRL_SET_TIMEOUT, GPF_KERNEL);
 }
 
 /*
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
