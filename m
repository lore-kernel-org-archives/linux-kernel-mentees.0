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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71EE5C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 03:58:44 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4510C20838
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 03:58:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bKpE8LOj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4510C20838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id F3B32203E7;
	Fri, 17 Jul 2020 03:58:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9olWMwR7XxRD; Fri, 17 Jul 2020 03:58:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 66BC62035B;
	Fri, 17 Jul 2020 03:58:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5509AC0893;
	Fri, 17 Jul 2020 03:58:43 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E29A2C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 03:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D16B9203E7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 03:58:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F3LNEyLLsGef
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 03:58:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 4AC3E2035B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 03:58:41 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id u5so4739156pfn.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 20:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uoIcD6K+jqu+zRT0DyWA5LlYkttEC1REY3iS6fetokg=;
 b=bKpE8LOjMvFIC6gWt1Rw1tJ7UdBTguCQsj3+hovT5dVVSMINoc2pucCNbUUnbTkIup
 fOYndAIcKasKzo2sCIFJpj5z2pHQ3zW/YBhK2UyErJpjDAWzD5xMZBE0IuazYc6yoagl
 llPHEsuW3TyFWfs878gNgNyoBaLbYyTYXtg9VfTLnwMuIJQKImcSTwpm19AlK763gDiU
 xHvkPpTMGSwUBvAL/fzqaiTXm4fXHYuPOCvys5xTQYqSLXoCpg9jjYXRiDCHbEdY0g7c
 7qV8vNk6VLM0S/6N8kh1yI/xJ7FhojVNW1Fb40c0h9pktvLb9x4XRyfG4StDAy8nVS/f
 iUcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uoIcD6K+jqu+zRT0DyWA5LlYkttEC1REY3iS6fetokg=;
 b=Uv2tR/lWSqwZH8ftGC9cFycn3rTey9XXOBs36SizYL0PD73ni5s6Ev8xkhUu1hnB+D
 Q8sJ6NTXeCszuAsUQeeYlciH+z8t1X91Swx38ccxP9865yUXgGrPJhnORjfoPDEVsAaa
 NDHEobEkPscaxDeDstbMoRkzieSg0lXN/CTF2pExN64UGXoW+vjll14B4Xvihzx5SRBj
 Ns9aaG0yjHbD8WmU6CurqmeSPHGdgQCBU534ixut75r4Asj3UapLtLaQcNWLObwgpvBO
 zMs3pww4wZ9gPsEHFuzWp0C5CLBe0i2GD32nJA0qEVH9JKaruZDcomTDpeygVAYUjk9T
 P1dA==
X-Gm-Message-State: AOAM533rGjopQieOvXi3bwefRaA5hDso4MN2BwV1XrwOImGED/5gVpaf
 etwWWXxBFkrPN0QliEK4JaQ+IloSjKk=
X-Google-Smtp-Source: ABdhPJwuoPA25J5s/ea5ilueDEYzrTbRAno/FQjJKgAyD7vJ0/bwceFuK19x/GbKuYSaE4iOASm8rA==
X-Received: by 2002:a65:4502:: with SMTP id n2mr7042061pgq.132.1594958320850; 
 Thu, 16 Jul 2020 20:58:40 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id v11sm6227907pgs.22.2020.07.16.20.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 20:58:40 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Date: Fri, 17 Jul 2020 09:26:05 +0530
Message-Id: <20200717035608.97254-4-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717035608.97254-1-vaibhavgupta40@gmail.com>
References: <20200717035608.97254-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-media@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v2 3/6] cx25821: use generic power
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
 drivers/media/pci/cx25821/cx25821-core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/pci/cx25821/cx25821-core.c b/drivers/media/pci/cx25821/cx25821-core.c
index 41be22ce66f3..55018d9e439f 100644
--- a/drivers/media/pci/cx25821/cx25821-core.c
+++ b/drivers/media/pci/cx25821/cx25821-core.c
@@ -1374,9 +1374,6 @@ static struct pci_driver cx25821_pci_driver = {
 	.id_table = cx25821_pci_tbl,
 	.probe = cx25821_initdev,
 	.remove = cx25821_finidev,
-	/* TODO */
-	.suspend = NULL,
-	.resume = NULL,
 };
 
 static int __init cx25821_init(void)
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
