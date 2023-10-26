Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E00C25B48
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 26 Oct 2023 12:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51F8D428CA;
	Thu, 26 Oct 2023 12:16:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51F8D428CA
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bMlfw4+J
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yE-8dZkWpUhF; Thu, 26 Oct 2023 12:16:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E671F410EA;
	Thu, 26 Oct 2023 12:16:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E671F410EA
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C44D3C0039;
	Thu, 26 Oct 2023 12:16:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CFFB7C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 12:16:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9EEDA605B5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 12:16:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EEDA605B5
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bMlfw4+J
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bihbZRlhNxGi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 12:16:37 +0000 (UTC)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B8526058D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 12:16:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B8526058D
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1ca85ff26afso1639235ad.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 05:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698322596; x=1698927396;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XO8QG8mtg640mQEHVkNaf9/uSEs9JeitYsu0UTItPaY=;
 b=bMlfw4+JP3bPDHOadtlu/C4KY7N2Mla3xRzhau9Q/8v/O2bw0uf6rDG7Tp1NUt8LuI
 dNULGAGxRS6OLEdmDzB56v91gvV7HCcHYrKZtCpZjfRONLkg7/GHymxGHk33PD6x3xEy
 vrfm3N6rQTKL5k4rnyPCL8v8S8dzpMJ7onp0bSbrQ5AqobIlZnzbZWQL8mZWXDVltZ0F
 rvuEd1neh/WSAp9ZHmUdppE1cYTDYqpkoWEAEGpc7eqpjPwA8ZXgtwB0yhgd7M3tW3CQ
 pllTj1WvhVk6XKpYVOX32QrDYqhFn4Vgb1xpZQkQYqdVLGoUgXJUZVWSN/ZiergHlxZH
 JB+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698322596; x=1698927396;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XO8QG8mtg640mQEHVkNaf9/uSEs9JeitYsu0UTItPaY=;
 b=r71qbEZ2FXcA9rZxAmgBMbH196SzZi99bEET4ASHoQ2RQwB1Pkef2rNZdL6OT4phQw
 wz5Nsa5TvRaUpATb7VKK6TVBGT7bcKwSNuaSKroECsO++xcDZmPEWNATej2T51daMINv
 tpyfWNuL4UO5Ol5xAj7JrSbfcmLPdAkO1kcHxSmCt8XSNs8wevlOxmirEce6Ve8h+JVD
 htVhjtHCRx4sRKDx18ateXkW5P3RUog/6n3HYgmDMoyaM63yfCxpznWPpXVJOE1v5Jk3
 Kj/5FS7+qZEsSTVnMb02Wz/JMG/Dg9RaNN7hka30v4feS1yF7ARR2BL/e7Vl0MTopV2k
 qjyQ==
X-Gm-Message-State: AOJu0YwS/CCltoKcPhmbffhgeXNHwLFNIMxyi3r3o7yy8KeMaKgg+TDE
 lD92b97EumKsuHpunRq6ivY=
X-Google-Smtp-Source: AGHT+IEx/OC9MKfzRsz/7kV73A86XsZe58590KKbyAkpmjp40WJ407zi5FlpwA/ZR3sTNt6Q+feoBQ==
X-Received: by 2002:a17:903:41c7:b0:1bf:349f:b85c with SMTP id
 u7-20020a17090341c700b001bf349fb85cmr17553128ple.1.1698322596368; 
 Thu, 26 Oct 2023 05:16:36 -0700 (PDT)
Received: from abhinav.. ([103.75.161.208]) by smtp.gmail.com with ESMTPSA id
 i13-20020a170902eb4d00b001bde65894c8sm691439pli.268.2023.10.26.05.16.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 05:16:36 -0700 (PDT)
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
To: akpm@linux-foundation.org, brauner@kernel.org, surenb@google.com,
 mst@redhat.com, michael.christie@oracle.com,
 mathieu.desnoyers@efficios.com, mjguzik@gmail.com, npiggin@gmail.com,
 shakeelb@google.com, peterz@infradead.org
Subject: [PATCH v2] Fixing directly deferencing a __rcu pointer warning
Date: Thu, 26 Oct 2023 17:46:21 +0530
Message-Id: <20231026121621.358388-1-singhabhinav9051571833@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231025165002.64ab92e6d55d204b66e055f4@linux-foundation.org>
References: <20231025165002.64ab92e6d55d204b66e055f4@linux-foundation.org>
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
functions rcu_dereference(...) to use when dereferencing a __rcu
pointer. This functions returns the non __rcu tagged pointer which
can be dereferenced just like a normal pointers.

Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
---
 kernel/fork.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/fork.c b/kernel/fork.c
index 10917c3e1f03..802b7bbe3d92 100644
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
@@ -2692,7 +2692,7 @@ __latent_entropy struct task_struct *copy_process(
 			 */
 			p->signal->has_child_subreaper = p->real_parent->signal->has_child_subreaper ||
 							 p->real_parent->signal->is_child_subreaper;
-			list_add_tail(&p->sibling, &p->real_parent->children);
+			list_add_tail(&p->sibling, &(rcu_dereference(p->real_parent)->children));
 			list_add_tail_rcu(&p->tasks, &init_task.tasks);
 			attach_pid(p, PIDTYPE_TGID);
 			attach_pid(p, PIDTYPE_PGID);
-- 
2.39.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
