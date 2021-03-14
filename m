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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBB2BC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 14 Mar 2021 20:19:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 866F764E6B
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 14 Mar 2021 20:19:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 866F764E6B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 680B66F4EE;
	Sun, 14 Mar 2021 20:19:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z6mvxVYRgVtB; Sun, 14 Mar 2021 20:19:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 963A86F4E9;
	Sun, 14 Mar 2021 20:19:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 771F3C000B;
	Sun, 14 Mar 2021 20:19:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D0809C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Mar 2021 20:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B296F83506
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Mar 2021 20:19:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j597EfU1C15H
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Mar 2021 20:19:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E920834EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Mar 2021 20:19:07 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so13236875pjh.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Mar 2021 13:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0Y7oqwR1FBDTTUKS5d9zNCNDgoQjHTeHQRiBncE/k+0=;
 b=BuioQxTQWUbUBbe5QaDUzV9/piX+djNfC+hJ/eTRB3hSEI1zTskpOqHVzaWwLH2vCT
 KtGyBFGIBbIme3uYU2eqgMobX81TNwODQ8k2cW7I27+Vd/yi6izqiz7vALGiNuoC8Wcl
 5rVZBgsojS4XKW4jQZt3Sg0FQDZoVQ/2eUmUT/EQDUYTMhgeAp36cqwCiwMM19b8AXHF
 r9wiqZ6f/K+nPbfUePhJN5Q7eoVfLIhZOFUk3ZpWZf/IDO3dQFWYdMhAjCCcKz6BGEEq
 zSyTbz79fYzfGss/LPmsGE11IguZkHfreS+ZE5OpmmdZecHRzfMc/qHjuvV/tzqnbU66
 Pn9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0Y7oqwR1FBDTTUKS5d9zNCNDgoQjHTeHQRiBncE/k+0=;
 b=X5x/Y0tkwZSSawGxB7Ob36Xkj60MLpkz5jH2iPT0hOunotNP3v9h+iC6Hrunkv57rt
 fybdJmKLODZ2VXkD+j6iaPwTuF9R1i6mioZxm80sUunkJ3F/1U6pcs85eHZyVWc/vuMl
 pvtChFPJoi0Sh35OzPfihbXLdhe/W28D+CWD+Bt6rpmsYysSw9CpWbNUf7Ofq/W8/Ebq
 3nFjyKFbg+ZKbTDArqxAnM0pRPubZJQc0oYS2RzosQcjXyNKNQ7+Mi9ZXFjuXak5cwbh
 gJRoA2d8LAbd5M8/71IcxJleyvXeOoOqG2LFnh0WbngmWKGlbPsFEsTxOel+RtOb2+6w
 OsVw==
X-Gm-Message-State: AOAM533b+/DdliS3yeuaxZpTN5wUMP+sweUHCVrQotn4rMOkUcuKh2GM
 /Gg1JMy3im/3id40QBYf+01HHzwRtMCHGQ==
X-Google-Smtp-Source: ABdhPJxtFQhsJfyCUUEPR+2+38zQEQpHhCxeocNpXHKiv9P/2FGAK901jWyRTqn479SCQdx/kJxgTg==
X-Received: by 2002:a17:902:f242:b029:e4:6dfc:8c1f with SMTP id
 j2-20020a170902f242b02900e46dfc8c1fmr8107522plc.0.1615753146588; 
 Sun, 14 Mar 2021 13:19:06 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a089:acdc:a5a5:c438:c1e3])
 by smtp.googlemail.com with ESMTPSA id n10sm10943793pgk.91.2021.03.14.13.19.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 13:19:06 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: siva8118@gmail.com
Subject: [PATCH 08/10] rsi: rsi_debugfs: fix file header comment syntax
Date: Mon, 15 Mar 2021 01:48:16 +0530
Message-Id: <20210314201818.27380-9-yashsri421@gmail.com>
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

The header comment used in drivers/net/wireless/rsi/rsi_debugfs.h
follows kernel-doc syntax, i.e. starts with '/**'. But the content
inside the comment does not comply with kernel-doc specifications (i.e.,
function, struct, etc).

This causes unwelcomed warning from kernel-doc:
"warning: wrong kernel-doc identifier on line:
 * Copyright (c) 2014 Redpine Signals Inc."

Replace this comment syntax with general comment format, i.e. '/*' to
prevent kernel-doc from parsing it.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 drivers/net/wireless/rsi/rsi_debugfs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
