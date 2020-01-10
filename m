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
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE5F9C33CA5
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jan 2020 17:06:52 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76CC620661
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jan 2020 17:06:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D6QloqUy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76CC620661
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 431DD87534;
	Fri, 10 Jan 2020 17:06:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mez1OmOm--zZ; Fri, 10 Jan 2020 17:06:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B340C86F3F;
	Fri, 10 Jan 2020 17:06:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9A39FC1D7D;
	Fri, 10 Jan 2020 17:06:51 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 87A8EC0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 17:06:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8355122264
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 17:06:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zRh-18l1reNl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 17:06:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 6E16222219
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 17:06:48 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id l35so1247197pje.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 09:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IHv1uXIjZrBkPDtqd3SWrlnhplYEAEov1hk0+vF++bc=;
 b=D6QloqUyjA7aqfAZzs4kwh2nt3pyT0OymgieI8yxI4wPm1p2eXG8sII04YqS24v3Is
 Mo9L8DH3TiCYa2CFdFIdJWheaCXhp0wrRGwZpAOCsJpAu26FAib968ZTs6vm42clut9M
 p6qjzCkQIQPH81lr1dru0y8guNmELSU+zDHiKywJAkrtvhhNBZA9NbnrwTGFiMgh6I3D
 mohLOtEeTr+b4nzZYfezm+dJDJ/qq6ekCPbh1/hhyf9B3KQap/n+mMjR5VINvjlIU+Fz
 QfeUjoR19XnQKOrIiYlcSYG/EbcMtuT8r9QWpSXAMCuXvwmNdq3GSa9mP+6P9SbblM1K
 kfwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IHv1uXIjZrBkPDtqd3SWrlnhplYEAEov1hk0+vF++bc=;
 b=EEA8KEt5gms6n98ylqsjrdGCKobZV8voUh6PVosG60iEAK9ZoP0N/IuWOouRceiGBO
 8yGgJDIIvPZvCdvC11AxwiXE3yii2bpgLsZtV5Pe5g1aa/jbMLIr41Cj3AWzYmIXVluK
 B22OIpcGFzwaWSBpdQjdkIENB/pVh9OJp9Aui1cajKl7u8v24YYeakjG72YSz5R9K4hQ
 5cbIFRtFzmh+9QOKnVliGhgBpOd6dn7vIAVaWrq/aAhj8+jnrYhyUuGHPxMbRPvp3J9w
 mlosZdLT/gDVmZqWig/Ol9cyOhrTx438j9IjykuSAztPGHI1+WCSc2zYX58kA0QFTti9
 07CA==
X-Gm-Message-State: APjAAAXfczsLp6QjrTAjN+ErIFVTj154TVnwg+E1NYPmcCCRdYxhDAEL
 8jypBdm3+3vpK/tufmyovyc=
X-Google-Smtp-Source: APXvYqx3gqGSFiAwvC6krHLnqHoT6cxVpd3wtWFIYmQO3dWFbHKJ4+9cRs/OmdPPAAfpMhC+suke+A==
X-Received: by 2002:a17:902:9885:: with SMTP id
 s5mr5464097plp.217.1578676007973; 
 Fri, 10 Jan 2020 09:06:47 -0800 (PST)
Received: from localhost.localdomain ([103.211.17.220])
 by smtp.googlemail.com with ESMTPSA id x4sm3613268pff.143.2020.01.10.09.06.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2020 09:06:47 -0800 (PST)
From: Amol Grover <frextrite@gmail.com>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Fri, 10 Jan 2020 22:35:57 +0530
Message-Id: <20200110170558.23466-1-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, target-devel@vger.kernel.org,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 1/3] drivers: target:
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
v2:
- Fix sparse error
  CHECK: Alignment should match open parenthesis

 drivers/target/target_core_device.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/target/target_core_device.c b/drivers/target/target_core_device.c
index 2d19f0e332b0..7627583e2509 100644
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
+				 lun_entry_mutex_held()) {
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
+				 rcu_read_lock_held() || lun_entry_mutex_held())
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
+					 lun_entry_mutex_held()) {
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
