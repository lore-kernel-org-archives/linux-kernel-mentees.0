Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FBD2C3DA66
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 25 Aug 2023 13:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9200641E89;
	Fri, 25 Aug 2023 13:05:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9200641E89
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=sQCeZG7u
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f_51CX4PJsl6; Fri, 25 Aug 2023 13:05:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3B34241D8F;
	Fri, 25 Aug 2023 13:05:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B34241D8F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0D428C0039;
	Fri, 25 Aug 2023 13:05:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 13396C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Aug 2023 13:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD98C61001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Aug 2023 13:04:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD98C61001
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=sQCeZG7u
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MpiBk854KtoU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Aug 2023 13:04:58 +0000 (UTC)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0975260FE0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Aug 2023 13:04:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0975260FE0
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1bf55a81eeaso6835175ad.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Aug 2023 06:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692968697; x=1693573497;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CoViU47zP7yqEj1KNAwCFxEy/0OkP50WBChNobdQpEk=;
 b=sQCeZG7uH3nYcY9GRHENnPT1vdy5VoPjMwd6NtQHIoP6NwKM//XPBwxEkhNWjdUpRD
 amDY6MEIj/UtMrkdHxEVjOVVRHBbkwlHD7FbSRbkUnX8jZbtq95YQux5rn/h9vpmSqPf
 eS0LWQ87xMkTd4xAhnS8oiYpsf3nVgmepuGx0Y2atVv1auCoVon0/sCk7+lVMzx3xUpJ
 AdjPa03Kf6n5TNvGhrl71La0H+Ttew+jjdiyyn9ybKY28K5zf+neUxFrBlD+r3rP9Zei
 nG1PQCLTBCwMd6C53KH/EeCaj73s+eqtZL0a9mSjvPrdXpWyNBqMkdTkmoKYxRpgEqvQ
 zwIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692968697; x=1693573497;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CoViU47zP7yqEj1KNAwCFxEy/0OkP50WBChNobdQpEk=;
 b=lV0Y5gptZh1rtQFezkTuDvnDK2jBR59h2bNAok5jVMSswuz50kZaKPW0JzXOnDRVJF
 2Ecq2pbBxrj54QMkY75wIhFwJjWcM2HvT3DSruuq2nQkK9J3KJFUIm1W8PdRZMbsq6L3
 d8+znc14nmyFawIPeCjvaF/lK8qCa2qmqsbQOJlky5PlhVr3FnpD0vpAPFUYR8Kjxzqm
 2SqflQCXjStV3ZcgxA2Qbfychfmqwjqzo75TSx0fi05tLIL5aFeJptSPAsmpE1SiaMVf
 stSaRJNaocBRZDrUMi4DWFua/LW0eZBIatse8TDtkBVi6qVkgzRdhC0P15UFwzgdnM1Y
 LTIw==
X-Gm-Message-State: AOJu0YxB7zk/H5TQUsXaywM7yrWQeDAdgIvvCFge61fHHNAze5ejs5/7
 egEcTDiY8bbMgUqq/J5rGrE=
X-Google-Smtp-Source: AGHT+IEbTobU4DbNr3PSeZyqieW87FG8QQedMMZBFS8FhdmFZ42tpRGksnN8q1UwAmrTAvxAKmyBxA==
X-Received: by 2002:a17:903:22d0:b0:1c0:9bef:4bbd with SMTP id
 y16-20020a17090322d000b001c09bef4bbdmr11219724plg.14.1692968697146; 
 Fri, 25 Aug 2023 06:04:57 -0700 (PDT)
Received: from localhost.localdomain ([2409:40c2:100b:f444:c0d8:b853:252b:aa3])
 by smtp.gmail.com with ESMTPSA id
 jj17-20020a170903049100b001b9d7c8f44dsm1638155plb.182.2023.08.25.06.04.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Aug 2023 06:04:56 -0700 (PDT)
From: coolrrsh@gmail.com
To: hverkuil@xs4all.nl, mchehab@kernel.org, slark_xiao@163.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4] media: gspca: UBSAN: shift-out-of-bounds in set_flicker
Date: Fri, 25 Aug 2023 18:34:50 +0530
Message-Id: <20230825130450.5287-1-coolrrsh@gmail.com>
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
number of bits in an int, a shift-out-of-bounds error occurs. The error is
generated when the variable "currentexp" is left-shifted by more than 31
bits. In order to confirm the range is valid, the conditional expression
was added.

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
