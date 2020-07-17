Return-Path: <SRS0=nKGu=A4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB4FBC433E8
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 03:58:28 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBC3F20739
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 03:58:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lhuvquXT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBC3F20739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 98C2A864B3;
	Fri, 17 Jul 2020 03:58:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fASK8B7KRqQK; Fri, 17 Jul 2020 03:58:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4A58C864AD;
	Fri, 17 Jul 2020 03:58:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 37773C0893;
	Fri, 17 Jul 2020 03:58:28 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 720B9C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 03:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 67217203E0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 03:58:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xRegXNDsVCOb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 03:58:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by silver.osuosl.org (Postfix) with ESMTPS id D83D42035B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 03:58:25 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id b92so5743265pjc.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 20:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zkwfq5Uv+GY1uwPYszvR2jSGTXRIJ42mdhpNQh9+c3E=;
 b=lhuvquXTh98LzGrLH3A6gsJcb/6gr9Yecke49um+BtmAznQ7j2KoJdKAYYMrCJ4jtu
 q+E31pDYVZ5SY8mIlr+06VbIncUv3I5fluiXXnFVCmFxFmEqw9T1XiF3ziRuG9IYvoBp
 8Qs+P7bdPnmXdydbtcQP56KBvIFF+8JLIAfKiKZPv6YNlBs7isW9PGf/aMbKIfqT26MF
 s2CG9YSISdUW4sMafArMv0X0stcOZH2rGTBYZ6kZLw9QuXRjIzOZ1/hZ2PXx9SufkOQp
 MeVz4WDm+3DdKP2htXG89eLCmTIgEYNNFXawb9i+mpcxQevDy70rIBJZw9gu4r2eRNxD
 tn6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zkwfq5Uv+GY1uwPYszvR2jSGTXRIJ42mdhpNQh9+c3E=;
 b=WCA1EEVgyjrBT+qllYORxVjXKJib6fw/sD3lNdUVv7QFYVpX5Y8kgskWLCY91urGnz
 0l+uIpoNIm1vJ7HFY4Pw8dxQU5Z+oYRPMRwKUDkO5ouQUcHGv/jeoaYY33VBYfBv0y1Q
 i+mP9F1x948bpTCDwA15SGkFbPHZIpsDObji8MMk41ueiYmNnh599zcI0XKb4JAs0uM3
 eV1FxW6vwNsDBHSFQwNQ5uTgAb3P4ib2yE0b69Kr1rx1SAfGm3DK7euSZAYoQaiIMKP5
 di4nvnoNF5WSubpaASkewzkRmiLXlhZ3grF/JO3qF023z+6PT6B8oQ+GOJTl32GYXMfk
 5nnw==
X-Gm-Message-State: AOAM532haKXCsP+lOWCBzMXBMF9a1cfdfWQ57Gf6PrFGPd9YvMuYjm7A
 I15yDhUZVRYdbFVBDG8sa1Y=
X-Google-Smtp-Source: ABdhPJyb7s566EgEI5F+X4b7pgZcGEbw6DNOfk6/Xm3jbpNrZLoR3mhRC866dwJSjrm+XyUgMWdrVg==
X-Received: by 2002:a17:90a:db82:: with SMTP id
 h2mr8156594pjv.162.1594958305431; 
 Thu, 16 Jul 2020 20:58:25 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id v11sm6227907pgs.22.2020.07.16.20.58.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 20:58:25 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Date: Fri, 17 Jul 2020 09:26:04 +0530
Message-Id: <20200717035608.97254-3-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717035608.97254-1-vaibhavgupta40@gmail.com>
References: <20200717035608.97254-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-media@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v2 2/6] cx23885: use generic power
	management
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
callbacks from struct "pci_driver".

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/media/pci/cx23885/cx23885-core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/pci/cx23885/cx23885-core.c b/drivers/media/pci/cx23885/cx23885-core.c
index 7e0b0b7cc2a3..4b0c53f61fb7 100644
--- a/drivers/media/pci/cx23885/cx23885-core.c
+++ b/drivers/media/pci/cx23885/cx23885-core.c
@@ -2235,9 +2235,6 @@ static struct pci_driver cx23885_pci_driver = {
 	.id_table = cx23885_pci_tbl,
 	.probe    = cx23885_initdev,
 	.remove   = cx23885_finidev,
-	/* TODO */
-	.suspend  = NULL,
-	.resume   = NULL,
 };
 
 static int __init cx23885_init(void)
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
