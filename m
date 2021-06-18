Return-Path: <SRS0=f3wf=LM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7A0CC48BE8
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Jun 2021 16:14:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59C9361164
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Jun 2021 16:14:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59C9361164
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28745831A7;
	Fri, 18 Jun 2021 16:14:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ujuI3bx411tK; Fri, 18 Jun 2021 16:14:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4F8F682F32;
	Fri, 18 Jun 2021 16:14:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2E7C9C000D;
	Fri, 18 Jun 2021 16:14:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BB965C000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 16:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ADF4C400F1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 16:14:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RDE4VlPIJ7If
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 16:14:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F205C400CA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 16:14:28 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id h4so17541440lfu.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 09:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zcsXDvnwmdXXMs5g79zcf5bVX0T9W6JQcEu/YgdgQgQ=;
 b=RgJK+1RJop5RiodRQKI4j9397y9b3QFrEN4y/Re5GPbcvT4iexwDSnBAQM6r62v3B2
 BaV9+IbW9Xaz5G3IhoYVmEa0o4eZYQFSoLTrsyrzTXmEOf26LN/7n9EwkjPDQzft3x23
 AxHXROqZBKqKTr0HbNljaoX5t1feCl/esnaXRRQp7q1BlP701tcx0t0TtaiH6bW+anK+
 qkpPzaLzrDdCqANujNnj+lkuDvKjh9Eb7dv9/oDQvD9bR6Dm3H6IHDse/gJvPXo68u/T
 oCKCZy9jVd1dLdHMtXL3d/eem9cD0YlJg4rbIG0RVs2q1IKxBJWHhsDNFtuNicU+Cq3y
 RZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zcsXDvnwmdXXMs5g79zcf5bVX0T9W6JQcEu/YgdgQgQ=;
 b=CDNlwXg9ogdEIOz1j2CxOi5yysGjFBfY0ULJjgjz/apZug5M6h86iVHcMXXiYyoy/V
 aE7+w0k00RTTfWFfsHsJjerblHJnhkyeR6IHn0K1SiGVWKOlvFUUhQ//TeGDQjyRq3dM
 RTgmXjA3SmHXWI8eSxYWp3v0vwLHdNyiQb+ZAcBc4+p04TNRx6NATGDirDprUOgCqBxm
 gpXg3OcAy7virl7EGyKmR7vhy0ovOnqDOa3DAjIOIwvkFd6OwK+2qezu4SFGra103pY5
 Kmh4CzytRWVsHqsq+7dO82sWL2KuauJ3FY+S6y5PL2NX3smFxoKEfgJ9cNIhxEnTmE7g
 UxdQ==
X-Gm-Message-State: AOAM5315XSD8ECQQNyxugYNPD1RSxdYmPJT0vKeuLr/Hks8Gl/IQUjUn
 MerUNmrxbY2ImfGukvb7Pig=
X-Google-Smtp-Source: ABdhPJy+0sQDG8yeqqhjzMcbZcjHHcFPz9DZ0hCmOkYs4Gn7RU4h9fnurngAzj/Ekyd1/YZG/LtdAA==
X-Received: by 2002:a05:6512:15a1:: with SMTP id
 bp33mr3679512lfb.623.1624032866923; 
 Fri, 18 Jun 2021 09:14:26 -0700 (PDT)
Received: from localhost.localdomain ([94.103.229.24])
 by smtp.gmail.com with ESMTPSA id w24sm947603lfa.143.2021.06.18.09.14.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 09:14:26 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: davem@davemloft.net, kuba@kernel.org, andrew@lunn.ch, michael@walle.cc,
 abrodkin@synopsys.com, talz@ezchip.com, noamc@ezchip.com
Subject: [PATCH 0/3] net: ethernat: ezchip: bug fixing and code improvments
Date: Fri, 18 Jun 2021 19:14:23 +0300
Message-Id: <cover.1624032669.git.paskripkin@gmail.com>
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

While manual code reviewing, I found some error in ezchip driver.
Two of them looks very dangerous:
  1. use-after-free in nps_enet_remove
      Accessing netdev private data after free_netdev()

  2. wrong error handling of platform_get_irq()
      It can cause passing negative irq to request_irq()

Also, in 2nd patch I removed redundant check to increase execution
speed and make code more straightforward.

Pavel Skripkin (3):
  net: ethernet: ezchip: fix UAF in nps_enet_remove
  net: ethernet: ezchip: remove redundant check
  net: ethernet: ezchip: fix error handling

 drivers/net/ethernet/ezchip/nps_enet.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

-- 
2.32.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
