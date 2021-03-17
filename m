Return-Path: <SRS0=IeUe=IP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_RED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98E9CC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 17 Mar 2021 20:21:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0934564F3B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 17 Mar 2021 20:21:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0934564F3B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A841D6067E;
	Wed, 17 Mar 2021 20:21:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lK-Xvna6YgSS; Wed, 17 Mar 2021 20:21:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id C67356064D;
	Wed, 17 Mar 2021 20:21:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A188CC000B;
	Wed, 17 Mar 2021 20:21:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7DCD9C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Mar 2021 20:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6458C84048
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Mar 2021 20:21:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9z4hgT1YiGSl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Mar 2021 20:21:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B145F84022
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Mar 2021 20:21:54 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id l123so1930704pfl.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Mar 2021 13:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=gDAq4DE4PBvBHlZJ3CaMSbFvBl5PB60V3/mTqquUBA0=;
 b=nqNnsd9QjmZAEesBQrZiDjMyz3oLxxXJxKtkKMe8GT3X2N6dFYpbXOzZSISq+SZbFu
 tSC9Z6PDiZMWE/xGc/MwC8vtjq+rRJm8icXpKQHAnrxx7MO1URm+sTtT/fv/wuirgPG4
 GV6TlokkfSmrLjle/XO9RMiamLMB8xLeizvigigoN/TwoKTpTDwobhY9luHgQko3A3Ve
 tK6u3Shsmz9IzoedC5GoT3gz4mrhoeeBJuQkGnv3fJsFqIsgXxjMspnhULe29+lIOI0E
 kfAW6p39MN1Q4MTYcF1hNL/JC8f0tfGrPYjEMzwZu+xmKmGXDpwXe5zwIQsIjGTZMzTS
 f7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=gDAq4DE4PBvBHlZJ3CaMSbFvBl5PB60V3/mTqquUBA0=;
 b=QJbTY1T+EOGWn1yvFgzGrBni2j0V5Re0qoZ+VwX+4y+z+uEjdGzj45SlM9JoZjNVw+
 efJzHqCfACsH4qcXmE+X2Dny/Q0xfdaxN+0M3eG+ynWVF8m+qeEV1eW0X/6Gh8Hq0jyP
 R34nh1h3Wf/+UgbRg705z3kyoYIdDkLrZH4slrcWtbWEHV2RHuBYOrAtx+rUcybQ2xrS
 Eig1UZwz1vX2UHB5UEYvzlmL/nNPsYoG/0XhoGS0eUQUT5VDPtFuAPn8momJiCzE3Xls
 afipoJJbnpqqUKZ2cVOiqsj9whYmcHr56HSl3hgMzI1AXsbBcUyk3jmR5p9g8KBIsoco
 CBrw==
X-Gm-Message-State: AOAM532eMsZn9oaylzW7lgm3LIYYUbUH6reT/rGekDgvzC2dxhSL3JJX
 67ycUubVOROY4uVEkZAGYsY=
X-Google-Smtp-Source: ABdhPJw//WXqfEPZhDC07hr0kMIG47o3Qo6OU6JBopYEdvbfgnNCCWuUDtw9QnzuRULP02XBC5CIKQ==
X-Received: by 2002:aa7:9605:0:b029:20e:b183:fc89 with SMTP id
 q5-20020aa796050000b029020eb183fc89mr695965pfg.70.1616012514025; 
 Wed, 17 Mar 2021 13:21:54 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a089:85d1:b0af:d6ff:42d8])
 by smtp.googlemail.com with ESMTPSA id e1sm8555pjt.10.2021.03.17.13.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 13:21:53 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: asihpi: fix comment syntax in file headers
Date: Thu, 18 Mar 2021 01:51:44 +0530
Message-Id: <20210317202144.20290-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: yashsri421@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 perex@perex.cz, linux-kernel-mentees@lists.linuxfoundation.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

The opening comment mark '/**' is used for highlighting the beginning of
kernel-doc comments.
There are files in sound/pci/asihpi which follow this syntax in their file
headers, i.e. start with '/**' like comments, which causes unexpected
warnings from kernel-doc.

E.g., running scripts/kernel-doc -none on sound/pci/asihpi/hpidspcd.h
causes this warning:
"warning: Cannot understand
 on line 4 - I thought it was a doc line"

Provide a simple fix by replacing the kernel-doc like comment syntax with
general format, i.e. "/*", to prevent kernel-doc from parsing it.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
* Applies perfectly on next-20210312

 sound/pci/asihpi/hpicmn.h   | 2 +-
 sound/pci/asihpi/hpidspcd.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/asihpi/hpicmn.h b/sound/pci/asihpi/hpicmn.h
index de3bedd29d94..8ec656cf8848 100644
--- a/sound/pci/asihpi/hpicmn.h
+++ b/sound/pci/asihpi/hpicmn.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-/**
+/*
 
     AudioScience HPI driver
     Copyright (C) 1997-2014  AudioScience Inc. <support@audioscience.com>
diff --git a/sound/pci/asihpi/hpidspcd.h b/sound/pci/asihpi/hpidspcd.h
index a01e8c6092bd..9f1468ed7096 100644
--- a/sound/pci/asihpi/hpidspcd.h
+++ b/sound/pci/asihpi/hpidspcd.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /***********************************************************************/
-/**
+/*
 
     AudioScience HPI driver
     Copyright (C) 1997-2011  AudioScience Inc. <support@audioscience.com>
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
