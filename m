Return-Path: <SRS0=pv0Q=LT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 857C2C2B9F4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 25 Jun 2021 21:26:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15360616EA
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 25 Jun 2021 21:26:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15360616EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDFE342263;
	Fri, 25 Jun 2021 21:26:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZjOBZcZdG_Eh; Fri, 25 Jun 2021 21:26:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 9ED26421FD;
	Fri, 25 Jun 2021 21:26:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 78201C001A;
	Fri, 25 Jun 2021 21:26:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3081CC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Jun 2021 21:26:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DA7942247
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Jun 2021 21:26:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cHD73KZk3sq9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Jun 2021 21:26:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A25E5421FD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Jun 2021 21:26:33 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id t17so18598987lfq.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Jun 2021 14:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7t7D/1J/bOKgBQ+E9q4Uy0N2GZHjAbWkoMyygvcYg8Y=;
 b=X7p8RIA2xPal9jCN6NmRKzdl1VHHJFNPhLAFX0APZphiwG/aMwD704fy688xj/3cUm
 ae/VP1vEl4Uxh1Z0R+27u31XVSGL1dSYDyR1vecv2hnLmxHTocNYVUblMBaCZitENkC9
 ODliPZAmuUesicpdUPmRt1FL12g+y7BOVzw7jla1JjeY7BVNJb13oB88mMoeSxRwEWS/
 fhCOm8U5PLn10k7L/CxUE/xBgS+Xol707SQHcj5Fi+cOi6vX3k9jBXHhgTTRnoVtNlQu
 133/sAJkefCob8PomQIq8STX24PxKNAt9XlGUUb36XQvphmsMoKGzyZ0kDEogz6n3JHw
 rQbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7t7D/1J/bOKgBQ+E9q4Uy0N2GZHjAbWkoMyygvcYg8Y=;
 b=jbtga12jamcqgxCmeZDs4WvaJd0EkNXpQ/Q1ikPON+xPX7jRAmyKXTOhK8Xul5IFvy
 l1zzWIs3mUVH1K4v4ObtDsm3BheddPf7OmB20MkYRiiaojm3cwVeGUlhtjqGoh4YZEKF
 8lNU80nIOrSySDJ5Iw847fjnFi/oofAM3gKyZegEqCsyLwFkagr2FwI3r5cGv3G9eRRH
 b4sJmJTjsWUB83ZhYC45SNoOjxN9E+cFfQtW8XN0s9yfij4FUQPeC2qVW+stJY/EwanO
 /zhjkl2Pwfl1tqu6ylXNQNjr6o1LsvNmjTGMNDBRrBEFHt/DPg+iZjkEHYLyZWmO01oy
 Z/YQ==
X-Gm-Message-State: AOAM533ZPGqZGxWwVQOxPsItCZgAsbth4VOVCafmM9UDirZ1F4f5xSw4
 IY6n2IHDhDXGAlv29qPZZRM=
X-Google-Smtp-Source: ABdhPJzyJsmvcyRKSkjbbb0IYNhkZj+n4BR7pYe1DCLl6o1t/q+vPZOxQ7EOWGKdCGqRpU/qWKl72A==
X-Received: by 2002:ac2:48b1:: with SMTP id u17mr9549252lfg.646.1624656391311; 
 Fri, 25 Jun 2021 14:26:31 -0700 (PDT)
Received: from localhost.localdomain ([94.103.225.155])
 by smtp.gmail.com with ESMTPSA id t30sm605776lfg.289.2021.06.25.14.26.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 14:26:30 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: davem@davemloft.net,
	kuba@kernel.org
Subject: [PATCH] net: ethernet: fix UAF in ltq_etop_init
Date: Sat, 26 Jun 2021 00:26:28 +0300
Message-Id: <20210625212628.14514-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
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

In ltq_etop_init() netdev was used after free_netdev():

err_netdev:
	unregister_netdev(dev);
	free_netdev(dev);
err_hw:
	ltq_etop_hw_exit(dev);
	return err;

It causes use-after-free read/write in ltq_etop_hw_exit().
Fix it by rewriting error handling path in this function. No logic
changes, only small refactoring.

Fixes: ("MIPS: Lantiq: Add ethernet driver")
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/net/ethernet/lantiq_etop.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/lantiq_etop.c b/drivers/net/ethernet/lantiq_etop.c
index 2d0c52f7106b..807a671ebcf8 100644
--- a/drivers/net/ethernet/lantiq_etop.c
+++ b/drivers/net/ethernet/lantiq_etop.c
@@ -553,8 +553,10 @@ ltq_etop_init(struct net_device *dev)
 
 	dev->watchdog_timeo = 10 * HZ;
 	err = ltq_etop_hw_init(dev);
-	if (err)
-		goto err_hw;
+	if (err) {
+		ltq_etop_hw_exit(dev);
+		return err;
+	}
 	ltq_etop_change_mtu(dev, 1500);
 
 	memcpy(&mac, &priv->pldata->mac, sizeof(struct sockaddr));
@@ -580,9 +582,8 @@ ltq_etop_init(struct net_device *dev)
 
 err_netdev:
 	unregister_netdev(dev);
-	free_netdev(dev);
-err_hw:
 	ltq_etop_hw_exit(dev);
+	free_netdev(dev);
 	return err;
 }
 
-- 
2.32.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
