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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E80F2C48BE8
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Jun 2021 16:14:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DA39613B4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Jun 2021 16:14:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DA39613B4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F080607FB;
	Fri, 18 Jun 2021 16:14:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JsXS8BeeIABU; Fri, 18 Jun 2021 16:14:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 75CFD605DD;
	Fri, 18 Jun 2021 16:14:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 54341C000D;
	Fri, 18 Jun 2021 16:14:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C2201C000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 16:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3843607D2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 16:14:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NY9KktxX9Qr8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 16:14:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3D166605DD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 16:14:36 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id q20so17578089lfo.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 09:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iCNibqVduxNAGNvNvSGxKnoXkViyWCeY8Yq5EDWpyBo=;
 b=MNcVghv8BjiS2ohbcW8P99fw9nhuAv1NUOyyqKLz0cICZVwHPc4iCXO7x0GEBZvbbT
 fo/pGytutKhto+A11baqvyBa3LgnB+MK0Yl4ogyLoWQ5xgN9A22Un0fg1mYicz1txphA
 6AR5oRl248U5IkPEOHeknPg0GV2dlX0Bx3Jgir+vy7+KJ+CBOlwQ82G6jfu6pdll+uJu
 k5c28vlyiPtZbuPJtaT/dWrmk7IDxIQGigGmbKiQ+aDhFHw3PrIuolUFPY6mN0+HEKdu
 nPDkCTiNTSMiIGgTpwTLXkw2uyuSo+J1OU6PSKO9PlGBEGLSFja1OKrJwTog9MyO2C3A
 VRFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iCNibqVduxNAGNvNvSGxKnoXkViyWCeY8Yq5EDWpyBo=;
 b=lyXAOqRccri03093NJkGqTLjopNJUPbyLoaYSDeNvPKcV7qDmAzvNQRpzF5u12hf/J
 cA7uhutAW7rp3t39lJBE+JjMGE7QOll0sZ/XLS5mbXJVeKaJeCgobsDj0iT4Ymw8WrSf
 413Ln8vv3RTAloJoitQY5dJ4F4AmS0g7TNEyVAZEklWxi5CADwgU6vlULvlr9To5jMn9
 0UobyY6BQVcSeaUMWADHUB7rGRtYieHL3wrmaQyjR1c7dlk1Dcb3kVLLAnBMoF3nj2hU
 xBkkoFdUUUZmGuuk7SC895zWSAg/8E2jfLagjD87lplMEkLFHVkF2EMbLeB/P3hmj/KD
 tjBQ==
X-Gm-Message-State: AOAM531rSLIYJ9CP3sAAX6mNXinZTxbzrdLahOMTW5KK71ApNO7wlgjN
 6v+6AEf8DW3kT8engOfdrZE=
X-Google-Smtp-Source: ABdhPJwC9F7gO/yzdkBKWZXY3kEnos4KgIUY50ScQMqfTt5fgU7x6U7le62lri07CPV+9gLDkKgjBw==
X-Received: by 2002:a05:6512:1184:: with SMTP id
 g4mr3678397lfr.567.1624032874041; 
 Fri, 18 Jun 2021 09:14:34 -0700 (PDT)
Received: from localhost.localdomain ([94.103.229.24])
 by smtp.gmail.com with ESMTPSA id z16sm951813lfs.24.2021.06.18.09.14.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 09:14:33 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: davem@davemloft.net, kuba@kernel.org, andrew@lunn.ch, michael@walle.cc,
 abrodkin@synopsys.com, talz@ezchip.com, noamc@ezchip.com
Subject: [PATCH 1/3] net: ethernet: ezchip: fix UAF in nps_enet_remove
Date: Fri, 18 Jun 2021 19:14:31 +0300
Message-Id: <b04b3823c002aac127c16472b150466afe9b38a9.1624032669.git.paskripkin@gmail.com>
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

priv is netdev private data, but it is used
after free_netdev(). It can cause use-after-free when accessing priv
pointer. So, fix it by moving free_netdev() after netif_napi_del()
call.

Fixes: 0dd077093636 ("NET: Add ezchip ethernet driver")
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/net/ethernet/ezchip/nps_enet.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ezchip/nps_enet.c b/drivers/net/ethernet/ezchip/nps_enet.c
index e3954d8835e7..20d2c2bb26e4 100644
--- a/drivers/net/ethernet/ezchip/nps_enet.c
+++ b/drivers/net/ethernet/ezchip/nps_enet.c
@@ -642,8 +642,8 @@ static s32 nps_enet_remove(struct platform_device *pdev)
 	struct nps_enet_priv *priv = netdev_priv(ndev);
 
 	unregister_netdev(ndev);
-	free_netdev(ndev);
 	netif_napi_del(&priv->napi);
+	free_netdev(ndev);
 
 	return 0;
 }
-- 
2.32.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
