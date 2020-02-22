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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58E1BC35672
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Feb 2020 06:53:11 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 231A420707
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Feb 2020 06:53:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UWf3o/nE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 231A420707
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id EE01F84543;
	Sat, 22 Feb 2020 06:53:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jpqz0O+ZStOh; Sat, 22 Feb 2020 06:53:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 69A7F84485;
	Sat, 22 Feb 2020 06:53:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 515F0C1D81;
	Sat, 22 Feb 2020 06:53:10 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 86137C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 06:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 74F0A87FD2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 06:53:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m-xtETmWrRxN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 06:53:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id F149D87FC9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 06:53:08 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 4so2455290pfz.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 22:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=O8dGjw47rBMTaYq9ZdIJC+Ct6bZIAQqAuCZjvsrgZq8=;
 b=UWf3o/nEx+XZVQxA8TbPakPz+HWWS1vWyxffSLKKOmh+vtB76WPi9666TVY80DE/54
 yg78oRlOJ2rdlUSabRRdLed8VYF+rMDwp5eKKRnbaaXgAgu3f7/Chf8CK/lukAacHOF/
 P6AQsNmXhOlxvgTgdWidnw0QYm/ZpAj8NLRccYR+wWCODSJPt+HRtt88Z+3YNwSmf0mc
 FvgILHFFOr+fHt13B30aqvt4SFTrhr3udX6vMgo75SeWR3aXipNHfm0W6r7rUi+izf+z
 y3Piw82miHXfGGz9IWG9hzgrsuBOswaCUIDloVHoPfjDMD8+b5CRhlP//O6kGC3nGYMl
 6rAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=O8dGjw47rBMTaYq9ZdIJC+Ct6bZIAQqAuCZjvsrgZq8=;
 b=PH+MfdLbOHrVo+w+Pc/JgQgvO/WIYzt7vSZHYXZ+/L6+09l3u6VrMIxT0S0z1eajQ8
 7kQDccLmSaoCGifD8CDxOM0+MhGm9Mr+NjbqFeYjUElSCiXgvN5y9VhnBOi+sbvNsz+s
 Xz5RU9kamtGpZ8jHF5f3RZtZe9gVlMeid1wjIO2M/cs64AxRKAXnm1LGSy/hqSqGpz5y
 JI4FdhE+G8Wkp3qSUuwnPPKolhT007esbSbuWw7z3HbSok5GjzPvlFJJIFssiixaFRgJ
 7uHldID4rM76rAFETZcnY0kOcG5DIbkCoWOIVhRFwnMgQYv4lWK35OuSrF44wf7d3diS
 YU3w==
X-Gm-Message-State: APjAAAXAV/6oNdRD3iZDvCotbrBywJhmAQGVZIojkzOYeTgZd1jF2xuh
 8qK6WO8kCtauJh9VPhe9hA==
X-Google-Smtp-Source: APXvYqxCu6MyWMp3NdwLGo82GJR7m2KUSumjYRTil3dfhsgIWR7CGlVVNIztSQdZsszDa4hWCju4GA==
X-Received: by 2002:a63:5e07:: with SMTP id s7mr41011057pgb.261.1582354388478; 
 Fri, 21 Feb 2020 22:53:08 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:536:efd4:3cf2:2ab1:f2dc:185c])
 by smtp.gmail.com with ESMTPSA id d14sm4708631pjz.12.2020.02.21.22.53.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 22:53:07 -0800 (PST)
From: madhuparnabhowmik10@gmail.com
To: jiri@mellanox.com,
	davem@davemloft.net
Date: Sat, 22 Feb 2020 12:22:34 +0530
Message-Id: <20200222065234.8829-1-madhuparnabhowmik10@gmail.com>
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

Suggested-by: Jiri Pirko <jiri@mellanox.com>
Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
---
 net/core/devlink.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/net/core/devlink.c b/net/core/devlink.c
index 3e8c94155d93..ba9dd8cb98c3 100644
--- a/net/core/devlink.c
+++ b/net/core/devlink.c
@@ -6840,22 +6840,29 @@ int devlink_dpipe_table_register(struct devlink *devlink,
 {
 	struct devlink_dpipe_table *table;
 
-	if (devlink_dpipe_table_find(&devlink->dpipe_table_list, table_name))
+	mutex_lock(&devlink->lock);
+
+	if (devlink_dpipe_table_find(&devlink->dpipe_table_list, table_name)) {
+		mutex_unlock(&devlink->lock);
 		return -EEXIST;
+	}
 
-	if (WARN_ON(!table_ops->size_get))
+	if (WARN_ON(!table_ops->size_get)) {
+		mutex_unlock(&devlink->lock);
 		return -EINVAL;
+	}
 
 	table = kzalloc(sizeof(*table), GFP_KERNEL);
-	if (!table)
+	if (!table) {
+		mutex_unlock(&devlink->lock);
 		return -ENOMEM;
+	}
 
 	table->name = table_name;
 	table->table_ops = table_ops;
 	table->priv = priv;
 	table->counter_control_extern = counter_control_extern;
 
-	mutex_lock(&devlink->lock);
 	list_add_tail_rcu(&table->list, &devlink->dpipe_table_list);
 	mutex_unlock(&devlink->lock);
 	return 0;
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
