Return-Path: <SRS0=sW3u=BQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F5D8C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  6 Aug 2020 11:08:04 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CEA8204FD
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  6 Aug 2020 11:08:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IvDXjycJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CEA8204FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id DE91522851;
	Thu,  6 Aug 2020 07:28:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qi8DRvPIX42a; Thu,  6 Aug 2020 07:28:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 746A12152E;
	Thu,  6 Aug 2020 07:28:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 69539C0050;
	Thu,  6 Aug 2020 07:28:51 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6488DC004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Aug 2020 07:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 502838875A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Aug 2020 07:28:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bcj29NTNcKdQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Aug 2020 07:28:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7697288751
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Aug 2020 07:28:48 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id s15so14676781pgc.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 06 Aug 2020 00:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FqAG9igPFBIm5I71RECWWlWkVlr9xLx/8DgDVT5uKZw=;
 b=IvDXjycJnrN8Jo7WOBOS09G5BUYYTTV0IUIJ9wpcXxQy05TLWKQNzNu8lHaucHzSTl
 y68SIu+ULcnB5LCS2k/2pAog5eVaeK59DOrn7Z4pvWw2CZNrj+VSyTR48547nrbJmXLf
 hNYZIS5cKTNqbnINKSo3O+eKgE+R6PSujzrkqM1SFkprvg6OgiQGp1gZ/TVp04zhgHZU
 BFxDkEwDpOwo2cyhyyzPRFE/ToughqUKSMHPNmIpdlRZm3hwFF8IMHtBGdhpe6Soulnk
 B6+2OMFoiJ5pjrGNm2/n7kLLcolyCh+w87JV4SKPjqbid+Hqb9RcSRjygSIOXlNv8dcV
 UIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FqAG9igPFBIm5I71RECWWlWkVlr9xLx/8DgDVT5uKZw=;
 b=GLi4jvLaWAAF3u5W9TVMtg2JdruzPmOPLAwOEwVJ1V0IXAqTWNy3Az3nMyzs31hptq
 gP7NApYIn+T9V5UdTIe1t8rj+jg8LWLaAA+V+qh/Sfbdq6Kctg1Y9paT4L+S3bnyYO0k
 JFC6OMZxrEH8HXrDFsI2t87/rrSDwPBD/cpNI+ekYerTSpC2IER9y6GkWcviqcSJLqTA
 OSWwUJu5JMnaBr2VvYmDuIpMpV5geeMuO0YG+YKgBJ8jmBVK6I4p9ch+VQCs88h3OlTE
 IqHPji0Bm+8KErfWR45cjwHv6oFk+/BHl/mxHPS3htdSm8mc5mjRZvVuGCOQbQy7MWLo
 AS2w==
X-Gm-Message-State: AOAM530G3J8FNWNrWo/Qkb4Mbap+J2qNWtB5i1M2Qy33Z9ApjrEZ6BJU
 JUyCm1xL8qsLRTJdDZmPEdc=
X-Google-Smtp-Source: ABdhPJxVKJqpZfSMdLJ6I807JIkHlELXYBb82Be8Y42ptKkZOHmfshPFYt72e4K8u4JCl6vyNn+7gw==
X-Received: by 2002:a65:484c:: with SMTP id i12mr6512604pgs.145.1596698928075; 
 Thu, 06 Aug 2020 00:28:48 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id e125sm6654646pfh.69.2020.08.06.00.28.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 00:28:47 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>
Date: Thu,  6 Aug 2020 12:56:57 +0530
Message-Id: <20200806072658.592444-2-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200806072658.592444-1-vaibhavgupta40@gmail.com>
References: <20200806072256.585705-1-vaibhavgupta40@gmail.com>
 <20200806072658.592444-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-fbdev@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
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
