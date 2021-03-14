Return-Path: <SRS0=ODNG=IM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C29C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 14 Mar 2021 20:18:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AF9E64EB3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 14 Mar 2021 20:18:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AF9E64EB3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6273A4016B;
	Sun, 14 Mar 2021 20:18:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ex8qLg9QhKRM; Sun, 14 Mar 2021 20:18:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8ECEE40166;
	Sun, 14 Mar 2021 20:18:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 743F7C000B;
	Sun, 14 Mar 2021 20:18:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4A113C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Mar 2021 20:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3887940169
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Mar 2021 20:18:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id epAhqA0hxnf0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Mar 2021 20:18:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ACAE040166
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Mar 2021 20:18:28 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id v14so12305308pgq.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Mar 2021 13:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=2KWRxAevKiF/nnG0NBxKJ90p3c03jicsIIQLN81D4+4=;
 b=dlSZJM5E6KEIz/mQPWyAmpVaYyjY3Rvy8gwGV7saPomtCAC9wAxu23SSOTxQM+POld
 ApylWsy7XPCz/TjtLEzCQv9zfE9jW1h/lTmg/uIErdsFFSy2YpnQd8u+mkdYtpS4wACw
 0wMYw4qwMosyOfd3IGfJNYdLTrEdOZ3c3EDofPW8xb8VkyFpreYce8+qX8JENLEV9qp7
 hqkQDfZUABRmzYeUiIcSWaRs3ro97zRhkuFP3iDFS7oyiEtO9UIFW6+eFCm/MPPIP4ig
 mDiCcMq4XJJ9ybVwuOlPMGYhLj/tPjwInHbp+6mIVJ8pWp7zw8RQlvk55VfZkkOY8/cx
 uQAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=2KWRxAevKiF/nnG0NBxKJ90p3c03jicsIIQLN81D4+4=;
 b=YOy/iJMLbJ+y6ysbINFU552gd9CBMtQ+/80rs3Netkuc+jt2Al0jz7jRvKukjt5VvX
 jQfLo3ZoWCfAZ0DLpmT+fJPMJcBxUspKohCTx4O5yGvU/qPaCQLxSAhCBHNJAJGnF0nM
 PW1/i0WyyrgWrKsS81dlkZc0NAvSIeRlNlfJXqF8k5dOb7jSows3N6ed03oKCff+3lAF
 uQA5ljqD+c8xnChIOl4CZZ3ubWxTJQB7klDidFncLsMqNMP6Tspd2fqsg+hTpWL2OFTU
 rXemWnmx61uS+sNTbuPW1F80ALKL2ijzmppTYlU2MIRAiz1/YCsZeH+z75wHCj01dCYF
 A9Zg==
X-Gm-Message-State: AOAM531V3TAjXN4APisoPQWhZYTuvPZDq/2JxbJKqWMxxhR+Y/okurf2
 nCXrl7sa9it83gDouU2y7+w=
X-Google-Smtp-Source: ABdhPJy4ATZPIIwNAbFc1z03hT4a4prxYKmXxZ6RJ/mIp0hm+z5kHuivT2nYjXm2XQv/addtA2M5KQ==
X-Received: by 2002:a63:2c8f:: with SMTP id s137mr4061238pgs.51.1615753108099; 
 Sun, 14 Mar 2021 13:18:28 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a089:acdc:a5a5:c438:c1e3])
 by smtp.googlemail.com with ESMTPSA id n10sm10943793pgk.91.2021.03.14.13.18.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 13:18:27 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: siva8118@gmail.com
Subject: [PATCH 00/10] rsi: fix comment syntax in file headers
Date: Mon, 15 Mar 2021 01:48:08 +0530
Message-Id: <20210314201818.27380-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
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
There are files in drivers/net/wireless/rsi which follow this syntax in
their file headers, i.e. start with '/**' like comments, which causes
unexpected warnings from kernel-doc.

E.g., running scripts/kernel-doc -none on drivers/net/wireless/rsi/rsi_coex.h
causes this warning:
"warning: wrong kernel-doc identifier on line:
 * Copyright (c) 2018 Redpine Signals Inc."

Similarly for other files too.

Provide a simple fix by replacing the kernel-doc like comment syntax with
general format, i.e. "/*", to prevent kernel-doc from parsing it.

* The patch series applies perfectly on next-20210312

Aditya Srivastava (10):
  rsi: rsi_boot_params: fix file header comment syntax
  rsi: rsi_coex: fix file header comment syntax
  rsi: rsi_ps: fix file header comment syntax
  rsi: rsi_common: fix file header comment syntax
  rsi: rsi_mgmt: fix file header comment syntax
  rsi: rsi_main: fix file header comment syntax
  rsi: rsi_hal: fix file header comment syntax
  rsi: rsi_debugfs: fix file header comment syntax
  rsi: rsi_sdio: fix file header comment syntax
  rsi: rsi_usb: fix file header comment syntax

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

-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
