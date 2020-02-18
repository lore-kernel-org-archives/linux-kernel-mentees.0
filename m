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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F5AC34047
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 Feb 2020 19:58:31 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A7BE20659
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 Feb 2020 19:58:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cjnbef0k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A7BE20659
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 22209861A7;
	Tue, 18 Feb 2020 19:58:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wh5pW8+UXrFm; Tue, 18 Feb 2020 19:58:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C00558444E;
	Tue, 18 Feb 2020 19:58:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AF73DC08A0;
	Tue, 18 Feb 2020 19:58:30 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 60BE5C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2020 19:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 58C50851FA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2020 19:58:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U71JhcjJ-ytB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2020 19:58:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E659D84D56
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2020 19:58:29 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id m7so910534pjs.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2020 11:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=QiZww/RzBIiqsbrHHxIYSu/iuDgV4YFLQLrfy6sFiNk=;
 b=Cjnbef0k4m3B/ywmq6dWoUbGU3Ag1/Zc52LYCXAhwdYSC+or3uUZwbzROS2iVMTzAi
 YLO/erejLW1NG2U06RoeMfO1zgQmJmqz+yEvzqfRgMJQ0vvXzD2K0qAYliuPrqsSu7+t
 71G2NPYLlCmUTztI1DY+qu3oCHsl+Ww+xbdsUfnr6DHkjxmkyutlIF+MufPXN1YNzqVa
 PAmYLF77yJwYfhVIasqfzPGJUeU7bmVxrvWjLK8Rx+T8YdhMhn4Fxpb5gfsrZtiXywAH
 DWI5q18zqSpsKLE1sCtbYUZdsP+g8qrmRnqK3okYMZcAjNqktRCVduYKjHvFRkg0K6BR
 v+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=QiZww/RzBIiqsbrHHxIYSu/iuDgV4YFLQLrfy6sFiNk=;
 b=gedr+sZCfeEjABaxbxirOgSrg+GUUzivuCP0O0vWBVPQ3dF6+Z8vco6JcmHv3YZRNX
 ucF0D5cN7ZOcq/WtcMs77ngpJf7XCUplX8zKv5XjJi6PJcAfgGD1XQzyJUXhw9419TQo
 pumtBaeEskTXXIVivkyOnrR2CBvOBB1Ln8r8p9xL4NF839I8Ep8NNiCjOCEBUl7pM5lP
 8/4EHbJzqlUwouv98Zoc8TS70h4SvIu3QuSvRkLsAX/fRzHYJLG/1YMTeKyRcBXuGlon
 azP9ETX2X/1+mh1KJzTUR0AYYDqvn9pWVpcx8aI+iNvaCcTWDCY8KGKcDYRaEAyhzsHW
 JCiw==
X-Gm-Message-State: APjAAAUgGg3NzjGNLQCIlr7VdD7DCvzqTWa/3l0tdsuTrupZw8DiP7UW
 Z01igkwOuakRi1b3R8MhZg==
X-Google-Smtp-Source: APXvYqwH1nOirlZGhvmTOw16Nv7wur/YGu3iaddjnmcqplevu4ou6GC57/7gKbJ/RXghEymI4BH9uA==
X-Received: by 2002:a17:902:6ac2:: with SMTP id
 i2mr22116151plt.221.1582055909574; 
 Tue, 18 Feb 2020 11:58:29 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:1ee3:ff08:f869:e1e5:121e:cdbf])
 by smtp.gmail.com with ESMTPSA id k4sm5118883pfg.40.2020.02.18.11.58.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 11:58:28 -0800 (PST)
From: madhuparnabhowmik10@gmail.com
To: pshelar@ovn.org,
	davem@davemloft.net
Date: Wed, 19 Feb 2020 01:28:20 +0530
Message-Id: <20200218195820.2769-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: dev@openvswitch.org, paulmck@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 4/4] flow_table.c: Use built-in RCU
	list checking
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

hlist_for_each_entry_rcu() has built-in RCU and lock checking.

Pass cond argument to list_for_each_entry_rcu() to silence
false lockdep warning when CONFIG_PROVE_RCU_LIST is enabled
by default.

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
---
 net/openvswitch/flow_table.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/net/openvswitch/flow_table.c b/net/openvswitch/flow_table.c
index 5904e93e5765..fd8a01ca7a2d 100644
--- a/net/openvswitch/flow_table.c
+++ b/net/openvswitch/flow_table.c
@@ -585,7 +585,8 @@ static struct sw_flow *masked_flow_lookup(struct table_instance *ti,
 	head = find_bucket(ti, hash);
 	(*n_mask_hit)++;
 
-	hlist_for_each_entry_rcu(flow, head, flow_table.node[ti->node_ver]) {
+	hlist_for_each_entry_rcu(flow, head, flow_table.node[ti->node_ver],
+				lockdep_ovsl_is_held()) {
 		if (flow->mask == mask && flow->flow_table.hash == hash &&
 		    flow_cmp_masked_key(flow, &masked_key, &mask->range))
 			return flow;
@@ -769,7 +770,8 @@ struct sw_flow *ovs_flow_tbl_lookup_ufid(struct flow_table *tbl,
 
 	hash = ufid_hash(ufid);
 	head = find_bucket(ti, hash);
-	hlist_for_each_entry_rcu(flow, head, ufid_table.node[ti->node_ver]) {
+	hlist_for_each_entry_rcu(flow, head, ufid_table.node[ti->node_ver],
+				lockdep_ovsl_is_held()) {
 		if (flow->ufid_table.hash == hash &&
 		    ovs_flow_cmp_ufid(flow, ufid))
 			return flow;
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
