Return-Path: <SRS0=GVOk=4J=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C4DDC3565B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Feb 2020 18:10:10 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60DBC208E4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Feb 2020 18:10:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hO+B1xyx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60DBC208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 30C6B82027;
	Fri, 21 Feb 2020 18:10:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FNrHhgw48SAj; Fri, 21 Feb 2020 18:10:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C8C778531D;
	Fri, 21 Feb 2020 18:09:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AD99DC1D81;
	Fri, 21 Feb 2020 18:09:57 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BC105C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 18:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A6A8884BCF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 18:09:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9q2G3q4lxEM7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 18:09:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2BA35842FC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 18:09:55 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id p11so1170424plq.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 10:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=YnVHKaoJO1HX1P3NwrYh2l54OzBJ4vkSrlh4+CAHtGg=;
 b=hO+B1xyxXHmcprcyOZM3Cy0x+2O3VQsdZjPTe+ekQC7GFiaiWjd8FyaNONdKkg3T/t
 +2NAXkZ6mbo4wtvB8xBdIV4NrJs8TgXNSfzBUAAH2A9ZOR0gyFmB8mk+R4bGgM/sRkkT
 KF3fmjik6hIhZFmPnqUH9EhRaJFnTE08Xg13MVZzcLSJCbEZq8KPvt59pr6NLkMfMj2y
 IWgl1BCkSi7UPCaEdwwSkCyef472NQWEcpc/VBIZ1fKdf/m0/x1J3a7QsHCKZ19beETK
 ZKAjShshl2w5hRyoJS2BZ6GFLemmWtsnNQzsQ91/yMUmQtK21LLt7FECYeEWnVqgwGk0
 7e9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=YnVHKaoJO1HX1P3NwrYh2l54OzBJ4vkSrlh4+CAHtGg=;
 b=U3eTyCXBavwodmBUVts9OJGMjJAE+u2NpT6uLtuw8L69MFkY4CvIOwHdtlTonYslLj
 gDw4HAx87AWXDhwRO8pl+uYt92ZqoGiPGv9CDE7rHpkELuTB84itHzGV2oHitw67Q8r9
 N1nYKE10pQY0D46XKHVWBw/r/JiPnUB6rMwdoCw8beoXDq5gsE7ksA/0u1G8h5Li2RGj
 encPQfkg2cCmcH7s+h2ld2E3N19lTK2aPzvvKtKbaWW5fMiU7EkoVbM0/k+LVY+clpmM
 aaJLtPFcCiRuV/42oTQUIeRJvTk/HKfcUSRJ8S3JwzKLP+gV/NEs4E9PrUPjRJBlUkDc
 O8lQ==
X-Gm-Message-State: APjAAAWjV7JCRzzZNM9BiRQASxL1c7q9dfeFetVzSWoiOG0R0uvt5FUi
 W7Lq2ml/jjyJrfrZt6X5mg==
X-Google-Smtp-Source: APXvYqwJhe7ghkmt0lMpu8J3qCpPScB3kKurmtqaq6raB9yrlGmcE021hxheks/b4wl7pzkD7yAQYg==
X-Received: by 2002:a17:902:ab81:: with SMTP id
 f1mr38545653plr.5.1582308594745; 
 Fri, 21 Feb 2020 10:09:54 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:1ee0:fe5e:d03d:769b:c838:c146])
 by smtp.gmail.com with ESMTPSA id x65sm3639043pfb.171.2020.02.21.10.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 10:09:54 -0800 (PST)
From: madhuparnabhowmik10@gmail.com
To: jiri@mellanox.com,
	davem@davemloft.net
Date: Fri, 21 Feb 2020 23:39:43 +0530
Message-Id: <20200221180943.17415-1-madhuparnabhowmik10@gmail.com>
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
 net/core/devlink.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/core/devlink.c b/net/core/devlink.c
index 3e8c94155d93..d54e1f156b6f 100644
--- a/net/core/devlink.c
+++ b/net/core/devlink.c
@@ -6840,6 +6840,8 @@ int devlink_dpipe_table_register(struct devlink *devlink,
 {
 	struct devlink_dpipe_table *table;
 
+	mutex_lock(&devlink->lock);
+
 	if (devlink_dpipe_table_find(&devlink->dpipe_table_list, table_name))
 		return -EEXIST;
 
@@ -6855,7 +6857,6 @@ int devlink_dpipe_table_register(struct devlink *devlink,
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
