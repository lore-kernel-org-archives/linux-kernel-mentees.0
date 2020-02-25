Return-Path: <SRS0=F6Pe=4N=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFDC8C35DE1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 25 Feb 2020 12:28:02 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99E3C20CC7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 25 Feb 2020 12:28:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VAAaWZsH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99E3C20CC7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6DF13875BC;
	Tue, 25 Feb 2020 12:28:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4-jGyIc9hchy; Tue, 25 Feb 2020 12:28:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id EF321875BB;
	Tue, 25 Feb 2020 12:28:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D3791C089F;
	Tue, 25 Feb 2020 12:28:01 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 95E8AC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Feb 2020 12:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 829F2864D8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Feb 2020 12:28:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FWY26yWsWhkz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Feb 2020 12:28:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id EE6F886447
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Feb 2020 12:27:59 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id m13so1218217pjb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Feb 2020 04:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=+QtbxlvdjtvFda/vLl5OBW1XulRAqxs8RhN83qn/HyM=;
 b=VAAaWZsH9ff4hCxWAWkbiQ66n9p2Wfea3aJP0p5rAMk8NtghSBZBJFxxx7ljudMPLT
 AJ2d3jPOF8pyGPIk1V5WEb3bi3IYGdsBQJU6kiEaM34JGP8SMVnJ6mQFIosIVPY72qON
 LNX+bb9RO1twk9ho41qpq1BqNqR+CfU5dMOezxJ2sNFFY/wZ+Q3aM3jA8h4hwnlB4nTF
 B0G7ofOSTG7D8+ilvq/JGjHr4E+ckzwR418BILmJuQ7IfunCV5Ls8MmeFUucFvFHslsK
 bxXc6niBU6BZPgHFTSEuTP+quZpDy/Q1VRFmDiR4VsnEHQTHR+89nfGV0PMSfAhv7BHi
 aQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=+QtbxlvdjtvFda/vLl5OBW1XulRAqxs8RhN83qn/HyM=;
 b=eQGtoi9pcztTKPoFBv1DM7py2S0uxSsBGcrxIimSKEBVXWb7g75s7YCsswN0imykM/
 IFWL0COvF76sLD70MK84x0rRu8pnJ1GuSdqf50WewnSYi3dXVzu5VUlBDcGwSmAEhuzP
 o3SXcVD6XnCpmypS2WxXW0ETWiPhdXyGGg67RSFeSDcSmVpbB9dXmHm4wsR8WbaIm6+x
 juI1o+y6IzmWtYy3OxUn57IC7czVYEm6ci1M0RT+gwMu4MhEj9WjPUydzR7jwFk09pe9
 PTEtuUgUJNbp64KXKxv0vGw61lMNc6/cjygz3CUuws8BEcn1oi7wHn0qnB0/h9BBWwhs
 GBtQ==
X-Gm-Message-State: APjAAAU6zl64uGWeOBGq4iGO1Mx74aSi5RBt5YzVTAPr6bd2WdBRz7Bd
 C2MuII7uSullSdSS+kIosQ==
X-Google-Smtp-Source: APXvYqztBpN7FmSWeDOyFVt+VeM03oK0FL5OGPHFt8Rl0M+/B0gDYwwZenbSWw35AEfaNoYTNLjtTw==
X-Received: by 2002:a17:90b:90d:: with SMTP id
 bo13mr4942999pjb.54.1582633678246; 
 Tue, 25 Feb 2020 04:27:58 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:1ee1:f355:e8e5:803b:cde8:bccc])
 by smtp.gmail.com with ESMTPSA id s7sm16508981pgp.44.2020.02.25.04.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 04:27:57 -0800 (PST)
From: madhuparnabhowmik10@gmail.com
To: jiri@mellanox.com,
	davem@davemloft.net
Date: Tue, 25 Feb 2020 17:57:45 +0530
Message-Id: <20200225122745.31095-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: paulmck@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] net: core: devlink.c: Use built-in
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
false lockdep warning when CONFIG_PROVE_RCU_LIST is enabled.

The devlink->lock is held when devlink_dpipe_table_find()
is called in non RCU read side section. Therefore, pass struct devlink
to devlink_dpipe_table_find() for lockdep checking.

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
---
 net/core/devlink.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/net/core/devlink.c b/net/core/devlink.c
index e82750bdc496..a92ab58304e5 100644
--- a/net/core/devlink.c
+++ b/net/core/devlink.c
@@ -2103,11 +2103,11 @@ static int devlink_dpipe_entry_put(struct sk_buff *skb,
 
 static struct devlink_dpipe_table *
 devlink_dpipe_table_find(struct list_head *dpipe_tables,
-			 const char *table_name)
+			 const char *table_name, struct devlink *devlink)
 {
 	struct devlink_dpipe_table *table;
-
-	list_for_each_entry_rcu(table, dpipe_tables, list) {
+	list_for_each_entry_rcu(table, dpipe_tables, list,
+				lockdep_is_held(&devlink->lock)) {
 		if (!strcmp(table->name, table_name))
 			return table;
 	}
@@ -2226,7 +2226,7 @@ static int devlink_nl_cmd_dpipe_entries_get(struct sk_buff *skb,
 
 	table_name = nla_data(info->attrs[DEVLINK_ATTR_DPIPE_TABLE_NAME]);
 	table = devlink_dpipe_table_find(&devlink->dpipe_table_list,
-					 table_name);
+					 table_name, devlink);
 	if (!table)
 		return -EINVAL;
 
@@ -2382,7 +2382,7 @@ static int devlink_dpipe_table_counters_set(struct devlink *devlink,
 	struct devlink_dpipe_table *table;
 
 	table = devlink_dpipe_table_find(&devlink->dpipe_table_list,
-					 table_name);
+					 table_name, devlink);
 	if (!table)
 		return -EINVAL;
 
@@ -6814,7 +6814,7 @@ bool devlink_dpipe_table_counter_enabled(struct devlink *devlink,
 
 	rcu_read_lock();
 	table = devlink_dpipe_table_find(&devlink->dpipe_table_list,
-					 table_name);
+					 table_name, devlink);
 	enabled = false;
 	if (table)
 		enabled = table->counters_enabled;
@@ -6845,7 +6845,8 @@ int devlink_dpipe_table_register(struct devlink *devlink,
 
 	mutex_lock(&devlink->lock);
 
-	if (devlink_dpipe_table_find(&devlink->dpipe_table_list, table_name)) {
+	if (devlink_dpipe_table_find(&devlink->dpipe_table_list, table_name,
+				     devlink)) {
 		err = -EEXIST;
 		goto unlock;
 	}
@@ -6881,7 +6882,7 @@ void devlink_dpipe_table_unregister(struct devlink *devlink,
 
 	mutex_lock(&devlink->lock);
 	table = devlink_dpipe_table_find(&devlink->dpipe_table_list,
-					 table_name);
+					 table_name, devlink);
 	if (!table)
 		goto unlock;
 	list_del_rcu(&table->list);
@@ -7038,7 +7039,7 @@ int devlink_dpipe_table_resource_set(struct devlink *devlink,
 
 	mutex_lock(&devlink->lock);
 	table = devlink_dpipe_table_find(&devlink->dpipe_table_list,
-					 table_name);
+					 table_name, devlink);
 	if (!table) {
 		err = -EINVAL;
 		goto out;
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
