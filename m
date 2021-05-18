Return-Path: <SRS0=n6YR=KN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D03FC433ED
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 May 2021 18:35:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C92AF6124C
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 May 2021 18:35:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C92AF6124C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92073403E5;
	Tue, 18 May 2021 18:35:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id itQH5rGcFSh8; Tue, 18 May 2021 18:35:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id AFA744053F;
	Tue, 18 May 2021 18:35:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 90997C0011;
	Tue, 18 May 2021 18:35:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 96FAFC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 May 2021 18:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84D9F843EE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 May 2021 18:35:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ujsVybmL5rmf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 May 2021 18:35:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EB695843EA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 May 2021 18:35:04 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id t21so5609206plo.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 May 2021 11:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=0pCWCxkW1MMIQdUudHsoJuhPPHXRdzzJG0c8w1tSeR8=;
 b=DHCTvpnRHFzDo6XLOCLXRpjbdKxJDtobPp/gG1DSW+bd5JGzPqzrwnQLtwaCS0OYOX
 FMokn8fNxWWVGF3B/Ys1IST+fUl7tmOXv4j6Jq571gVQdpPkfc8KCdMn3FDgHt2aEOdi
 i4YO2+CKHv2gjodBspCage4Ne3xIk3BzXRM9dzj9MgILfJgibNDqwdqB+en3y41SXE6m
 phSgAu9lnvJ9mByvcRKh5HKxenhpOW5x8xGKFwMHN7CrxE3sH/w1fJe3tiLd2jVBNy9l
 rEtokD2XBH31JspFeZnJn52WanjrAMPyPq6BJyNS8PVihR/3NnW0mD/gYiMuTbAf9jM6
 Z3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=0pCWCxkW1MMIQdUudHsoJuhPPHXRdzzJG0c8w1tSeR8=;
 b=MRQk5sNHcgmRk9dk76AMItj99EZwgnhcfR214ssfrvy/jQRqfkzHrlapKr84Dl0Nu8
 0Zz5wwvBzKvizI1R1Yoae1cveRAYvnbwJEwECN8f827mVtnkVzY3W7v60KOtmwJWQ30B
 YmFDaF0duoe9BaM0loaxl042oAcSp32YejqKl8TPFy9y2wl1h7fhRSVvSGilKheMxbm8
 8X1LPFQQqKI+a0qqykmGFLj5Rc80XvfxsN911JKwYaH5RPH78RCaSnKyI76q6RTJMUQ5
 xmRPHypYHmD0zve0FbU088nZ4fRGA+gwPRQu/y/DoHhipCvc+aTiNBVNvvhsnmlyKGbQ
 XFKw==
X-Gm-Message-State: AOAM531px/b4aJbzGT6Lg8LngW3X3USSwSmma6tVnJkDmAy/vPzK9Lim
 oUWlt57hz06eSi5ZuiIjO0I=
X-Google-Smtp-Source: ABdhPJxHN3lWgTNEvcx/VMEkuYOz7LIOeUXbyu5dHUFxytplk6xsY6N/J6jQsW8nL55plSd+ZpQawQ==
X-Received: by 2002:a17:90a:1641:: with SMTP id
 x1mr6383343pje.114.1621362904275; 
 Tue, 18 May 2021 11:35:04 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a93f:e998:b72d:dcc8:8823])
 by smtp.googlemail.com with ESMTPSA id q24sm13371626pjp.6.2021.05.18.11.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 11:35:03 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: omap-twl4030: fix kernel-doc syntax in file header
Date: Wed, 19 May 2021 00:04:51 +0530
Message-Id: <20210518183451.15097-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: keescook@chromium.org, linux-doc@vger.kernel.org, rdunlap@infradead.org,
 yashsri421@gmail.com, grandmaster@al2klimov.de, akpm@linux-foundation.org,
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

The opening comment mark '/**' is used for highlighting the beginning of
kernel-doc comments.
The header for include/linux/platform_data/omap-twl4030.h follows this
syntax, but the content inside does not comply with kernel-doc.

This line was probably not meant for kernel-doc parsing, but is parsed
due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
causes unexpected warning from kernel-doc:
warning: expecting prototype for omap(). Prototype was for _OMAP_TWL4030_H_() instead

Provide a simple fix by replacing this occurrence with general comment
format, i.e. '/*', to prevent kernel-doc from parsing it.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 include/linux/platform_data/omap-twl4030.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/platform_data/omap-twl4030.h b/include/linux/platform_data/omap-twl4030.h
index 0dd851ea1c72..68e903807dfe 100644
--- a/include/linux/platform_data/omap-twl4030.h
+++ b/include/linux/platform_data/omap-twl4030.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-/**
+/*
  * omap-twl4030.h - ASoC machine driver for TI SoC based boards with twl4030
  *		    codec, header.
  *
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
