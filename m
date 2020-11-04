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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92D38C388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Nov 2020 06:48:24 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 188452222B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Nov 2020 06:48:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iCE670pQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 188452222B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8CEC286B41;
	Wed,  4 Nov 2020 06:48:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E90y7Oe1k9Bn; Wed,  4 Nov 2020 06:48:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 24642868D4;
	Wed,  4 Nov 2020 06:48:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 21230C088B;
	Wed,  4 Nov 2020 06:48:22 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 59208C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5325B8749A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:48:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mwsf6UuRbIEM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:48:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4E5158746C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:48:19 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id w11so9821933pll.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Nov 2020 22:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=txw7VexweucfLOC8DKUSmw/Pbo6mBmR3atijpGysA14=;
 b=iCE670pQ4lYbvgpa2WSgZrx62oRISLwyeX3gsg+drYwun6OT/Ax86dlZecFvfEOuNV
 N0LfEiiuNKLNQlQ55gkerkqxqsKGPM5awSOpMM4FIVz4/XEM0F4WC+TslImeVeb/vBML
 gIr+G5w8kUpy0/aBLvtEBpXUnzoDZET2SOyQpoUvVUoj1xrzPFh5YzpuyTQDaMgMKQBo
 sMMr2JEYJAtBLAp2eolhN0zpS6ZpfU/SPSOis8DFrhfwzhlJVrLkvVrZH/h8bZB4qzJT
 doIl5IOpvb6Y5RryTCtpyf3U6eGB2bCEM/QA23LpGynYLRXwuzJVoyb5hqRMk8iNeRN9
 vs1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=txw7VexweucfLOC8DKUSmw/Pbo6mBmR3atijpGysA14=;
 b=U0lZMJIuBVWeZQLeuttlMQ39AEHN3IRaqxnUUAs4GQpu1CvcogrVYLP1jStOlX8CWp
 znQJyBNpmTgBD4kAqJj1BJYuGtBrjphVxI26vcWNErRaCPtIph9O198WshPbd5ZW6tWk
 7/h9Po10tr2Pw4KCQtPzTMIf+U2iIKyzQOUGxtIdEJfTGea5YR+S+KLSesaNFtIUL5t/
 cfzHrw35FgPfsbof46GY1G3QPPcujmwGStREjzFuRlSeA1j2jIMjFAbc+CyMvDXnEWzJ
 1ZrTZ5l3zJiUqwOyoEUmapKAR6seAeOZd299vcjjFieyb3XS6vHup43EQoDS9ItR04He
 mfkg==
X-Gm-Message-State: AOAM530kK65hhZPlWdHRsDIwQVebMOzGcBHdmni+e4qE8Or76f0t+bya
 S8uuxhJ3TbrkPnHbnlgV2RE=
X-Google-Smtp-Source: ABdhPJw3Mli9dEzf7RX1ydq7l+a9Gpmq8nGi25EshURUUZ7k4Dp5tWy8+ySE6k0jE13aXGKJXoLRLA==
X-Received: by 2002:a17:902:ab85:b029:d6:b5d2:b6fd with SMTP id
 f5-20020a170902ab85b02900d6b5d2b6fdmr17595747plr.9.1604472498960; 
 Tue, 03 Nov 2020 22:48:18 -0800 (PST)
Received: from localhost.localdomain
 ([2402:3a80:16e6:8166:e462:9fba:da9c:beed])
 by smtp.gmail.com with ESMTPSA id s18sm1036873pgh.60.2020.11.03.22.48.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 22:48:18 -0800 (PST)
From: Himadri Pandya <himadrispandya@gmail.com>
To: johan@kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed,  4 Nov 2020 12:17:01 +0530
Message-Id: <20201104064703.15123-14-himadrispandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201104064703.15123-1-himadrispandya@gmail.com>
References: <20201104064703.15123-1-himadrispandya@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 13/15] usb: serial: iuu_phoenix: use
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
 drivers/usb/serial/iuu_phoenix.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/serial/iuu_phoenix.c b/drivers/usb/serial/iuu_phoenix.c
index b4ba79123d9d..dfbcdcec94e7 100644
--- a/drivers/usb/serial/iuu_phoenix.c
+++ b/drivers/usb/serial/iuu_phoenix.c
@@ -968,9 +968,8 @@ static int iuu_open(struct tty_struct *tty, struct usb_serial_port *port)
 	priv->poll = 0;
 
 #define SOUP(a, b, c, d)  do { \
-	result = usb_control_msg(port->serial->dev,	\
-				usb_sndctrlpipe(port->serial->dev, 0),	\
-				b, a, c, d, NULL, 0, 1000); \
+	result = usb_control_msg_send(port->serial->dev, 0, b, a, c, d, NULL,\
+				      0, 1000, GFP_KERNEL);		     \
 	dev_dbg(dev, "0x%x:0x%x:0x%x:0x%x  %d\n", a, b, c, d, result); } while (0)
 
 	/*  This is not UART related but IUU USB driver related or something */
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
