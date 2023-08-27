Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CC3C83F11
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 27 Aug 2023 18:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F3F740465;
	Sun, 27 Aug 2023 18:53:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F3F740465
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=UBOTVkj6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j7LNtAMwFx-v; Sun, 27 Aug 2023 18:53:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 241A5400AC;
	Sun, 27 Aug 2023 18:53:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 241A5400AC
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 05656C0039;
	Sun, 27 Aug 2023 18:53:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0E737C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 27 Aug 2023 18:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D022F40292
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 27 Aug 2023 18:53:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D022F40292
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RUbLO8s8e9NY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 27 Aug 2023 18:53:56 +0000 (UTC)
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F00EA400AC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 27 Aug 2023 18:53:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F00EA400AC
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-3a8614fe8c4so2040166b6e.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 27 Aug 2023 11:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693162435; x=1693767235;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KaI3PfD8joR99TjMB7Mb3TjzWqZ8IotMwduAcjhk/lk=;
 b=UBOTVkj6afa8ANx8oC3soCEe93c7nuROSgHLTdnbhSsGHkrjseEaM/x7ttpL+nGNhX
 FNgPudGf0JGGEJg3vGkMZAWjWFXqfeypEwVBDcGbywBUtDxoTNURfV+wmQx0OYREVO0m
 N+53okvoOAqFrGIop8anyx/hvDx1BOxk8eGqirtZ+c1GCHJd4xxoHkOKK656F0tBi28K
 m3LvQxcDT24oFk+IwGn6NvCFGzIhdGnrdz9zjJZXnELi/ylK+r4ZvRE5q3zFefMFdKFX
 PpEAd+Ps1a+gztiEPgAksBvQcjCfh5RpTHMNL7y+otyLClzW7HHys5WhgKKMiNeYo/Zj
 8hjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693162435; x=1693767235;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KaI3PfD8joR99TjMB7Mb3TjzWqZ8IotMwduAcjhk/lk=;
 b=cfvnnoiwEvMCsHO67jSkQsrgPWFnbi68x/4h21yFg8IVjSO7aKdlKnO5m/rroPrsrh
 u6reY1+AfiJPWFwsDvqhdC3wu6itCAQgneQMQ6EJaOeZl3pd6eSNTnSPezP0HvP0eL76
 nl6tWv3pJ65210UkNZ838Zc/ikEF7pubyqF/37EtokpioYBYtDmaiatvRcIeLR3mOBim
 3JuaJSE5S/31KqOjZIlFPYJOby1TzmjcCnE/F0LiB05PFXoo1sL/bOKtAxODzBHwRCHK
 xbQc4oo3LhlTrFBP1VJ6ldAspkVivwZnTiGlWVlRq8K0urpJfeEO2Y+kc3y8zdahDJxc
 Fcaw==
X-Gm-Message-State: AOJu0YxG6XJzrijkQYF2Qpbp5dvJtZqIMuNn51+1IRNl5KKSUlhfbfkC
 bunuMqonHVrv6XLtmDdQGaY=
X-Google-Smtp-Source: AGHT+IFXksIvo10D/RzlONjGABJrmWT89zl4Fs/Y/OpspCazjc4yZk2UhbkiHhh2cd8y7fYSSY5sAA==
X-Received: by 2002:a54:4482:0:b0:3a8:72e9:e173 with SMTP id
 v2-20020a544482000000b003a872e9e173mr8301399oiv.24.1693162434875; 
 Sun, 27 Aug 2023 11:53:54 -0700 (PDT)
Received: from localhost.localdomain ([2409:40c2:100a:a3bb:1543:4287:715f:7d])
 by smtp.gmail.com with ESMTPSA id
 j5-20020aa783c5000000b0066684d8115bsm5310497pfn.178.2023.08.27.11.53.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Aug 2023 11:53:54 -0700 (PDT)
From: coolrrsh@gmail.com
To: hverkuil@xs4all.nl, mchehab@kernel.org, slark_xiao@163.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5] media: gspca: cpia1: shift-out-of-bounds in set_flicker
Date: Mon, 28 Aug 2023 00:23:48 +0530
Message-Id: <20230827185348.34768-1-coolrrsh@gmail.com>
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
