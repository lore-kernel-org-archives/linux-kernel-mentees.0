Return-Path: <SRS0=Ux9x=4G=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9153AC34026
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 Feb 2020 18:42:46 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CD9D21D56
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 Feb 2020 18:42:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STSEWAj2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CD9D21D56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 34822861C1;
	Tue, 18 Feb 2020 18:42:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d8cQj7h4pKgH; Tue, 18 Feb 2020 18:42:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D13048591D;
	Tue, 18 Feb 2020 18:42:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B971AC1D84;
	Tue, 18 Feb 2020 18:42:45 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4D81AC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2020 18:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 49E358557B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2020 18:42:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SkBT4q1bofKr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2020 18:42:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DA171853E6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2020 18:42:43 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id p14so11088541pfn.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2020 10:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=FRPijcKo7kcY7YCcx2mnm2XntT5PXC3jc8cYZD9bnvc=;
 b=STSEWAj2mLLdHZrKCoSsV8S5dtobBUHz7/MKp0aKP2JnTSV18tnQhlLbjjBD5wAsyk
 ePvAISX8FcYTeBxh36DpesEK5H9hLIyHXPCaI53agF7h6zTrNhh3MO1631cf4QqufW42
 QQkE6llrFzaX0E7sDPbCe7F1FpDG8zHWxqNSBvWm8MucYpATLWu79qFmG5UWT7kRbWSj
 ltd36F12euAfNFEi+OdRHdpdTBNOQ/c0HHX+mvTuxDbggM8hbFsAOPnqU/edC1lHjvVR
 12Dux0Qg5EpOjGIdANsYT0hynAY00NrxXqpcQImu6orXAs/FBnK8po4uRFlIkNTmvl5m
 J4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=FRPijcKo7kcY7YCcx2mnm2XntT5PXC3jc8cYZD9bnvc=;
 b=KeC4x2ZxHt/KSMa/16+7cD8x3ZZ4ukrly8Mr4zpRs5p7xoce7z4lS+daIOrsLCMEDg
 JYs/Z4UL8p9St8KTrRy5r3wWRmIwG4IhPKXNypDSKrovjMinuDaA+Ll92RHocHn8/sTt
 BbMJVqpMVvZTvWSbTKLWPxddQGIXxg+vKCBUEzHxRHCj8BvTLau+y51koX72qJq3EXq6
 JERKH6TXO3NrM3B/FI49UIs3vUi50/HxDH9xTYuWlp2Ca5kTnomx/l4TMbcOh3Cj9SCF
 vypPg13wP2qCl5ghQ+ZHhsFr73xlImhgG2H9u7FbVUxzfC7XSTZBBI3co5zyi4YuIGc9
 xNlA==
X-Gm-Message-State: APjAAAXtptEyl7hWyPQBG0t1l12C9niGRUJ1yY5ZrTdh89TEr7ImRmNG
 fT5s5JfuLn0bRQ42Y6d3wQ==
X-Google-Smtp-Source: APXvYqwl800bbQ26s9xKJZDhrO9PdZlbIcrYNVvwauRbeX7NJfuXFF1uGmSM7zo9LH4rJfVnnVed0w==
X-Received: by 2002:a63:515d:: with SMTP id r29mr23493038pgl.265.1582051363462; 
 Tue, 18 Feb 2020 10:42:43 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:54c:a276:f869:e1e5:121e:cdbf])
 by smtp.gmail.com with ESMTPSA id v5sm5526791pgc.11.2020.02.18.10.42.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 10:42:42 -0800 (PST)
From: madhuparnabhowmik10@gmail.com
To: paul@paul-moore.com,
	davem@davemloft.net
Date: Wed, 19 Feb 2020 00:11:32 +0530
Message-Id: <20200218184132.20363-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: paulmck@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 linux-security-module@vger.kernel.org, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] netlabel_domainhash.c: Use built-in
	RCU list checking
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

list_for_each_entry_rcu() has built-in RCU and lock checking.

Pass cond argument to list_for_each_entry_rcu() to silence
false lockdep warning when CONFIG_PROVE_RCU_LIST is enabled
by default.

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
---
 net/netlabel/netlabel_domainhash.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/netlabel/netlabel_domainhash.c b/net/netlabel/netlabel_domainhash.c
index f5d34da0646e..a1f2320ecc16 100644
--- a/net/netlabel/netlabel_domainhash.c
+++ b/net/netlabel/netlabel_domainhash.c
@@ -143,7 +143,8 @@ static struct netlbl_dom_map *netlbl_domhsh_search(const char *domain,
 	if (domain != NULL) {
 		bkt = netlbl_domhsh_hash(domain);
 		bkt_list = &netlbl_domhsh_rcu_deref(netlbl_domhsh)->tbl[bkt];
-		list_for_each_entry_rcu(iter, bkt_list, list)
+		list_for_each_entry_rcu(iter, bkt_list, list,
+					lockdep_is_held(&netlbl_domhsh_lock))
 			if (iter->valid &&
 			    netlbl_family_match(iter->family, family) &&
 			    strcmp(iter->domain, domain) == 0)
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
