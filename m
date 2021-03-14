Return-Path: <SRS0=ODNG=IM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA1F3C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 14 Mar 2021 07:28:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CBB164E7A
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 14 Mar 2021 07:28:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CBB164E7A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2AB24011F;
	Sun, 14 Mar 2021 07:28:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hh9gR7cP4DZt; Sun, 14 Mar 2021 07:28:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C4BE400F3;
	Sun, 14 Mar 2021 07:28:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 14672C000B;
	Sun, 14 Mar 2021 07:28:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2452CC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Mar 2021 07:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F1B734011F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Mar 2021 07:28:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aen9f8ZK2Qb5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Mar 2021 07:28:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 576E9400F3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Mar 2021 07:28:40 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id n9so17642735pgi.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 13 Mar 2021 23:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=2DBxZZzfpEFBGCSvP78Nj8qEZTByky+nxFzM0e7NOU8=;
 b=tVTDfqE0cBMhb8ob+K4J60TmYSzRkEIXIPnQkneHTl+dSSjZlI+oZSkesA28WPTVOV
 rhRD4ohwdPEbVVd/EwakNGExHbs7aAe3zEz7FDP75xhuWAEv4q5PCWKNRbpzjLwjqi69
 xnMiM57qD5oqae2NJRcHMQ3R689JrmPVXmX4nuMPOuwhKfMyUbrIECDGkpBt0jXu4yog
 gk8iQs6jIaYIvntqh8pJjW7tbQiJuymop3sZF4WdKnblyypGCcTrAgVd0eaMj6xU/2Tb
 O4IRYDsw6kh1VRWF7uTfI94JGQ0IDRho61JrRc+ku4t9yAzTD4wYAUfHO1xhmur6o+30
 FdQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=2DBxZZzfpEFBGCSvP78Nj8qEZTByky+nxFzM0e7NOU8=;
 b=VU7Cal2TQxjZl8UTRnistZM4ZTT/G46UCrHT3BEN/qEAOrgi+DrjAiJhW4osOhrJxv
 6u2FU9Vw/V5SSYTSE7IxqV5pwB75Q5hTL1TebWJsuIkT82Hk2kAR4j4GjumBIBoHTxhD
 55Yad5uBzkbNrsCGI36vTKvLEXLLTN2SWAXNvfIMgLa3UEld3FoQj2R0ORhABL/9gmtz
 O5Xut0QKuGiLXEK4Q4F18be7lW9FSL85Y5kJn7UWUdrn7fHQ71jsUuSny8XZwnwqwzbI
 nE+Jb7yfqudorPXQ2UzPnHyRGUKa+rJHNsNShTw/liThovOkuRpdObDNBU+uAi8YyKuU
 kZzg==
X-Gm-Message-State: AOAM530YB+SjldQ1ixKOChk+ZqZ0gILjA+oDiy47nkD8j5Cxhm3yrMUk
 5oBJSv/dIUpSj/lmq0tm5Uc=
X-Google-Smtp-Source: ABdhPJxYVgYx5WkBx3nd4L116cSq9pHykQvc+OkFZFrhoXbwJG25Q2EixNaR4oaRP0JNMU3Ce1ssPA==
X-Received: by 2002:a63:905:: with SMTP id 5mr18502662pgj.337.1615706919762;
 Sat, 13 Mar 2021 23:28:39 -0800 (PST)
Received: from localhost.localdomain ([2405:201:600d:a089:ed50:78e5:473:ed82])
 by smtp.googlemail.com with ESMTPSA id
 gm9sm6823247pjb.13.2021.03.13.23.28.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 23:28:39 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: leoyang.li@nxp.com
Subject: [PATCH] soc: fsl: guts: fix comment syntax in file
Date: Sun, 14 Mar 2021 12:58:28 +0530
Message-Id: <20210314072828.9270-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: yashsri421@gmail.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org
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

The opening comment mark '/**' is used for kernel-doc comments.
There are certain comments in include/linux/fsl/guts.h which follows this
syntax, but the content inside does not comply with kernel-doc.

E.g., opening comment for "Freecale 85xx and 86xx Global Utilties
register set" follows kernel-doc syntax(i.e., '/**'), but the content
inside does not comply with any kernel-doc specification (function,
struct, etc).

This causes unwelcomed warning from kernel-doc:
"warning: expecting prototype for Freecale 85xx and 86xx Global Utilties register set(). Prototype was for __FSL_GUTS_H__() instead"

Replace all such comment occurrences with general comment format,
i.e. '/*' to pervent kernel-doc from parsing these.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
* Applies perfectly on next-20210312

 include/linux/fsl/guts.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/fsl/guts.h b/include/linux/fsl/guts.h
index 0ac27b233f12..fdb55ca47a4f 100644
--- a/include/linux/fsl/guts.h
+++ b/include/linux/fsl/guts.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
-/**
+/*
  * Freecale 85xx and 86xx Global Utilties register set
  *
  * Authors: Jeff Brown
@@ -14,7 +14,7 @@
 #include <linux/types.h>
 #include <linux/io.h>
 
-/**
+/*
  * Global Utility Registers.
  *
  * Not all registers defined in this structure are available on all chips, so
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
