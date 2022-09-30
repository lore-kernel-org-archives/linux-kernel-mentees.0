Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 387C7C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Sep 2022 11:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA82E61204;
	Fri, 30 Sep 2022 11:44:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA82E61204
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=S+rHi0IQ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1WluLuiBawq3; Fri, 30 Sep 2022 11:44:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A76E66120F;
	Fri, 30 Sep 2022 11:44:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A76E66120F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 82DABC0033;
	Fri, 30 Sep 2022 11:44:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D395AC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Sep 2022 11:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AED9A8417B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Sep 2022 11:44:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AED9A8417B
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=S+rHi0IQ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X0OGMi8uXCLo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Sep 2022 11:44:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A29AA83F86
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A29AA83F86
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Sep 2022 11:44:03 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so8807824pjq.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Sep 2022 04:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=Gg0A0CsuZvn3gbRKVVoweIsGGQktuRgro3yyKRZC6yo=;
 b=S+rHi0IQSlE7WkWXkHzEMCYAR1eWbIOMxU34v3/uqSUu6rWSlQ4XA7Mzr4vhHHCauT
 FoM0gfdBofAk3PbMoCHFuWL64F3WYU1ow8kT2j5JXIjEluv6DMd4+NuK6BpzDklJ/3BK
 pamHa2SUGU6hFOLg8JtCAPiHwcWNH/ZZolATHka6ri+BTZu09AIDPMFU+tyybnclj5gv
 txzO5jhYXDkK+cvUhIE0AkSXFlhxH0KFRJD8JnzipQbr/DzJLfinSmEN7ilXrEUq/ZgL
 UtuOvkB7baze3Yl7SD1duleGsmBFF1OS51ez9Q7WYyPcj91o6q8Cqnma8uNSHzj2z8jd
 2CRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=Gg0A0CsuZvn3gbRKVVoweIsGGQktuRgro3yyKRZC6yo=;
 b=POn1owm8i0HrfSkfVFotC0an9oBfSrzo12qj+wIa86gO6VjuJDFEcYqFJA2JYuBjHy
 bofBYVQ83k5/OFjaErncqnrSC/v2ktPJKXmBkoR4U1kbDucWKIzwfp7f+uimmy1xuXS+
 t9/JavwwolOYe2K95Dz+Mvn086l8Fj/ueW6Q3egeljoVhp1nVVyLgEJ3YzFXPpsgoaYc
 ExurSSY3TILNiLbjTdkQLH4KDnGopQipLrgRgZ1G3Z3BgWAczkgxS5SeY/V1A0gyWYh/
 3WQbqISwKowPP60HwPQljBwRo7siKBw8QgvPQ7qcEM2QJ1CjVjyWOsnruQwvxrMoYpr7
 XUCA==
X-Gm-Message-State: ACrzQf1W3zLHvG58fVhI9dxP3L4b3y/7dDkK9VWM+0+gCnUrhniUKa0O
 Wh2sLCVNTXQYdXjDFr0lsl4=
X-Google-Smtp-Source: AMsMyM5irRGrmMh154wuYn4XRa9MjbS0fbaOivd2pICaLsfqAP45ZvvxrOMGKbXZv2kxePcQ1XGJog==
X-Received: by 2002:a17:90a:db85:b0:20a:607a:3701 with SMTP id
 h5-20020a17090adb8500b0020a607a3701mr1209544pjv.187.1664538242883; 
 Fri, 30 Sep 2022 04:44:02 -0700 (PDT)
Received: from localhost.localdomain ([49.206.115.111])
 by smtp.gmail.com with ESMTPSA id
 g3-20020a170902d1c300b0017a00216965sm1642129plb.218.2022.09.30.04.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 04:44:02 -0700 (PDT)
From: Praghadeesh T K S <praghadeeshthevendria@gmail.com>
To: Boris Pismenny <borisp@nvidia.com>, Saeed Mahameed <saeedm@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 "GitAuthor: Praghadeesh" <praghadeeshthevendria@gmail.com>,
 netdev@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] net: ethernet/mellanox: fix dereference before null check
Date: Fri, 30 Sep 2022 17:13:35 +0530
Message-Id: <20220930114335.608894-1-praghadeeshthevendria@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: praghadeeshtks@zohomail.in, linux-kernel-mentees@lists.linuxfoundation.org
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

net: ethernet/mellanox: fix dereference before null check
macsec dereferenced before null check
bug identified by coverity's linux-next weekly scan
Coverity CID No: 1525317

Signed-off-by: Praghadeesh T K S <praghadeeshthevendria@gmail.com>
---
 drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec.c b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec.c
index 5da746d..e822c2a 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec.c
@@ -1846,11 +1846,11 @@ int mlx5e_macsec_init(struct mlx5e_priv *priv)
 void mlx5e_macsec_cleanup(struct mlx5e_priv *priv)
 {
 	struct mlx5e_macsec *macsec = priv->macsec;
-	struct mlx5_core_dev *mdev = macsec->mdev;
 
 	if (!macsec)
 		return;
 
+	struct mlx5_core_dev *mdev = macsec->mdev;
 	mlx5_notifier_unregister(mdev, &macsec->nb);
 
 	mlx5e_macsec_fs_cleanup(macsec->macsec_fs);
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
