Return-Path: <SRS0=3tBC=JO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87829C433B4
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Apr 2021 12:56:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B884611C2
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Apr 2021 12:56:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B884611C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=anirudhrb.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA3DF60666;
	Sat, 17 Apr 2021 12:56:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eO638MUJO_Qr; Sat, 17 Apr 2021 12:56:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id D88766064A;
	Sat, 17 Apr 2021 12:56:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B1DF3C001A;
	Sat, 17 Apr 2021 12:56:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 62330C0019
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Apr 2021 12:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47D4984714
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Apr 2021 12:56:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=anirudhrb.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OJRlFMp7SEg7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Apr 2021 12:56:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sender4-of-o53.zoho.com (sender4-of-o53.zoho.com
 [136.143.188.53])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B5F5084711
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Apr 2021 12:56:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1618664186; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Kl0qdWuQUh1+VMZEeMoii34QJ1iZfcwS/JZB5vwLosGnVoccjp4ovzRyrZ0NOBQin4qOFjaoqHVYT6EATVRd7hXkhmsb7mhAI2kIseltB2xzefWNeZHow/znXRDP6zc6bThdMAt7H+RigHdTR12th1cnQmWMXNfXpHWg6kvV0uI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1618664186;
 h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
 bh=EXUFXaF4UD5fFZKbQ/JuXCwDnxeLnAJK2W2+jajVsgc=; 
 b=GPRitUZLWln5jalg36npSrbkfnvSWnEb+EwrWkvmcv+KigE9nZkp6mpvxtsCuzSfOgU9CUH3F2ZJFzZmPBXDnfcOJIYnfqUQTVcN5Almg/arQhxhClHGg9xZBmIkmE+hROzaVwtOWVamMOEFnYpp1t9h7A7GAK+HfW3gBSgTGus=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=anirudhrb.com;
 spf=pass  smtp.mailfrom=mail@anirudhrb.com;
 dmarc=pass header.from=<mail@anirudhrb.com> header.from=<mail@anirudhrb.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1618664186; 
 s=zoho; d=anirudhrb.com; i=mail@anirudhrb.com;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;
 bh=EXUFXaF4UD5fFZKbQ/JuXCwDnxeLnAJK2W2+jajVsgc=;
 b=aOyA621xttZ89/a4LfbPLfn/Wt5hqp44LDJe9to5tyg3i/UZ4HbPSmyEPB1DswRG
 4VAqbMSi3Bv0GRDg5gtyLyKQV2w0h5vmGZJvJHcjtgWXzVxSjy7nIqjnX3zAH0XJcqQ
 KfNKLDM9vDo5vfcA3puNWh+BQdVvMEgET5DYy114=
Received: from localhost.localdomain (49.207.216.151 [49.207.216.151]) by
 mx.zohomail.com with SMTPS id 1618664184976254.24926670003583;
 Sat, 17 Apr 2021 05:56:24 -0700 (PDT)
From: Anirudh Rayabharam <mail@anirudhrb.com>
To: Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 "Ahmed S. Darwish" <a.darwish@linutronix.de>,
 Colin Ian King <colin.king@canonical.com>,
 Andrey Konovalov <andreyknvl@gmail.com>
Subject: [PATCH] usb: gadget: dummy_hcd: fix gpf in gadget_setup
Date: Sat, 17 Apr 2021 18:22:09 +0530
Message-Id: <20210417125212.6274-1-mail@anirudhrb.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-ZohoMailClient: External
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+eb4674092e6cc8d9e0bd@syzkaller.appspotmail.com,
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

Fix a general protection fault reported by syzbot due to a race between
gadget_setup() and gadget_unbind() in raw_gadget.

The gadget core is supposed to guarantee that there won't be any more
callbacks to the gadget driver once the driver's unbind routine is
called. That guarantee is enforced in usb_gadget_remove_driver as
follows:

        usb_gadget_disconnect(udc->gadget);
        if (udc->gadget->irq)
                synchronize_irq(udc->gadget->irq);
        udc->driver->unbind(udc->gadget);
        usb_gadget_udc_stop(udc);

usb_gadget_disconnect turns off the pullup resistor, telling the host
that the gadget is no longer connected and preventing the transmission
of any more USB packets. Any packets that have already been received
are sure to processed by the UDC driver's interrupt handler by the time
synchronize_irq returns.

But this doesn't work with dummy_hcd, because dummy_hcd doesn't use
interrupts; it uses a timer instead.  It does have code to emulate the
effect of synchronize_irq, but that code doesn't get invoked at the
right time -- it currently runs in usb_gadget_udc_stop, after the unbind
callback instead of before.  Indeed, there's no way for
usb_gadget_remove_driver to invoke this code before the unbind
callback.

To fix this, move the synchronize_irq() emulation code to dummy_pullup
so that it runs before unbind. Also, add a comment explaining why it is
necessary to have it there.

Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Reported-by: syzbot+eb4674092e6cc8d9e0bd@syzkaller.appspotmail.com
Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>
---
 drivers/usb/gadget/udc/dummy_hcd.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index ce24d4f28f2a..d0dae6406612 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -903,6 +903,21 @@ static int dummy_pullup(struct usb_gadget *_gadget, int value)
 	spin_lock_irqsave(&dum->lock, flags);
 	dum->pullup = (value != 0);
 	set_link_state(dum_hcd);
+	if (value == 0) {
+		/*
+		 * emulate synchronize_irq(): wait for callbacks to finish
+		 * This seems to be the best to place to emulate the call
+		 * to synchronize_irq(). Doing it in dummy_udc_stop() would
+		 * be too late since it is called after the unbind callback.
+		 * Also, there is no way for core:usb_gadget_remove_driver()
+		 * to invoke this code before the unbind callback.
+		 */
+		while (dum->callback_usage > 0) {
+			spin_unlock_irqrestore(&dum->lock, flags);
+			usleep_range(1000, 2000);
+			spin_lock_irqsave(&dum->lock, flags);
+		}
+	}
 	spin_unlock_irqrestore(&dum->lock, flags);
 
 	usb_hcd_poll_rh_status(dummy_hcd_to_hcd(dum_hcd));
@@ -1004,14 +1019,6 @@ static int dummy_udc_stop(struct usb_gadget *g)
 	spin_lock_irq(&dum->lock);
 	dum->ints_enabled = 0;
 	stop_activity(dum);
-
-	/* emulate synchronize_irq(): wait for callbacks to finish */
-	while (dum->callback_usage > 0) {
-		spin_unlock_irq(&dum->lock);
-		usleep_range(1000, 2000);
-		spin_lock_irq(&dum->lock);
-	}
-
 	dum->driver = NULL;
 	spin_unlock_irq(&dum->lock);
 
-- 
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
