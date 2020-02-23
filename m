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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B1A6C35666
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 Feb 2020 11:22:46 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25CB520656
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 Feb 2020 11:22:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uuOFmCqu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25CB520656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E6EAD203D9;
	Sun, 23 Feb 2020 11:22:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fWtAX0Peedy0; Sun, 23 Feb 2020 11:22:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 313E420369;
	Sun, 23 Feb 2020 11:22:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 22FCEC18DA;
	Sun, 23 Feb 2020 11:22:45 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3EAECC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 11:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 266B586F3A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 11:22:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lJuioDZFVMH3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 11:22:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4969086416
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 11:22:41 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id d9so3500311pgu.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 03:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=sN5H5uRLxodeA5ftMsFKjGciLDtvEDOcbHLiiCvT97A=;
 b=uuOFmCqu1d9sfG86Qiyc9owige0Ou0kvZAf7Aloq6yU5Vs9Jlp+tPaOTsRCcUfJhGv
 WF2zjCuWOg3RVOe+XDokcsT4rBZyHm7gMWSrS1xYkHaRLFlpxtjW1JbdrslewMQRcddP
 vaOUjmx5cMva+W5QjX9cNqHMZ1KGYYum6ncoZz+hGhS9J+X4a5zJroahnMULLMNwh6xZ
 z/Il2UJV4GzTC8L9RTzNNxNNy5F7wyTsi724lok/8K5gM/TnhGMkJzRaluxAr9GAQgyS
 7vFmi5vd8UJ4iEHPNQrjMIcQEx1C6QU4jh3eCKHcgfUyMyeqQ9PkqvgCBxbEnZ2nJpHJ
 ZFYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=sN5H5uRLxodeA5ftMsFKjGciLDtvEDOcbHLiiCvT97A=;
 b=V614HIfMEHxHELAJdXpIC6ih8RjLy/RLBHuGmhoaWG6y+bfOmGZLT4RwPOTjZq1J5h
 oCmTs1F+g2LqbTkxe33DMzw2FdhoiCaiUT1Gu5nXhqc6HfarBUFdmiS/orhDYOuNcV/U
 V3vZVodDAg0ukDdaghsJrtEWrN3Yx8jTzlVPM2ISs1sEp7m/bMs41V9xAMhuOgb7ZnIP
 bSkX/4BwHIfIAOulQS4/60sjbR3Dem/LKoAbhYzhAV0Ym2K8OuSG1DRXz96cxZVxePi5
 pGSi6N590Q+iDusWB/c26B7Ggfdgkfhr4pT/MEb+eH8VNx13M9jIH28qg9T+I3dZ8Sk2
 T/vw==
X-Gm-Message-State: APjAAAWscYA8L++CFu7l+m6F8WKVwMTuxure3I0BYrnV0XKFe+LvnYXB
 Orjejdxm+kFp++3Umh8HXQ==
X-Google-Smtp-Source: APXvYqzFWkFdZrObvg5gTMa7MV1O7ZL7rM1c9JISPyZ95Uyl7uXVnez3GO1zSfXywPpVHNl48+/+8A==
X-Received: by 2002:a63:ec07:: with SMTP id j7mr47290312pgh.187.1582456960948; 
 Sun, 23 Feb 2020 03:22:40 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:515:9a49:e8ed:fa6e:a613:7ebf])
 by smtp.gmail.com with ESMTPSA id j8sm8641078pjb.4.2020.02.23.03.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2020 03:22:40 -0800 (PST)
From: madhuparnabhowmik10@gmail.com
To: jiri@mellanox.com,
	davem@davemloft.net
Date: Sun, 23 Feb 2020 16:52:33 +0530
Message-Id: <20200223112233.13417-1-madhuparnabhowmik10@gmail.com>
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
 net/core/devlink.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/net/core/devlink.c b/net/core/devlink.c
index 4c63c9a4c09e..e82750bdc496 100644
--- a/net/core/devlink.c
+++ b/net/core/devlink.c
@@ -6838,26 +6838,33 @@ int devlink_dpipe_table_register(struct devlink *devlink,
 				 void *priv, bool counter_control_extern)
 {
 	struct devlink_dpipe_table *table;
-
-	if (devlink_dpipe_table_find(&devlink->dpipe_table_list, table_name))
-		return -EEXIST;
+	int err = 0;
 
 	if (WARN_ON(!table_ops->size_get))
 		return -EINVAL;
 
+	mutex_lock(&devlink->lock);
+
+	if (devlink_dpipe_table_find(&devlink->dpipe_table_list, table_name)) {
+		err = -EEXIST;
+		goto unlock;
+	}
+
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
