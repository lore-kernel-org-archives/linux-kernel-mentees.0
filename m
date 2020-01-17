Return-Path: <SRS0=W785=3G=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36560C33CB1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jan 2020 13:40:30 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0394C20728
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jan 2020 13:40:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j15iXKGq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0394C20728
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8534C2076E;
	Fri, 17 Jan 2020 13:40:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K2hsLmBC2AvB; Fri, 17 Jan 2020 13:40:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BA98720422;
	Fri, 17 Jan 2020 13:40:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A2797C1D81;
	Fri, 17 Jan 2020 13:40:24 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E1849C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jan 2020 13:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DBA3886440
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jan 2020 13:40:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IPFVjBvhtgDb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jan 2020 13:40:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7C0D286427
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jan 2020 13:40:16 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id d5so3184142pjz.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jan 2020 05:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RlKM/XYrBa3kEOwzCqWtgXvilXlmKMO+nK4gGJZhPfg=;
 b=j15iXKGqjYlNBJ1O5MSIPLWXuL/l4gus32mS8VNjxmISFECRxV5UZEPyHvRH6yoQLO
 uO4qX4SvAMVnuN+JxcDHCmJ6Gsp6dOhvkk929w+ntR8qY+Ztw8hObJ2GNudF+tkNALDA
 l+RMK5xSjtCPuFAtz8/lE4mOWThFWTjgw8BmcUHvZbZctPRvyg4ef2fRfrCRwb3LjY1w
 LMN1l7RF/4hgRpgYwrTI8doJZzjLMIc0u0EROorqpVdYkUaoj/Wj39EYG3zCIa07R2QV
 5Eg2S48eXDdQYhiXyVafm2Cc3tx6lssLzMDuY9Xy3ylGnJLts8EvE+LxOtEmk9OFwL9l
 8r0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RlKM/XYrBa3kEOwzCqWtgXvilXlmKMO+nK4gGJZhPfg=;
 b=jgux94YN87bs9qCglpmHap3h3e+ZvuJBu0SM5DPkqI8fM6/zCtcZRcWx/VgoCxONEr
 oWGpiwvOeZPS4+nAdx9g/36zSJ99XBxWiI3qo4B9n7ngXhqTU8Q21XO3eP79yGNxbwzw
 F6SrML2S9xEVq6FpeOjAUIzjQmEm9H+gT9mHG7XnoTk5ugoYPmhSyUTZgpT6gF0yKC60
 bQqpucpFobZN0r/PrgJJmgu9QtpjgUuNt0IEP2mMb6T6DYdCK3M50DrJS4CrfLD4ucY7
 t6++pzWf5ZDSPMFHqRyJu3sszUR7204x8wR6JrWNp+PrmO6ettR6NKFR8D5ansxCCE5D
 y9+A==
X-Gm-Message-State: APjAAAXE4xmbDpiF2CsJXFtfK5bdMGfrMuDGwHblNm/8Fwu3po0cbeZA
 Ul2Fw/ZNcF6I6h81JuZX/H/uj8k4
X-Google-Smtp-Source: APXvYqzxmaDfnD4G85RlkpYrpXtxDrj9FaouwSSrEYObW8QCM4XIkoNSNpMzFf8n3qW5tBKyql+dKg==
X-Received: by 2002:a17:902:8d8a:: with SMTP id
 v10mr28505346plo.90.1579268416120; 
 Fri, 17 Jan 2020 05:40:16 -0800 (PST)
Received: from localhost.localdomain ([103.211.17.168])
 by smtp.googlemail.com with ESMTPSA id
 s18sm29522422pfh.179.2020.01.17.05.40.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2020 05:40:15 -0800 (PST)
From: Amol Grover <frextrite@gmail.com>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Fri, 17 Jan 2020 19:08:53 +0530
Message-Id: <20200117133854.32550-1-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, target-devel@vger.kernel.org,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 1/3] drivers: target:
	target_core_device: Pass lockdep expression to RCU lists
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

nacl->lun_entry_hlist is traversed with hlist_for_each_entry_rcu
outside an RCU read-side critical section but under the
protection of nacl->lun_entry_mutex.

Hence, add the corresponding lockdep expression to the list traversal
primitive to silence false-positive lockdep warnings, and
harden RCU lists.

Signed-off-by: Amol Grover <frextrite@gmail.com>
---
v3:
- Remove rcu_read_lock_held() from lockdep expression since it is
  implicitly checked for.
- Remove unintended macro usage.

v2:
- Fix sparse error
  CHECK: Alignment should match open parenthesis

 drivers/target/target_core_device.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/target/target_core_device.c b/drivers/target/target_core_device.c
index 2d19f0e332b0..306c626183d5 100644
--- a/drivers/target/target_core_device.c
+++ b/drivers/target/target_core_device.c
@@ -247,7 +247,8 @@ void core_free_device_list_for_node(
 	struct se_dev_entry *deve;
 
 	mutex_lock(&nacl->lun_entry_mutex);
-	hlist_for_each_entry_rcu(deve, &nacl->lun_entry_hlist, link) {
+	hlist_for_each_entry_rcu(deve, &nacl->lun_entry_hlist, link,
+				 lockdep_is_held(&nacl->lun_entry_mutex)) {
 		struct se_lun *lun = rcu_dereference_check(deve->se_lun,
 					lockdep_is_held(&nacl->lun_entry_mutex));
 		core_disable_device_list_for_node(lun, deve, nacl, tpg);
@@ -276,7 +277,8 @@ struct se_dev_entry *target_nacl_find_deve(struct se_node_acl *nacl, u64 mapped_
 {
 	struct se_dev_entry *deve;
 
-	hlist_for_each_entry_rcu(deve, &nacl->lun_entry_hlist, link)
+	hlist_for_each_entry_rcu(deve, &nacl->lun_entry_hlist, link,
+				 lockdep_is_held(&nacl->lun_entry_mutex))
 		if (deve->mapped_lun == mapped_lun)
 			return deve;
 
@@ -460,7 +462,8 @@ void core_clear_lun_from_tpg(struct se_lun *lun, struct se_portal_group *tpg)
 	list_for_each_entry(nacl, &tpg->acl_node_list, acl_list) {
 
 		mutex_lock(&nacl->lun_entry_mutex);
-		hlist_for_each_entry_rcu(deve, &nacl->lun_entry_hlist, link) {
+		hlist_for_each_entry_rcu(deve, &nacl->lun_entry_hlist, link,
+					 lockdep_is_held(&nacl->lun_entry_mutex)) {
 			struct se_lun *tmp_lun = rcu_dereference_check(deve->se_lun,
 					lockdep_is_held(&nacl->lun_entry_mutex));
 
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
