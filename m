Return-Path: <SRS0=RTaY=BH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEB2CC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 09:28:49 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96F1B20714
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 09:28:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ms8WzW9f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96F1B20714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5F85A88396;
	Tue, 28 Jul 2020 09:28:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qiZFJ+xMLErJ; Tue, 28 Jul 2020 09:28:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DBB06882CC;
	Tue, 28 Jul 2020 09:28:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D43A8C004F;
	Tue, 28 Jul 2020 09:28:48 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CD012C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 09:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BC35A844BD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 09:28:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9wczqQQxMh9F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 09:28:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6F875844A7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 09:28:47 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id e22so4042224pjt.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 02:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y5s9edaIzkddCgobfmY3uqcn7wmzvnyo8IQdQIisAEg=;
 b=ms8WzW9fy2JOJRlxGxRty1F7izoJ1DiSavf0TwZDK5owazISbPe2BdEia2Q6JjkGtI
 YO3AdTlqY99dOM01esgxBxR6l7Xi+F/gidMUU3m8UP1iX01ebs6rODmju1pJAfhgze6p
 yu/toL1lopVUU/fbcJ3B7dNhJsX9Yy30R9yp5SEMOgZiMXw0ayqSR8sN5VcEqbEOEoKg
 B9Bbc1pN437Kl13AxCWBofOXcHnjCe5ExOPaZIZKScFToeVlNs+9QBkJiyCoIMrcqhbJ
 ofFq9sfte0SEOBCEgjD+gOzK97YshhI62x0e3E0TxVoeNjOaOVMvgmP09SlXeww75HEj
 m3MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y5s9edaIzkddCgobfmY3uqcn7wmzvnyo8IQdQIisAEg=;
 b=SjW7kHO0Wow3N3tq9cWqqUgyL1AbNSQsDLtL6+RYd4EIucGw/JocH0TV2YAQXU+adp
 pqi4yTUoI+elBffeCOGR4TCho9vEo6lBES1CO+I4vCqLgwlwjZwfXbsdYiQ4HequKne2
 h2qJKlCciA1wwRAgb8tt/w0ehluNdAyFHtFVBG9OTouYV+ZQ+J/B2i3Ze7X2FLJe9vVS
 AoaBv7lY3h1mbOtKN6xySXKxduT1ohd8kIRhkLwWjW4DCNNuZQAmOBrTUZJ6CeHbZD2w
 nF6YbjTmWE7ilnSklXYx+T68iuQXYnqlSsMkXAwdBaqH3MChPPFIWj49pXOdj7N1OQZA
 pKWw==
X-Gm-Message-State: AOAM531ucdC5NjCU99x/YAskG/bLjU8x9ur5PugymVuO5TWAwBhB8vYS
 CfshC1rKH9PZR/ZHG0Qp/So=
X-Google-Smtp-Source: ABdhPJwQn0Kxf+lANu9Wff8D3FwTjJZmSHuynPC36O2mlh26UdMyd75qxUVAeTUbfxaypdwyL2aqwg==
X-Received: by 2002:a17:90a:1388:: with SMTP id
 i8mr3744902pja.210.1595928527010; 
 Tue, 28 Jul 2020 02:28:47 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id k63sm18526319pge.0.2020.07.28.02.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 02:28:46 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sergey Kozlov <serjk@netup.ru>,
 Abylay Ospan <aospan@netup.ru>, Hans Verkuil <hverkuil@xs4all.nl>
Date: Tue, 28 Jul 2020 14:57:17 +0530
Message-Id: <20200728092717.937023-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: linux-media@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1] [media] netup_unidvb: use generic
	power management
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
Still, their power management structure follows the legacy framework. To
bring it under the generic framework, simply remove the binding of
callbacks from "struct pci_driver".

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
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
