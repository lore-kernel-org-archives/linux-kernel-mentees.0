Return-Path: <SRS0=+n2V=LO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B4CCC48BDF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 20 Jun 2021 19:45:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D01C61001
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 20 Jun 2021 19:45:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D01C61001
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE62340370;
	Sun, 20 Jun 2021 19:45:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lMZNKKRk1fSy; Sun, 20 Jun 2021 19:45:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id CE44F40369;
	Sun, 20 Jun 2021 19:45:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B7950C000E;
	Sun, 20 Jun 2021 19:45:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D43ECC000C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Jun 2021 19:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4DC6400C9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Jun 2021 19:45:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UyzilIYmJtK4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Jun 2021 19:45:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D002040025
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Jun 2021 19:45:39 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id x24so26435678lfr.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Jun 2021 12:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+W/O6gOP6IW6u1NkP1013U+G2XvQ//6bD4DQBNJYUMU=;
 b=tUz4xde1JRGigviwrH3tb3lX2Ricb55oLB+6TE6UCbW235XiKNhsH/LZyKtclCGPK3
 Dr8hfK5rWAZGzdEjtm7gVKbEEmxYFhxK246MN1CmSFuGaziDINBipKXnX0mdz/0BtI/D
 dj7IXWX6EI9iODePoDwNQrbH2VZeXo3YIDnigt1am7Ur2XdsvP583KFrznmlxySW3c1U
 4ltSEXw9nF6d9SAKM+D/zjUUjUFazCVY/gIgGedbeYm9uJisc1zrgt9Bzf12A3CMoxtP
 /+1ST49RA4fdtSmWqlYF6M4m/lX6ayYGh+uzSgVVpkrDLXAWtiddDesSmtX9O4iFw+h3
 +ipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+W/O6gOP6IW6u1NkP1013U+G2XvQ//6bD4DQBNJYUMU=;
 b=rkcwaH9QIXYyqzZ9lfdXOFvY2JbjutqyKDQzvJKlEaZLAh/WymGFEccANfQxDTgZP0
 B5Pf5P6+12q9TmlEG0I4rpDmGqy7jEpgGaN5lZ8eXaNUP6+dqzzU960QZHpc6jECfn6W
 HGr826jlYRebxr9DxZ1HXGsyhPS2KIG2loTJKFs0Gx2lHrpQS7fWFY8D8WpzsIGgB2iz
 qQwnZdDdzTFir6hPkj9PE0BsPrletWDffXInHb85kcWJEVyIggQd2HDvcAWBmQCVdTpQ
 SMsUhlblm1e4LF21iNX+18iVt9CanL8F0faGXKfDufazTeJIb8g6Dg4g1CmRZUFB5Kfr
 R01w==
X-Gm-Message-State: AOAM533ZRflhYx9rIFyYjnlAgwoThcsQLBEYE1jVPw4NTiwI0h1o6f8N
 OxFKETHacflVM9B80nbcomM=
X-Google-Smtp-Source: ABdhPJxMf0lULcoAzc5DdX2YIKkaMEj1RP7S5PCazPu7TPz+KtwbMVAtsfmdHip+xoPolH8NnDtbKw==
X-Received: by 2002:ac2:46c2:: with SMTP id p2mr2008492lfo.125.1624218337822; 
 Sun, 20 Jun 2021 12:45:37 -0700 (PDT)
Received: from localhost.localdomain ([94.103.229.24])
 by smtp.gmail.com with ESMTPSA id f8sm1928330ljj.110.2021.06.20.12.45.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 12:45:37 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: hverkuil-cisco@xs4all.nl, mchehab@kernel.org, oneukum@suse.com,
 gregkh@suse.de
Subject: [PATCH 1/2] media: go7007: fix memory leak in go7007_usb_probe
Date: Sun, 20 Jun 2021 22:45:02 +0300
Message-Id: <fd632c9a289eb28ded37b573e999a8f4e7402ca3.1624217907.git.paskripkin@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1624217907.git.paskripkin@gmail.com>
References: <cover.1624217907.git.paskripkin@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
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

In commit 137641287eb4 ("go7007: add sanity checking for endpoints")
endpoint sanity check was introduced, but if check fails it simply
returns with leaked pointers.

Cutted log from my local syzbot instance:

BUG: memory leak
unreferenced object 0xffff8880209f0000 (size 8192):
  comm "kworker/0:4", pid 4916, jiffies 4295263583 (age 29.310s)
  hex dump (first 32 bytes):
    30 b0 27 22 80 88 ff ff 75 73 62 2d 64 75 6d 6d  0.'"....usb-dumm
    79 5f 68 63 64 2e 33 2d 31 00 00 00 00 00 00 00  y_hcd.3-1.......
  backtrace:
    [<ffffffff860ca856>] kmalloc include/linux/slab.h:556 [inline]
    [<ffffffff860ca856>] kzalloc include/linux/slab.h:686 [inline]
    [<ffffffff860ca856>] go7007_alloc+0x46/0xb40 drivers/media/usb/go7007/go7007-driver.c:696
    [<ffffffff860de74e>] go7007_usb_probe+0x13e/0x2200 drivers/media/usb/go7007/go7007-usb.c:1114
    [<ffffffff854a5f74>] usb_probe_interface+0x314/0x7f0 drivers/usb/core/driver.c:396
    [<ffffffff845a7151>] really_probe+0x291/0xf60 drivers/base/dd.c:576

BUG: memory leak
unreferenced object 0xffff88801e2f2800 (size 512):
  comm "kworker/0:4", pid 4916, jiffies 4295263583 (age 29.310s)
  hex dump (first 32 bytes):
    00 87 40 8a ff ff ff ff 00 00 00 00 00 00 00 00  ..@.............
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<ffffffff860de794>] kmalloc include/linux/slab.h:556 [inline]
    [<ffffffff860de794>] kzalloc include/linux/slab.h:686 [inline]
    [<ffffffff860de794>] go7007_usb_probe+0x184/0x2200 drivers/media/usb/go7007/go7007-usb.c:1118
    [<ffffffff854a5f74>] usb_probe_interface+0x314/0x7f0 drivers/usb/core/driver.c:396
    [<ffffffff845a7151>] really_probe+0x291/0xf60 drivers/base/dd.c:576

Fixes: 137641287eb4 ("go7007: add sanity checking for endpoints")
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/media/usb/go7007/go7007-usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/go7007/go7007-usb.c b/drivers/media/usb/go7007/go7007-usb.c
index dbf0455d5d50..eeb85981e02b 100644
--- a/drivers/media/usb/go7007/go7007-usb.c
+++ b/drivers/media/usb/go7007/go7007-usb.c
@@ -1134,7 +1134,7 @@ static int go7007_usb_probe(struct usb_interface *intf,
 
 	ep = usb->usbdev->ep_in[4];
 	if (!ep)
-		return -ENODEV;
+		goto allocfail;
 
 	/* Allocate the URB and buffer for receiving incoming interrupts */
 	usb->intr_urb = usb_alloc_urb(0, GFP_KERNEL);
-- 
2.32.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
