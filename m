Return-Path: <SRS0=QmcU=5S=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BCC8C43331
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Apr 2020 05:57:35 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B8312078E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Apr 2020 05:57:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F5ZgPkj4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B8312078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1C67186C0E;
	Thu,  2 Apr 2020 05:57:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KPhrXaSfpo2s; Thu,  2 Apr 2020 05:57:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A1868868D8;
	Thu,  2 Apr 2020 05:57:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 90EA0C1AE2;
	Thu,  2 Apr 2020 05:57:34 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 00B01C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Apr 2020 05:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id EA8BD86C0E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Apr 2020 05:57:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Yvc1xmDW9rl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Apr 2020 05:57:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6E593868D8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Apr 2020 05:57:33 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id w9so1118118pjh.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 01 Apr 2020 22:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6dJnmRISnXhx/tid8L3bkFndKLLLawXzGhi1aYEmqBI=;
 b=F5ZgPkj4Jqb8jVfvdsxgqgz1JEo/1oI1a8uoJIAQA0lpNWQHcaE8671FBeypM6kX3E
 Dt2Vs0xHlYHGmQ8yuRM5u0mTovkVC35KiwjAZfihtabHL7dVwoUYBEe9WW4k/SUjsCFs
 dRRQL/gps9M5cE/BlrvUTtv8cJeWUwUo53YE3Z3r/n7QMlw59odA1tKMNrlMWSXK6ZTR
 ByY4qGARizvkaiTkQKjZYorE1SeoyEYKhPVCEMPxGo5R4YSnUW97n57U6H0RItQxNBga
 X9n5ayS/XEnySMr0+fxqtf7pACtsK5A1ad9y5KjvXkFlCFVBuCY+Vj867Hd4YWqJ8zT2
 qHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6dJnmRISnXhx/tid8L3bkFndKLLLawXzGhi1aYEmqBI=;
 b=fSELpu5OkjsXUCMKfFBnLReBQK1KWOrGuv0ERGf3z632yHYVtQBOUTt9djy0Z/aerd
 8zf2c1SBNnFizMTLAEnrO7wTsraL0X6yA0rvQwqxs45m6X9Xy9a8U7L9SiOk0u5A51Vl
 eU33AKqXDC2Ty3gcQSc8u9gjpqAhrsUXbgreOhYZ5CPHKoKkW8p+KPbR1FBCaUJLryuC
 //r5Mv82NzXufzr9wWKfIvzXTOiO5aw6ZzOvvgVC/xeLwLOaYw7DqwGF4p3nAzbYo46X
 1uYvQ85pHnPH9xD1Zhccx7PH61B+CmyHUfxW4IYvjeb5Jbj2n+u+MT2EHVvrVDjNYicq
 RmFw==
X-Gm-Message-State: AGi0PubwUwcrPt60rsDR6ETxa42uRJI52z469nnfL6SMXS+RI2310Mha
 ZytmumgRj2sgrPpQP7RPRUM=
X-Google-Smtp-Source: APiQypKKpM2RNoBega/Jw427Lig/OopGc2RCcaSq/EMKfefz7KImd2eIOeKFi0eJjpW3VBuddiq5SA==
X-Received: by 2002:a17:902:e788:: with SMTP id
 cp8mr1382631plb.343.1585807053025; 
 Wed, 01 Apr 2020 22:57:33 -0700 (PDT)
Received: from localhost.localdomain ([103.87.57.161])
 by smtp.googlemail.com with ESMTPSA id 207sm2776058pgg.19.2020.04.01.22.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2020 22:57:32 -0700 (PDT)
From: Amol Grover <frextrite@gmail.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, James Morris <jamorris@linux.microsoft.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>, Jann Horn <jannh@google.com>,
 David Howells <dhowells@redhat.com>, Shakeel Butt <shakeelb@google.com>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Paul Moore <paul@paul-moore.com>,Eric Paris <eparis@redhat.com>
Date: Thu,  2 Apr 2020 11:26:40 +0530
Message-Id: <20200402055640.6677-3-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200402055640.6677-1-frextrite@gmail.com>
References: <20200402055640.6677-1-frextrite@gmail.com>
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, linux-audit@redhat.com,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 3/3 RESEND] auditsc: Do not use RCU
	primitive to read from cred pointer
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

task_struct::cred is only used task-synchronously and does
not require any RCU locks, hence, rcu_dereference_check is
not required to read from it.

Suggested-by: Jann Horn <jannh@google.com>
Co-developed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
Signed-off-by: Amol Grover <frextrite@gmail.com>
---
 kernel/auditsc.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 4effe01ebbe2..d3510513cdd1 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -430,24 +430,19 @@ static int audit_field_compare(struct task_struct *tsk,
 /* Determine if any context name data matches a rule's watch data */
 /* Compare a task_struct with an audit_rule.  Return 1 on match, 0
  * otherwise.
- *
- * If task_creation is true, this is an explicit indication that we are
- * filtering a task rule at task creation time.  This and tsk == current are
- * the only situations where tsk->cred may be accessed without an rcu read lock.
  */
 static int audit_filter_rules(struct task_struct *tsk,
 			      struct audit_krule *rule,
 			      struct audit_context *ctx,
 			      struct audit_names *name,
-			      enum audit_state *state,
-			      bool task_creation)
+			      enum audit_state *state)
 {
 	const struct cred *cred;
 	int i, need_sid = 1;
 	u32 sid;
 	unsigned int sessionid;
 
-	cred = rcu_dereference_check(tsk->cred, tsk == current || task_creation);
+	cred = tsk->cred;
 
 	for (i = 0; i < rule->field_count; i++) {
 		struct audit_field *f = &rule->fields[i];
@@ -745,7 +740,7 @@ static enum audit_state audit_filter_task(struct task_struct *tsk, char **key)
 	rcu_read_lock();
 	list_for_each_entry_rcu(e, &audit_filter_list[AUDIT_FILTER_TASK], list) {
 		if (audit_filter_rules(tsk, &e->rule, NULL, NULL,
-				       &state, true)) {
+				       &state)) {
 			if (state == AUDIT_RECORD_CONTEXT)
 				*key = kstrdup(e->rule.filterkey, GFP_ATOMIC);
 			rcu_read_unlock();
@@ -791,7 +786,7 @@ static enum audit_state audit_filter_syscall(struct task_struct *tsk,
 	list_for_each_entry_rcu(e, list, list) {
 		if (audit_in_mask(&e->rule, ctx->major) &&
 		    audit_filter_rules(tsk, &e->rule, ctx, NULL,
-				       &state, false)) {
+				       &state)) {
 			rcu_read_unlock();
 			ctx->current_state = state;
 			return state;
@@ -815,7 +810,7 @@ static int audit_filter_inode_name(struct task_struct *tsk,
 
 	list_for_each_entry_rcu(e, list, list) {
 		if (audit_in_mask(&e->rule, ctx->major) &&
-		    audit_filter_rules(tsk, &e->rule, ctx, n, &state, false)) {
+		    audit_filter_rules(tsk, &e->rule, ctx, n, &state)) {
 			ctx->current_state = state;
 			return 1;
 		}
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
