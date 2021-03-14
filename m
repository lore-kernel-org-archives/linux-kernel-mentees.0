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
	by smtp.lore.kernel.org (Postfix) with ESMTP id F11F0C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 14 Mar 2021 20:19:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A73FC64EB7
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 14 Mar 2021 20:19:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A73FC64EB7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C4806F4E9;
	Sun, 14 Mar 2021 20:19:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5_BtAnoG-f-i; Sun, 14 Mar 2021 20:19:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id B08BC6F4EA;
	Sun, 14 Mar 2021 20:19:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 92889C000B;
	Sun, 14 Mar 2021 20:19:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 45EC7C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Mar 2021 20:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34C4D4AAEE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Mar 2021 20:19:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id blIPr0BrPcGw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Mar 2021 20:19:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 55FF749823
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Mar 2021 20:19:12 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id o3so642803pfh.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Mar 2021 13:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xDPIkNauRjvdC4N9WRReIUk9uXVYcVmVjBK/Gai4y8U=;
 b=DHm9sU1QRgxWAijUn6rPrjrtt7PFkbnXyRpc5WktUB8YXiW4zEKozRxEQfB7HV6HjM
 oodOwTRVhn/MP4y/K/5lyzD6CIEMXFQeJVCZEePEhjz6GCDnYXddBANepgTR6FM4Izg4
 +6sFLZ5lxn43+Hry4rK22TX12BByyiQtPU1il+9iT7H3a5OMGff/xnVo/ButrAGss7F0
 E5q21POFuwOWJSRom0vG2+t7AIlxDBLvZTzucS9MZawM36ell1DNmPPQJAWv8AVmLADs
 VmT9yXgYsgOmJ5ePq6aOTEcTJ8z90/COkALiua1RwI0wdyFALUkJhgqDvMXv2vO1O0x4
 6Smg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=xDPIkNauRjvdC4N9WRReIUk9uXVYcVmVjBK/Gai4y8U=;
 b=MsOKiqpQEgKB4brXuEcTa45qEncCrPwmNaOZ9YRgk6z1BQpCGU6KIhJhU3ag1tECiq
 SC74KXjrhO/Or0NdVjt6Bu8bLQyZM2ID8ZQDbemU/TofmJquCmSqdmWoB35nAd93JRcq
 4yEruNiYUoxKF1ZlqYes8/2xdbdqEiqtt/M8ZH//IAQzK55KjZJbfawE6lszsY7w7wcu
 RXqGDQd8kEA7mntbIh6Usme7CXljBgqVrZ83Puv0frtx30oKB5//ZfI4mB/obOihKamH
 gzxFb95yEAC5IelWM1t+KDW79gJFReBncb/rbFmi4xVFr3rpjTkpMSWRQFZmyKYm1LgE
 T6rA==
X-Gm-Message-State: AOAM532bF2uJX7N2iVfiggVZy3UexkLg/n9Jhy0zwqyXWnB3kXKdFSvK
 VedRjlwAef+1PQ9PmFCigC3Lu+YruHqoxw==
X-Google-Smtp-Source: ABdhPJypDWoi9HLRVB0QeuY4pD3fH15hbb9WD9wACe2w7z7Bk4RdI+Fhrsvpuzfe8xS/pL+hrP2NVA==
X-Received: by 2002:aa7:9e43:0:b029:1f3:a2b3:d9fd with SMTP id
 z3-20020aa79e430000b02901f3a2b3d9fdmr7662884pfq.74.1615753151744; 
 Sun, 14 Mar 2021 13:19:11 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a089:acdc:a5a5:c438:c1e3])
 by smtp.googlemail.com with ESMTPSA id n10sm10943793pgk.91.2021.03.14.13.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 13:19:11 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: siva8118@gmail.com
Subject: [PATCH 09/10] rsi: rsi_sdio: fix file header comment syntax
Date: Mon, 15 Mar 2021 01:48:17 +0530
Message-Id: <20210314201818.27380-10-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210314201818.27380-1-yashsri421@gmail.com>
References: <20210314201818.27380-1-yashsri421@gmail.com>
Cc: yashsri421@gmail.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 amitkarwar@gmail.com, kuba@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net,
 kvalo@codeaurora.org
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

The header comment used in drivers/net/wireless/rsi/rsi_sdio.h
follows kernel-doc syntax, i.e. starts with '/**'. But the content
inside the comment does not comply with kernel-doc specifications (i.e.,
function, struct, etc).

This causes unwelcomed warning from kernel-doc:
"warning: Cannot understand  * @section LICENSE
 on line 2 - I thought it was a doc line"

Replace this comment syntax with general comment format, i.e. '/*' to
prevent kernel-doc from parsing it.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 drivers/net/wireless/rsi/rsi_sdio.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/rsi/rsi_sdio.h b/drivers/net/wireless/rsi/rsi_sdio.h
index 1c756263cf15..7c91b126b350 100644
--- a/drivers/net/wireless/rsi/rsi_sdio.h
+++ b/drivers/net/wireless/rsi/rsi_sdio.h
@@ -1,4 +1,4 @@
-/**
+/*
  * @section LICENSE
  * Copyright (c) 2014 Redpine Signals Inc.
  *
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
