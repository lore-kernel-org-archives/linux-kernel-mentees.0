Return-Path: <SRS0=QXRK=33=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D26D0C35250
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  7 Feb 2020 18:08:22 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD008217BA
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  7 Feb 2020 18:08:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q66upDkh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD008217BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6998387D33;
	Fri,  7 Feb 2020 18:08:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MXL8-MAwMIiT; Fri,  7 Feb 2020 18:08:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C3B9285AA2;
	Fri,  7 Feb 2020 18:08:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C09D0C1796;
	Fri,  7 Feb 2020 18:08:21 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3AB2DC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Feb 2020 18:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1FD4187D33
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Feb 2020 18:08:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BhAJ48qV1DcW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Feb 2020 18:08:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B60D385AA2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Feb 2020 18:08:18 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id n96so1226757pjc.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 07 Feb 2020 10:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6dJnmRISnXhx/tid8L3bkFndKLLLawXzGhi1aYEmqBI=;
 b=q66upDkhWWqCv7RN3g0JjmwCJmoQSdSo46/A9eK5grTxsRkeNIeWBTqyrXbechcCCT
 ofFauNOWxK/BySUuN53q5didySxl8kkTrfKFPJmt0m3F8dS7N2YHHf5BWcXN5kp3PgAG
 qaDYsmYc1TVijYr/tfnXGm9DeRVGo3lzeIrWj/zmEZA4wF606Kdk+NKGY7UHxpkwJ2Vx
 2f0IgA01hxIWl1aSf3g7w89o6LflVQIf9D4xhGe3Zu8bOc2Xf4ZGG3L96/pKGrSRJe5N
 DVQmkJDxxxkO1CPxMOVmKk7UBVgXyT5+5QjZ40441Jl0ZxBH2q3HV13H7VfKcSWSh+jT
 RfcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6dJnmRISnXhx/tid8L3bkFndKLLLawXzGhi1aYEmqBI=;
 b=IPvXYzDTN+wsW0C+drw37fgsuLQ8sh51IbQJ85UsYm3JyEln9CxFfygLyvSwwCer8J
 HoVj9zjOzgdkPx9C0s75lz12N3/vIKX5LbcEuoM/hu5pdYXLkhMPwXX/SLy0MgqxKARy
 OXOqwIvwRdg9SsW6iviHyNkbTIos7cgdIMHPdoV1x3rPepFIqjOm3qrKhQOdn8FZbL4O
 rS4R75LPxDvZU8jHxqjsQo03+r/Cv5HjQ+QJWnPapOpT9v4hy+WfOotV6jpUIhZfYTPp
 +wON8SCFJsr3h0f3El+kTBTBbf0NwI+ldIJhNhGIqxNWqw/HgMNvuS7oXwJSTWFbrAIE
 e1KA==
X-Gm-Message-State: APjAAAXE9hECNJ75eYf6DP6TBkzOeA6Olu6llFDQqe0Blp2p6zo/8G3e
 jj7CdyB0pG+g/xF3VgkRruM=
X-Google-Smtp-Source: APXvYqym2YQSzc5+DaUKX0EDmz+UD0MoeyQVJEc9evlzGvMkuEWZiJSglWMQzb2WBkKyVuAow9dRtw==
X-Received: by 2002:a17:902:a616:: with SMTP id
 u22mr10769740plq.173.1581098898305; 
 Fri, 07 Feb 2020 10:08:18 -0800 (PST)
Received: from localhost.localdomain ([103.211.17.120])
 by smtp.googlemail.com with ESMTPSA id gx18sm3088795pjb.8.2020.02.07.10.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 10:08:17 -0800 (PST)
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
Date: Fri,  7 Feb 2020 23:35:05 +0530
Message-Id: <20200207180504.4200-3-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200207180504.4200-1-frextrite@gmail.com>
References: <20200207180504.4200-1-frextrite@gmail.com>
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, linux-audit@redhat.com,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 3/3] auditsc: Do not use RCU
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
