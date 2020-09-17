Return-Path: <SRS0=D/zP=C2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06A1CC43461
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Sep 2020 11:56:35 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B3362072E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Sep 2020 11:56:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fog2lnoB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B3362072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 25E7A86D2D;
	Thu, 17 Sep 2020 11:56:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xdhbhw2JKXKP; Thu, 17 Sep 2020 11:56:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A991A86C6A;
	Thu, 17 Sep 2020 11:56:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A08C4C0888;
	Thu, 17 Sep 2020 11:56:33 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 214E9C0859
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Sep 2020 11:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 159EA20109
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Sep 2020 11:56:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K4XNBDtRd8Tv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Sep 2020 11:56:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 7111120029
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Sep 2020 11:56:31 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id j34so1224681pgi.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Sep 2020 04:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mwiQFVnuTHeY2gHO84RjfglTiONbgKCnCABvveUVThQ=;
 b=fog2lnoBs5qYsr5GrZjMLZkHrGQzLIkBtCDjTB6v6YavrHLMIaty8smqYvFmhhMSG3
 /0oWuGGlHgQ4Qmq6Tgzhi73UmJBCceymEh9Qb7pogguXjlESeoA0cXVCOdH6WYggopgS
 hPmPcr3Fq1xge9VxAkQcMfxfIqbHyCHSznSrOPn7N7pM8bfElXrjMK9Dnekm0/Vdv/tt
 M8mplQV1BCO+z1S9pm9dNswcjKy0W/wJN1FfwDltHSnP/LKHy63JEZfwKsKYbm6U8Eh6
 YEvlwNz+CfywCbuGKHbx3ogbeEkqp+3Oe5CkzAAznQ6GNqqjhSblG/CIj6ZR33qnOSdY
 LjKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mwiQFVnuTHeY2gHO84RjfglTiONbgKCnCABvveUVThQ=;
 b=TvQ5VuaurMFYyPZCo3gfRprHN3+nzHb+EiQ4tvfoa6uJ1dKrKKKd0HtZWjCJX4yVlv
 1W/tD9OjKMzkBAWXH/MPRhT84i5xK5pWZUzUs592U2AFNBCEwXgwjsfcH1EbsFuWBV7m
 S18ps/TWMR498wJQki5ms8FVIAh9V3dLy4QvOkWMU5zKOtDO8vNIiKI1gc+Ma5WkLKMz
 xQh06bZVLTcWiQKOXFHNJDz3kjPCyuPxXm3VF1mSHTCLgm38e0bmmL1eL4MA1peodJ7u
 pzJT6ghExD68N8AXT0zN1pclKNq26RwfPsaySxQG7H2c4DXqxRIRqZgemwZkAgJMMFFb
 Ulmg==
X-Gm-Message-State: AOAM532EmN/Gj75S97SXtLLCljFEGzH32X3gNMJlYYxa4NJFHk0VwUam
 gNNnvy+mBgGe+mFLNCR2Io8=
X-Google-Smtp-Source: ABdhPJy5/dKEi8cR2pyPna5g/BJeYZVG7ok2M5MO3E6XURpkuvyW2XKc2jQ9nQoMnhscG7Sd2OX2ew==
X-Received: by 2002:a62:3044:0:b029:142:2501:398b with SMTP id
 w65-20020a6230440000b02901422501398bmr10772327pfw.80.1600343790923; 
 Thu, 17 Sep 2020 04:56:30 -0700 (PDT)
Received: from varodek.localdomain ([223.190.62.192])
 by smtp.gmail.com with ESMTPSA id z1sm20174720pfz.70.2020.09.17.04.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 04:56:30 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>, Paul Mackerras <paulus@samba.org>,
 Russell King <linux@armlinux.org.uk>, Andres Salomon <dilinger@queued.net>,
 Antonino Daplas <adaplas@gmail.com>
Date: Thu, 17 Sep 2020 17:23:14 +0530
Message-Id: <20200917115313.725622-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Cc: linux-fbdev@vger.kernel.org, kernel test robot <lkp@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-geode@lists.infradead.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-kernel-mentees] [PATCH v1] fbdev: aty: remove CONFIG_PM
	container
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

The changes made in below mentioned commit removed CONFIG_PM containers
from drivers/video/fbdev/aty/atyfb_base.c but not from
drivers/video/fbdev/aty/atyfb.h for respective callbacks.

This resulted in error for implicit declaration for those callbacks.

Fixes: 348b2956d5e6 ("fbdev: aty: use generic power management")

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/video/fbdev/aty/atyfb.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/aty/atyfb.h b/drivers/video/fbdev/aty/atyfb.h
index a7833bc98225..551372f9b9aa 100644
--- a/drivers/video/fbdev/aty/atyfb.h
+++ b/drivers/video/fbdev/aty/atyfb.h
@@ -287,8 +287,8 @@ static inline void aty_st_8(int regindex, u8 val, const struct atyfb_par *par)
 #endif
 }
 
-#if defined(CONFIG_PM) || defined(CONFIG_PMAC_BACKLIGHT) || \
-defined (CONFIG_FB_ATY_GENERIC_LCD) || defined (CONFIG_FB_ATY_BACKLIGHT)
+#if defined(CONFIG_PMAC_BACKLIGHT) || defined (CONFIG_FB_ATY_GENERIC_LCD) || \
+defined (CONFIG_FB_ATY_BACKLIGHT)
 extern void aty_st_lcd(int index, u32 val, const struct atyfb_par *par);
 extern u32 aty_ld_lcd(int index, const struct atyfb_par *par);
 #endif
-- 
2.28.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
