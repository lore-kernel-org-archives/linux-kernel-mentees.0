Return-Path: <SRS0=YKtx=CQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D58EC43461
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Sep 2020 07:04:36 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 389CB206B8
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Sep 2020 07:04:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YQTXqB70"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 389CB206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C003A85ABF;
	Mon,  7 Sep 2020 07:04:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cSPqcouwhcsZ; Mon,  7 Sep 2020 07:04:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5F513858D4;
	Mon,  7 Sep 2020 07:04:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 492F9C0859;
	Mon,  7 Sep 2020 07:04:35 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 347CEC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 07:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3129986670
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 07:04:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q9SWZCg6NjxS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 07:04:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A950886669
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 07:04:33 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id c142so8145938pfb.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 07 Sep 2020 00:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FqAG9igPFBIm5I71RECWWlWkVlr9xLx/8DgDVT5uKZw=;
 b=YQTXqB70FOxoYbplD1RyiH/vGAqYc+eq5To12NwEwkCENc6+zHRu7a+LrGAIrDvBw0
 1RzYjqvjIXebbVeyrXzS1RkVhAv4EeTZo/jUY3/2mDvpGAE7hTSoXSb+7a3pF/2qGCJ9
 FQ0l53OKgDEJL+paMUH3zuNfh4jlZ9s/daOMF3LRGLPiUNBTPPhjP/m11bQ6DNPvM2aT
 33w7AsCd5YCOU00n5BbvyhrPK26KVvlbAiTs/3KuT9B4R/mZFViVvZaRXPw5DbNAlc8d
 pGjEZz08S5EuTr7+X/ZO8pRJFcA977W2yhK+TnWQxEwhPWEFBjhZR7Nv6iv1Ya5jEOZA
 /vzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FqAG9igPFBIm5I71RECWWlWkVlr9xLx/8DgDVT5uKZw=;
 b=EzX2T9c9mk3KNub/vNaHOcHr9H6/L6HC+zhzXroW0UHtK4rmHiVJhPKc4oLMqnbpz3
 myBoOc2BFb75MLj7fyAK46StAuU/bXg9u/uMaq+vgIj5I5o9vLjkq6lN4nWVWdkbElT0
 mfwgnFvwoa4qFeJTkHhG5gw3emqlp458O+E3OyRhj6iPxf83hE+N6fcmcuofpnqSYZeH
 5llQ0YkV2FanYV1hMWlTHHUBu5RAv9yVwQG8Z6W3kSi+hpjW62as2wZMtjuWil5enpec
 qrVFBmZHGLQK590Kiny5X07Yjp9oquVyxxM0BiByDKcGstpP2E3ZfkJXGmI9xqE7bj/T
 oEPg==
X-Gm-Message-State: AOAM533h7oXPrWl84CxlEQVoTMxWRyWAncQZSBqy51G7m9DBkKUqhN/r
 9c6ye7G+TJB6d9r4EjPDlrs=
X-Google-Smtp-Source: ABdhPJyD3ea1SKxV0y/fkOts7IPF7fAry7BYAtFdP95oJdb+n9w9Ob7nfkX1K7RX16sJHgCqyTyFTQ==
X-Received: by 2002:a63:8ac8:: with SMTP id
 y191mr15696084pgd.159.1599462273169; 
 Mon, 07 Sep 2020 00:04:33 -0700 (PDT)
Received: from varodek.localdomain ([106.201.26.241])
 by smtp.gmail.com with ESMTPSA id 204sm6804733pfc.200.2020.09.07.00.04.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 00:04:32 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>
Date: Mon,  7 Sep 2020 12:32:20 +0530
Message-Id: <20200907070221.29938-2-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200907070221.29938-1-vaibhavgupta40@gmail.com>
References: <20200907070221.29938-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v1 1/2] video: fbdev: aty: radeon_pm:
	remove redundant CONFIG_PM container
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

Fixes commit 42ddb453a0cd ("radeon: Conditionally compile PM code")

Before the above mentioned patch, codes between the line number 547 and
2803 were already inside "#ifdef CONFIG_PM" container. Thus, addition of
"#if defined(CONFIG_PM)" was not required in the patch. It also affected
the "#ifdef CONFIG_PPC_OF" container (line 1943-2510).

From the current snapshot of radeon_pm.c, remove:
    1434 | #if defined(CONFIG_PM)
and,
    2213 | #endif

This removes the redundant CONFIG_PM directive as well as fixes the
CONFIG_PPC (earlier CONFIG_PPC_OF) container.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/video/fbdev/aty/radeon_pm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/video/fbdev/aty/radeon_pm.c b/drivers/video/fbdev/aty/radeon_pm.c
index 7c4483c7f313..b9af70bd656a 100644
--- a/drivers/video/fbdev/aty/radeon_pm.c
+++ b/drivers/video/fbdev/aty/radeon_pm.c
@@ -1431,7 +1431,6 @@ static void radeon_pm_full_reset_sdram(struct radeonfb_info *rinfo)
 	mdelay( 15);
 }
 
-#if defined(CONFIG_PM)
 #if defined(CONFIG_X86) || defined(CONFIG_PPC_PMAC)
 static void radeon_pm_reset_pad_ctlr_strength(struct radeonfb_info *rinfo)
 {
@@ -2210,7 +2209,6 @@ static void radeon_reinitialize_M9P(struct radeonfb_info *rinfo)
 	radeon_pm_m10_enable_lvds_spread_spectrum(rinfo);
 }
 #endif
-#endif
 
 #if 0 /* Not ready yet */
 static void radeon_reinitialize_QW(struct radeonfb_info *rinfo)
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
