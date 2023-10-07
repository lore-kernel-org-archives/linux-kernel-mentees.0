Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8534DE95A62
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  7 Oct 2023 20:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0F1240603;
	Sat,  7 Oct 2023 20:06:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0F1240603
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0zEbJiCYsz93; Sat,  7 Oct 2023 20:06:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D4AE6400D9;
	Sat,  7 Oct 2023 20:06:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4AE6400D9
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B5FC1C0039;
	Sat,  7 Oct 2023 20:06:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CBED4C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Oct 2023 20:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92E7561055
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Oct 2023 20:06:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92E7561055
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IgB2UET1ofOP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Oct 2023 20:06:09 +0000 (UTC)
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 34A2F6104B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Oct 2023 20:06:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34A2F6104B
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-79faba5fe12so128230839f.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 07 Oct 2023 13:06:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696709168; x=1697313968;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:dkim-signature:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zNlD1s/5Qv8LvOzp0cT+qMBzDmfWHxl8/xBRMHgFQGc=;
 b=gTbv9d5/vBrGNlBatpnhsK5kFU1/NZgQNP7cISRFbcC+vpqm4TiCjfsXEEbMxSziU6
 ybemC9EnCsGDMhndQjNYhut2+l4S9C8jjHyKw4iES4I1NLM/Dx6PzdX6lmr7Zz8rcW6p
 xj81e38S3eDzDFi/Wq7Y5O6chhnfcCdblFQJMEyWTB3hXmi10ncCDkfE29pbXE7kEwHp
 QJOKcNlVgV55R1/n0U1eq1PllqewKTLE+g7ikhvyEeROxwG2wx6cp3x4lW6VtM4KDMv2
 Comze8YvbBTaAho1qNUOoWxs71txXJZEDwX84bZ4QBxb0VuZlOMMEGrZUDGY2TDrUqlV
 ++AQ==
X-Gm-Message-State: AOJu0Yx0yhRU/FeTm71mxLwjV/JvzaUJ3GGDPsJI7lTLe/sgvcfrjJEn
 FZjXYREj1WhHiuoyyqvxMXM=
X-Google-Smtp-Source: AGHT+IG2wf6mgobZ2IOixaCTrcl3zW9YZbaOfG0cI8m3grNo8XccXE19/FQlBmnU1OO4gAk3FQ/gRg==
X-Received: by 2002:a05:6602:54:b0:783:4bc6:636e with SMTP id
 z20-20020a056602005400b007834bc6636emr11401205ioz.21.1696709168170; 
 Sat, 07 Oct 2023 13:06:08 -0700 (PDT)
Received: from mail.marliere.net ([24.199.118.162])
 by smtp.gmail.com with ESMTPSA id
 gj12-20020a0566386a0c00b0043193e32c78sm1106734jab.152.2023.10.07.13.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Oct 2023 13:06:07 -0700 (PDT)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
 s=2023; t=1696709166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=zNlD1s/5Qv8LvOzp0cT+qMBzDmfWHxl8/xBRMHgFQGc=;
 b=nkSQrXCY5vVbqS6btuYu/JipccFgDJ7nsyFtTYPE0Ffxa7OF5HPKZO91zA3DcU6yWTiHPv
 Nr+KtmGt56HhXXRizuDQxOzfVNGguPFskpIeZzh6ZnpanJZ1twbWz2DQXa6Pl8KwqNtlGA
 AYsRDqMY7JOvTOm6SQOGF4bmtFGjZFBqtcnxUGZ7ybPcwI/4b2TtCrW8+gDQDlY8WdzNxW
 30w5/AdtEpNe1wFw9MYy9pGPNb3HM69K2BVXDqXKOvgHSOHkYTQ8PMxyAriBatLtfJxqtd
 idiCs7KvGnX6GNrMz8eSJ8C8vD9nJ7pJ/idgkOeTGdXWzdSjovyGTxd4XbgwLQ==
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Tomasz Figa <tfiga@chromium.org>, Yong Zhi <yong.zhi@intel.com>
Subject: [PATCH] staging: media: ipu3: remove ftrace-like logging
Date: Sat,  7 Oct 2023 17:05:42 -0300
Message-Id: <20231007200541.126325-1-ricardo@marliere.net>
MIME-Version: 1.0
Cc: linux-staging@lists.linux.dev,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
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

This patch fixes the following checkpatch.pl warnings in ipu3.c:

WARNING: Unnecessary ftrace-like logging - prefer using ftrace
+       dev_dbg(dev, "enter %s\n", __func__);

WARNING: Unnecessary ftrace-like logging - prefer using ftrace
+       dev_dbg(dev, "leave %s\n", __func__);

WARNING: Unnecessary ftrace-like logging - prefer using ftrace
+       dev_dbg(dev, "enter %s\n", __func__);

WARNING: Unnecessary ftrace-like logging - prefer using ftrace
+       dev_dbg(dev, "leave %s\n", __func__);

Fixes: 7fc7af649ca7 ("media: staging/intel-ipu3: Add imgu top level pci device driver")
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 drivers/staging/media/ipu3/ipu3.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3.c b/drivers/staging/media/ipu3/ipu3.c
index 0c453b37f8c4..18ca22c3018a 100644
--- a/drivers/staging/media/ipu3/ipu3.c
+++ b/drivers/staging/media/ipu3/ipu3.c
@@ -762,7 +762,6 @@ static int __maybe_unused imgu_suspend(struct device *dev)
 	struct pci_dev *pci_dev = to_pci_dev(dev);
 	struct imgu_device *imgu = pci_get_drvdata(pci_dev);
 
-	dev_dbg(dev, "enter %s\n", __func__);
 	imgu->suspend_in_stream = imgu_css_is_streaming(&imgu->css);
 	if (!imgu->suspend_in_stream)
 		goto out;
@@ -783,7 +782,6 @@ static int __maybe_unused imgu_suspend(struct device *dev)
 	imgu_powerdown(imgu);
 	pm_runtime_force_suspend(dev);
 out:
-	dev_dbg(dev, "leave %s\n", __func__);
 	return 0;
 }
 
@@ -793,8 +791,6 @@ static int __maybe_unused imgu_resume(struct device *dev)
 	int r = 0;
 	unsigned int pipe;
 
-	dev_dbg(dev, "enter %s\n", __func__);
-
 	if (!imgu->suspend_in_stream)
 		goto out;
 
@@ -821,8 +817,6 @@ static int __maybe_unused imgu_resume(struct device *dev)
 	}
 
 out:
-	dev_dbg(dev, "leave %s\n", __func__);
-
 	return r;
 }
 
-- 
2.40.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
