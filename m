Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 311D7C25B47
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 27 Oct 2023 06:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2A7C4EDA0;
	Fri, 27 Oct 2023 06:37:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2A7C4EDA0
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LuTqQah1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bd8aKjospN7z; Fri, 27 Oct 2023 06:37:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B66B54ED9F;
	Fri, 27 Oct 2023 06:37:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B66B54ED9F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9ED2FC0071;
	Fri, 27 Oct 2023 06:37:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5A3D6C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Oct 2023 06:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27A554327F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Oct 2023 06:37:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27A554327F
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LuTqQah1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YZ3No_rVjWQI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Oct 2023 06:37:37 +0000 (UTC)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 02F8C431E8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Oct 2023 06:37:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02F8C431E8
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1ca79b731f1so3846165ad.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 23:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698388656; x=1698993456;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SzSfttDbr69NJfAH/KFCN3jVkR7G3r+bHSvK7He6Rw8=;
 b=LuTqQah1f5g+VrLxuThW1pivs5cnlh1RlXGUJ9ewDmU8r625rKrRe2LuqfJiilOmSX
 lj/s09939sADTM7HuXhOu1sSrkRnVHJFKRxGAvTZX2Ee+7nNngps6FdJversI/+v1rf2
 Af/jwvj+oD93a9WJ3c6YjHW6fk5hwvmjhwosT5aiAjepjZToujGHZfJWmA263y8605CI
 i2SPtLpssii74jPA7za3Rk/AWgLqmJRQgBEwUSUXqbeVSuxmJ8euR7Ke09SYvkaDmIYp
 9WXMiOzBBTswYykPkqYDItgO9ivaao+FiJ6o+Er7HvmDPB21w/zO3ZStx64A5YZ7wcZp
 E/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698388656; x=1698993456;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SzSfttDbr69NJfAH/KFCN3jVkR7G3r+bHSvK7He6Rw8=;
 b=aaCCOwtz3r2/Vqxk2f4YU2HqgUvn+CCz8t5kAQ9vVdB4gZEAAnBfC7zDUBWXOedhol
 VPYWW4t93w8X0hWCeTn8OeaKL960c5qYbQkI0lkAvTg7ssoHY1KtFpfWECIuTmZB6ubW
 wc84l99rCeC6OWJdU8upoP0jHSR44p48PIQrhZ9tKE7AHPlIQcMNLnpinLrg4sOzr1mz
 QahOfJWjKgRK03F0lw0c9+pabWsKlnOm8nLcfDHyKvE4gbqOxhBXws+aaxVqDJE+qrT9
 TuNP8phGcdmo62BjFvPSWM1N4GMliIfLTX64p9NRRdaYnZlP0dm0FSNu99fFQPwKDYs5
 38Kg==
X-Gm-Message-State: AOJu0Yz85QNKr6LeBRrPjvdq2Ip2I/WK8i0GoHmW6Jt6hjKx4uYCkr8s
 JXzv/V6yhp5HqCTvvLsAmXY=
X-Google-Smtp-Source: AGHT+IH9cSlLevIWT6YZkinJxKgWDc1KwsWHT9iUrhTAkvOQBUVFy6ss4UVZnuJKaQun311Ybn/MiA==
X-Received: by 2002:a05:6a20:3c8d:b0:17b:170c:2d11 with SMTP id
 b13-20020a056a203c8d00b0017b170c2d11mr2283271pzj.6.1698388656266; 
 Thu, 26 Oct 2023 23:37:36 -0700 (PDT)
Received: from abhinav.. ([103.75.161.208]) by smtp.gmail.com with ESMTPSA id
 h7-20020aa796c7000000b006b2dff03b3csm632673pfq.113.2023.10.26.23.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 23:37:35 -0700 (PDT)
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
To: akpm@linux-foundation.org, brauner@kernel.org, surenb@google.com,
 mst@redhat.com, michael.christie@oracle.com,
 mathieu.desnoyers@efficios.com, mjguzik@gmail.com, npiggin@gmail.com,
 shakeelb@google.com, peterz@infradead.org
Subject: [PATCH v3] Fixing directly deferencing a __rcu pointer warning
Date: Fri, 27 Oct 2023 12:07:13 +0530
Message-Id: <20231027063713.1018624-1-singhabhinav9051571833@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231026114632-mutt-send-email-mst@kernel.org>
References: <20231026114632-mutt-send-email-mst@kernel.org>
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
