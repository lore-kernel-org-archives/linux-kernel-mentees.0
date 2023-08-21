Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10482EE4993
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 21 Aug 2023 08:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FA6A409A5;
	Mon, 21 Aug 2023 08:16:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FA6A409A5
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Svh4UXrw
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xqysICjT6YTF; Mon, 21 Aug 2023 08:16:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 567E6409A7;
	Mon, 21 Aug 2023 08:16:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 567E6409A7
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2FD22C0071;
	Mon, 21 Aug 2023 08:16:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 40307C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Aug 2023 08:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE4DD409A7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Aug 2023 08:16:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE4DD409A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iTiWAeiMTtYq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Aug 2023 08:16:06 +0000 (UTC)
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B17EB409A5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Aug 2023 08:16:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B17EB409A5
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1c11d53221cso2034558fac.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Aug 2023 01:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692605765; x=1693210565;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6DgAKg3qHk5I2mBtpVL40HuGEIJCVTC6eN4jhKIOAVA=;
 b=Svh4UXrwWoiKX4ozJj/LL3scNaV2VwZPR+v0kYkp/zdwv10mywINQIC5xuvm05SfZC
 U4vgNCu+R392TPWJjGDNVNJCMTR6C5CgAkCEBJPfSkU0o4rFJgsp+pNsCugpxbhFFrbY
 34hcQSG2khZA2CS3HKJ1sCNnYdlFBMuv3Eqdcr7wEnC96w5LG+C1RKTa4XIqB/HVipoh
 hhLvoUK0K5rzjkXsehk30UxvBfwsVbF8fQVTugKFGz351CIfqCGzBwYArzqqKTDd1I/0
 u3TxoK1f6u8Yoplrn4pBdRcw1Hew3gXdQiCFiY0n0Vkd0pZPwBULZgbh16pPJPKnqB3s
 uwfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692605765; x=1693210565;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6DgAKg3qHk5I2mBtpVL40HuGEIJCVTC6eN4jhKIOAVA=;
 b=MJTixgnL54BCOfnBCF+QPQW3bm7tgexCUbKiThXaT1HWtx/olAAitMKsEL29SLccBk
 Dn34PmHys5UIJrwaMIB2E7+CquUdLjx6Q4CvhriRoVwUmvQ3NPlurh2t9JBKZRBypo1e
 lFeCp0Lo9Ew/Yn06eRpxisAStwa571nSle62TaN3kgDGN8w5I+WiId8ay+DDom5uiqNO
 FY8v/qcha82+hyVoiHffYIIDAjcArSFP51yg0CapVE6eTNEpNXo9gmWUr1G8qNRvUYt6
 KFPCC7KeonFAgI/uD0WeERB8tkOAwSJg05Fx++KJ8wzmLwXWD3zg5mVnHOih2GR+0MLv
 Zl0Q==
X-Gm-Message-State: AOJu0YzLJCPezYhYzjMhKKJFRdfcfOTeDLGgewkYbWBAvjnjLnLjxyQr
 Std8ZiuLBlWGQBff7N2+6RU=
X-Google-Smtp-Source: AGHT+IE1dGo58N3EiQ7SvmfNbPEBuUVwI/PVJQEDkDawAlW5SVTKoZL+ZojblsKw8Cuj3hXELxRgGg==
X-Received: by 2002:a05:6870:d14a:b0:1bb:fd78:4f22 with SMTP id
 f10-20020a056870d14a00b001bbfd784f22mr7593342oac.34.1692605765589; 
 Mon, 21 Aug 2023 01:16:05 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:40c2:1010:c230:b0ad:364d:f97a:aa9d])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a17090a764200b002630c9d78aasm5510078pjl.5.2023.08.21.01.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Aug 2023 01:16:05 -0700 (PDT)
From: coolrrsh@gmail.com
To: hverkuil@xs4all.nl, mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] UBSAN: shift-out-of-bounds in set_flicker
Date: Mon, 21 Aug 2023 13:45:59 +0530
Message-Id: <20230821081559.13807-1-coolrrsh@gmail.com>
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

UBSAN: shift-out-of-bounds in drivers/media/usb/gspca/cpia1.c:1031:27
shift exponent 245 is too large for 32-bit type 'int'

shift-out-of-bounds error was triggered when variable 
'sd->params.exposure.gain' is greater than the number of bits of int.
When the variable 'currentexp' is left shifted beyond 31 bits then
the error is produced. Therefore added the conditional expression to 
verify valid range.

Tested via syzbot.

Reported-by: syzbot+e27f3dbdab04e43b9f73@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/20230818164522.12806-1-
coolrrsh@gmail.com/
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
