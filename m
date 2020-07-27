Return-Path: <SRS0=tUVd=BG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF5FC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 15:18:33 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 350D820672
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 15:18:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Px+7gUwt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 350D820672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 00D3A87F5C;
	Mon, 27 Jul 2020 15:18:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mxe1ByTBUhot; Mon, 27 Jul 2020 15:18:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 915B887EE9;
	Mon, 27 Jul 2020 15:18:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 802DDC0050;
	Mon, 27 Jul 2020 15:18:32 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A8E9CC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 15:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 91C4D87F5C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 15:18:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O4AVj78HXbtL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 15:18:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4C52387EE9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 15:18:14 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id c12so3431533qtn.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 08:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oumv6DjctSmluV8Ivacc6/Q4aJir+U55bBJZDerGc5I=;
 b=Px+7gUwtxpKPDvHuoB6IlCBvk6EYS0HihLI+J0DD9Ezkc74/7XR8zWE5ozirQqLiAX
 GkTIW+1WD/9kORpCBOnAiXOdvsQplAmxjt4x9u68njVmagBRd1EPT/DkywHRiMxics9e
 g+KAmVPtsnmWT9MDCxCqrBnvLaV+shLM7I1MiYFWmRJGOJ1QK8QLcbClczKJNwMT1IVb
 5b+QaTWXQGkSWsYgGI870ieUbNiJ7NlmKpo6RigKaZKsss2an4B4b3lV5RFz7Oczzu7I
 bE5utPmhMSYKh8aNIeJoUcULYkWff3tElXuJttV6jWPZZ0P8nCREx7rS3j57zkNrQAIe
 C5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oumv6DjctSmluV8Ivacc6/Q4aJir+U55bBJZDerGc5I=;
 b=jtxLiotxda8Ulu1xhQnFU8IkWS31auGQ8skN4fabJLgH8Z0iTiFZiWFUvjsfg2nXx7
 EzrhxUWt3mcSysOm/+J5VcWf1WVr/ukxcOuLEuAuYjuhiyjxIBTYKIx++glL3+86khDc
 0pnuX6S6VaYFyIuHcxvV3PcYIoc8MpQwf/IDJV8seQEfuZesveFajvWNW0mcltCBvSPr
 xqS0llAOdIFRt2JzRl5cGmCdZEYqjDnEV0o3kS42bLE8qwhlgOfMQicXz1rfHKJiiOeK
 ppukMDgSiAeV+U0xvT2bbgbBf4IYeeYuO63bwYZSlTgKONwB2PZ5jbLL9I9+0snZe4UZ
 4Fzw==
X-Gm-Message-State: AOAM532e40NqclySbSRdHBKXmoAsQaJStDNNftnAfLs7k9qI/XdEcXDA
 3J3QCua8IeSawzwuo9e7Hw==
X-Google-Smtp-Source: ABdhPJyLTAelIjtu78jYMToVbssYjgYPk3s7pOniRfc3akQhku8vGAuGb0/YsOPPTj334y5KEiY9SA==
X-Received: by 2002:aed:2199:: with SMTP id l25mr21958744qtc.309.1595863092480; 
 Mon, 27 Jul 2020 08:18:12 -0700 (PDT)
Received: from localhost.localdomain ([209.94.141.207])
 by smtp.gmail.com with ESMTPSA id o21sm3445003qkk.94.2020.07.27.08.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 08:18:12 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Stefan Richter <stefanr@s5r6.in-berlin.de>
Date: Mon, 27 Jul 2020 11:15:37 -0400
Message-Id: <20200727151537.315023-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: [Linux-kernel-mentees] [PATCH] firewire: Prevent kernel-infoleak in
	ioctl_get_info()
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

ioctl_get_info() is copying uninitialized stack memory to userspace due to
the compiler not initializing holes in statically allocated structures.
Fix it by initializing `event` using memset() in fill_bus_reset_event().

Cc: stable@vger.kernel.org
Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
 drivers/firewire/core-cdev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index fb6c651214f3..2341d762df5b 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -340,6 +340,8 @@ static void fill_bus_reset_event(struct fw_cdev_event_bus_reset *event,
 {
 	struct fw_card *card = client->device->card;
 
+	memset(event, 0, sizeof(*event));
+
 	spin_lock_irq(&card->lock);
 
 	event->closure	     = client->bus_reset_closure;
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
