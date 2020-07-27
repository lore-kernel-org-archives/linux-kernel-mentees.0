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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12CB9C433E5
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 15:46:47 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDA26206E7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 15:46:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="useCPffe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDA26206E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A4D028514B;
	Mon, 27 Jul 2020 15:46:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ShOgZbKcLq6q; Mon, 27 Jul 2020 15:46:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BAFC384FDE;
	Mon, 27 Jul 2020 15:46:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9CBF6C0050;
	Mon, 27 Jul 2020 15:46:44 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4424FC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 15:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3345287EC5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 15:46:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c5M00c06UZk2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 15:46:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7A60287EA6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 15:46:43 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id h7so15635706qkk.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 08:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eq6Q8ztU/SV0qKLD6bpCFHf5g7ycq71mi8wbaYyCfwM=;
 b=useCPfferacyo/0JUXOwYUSEUXb19osX2BOfpi1ycjVc26Azr4WGsIO+HRRWYTQr30
 ySYFahM0ujDCbR+y3GgsggUMD87PZjJagx6VbBz9Vl6sire8+gHrnPbKMCOGyTfujuv2
 RcQgoQWn38hlsB6hYzRNKe3yQfu11PHLhztVBbtLsP5nvUSCSOqDLKfV7HJR0So428Kx
 vzVnQEAK+vY+ePlywy2k6mxRztpQxEbhVd9c0M/oK7EzxRiqm7cmvka0Mkb1byNec6lO
 7NMb6BRwQs5LTdbinevBq0SBoK/XHbKto6yTn1+SYs+JjMMutAWY2c6AnDIYoCHLbLmS
 bzeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eq6Q8ztU/SV0qKLD6bpCFHf5g7ycq71mi8wbaYyCfwM=;
 b=O/jcFpM6gTJ8VPH4M4H0DIEKuCvDR5GBuGObI8tGxB/kIUO9+I4lB6Pe95SfmBx/xY
 JVZzgZQEZJ/t6qsaM9S3GjdA2JLc8CtQv1Yy2S8P+FWGFeGQejEoJBu5BE59HBCojYYU
 ivwO+jzaLe29Z2YAZiVHPiG0LxVstD6JsrzJA2l+3IaymFqfGe4bxfVwPjW7SRIPYyfm
 KAYqyIgX4wDUEoShNLpdMUyBQP5+/jkUi5GLs9KRktvFA8rWr9YatCx1aIPxpihDFBs0
 lYgt85ekd2P2Cm1zbDERAtStJuHBkVY8ZtJma77cmRJOeSflh+i6CQIL8tx+8Kpr4oYa
 MZRA==
X-Gm-Message-State: AOAM532NTQuUSSc/LQa9+yuVMpJyYeKgYsCUBbi0cLBDxaIyb09kIZ9Y
 iRHpAWbPpl2d6W3XvXeyTg==
X-Google-Smtp-Source: ABdhPJwVxJVQnSQkMP5WrsFM11nJ6OZHIQPk6i8j75Z7FhEUMKNos2zkeaTqm2s/ehlmTd+a3DiD4A==
X-Received: by 2002:a05:620a:1089:: with SMTP id
 g9mr23428430qkk.252.1595864802583; 
 Mon, 27 Jul 2020 08:46:42 -0700 (PDT)
Received: from localhost.localdomain ([209.94.141.207])
 by smtp.gmail.com with ESMTPSA id w18sm14390947qtn.3.2020.07.27.08.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 08:46:42 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Stefan Richter <stefanr@s5r6.in-berlin.de>
Date: Mon, 27 Jul 2020 11:45:21 -0400
Message-Id: <20200727154521.315774-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200727151537.315023-1-yepeilin.cs@gmail.com>
References: <20200727151537.315023-1-yepeilin.cs@gmail.com>
MIME-Version: 1.0
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: [Linux-kernel-mentees] [PATCH v2] firewire: Prevent kernel-infoleak
	in ioctl_get_info()
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
Fixes: 344bbc4de14e ("firewire: Generalize get_config_rom to get_info.")
Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
Change in v2:
    - Add an appropriate `Fixes` tag. (Suggested by Arnd Bergmann
      <arnd@arndb.de>)

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
