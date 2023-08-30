Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFDDC83F01
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Aug 2023 07:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B497B408A8;
	Wed, 30 Aug 2023 07:44:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B497B408A8
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=HYF52zyY
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C67JLPToAedu; Wed, 30 Aug 2023 07:44:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 697D940407;
	Wed, 30 Aug 2023 07:44:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 697D940407
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 51559C0071;
	Wed, 30 Aug 2023 07:44:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C3AC7C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Aug 2023 07:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 968B4402DE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Aug 2023 07:44:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 968B4402DE
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=HYF52zyY
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eGBxfcBoCDRt
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Aug 2023 07:44:08 +0000 (UTC)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8DB0A40325
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Aug 2023 07:44:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DB0A40325
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-68c0d886ea0so3723417b3a.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Aug 2023 00:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693381448; x=1693986248;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KaI3PfD8joR99TjMB7Mb3TjzWqZ8IotMwduAcjhk/lk=;
 b=HYF52zyYhWt2B1mGIs1ACgtBWtykrC2XZ9y2P7aFH/2GFNUuuaD/Q32WA3ICI5f9Rr
 1wY+E6lrSSdp1WMBPUL4x2PqVrwoiodsBE+aVK3yCKYuunpY43MYtPGzZeusfyXUIxt1
 gLUDQloNBVrp1C25jPyeX6GqQv3+1kytvQoLC3GfdZXZZhdeCgqlUOP4+ORE0lfERb3s
 8DXwb3yMzx4K1gbDYwPxMZp87cQ7hAhjsRvA/0hVpE6ePAUve/2fWNNaMHem0WLRmXsc
 ukllo54nLDvYAgsnQxRWNphi+Yd+DQEGJ8GLRA5Jz3P1MiOjLZdVZaFnju7CMSIFDS47
 NsWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693381448; x=1693986248;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KaI3PfD8joR99TjMB7Mb3TjzWqZ8IotMwduAcjhk/lk=;
 b=Di1h4/726E75WlQFaM9Vlt/Dg7epcfor6WxYRSvRVRTRLVY2PolKh3P3IwGEB/fl7F
 1FW7ov0wFgXZz6w/mlH7E38qcwHYm5eJd18kwmB+KaNsAc2vYBW2XESWP4DTydJpGDBg
 yRUPq/MFLTzon7y8hIs5xQET85BB1GJRXEvvAG3pcCXsFfjM2hHVTJ7+zQvnOPSBZgBa
 8gYukVmlizI2fLP4ahzlfbdhh6C0EDN3ywS1BtcP/7NoHTb6xRZ8fov9r5XKW/rCaU/x
 oPezYZ/WynmOXmxvyIm0XEU+bO9SjZpgsxdjkPNOiIWqEPkcbiGw+mxlYA9mqXDtXhbw
 MEIQ==
X-Gm-Message-State: AOJu0YzZl5TLIXrs8atKBx5AZ6vAVbkALMkaGO2aKwQ/QhFwXmDuMp3H
 MJjit8JR6q3dMYT79xoYFcM=
X-Google-Smtp-Source: AGHT+IGaQ4P8EvC7PlpIhxszpNMfsVh9XWh9SaGCCo1nYYOFuxiN9tKA8ohVp4yCvqqpSXyx313liA==
X-Received: by 2002:a05:6a21:7784:b0:14d:f41c:435a with SMTP id
 bd4-20020a056a21778400b0014df41c435amr1839509pzc.39.1693381447705; 
 Wed, 30 Aug 2023 00:44:07 -0700 (PDT)
Received: from localhost.localdomain ([2409:40c2:1033:772c:a5cb:ea8f:e44:ec54])
 by smtp.gmail.com with ESMTPSA id
 i19-20020a170902eb5300b001b8b26fa6c1sm10467189pli.115.2023.08.30.00.44.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Aug 2023 00:44:07 -0700 (PDT)
From: coolrrsh@gmail.com
To: hverkuil@xs4all.nl, mchehab@kernel.org, slark_xiao@163.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5] media: gspca: cpia1: shift-out-of-bounds in set_flicker
Date: Wed, 30 Aug 2023 13:14:01 +0530
Message-Id: <20230830074401.7696-1-coolrrsh@gmail.com>
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

When the value of the variable "sd->params.exposure.gain" exceeds the
number of bits in an integer, a shift-out-of-bounds error is reported. It
is triggered because the variable "currentexp" cannot be left-shifted by
more than the number of bits in an integer. In order to avoid invalid
range during left-shift, the conditional expression is added.


Reported-by: syzbot+e27f3dbdab04e43b9f73@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/20230818164522.12806-1-coolrrsh@gmail.com
Link: https://syzkaller.appspot.com/bug?extid=e27f3dbdab04e43b9f73
Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>
---
v1->v2
Changed the patch. Instead of avoiding shift operation for invalid
input of 'exposure.gain', throw an error for invalid range.
v2->v3
Changed the commit message details
v3->v4
Removed the trailing spaces in commit message
v4->v5
Replaced the hardcoded value with inbuilt macro
---
 drivers/media/usb/gspca/cpia1.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/usb/gspca/cpia1.c b/drivers/media/usb/gspca/cpia1.c
index 46ed95483e22..5f5fa851ca64 100644
--- a/drivers/media/usb/gspca/cpia1.c
+++ b/drivers/media/usb/gspca/cpia1.c
@@ -18,6 +18,7 @@
 
 #include <linux/input.h>
 #include <linux/sched/signal.h>
+#include <linux/bitops.h>
 
 #include "gspca.h"
 
@@ -1028,6 +1029,8 @@ static int set_flicker(struct gspca_dev *gspca_dev, int on, int apply)
 			sd->params.exposure.expMode = 2;
 			sd->exposure_status = EXPOSURE_NORMAL;
 		}
+		if (sd->params.exposure.gain >= BITS_PER_TYPE(currentexp))
+			return -EINVAL;
 		currentexp = currentexp << sd->params.exposure.gain;
 		sd->params.exposure.gain = 0;
 		/* round down current exposure to nearest value */
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
