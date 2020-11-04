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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77970C55178
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Nov 2020 06:48:10 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 079C122277
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Nov 2020 06:48:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rdS5MU5L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 079C122277
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A3EB022708;
	Wed,  4 Nov 2020 06:48:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pdBMY31MvE25; Wed,  4 Nov 2020 06:48:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id ED10F2155B;
	Wed,  4 Nov 2020 06:48:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DC7E8C088B;
	Wed,  4 Nov 2020 06:48:08 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5A741C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 55388220C1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:48:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m5YZ5Qb6zTpW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:48:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 889FB2155B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:48:07 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id w65so16510756pfd.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Nov 2020 22:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UZc9qlgFs8CbchOrOL+r6fXR+9YC4L2N3YMq7bhJ0+0=;
 b=rdS5MU5L79qRpQTiXpdQThWirVZOcLRFimad1oO/csh5TOxT5lXTLaOvUbMGHrEa86
 ab8w6iGGzfk4onE5Gy482ldjBhqdEgPQ9NKbtnkuzxqHkb2MCRJ4+M9FwuXD+ORRdCGx
 gbZEP3TAX4uCrjWdpnSMmOxeOMd13gUSgN2DpyPjCzCsnYQqo/5Eyi3nGUp8dvnUIN0O
 QKdnsTUJnW02HNyreYJw2ZvEtDV/49ayJqMiWt4cRtx7fMuasv5dfMlVRbkhrAZaqBts
 MDV60SWeUdBGNSg70uw8g08QTs9Z79NjWncRGlMnOcDwtRtxQJcYUt/No1+sou/8kpWb
 LFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UZc9qlgFs8CbchOrOL+r6fXR+9YC4L2N3YMq7bhJ0+0=;
 b=oIcU4Z9vH28gr0xb6ZY9DSIdLzV1JER9nzoX/KpJbClRLb8/JK4Xgb9M3mTWDRt54T
 b/e846sGp/HP5YpoH0gsed4WSWkNC8Ljbtq0di4aI0eAGLhEXD829/iVnYRschCiSiJ4
 tiy3UFGFBf4TOey+3CgLigvtv9z9g8CKJCeGDffK7fCb06YT6mukxDf0FUss3szpHrs6
 9TJysujE1UjuHmcQvQK3rduRa1iiD46zw6H7YNHGLuffOnbaxEk9fReQa/JDafmfQ8Zl
 /qOT+MHSpT3YcngzHXoLU+/k8jPyAKA7cMQ5FYWHHxcg5AjP3rmbT1JCd0DQwnrkFUj1
 vaWg==
X-Gm-Message-State: AOAM530sJFOXZrfV9Dgd6OeC04kAf/J/UpGW/8OSbXUPwV4ciRy2c3X4
 VClMQXzrWWzg2Djbu10cp94=
X-Google-Smtp-Source: ABdhPJyaj/FbrDzFn4tjPMhDjKG6aLzqGg8DFGOw9jnUBvDEGU4Tt0LkYY74y0xtSktHQrE/aDWn5w==
X-Received: by 2002:a17:90a:17ad:: with SMTP id
 q42mr3087081pja.36.1604472487174; 
 Tue, 03 Nov 2020 22:48:07 -0800 (PST)
Received: from localhost.localdomain
 ([2402:3a80:16e6:8166:e462:9fba:da9c:beed])
 by smtp.gmail.com with ESMTPSA id s18sm1036873pgh.60.2020.11.03.22.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 22:48:06 -0800 (PST)
From: Himadri Pandya <himadrispandya@gmail.com>
To: johan@kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed,  4 Nov 2020 12:16:58 +0530
Message-Id: <20201104064703.15123-11-himadrispandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201104064703.15123-1-himadrispandya@gmail.com>
References: <20201104064703.15123-1-himadrispandya@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 10/15] usb: serial: io_ti: use
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
 drivers/usb/serial/io_ti.c | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/serial/io_ti.c b/drivers/usb/serial/io_ti.c
index c327d4cf7928..ab2370b80b3c 100644
--- a/drivers/usb/serial/io_ti.c
+++ b/drivers/usb/serial/io_ti.c
@@ -260,16 +260,12 @@ static int ti_vread_sync(struct usb_device *dev, __u8 request,
 {
 	int status;
 
-	status = usb_control_msg(dev, usb_rcvctrlpipe(dev, 0), request,
-			(USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_IN),
-			value, index, data, size, 1000);
-	if (status < 0)
+	status = usb_control_msg_recv(dev, 0, request, USB_TYPE_VENDOR |
+				      USB_RECIP_DEVICE | USB_DIR_IN, value,
+				      index, data, size, 1000, GFP_KERNEL);
+	if (status)
 		return status;
-	if (status != size) {
-		dev_dbg(&dev->dev, "%s - wanted to write %d, but only wrote %d\n",
-			__func__, size, status);
-		return -ECOMM;
-	}
+
 	return 0;
 }
 
@@ -278,16 +274,12 @@ static int ti_vsend_sync(struct usb_device *dev, u8 request, u16 value,
 {
 	int status;
 
-	status = usb_control_msg(dev, usb_sndctrlpipe(dev, 0), request,
-			(USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_OUT),
-			value, index, data, size, timeout);
-	if (status < 0)
+	status = usb_control_msg_send(dev, 0, request, USB_TYPE_VENDOR |
+				      USB_RECIP_DEVICE | USB_DIR_OUT, value,
+				      index, data, size, timeout, GFP_KERNEL);
+	if (status)
 		return status;
-	if (status != size) {
-		dev_dbg(&dev->dev, "%s - wanted to write %d, but only wrote %d\n",
-			__func__, size, status);
-		return -ECOMM;
-	}
+
 	return 0;
 }
 
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
