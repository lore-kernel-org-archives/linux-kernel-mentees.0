Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E139C25B0F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 14 Aug 2022 14:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DACA660BC8;
	Sun, 14 Aug 2022 14:25:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DACA660BC8
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iW7PUTkW
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4qVVuDIY2lkg; Sun, 14 Aug 2022 14:25:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 243AB600C5;
	Sun, 14 Aug 2022 14:25:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 243AB600C5
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E5678C0033;
	Sun, 14 Aug 2022 14:25:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F2AA4C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Aug 2022 14:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2C02410CB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Aug 2022 14:25:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2C02410CB
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=iW7PUTkW
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JDw9vYJ4n4tJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Aug 2022 14:25:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E2D6410CA
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9E2D6410CA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Aug 2022 14:25:51 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id d71so4633139pgc.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Aug 2022 07:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=cmiC4GyXrivAdN89C1L8XiqqWpho7GqZlZeaKyCMglU=;
 b=iW7PUTkWbQ4GdHHEteuCNQQ5Ss7ljIOtKksm4RzTJDCRMkFQ216uH9eyBZ2pMHgX9g
 PuNmNy51O5WWstLXa0FBpetTeHuSGSgl1VKN6FAvouYLBuiUerRTuHGUXVf2liVticay
 NmUUq3xL7EiuE6XJXJB5otVI+ST8+hjNF4J+gCF/8YjDvLGPcPLiZKC+7OfA19SLMBIv
 ddLNMlG1E3UDFQleHPX5KNluWSKFhQ7b7qCRVdJ8tHNHzlJGR090oBkuHIuUTD7E6i3z
 QWWa6wvoTrbbBFCWbxBVes1c7haTDs/qD2qZIlC2p5lTzK2RPl0HbtC2aCNZxUn0+yNP
 2uYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=cmiC4GyXrivAdN89C1L8XiqqWpho7GqZlZeaKyCMglU=;
 b=2I8EMCFidlV0Tk4UXPZl7Gbk+siCvx/TvJC2R6B0Ma/fMsvOSDSReGBqf4QQwxw8Yn
 ptMSyPHsXbeKe9GmMKN011ury8KTB+lXBPh+zfOVd3BWSEU/bUpntWv6RCZwj5aE1JDk
 8OG+5l6bmzERW0C8wnhf1vGI14OWecNqLEnVkNWZyD69AI7FdAeXGZc8NaXL5kAuwOG+
 GXtQFJoISRq5kaqHl8jzPWDluLoxtUsUuIElQd/RR73CxYqssXmWxSWPBsO2zu1tB+fV
 tIDJeQ+daGDDUXHXu3yypvvMSuYIqMy+l0uQvBalC7YMeN9m1EJfeHklqbUuVSsOR7+2
 66Eg==
X-Gm-Message-State: ACgBeo2g5scKZybm0sMnuv5UveyNjKnAMUa9FydkYzxjZUq9QNxw4DL7
 HI2xTsvL9Xv/NfKmQBKghnY=
X-Google-Smtp-Source: AA6agR5oNGtoZK4xcKJgsKFitJ58zTxZ2oiNPpciipm5RltIv8qLg6CwX2m+LTMXM1+WO4RhZqI7NQ==
X-Received: by 2002:a63:1208:0:b0:423:c60e:ed09 with SMTP id
 h8-20020a631208000000b00423c60eed09mr6082759pgl.385.1660487150954; 
 Sun, 14 Aug 2022 07:25:50 -0700 (PDT)
Received: from biggie.. ([103.230.148.189]) by smtp.gmail.com with ESMTPSA id
 s6-20020a170902ea0600b0016dc6279ab7sm5491340plg.149.2022.08.14.07.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 07:25:50 -0700 (PDT)
From: Gautam Menghani <gautammenghani201@gmail.com>
To: sean@mess.org,
	mchehab@kernel.org
Subject: [PATCH] drivers/media/rc: Ensure usb_submit_urb() is not called if
 write is in progress
Date: Sun, 14 Aug 2022 19:55:42 +0530
Message-Id: <20220814142543.24910-1-gautammenghani201@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: hdanton@sina.com, linux-kernel@vger.kernel.org,
 syzbot+0c3cb6dc05fbbdc3ad66@syzkaller.appspotmail.com,
 Gautam Menghani <gautammenghani201@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
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

The warning "URB submitted while active" is reported if the function
send_packet() in imon.c is called if a write is already is in progress.
Add a check to return -EBUSY in case a write is already is in progress.
Also, mark tx.busy as false after transmission is completed.

Fixes: 21677cfc562a ("V4L/DVB: ir-core: add imon driver")
Cc: hdanton@sina.com
Suggested-by: hdanton@sina.com
Link: https://syzkaller.appspot.com/bug?id=e378e6a51fbe6c5cc43e34f131cc9a315ef0337e
Reported-by: syzbot+0c3cb6dc05fbbdc3ad66@syzkaller.appspotmail.com
Signed-off-by: Gautam Menghani <gautammenghani201@gmail.com>
---
 drivers/media/rc/imon.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
index 735b925da998..a5b997c2c7e2 100644
--- a/drivers/media/rc/imon.c
+++ b/drivers/media/rc/imon.c
@@ -598,6 +598,8 @@ static int send_packet(struct imon_context *ictx)
 	int retval = 0;
 	struct usb_ctrlrequest *control_req = NULL;
 
+	if (ictx->tx.busy)
+		return -EBUSY;
 	/* Check if we need to use control or interrupt urb */
 	if (!ictx->tx_control) {
 		pipe = usb_sndintpipe(ictx->usbdev_intf0,
@@ -654,6 +656,7 @@ static int send_packet(struct imon_context *ictx)
 			pr_err_ratelimited("task interrupted\n");
 		}
 		mutex_lock(&ictx->lock);
+		ictx->tx.busy = false;
 
 		retval = ictx->tx.status;
 		if (retval)
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
