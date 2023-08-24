Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 970AFC7EE2C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 24 Aug 2023 07:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A1C64144E;
	Thu, 24 Aug 2023 07:06:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A1C64144E
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=RnbrPX94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FEL9YsJ01N9l; Thu, 24 Aug 2023 07:06:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id E99A34118A;
	Thu, 24 Aug 2023 07:06:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E99A34118A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B97EEC0039;
	Thu, 24 Aug 2023 07:06:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 858C1C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 07:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52AE44119B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 07:06:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52AE44119B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y57nKSH9hv3B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 07:06:37 +0000 (UTC)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8973F4118A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 07:06:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8973F4118A
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-68bec4c6b22so554984b3a.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 00:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692860797; x=1693465597;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jVpZgWWLzSVokb3IOORkGQQJ1vh8iPrio2oddJje49k=;
 b=RnbrPX94LvmJvCuLmJN20seTHYq2nkQuJUGESbDTbxe1BLhQRuhP9fl9mLSPT7Bec3
 eIpocE2qnAsbxs4RA0ZSonZtJ6uhJM7dzB8Buqwivkb9ef0sbUbIfa10WsImiyb73+v7
 rSt8VOhI3OTAuN+X3fhakZQmhzEJxbfFs1h9s5eIluVnIbGvOit2TocsJ28bJbTxMZIb
 u/e/T8qBf1AfqWMkcQPAWQqCZbfZJKTKoZ7Jr4NjCsY3nXwZCtwdjBa0eMem8X3nUuM+
 MKRYV3QzJsx8FfwEqB95PR7dlH7nd4/Oa7686mj46O/TOW0WoTYbVyct8fdArisPdWRS
 GUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692860797; x=1693465597;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jVpZgWWLzSVokb3IOORkGQQJ1vh8iPrio2oddJje49k=;
 b=FRZ+otTRjh3BaEII+K00lC/9AMIZ8rFAaPkspP3SFuZ3z45grwltN3pAupAJiH+5Wf
 jy1o2c2FFVhqhvTfG6seiTHQulZeSAe+JbElR58wYpAUWy7aWHoKpUcgUQcBideIsTe8
 zuhA2LPWaPpB7TXou2namHN5zuuTSLrbEfpgUIbBROd2xI2LXCFQIk4Z/Tm5c7FjLA0h
 kYxsi6BXZbaWx5ic/MvHsCZqp/iTpzqXBCXLseWS3EdwE+Hi7N3kxD3qD0nV5a8mS8Wz
 ClqhCWmioVzNKdNmTaayS7Iv3u/BDq4lVsNeR3kfNXw7f+uO3Y8x/rmAPhtTm+KVO0B7
 ZRlg==
X-Gm-Message-State: AOJu0YxQSOBbTx3+Rf/Bf/FIJm5B4zx/2I9zN6FcLD+3JYf7W/mDO3Oa
 KtgOLvh9u693/TSgCKJMalc=
X-Google-Smtp-Source: AGHT+IF3P6gF1TSimhQn/Q6PnEh6lEvcZ2jPpvjP0j7NcVYyIZ6+P9/5O2OIuCxu/Qf8zKQlXZ1DbA==
X-Received: by 2002:a05:6a00:148f:b0:68a:4d66:ca1 with SMTP id
 v15-20020a056a00148f00b0068a4d660ca1mr12913601pfu.6.1692860796765; 
 Thu, 24 Aug 2023 00:06:36 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:40c2:1047:2379:8974:f63f:c2f8:6a5b])
 by smtp.gmail.com with ESMTPSA id
 d5-20020aa78145000000b00687a4b70d1esm10436179pfn.218.2023.08.24.00.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 00:06:36 -0700 (PDT)
From: coolrrsh@gmail.com
To: hverkuil@xs4all.nl, mchehab@kernel.org, slark_xiao@163.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] UBSAN: shift-out-of-bounds in set_flicker
Date: Thu, 24 Aug 2023 12:36:30 +0530
Message-Id: <20230824070630.8209-1-coolrrsh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+e27f3dbdab04e43b9f73@syzkaller.appspotmail.com
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

From: Rajeshwar R Shinde <coolrrsh@gmail.com>

Syzkaller reported the following issue:

UBSAN: shift-out-of-bounds in drivers/media/usb/gspca/cpia1.c:1031:27
shift exponent 245 is too large for 32-bit type 'int'

shift-out-of-bounds error was triggered when variable 
'sd->params.exposure.gain' is greater than the number of bits of int.
When the variable 'currentexp' is left shifted beyond 31 bits then
the error is produced. Therefore added the conditional expression to 
verify valid range.

Tested via syzbot.

Reported-by: syzbot+e27f3dbdab04e43b9f73@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/20230818164522.12806-1-coolrrsh@gmail.com

Link: https://syzkaller.appspot.com/bug?extid=e27f3dbdab04e43b9f73

Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>

---
v1->v2
changed the patch
changed commit message and tested with checkpatch 

---
 drivers/media/usb/gspca/cpia1.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/usb/gspca/cpia1.c b/drivers/media/usb/gspca/cpia1.c
index 46ed95483e22..dafc522d5e7b 100644
--- a/drivers/media/usb/gspca/cpia1.c
+++ b/drivers/media/usb/gspca/cpia1.c
@@ -1028,6 +1028,8 @@ static int set_flicker(struct gspca_dev *gspca_dev, int on, int apply)
 			sd->params.exposure.expMode = 2;
 			sd->exposure_status = EXPOSURE_NORMAL;
 		}
+		if (sd->params.exposure.gain > 31)
+			return -1;
 		currentexp = currentexp << sd->params.exposure.gain;
 		sd->params.exposure.gain = 0;
 		/* round down current exposure to nearest value */
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
