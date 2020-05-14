Return-Path: <SRS0=C/JV=64=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10A8DC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 14 May 2020 14:11:38 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C558F20671
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 14 May 2020 14:11:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EbR7AVcX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C558F20671
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 931E287A8D;
	Thu, 14 May 2020 14:11:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SFCwzGJiWj_I; Thu, 14 May 2020 14:11:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5339C87AB0;
	Thu, 14 May 2020 14:11:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3A8ACC0863;
	Thu, 14 May 2020 14:11:33 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 63AF3C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 May 2020 14:11:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4D03C8976B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 May 2020 14:11:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sPDMfQgtwN3g
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 May 2020 14:11:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id EB8078976A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 May 2020 14:11:27 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id t16so1207466plo.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 May 2020 07:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=9WpGSPoI+CaYLKju7AwRIRk8OIbNYCd/+/YJHSbNpOw=;
 b=EbR7AVcXsaozLj7tYQCz02xkMCbDe6iWsvhY14V/zIw8mgbtc3fsVigmdPvreyeQQL
 7OASbEDo3NVeQPLycHuj2fsOYAChdj28ujYw8974+Lb4kRV9Nmqh4U98lK5aVW+q/6xc
 35+WmG2qmDLJ++bljGsKsWvA4Pv84AVjX+1eHP7gC4s8Qmbb0pgNn7xTE02i8VHGSTY+
 ZST/3G+DEhEmaYeDYAtjZpIZ5csGr8e5LugkxpoJCZa47s6/PeVmdhSVct6zVD6YPkmX
 biUm7mdLoEWHfQXzN7gZOWwDVjsHlO6PBR2xdw6j8nojL4A43bzVdWyY/ZDTm7c1yuu6
 9/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=9WpGSPoI+CaYLKju7AwRIRk8OIbNYCd/+/YJHSbNpOw=;
 b=PSjvianbvCSOWsTRA+r/HxV/W9pg68DULlblF0dSKxlGxZla07935eKqU6qifFGj5M
 tELI76c/+q5KzjrqUibojEatUP/t8ZNMx33VIdT+DpzyuoJvy15YZWvgaJF7ZcvO5jw0
 mbHsis+kP58+qDo8LAD60BnC7sXdvqqSwBOFefdZ5aa1HyfzBVNcNJAdu3feUqpY2url
 Ga93WPzTxr2Sl1CiiTcIzn6wVS+0E8tnPtJ1NXckK/avVHPBiTQhBdNKP2tzYej4V0N5
 TQF5hQO/c/rUuIS9mkoAWUVFaHlCx3E1kYIFCqh795DJxq0vJunAftOiGIbkzEsZ6/SB
 yhnw==
X-Gm-Message-State: AGi0PuZ44ty1dnnXYxhTqdxqvRw/3YVYGLhYSw/bLF4Va52/TCV51jxv
 LA17xHuHvZLfI7cs176iSA==
X-Google-Smtp-Source: APiQypJba4rvPYcZMB5bjHxjCOHP4bQTDy8ndqeOJCD1/oVUci4rZDpgjFymsosidebilO9skNKYAA==
X-Received: by 2002:a17:90a:d504:: with SMTP id
 t4mr40533533pju.123.1589465487474; 
 Thu, 14 May 2020 07:11:27 -0700 (PDT)
Received: from localhost.localdomain
 ([2402:3a80:13bf:a95e:89fb:f860:f992:54ab])
 by smtp.gmail.com with ESMTPSA id z21sm613941pfr.77.2020.05.14.07.11.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 07:11:26 -0700 (PDT)
From: madhuparnabhowmik10@gmail.com
To: davem@davemloft.net, allison@lohutok.net, tglx@linutronix.de,
 ap420073@gmail.com
Date: Thu, 14 May 2020 19:41:15 +0530
Message-Id: <20200514141115.16074-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: paulmck@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, cai@lca.pw,
 joel@joelfernandes.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH net] drivers: net: hamradio: Fix
	suspicious RCU usage warning in bpqether.c
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>

This patch fixes the following warning:
=============================
WARNING: suspicious RCU usage
5.7.0-rc5-next-20200514-syzkaller #0 Not tainted
-----------------------------
drivers/net/hamradio/bpqether.c:149 RCU-list traversed in non-reader section!!

Since rtnl lock is held, pass this cond in list_for_each_entry_rcu().

Reported-by: syzbot+bb82cafc737c002d11ca@syzkaller.appspotmail.com
Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
---
 drivers/net/hamradio/bpqether.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/hamradio/bpqether.c b/drivers/net/hamradio/bpqether.c
index fbea6f232819..e2ad3c2e8df5 100644
--- a/drivers/net/hamradio/bpqether.c
+++ b/drivers/net/hamradio/bpqether.c
@@ -127,7 +127,8 @@ static inline struct net_device *bpq_get_ax25_dev(struct net_device *dev)
 {
 	struct bpqdev *bpq;
 
-	list_for_each_entry_rcu(bpq, &bpq_devices, bpq_list) {
+	list_for_each_entry_rcu(bpq, &bpq_devices, bpq_list,
+				lockdep_rtnl_is_held()) {
 		if (bpq->ethdev == dev)
 			return bpq->axdev;
 	}
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
