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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86B2CC48BDF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Jun 2021 13:50:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C73A61248
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Jun 2021 13:50:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C73A61248
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E9C2401EE;
	Fri, 18 Jun 2021 13:50:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OC4i6mGNPwtm; Fri, 18 Jun 2021 13:50:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id EA6CB4014A;
	Fri, 18 Jun 2021 13:50:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C4C63C000D;
	Fri, 18 Jun 2021 13:50:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EAA73C000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 13:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E705583B2E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 13:50:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6ZdabnzyE76v
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 13:50:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C4F9C83508
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 13:50:26 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id 131so14162467ljj.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 06:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PF1lwVLZjO0TaZRIPSE+RYDa9z8BPF1tUWPYliWRKnc=;
 b=HNXfeSlEg8BXH11sQ4vpGj1n8hXO2g66OnPe8iX33KoxwRFq3Xw2r4ZMhqDyQUNttq
 55BcvKOnz8mw9DYDTCzab4t3h3LOi//dCYSbUst9nWsRkVxGIaPdV+7sLC4j/n+vXovo
 B4oa9Rq34Q/FqSz/S9AtSl2rlUj8CTkk87aULV5oZ+p8j0CgkhP7ZQ5LDFQ8GbazkpxT
 Hjx/U0d6o3tDfH6RsitHSwfIUaocAZrSCijVmUmNXvzkXOxiW6tmQiwPfjKgyLbM0YST
 +nN0JMwjrHlCaDBg3j8YhqR3Ti2KDaddq1o+Wmo8ZVwbieTCtlnSetjOzF1McbrbnAzg
 TIgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PF1lwVLZjO0TaZRIPSE+RYDa9z8BPF1tUWPYliWRKnc=;
 b=sQOyeYVvIyaCbMA9RSLMFhzs7659LS8j3tkcScCtOuvFS8Dt9ExtOSkddCRYv8z8j6
 iAJcJM+/kueFWEHMX/WIXL40EWEqjBzIeLrwjzw8mvlxpPHOfLS+pm4UUVAJlTE8JbY0
 HvUqd5yGDObw0YgtSfUTcnq78HmxpBgYqLBjdP+77TNgmkZRoXzVyey5DUA82bOgkoMd
 00lOLQsXQvM+bsH4KX8F/B1dXel+FP1LJbmkSW+z1XhKEeHGdD7ClQ6V530aBX00QDaT
 DJnhlD9InICjEXhl7dYzQoiA67EMJfQR7jChueo35WWgfdZm3qLv0T360qZ4E8ky8DfK
 Ay4w==
X-Gm-Message-State: AOAM530PLkiqSpQ6LAaBOtj9syVyM2+IxsqjQN8BM/CCQuPB5mb9Uwln
 uFGK5o3hjolHkWm4K09C+Nw=
X-Google-Smtp-Source: ABdhPJxrJ9TDOw/Wl4DcvgjPxkQjBduGj9Lc2qQ214ODXqD3Tm33ax8AK4edkHfd/5Z3WlnEQR+5Ig==
X-Received: by 2002:a2e:580e:: with SMTP id m14mr9599947ljb.197.1624024224596; 
 Fri, 18 Jun 2021 06:50:24 -0700 (PDT)
Received: from localhost.localdomain ([94.103.229.24])
 by smtp.gmail.com with ESMTPSA id r9sm918112lfm.158.2021.06.18.06.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 06:50:23 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: reksio@newterm.pl,
	davem@davemloft.net,
	kuba@kernel.org
Subject: [PATCH] net: ethernet: fix potential use-after-free in ec_bhf_remove
Date: Fri, 18 Jun 2021 16:49:02 +0300
Message-Id: <20210618134902.9793-1-paskripkin@gmail.com>
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

static void ec_bhf_remove(struct pci_dev *dev)
{
...
	struct ec_bhf_priv *priv = netdev_priv(net_dev);

	unregister_netdev(net_dev);
	free_netdev(net_dev);

	pci_iounmap(dev, priv->dma_io);
	pci_iounmap(dev, priv->io);
...
}

priv is netdev private data, but it is used
after free_netdev(). It can cause use-after-free when accessing priv
pointer. So, fix it by moving free_netdev() after pci_iounmap()
calls.

Fixes: 6af55ff52b02 ("Driver for Beckhoff CX5020 EtherCAT master module.")
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/net/ethernet/ec_bhf.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ec_bhf.c b/drivers/net/ethernet/ec_bhf.c
index 46b0dbab8aad..7c992172933b 100644
--- a/drivers/net/ethernet/ec_bhf.c
+++ b/drivers/net/ethernet/ec_bhf.c
@@ -576,10 +576,12 @@ static void ec_bhf_remove(struct pci_dev *dev)
 	struct ec_bhf_priv *priv = netdev_priv(net_dev);
 
 	unregister_netdev(net_dev);
-	free_netdev(net_dev);
 
 	pci_iounmap(dev, priv->dma_io);
 	pci_iounmap(dev, priv->io);
+
+	free_netdev(net_dev);
+
 	pci_release_regions(dev);
 	pci_clear_master(dev);
 	pci_disable_device(dev);
-- 
2.32.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
