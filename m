Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAAABC77B75
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 12 May 2023 13:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51C3E42AAD;
	Fri, 12 May 2023 13:05:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51C3E42AAD
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=gSVtugdu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yL8y4-3aA01Y; Fri, 12 May 2023 13:05:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1AFEF41F61;
	Fri, 12 May 2023 13:05:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AFEF41F61
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E3630C0036;
	Fri, 12 May 2023 13:05:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8643FC002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 May 2023 13:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5ACCA60E41
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 May 2023 13:05:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5ACCA60E41
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=gSVtugdu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P7-LQTPe-8kp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 May 2023 13:05:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 825B360BD3
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 825B360BD3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 May 2023 13:05:39 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2add755b7c2so1084131fa.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 May 2023 06:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683896737; x=1686488737;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hCQRjBkP8l0PQhKcHh5TnNSnWxhKMBpH5u3PrLqP5bw=;
 b=gSVtugdu0QcsPWfCv177WCPgmmUIXwjpkxJncUPS9gWAroAhjf8n1PyBgvo+yG2FyM
 AGT9UxdYd/iV5HYbxAg9G9PhyPppuGSo1xmNnevlv70djo7FF012iIYPdJpg5AsdbYkh
 BhKFg/OYk3YHdh1O8qtxffpfw51RxOOQW+P+CwbWqQSmLdWVWQh3m8bTVR2Q2kAcKTn5
 Xq35VcJY+bPGNGQgRBOfkxDfA6iUiHEOy7GH+nXrxZP+Pw3H3QSN06hnvofVCsOxM0c6
 3r/11TnBKqscTYtpRisEqtsEx1pQOf5S1bTLHSrlWu3QEq3HoV0vtxnpxklSaOl3y8Wr
 gdMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683896737; x=1686488737;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hCQRjBkP8l0PQhKcHh5TnNSnWxhKMBpH5u3PrLqP5bw=;
 b=LCBj33VDmeKw28IBPK8q1lzd1VOjVepfv51AjCGeufv+7juhNLBgpbuWqAtnAMpnaA
 /8BaEUvrSsr8/AyDKbACBgFHEg8fbazZ8iid3ut2a4ANnbiidfhO9CvfcVIkeqRItYwJ
 66WOt0nPWxE2kNC0yQRSkbR2bfxyA27YGpLVfhBzqt+9EO1CNCTI7W83J1uoZsaZFaG9
 up2XVKqsGW52Tg/oBpyWn72Hjq+YxjecTkb67g+g7q7K7+eTpkswM72D0J+Ho5NoZHlC
 gFirMZqP3+H5jHoCjtG8xZ32wWgna1+U5dW+NpwTzTDYV9wiCn2hHeqCIcXjN1JUUc0o
 bKfA==
X-Gm-Message-State: AC+VfDzybzNRWTZNOrJ4mnpQMBFBR+JxArg9e2+Mjba446O3H5iBPP2o
 gmmnqgU5mYxCyr9gHwmHIgI=
X-Google-Smtp-Source: ACHHUZ5HB45FEo0/mPj5ucpEmu76J/nqzc0NAvE+NhUO19q+o09XnzL1yhjtyYr9YcK/hWKQCkXung==
X-Received: by 2002:a05:6512:208:b0:4ee:d640:91eb with SMTP id
 a8-20020a056512020800b004eed64091ebmr6572026lfo.3.1683896736794; 
 Fri, 12 May 2023 06:05:36 -0700 (PDT)
Received: from ivan-HLYL-WXX9.. ([178.160.196.94])
 by smtp.gmail.com with ESMTPSA id
 p17-20020a05651211f100b004f155762085sm1473028lfs.122.2023.05.12.06.05.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 06:05:36 -0700 (PDT)
From: Ivan Orlov <ivan.orlov0322@gmail.com>
To: josef@toxicpanda.com,
	axboe@kernel.dk
Subject: [PATCH] nbd: Fix debugfs_create_dir error checking
Date: Fri, 12 May 2023 17:05:32 +0400
Message-Id: <20230512130533.98709-1-ivan.orlov0322@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>, linux-kernel@vger.kernel.org,
 nbd@other.debian.org, linux-block@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
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

The debugfs_create_dir function returns ERR_PTR in case of error, and the
only correct way to check if an error occurred is 'IS_ERR' inline function.
This patch will replace the null-comparison with IS_ERR.

Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
---
 drivers/block/nbd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 9c35c958f2c8..65ecde3e2a5b 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1666,7 +1666,7 @@ static int nbd_dev_dbg_init(struct nbd_device *nbd)
 		return -EIO;
 
 	dir = debugfs_create_dir(nbd_name(nbd), nbd_dbg_dir);
-	if (!dir) {
+	if (IS_ERR(dir)) {
 		dev_err(nbd_to_dev(nbd), "Failed to create debugfs dir for '%s'\n",
 			nbd_name(nbd));
 		return -EIO;
@@ -1692,7 +1692,7 @@ static int nbd_dbg_init(void)
 	struct dentry *dbg_dir;
 
 	dbg_dir = debugfs_create_dir("nbd", NULL);
-	if (!dbg_dir)
+	if (IS_ERR(dbg_dir))
 		return -EIO;
 
 	nbd_dbg_dir = dbg_dir;
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
