Return-Path: <SRS0=f3wf=LM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6CEBC49EA3
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Jun 2021 16:14:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D9E6613BA
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Jun 2021 16:14:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D9E6613BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E5B4607FB;
	Fri, 18 Jun 2021 16:14:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e1CTPUmqLp2i; Fri, 18 Jun 2021 16:14:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 8BE11607AD;
	Fri, 18 Jun 2021 16:14:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 76405C000D;
	Fri, 18 Jun 2021 16:14:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8B503C000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 16:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78D5440478
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 16:14:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vj1KahF8wxzc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 16:14:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A355D40411
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 16:14:42 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id h4so17542469lfu.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 09:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T9okz+M2qPAYpLlhHUmFyKIgqTEHlJ9zAXaCBBl6R2o=;
 b=X/TRDAfHqp3Emi7hNQXLhA/9qb+JxRk9Rtl2H3LK43EM2L9YfbVie+MJq+TOUGNFw6
 gf23cC5NcQn2v2Y3OPMGQFi+XeypenTMBZOAN8fG/Tb231Hp1uq5J6/8Le0HiSF+giRa
 bcjepACjH16YQVOqeIPEF7R5+9UAMCUa3+hKmRP5/xnzgYWUypzjoqa/+oHEM98RjHLv
 myGRQixYozdlQjtutZBwBwX9TCYdRNRVCtKDPPELlAaAtxOBQdAPN35jaPEUQ6vx5DZ5
 FQqiw6fVuFlHI2wCUZ867XdECszBSonAO6cfO7hDhiY4wGZsKH9PWm0hUwM39GdBNVnZ
 2KfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T9okz+M2qPAYpLlhHUmFyKIgqTEHlJ9zAXaCBBl6R2o=;
 b=Zbwl1AZEbcz2sRzcqsbDX4uhPubpx4QeT16SV6Pq+zLRipU5rboZ4E+OW3BPsHhobD
 CLRZ9eIr/FYM/m4K22j3qj9iB04pl25Ro96m29xoRUK4DxCVSN0PDB7l9NKWyndaOPO6
 d28Weji5CpEeI/36duvMc++hl9fkcPGAzIsoCyl36Bdh6iXM9oy2BiVrZ7pskQDcrsmk
 13PRrAuw2FUc4UNJXBCbYVMng/KiyQRLyTZ6A2Nlo9MSro37kDGb5F9MByuymoMx3QIT
 KAptkONmAC7TyHxZMQmapgKiKaebfCMTJyn+3QJr8apXKHh4Sc1ywrWKQy/6X8/l41YI
 K8Mg==
X-Gm-Message-State: AOAM532jSknxkKGiF1mlB8L1WElbnRXcDhZ0ZixpdrbsNjb3k+Oy9GB0
 yg3Rhq28gRv7bdFxyS0SUlU=
X-Google-Smtp-Source: ABdhPJxJG+NvjpvDGi1JSzcI+V468eSj7LvLu0XhxSejd6slJ6oF4AuurfyYp3vNP69765Xj7qW31Q==
X-Received: by 2002:a05:6512:15a2:: with SMTP id
 bp34mr3673389lfb.40.1624032880483; 
 Fri, 18 Jun 2021 09:14:40 -0700 (PDT)
Received: from localhost.localdomain ([94.103.229.24])
 by smtp.gmail.com with ESMTPSA id t1sm947623lfg.252.2021.06.18.09.14.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 09:14:40 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: davem@davemloft.net, kuba@kernel.org, andrew@lunn.ch, michael@walle.cc,
 abrodkin@synopsys.com, talz@ezchip.com, noamc@ezchip.com
Subject: [PATCH 2/3] net: ethernet: ezchip: remove redundant check
Date: Fri, 18 Jun 2021 19:14:37 +0300
Message-Id: <38bf1b24e45d652242318803fa746ab27a9def23.1624032669.git.paskripkin@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1624032669.git.paskripkin@gmail.com>
References: <cover.1624032669.git.paskripkin@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
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

err varibale will be set everytime, when code gets
into this path. This check will just slowdown the execution
and that's all.

Fixes: 0dd077093636 ("NET: Add ezchip ethernet driver")
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/net/ethernet/ezchip/nps_enet.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/ezchip/nps_enet.c b/drivers/net/ethernet/ezchip/nps_enet.c
index 20d2c2bb26e4..c562a1e83913 100644
--- a/drivers/net/ethernet/ezchip/nps_enet.c
+++ b/drivers/net/ethernet/ezchip/nps_enet.c
@@ -630,8 +630,7 @@ static s32 nps_enet_probe(struct platform_device *pdev)
 out_netif_api:
 	netif_napi_del(&priv->napi);
 out_netdev:
-	if (err)
-		free_netdev(ndev);
+	free_netdev(ndev);
 
 	return err;
 }
-- 
2.32.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
