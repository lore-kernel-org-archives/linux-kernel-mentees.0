Return-Path: <SRS0=qNNM=4K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AADBAC35666
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Feb 2020 16:58:43 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73653208C3
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Feb 2020 16:58:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jv5v78Gk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73653208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4B00585618;
	Sat, 22 Feb 2020 16:58:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2v20KcK4yuvO; Sat, 22 Feb 2020 16:58:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E76C7851C2;
	Sat, 22 Feb 2020 16:58:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D6630C1D81;
	Sat, 22 Feb 2020 16:58:42 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 70A31C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 16:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6D3108685D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 16:58:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tOgdSDnW53mG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 16:58:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D049F867F0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 16:58:40 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id j9so2972185pfa.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 08:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z3KO4eN5jhFVoFYevJd1WekBeBDLgNl7tb0PRqx3KTw=;
 b=jv5v78GkeLtIpANUBMkMOUQSQsYzG31CXCzESaei3K/C5a0XeuvYwK0FXTxO/sA4ZV
 VFQoadLEu3xYGM+OE8KgOekct8BIyERsI9SlbeLFD2Yfbs0mehB/xSeSnUvuGvOVZ4Dz
 X1tjgXdQIQlzibmkqGYiAEFsm6qV5EnNWLaCdP4HTS+wErYlJ2acBfilGZFtzSEgFOG1
 BXLU1q/64Rw+2oR5XgAiqBq//GmLEnEa8WLJu0QXO/i+afTosVeb3kdKxWQ2awxIrEFp
 D/z2+nUi3N7vxloYtneEgEBNpqvK/fapbLymX74dhA5t7OJHL9Z831TnHc0Mdh7oSMte
 o1Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z3KO4eN5jhFVoFYevJd1WekBeBDLgNl7tb0PRqx3KTw=;
 b=qVK2eN0BqhwvjeNSrbGfWLYwOP5ETGXVif6CjKhV2pLYylZPJwIenZAIz4CrFl3c4B
 BDAc8youAFLNWiOM1h+aYh7E3lqTTF7Q8ofMdmXTjgtPEKlonq8FWHJAC4cvzHqRukft
 S3grFikAMrGKJRRsjpfstkN2sCgMFRHSZl7LUc6Tb4jLskOhyxq63vfSp+VQ8p36mTzM
 GPcZLq26k1LB2fbvr5JkyO8W6L31kT+CEKcbWzFjfeDAYrKSucbhSmgzpgEiEnIzuRzJ
 biwAddsq1uPTQhqLbKTlZYj0UN6PTgrHNGwRFFH9hf54M7xbBDOZkyF7LClMhy98a9Rz
 my4Q==
X-Gm-Message-State: APjAAAV5KMr7PNPQFPct57J0En1cI/CFYbNkcWVguUZOl3rOy0uTpJHY
 I2WUkESuCqe8gS5En7fV7GQ=
X-Google-Smtp-Source: APXvYqzU/oKjoAjO1ie8MPYCGZVdDNYNMPm7PBDPQCslrrf4LLM3ID6101gQUXy0TcG/QYh3wowZNQ==
X-Received: by 2002:a62:cfc4:: with SMTP id
 b187mr43233929pfg.155.1582390720405; 
 Sat, 22 Feb 2020 08:58:40 -0800 (PST)
Received: from localhost.localdomain ([103.87.57.201])
 by smtp.googlemail.com with ESMTPSA id y9sm6615835pjj.17.2020.02.22.08.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Feb 2020 08:58:40 -0800 (PST)
From: Amol Grover <frextrite@gmail.com>
To: "David S . Miller" <davem@davemloft.net>,
 Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 Jakub Kicinski <kuba@kernel.org>
Date: Sat, 22 Feb 2020 22:27:27 +0530
Message-Id: <20200222165726.9330-1-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] ip6mr: Fix RCU list debugging warning
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

ip6mr_for_each_table() macro uses list_for_each_entry_rcu()
for traversing outside an RCU read side critical section
but under the protection of rtnl_mutex. Hence add the
corresponding lockdep expression to silence the following
false-positive warnings:

[    4.319479] =============================
[    4.319480] WARNING: suspicious RCU usage
[    4.319482] 5.5.4-stable #17 Tainted: G            E
[    4.319483] -----------------------------
[    4.319485] net/ipv6/ip6mr.c:1243 RCU-list traversed in non-reader section!!

[    4.456831] =============================
[    4.456832] WARNING: suspicious RCU usage
[    4.456834] 5.5.4-stable #17 Tainted: G            E
[    4.456835] -----------------------------
[    4.456837] net/ipv6/ip6mr.c:1582 RCU-list traversed in non-reader section!!

Signed-off-by: Amol Grover <frextrite@gmail.com>
---
 net/ipv6/ip6mr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/ipv6/ip6mr.c b/net/ipv6/ip6mr.c
index bfa49ff70531..d6483926f449 100644
--- a/net/ipv6/ip6mr.c
+++ b/net/ipv6/ip6mr.c
@@ -97,7 +97,8 @@ static void ipmr_expire_process(struct timer_list *t);
 
 #ifdef CONFIG_IPV6_MROUTE_MULTIPLE_TABLES
 #define ip6mr_for_each_table(mrt, net) \
-	list_for_each_entry_rcu(mrt, &net->ipv6.mr6_tables, list)
+	list_for_each_entry_rcu(mrt, &net->ipv6.mr6_tables, list, \
+				lockdep_rtnl_is_held())
 
 static struct mr_table *ip6mr_mr_table_iter(struct net *net,
 					    struct mr_table *mrt)
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
