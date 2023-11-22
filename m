Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CE04AF64
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 22 Nov 2023 16:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YGz+IzVJ"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C30E081E2F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 22 Nov 2023 16:13:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C30E081E2F
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YGz+IzVJ
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8ShqzCTgnjqq
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed, 22 Nov 2023 16:13:17 +0000 (UTC)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	by smtp1.osuosl.org (Postfix) with ESMTPS id F17C28174A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 22 Nov 2023 16:13:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F17C28174A
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1cf6bdf8274so7549705ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 22 Nov 2023 08:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700669596; x=1701274396; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IoVmD+VTOG0LFwMmHOyCBmPi9IZVbmlhZU/3heFnccs=;
        b=YGz+IzVJPjpVxwhCoY19AhhU1fnaK1cfq62VG+EqsGGRlcWbtdJJXV8h+ZUoyXYwy1
         2X770Up5TrT3ypi1NtRrYJ4wZ8kfZ//EJAtxGGYQyYHIzEsyKNbdpCFHTk7JV5ArVuH2
         ZQJQPMdpi+x5FJBQtf8QUmTc521OobZztgL4gvlVfbry+YzN2y21DNAj9IHve6+Vt5pj
         2hGZgtzMTrnPyTTkBUgejf/6Far7TRPOpNBezQER9R7nEY8rQ9OKrXtg/CVGomXWhbng
         F1+XQ9zJvXkhaRCz48ggPtAnIbJhfgxCcnV+F6Iosgqw3HPbigL+DUwPXPJMXIMAMSlS
         YT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700669596; x=1701274396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IoVmD+VTOG0LFwMmHOyCBmPi9IZVbmlhZU/3heFnccs=;
        b=FzIfLg13YHAS1Zt3I44GjV+8kxfcOTYIXbT9v/SFeV7cL8OeAP4q5tyQwZKrupFiCy
         aHefDC3rdk5Dvv+08tW2PRlsU1gD9AQTm7E6RkNhXu39EZQ9OxtvY4S7z/t+RXIz36iX
         xjDofuXcukgBO4uvUcXRtynp9hB0HTUtsh4HaULwqVhmsMr0zGtzqflRUE7594A30Dq1
         KDt0ND6oJbEvrYmenKP7uJRUu/Jg/2Cr412JYEzWgpO5Mm7A4aeoZJby912jCnJSh9b0
         ghk9uaVxp2/t6TJn97G2wEw7HuZxxYhHGQUd2OJV2BwPhr2p9xhtE+FIIQIaJb+ce4kI
         UytA==
X-Gm-Message-State: AOJu0YzUZoAJd2CDPHBQ6gCNU0kD4r5AriZFCb7+PrvfyU4RgUwwSZ00
	JoZrT6BC2ljcvaMxq+HyNj4=
X-Google-Smtp-Source: AGHT+IFsgXMoN1R9EYrpdelZJS8IU3T+gk7YiDhb8jEIJjGE8qV1tfyECMvAlXEdvK/FIqGa+Vqugw==
X-Received: by 2002:a17:902:c40f:b0:1cf:792d:93d3 with SMTP id k15-20020a170902c40f00b001cf792d93d3mr3120269plk.4.1700669596158;
        Wed, 22 Nov 2023 08:13:16 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:313d:d4a3:2c73:a19b:b896:ebbe])
        by smtp.gmail.com with ESMTPSA id jk21-20020a170903331500b001cc311ef152sm9875626plb.286.2023.11.22.08.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 08:13:15 -0800 (PST)
From: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
To: ezequiel@vanguardiasur.com.ar,
	mchehab@kernel.org
Cc: Ghanshyam Agrawal <ghanshyam1898@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Phillip Potter <phil@philpotter.co.uk>
Subject: [PATCH V2] media: stk1160: Fixed high volume of stk1160_dbg messages
Date: Wed, 22 Nov 2023 21:43:04 +0530
Message-Id: <20231122161304.12434-1-ghanshyam1898@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function stk1160_dbg gets called too many times, which causes
the output to get flooded with messages. Since stk1160_dbg uses
printk, it is now replaced with dev_warn_ratelimited.

Suggested-by: Phillip Potter <phil@philpotter.co.uk>
Signed-off-by: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
---
v2:
Thanks for your suggestions Phillip. I have updated the TODO comment and 
used dev_warn_ratelimited for inclusion of kernel warning.

 drivers/media/usb/stk1160/stk1160-video.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/usb/stk1160/stk1160-video.c
index f5b75f380c19..a8e0d352a68c 100644
--- a/drivers/media/usb/stk1160/stk1160-video.c
+++ b/drivers/media/usb/stk1160/stk1160-video.c
@@ -105,6 +105,16 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
 	u8 *dst = buf->mem;
 	int remain;
 
+	/*
+	 * TODO: These stk1160_dbg are very spammy!
+	 * We should check why we are getting them.
+	 *
+	 * UPDATE: One of the reasons (the only one?) for getting these
+	 * is incorrect standard (mismatch between expected and configured).
+	 * So perhaps, we could add a counter for errors. When the counter
+	 * reaches some value, we simply stop streaming.
+	 */
+
 	len -= 4;
 	src += 4;
 
@@ -140,7 +150,7 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
 
 	/* Let the bug hunt begin! sanity checks! */
 	if (lencopy < 0) {
-		printk_ratelimited("copy skipped: negative lencopy\n");
+		dev_warn_ratelimited(dev, "copy skipped: negative lencopy\n");
 		return;
 	}
 
-- 
2.25.1

