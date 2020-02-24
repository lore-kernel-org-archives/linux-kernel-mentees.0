Return-Path: <SRS0=/sBJ=4M=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3596CC35679
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 24 Feb 2020 09:30:38 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF8F220714
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 24 Feb 2020 09:30:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F+kebht7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF8F220714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C7D7086EC0;
	Mon, 24 Feb 2020 09:30:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vi3s59ZFyysc; Mon, 24 Feb 2020 09:30:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 338E086E1D;
	Mon, 24 Feb 2020 09:30:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1B7CCC07FF;
	Mon, 24 Feb 2020 09:30:37 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0309EC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Feb 2020 09:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DEE3D85CE2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Feb 2020 09:30:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wp8I6jU-tadh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Feb 2020 09:30:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7933985C9E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Feb 2020 09:30:35 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id ay11so3822115plb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Feb 2020 01:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=TzHPIC1N5lujx/c4PdrT0qr3lBEBYRGEgiiSQgfxX0Q=;
 b=F+kebht7CIAgDDYDNVPs2fj7BHGZsc+fhhFSV+NHv2vm5iiUu2tp/euw0/qQG4I5FM
 p+pXewsBFekfJ6VLvLbOqKIBI+ORiDTkEhWjUyDXmeo3tCHMEhZ64xHe5jl6gWGnbHiN
 E6hlBEgdffHZk/lQbYUfeMa/joFXOhtyNEnCMY0k0ALp/FhBJll+X0lf5wS/CL4NSsZH
 2vDlrCjxS1uYnuhdFwz2eZDgSifrkcAo1dgVgt8oHYxaMIMPd+jJDfwnkm/8TkP/1reO
 Ep7+E+L0zseAiflDfxekb3+X5tLnk+dY2er5czPgHZnaoe43dqoZBX7sFCHBzmMVKC3r
 8XfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=TzHPIC1N5lujx/c4PdrT0qr3lBEBYRGEgiiSQgfxX0Q=;
 b=SD0jHFV9ek+zwV7QUXVAFpolTOTYGW8MaiduZ3IucNSPj12RJ9a6VjfjV6/uuYwZ0J
 lFPtjdjrt72dw8teCaTsmXjf46VPTbFK4W08dKbkTl3dJg8thRgivtzYRHiJo0a0KVjm
 nTHFmC0JbJ881WJWxNEwtCC/K252LIz/cbmILOCdkHhKKaCJIUIGp6Cw2skHJ4YrIe6o
 AYNqUF+x+Rl+HuUIBx2rcpPjRP/+L8cJyVpvoU+TqgKi2kUBP1IaTvKKfc7kIbgAgI9X
 Qt70gqmNtMMlVTc//VjwiBmuiQ6ht+FtE1SbvWLXimVGqQXLUHChGGtCK3gONOoy//l6
 rNog==
X-Gm-Message-State: APjAAAUn3Q5WQ0Wb4HOvt1MCWPLcZoNb2Bpquti47GbBXxV74FE6qdkt
 hEmzouvK45EXLVN+/qUwaw==
X-Google-Smtp-Source: APXvYqwKi/xOhNp1DVmUj92WivktpNFQDkOR3l3um1lBMxrFlN6G4zpoD6kqG/y6XoPfmYGnQAxcGg==
X-Received: by 2002:a17:902:fe8d:: with SMTP id
 x13mr50387571plm.232.1582536635071; 
 Mon, 24 Feb 2020 01:30:35 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:1ee7:f49b:e8e5:803b:cde8:bccc])
 by smtp.gmail.com with ESMTPSA id 11sm12119680pfz.25.2020.02.24.01.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 01:30:33 -0800 (PST)
From: madhuparnabhowmik10@gmail.com
To: jiri@mellanox.com,
	davem@davemloft.net
Date: Mon, 24 Feb 2020 15:00:13 +0530
Message-Id: <20200224093013.25700-1-madhuparnabhowmik10@gmail.com>
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
 net/core/devlink.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/net/core/devlink.c b/net/core/devlink.c
index e82750bdc496..dadf5fa79bb1 100644
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
@@ -6845,7 +6845,7 @@ int devlink_dpipe_table_register(struct devlink *devlink,
 
 	mutex_lock(&devlink->lock);
 
-	if (devlink_dpipe_table_find(&devlink->dpipe_table_list, table_name)) {
+	if (devlink_dpipe_table_find(&devlink->dpipe_table_list, table_name, devlink)) {
 		err = -EEXIST;
 		goto unlock;
 	}
@@ -6881,7 +6881,7 @@ void devlink_dpipe_table_unregister(struct devlink *devlink,
 
 	mutex_lock(&devlink->lock);
 	table = devlink_dpipe_table_find(&devlink->dpipe_table_list,
-					 table_name);
+					 table_name, devlink);
 	if (!table)
 		goto unlock;
 	list_del_rcu(&table->list);
@@ -7038,7 +7038,7 @@ int devlink_dpipe_table_resource_set(struct devlink *devlink,
 
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
