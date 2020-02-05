Return-Path: <SRS0=uoqP=3Z=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36B9BC35249
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Feb 2020 05:57:35 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3AE22082E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Feb 2020 05:57:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O8qKu8Z/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3AE22082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B9FF18506F;
	Wed,  5 Feb 2020 05:57:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2GTSIj3dcayi; Wed,  5 Feb 2020 05:57:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3272584D8E;
	Wed,  5 Feb 2020 05:57:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 18F7EC0177;
	Wed,  5 Feb 2020 05:57:34 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5D757C0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 05:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 59CE085B94
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 05:57:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EnhN73udNT2v
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 05:57:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4F14A85B80
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 05:57:31 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id r67so500396pjb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 04 Feb 2020 21:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Osd6lHNiwt4HuEIAx7RCd4aai13f+0kkBfeOhTavDQg=;
 b=O8qKu8Z/sRwu52iIKxNhqY6g2mcLWqIgG91NDx4IdpOu08VotLQ426lk72n4tdkaQm
 Cf+1AUtw7WoMfyhXzI2Ak4cfUXD+fJgGGDm50IS+9g7KqWnlKNz/lffL0+SXgtJ02k4I
 yBtYeQE+aoC2a849fgvCGU0R4Tg+WhewEG8LfwJ3jN+KLM0QDyNVc6PDlR4BDiHFhYHq
 +19Lypn7J0SMvWsyuJle58aNP0ZuGZ1y6QhD70pIk0vGfTRSk1QZ7MCN5QpOyl5gY74X
 r7/3rpsf3Wz8pMgTtjnbtBudrs4Z1/MVS2C1qFYK0V5kIjrjgT2CoLNHhf8UBw3iM8Ag
 o00g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Osd6lHNiwt4HuEIAx7RCd4aai13f+0kkBfeOhTavDQg=;
 b=CdnUv7eAN2nVn72QAr5ivQBHkbYfxvN0PC11bHNDh3rkwSrsI1XpHs8InY0BsTz99i
 ZnqEq0u6k1XpTUzsH4lXleAMC2p6EO8B17VbNQ7IRBGKCEo7+joJQVNrzfcviQD2RcGc
 mwT/UITblIrbF3WWB8JxXdqsg/IrOMQalon4MyW+oppBX8fjlT8eKoiwT6vB/a0kTsb/
 uiwiLk6Xfe7rUIQbwmX2xGc4TrBKVrKJFGrROV/eNtFM/MJ/bOfiXaNOpoRUojoALDAT
 0FTm83XkeA3IHEPjcOjVjo3v1abX72OdxGfp99j5IbxKZPTemP8feL868IAATNhMeBXp
 VxjA==
X-Gm-Message-State: APjAAAVuO3DZNalKsnN2dHpj0t1GcjMZAk7QcFduiMNFGupp30m1/oTW
 tzIuBUKGN2YHKvQoU6ifex8=
X-Google-Smtp-Source: APXvYqwiEqw+zhsMO4I0HAA1xC9pca42gaAf9Cxcb2MrA0/GJOZ6z1gRLca+ldF3glgqLn29G//SZQ==
X-Received: by 2002:a17:902:d688:: with SMTP id
 v8mr34300061ply.238.1580882250911; 
 Tue, 04 Feb 2020 21:57:30 -0800 (PST)
Received: from localhost.localdomain ([103.211.17.109])
 by smtp.googlemail.com with ESMTPSA id
 o29sm27152613pfp.124.2020.02.04.21.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 21:57:30 -0800 (PST)
From: Amol Grover <frextrite@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Ingo Molnar <mingo@redhat.com>
Date: Wed,  5 Feb 2020 11:27:02 +0530
Message-Id: <20200205055701.30195-1-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] tracing: Annotate
	ftrace_graph_notrace_hash pointer with __rcu
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
kernel/trace/ftrace.c:5667:29: error: incompatible types in comparison
kernel/trace/ftrace.c:5813:21: error: incompatible types in comparison
kernel/trace/ftrace.c:5868:36: error: incompatible types in comparison
kernel/trace/ftrace.c:5870:25: error: incompatible types in comparison

Use rcu_dereference_protected to dereference the newly annotated pointer.

Signed-off-by: Amol Grover <frextrite@gmail.com>
---
 kernel/trace/ftrace.c | 2 +-
 kernel/trace/trace.h  | 8 ++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 9bf1f2cd515e..3a310c0c3ae3 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -5597,7 +5597,7 @@ static const struct file_operations ftrace_notrace_fops = {
 static DEFINE_MUTEX(graph_lock);
 
 struct ftrace_hash *ftrace_graph_hash = EMPTY_HASH;
-struct ftrace_hash *ftrace_graph_notrace_hash = EMPTY_HASH;
+struct ftrace_hash __rcu *ftrace_graph_notrace_hash = EMPTY_HASH;
 
 enum graph_filter_type {
 	GRAPH_FILTER_NOTRACE	= 0,
diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
index 63bf60f79398..8c78bd6d53ca 100644
--- a/kernel/trace/trace.h
+++ b/kernel/trace/trace.h
@@ -951,7 +951,7 @@ extern void __trace_graph_return(struct trace_array *tr,
 
 #ifdef CONFIG_DYNAMIC_FTRACE
 extern struct ftrace_hash *ftrace_graph_hash;
-extern struct ftrace_hash *ftrace_graph_notrace_hash;
+extern struct ftrace_hash __rcu *ftrace_graph_notrace_hash;
 
 static inline int ftrace_graph_addr(struct ftrace_graph_ent *trace)
 {
@@ -1001,10 +1001,14 @@ static inline void ftrace_graph_addr_finish(struct ftrace_graph_ret *trace)
 static inline int ftrace_graph_notrace_addr(unsigned long addr)
 {
 	int ret = 0;
+	struct ftrace_hash *notrace_hash;
 
 	preempt_disable_notrace();
 
-	if (ftrace_lookup_ip(ftrace_graph_notrace_hash, addr))
+	notrace_hash = rcu_dereference_protected(ftrace_graph_notrace_hash,
+						 !preemptible());
+
+	if (ftrace_lookup_ip(notrace_hash, addr))
 		ret = 1;
 
 	preempt_enable_notrace();
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
