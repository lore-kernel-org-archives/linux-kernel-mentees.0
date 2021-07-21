Return-Path: <SRS0=/QuR=MN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94BA9C636C9
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Jul 2021 19:01:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4580C6121E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Jul 2021 19:01:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4580C6121E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=anirudhrb.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1099882D5D;
	Wed, 21 Jul 2021 19:01:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5V8s1_3SeZmw; Wed, 21 Jul 2021 19:01:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 220E082D1E;
	Wed, 21 Jul 2021 19:01:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 006ABC0010;
	Wed, 21 Jul 2021 19:01:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 09313C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 19:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED3F182D2D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 19:01:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id izSCe94B7AlY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 19:01:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sender4-of-o53.zoho.com (sender4-of-o53.zoho.com
 [136.143.188.53])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B09F82D1E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 19:01:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1626894083; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Bn+Y8kMwqOlqp7mA0OwMCjSR2/kRCHRFZyjznGVH0RrakS+uZDHaVlN/mGLw/qEtqaO+9tPHYqJn+vRvk28DyYI69Nh/K2WN4XmHWircaBQXLFsdYNG9IrRnowszcbZf2XZ9RWi/H58F2pcPce3QpgarkMXlutG5UId/J1NtOXA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1626894083;
 h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=pwWyWf9iTLLSqSZtxuDpebrahwhVdTamxCNml8XhKcA=; 
 b=flmzsuYVqZjizLp+1FAOJLSiN2lc4VODyx3MH2smsePz7fkNFqpPAJyvQad4q0rwSZJRB6B3walhR58OHOAd0LbhgUUJyFf9pN0dmXy5dmu6aKWHisB3hIXZJPze20myKFHA5vNzACxlPIBBtY3hrE7LvlfKxNdsI6nibbJ7hmA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=anirudhrb.com;
 spf=pass  smtp.mailfrom=mail@anirudhrb.com;
 dmarc=pass header.from=<mail@anirudhrb.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1626894083; 
 s=zoho; d=anirudhrb.com; i=mail@anirudhrb.com;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
 bh=pwWyWf9iTLLSqSZtxuDpebrahwhVdTamxCNml8XhKcA=;
 b=RkgBHz32zC5Sg9HMF2+jkefJ/qzAYkP7awAJRUoRHnX4naIygXoM/SJ81A8Zx9+e
 A2tH3YBuA/WJ0YnT1EtMSqER4vpizbfRLphTvAD3o1UShPEni4IBx4ad57nwzsy+IZr
 9VzobHiDLtsNyxk26gKmANTss0Z2ZveAn2yKz/Tg=
Received: from localhost.localdomain (106.51.105.64 [106.51.105.64]) by
 mx.zohomail.com with SMTPS id 1626894078842163.29940161512548;
 Wed, 21 Jul 2021 12:01:18 -0700 (PDT)
From: Anirudh Rayabharam <mail@anirudhrb.com>
To: mcgrof@kernel.org, gregkh@linuxfoundation.org, rafael@kernel.org,
 skhan@linuxfoundation.org
Subject: [PATCH v5 2/2] firmware_loader: fix use-after-free in
 firmware_fallback_sysfs
Date: Thu, 22 Jul 2021 00:30:14 +0530
Message-Id: <20210721190014.2313-3-mail@anirudhrb.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210721190014.2313-1-mail@anirudhrb.com>
References: <20210721190014.2313-1-mail@anirudhrb.com>
MIME-Version: 1.0
X-ZohoMailClient: External
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 syzbot+de271708674e2093097b@syzkaller.appspotmail.com
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

This use-after-free happens when a fw_priv object has been freed but
hasn't been removed from the pending list (pending_fw_head). The next
time fw_load_sysfs_fallback tries to insert into the list, it ends up
accessing the pending_list member of the previoiusly freed fw_priv.

The root cause here is that all code paths that abort the fw load
don't delete it from the pending list. For example:

	_request_firmware()
	  -> fw_abort_batch_reqs()
	      -> fw_state_aborted()

To fix this, delete the fw_priv from the list in __fw_set_state() if
the new state is DONE or ABORTED. This way, all aborts will remove
the fw_priv from the list. Accordingly, remove calls to list_del_init
that were being made before calling fw_state_(aborted|done).

Also, in fw_load_sysfs_fallback, don't add the fw_priv to the pending
list if it is already aborted. Instead, just jump out and return early.

Fixes: bcfbd3523f3c ("firmware: fix a double abort case with fw_load_sysfs_fallback")
Reported-by: syzbot+de271708674e2093097b@syzkaller.appspotmail.com
Tested-by: syzbot+de271708674e2093097b@syzkaller.appspotmail.com
Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>
---
 drivers/base/firmware_loader/fallback.c | 10 +++++++---
 drivers/base/firmware_loader/firmware.h |  6 +++++-
 drivers/base/firmware_loader/main.c     |  2 ++
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/base/firmware_loader/fallback.c b/drivers/base/firmware_loader/fallback.c
index bc25bb5d1ed6..f244c7b89ba5 100644
--- a/drivers/base/firmware_loader/fallback.c
+++ b/drivers/base/firmware_loader/fallback.c
@@ -115,10 +115,9 @@ static void __fw_load_abort(struct fw_priv *fw_priv)
 	 * There is a small window in which user can write to 'loading'
 	 * between loading done and disappearance of 'loading'
 	 */
-	if (fw_sysfs_done(fw_priv))
+	if (fw_state_is_aborted(fw_priv) || fw_sysfs_done(fw_priv))
 		return;
 
-	list_del_init(&fw_priv->pending_list);
 	fw_state_aborted(fw_priv);
 }
 
@@ -304,7 +303,6 @@ static ssize_t firmware_loading_store(struct device *dev,
 			 * Same logic as fw_load_abort, only the DONE bit
 			 * is ignored and we set ABORT only on failure.
 			 */
-			list_del_init(&fw_priv->pending_list);
 			if (rc) {
 				fw_state_aborted(fw_priv);
 				written = rc;
@@ -537,6 +535,11 @@ static int fw_load_sysfs_fallback(struct fw_sysfs *fw_sysfs, long timeout)
 	}
 
 	mutex_lock(&fw_lock);
+	if (fw_state_is_aborted(fw_priv)) {
+		mutex_unlock(&fw_lock);
+		retval = -EINTR;
+		goto out;
+	}
 	list_add(&fw_priv->pending_list, &pending_fw_head);
 	mutex_unlock(&fw_lock);
 
@@ -556,6 +559,7 @@ static int fw_load_sysfs_fallback(struct fw_sysfs *fw_sysfs, long timeout)
 		mutex_unlock(&fw_lock);
 	}
 
+out:
 	device_del(f_dev);
 err_put_dev:
 	put_device(f_dev);
diff --git a/drivers/base/firmware_loader/firmware.h b/drivers/base/firmware_loader/firmware.h
index 63bd29fdcb9c..36bdb413c998 100644
--- a/drivers/base/firmware_loader/firmware.h
+++ b/drivers/base/firmware_loader/firmware.h
@@ -117,8 +117,12 @@ static inline void __fw_state_set(struct fw_priv *fw_priv,
 
 	WRITE_ONCE(fw_st->status, status);
 
-	if (status == FW_STATUS_DONE || status == FW_STATUS_ABORTED)
+	if (status == FW_STATUS_DONE || status == FW_STATUS_ABORTED) {
+#ifdef CONFIG_FW_LOADER_USER_HELPER
+		list_del_init(&fw_priv->pending_list);
+#endif
 		complete_all(&fw_st->completion);
+	}
 }
 
 static inline void fw_state_aborted(struct fw_priv *fw_priv)
diff --git a/drivers/base/firmware_loader/main.c b/drivers/base/firmware_loader/main.c
index 4fdb8219cd08..68c549d71230 100644
--- a/drivers/base/firmware_loader/main.c
+++ b/drivers/base/firmware_loader/main.c
@@ -783,8 +783,10 @@ static void fw_abort_batch_reqs(struct firmware *fw)
 		return;
 
 	fw_priv = fw->priv;
+	mutex_lock(&fw_lock);
 	if (!fw_state_is_aborted(fw_priv))
 		fw_state_aborted(fw_priv);
+	mutex_unlock(&fw_lock);
 }
 
 /* called from request_firmware() and request_firmware_work_func() */
-- 
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
