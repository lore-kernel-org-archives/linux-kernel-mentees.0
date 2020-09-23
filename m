Return-Path: <SRS0=Dbq6=DA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 787B4C2D0A8
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 09:06:30 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5F6D2075B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 09:06:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dISF/+v1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5F6D2075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 34F7E860D1;
	Wed, 23 Sep 2020 09:06:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3jrzs2Qq2nlF; Wed, 23 Sep 2020 09:06:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C966A8607A;
	Wed, 23 Sep 2020 09:06:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B8FC8C0889;
	Wed, 23 Sep 2020 09:06:28 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 14626C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 09:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 00DF186B2C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 09:06:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y+PETubhZSAk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 09:06:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9298586AD4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 09:06:25 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id k8so14662533pfk.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 02:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9wqyDxCNM1ZmfXa7nbXb7Mn0Y5gUAzSUKtchYYWUpJU=;
 b=dISF/+v1MKuq0CK2motDdh3V2whOwEUQ0JQa9nsULg7BgNFuOPOPMev3ItuaoT6cyr
 18ahUyW73hY7lapUSnFqh6NOYsMuKbkZD1MdUOHCa4uRofa/fH1CtoQC9tQlZnonvfOB
 WcBRQK4uSS/5hj76YHa03/UiGig/VrVOWFXlj7MJnml8TzkSF2qbgcPvjxUzV/qCNKir
 fmTucJV/ocmQkG3ZzjFmjP0T/a+Aku9HRlPiw4hlDRRsRBAlDAw11KPIe9nApFpl4dZu
 H1Z+EdbICMo9FNe70JlKq0iq4g8PFVFSBugHYGWewVMvTTK8lGYxnQXQ18H6K4gARDWK
 u/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9wqyDxCNM1ZmfXa7nbXb7Mn0Y5gUAzSUKtchYYWUpJU=;
 b=bwqTNtKfWbBbLubXcXs0AKaZ59ZzXrltTg6BIenwN4vOQpwEuB0Gn0RQbX+rHQqYcr
 0Ry5Z0DW7AICB590O2vIz0dk811ffPmwiKb7Ibokw+6/qU5XAixGaYKGSnt6sxEFWyDw
 Qw7VJAHdWhDTfiA1xaX8nq2eGinwfP2ReT9yCF8eVh5fBUHCKz6LQECsLJWMZtS83aeQ
 TF1bkjFIu9dSd6pwqUbR+QNNO9JoovTBqJ5Ve8pXGYofPtUG3uWdDpsCR/KDbOYP8ggB
 HSnzhaBb4zTsS8z8srxgDMnw/v6WAesOQph+FeLQJ3EiCL3yfKHsCKjGz4vgA5f0mZWF
 Qr+w==
X-Gm-Message-State: AOAM5307UAskBGvQ+J5Q3wge6VHai/oUk4xtKhVjh/VrwnmTpPtQf/BG
 cxpla34PHYiO+vDvc64/AxA=
X-Google-Smtp-Source: ABdhPJxaQQZDbcNj1V/nmPJgyNv/1vOPTcJ94kyuQKAHILMIKBY+cdozA5yX3z9UKcfNL8ZFpPuX2Q==
X-Received: by 2002:a63:a548:: with SMTP id r8mr6914557pgu.256.1600851985200; 
 Wed, 23 Sep 2020 02:06:25 -0700 (PDT)
Received: from localhost.localdomain ([2405:205:c8e3:4b96:985a:95b9:e0cd:1d5e])
 by smtp.gmail.com with ESMTPSA id a13sm16496226pgq.41.2020.09.23.02.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 02:06:24 -0700 (PDT)
From: Himadri Pandya <himadrispandya@gmail.com>
To: davem@davemloft.net, kuba@kernel.org, oneukum@suse.com,
 pankaj.laxminarayan.bharadiya@intel.com, keescook@chromium.org,
 yuehaibing@huawei.com, petkan@nucleusys.com, ogiannou@gmail.com
Date: Wed, 23 Sep 2020 14:35:16 +0530
Message-Id: <20200923090519.361-2-himadrispandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200923090519.361-1-himadrispandya@gmail.com>
References: <20200923090519.361-1-himadrispandya@gmail.com>
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 1/4] net: usbnet: use
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

Potential incorrect use of usb_control_msg() has resulted in new wrapper
functions to enforce its correct usage with proper error check. Hence
use these new wrapper functions instead of calling usb_control_msg()
directly.

Signed-off-by: Himadri Pandya <himadrispandya@gmail.com>
---
 drivers/net/usb/usbnet.c | 46 ++++------------------------------------
 1 file changed, 4 insertions(+), 42 deletions(-)

diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
index 2b2a841cd938..a38a85bef46a 100644
--- a/drivers/net/usb/usbnet.c
+++ b/drivers/net/usb/usbnet.c
@@ -1982,64 +1982,26 @@ EXPORT_SYMBOL(usbnet_link_change);
 static int __usbnet_read_cmd(struct usbnet *dev, u8 cmd, u8 reqtype,
 			     u16 value, u16 index, void *data, u16 size)
 {
-	void *buf = NULL;
-	int err = -ENOMEM;
-
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
+	return usb_control_msg_recv(dev->udev, 0,
+			      cmd, reqtype, value, index, data, size,
 			      USB_CTRL_GET_TIMEOUT);
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
+	return usb_control_msg_send(dev->udev, 0,
+			      cmd, reqtype, value, index, data, size,
 			      USB_CTRL_SET_TIMEOUT);
-	kfree(buf);
-
-out:
-	return err;
 }
 
 /*
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
