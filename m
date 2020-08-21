Return-Path: <SRS0=fjKG=B7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2143EC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Aug 2020 15:15:36 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E30D2207BB
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Aug 2020 15:15:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZRQxbn+g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E30D2207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B743F884A7;
	Fri, 21 Aug 2020 15:15:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R79c5MzMM+Dn; Fri, 21 Aug 2020 15:15:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0F40D88499;
	Fri, 21 Aug 2020 15:15:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E277AC0889;
	Fri, 21 Aug 2020 15:15:34 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8385DC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 15:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6C43C20529
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 15:15:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RgbpVY29nYb1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 15:14:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by silver.osuosl.org (Postfix) with ESMTPS id A6AF220000
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 15:14:48 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id u128so1209074pfb.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 08:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yQlRGgglVem1yrOY67Y4xRyPDdhuMt3+5qjwOEhr9Ok=;
 b=ZRQxbn+gRDJMepd4KWtM4FYhwQWaxJzPadcNJpglrZyBlxQzjRdbKrYPTHaRDIyyzz
 pXZ+y32FaVikd6YlCPI83aYOIU9uDBizDCWhFBoXwXkpV3XaBEGwuO95sOWGgcWIJWVd
 wTJNDGUKakWt1kSxjmx136c3W9Tn716yBa2QFAjmUVN4a7TUUHV8RHHtaesLJZlw56x0
 5DHOe/oGkY6BWC8AZ+L6d0PXLobFKrmDj03Ml0BAUK/HPhDIsm/nXERzwG9ms7fC9Idy
 c5s3sCtT/d5aXBx9+7ozMZ8VPtc1OfmPxNf0F12etE9IpMRANXJ/RCmu0Mjh8ES2Xx7A
 2I/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yQlRGgglVem1yrOY67Y4xRyPDdhuMt3+5qjwOEhr9Ok=;
 b=XolpLilMTtCD5dbGRHAJLNOPZ1nKS4sa/5SMRb2a1I4vlxQNQAjD+KwlhkJriJ/ctq
 V4YyEFJju+wdWTzA769mbJ+D9oUCVBLzbNgEHYx2Sf8ffZcpLuqh3Yino5JQxZxtNIL6
 ZuAB8Y6KyFVrPpMpstzY88rCPQ2zdH7P6Ak6rvKbk4a5c1YD6O4aiYL8MkDKJDjCmLa0
 FB1OsznaGJCAcJYjukaxMqnimL7q7a5YcUuotpseJ2fZtqXuiFZk65iONtNU4mAL0hCy
 cnQvDJEHM8VZyOGvU6mUWRYvZqXeD4LDusxCdsg5ljNveyXRQUalyyuULmjbebv0xSYi
 XLlg==
X-Gm-Message-State: AOAM532cPgvnk9rOTtKsXQco2sI3tlfvhu98+CYYNMM7edUza9d5NPb0
 riar2+lVCQUVaC3t+A+Q0Q==
X-Google-Smtp-Source: ABdhPJwV5ANYGwealcVK8FXUcOhyB+39dfFBFcpqKvsf5pOL909OMvyBmVCg9rnTwdF9pFb1a2iRnw==
X-Received: by 2002:a05:6a00:14c4:: with SMTP id
 w4mr3012458pfu.20.1598022888104; 
 Fri, 21 Aug 2020 08:14:48 -0700 (PDT)
Received: from localhost.localdomain ([2600:3c01::f03c:91ff:fe6e:64cd])
 by smtp.gmail.com with ESMTPSA id s8sm3132422pfc.122.2020.08.21.08.14.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 08:14:47 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Hans Verkuil <hverkuil@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Date: Fri, 21 Aug 2020 11:13:43 -0400
Message-Id: <20200821151343.506284-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] v4l2-tpg: Clamp hue in tpg_s_hue()
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

Setting `hue` by calling tpg_s_hue() directly is risky, since it does not
perform range check. Clamp `hue` to the valid range in tpg_s_hue().

Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
 include/media/tpg/v4l2-tpg.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/media/tpg/v4l2-tpg.h b/include/media/tpg/v4l2-tpg.h
index eb191e85d363..fd15e5db9f5b 100644
--- a/include/media/tpg/v4l2-tpg.h
+++ b/include/media/tpg/v4l2-tpg.h
@@ -324,6 +324,7 @@ static inline void tpg_s_saturation(struct tpg_data *tpg,
 static inline void tpg_s_hue(struct tpg_data *tpg,
 					s16 hue)
 {
+	hue = clamp_t(s16, hue, -128, 128);
 	if (tpg->hue == hue)
 		return;
 	tpg->hue = hue;
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
