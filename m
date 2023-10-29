Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26090C4332F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 29 Oct 2023 14:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D4A3706AA;
	Sun, 29 Oct 2023 14:36:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D4A3706AA
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gnZhfmrL
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WTYPAHVtQHJr; Sun, 29 Oct 2023 14:36:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A72EE7069F;
	Sun, 29 Oct 2023 14:36:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A72EE7069F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 84ADFC0071;
	Sun, 29 Oct 2023 14:36:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 29009C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 14:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB317706A0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 14:36:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB317706A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v3Av_nQlucbD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 14:36:23 +0000 (UTC)
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4E3017069F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 14:36:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E3017069F
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-3575c10421aso12651835ab.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 07:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698590182; x=1699194982;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WOotfpE7UygG9u+jO7okxXpuJl/dpW05Sd73/FzJiB0=;
 b=gnZhfmrLiDOTOc+pIb2uSbs7LXEvc4gA+zS4ETF/MT0cSgdq02tKCioixCjS78kWca
 jKc3leKHurv8P9qPoPH7P66FfNNjT9S1/QmoKS0ikYn3DE7Jkgga+re0TXXnq+5DQwB3
 8aNGj9YNdfT8b5SsH/eMRGUAQTdKKR0MYXVxUc4YJ1Jzrbf4wo67tuQeOlHqsDUZk5Ew
 T7Ya+V4mCA0s9/8u6v1KUVPdcD9D4RRn8cPH4MqE4eQB66KFB7MD2KONRwkNAR650sBJ
 mSarqxEHBjLinR5yTo0g0oRxDH+6FFJmlVKyZeiTudUaf6hTOD37LmMUw0Eeo1HGaFPX
 +G5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698590182; x=1699194982;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WOotfpE7UygG9u+jO7okxXpuJl/dpW05Sd73/FzJiB0=;
 b=eDb/+LRxekQ07XxnzpE9V02gcfD9S1VLTMPSOGfplygsSr8hCbYCPx8W6UV/P8/7Pn
 dq0M77Y7B3Hi0BQp4YGtgFw9Nv0geBd/T8nDuSbTFzTQFtTA0GQGbp4aBIv+9Sn968zk
 no2IIAkf4bgL9s/3b8FolZEe6wBqSsKKP13mYAQQS3WV6hDBgOG2WJppo0DLGAj+5EhV
 3AiZw942mHshHpqSiAdth6i+9dml4+b/pfKr3qVJMzJjtqWS3xebR1qFKfqbPwzky87V
 dy76198xNY7yc7u3eIwldxepeVZ7XM/YGdZ7QIUfnQD21JoKegYCXfg7iSincUXdnIKd
 cpMw==
X-Gm-Message-State: AOJu0Yxo6uvtvUaMFtE3q8gvU7BaKFMUDeAUbDZmBPMN+om504z0QrRi
 KVmOghOEsk11+B+pXlgynHU=
X-Google-Smtp-Source: AGHT+IEENLk8ESJW5E5A28KlVgccH1FwYwzXqSbjRZcxnjVHBeKBoTbMnxB5GgIFQFt3XPzKtgUChg==
X-Received: by 2002:a92:cdaf:0:b0:357:600c:7c5f with SMTP id
 g15-20020a92cdaf000000b00357600c7c5fmr10083288ild.23.1698590182261; 
 Sun, 29 Oct 2023 07:36:22 -0700 (PDT)
Received: from localhost.localdomain ([202.137.218.21])
 by smtp.gmail.com with ESMTPSA id
 a26-20020a63bd1a000000b005b8e1b0090asm3421348pgf.67.2023.10.29.07.36.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Oct 2023 07:36:22 -0700 (PDT)
From: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
To: ezequiel@vanguardiasur.com.ar,
	mchehab@kernel.org
Subject: [PATCH] media: stk1160: Fixed high volume of stk1160_dbg messages
Date: Sun, 29 Oct 2023 20:06:04 +0530
Message-Id: <20231029143604.120329-1-ghanshyam1898@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Ghanshyam Agrawal <ghanshyam1898@gmail.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
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

The function stk1160_dbg gets called too many times, which causes
the output to get flooded with messages. Since stk1160_dbg uses
printk, it is now replaced with printk_ratelimited directly.

Signed-off-by: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
---
 drivers/media/usb/stk1160/stk1160-video.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/usb/stk1160/stk1160-video.c
index 4e966f6bf608..f5b75f380c19 100644
--- a/drivers/media/usb/stk1160/stk1160-video.c
+++ b/drivers/media/usb/stk1160/stk1160-video.c
@@ -105,17 +105,6 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
 	u8 *dst = buf->mem;
 	int remain;
 
-	/*
-	 * TODO: These stk1160_dbg are very spammy!
-	 * We should 1) check why we are getting them
-	 * and 2) add ratelimit.
-	 *
-	 * UPDATE: One of the reasons (the only one?) for getting these
-	 * is incorrect standard (mismatch between expected and configured).
-	 * So perhaps, we could add a counter for errors. When the counter
-	 * reaches some value, we simply stop streaming.
-	 */
-
 	len -= 4;
 	src += 4;
 
@@ -151,7 +140,7 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
 
 	/* Let the bug hunt begin! sanity checks! */
 	if (lencopy < 0) {
-		stk1160_dbg("copy skipped: negative lencopy\n");
+		printk_ratelimited("copy skipped: negative lencopy\n");
 		return;
 	}
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
