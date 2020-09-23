Return-Path: <SRS0=Dbq6=DA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6383FC4727E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 09:06:49 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E345C20838
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 09:06:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="t45qHV5x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E345C20838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 72C6C8607A;
	Wed, 23 Sep 2020 09:06:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p4MhtvSWUbN1; Wed, 23 Sep 2020 09:06:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0F04F860D1;
	Wed, 23 Sep 2020 09:06:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0B27DC0889;
	Wed, 23 Sep 2020 09:06:48 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CB460C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 09:06:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id AF215228E7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 09:06:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lw1ewI0zq73c
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 09:06:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 8FF37203F4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 09:06:45 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id j7so6489049plk.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 02:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ohqofdSobCRCHUofKcLY6g/yoMPZMTZlQOhkO7ROpIc=;
 b=t45qHV5xy9oCsiCxleGrHt9GVIvdSr7r/29ELFE6fyyIECqNBASF2IXz4aPPAoDY5K
 K+p3/cSNcE6Ww4N/oMMXunz5zmcBJMYvhX/qM1RMr2x7AM0HOHFNMj6azREPcp43F/Kl
 pPprwzv1qQWoDeBNz/Ul9ZzeDRQqzuxtTU8eBsB9AS6CPCyLQKdL0aaPV5QsFpBbCTgR
 2hd1YWTeOo9lOaUcdgo6KfzXKCRR5QtNacpdldsFCbU7dBdboewwGqo/oAwfQYc5Z4kf
 n8IQkOXkhXrANnzYIxbN4jp9x+At41CD7vWYCO/UfSr2d5SENYvOM8tyJsvivjPTn4+z
 o0dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ohqofdSobCRCHUofKcLY6g/yoMPZMTZlQOhkO7ROpIc=;
 b=KYwjQNzIDRCI50qibAncOqluzwiqLyDZ1IRS2TiZmeWkIJa/a6r5Fkx9D+IGpAcJcX
 0N0z5tG41xNM6y7k/gTQ8PlNyuFmbCOKIa4fTVG4QU50N2vLlnh8Kpo0JMyBnUZZObRA
 +rm4ubD3RSQtgcGtmFYPPnQ4prci+WB4XEP8dV8x2dduGbx7zgoNkPqHQWuXvt/ICUKu
 yTl6eywmxN9VNYfdgWKUA9y1+E/7FETJwhaO77W6Rrc4XGx/CcVkSWUEaBm8QYahv7g7
 7BLJHwt7oyVCjTd/8/9xWmTLgMg/4Bc8vnBBl/yVBIrMM1KvKr7lDBpLTyVYGl1AINIj
 VtqQ==
X-Gm-Message-State: AOAM532st8JWdbK50Eyv9tEZvOPRq2EjIybVxFbRiCupcpTarypJF38T
 cotpNJvdglxE9Lii2NxAYwQ=
X-Google-Smtp-Source: ABdhPJxWZjsJJUAi8SjYqaGIPZnjo6hVFfFI7ws+vWAwRi4JJbhwh0TRZ8zwgoZCawVZ511ar062WA==
X-Received: by 2002:a17:90a:9f09:: with SMTP id
 n9mr7403612pjp.88.1600852004228; 
 Wed, 23 Sep 2020 02:06:44 -0700 (PDT)
Received: from localhost.localdomain ([2405:205:c8e3:4b96:985a:95b9:e0cd:1d5e])
 by smtp.gmail.com with ESMTPSA id a13sm16496226pgq.41.2020.09.23.02.06.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 02:06:43 -0700 (PDT)
From: Himadri Pandya <himadrispandya@gmail.com>
To: davem@davemloft.net, kuba@kernel.org, oneukum@suse.com,
 pankaj.laxminarayan.bharadiya@intel.com, keescook@chromium.org,
 yuehaibing@huawei.com, petkan@nucleusys.com, ogiannou@gmail.com
Date: Wed, 23 Sep 2020 14:35:18 +0530
Message-Id: <20200923090519.361-4-himadrispandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200923090519.361-1-himadrispandya@gmail.com>
References: <20200923090519.361-1-himadrispandya@gmail.com>
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 3/4] net: usb: rtl8150: use
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

Many usage of usb_control_msg() do not have proper error check on return
value leaving scope for bugs on short reads. New usb_control_msg_recv()
and usb_control_msg_send() nicely wraps usb_control_msg() with proper
error check. Hence use the wrappers instead of calling usb_control_msg()
directly.

Signed-off-by: Himadri Pandya <himadrispandya@gmail.com>
---
 drivers/net/usb/rtl8150.c | 32 ++++++--------------------------
 1 file changed, 6 insertions(+), 26 deletions(-)

diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
index 733f120c852b..e3002b675921 100644
--- a/drivers/net/usb/rtl8150.c
+++ b/drivers/net/usb/rtl8150.c
@@ -152,36 +152,16 @@ static const char driver_name [] = "rtl8150";
 */
 static int get_registers(rtl8150_t * dev, u16 indx, u16 size, void *data)
 {
-	void *buf;
-	int ret;
-
-	buf = kmalloc(size, GFP_NOIO);
-	if (!buf)
-		return -ENOMEM;
-
-	ret = usb_control_msg(dev->udev, usb_rcvctrlpipe(dev->udev, 0),
-			      RTL8150_REQ_GET_REGS, RTL8150_REQT_READ,
-			      indx, 0, buf, size, 500);
-	if (ret > 0 && ret <= size)
-		memcpy(data, buf, ret);
-	kfree(buf);
-	return ret;
+	return usb_control_msg_recv(dev->udev, 0, RTL8150_REQ_GET_REGS,
+				    RTL8150_REQT_READ, indx, 0, data,
+				    size, 500);
 }
 
 static int set_registers(rtl8150_t * dev, u16 indx, u16 size, const void *data)
 {
-	void *buf;
-	int ret;
-
-	buf = kmemdup(data, size, GFP_NOIO);
-	if (!buf)
-		return -ENOMEM;
-
-	ret = usb_control_msg(dev->udev, usb_sndctrlpipe(dev->udev, 0),
-			      RTL8150_REQ_SET_REGS, RTL8150_REQT_WRITE,
-			      indx, 0, buf, size, 500);
-	kfree(buf);
-	return ret;
+	return usb_control_msg_send(dev->udev, 0, RTL8150_REQ_SET_REGS,
+				    RTL8150_REQT_WRITE, indx, 0, data,
+				    size, 500);
 }
 
 static void async_set_reg_cb(struct urb *urb)
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
