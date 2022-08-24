Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FEAC32793
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 24 Aug 2022 13:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AF1C82656;
	Wed, 24 Aug 2022 13:07:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AF1C82656
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZWuwggVw
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0H6L19yW7bkv; Wed, 24 Aug 2022 13:07:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 00389825C7;
	Wed, 24 Aug 2022 13:07:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00389825C7
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C063EC0033;
	Wed, 24 Aug 2022 13:07:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 332ECC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 13:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0BED760F5C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 13:07:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BED760F5C
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZWuwggVw
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v2vVLz-vYFNE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 13:07:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9236260F56
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9236260F56
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 13:07:33 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id x23so15622447pll.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 06:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=8hQNlaNRXsTFWu3o2bv0H8H3dQ4+lM+vaoEV4x76qg4=;
 b=ZWuwggVwhgl+RWG5blvg8JohOdTrZXEfEQHhPT7ykLYdSBw/1aLDHoYVLHGFiGkkjz
 p4Rk12s5pYr0JGSUAhScvCc61YcODUrF3eozBk4JbL+YH+Zvk2owIBU3+ty9xaiTlE2P
 E3V35PYtht2oeMuxZCKnkXsyp5m4+xzjlge81oBWyJzYdiOtAoGiB2uN/92dLDm0csFM
 lj8rAsX/sLisHMZitoHUJHc7vqP9ovFPD/dDHGon5T8X+xadUggDAoykuifJpEotRwCJ
 u8LnB8vLFhunyGzu8NYxW42E2K2rrptrsfGkyN5hIiu0UZnjYZB3M3shydY/CHZdHlpl
 ICuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=8hQNlaNRXsTFWu3o2bv0H8H3dQ4+lM+vaoEV4x76qg4=;
 b=h0VE7ogxg5oiBRGuaojbYLOMVcym/nRi2gY6LdTDbz17NiTqj7phTbDSwd+osHDhkg
 310thhwHn9lzv6w4TY/o/sYIZb1wihazN+de3Eit4SLnuUTRx91dHBB9ty7SRQFgWMzK
 JxA+Qw9A8gn2lgJkwntlS2vvkr6vCg0qJBCKobX18Kq+7YROjD74B7xY0sDMsIUnabIY
 ub4165m5lF3UGMFIcZy8o/W5DRpcLMDXg2cNm55kOlNLSzK4lG/ecYgP0S+gsXWBnFmu
 ZyYCjBNxdcJELkkkBMHkXmLulhbqUpYTFlbhNI7nsgIIyZKFOiIKnI0uQeWpED3c04wZ
 aKgA==
X-Gm-Message-State: ACgBeo1f+0EsLPcFl7mm7JGaUiakDGMALEp6lgBtUZ1HRO/T9f31cJKT
 kZzayJ2+haI91lNIubmWxRo=
X-Google-Smtp-Source: AA6agR6xn/Z0E7zOROHt6LLIPRv549HHXNyJ8KBcJsXZt4wQkIka7KikRb0a2eGY22Bl3jJJ5qc98g==
X-Received: by 2002:a17:903:2049:b0:172:eb95:c61e with SMTP id
 q9-20020a170903204900b00172eb95c61emr13467280pla.74.1661346445857; 
 Wed, 24 Aug 2022 06:07:25 -0700 (PDT)
Received: from fedora.. ([103.159.189.138]) by smtp.gmail.com with ESMTPSA id
 m12-20020a633f0c000000b0041c49af8156sm11096323pga.6.2022.08.24.06.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 06:07:25 -0700 (PDT)
From: Khalid Masum <khalid.masum.92@gmail.com>
To: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: host: Use helper function to get endpoint
Date: Wed, 24 Aug 2022 19:07:02 +0600
Message-Id: <20220824130702.10912-1-khalid.masum.92@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Cc: Arnd Bergmann <arnd@arndb.de>, Kishon Vijay Abraham I <kishon@ti.com>,
 Alexey Sheplyakov <asheplyakov@basealt.ru>,
 Matthias Kaehlcke <mka@chromium.org>, Alan Stern <stern@rowland.harvard.edu>,
 Weitao Wang <WeitaoWang-oc@zhaoxin.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

Current implementation to convert urb pipe number to struct 
usb_host_endpoint in rquest_single_step_set_feature_urb is a little
messy. 

Use usb_pipe_endpoint helper function to get the endpoint instead.

Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
---
 drivers/usb/core/hcd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 94b305bbd621..107e29d5d3ae 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -2165,8 +2165,7 @@ static struct urb *request_single_step_set_feature_urb(
 		return NULL;
 
 	urb->pipe = usb_rcvctrlpipe(udev, 0);
-	ep = (usb_pipein(urb->pipe) ? udev->ep_in : udev->ep_out)
-				[usb_pipeendpoint(urb->pipe)];
+	ep = usb_pipe_endpoint(udev, urb->pipe);
 	if (!ep) {
 		usb_free_urb(urb);
 		return NULL;
-- 
2.37.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
