Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114D7C25B67
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 26 Oct 2023 12:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C9986146C;
	Thu, 26 Oct 2023 12:28:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C9986146C
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=S1KOVV39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YA-1_4_1agq4; Thu, 26 Oct 2023 12:28:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 5F2DC61371;
	Thu, 26 Oct 2023 12:28:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F2DC61371
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 36B77C0039;
	Thu, 26 Oct 2023 12:28:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6AF35C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 12:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38360415D0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 12:28:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38360415D0
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=S1KOVV39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YD_JNGEdoYvc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 12:28:03 +0000 (UTC)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5EA98415B9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 12:28:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EA98415B9
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1cacbd54b05so1478765ad.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 05:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698323283; x=1698928083;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XO8QG8mtg640mQEHVkNaf9/uSEs9JeitYsu0UTItPaY=;
 b=S1KOVV391sKtYWhF3mpaGYbLdTe2hDw1MRlBZt3Tzws/3H49loo/S4N75zYBvP5jaQ
 S8K6kKLieX8b60Wl5IQwj+GaLgb0Rzfq9FXPBToil9reoPA7tMPvwJ5c7q2WD6dVTGRk
 yFo53mpKFGoeqMX5tPd4RiQ0LhM1eyupHFHo5W1l7MRCsduZMW8z9zvrI7bk9uWHsz29
 OschBEQau4fhE64exyTjsyPRVJk+RGL8twPRtXALUoWmSuqw654WBW5p2PW5Fw6sRYqo
 Z1XOZOAFR/Nf+J0HHln6jl0IG1+M8Sqodl1f8fYDKVaYao9XLW75w88a9z9T0zfPhFGc
 VmwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698323283; x=1698928083;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XO8QG8mtg640mQEHVkNaf9/uSEs9JeitYsu0UTItPaY=;
 b=bhM66W4U6gy0hI1eYIhcUDmnKTzBe6E6dnvAWSrvbySJKACA3521vWB/FXObw+Pn/i
 hioqI3ZLYp5u2u8hwjZUbiBjDZAcv97JY3fclT4jRAyJ+eGl/hnT4fuNInrXUqmXhqaB
 CK03Q74m50s6jf3jJdwR9fZVPGLODRhBvXLjw1wp0VCcjpxS6s2Taug95LSKil8dsoAZ
 5NnQTVOLyP9UPtsd8gqO/fAU4fQBN60iF65YlqCVA0cN3XkuPTNYuBvWdDd1BCxZhmtc
 OiHQIVCM0rwbhvFZn0NzK0PXMDECUQ/rXwtkdCkAKJ8SuoQl4DpngPKhxZGSEJbhLV0k
 vx9Q==
X-Gm-Message-State: AOJu0Yy0Ddf7uRQ/13A1XUnBvG7QumYejEgyocd2QymU1tqEq8QBVEj8
 7hO1xVhIidYqcnMSPaj1mXE=
X-Google-Smtp-Source: AGHT+IH1gymU2/FGsSj8zyAx/Aju3HVO9NonWPsq42FvYiLPy0FZ0P17oXb7rdiEvEs+blNOiSFOyQ==
X-Received: by 2002:a17:902:654d:b0:1ca:273d:22f with SMTP id
 d13-20020a170902654d00b001ca273d022fmr17306876pln.0.1698323282764; 
 Thu, 26 Oct 2023 05:28:02 -0700 (PDT)
Received: from abhinav.. ([103.75.161.211]) by smtp.gmail.com with ESMTPSA id
 1-20020a170902c10100b001c44dbc92a2sm10850507pli.184.2023.10.26.05.27.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 05:28:02 -0700 (PDT)
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
To: akpm@linux-foundation.org, brauner@kernel.org, surenb@google.com,
 mst@redhat.com, michael.christie@oracle.com,
 mathieu.desnoyers@efficios.com, mjguzik@gmail.com, npiggin@gmail.com,
 shakeelb@google.com, peterz@infradead.org
Subject: [PATCH] Fixing directly deferencing a __rcu pointer warning
Date: Thu, 26 Oct 2023 17:57:48 +0530
Message-Id: <20231026122748.359162-1-singhabhinav9051571833@gmail.com>
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
