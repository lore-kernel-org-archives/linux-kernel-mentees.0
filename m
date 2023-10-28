Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283E9C0032E
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 28 Oct 2023 10:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92E7E42121;
	Sat, 28 Oct 2023 10:23:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92E7E42121
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AOLYsyth
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yBMvmi0Cb7rG; Sat, 28 Oct 2023 10:23:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 400EF4211C;
	Sat, 28 Oct 2023 10:23:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 400EF4211C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 221A9C0039;
	Sat, 28 Oct 2023 10:23:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9EA8FC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Oct 2023 10:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C6B360FEE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Oct 2023 10:23:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C6B360FEE
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AOLYsyth
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5yEP0hN7opRT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Oct 2023 10:23:11 +0000 (UTC)
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3C2F660FC7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Oct 2023 10:23:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C2F660FC7
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-7a66bf80fa3so33392039f.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Oct 2023 03:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698488590; x=1699093390;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kb55IUehlVDFui1W5Bu4cGzv/u+VjTYYaWK8F7NZpEw=;
 b=AOLYsythQDT7R/hYRS9CqxA/9Kn+v/ifWF1HTA/JNj7gwJfjDPKo3aAtYwysQIvzB/
 SARVsDnkSweTJ17/mH5wJod8tM12bzpwn4VdaMlaiQYL54LumcY8yTuIgeCPNHKEKFHq
 9Eo7HGF22ugvP/SohKuEr+da2Gmt2BLzwYgnr5pXo/Ly75cwqWLRtgsF6JIRKFz7WvQl
 Qb4bL7ldsEYsPlpk/DBt0HaG2cbWI480DlGcaNxTLq+UXsgp9kxxOcD0s20qH81POxIB
 eZI0LXHXMmKAHNQ+DWSg6OXFxaDeblQs0je5PZ1r7c/n3OfUtD7ZkN4YO1zhAys1lMYb
 uisw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698488590; x=1699093390;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kb55IUehlVDFui1W5Bu4cGzv/u+VjTYYaWK8F7NZpEw=;
 b=oXya6WMukHDrl2zqNLO6RN0t2RhEuJ53C5loqtehXU6T1IJK94XJ3vybhGFg0pt92a
 YzWczO846WVyYGdO7VhCQqp2hbAF5tyd35eC0+LVotZVWfPeIPLMBHINqSoV+Dtx1c52
 awuBqQzFs4T23rrQq1qJ5YEfelC6sHQ55QVHyyNDx4go35znv2j72RF2EZLXf+Z4BFc5
 PUp3UX12eafDU1wgp+eN2o+U9VckLcwUGT0gQl9l0282dnbXdcEw57WVVRoBKuRl9ooi
 QOddAzaJQkNQPbTrlyzDucxGvgp+trHxRGdutKlYYZdlpIHMac4+KzO2upBbegVrfkSW
 WSAg==
X-Gm-Message-State: AOJu0YyVV5g2KEOy8wWkRF1LYO17cGVs0CJiTTxZqcteYzb1Ya94siNz
 xQDPiQfjmYHYe629nKEfbjA=
X-Google-Smtp-Source: AGHT+IHeixX1hbPYYC1zBSVSB2/SC6Alo2uqS0ckaaWewKEhn82kZj6BhgrRpooEQkU8idBvXmwU2g==
X-Received: by 2002:a92:d38f:0:b0:357:a23c:b99b with SMTP id
 o15-20020a92d38f000000b00357a23cb99bmr5577483ilo.3.1698488590152; 
 Sat, 28 Oct 2023 03:23:10 -0700 (PDT)
Received: from abhinav.. ([103.75.161.210]) by smtp.gmail.com with ESMTPSA id
 u188-20020a6379c5000000b0057c29fec795sm2187640pgc.37.2023.10.28.03.23.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Oct 2023 03:23:09 -0700 (PDT)
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
To: akpm@linux-foundation.org, brauner@kernel.org, surenb@google.com,
 mst@redhat.com, michael.christie@oracle.com,
 mathieu.desnoyers@efficios.com, mjguzik@gmail.com, npiggin@gmail.com,
 shakeelb@google.com, peterz@infradead.org
Subject: [PATCH v3] Fixing directly deferencing a __rcu pointer warning
Date: Sat, 28 Oct 2023 15:52:47 +0530
Message-Id: <20231028102247.404488-1-singhabhinav9051571833@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231027122221.GA24128@redhat.com>
References: <20231027122221.GA24128@redhat.com>
MIME-Version: 1.0
Cc: Abhinav Singh <singhabhinav9051571833@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
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

This patch fixes the warning about directly dereferencing a pointer
tagged with __rcu annotation.

Dereferencing the pointers tagged with __rcu directly should
always be avoided according to the docs. There is a rcu helper
function rcu_dereference(...) to use when dereferencing a __rcu
pointer. This function returns the non __rcu tagged pointer which
can be dereferenced just like a normal pointer.

Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
---
v1 -> v2 : added rcu_dereference(...) at line 2694
v2 -> v3 : added rcu_dereference(...) at line 2695

 kernel/fork.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/fork.c b/kernel/fork.c
index 10917c3e1f03..e78649974669 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -2369,7 +2369,7 @@ __latent_entropy struct task_struct *copy_process(
 
 	retval = -EAGAIN;
 	if (is_rlimit_overlimit(task_ucounts(p), UCOUNT_RLIMIT_NPROC, rlimit(RLIMIT_NPROC))) {
-		if (p->real_cred->user != INIT_USER &&
+		if (rcu_dereference(p->real_cred)->user != INIT_USER &&
 		    !capable(CAP_SYS_RESOURCE) && !capable(CAP_SYS_ADMIN))
 			goto bad_fork_cleanup_count;
 	}
@@ -2690,9 +2690,9 @@ __latent_entropy struct task_struct *copy_process(
 			 * tasklist_lock with adding child to the process tree
 			 * for propagate_has_child_subreaper optimization.
 			 */
-			p->signal->has_child_subreaper = p->real_parent->signal->has_child_subreaper ||
-							 p->real_parent->signal->is_child_subreaper;
-			list_add_tail(&p->sibling, &p->real_parent->children);
+			p->signal->has_child_subreaper = rcu_dereference(p->real_parent)->signal->has_child_subreaper ||
+							rcu_dereference(p->real_parent)->signal->is_child_subreaper;
+			list_add_tail(&p->sibling, &rcu_dereference(p->real_parent)->children);
 			list_add_tail_rcu(&p->tasks, &init_task.tasks);
 			attach_pid(p, PIDTYPE_TGID);
 			attach_pid(p, PIDTYPE_PGID);
-- 
2.39.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
