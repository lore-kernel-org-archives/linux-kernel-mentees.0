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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76F68C48BE8
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Jun 2021 14:58:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E43B61159
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Jun 2021 14:58:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E43B61159
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1914838F7;
	Fri, 18 Jun 2021 14:58:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gnnjnHNhAuUS; Fri, 18 Jun 2021 14:58:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 289AC83508;
	Fri, 18 Jun 2021 14:58:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F1143C000D;
	Fri, 18 Jun 2021 14:58:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1FDADC000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 14:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B54683CB7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 14:58:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CIfsFcpzhEBi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 14:58:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 19BA783AF1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 14:58:07 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id c11so14422670ljd.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 07:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/qj/DCC40E5M+kCTzyQzmzT+i3lfMX82yvvAMuTPy2U=;
 b=cFQE0qieACEbE3MXNtJXVtJVIphvFTDMgjWLhBis+vgXG8x+Y/vg4nO6n3EwvTDbdR
 4Fwv9v+8wdFgt6+AxGYaUqdOQ3R9OVVVrSNOmrVOX0UZUFvdARQKN7iNEnjhmulBOlni
 XrwHdjkEwUQEceZdgzKr0PX+adT6Dk9GHXw4T0dN6WRWy4q1Zs2g5klt1JzAYq+g5XQa
 jz2PbbN34JJDr3k0Kphhh6oG4WPl27bMQbqdg6xxuPR89grUFzs9UF44USt7Z2Q5ltpi
 C1xc9MHMk36XQmF6atHscxja8Wqm7ZCTbNYlPKrhrdtkraG9RTueD1dyLyEnOFcn2bWb
 yB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/qj/DCC40E5M+kCTzyQzmzT+i3lfMX82yvvAMuTPy2U=;
 b=Hbbe+ftUfiO7Fjj7h/iwFifYb9lr0eFKz6oWiCODzn9eb9jVYiWCwEdH9zBzYhvNZm
 LNfnn+8hbpqbp2ZgIrhAT87Ied35U74IRzgzXmaBzW+hXg9zJrLskWHdnVwzJqC1BTfm
 Fet+BuydIqg1geqfF10jsIm0IT4403cE2BB5j35Bg8gvENgAS/4wNKi4HcnY7zFa1Cpi
 PVn7hFXeYQdIKWH6kamVcQVKcReS0m22hOCHJZ5gC559MSUPHyEGoX+P6gRV5wFow9wP
 rID7+YvbyXKMKXSGopI5dSQMNKllS/eyKqlXgAEMiTk8itjIwr/Njq8e9cTomoWu4r1F
 0yLA==
X-Gm-Message-State: AOAM531jBR73LdLYPXQuOc+CTiyz++iassaH7uCOTVTmB9FymRAGmvdM
 wKYQfdnvg35HndUNGBdkhIY=
X-Google-Smtp-Source: ABdhPJw7f+3Y9SP91OWBd+PShL4pBiEpOayUISaL5/8ItN1P8uUmgIFeUG4tv7ywNIQjXVfXdSWK3w==
X-Received: by 2002:a2e:a7c9:: with SMTP id x9mr10076282ljp.333.1624028284877; 
 Fri, 18 Jun 2021 07:58:04 -0700 (PDT)
Received: from localhost.localdomain ([94.103.229.24])
 by smtp.gmail.com with ESMTPSA id b16sm1020471lff.210.2021.06.18.07.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 07:58:04 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: andreas@gaisler.com, davem@davemloft.net, kuba@kernel.org,
 kristoffer@gaisler.com
Subject: [PATCH] net: ethernet: aeroflex: fix UAF in greth_of_remove
Date: Fri, 18 Jun 2021 17:57:31 +0300
Message-Id: <20210618145731.32194-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.32.0
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

static int greth_of_remove(struct platform_device *of_dev)
{
...
	struct greth_private *greth = netdev_priv(ndev);
...
	unregister_netdev(ndev);
	free_netdev(ndev);

	of_iounmap(&of_dev->resource[0], greth->regs, resource_size(&of_dev->resource[0]));
...
}

greth is netdev private data, but it is used
after free_netdev(). It can cause use-after-free when accessing greth
pointer. So, fix it by moving free_netdev() after of_iounmap()
call.

Fixes: d4c41139df6e ("net: Add Aeroflex Gaisler 10/100/1G Ethernet MAC driver")
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/net/ethernet/aeroflex/greth.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/aeroflex/greth.c b/drivers/net/ethernet/aeroflex/greth.c
index d77fafbc1530..c560ad06f0be 100644
--- a/drivers/net/ethernet/aeroflex/greth.c
+++ b/drivers/net/ethernet/aeroflex/greth.c
@@ -1539,10 +1539,11 @@ static int greth_of_remove(struct platform_device *of_dev)
 	mdiobus_unregister(greth->mdio);
 
 	unregister_netdev(ndev);
-	free_netdev(ndev);
 
 	of_iounmap(&of_dev->resource[0], greth->regs, resource_size(&of_dev->resource[0]));
 
+	free_netdev(ndev);
+
 	return 0;
 }
 
-- 
2.32.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
