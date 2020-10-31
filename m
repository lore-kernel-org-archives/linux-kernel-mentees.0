Return-Path: <SRS0=CDUK=EG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90B16C55179
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 31 Oct 2020 21:35:44 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EE13206F9
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 31 Oct 2020 21:35:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JSFxhC8e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EE13206F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D254A8759A;
	Sat, 31 Oct 2020 21:35:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 57z2o2nfjsI1; Sat, 31 Oct 2020 21:35:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 603F287599;
	Sat, 31 Oct 2020 21:35:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 47F0AC088B;
	Sat, 31 Oct 2020 21:35:43 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B0BDAC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 21:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9ED758759A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 21:35:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 47VbnUfSSioJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 21:35:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0A30E87599
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 21:35:41 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id h4so1198933pjk.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 14:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wfCT45RfkJARqEdgNwcfbDfcbSKvbfRG89bIaFDMst0=;
 b=JSFxhC8embsdBlmRAd/0qfuxccXL+iaUC6GWCe1N4R/3m9+Ut4QX19B5yud2sBMovS
 CXKiz52hK30PKf7pjqduUDpiqRGkGPg9scwlsn+EsuWqq8UR0GIbMc5tTwZ7eil50Rde
 n4ygmICjE6YSPa2l+M7x/dzxM7AsAjZc2lgBXtFt3xdBFBEXkTD4U7VCy+io8g4g0gOl
 Rssycrx4EvS6454W6yzK7MKFZtLd3VO0jwx80xCWNbO58Om16SjzwArW62UrpL61X8Lh
 upjFesRYL/1S1bz8ejZSz4bjK4bqreu2ZM0Hts0GgsOXO9ivdS0X/0USVzSpGrcDBAqE
 1+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wfCT45RfkJARqEdgNwcfbDfcbSKvbfRG89bIaFDMst0=;
 b=gQv+DXAIZ4EMYFPKSYLsj+vsjhnX8k+snuUQM3w920j846lf0jP2IvQ8wxP0QEsEHI
 quZrzWrKOZR+42JlhgFaZQZm3C7fhyC8P1x9WF/wlAk+lq+cZabKdLIez1f1tmMNX6uG
 tP+YkwsplZqfrz1GlmSNSUEWeTVyix87C9Pro09LAW+4HQXO+k1XjFfoMvK1x3hBOzwC
 P52su+RoYZJfhRat5311ZBMjRZrm4LqFh2clhpDALQsPwhKusDO6jTgSJmgCgzpTlIRE
 mXceg4iUnrG+5wGKGc1Gio6d+1dRyz6FXgjqQzJDJvdsMvL1JsvkB08UzunVhnMPYxTH
 wjdQ==
X-Gm-Message-State: AOAM533xB7HwZl9tRHGyg+fgRjNxGK7OM+/+0mPnYIDhsqpNL7ugfob8
 YkcWq1jo5XzS3TgvigspyJA=
X-Google-Smtp-Source: ABdhPJzIlWkoN797x3ywygdN18Gump/LE3OvdSCnv0RMA1pQVAkHpY20FVxifomV5tADNP1kB3rwmw==
X-Received: by 2002:a17:90b:180d:: with SMTP id
 lw13mr155056pjb.149.1604180140454; 
 Sat, 31 Oct 2020 14:35:40 -0700 (PDT)
Received: from localhost.localdomain ([49.207.221.93])
 by smtp.gmail.com with ESMTPSA id l123sm104958pfd.97.2020.10.31.14.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2020 14:35:39 -0700 (PDT)
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
To: Oliver Neukum <oneukum@suse.com>, "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>
Date: Sun,  1 Nov 2020 03:05:33 +0530
Message-Id: <20201031213533.40829-1-anant.thazhemadam@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201029132256.11793-1-anant.thazhemadam@gmail.com>
References: <20201029132256.11793-1-anant.thazhemadam@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, Anant Thazhemadam <anant.thazhemadam@gmail.com>,
 linux-usb@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v3] net: usb: usbnet: update
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
Changes in v3:
	* Aligned continuation lines after the opening brackets
Changes in v2:
	* Fix build error

 drivers/net/usb/usbnet.c | 52 ++++++++--------------------------------
 1 file changed, 10 insertions(+), 42 deletions(-)

diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
index bf6c58240bd4..b2df3417a41c 100644
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
+				    cmd, reqtype, value, index, data, size,
+				    USB_CTRL_GET_TIMEOUT, GFP_KERNEL);
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
+				    cmd, reqtype, value, index, data, size,
+				    USB_CTRL_SET_TIMEOUT, GFP_KERNEL);
 }
 
 /*
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
