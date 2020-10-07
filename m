Return-Path: <SRS0=isT2=DO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B1BAC46466
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  7 Oct 2020 03:54:22 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FCB5208C7
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  7 Oct 2020 03:54:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PkilCjXO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FCB5208C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0BADE87257;
	Wed,  7 Oct 2020 03:54:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0wupTksSdaOe; Wed,  7 Oct 2020 03:54:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 991CD87254;
	Wed,  7 Oct 2020 03:54:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7EB51C016F;
	Wed,  7 Oct 2020 03:54:20 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E8D6EC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Oct 2020 03:54:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D257622C51
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Oct 2020 03:54:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yGhwANNV8kHi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Oct 2020 03:54:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by silver.osuosl.org (Postfix) with ESMTPS id AC07922C44
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Oct 2020 03:54:17 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id u24so555850pgi.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 06 Oct 2020 20:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p+QF0MXUCrLAwwOTQcY0kO3Iiy6gO/CVTSWip3EaAQw=;
 b=PkilCjXO3ldpksAP/hgu2ylQJHuGX3Cc/p+GhEdHw13g5S44JTfZCygf/8fz4W+PFJ
 Nb4OmBNVrXUhof9WbgNl40xVtf7D4zqtqIqLaWJ1N22Q2p73kJBs+jJq6mN1lCyOUKyB
 +Y6NQrqC9bl0ZmkrDwTr9UQL/qIo1wV5QFSyP7hUrts/NnYKBYakmqf90XXi59fqmAA1
 lQmHg8TtuiYhZOHIS+DOL59zTpqduP36bpPftwsaO/gscVLeomWMwbjAIF5FU/dhVBDM
 peCclmXfi1F5NJNwAMSZojJFTTXlLqXTYZmegkSdgWRa/XyRAYZ4x+cngJVFXs0tuuH6
 xOYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p+QF0MXUCrLAwwOTQcY0kO3Iiy6gO/CVTSWip3EaAQw=;
 b=XD9tUAQ29bNauzhfx0bW8v1PO4DV1ApM5XA82VEhRE32t4CwQKLcDohN4Zrh3o0wId
 v13Ho2C2JrLjV42gbkMpF5fKEnmPYPHUmgdhCnYMrbRYWyTO8TObzhS4iTit2WdOgkVF
 RzhPZj+eS8CtwKkFp/HKDRmOqSEAybW2e3J/UrC1XoVGwy2tpk+n3Teoah8sKj4+e/BP
 RK1v5eM9u2MsVObBmFieHMhqQQpwj/nrokLgffIJaY7JgpNNNukiUr9Odx9ykFWU28yf
 YK0LzjgjEIE8MENL5xTB7eHOVu2mMMO1fmjmBEaQeOLcjTgIT7YmJFKYsWv9vfyFWqoA
 WJmg==
X-Gm-Message-State: AOAM530DP8lDOuDOBr1yEDa+rgfS7w8o8xxwkrbNBwvhVLDbyOdr2bHt
 v2qon7ooeIgdxcJ6+04jBYH0oNFB1G53p5JpNxg=
X-Google-Smtp-Source: ABdhPJzUQKiSws5uRfeH5+wvhqfgLF3FUhAd5S5CQv7fIApvbLw3es85ToS/n34WDxWxMhjg6glgmw==
X-Received: by 2002:a63:f803:: with SMTP id n3mr1239963pgh.231.1602042856673; 
 Tue, 06 Oct 2020 20:54:16 -0700 (PDT)
Received: from localhost.localdomain ([49.207.207.135])
 by smtp.gmail.com with ESMTPSA id k7sm509309pjs.9.2020.10.06.20.54.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 20:54:16 -0700 (PDT)
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
To: 
Date: Wed,  7 Oct 2020 09:24:01 +0530
Message-Id: <20201007035401.9522-1-anant.thazhemadam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Anant Thazhemadam <anant.thazhemadam@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Johannes Berg <johannes@sipsolutions.net>,
 syzbot+b1bb342d1d097516cbda@syzkaller.appspotmail.com,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-kernel-mentees] [PATCH] net: wireless: nl80211: fix
	out-of-bounds access in nl80211_del_key()
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

In nl80211_parse_key(), key.idx is first initialized as -1. 
If this value of key.idx remains unmodified and gets returned, and
nl80211_key_allowed() also returns 0, then rdev_del_key() gets called 
with key.idx = -1.
This causes an out-of-bounds array access.

Handle this issue by checking if the value of key.idx after
nl80211_parse_key() is called and return -EINVAL if key.idx < 0.

Reported-by: syzbot+b1bb342d1d097516cbda@syzkaller.appspotmail.com
Tested-by: syzbot+b1bb342d1d097516cbda@syzkaller.appspotmail.com
Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
---
 net/wireless/nl80211.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 2c9e9a2d1688..7fd45f6ddb05 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -4172,6 +4172,9 @@ static int nl80211_del_key(struct sk_buff *skb, struct genl_info *info)
 	if (err)
 		return err;
 
+	if (key.idx < 0)
+		return -EINVAL;
+
 	if (info->attrs[NL80211_ATTR_MAC])
 		mac_addr = nla_data(info->attrs[NL80211_ATTR_MAC]);
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
