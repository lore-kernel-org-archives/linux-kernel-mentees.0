Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4EBEC4332F
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 28 Oct 2023 20:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7064D83F4D;
	Sat, 28 Oct 2023 20:47:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7064D83F4D
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MTgP6tRl
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l0aHGRJ4khMU; Sat, 28 Oct 2023 20:47:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7C62283F42;
	Sat, 28 Oct 2023 20:47:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C62283F42
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 57D52C0039;
	Sat, 28 Oct 2023 20:47:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0F6CFC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Oct 2023 20:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE8E783F4A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Oct 2023 20:47:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE8E783F4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ztm4X2cKBYDK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Oct 2023 20:47:42 +0000 (UTC)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 06AB383F3D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Oct 2023 20:47:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06AB383F3D
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-6bd20c30831so803043b3a.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Oct 2023 13:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698526061; x=1699130861;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VpDOJLyU8MiY3ma65dn79lmcz6KLCXAwl31ARg43/8k=;
 b=MTgP6tRl6t2us0BuF0a09RBH15GiDvIKyToFw2h158PN9wk1Jo7x50qrnSrnPIEbCq
 HqS9201ASysujSitF9eFERy/piM7fun/EB6o46f44v/UznuChgjGsCUi+HK7lked6IOl
 2+6iNe8gvG1zeAMeQ9wN/TTvMfsIJEeQLGWcA9B+ldYB22VJLNqFtGDFa2NY+CaRF8tg
 eOmdP/4kGoakuU9EF1t6wfGEjHgMQRbjI2sbpu2cIK5IvTv7b8T6XqMDg/GPDNkkoPOc
 fGFYzjMx+FXvbFkS5ziNDfr6ayJ8ZknODPe3vdNA9WUA8hpZWHhaiZGSOr5cOEoTAbum
 chHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698526061; x=1699130861;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VpDOJLyU8MiY3ma65dn79lmcz6KLCXAwl31ARg43/8k=;
 b=pbt5UDUF/0GvFvSajcUlPBIq+ZdsfrBjasuWaUNrbnjpFoVxWG0dXTMO4cArNwnjJN
 1NIPQDPdnHtE4HJaAXukx6r1K8Jp8kKg664v7WBOdX+oytIHpJoiO3vxTTOEfM3kz9Fw
 qFsrGtu7wU1LnVasqJbt8s8Ic92ExP+K3LHRD4Enl8/TVQrD09SU1hFxuEZcEzAnEpGo
 OY5nmKFyv+LtYLodgWOQWRZch4S48qN55ohLKrAoO1G9RXMuc+6kj00AK0A0Zh5YNlTP
 Z60iq1quCtett3LMhwZJgOWNgsIU/GesNbPHWBcfE/OdIDGHBsFD44guuRUoXAlNE1Cg
 N6bA==
X-Gm-Message-State: AOJu0Yx+ilcw4PgXhrrJ0w7v30sllKXwHP6ANfFOiMO8EYep0d4kS9MK
 nafcBCZw8+Eqmi3aI8fhsPk=
X-Google-Smtp-Source: AGHT+IHgmCGa+iM0HuEyly9OpQ7XusJhhgjc/45/fSDPdo/pKZN+Vo/ZmypHY7LVpk5J6VSz6v3wmA==
X-Received: by 2002:a17:903:2581:b0:1cc:3e45:ac1e with SMTP id
 jb1-20020a170903258100b001cc3e45ac1emr839464plb.6.1698526061323; 
 Sat, 28 Oct 2023 13:47:41 -0700 (PDT)
Received: from abhinav.. ([103.75.161.208]) by smtp.gmail.com with ESMTPSA id
 iw2-20020a170903044200b001ca86a9caccsm3611977plb.228.2023.10.28.13.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Oct 2023 13:47:40 -0700 (PDT)
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
To: akpm@linux-foundation.org, brauner@kernel.org, surenb@google.com,
 mst@redhat.com, michael.christie@oracle.com,
 mathieu.desnoyers@efficios.com, mjguzik@gmail.com, npiggin@gmail.com,
 shakeelb@google.com, peterz@infradead.org
Subject: [PATCH v3] Fixing directly deferencing a __rcu pointer warning
Date: Sun, 29 Oct 2023 02:16:09 +0530
Message-Id: <20231028204609.426841-1-singhabhinav9051571833@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <93115738-6919-4855-81b7-eb9b2fc60137@gmail.com>
References: <93115738-6919-4855-81b7-eb9b2fc60137@gmail.com>
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
pointer inside rcu read side critical sections. This function 
returns the non __rcu tagged pointer which can be dereferenced 
just like a normal pointer.

Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
---

Link to original patch 
 https://lore.kernel.org/all/20231025222811.855336-1-singhabhinav9051571833@gmail.com/

Change from original -> v2 : 
 1. removed the null check before dereferencing the dereferenced rcu
    pointer at line 2372.
 2. added rcu_dereference(...) at line 2694
    
Changes from v2 -> v3 
 1. added rcu_dereference(...) at line 2693

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
