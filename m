Return-Path: <SRS0=uoqP=3Z=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3030DC352A2
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Feb 2020 16:23:35 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E916B217BA
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Feb 2020 16:23:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ng9RIwUo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E916B217BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AB71084EEB;
	Wed,  5 Feb 2020 16:23:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rRi-LbIdBHme; Wed,  5 Feb 2020 16:23:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 483A384B08;
	Wed,  5 Feb 2020 16:23:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3CDE6C1D81;
	Wed,  5 Feb 2020 16:23:34 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 55316C0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 16:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3AF12865AB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 16:23:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lr6h5OJ6QzqQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 16:23:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9AB1F8657C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 16:23:32 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id y73so1465902pfg.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 05 Feb 2020 08:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Tce+wxjIMbP1aBJd+9E6qNp6uBiu269F8hsx89rAEMQ=;
 b=Ng9RIwUoZeB4aHfpO+Tb3lYtoc5hWrPfBnInlWr5WYNzfKZ/Zvdt3OMzxTgW18UQnP
 I7VPGuSbciereltyvGY4UrNiOBbZ1OFTMxwTuqbKZMVIaMurcVaaOIV6dqkPv88U5hL+
 zCEJk9dGaUZL57IMf6ZlKSnmASpz6TxNCT+wHFoHtBOLivj8NNwVv6E35byBhy8myeMx
 An5Cg+z6QcCXldbyeElha85nYyherOButvsO0TPW0plpBeFbNtQLrnHFPbxdCSrdetRS
 aZGgg9aIu+Y00QQQpo43dGRXhy8l7FgUKxXRlzthdjuACqVGJtiavszTfdfZSeVIU79L
 oEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Tce+wxjIMbP1aBJd+9E6qNp6uBiu269F8hsx89rAEMQ=;
 b=D7Vg7MfW+FNfCIFdUfS5OU9nTVyLNB9VNzPSyQ+Wp3HEaWbq5vHIX1gsJ8nJngHna8
 JZ2MzC5s7QTCxxnL9masSZsIMtsOdTvqNDaBgEz1F95zwYnrAM4O4B81ArfElyykkX0k
 4m6MNz+Q266wCcboH5T2al7wPS1J4kBazLE+vqnrW7NKuy1wKj+zbfPPtoMGh3Pznonv
 2zTv1ybYxCGSEdbmWcOKS+piJXyFAyPVHmJS4GGu1OuT7MtXMB88GYxNnUFpSAwVwcFT
 9rK91xFmqFSEfPBfhJOfXp43XnSeUwGUz1yGV/pS7ZASp9gJF22JexH2oXq1FDkCneSC
 U2iw==
X-Gm-Message-State: APjAAAVRXwe7HpQUxpXUjRmMZUdIaigDzj4k3P/QcvReaKEAvKrZZFcT
 VGyWGTUgvZZnYmT3HjIFoA==
X-Google-Smtp-Source: APXvYqwPz03t/tZOqTHtQoK9t5yZGyu2CKqVzPPZ0H3B+hjFBBVmOLAEZg+s41V/DdpNMd8CU4EPiw==
X-Received: by 2002:a63:f04c:: with SMTP id s12mr37284336pgj.408.1580919812193; 
 Wed, 05 Feb 2020 08:23:32 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:542:9945:9d58:40ca:c55a:7c02])
 by smtp.gmail.com with ESMTPSA id v9sm269016pja.26.2020.02.05.08.23.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 08:23:31 -0800 (PST)
From: madhuparnabhowmik10@gmail.com
To: ebiederm@xmission.com, oleg@redhat.com, christian.brauner@ubuntu.com,
 guro@fb.com, tj@kernel.org
Date: Wed,  5 Feb 2020 21:53:19 +0530
Message-Id: <20200205162319.28263-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: paulmck@kernel.org, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] signal.c: Fix sparse warnings
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

This patch fixes the following two sparse warnings caused due to
accessing RCU protected pointer tsk->parent without rcu primitives.

kernel/signal.c:1948:65: warning: incorrect type in argument 1 (different address spaces)
kernel/signal.c:1948:65:    expected struct task_struct *tsk
kernel/signal.c:1948:65:    got struct task_struct [noderef] <asn:4> *parent
kernel/signal.c:1949:40: warning: incorrect type in argument 1 (different address spaces)
kernel/signal.c:1949:40:    expected void const volatile *p
kernel/signal.c:1949:40:    got struct cred const [noderef] <asn:4> *[noderef] <asn:4> *
kernel/signal.c:1949:40: warning: incorrect type in argument 1 (different address spaces)
kernel/signal.c:1949:40:    expected void const volatile *p
kernel/signal.c:1949:40:    got struct cred const [noderef] <asn:4> *[noderef] <asn:4> *

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
---
 kernel/signal.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/signal.c b/kernel/signal.c
index 9ad8dea93dbb..3d59e5652d94 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -1945,8 +1945,8 @@ bool do_notify_parent(struct task_struct *tsk, int sig)
 	 * correct to rely on this
 	 */
 	rcu_read_lock();
-	info.si_pid = task_pid_nr_ns(tsk, task_active_pid_ns(tsk->parent));
-	info.si_uid = from_kuid_munged(task_cred_xxx(tsk->parent, user_ns),
+	info.si_pid = task_pid_nr_ns(tsk, task_active_pid_ns(rcu_access_pointer(tsk->parent)));
+	info.si_uid = from_kuid_munged(task_cred_xxx(rcu_access_pointer(tsk->parent), user_ns),
 				       task_uid(tsk));
 	rcu_read_unlock();
 
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
