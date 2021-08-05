Return-Path: <SRS0=ZEDA=M4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_RED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C86ABC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  5 Aug 2021 11:12:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66E0961078
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  5 Aug 2021 11:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 66E0961078
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36BF583A6B;
	Thu,  5 Aug 2021 11:12:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0uC7DLng-O9x; Thu,  5 Aug 2021 11:12:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 69984830A8;
	Thu,  5 Aug 2021 11:12:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 435DDC0010;
	Thu,  5 Aug 2021 11:12:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 30B77C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Aug 2021 11:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19C95835B1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Aug 2021 11:12:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id stovc9vJp7Tr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Aug 2021 11:12:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B983830A8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Aug 2021 11:12:50 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 s22-20020a17090a1c16b0290177caeba067so13931136pjs.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 05 Aug 2021 04:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Hkn8gro2ZRij2+E0tocLKDlTLXxVBcZkbMKbmXVMGqE=;
 b=BjcUeZsy+PLG9SVyEY8wzJfORzV8dBtsVdvIa/gV/usTtMxqR+z9s1eucrFcfrpZ3r
 qs+/iWpLvp6pXTGONFIG461ULcVNFFo2ud2iffoF143VNtZE6pg3nFlEVi2FUDHbwlYD
 ISvq3UFoNyPz5lNdGzkaS67ceCCu1QPLUj6OFCQ7PyLmPRF7gWAlV2RTjosx+Skqp5TS
 xzJXQPGkcuSx6DAHBgJvl28w3e0/36BaZOU8kat2YTQh4lws4t7X/hi3fap4+vHJuQZT
 Gq2VtjaRSl9jF6FRXwL9Dhi7mUhZ4oSH1eokeRURvotx1WJQRMifgOcS7GTU1XRM6DgV
 0VXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Hkn8gro2ZRij2+E0tocLKDlTLXxVBcZkbMKbmXVMGqE=;
 b=Frxr0lEkjMANU7RvXHoimUluhx2ReL7bAOVVB6ql/ht4yi9IHPvdhfDdVKKLbLPphY
 YUF3Xzv9eLFnChlX1rdFMcBYkj3YdScGAf5iL8GHy9Y++cf03RFEucjUQ9na1auJNgPI
 pSJ1ljDGhlA8H6dbTircHqbZ31GtKW0/qwT3HCaYeroVIxfvgpjUorgbm8X8/0Kcqw+F
 YP+vHd8SMwyvXF9NYAmxzgYPv3+y3l3/ealWWwBTSsf4Ulg8qVH35Z1XgQ0CMGEz3JN7
 g159uk/bNkabqMyFFIKjHsT69awJIJzE3JPO4O63m9IfF2/kAgygkxjLWRiPQFcZDoaN
 hzfw==
X-Gm-Message-State: AOAM530kL1/Y/R62wn9cC+BEkTzsI7Qj78MnlMTwgd0tLt+uIkztNDsh
 Vyl1zowc7yFBfk2jJM/8Dyg=
X-Google-Smtp-Source: ABdhPJwMeTfeyg+Gui9RZ3fKzvA1S3sF7eD9usmk1RxeBP6ws2G8PS9In7UU196IVIabJQKxxFCQOQ==
X-Received: by 2002:a17:90a:3489:: with SMTP id
 p9mr15072124pjb.197.1628161969975; 
 Thu, 05 Aug 2021 04:12:49 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:4042:4d9c:8a47:be19:7920:caae:af62])
 by smtp.gmail.com with ESMTPSA id c14sm10088436pjr.3.2021.08.05.04.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 04:12:49 -0700 (PDT)
From: Vinesh Raut <vineshraut2017@gmail.com>
To: lukas.bulwahn@gmail.com
Subject: [PATCH] mptlan.c: fixed UNNECESSARY_CASTS warning
Date: Thu,  5 Aug 2021 16:42:07 +0530
Message-Id: <20210805111207.19171-1-vineshraut2017@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
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

multiple UNNECESSARY_CASTS warnings fixed from mptlan.c
It is not good practice to cast alloc function as it may hide the bugs.

Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Signed-off-by: Vinesh Raut <vineshraut2017@gmail.com>
---
 drivers/message/fusion/mptlan.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/message/fusion/mptlan.c b/drivers/message/fusion/mptlan.c
index 3261cac762de..f45e7a25e7c3 100644
--- a/drivers/message/fusion/mptlan.c
+++ b/drivers/message/fusion/mptlan.c
@@ -860,7 +860,7 @@ mpt_lan_receive_post_turbo(struct net_device *dev, u32 tmsg)
 	if (len < MPT_LAN_RX_COPYBREAK) {
 		old_skb = skb;
 
-		skb = (struct sk_buff *)dev_alloc_skb(len);
+		skb = dev_alloc_skb(len);
 		if (!skb) {
 			printk (KERN_ERR MYNAM ": %s/%s: ERROR - Can't allocate skb! (%s@%d)\n",
 					IOC_AND_NETDEV_NAMES_s_s(dev),
@@ -1006,7 +1006,7 @@ mpt_lan_receive_post_reply(struct net_device *dev,
 //			"for single packet, concatenating...\n",
 //				IOC_AND_NETDEV_NAMES_s_s(dev)));
 
-		skb = (struct sk_buff *)dev_alloc_skb(len);
+		skb = dev_alloc_skb(len);
 		if (!skb) {
 			printk (KERN_ERR MYNAM ": %s/%s: ERROR - Can't allocate skb! (%s@%d)\n",
 					IOC_AND_NETDEV_NAMES_s_s(dev),
@@ -1048,7 +1048,7 @@ mpt_lan_receive_post_reply(struct net_device *dev,
 
 		old_skb = skb;
 
-		skb = (struct sk_buff *)dev_alloc_skb(len);
+		skb = dev_alloc_skb(len);
 		if (!skb) {
 			printk (KERN_ERR MYNAM ": %s/%s: ERROR - Can't allocate skb! (%s@%d)\n",
 					IOC_AND_NETDEV_NAMES_s_s(dev),
-- 
2.30.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
