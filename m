Return-Path: <SRS0=uyVO=3Y=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45305C35247
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  4 Feb 2020 16:45:10 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F26C2084E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  4 Feb 2020 16:45:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="amxR0ufk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F26C2084E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D86E58704A;
	Tue,  4 Feb 2020 16:45:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bm3L+BUTdRpL; Tue,  4 Feb 2020 16:45:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1C3BA8708F;
	Tue,  4 Feb 2020 16:45:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 05840C1D81;
	Tue,  4 Feb 2020 16:45:07 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AAA37C0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Feb 2020 16:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 91BA28704A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Feb 2020 16:45:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l6McBkqcaYlq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Feb 2020 16:45:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0FE9487143
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Feb 2020 16:45:05 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id y1so7487838plp.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 04 Feb 2020 08:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LvcrkfGVaVyqYp3PxmtymjbwEQgZobmEwUEZg9FpGaA=;
 b=amxR0ufkthyJ0qvUGfISZjnp12D/UvujELNV7hj5l8NXTqN820SVKf/An6xueYxnsH
 WdsRKO/8Td+kLoM3zPJDXTvoRbt4DG7nobx+aEgd/navqMRUTcHZzXTJyrtr7tjICBWZ
 bS+5PzBtocw+xfxt65j0iA19ssjA0oXicVwyqvlyTqKgHocHNHMF0Kd+kd7wUk1/6NM5
 OBO8KU5gmYe4Ppnh3t+x/3uobPYNAlXP0cgafOUYmLtu6o/YytKdTeGjRbliY7DT+HUa
 oV0cwktplTjylwHI4Wuzu4vXKWW1wvaXzvqbjqZ+w3Cj4qw8gD6yG8A+4QeCxzBGIMbx
 WaUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LvcrkfGVaVyqYp3PxmtymjbwEQgZobmEwUEZg9FpGaA=;
 b=T5PdqJATL5wQQRMeUBHY/+VflY7S1suXJrItrr3N5Pb/7Bq6xvsqkl3LRB0bscN3bh
 R+p5BcWDfHOQrQzY+xGJGU8k8eYgs3x69UQt+VKPlukLDfyKiXm4dWod51pvL6Es0DwW
 2fXL52Oh1/eZzeCp2TF+P2jsW8XjnDfpUn8DLPdlrc0erfTvN9gvCzK0Bj17D2jR7KPn
 J5Bu92kp5ab0EmA3HkxbvOmgr6/AwQFh8MjY+ffvSz237piVMObSDuXY6E8YQEWUVUz9
 gTv+P15MVtMZjrcYOKcv0hREvuj2LskivJpp9dbjshfp2Ori5M1mooXhW+44TbGsQ9+z
 48nw==
X-Gm-Message-State: APjAAAWAKRWak8k/8piZVNGPA8DoJskF5xhNct1rdayM2/3I5scyODMt
 wi2ao8mFkBIIq5nF/MKk2us=
X-Google-Smtp-Source: APXvYqyrNRvFVsIbsz+itodJc3xqzJ2HZEwsR8LxK0ZUndBzqXQuE0BdoLsPEulQaXBpVAWZVIxy/g==
X-Received: by 2002:a17:902:7406:: with SMTP id
 g6mr30734580pll.103.1580834704599; 
 Tue, 04 Feb 2020 08:45:04 -0800 (PST)
Received: from localhost.localdomain ([146.196.37.61])
 by smtp.googlemail.com with ESMTPSA id ci5sm4266173pjb.5.2020.02.04.08.45.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 08:45:04 -0800 (PST)
From: Amol Grover <frextrite@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Ingo Molnar <mingo@redhat.com>
Date: Tue,  4 Feb 2020 22:13:01 +0530
Message-Id: <20200204164300.15297-1-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2] tracing: Annotate
	ftrace_graph_hash pointer with __rcu
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

Fix following instances of sparse error
kernel/trace/ftrace.c:5664:29: error: incompatible types in comparison
kernel/trace/ftrace.c:5785:21: error: incompatible types in comparison
kernel/trace/ftrace.c:5864:36: error: incompatible types in comparison
kernel/trace/ftrace.c:5866:25: error: incompatible types in comparison

Use rcu_dereference_sched to dereference the __rcu annotated pointer.

Signed-off-by: Amol Grover <frextrite@gmail.com>
---
v2:
- Use rcu_dereference_sched instead of rcu_dereference_protected

 kernel/trace/ftrace.c | 2 +-
 kernel/trace/trace.h  | 9 ++++++---
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 9bf1f2cd515e..959ded08dc13 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -5596,7 +5596,7 @@ static const struct file_operations ftrace_notrace_fops = {
 
 static DEFINE_MUTEX(graph_lock);
 
-struct ftrace_hash *ftrace_graph_hash = EMPTY_HASH;
+struct ftrace_hash __rcu *ftrace_graph_hash = EMPTY_HASH;
 struct ftrace_hash *ftrace_graph_notrace_hash = EMPTY_HASH;
 
 enum graph_filter_type {
diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
index 63bf60f79398..7253e8251f50 100644
--- a/kernel/trace/trace.h
+++ b/kernel/trace/trace.h
@@ -950,22 +950,25 @@ extern void __trace_graph_return(struct trace_array *tr,
 				 unsigned long flags, int pc);
 
 #ifdef CONFIG_DYNAMIC_FTRACE
-extern struct ftrace_hash *ftrace_graph_hash;
+extern struct ftrace_hash __rcu *ftrace_graph_hash;
 extern struct ftrace_hash *ftrace_graph_notrace_hash;
 
 static inline int ftrace_graph_addr(struct ftrace_graph_ent *trace)
 {
 	unsigned long addr = trace->func;
 	int ret = 0;
+	struct ftrace_hash *hash;
 
 	preempt_disable_notrace();
 
-	if (ftrace_hash_empty(ftrace_graph_hash)) {
+	hash = rcu_dereference_sched(ftrace_graph_hash);
+
+	if (ftrace_hash_empty(hash)) {
 		ret = 1;
 		goto out;
 	}
 
-	if (ftrace_lookup_ip(ftrace_graph_hash, addr)) {
+	if (ftrace_lookup_ip(hash, addr)) {
 
 		/*
 		 * This needs to be cleared on the return functions
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
