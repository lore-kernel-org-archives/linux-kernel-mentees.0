Return-Path: <SRS0=ha8c=IN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AC2CC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Mar 2021 17:33:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 234DE64E98
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Mar 2021 17:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 234DE64E98
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF9B26E8F5;
	Mon, 15 Mar 2021 17:33:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w95vEOgTa-AC; Mon, 15 Mar 2021 17:33:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id E247760625;
	Mon, 15 Mar 2021 17:33:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B98BDC000C;
	Mon, 15 Mar 2021 17:33:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1BC28C000A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Mar 2021 17:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6E98834DB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Mar 2021 17:33:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oe1Dg8PY2f2Z
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Mar 2021 17:33:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3282382D17
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Mar 2021 17:33:10 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id n17so12099582plc.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Mar 2021 10:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=JVL1LdnC9riyRpbnJrHgoR/ByMBICezHbJM/3f4VGqk=;
 b=l/8CHKwpbPpr5pQct7s45rPhRAXpdacnGnqYDPhksHU/+rHlvCB8KxPX4wZ5z/Bq9a
 wTrxF8wYseMXjOFCYxVbsrvlniJanpcrgdanJr2qYjlLCa2UDFDOhBm3rsajfSAQhBJM
 UhU+Qi7XkMXu38SwM6g7yGIuAEwt6hbYmeJaR8AffwZuAQ1VUE5Ej08laKe9bh3Ne4E7
 Ytm1jILF31M2hGEkBxh14AgPh3oLZeXaQqzv4mhl3HlmmdUErnQ6Je2tVfhd00Gal9iA
 j3Yt0WQuhoskEmJq8on/ludZ6o+IDaTjT1eS2ePSx9qH7YgkQNW3Nnmaz/leA+YbbIgH
 6fIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=JVL1LdnC9riyRpbnJrHgoR/ByMBICezHbJM/3f4VGqk=;
 b=GHR/R8e3qkuEqRZp3EMP91TtiYt0YLF2vimhLtMbZvMBLFsF6YoQy2Eads4mc+JINx
 bwmZF2+4F6rLdXodtKzH/TDoe1a5ZBi52XzW9z6BN7HQnRDAgUiNW7PL6pBBHpOBjeTA
 nEzZtSeYZU0mkMS3hzhdk9mHy1ius+/vYTUA68K3DxMpwfpyM5JElrF+DJ7RVrc/Pz3i
 VnSO0y5K9AYOBm1tLfnPqfV62k5YdkOyEeAPedYTYQ5ZbdfwUiUrdqDRKO6LRN4yAfyq
 zqPm3ebVpKYWwm1pSsAgCjhaCkH/h5ARSwy22CGV9XOM4POx1YTWb8vaE+VUxRyOM22s
 /vag==
X-Gm-Message-State: AOAM533wWMmfDGWfAtQu13BIOTctQg/+1yg/KiAh8onSliM7ECNWJhtp
 nrOzm2rEbO7porpgwev8bTg=
X-Google-Smtp-Source: ABdhPJw4d1C0VzZto8nQ3ly7wtLCvTXvYzyjwc3JUJn6MHoOyC5o0PS4i+ywz2rBHxPREp7OxQvBUQ==
X-Received: by 2002:a17:90a:ec15:: with SMTP id
 l21mr177524pjy.164.1615829589493; 
 Mon, 15 Mar 2021 10:33:09 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a089:d096:1684:81a3:45b7])
 by smtp.googlemail.com with ESMTPSA id 184sm13450898pgj.93.2021.03.15.10.33.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 10:33:09 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: kvalo@codeaurora.org
Subject: [PATCH v2] rsi: fix comment syntax in file headers
Date: Mon, 15 Mar 2021 23:02:59 +0530
Message-Id: <20210315173259.8757-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: yashsri421@gmail.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 amitkarwar@gmail.com, siva8118@gmail.com, kuba@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
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
There are some files in drivers/net/wireless/rsi which follow this syntax
in their file headers, i.e. start with '/**' like comments, which causes
unexpected warnings from kernel-doc.

E.g., running scripts/kernel-doc -none on drivers/net/wireless/rsi/rsi_coex.h
causes this warning:
"warning: wrong kernel-doc identifier on line:
 * Copyright (c) 2018 Redpine Signals Inc."

Similarly for other files too.

Provide a simple fix by replacing such occurrences with general comment
format, i.e., "/*", to prevent kernel-doc from parsing it.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
- Applies perfectly on next-20210312

Changes in v2:
- Convert the patch series to a single patch as suggested by Lukas and Kalle

 drivers/net/wireless/rsi/rsi_boot_params.h | 2 +-
 drivers/net/wireless/rsi/rsi_coex.h        | 2 +-
 drivers/net/wireless/rsi/rsi_common.h      | 2 +-
 drivers/net/wireless/rsi/rsi_debugfs.h     | 2 +-
 drivers/net/wireless/rsi/rsi_hal.h         | 2 +-
 drivers/net/wireless/rsi/rsi_main.h        | 2 +-
 drivers/net/wireless/rsi/rsi_mgmt.h        | 2 +-
 drivers/net/wireless/rsi/rsi_ps.h          | 2 +-
 drivers/net/wireless/rsi/rsi_sdio.h        | 2 +-
 drivers/net/wireless/rsi/rsi_usb.h         | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/rsi/rsi_boot_params.h b/drivers/net/wireless/rsi/rsi_boot_params.h
index c1cf19d1e376..30e03aa6a529 100644
--- a/drivers/net/wireless/rsi/rsi_boot_params.h
+++ b/drivers/net/wireless/rsi/rsi_boot_params.h
@@ -1,4 +1,4 @@
-/**
+/*
  * Copyright (c) 2014 Redpine Signals Inc.
  *
  * Permission to use, copy, modify, and/or distribute this software for any
diff --git a/drivers/net/wireless/rsi/rsi_coex.h b/drivers/net/wireless/rsi/rsi_coex.h
index 0fdc67f37a56..2c14e4c651b9 100644
--- a/drivers/net/wireless/rsi/rsi_coex.h
+++ b/drivers/net/wireless/rsi/rsi_coex.h
@@ -1,4 +1,4 @@
-/**
+/*
  * Copyright (c) 2018 Redpine Signals Inc.
  *
  * Permission to use, copy, modify, and/or distribute this software for any
diff --git a/drivers/net/wireless/rsi/rsi_common.h b/drivers/net/wireless/rsi/rsi_common.h
index 60f1f286b030..7aa5124575cf 100644
--- a/drivers/net/wireless/rsi/rsi_common.h
+++ b/drivers/net/wireless/rsi/rsi_common.h
@@ -1,4 +1,4 @@
-/**
+/*
  * Copyright (c) 2014 Redpine Signals Inc.
  *
  * Permission to use, copy, modify, and/or distribute this software for any
diff --git a/drivers/net/wireless/rsi/rsi_debugfs.h b/drivers/net/wireless/rsi/rsi_debugfs.h
index 580ad3b3f710..a6a28640ad40 100644
--- a/drivers/net/wireless/rsi/rsi_debugfs.h
+++ b/drivers/net/wireless/rsi/rsi_debugfs.h
@@ -1,4 +1,4 @@
-/**
+/*
  * Copyright (c) 2014 Redpine Signals Inc.
  *
  * Permission to use, copy, modify, and/or distribute this software for any
diff --git a/drivers/net/wireless/rsi/rsi_hal.h b/drivers/net/wireless/rsi/rsi_hal.h
index 46e36df9e8e3..d044a440fa08 100644
--- a/drivers/net/wireless/rsi/rsi_hal.h
+++ b/drivers/net/wireless/rsi/rsi_hal.h
@@ -1,4 +1,4 @@
-/**
+/*
  * Copyright (c) 2017 Redpine Signals Inc.
  *
  * Permission to use, copy, modify, and/or distribute this software for any
diff --git a/drivers/net/wireless/rsi/rsi_main.h b/drivers/net/wireless/rsi/rsi_main.h
index 73a19e43106b..a1065e5a92b4 100644
--- a/drivers/net/wireless/rsi/rsi_main.h
+++ b/drivers/net/wireless/rsi/rsi_main.h
@@ -1,4 +1,4 @@
-/**
+/*
  * Copyright (c) 2014 Redpine Signals Inc.
  *
  * Permission to use, copy, modify, and/or distribute this software for any
diff --git a/drivers/net/wireless/rsi/rsi_mgmt.h b/drivers/net/wireless/rsi/rsi_mgmt.h
index 2ce2dcf57441..236b21482f38 100644
--- a/drivers/net/wireless/rsi/rsi_mgmt.h
+++ b/drivers/net/wireless/rsi/rsi_mgmt.h
@@ -1,4 +1,4 @@
-/**
+/*
  * Copyright (c) 2014 Redpine Signals Inc.
  *
  * Permission to use, copy, modify, and/or distribute this software for any
diff --git a/drivers/net/wireless/rsi/rsi_ps.h b/drivers/net/wireless/rsi/rsi_ps.h
index 98ff6a4ced57..0be2f1e201e5 100644
--- a/drivers/net/wireless/rsi/rsi_ps.h
+++ b/drivers/net/wireless/rsi/rsi_ps.h
@@ -1,4 +1,4 @@
-/**
+/*
  * Copyright (c) 2017 Redpine Signals Inc.
  *
  * Permission to use, copy, modify, and/or distribute this software for any
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
diff --git a/drivers/net/wireless/rsi/rsi_usb.h b/drivers/net/wireless/rsi/rsi_usb.h
index 8702f434b569..254d19b66412 100644
--- a/drivers/net/wireless/rsi/rsi_usb.h
+++ b/drivers/net/wireless/rsi/rsi_usb.h
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
