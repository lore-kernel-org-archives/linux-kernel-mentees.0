Return-Path: <SRS0=kRYb=CI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6371C433E6
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 30 Aug 2020 09:48:46 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A33A2207BB
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 30 Aug 2020 09:48:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CxOYH1Tf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A33A2207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 691E120108;
	Sun, 30 Aug 2020 09:48:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xcBl4thMWUaI; Sun, 30 Aug 2020 09:48:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 65EE820018;
	Sun, 30 Aug 2020 09:48:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4817CC07FF;
	Sun, 30 Aug 2020 09:48:45 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6ADD9C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Aug 2020 09:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4F5D78776C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Aug 2020 09:48:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Df8SKHiN9J-O
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Aug 2020 09:48:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 45B9F87766
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Aug 2020 09:48:43 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id m8so2949590pfh.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Aug 2020 02:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JD/yNeyHUsDvJLMZBjT/sYWFLZpY6ahAJFA2kbTEKrw=;
 b=CxOYH1Tf2XZZ7ozhzxcZedMl6ZFeem+ArJRljp/K7NlzSMhFQcB/ID5mJPmpTnwcoK
 x42ftohGFpizC38lPudDUe6v74VoQ7U8/ziZLV9rmODALgdml/Xz8xDKf/nDRP2QrCaC
 vY4bU2KMLw13Fpsw1/3H/VoEhyQREDY+rnlVMFikHk7pwFKHy4ZHSM+xa6FrztIHfS8R
 4dU3XAg2Dnsts5Ben9qF4fosT/ryvaF4jzWD2ESJCxSDYhFXaVtb+vgPDkW21ekTQDxz
 mhtZKzchHCegYPaX/La1qObSySyBs5+Gx0CnqZN3aGyyAi6Oq1Jp2ud3v8HhibhZUCdi
 T3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JD/yNeyHUsDvJLMZBjT/sYWFLZpY6ahAJFA2kbTEKrw=;
 b=Dyi8QYuO+KJmyC9HxKHHVVZeHOZrcIDlFzhqEZhedvReCcyZ1pFiZVK5fMtlI4qR/a
 C6ybv+nJpnskTGOO/pLa7+vO/x1lCNHjhQOnsktUDrCcPL2oc1HmxM/e6qty+VaDMaRl
 EIOZrustVb/NVRF41gsnmR4bHrZDS5NxKD2bKAIKe2s6zBGe6W6hTbHhTqpkniLOYh8k
 PRV5br9OoJMzXNTPpLBhAUCoizcbKdoU++YS6bgYFSSfY2JUEp7WdwAU+F147R/dOnVJ
 oJzDHq3hFR2VO4ktytfl6vWwlntqkuytdxH1vPVV8RDuDWSASNVw2Fibi9Q2Di+Ve1p9
 rZlQ==
X-Gm-Message-State: AOAM5308CDvqLKZLQ0lRMFh2muNK/01ldx6H0FYSVWsYRZ97MXXuSAw5
 PA0RDA+GCNn50Mv1vGY9lMU=
X-Google-Smtp-Source: ABdhPJxV1I4M0suxwFIohpp3kBNZ+IJ+cXw5YDJ4m9TuuDZofEkMd1S2uMdN62LO7dyv0DkOAlhjhw==
X-Received: by 2002:a63:c543:: with SMTP id g3mr4820264pgd.203.1598780922842; 
 Sun, 30 Aug 2020 02:48:42 -0700 (PDT)
Received: from varodek.localdomain ([223.190.108.199])
 by smtp.gmail.com with ESMTPSA id f13sm4597019pfd.215.2020.08.30.02.48.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Aug 2020 02:48:42 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Sean Young <sean@mess.org>, Bjorn Helgaas <helgaas@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sergey Kozlov <serjk@netup.ru>,
 Abylay Ospan <aospan@netup.ru>, Hans Verkuil <hverkuil@xs4all.nl>
Date: Sun, 30 Aug 2020 15:14:14 +0530
Message-Id: <20200830094413.43816-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200830081004.GA17376@gofer.mess.org>
References: <20200830081004.GA17376@gofer.mess.org>
MIME-Version: 1.0
Cc: linux-media@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v2] netup_unidvb: drop initialization
	of PM pointers
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

The .suspend() and .resume() callbacks are not defined for this driver.
Thus, just the unlisting of PM pointers in the struct initializer will make
no change in its behavior. Still unlisting is necessary so as to get rid of
.suspend and .resume pointers as they are part of the legacy framework and
should not be used in the driver code explicitly.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/media/pci/netup_unidvb/netup_unidvb_core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/pci/netup_unidvb/netup_unidvb_core.c b/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
index 80a7c41baa90..6f3125c2d097 100644
--- a/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
+++ b/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
@@ -1016,8 +1016,6 @@ static struct pci_driver netup_unidvb_pci_driver = {
 	.id_table = netup_unidvb_pci_tbl,
 	.probe    = netup_unidvb_initdev,
 	.remove   = netup_unidvb_finidev,
-	.suspend  = NULL,
-	.resume   = NULL,
 };
 
 module_pci_driver(netup_unidvb_pci_driver);
-- 
2.28.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
