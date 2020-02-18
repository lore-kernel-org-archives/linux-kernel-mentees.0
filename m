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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67D2DC34026
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 Feb 2020 19:55:14 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FA6721D56
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 Feb 2020 19:55:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D8H8iHHZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FA6721D56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EED7D85D39;
	Tue, 18 Feb 2020 19:55:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vokQICdpNVTE; Tue, 18 Feb 2020 19:55:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8EB1884A43;
	Tue, 18 Feb 2020 19:55:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5B515C1D87;
	Tue, 18 Feb 2020 19:55:12 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 11018C08A0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2020 19:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id EE2F184397
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2020 19:55:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qwXNQ0ic6eEW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2020 19:55:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 21A7E817F4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2020 19:55:08 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id y73so11193107pfg.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2020 11:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=F9XTBQEKA7h9nJlIjkbqq/1QmtqJ9mXQLAwjuVpHgNc=;
 b=D8H8iHHZgTDIxt5/mW20K3v/qCPJsTLtF9RuM5vGsDyzT/JKAnXlzuJZUm+7V52nFx
 EqroSSLOcBDCQplyVZ4XnQBxz6osyLUN5u/5jQMWkexl4cQ6w407kH6FFllKWumKrfvQ
 FLiyE9Ts+xMsyMkR0aXii5XNHJtQvWdsA7TyJ7EuH0t/XyMR4lmIeJvkxLFeSeVI7QWW
 96kxzE89cWliTgSgWmGjd3UbFQb2FleEOwIbXD3QNCeWDn9D4ldYX/1Nq6FQC+LSzit2
 v8fraGW79Ct5Jav8W6LpJtwu0wUGa2OQao59UQsppEuV5bKYKq80EX3ty50pNDQ4M5Vj
 n6QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=F9XTBQEKA7h9nJlIjkbqq/1QmtqJ9mXQLAwjuVpHgNc=;
 b=GmHj5gQYU8O+pOLP57ItHyPVxeCLGx990U9RZLLPkr2/EJV+NIedyKpiLst2RShXaE
 ILV13Mf3BGcoTY8rew4jtw5qMLf3MEAEyRwRe5nzw5GL9t5XVz9Onrvjc0lRQAAq1332
 y3YFls5+6BB6AFikXx+JTCku7OVQWBE4U8Z130t/z2pa3arB7+7JtBEPe3DcDTtvC7HL
 gH6/Ip/YcPLTJJvPHEp2IqCAg1n70N/4jM9+ROYO7lE4By8/7Pg772xwkcO+KuUvxob7
 Yg1Rk7ANds/OL4KKoP6DxYuAqWddvBysPYl8coIJ5xPYffyquHlqjlwqQ4Y2QyX/hNKu
 LOww==
X-Gm-Message-State: APjAAAXOm1aje62xiMm4seJshtrV9tteCdIZivVjGLIbY8BZAxzYM/t4
 406OusTBdw6mFeSdC5hQOg==
X-Google-Smtp-Source: APXvYqxLPpkqj+EubTezkb1SRiSi7vxCmmoRCDX6uzIIzZnMbRsgVsijYBTc5EcrCL5qmND+jVSfJQ==
X-Received: by 2002:a63:da49:: with SMTP id l9mr24419128pgj.125.1582055707764; 
 Tue, 18 Feb 2020 11:55:07 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:1ee3:ff08:f869:e1e5:121e:cdbf])
 by smtp.gmail.com with ESMTPSA id b15sm4994454pft.58.2020.02.18.11.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 11:55:07 -0800 (PST)
From: madhuparnabhowmik10@gmail.com
To: pshelar@ovn.org,
	davem@davemloft.net
Date: Wed, 19 Feb 2020 01:24:25 +0530
Message-Id: <20200218195425.1962-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: dev@openvswitch.org, paulmck@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 1/4] meter.c: Use built-in RCU list
	checking
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
 net/openvswitch/meter.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/openvswitch/meter.c b/net/openvswitch/meter.c
index 3323b79ff548..5010d1ddd4bd 100644
--- a/net/openvswitch/meter.c
+++ b/net/openvswitch/meter.c
@@ -61,7 +61,8 @@ static struct dp_meter *lookup_meter(const struct datapath *dp,
 	struct hlist_head *head;
 
 	head = meter_hash_bucket(dp, meter_id);
-	hlist_for_each_entry_rcu(meter, head, dp_hash_node) {
+	hlist_for_each_entry_rcu(meter, head, dp_hash_node,
+				lockdep_ovsl_is_held()) {
 		if (meter->id == meter_id)
 			return meter;
 	}
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
