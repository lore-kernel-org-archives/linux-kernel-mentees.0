Return-Path: <SRS0=/lQp=4L=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71472C35666
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 Feb 2020 10:53:39 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D2E320675
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 Feb 2020 10:53:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lAtq8oy7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D2E320675
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id F297E8663C;
	Sun, 23 Feb 2020 10:53:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EsRa-kU5Z4a5; Sun, 23 Feb 2020 10:53:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6075D85CA1;
	Sun, 23 Feb 2020 10:53:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 46DFFC1AE2;
	Sun, 23 Feb 2020 10:53:38 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4BFA0C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 10:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3374085142
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 10:53:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dbOsGBIIpdf0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 10:53:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A373D850E9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 10:53:36 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id m13so2785269pjb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 02:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=OEEW1DTnBFbnlO66oXY98scwTWu597r8Ev8ViVHpyjY=;
 b=lAtq8oy7ZbFUvK4mz2/eececVa4oaLqY/H+M5CQXdYP4afRefZsPdaon55bltTSMIv
 Ct5Q+tAqUpLNDsi3rKHVSXINgwHIlTuwXVqVu+Ihmt1heNqAbcPZcgXmnaMgAkol0hdG
 7Y4dTpdiV1N84jV+dbCAQeJoVgr5rco0ESE0YJHW8z9ejkDgrXcZTsRHY/MrzrTrNJLg
 aXiPGUjixjxqxmZBb/NmGIN++5cS66GvvaLKO92yXYBpRkbXxSK2uEfXkfVV5dBzr9/S
 WUSsOeuKCLfuHBHs+uvSUzDwW7YYyUFbV1oO2ZUv2F8YPYrvYwbMKCFZK3Jn8j/DorQT
 d8ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=OEEW1DTnBFbnlO66oXY98scwTWu597r8Ev8ViVHpyjY=;
 b=Ab/6OdHU3RcPRNSQn1buS0UboF2EPW8D3df3/yjrRfqt25FctAc/Zg4hMCg6+htsZJ
 EtIyp9ZNMlhxfI6u7N+jZr6L2siaE5KVBDt+x6uRjVvFX0wc/o/erUVne8t05k1NM8pP
 irhRpo7XLenXOIqjpFGUPIVYlCbTvsZ7PTCYKjzlteEbKnmkB6Mz81LdK8cH/ppKn/3N
 NUPFlb56KnKSc/c/zcYWzq/GJH05TBGvKz9vbnyc46+ILlWMHOK80kqbleXUl87joG45
 fNm9Q8ysHyJVmK7QJ89sECDEzb7Ue4nk/tzLiD/HvoaMk6/M/xkjWxaJfI4eyQfBsJzb
 hSpg==
X-Gm-Message-State: APjAAAX5ifFrumVzvnalAgh5ycFBsWt8wqPARj5tOocXSMb25PRiyrVl
 rhooNunsbL3SZPPTsrVSDg==
X-Google-Smtp-Source: APXvYqwNX2gq8OJNtybbXhKPh2g63AGm/Zg0Us7nmGCHpT6shOf99h31rxsenrwhSWOhYH1C7vz5fw==
X-Received: by 2002:a17:902:204:: with SMTP id
 4mr46168201plc.266.1582455216243; 
 Sun, 23 Feb 2020 02:53:36 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:515:9a49:e8ed:fa6e:a613:7ebf])
 by smtp.gmail.com with ESMTPSA id v8sm8842150pgt.52.2020.02.23.02.53.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2020 02:53:35 -0800 (PST)
From: madhuparnabhowmik10@gmail.com
To: jiri@mellanox.com,
	davem@davemloft.net
Date: Sun, 23 Feb 2020 16:22:53 +0530
Message-Id: <20200223105253.30469-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: paulmck@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] net: core: devlink.c: Hold
	devlink->lock from the beginning of devlink_dpipe_table_register()
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

devlink_dpipe_table_find() should be called under either
rcu_read_lock() or devlink->lock. devlink_dpipe_table_register()
calls devlink_dpipe_table_find() without holding the lock
and acquires it later. Therefore hold the devlink->lock
from the beginning of devlink_dpipe_table_register().

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
---
 net/core/devlink.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/net/core/devlink.c b/net/core/devlink.c
index 4c63c9a4c09e..61a350f59741 100644
--- a/net/core/devlink.c
+++ b/net/core/devlink.c
@@ -6838,26 +6838,35 @@ int devlink_dpipe_table_register(struct devlink *devlink,
 				 void *priv, bool counter_control_extern)
 {
 	struct devlink_dpipe_table *table;
+	int err = 0;
 
-	if (devlink_dpipe_table_find(&devlink->dpipe_table_list, table_name))
-		return -EEXIST;
+	mutex_lock(&devlink->lock);
 
-	if (WARN_ON(!table_ops->size_get))
-		return -EINVAL;
+	if (devlink_dpipe_table_find(&devlink->dpipe_table_list, table_name)) {
+		err = -EEXIST;
+		goto unlock;
+	}
+
+	if (WARN_ON(!table_ops->size_get)) {
+		err = -EINVAL;
+		goto unlock;
+	}
 
 	table = kzalloc(sizeof(*table), GFP_KERNEL);
-	if (!table)
-		return -ENOMEM;
+	if (!table) {
+		err = -ENOMEM;
+		goto unlock;
+	}
 
 	table->name = table_name;
 	table->table_ops = table_ops;
 	table->priv = priv;
 	table->counter_control_extern = counter_control_extern;
 
-	mutex_lock(&devlink->lock);
 	list_add_tail_rcu(&table->list, &devlink->dpipe_table_list);
+unlock:
 	mutex_unlock(&devlink->lock);
-	return 0;
+	return err;
 }
 EXPORT_SYMBOL_GPL(devlink_dpipe_table_register);
 
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
