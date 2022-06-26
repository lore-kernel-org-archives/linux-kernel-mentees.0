Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 560E8C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Jun 2022 10:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2A4761033;
	Sun, 26 Jun 2022 10:35:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2A4761033
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=S9F3gYcd
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GhglhdxvHVC4; Sun, 26 Jun 2022 10:35:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E60B360D5E;
	Sun, 26 Jun 2022 10:35:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E60B360D5E
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B8B1AC007A;
	Sun, 26 Jun 2022 10:35:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 09660C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jun 2022 10:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D777160D5E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jun 2022 10:35:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D777160D5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eqjUP9iXdreV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jun 2022 10:35:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 077D0607C1
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 077D0607C1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jun 2022 10:35:52 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id e63so6471194pgc.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jun 2022 03:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CT9UzjAprHUqV7ZTg5rA+EnKneUfvjzMy7Q3wVldT2o=;
 b=S9F3gYcdAgALN/i00FyqnFPtw72EX93LhTZjMcfrkZUtXojwUQ9tPv/wzwSjp1qmWk
 TTZufc3+EeKVDchJO/N9kqI6IP9t4OMy+QPy02kqaNxRVAEGoQ2j4oozWseT+euZJaZa
 WwMfRf/17IKfcMeVkaDXkOhBnTNBoRsoUE7587XITamp2UYpa1AiEr4L13IIT1g1jVtu
 +t7ygiWiLTigI7XjxQbVzh7vWEnQDTQAnXTqn9dmF2jnN53kEJuBP0ckSNiB7ZEIs2Uy
 7Ktp5TtzKeM8yuDyBEXY9a/ZzxVFOhxQES4k5HvrEdlf11fajT6MYCXu3CPyxVic1NV5
 UgTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CT9UzjAprHUqV7ZTg5rA+EnKneUfvjzMy7Q3wVldT2o=;
 b=qW+5tdzKAVcKmQyQg6TfrSzFn91erEIPsnC4Md5AAs0CBoCmQSUTG6hZ73OlMaO0wP
 s0DSp4ESGvyjZxwToHbNqYzkTdpBx9Rqeuq/A8tNF244NAlBJ3QFIkCRnN+but5JfT1d
 kQS6uWwFWFbbveyV+iWUUKXosWgNV4mjLGx/bkFp1WQCb5cCc8G1x0Z2sl9vcHShb7FP
 easfPU5sVxIjo29WcH65EO2/+QjM3irzxHGmTFuOfM7HGV6Y54pwex76WLUWEPfUKzEU
 0VjJ3e+ZVUaP2CMjaIyi6a5FXspsPt+ITyCCXSWwvgjVcodDzHKD1l65u04xcXqtiaPA
 mm2w==
X-Gm-Message-State: AJIora+mq5oVw1WsyEZgRc+ZeOlirtmR+sBIC2JHuEekiXh4gfC/aUUN
 BFqZYNzMNYCvf2CqODlFvn0=
X-Google-Smtp-Source: AGRyM1tyxkS+6IBKYS5jpOLHXHR+Grdw0U05dHqC0cQpGPwB5fWT+ckGXL6txKRos0UN3ZQVfZs6tg==
X-Received: by 2002:a63:f91b:0:b0:40d:d291:1555 with SMTP id
 h27-20020a63f91b000000b0040dd2911555mr3559579pgi.399.1656239752099; 
 Sun, 26 Jun 2022 03:35:52 -0700 (PDT)
Received: from ip-172-31-11-128.ap-south-1.compute.internal
 (ec2-35-154-4-181.ap-south-1.compute.amazonaws.com. [35.154.4.181])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a635c49000000b0040cf8789851sm4849234pgm.35.2022.06.26.03.35.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 03:35:51 -0700 (PDT)
From: Praghadeesh T K S <praghadeeshthevendria@gmail.com>
To: Rain River <rain.1986.08.12@gmail.com>, Zhu Yanjun <zyjzyj2000@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] net: ethernet/nvidia: fix possible condition with no effect
Date: Sun, 26 Jun 2022 10:35:39 +0000
Message-Id: <20220626103539.80283-1-praghadeeshthevendria@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: praghadeeshtks@zohomail.in, linux-kernel-mentees@lists.linuxfoundation.org,
 Praghadeesh T K S <praghadeeshthevendria@gmail.com>
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

Fix Coccinelle bug, removed condition with no effect.

Signed-off-by: Praghadeesh T K S <praghadeeshthevendria@gmail.com>
---
 drivers/net/ethernet/nvidia/forcedeth.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/ethernet/nvidia/forcedeth.c b/drivers/net/ethernet/nvidia/forcedeth.c
index 5116bad..8e49cfa 100644
--- a/drivers/net/ethernet/nvidia/forcedeth.c
+++ b/drivers/net/ethernet/nvidia/forcedeth.c
@@ -3471,9 +3471,6 @@ static int nv_update_linkspeed(struct net_device *dev)
 	} else if (adv_lpa & LPA_10FULL) {
 		newls = NVREG_LINKSPEED_FORCE|NVREG_LINKSPEED_10;
 		newdup = 1;
-	} else if (adv_lpa & LPA_10HALF) {
-		newls = NVREG_LINKSPEED_FORCE|NVREG_LINKSPEED_10;
-		newdup = 0;
 	} else {
 		newls = NVREG_LINKSPEED_FORCE|NVREG_LINKSPEED_10;
 		newdup = 0;
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
