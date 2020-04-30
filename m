Return-Path: <SRS0=qNpr=6O=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C9E5C47247
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Apr 2020 16:02:27 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 611192076D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Apr 2020 16:02:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gUF51ZdE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 611192076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 26D0786E8F;
	Thu, 30 Apr 2020 16:02:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ertp16UTP-jH; Thu, 30 Apr 2020 16:02:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 52C2986E75;
	Thu, 30 Apr 2020 16:02:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 30B39C0889;
	Thu, 30 Apr 2020 16:02:25 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4E490C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 16:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3D1032052D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 16:02:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 86cEkaXGnlAJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 16:02:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by silver.osuosl.org (Postfix) with ESMTPS id E5109204C9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 16:02:21 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id q124so2931182pgq.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 09:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=cNV8wBKZnzVBtfymmveclI4KpbJZuqPxmoI95kkMdEk=;
 b=gUF51ZdEmMNREvmXqCvOQL6dUB2acFhJN4T+qV1lyQaqLu19s6doZkP4sgYp+HFDxZ
 vB0lbjGzTxRL0fE/0T+K+CkxGMAw3phFJpqHqgcsu395S+hUjHM5tAqQTmfF4iNiTK0S
 rUy19yKokxXhSnhmACYx4qtBM0xXlI+/94J8U8fhHMisdBW4uA2nlERs8MexdDiujgcZ
 owtBIRwsLeE/PmzeQlKTzRuCL3sk/LZ2tdoyH5VDaq9dBHU2/0EM0T/Zls4dXbKeiLK1
 6fCIg28YSOEKSUTj0xoShyBrKt5gcQKodO8WzxA4w7+0WouJT5aiUzn2W9DlzrOGIU/i
 usYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=cNV8wBKZnzVBtfymmveclI4KpbJZuqPxmoI95kkMdEk=;
 b=k7toZHDBac5XxR0yUdiy6BJ1B+au+kiq3GIxWWbCoA8N4HoKPOrwBlKp7PbYOmVTWs
 pVpQWduhUaWYoduesE/49f+MVFbOua4E7OUo2dJiplUXA60SFojGpMKruESMK0MScTFK
 0eViiTDnQj/8SjPS/eVFIsxfDCwCPw3AS+VMv0clzwlSusprkYF/EqEfxMjGbTr7qPrW
 M/J9Ao0MQ52i1SPnPscvMMXsaxnuKDfS+tOYSJrCXwxGV436zC54Bm7YtTchKOR0hPj6
 3P+/hGRJ7wmPCrCa3m1DLJOact+UTwDBZ26E+/pjIFeYqc7UhJ2UfFh7LRKauxMp7Mut
 6xOw==
X-Gm-Message-State: AGi0Pub5a8lrvJhwb9UvmuX3FIr2wgn9XvAfSWeTdpIjGqP9MT5MxVnc
 8YBTcQEaz22g8/tyA2pjEw==
X-Google-Smtp-Source: APiQypKDW2dWa9U3zBxfHDvIfC7dS46oUZwZ5hSH0zqX0CXg5Qavgg068rmwXmccEmvXAV0Z3Zj/ng==
X-Received: by 2002:aa7:9811:: with SMTP id e17mr28538pfl.70.1588262541257;
 Thu, 30 Apr 2020 09:02:21 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:d32:dd79:2591:468a:ee81:9c85])
 by smtp.gmail.com with ESMTPSA id 5sm244359pjf.19.2020.04.30.09.02.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 09:02:20 -0700 (PDT)
From: madhuparnabhowmik10@gmail.com
To: zohar@linux.ibm.com, jmorris@namei.org, serge@hallyn.com,
 paulmck@kernel.org
Date: Thu, 30 Apr 2020 21:32:05 +0530
Message-Id: <20200430160205.17798-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 linux-security-module@vger.kernel.org, joel@joelfernandes.org,
 linux-integrity@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] integrity: evm: Fix RCU list related
	warnings.
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

This patch fixes the following warning and few other
instances of traversal of evm_config_xattrnames list:

[   32.848432] =============================
[   32.848707] WARNING: suspicious RCU usage
[   32.848966] 5.7.0-rc1-00006-ga8d5875ce5f0b #1 Not tainted
[   32.849308] -----------------------------
[   32.849567] security/integrity/evm/evm_main.c:231 RCU-list traversed in non-reader section!!

Since entries are only added to the list and never deleted,
use list_For_each_entry_lockless() instead of
list_for_each_entry_rcu() for traversing the list.
Also, add a relevant comment in evm_secfs.c to indicate this fact.

Reported-by: kernel test robot <lkp@intel.com>
Suggested-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
---
 security/integrity/evm/evm_crypto.c | 2 +-
 security/integrity/evm/evm_main.c   | 4 ++--
 security/integrity/evm/evm_secfs.c  | 9 ++++++++-
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/security/integrity/evm/evm_crypto.c b/security/integrity/evm/evm_crypto.c
index 35682852ddea..b2dc87da5f50 100644
--- a/security/integrity/evm/evm_crypto.c
+++ b/security/integrity/evm/evm_crypto.c
@@ -207,7 +207,7 @@ static int evm_calc_hmac_or_hash(struct dentry *dentry,
 	data->hdr.length = crypto_shash_digestsize(desc->tfm);
 
 	error = -ENODATA;
-	list_for_each_entry_rcu(xattr, &evm_config_xattrnames, list) {
+	list_for_each_entry_lockless(xattr, &evm_config_xattrnames, list) {
 		bool is_ima = false;
 
 		if (strcmp(xattr->name, XATTR_NAME_IMA) == 0)
diff --git a/security/integrity/evm/evm_main.c b/security/integrity/evm/evm_main.c
index d361d7fdafc4..0d36259b690d 100644
--- a/security/integrity/evm/evm_main.c
+++ b/security/integrity/evm/evm_main.c
@@ -97,7 +97,7 @@ static int evm_find_protected_xattrs(struct dentry *dentry)
 	if (!(inode->i_opflags & IOP_XATTR))
 		return -EOPNOTSUPP;
 
-	list_for_each_entry_rcu(xattr, &evm_config_xattrnames, list) {
+	list_for_each_entry_lockless(xattr, &evm_config_xattrnames, list) {
 		error = __vfs_getxattr(dentry, inode, xattr->name, NULL, 0);
 		if (error < 0) {
 			if (error == -ENODATA)
@@ -228,7 +228,7 @@ static int evm_protected_xattr(const char *req_xattr_name)
 	struct xattr_list *xattr;
 
 	namelen = strlen(req_xattr_name);
-	list_for_each_entry_rcu(xattr, &evm_config_xattrnames, list) {
+	list_for_each_entry_lockless(xattr, &evm_config_xattrnames, list) {
 		if ((strlen(xattr->name) == namelen)
 		    && (strncmp(req_xattr_name, xattr->name, namelen) == 0)) {
 			found = 1;
diff --git a/security/integrity/evm/evm_secfs.c b/security/integrity/evm/evm_secfs.c
index 39ad1038d45d..cfc3075769bb 100644
--- a/security/integrity/evm/evm_secfs.c
+++ b/security/integrity/evm/evm_secfs.c
@@ -232,7 +232,14 @@ static ssize_t evm_write_xattrs(struct file *file, const char __user *buf,
 		goto out;
 	}
 
-	/* Guard against races in evm_read_xattrs */
+	/*
+	 * xattr_list_mutex guards against races in evm_read_xattrs().
+	 * Entries are only added to the evm_config_xattrnames list
+	 * and never deleted. Therefore, the list is traversed
+	 * using list_for_each_entry_lockless() without holding
+	 * the mutex in evm_calc_hmac_or_hash(), evm_find_protected_xattrs()
+	 * and evm_protected_xattr().
+	 */
 	mutex_lock(&xattr_list_mutex);
 	list_for_each_entry(tmp, &evm_config_xattrnames, list) {
 		if (strcmp(xattr->name, tmp->name) == 0) {
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
