Return-Path: <SRS0=OMk/=27=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DE52C33CA2
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jan 2020 12:45:06 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42D262072E
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jan 2020 12:45:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vYN1KwOD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42D262072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 20BF186B34;
	Fri, 10 Jan 2020 12:45:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xB7k0d59bm97; Fri, 10 Jan 2020 12:45:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 845A786B2A;
	Fri, 10 Jan 2020 12:45:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6F13AC1796;
	Fri, 10 Jan 2020 12:45:03 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0D345C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 12:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 02FEC86378
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 12:45:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QUTK-6qzUBNQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 12:45:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 32A8E85455
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 12:45:00 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id k3so973806pgc.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 04:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zHdRnTZJjcN2zvUamZ1G4RdksTFXX4xdkIF3BaNA6s0=;
 b=vYN1KwODkuLwoJBLCz+Dts31AwF9BgZlEnoJjsl4ZuH5wuSA4lytftMrkJQ9Y1LVVn
 kOOZmOnYt8I+8te7xUnJ6aJkUj0LK0clSL5yTYOaJzSPqm6Urt8wWTx9OxOtSsFiE1D6
 BpDp6ET4ApCD8FiK2JKLsWx0iZVNJ9zfIvn2C+JUhrp4Lc48lp+C2+s5lybjjn2F4Zv5
 XigX4O22jYy9aAhFQQHCWMA9AicRg9qEBwbjuStCu51rPAv9jTo3qziLul6HCftfRSDL
 vJ34xmC1Kre5k8uefnmDLn+Mz/jYhLmzT3TpP2GgeQrDtht5YOS7d/6T5w2x8yPzq72A
 n6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zHdRnTZJjcN2zvUamZ1G4RdksTFXX4xdkIF3BaNA6s0=;
 b=amwZqKu8MULS9ecSl0Fk/SSncbHqA6W0a9MJY17g9/PgNZ/2JUl2wq5IX2t4IZFASa
 Pw44Ah3GYdPjv1CzBrhXOkRJDBHSdDo9N1iZ1mxZ3+2DIdOFDwv3cCG7aQIOlCE2Q9+i
 8Uaigz3hgUygVpDiYjJM4DAzfDBawBuiHStQexlWOZx1TkaX3UOtQTIBlgLIh1eiyR/S
 jW2wLK7QF9bxeBp/vT7DLJsD26Xg2RGx30Rd1F8M1Tvbxmh99L3KgsQl+6Ua7wX1l/Kz
 iwOuJNVXdxjtaN/VDoB8XKfZsBq8X5lSrDFhuw1/ggv9TPFcEqzS0YWQqgBcCjjD5sYj
 r05A==
X-Gm-Message-State: APjAAAXW0V0nw7JakJgeEh5Xz4b/6Ak4s2EfL9aXUu7Mz1DMFypPD/GM
 M1p3e+bEDirCCl9ruHzumqc=
X-Google-Smtp-Source: APXvYqwsz2ALkDAVbByjWYV7EWu7XtAQh5kTGDka+88oUueTAZ6ddpkiHOT3dPiym7rxZysPhqqMuA==
X-Received: by 2002:aa7:824d:: with SMTP id e13mr3848868pfn.247.1578660299863; 
 Fri, 10 Jan 2020 04:44:59 -0800 (PST)
Received: from localhost.localdomain ([103.211.17.220])
 by smtp.googlemail.com with ESMTPSA id d3sm2764724pfn.113.2020.01.10.04.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2020 04:44:59 -0800 (PST)
From: Amol Grover <frextrite@gmail.com>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Fri, 10 Jan 2020 18:14:03 +0530
Message-Id: <20200110124403.27882-1-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, target-devel@vger.kernel.org,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 1/3] drivers: target:
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

Add macro for the corresponding lockdep expression to make the code
clean and concise.

Signed-off-by: Amol Grover <frextrite@gmail.com>
---
 drivers/target/target_core_device.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/target/target_core_device.c b/drivers/target/target_core_device.c
index 2d19f0e332b0..2d1277a83916 100644
--- a/drivers/target/target_core_device.c
+++ b/drivers/target/target_core_device.c
@@ -36,6 +36,9 @@
 #include "target_core_pr.h"
 #include "target_core_ua.h"
 
+#define lun_entry_mutex_held() \
+	lockdep_is_held(&nacl->lun_entry_mutex)
+
 static DEFINE_MUTEX(device_mutex);
 static LIST_HEAD(device_list);
 static DEFINE_IDR(devices_idr);
@@ -247,9 +250,10 @@ void core_free_device_list_for_node(
 	struct se_dev_entry *deve;
 
 	mutex_lock(&nacl->lun_entry_mutex);
-	hlist_for_each_entry_rcu(deve, &nacl->lun_entry_hlist, link) {
+	hlist_for_each_entry_rcu(deve, &nacl->lun_entry_hlist, link,
+							lun_entry_mutex_held()) {
 		struct se_lun *lun = rcu_dereference_check(deve->se_lun,
-					lockdep_is_held(&nacl->lun_entry_mutex));
+							lun_entry_mutex_held());
 		core_disable_device_list_for_node(lun, deve, nacl, tpg);
 	}
 	mutex_unlock(&nacl->lun_entry_mutex);
@@ -276,7 +280,8 @@ struct se_dev_entry *target_nacl_find_deve(struct se_node_acl *nacl, u64 mapped_
 {
 	struct se_dev_entry *deve;
 
-	hlist_for_each_entry_rcu(deve, &nacl->lun_entry_hlist, link)
+	hlist_for_each_entry_rcu(deve, &nacl->lun_entry_hlist, link,
+				rcu_read_lock_held() || lun_entry_mutex_held())
 		if (deve->mapped_lun == mapped_lun)
 			return deve;
 
@@ -339,7 +344,7 @@ int core_enable_device_list_for_node(
 	orig = target_nacl_find_deve(nacl, mapped_lun);
 	if (orig && orig->se_lun) {
 		struct se_lun *orig_lun = rcu_dereference_check(orig->se_lun,
-					lockdep_is_held(&nacl->lun_entry_mutex));
+							lun_entry_mutex_held());
 
 		if (orig_lun != lun) {
 			pr_err("Existing orig->se_lun doesn't match new lun"
@@ -460,9 +465,10 @@ void core_clear_lun_from_tpg(struct se_lun *lun, struct se_portal_group *tpg)
 	list_for_each_entry(nacl, &tpg->acl_node_list, acl_list) {
 
 		mutex_lock(&nacl->lun_entry_mutex);
-		hlist_for_each_entry_rcu(deve, &nacl->lun_entry_hlist, link) {
+		hlist_for_each_entry_rcu(deve, &nacl->lun_entry_hlist, link,
+							lun_entry_mutex_held()) {
 			struct se_lun *tmp_lun = rcu_dereference_check(deve->se_lun,
-					lockdep_is_held(&nacl->lun_entry_mutex));
+							lun_entry_mutex_held());
 
 			if (lun != tmp_lun)
 				continue;
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
