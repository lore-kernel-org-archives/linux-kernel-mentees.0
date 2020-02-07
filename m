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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79E80C352A1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  7 Feb 2020 18:08:18 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56203227BF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  7 Feb 2020 18:08:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VlHMmU6I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56203227BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1B77986E00;
	Fri,  7 Feb 2020 18:08:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n+riadeQXIFY; Fri,  7 Feb 2020 18:08:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A6F4786DF3;
	Fri,  7 Feb 2020 18:08:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 96611C1796;
	Fri,  7 Feb 2020 18:08:17 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DAB63C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Feb 2020 18:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D707686DF4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Feb 2020 18:08:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SA3Yyt-88Y4f
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Feb 2020 18:08:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A1C0486DE2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Feb 2020 18:08:13 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id d9so43237plo.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 07 Feb 2020 10:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5zQQHlAdkKi/5/LHbljBLnmP/SWJe90/jtmz6ntc02A=;
 b=VlHMmU6I/xL2vd2EXJyZn/ypmR6KSTr1B4+IlMCX9nCDq0DE+2inkBhFKo67GNtamL
 DpvJG29b7TujDuTvONAjb6/SpatGl2GrrRZ6JsyvuO9CTrEKGXsmRt0jVSeqle/RbjSK
 zd+ZbybUkmsrYnybTPzXNp18CnEXZ38idwf5+RuV04DBCGSZNm7zGwt8GwuOKY5R2I92
 QPWAoEPwrHf8N+yGxnXXhhyy+9C3NCdDh1MgO0MSTu+bZAof26suReLMld0nlje0tIFF
 SH3nf1UfidaWVduztODzs4bYOv4P65oth5ukwHT+DpjVFe75oL9s/5KHOinB/4yz9AI4
 +gbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5zQQHlAdkKi/5/LHbljBLnmP/SWJe90/jtmz6ntc02A=;
 b=DG3Q9P/ZlqoUGQzY5U4GuS9uwaZvHcXt78GGRg4RmebhPUyD6Vl+ysgy8X27JEWFLO
 3XrQTUNfSSsmwTJrwxVODA0qAwU3pfY0T3JHXF0HGnHLGi5Ag3Xasaa2cbP1fxOKKegb
 B0aM0z2v+qwESmLvd+dmjl6/r5cJI97epNlvnOk0/2f/pAp1KY6PsBN+s8aq1FL/DS5O
 V0UkVrhXsFiwpyKgkEPT6hxq/j8Kbg/XJAuf85tUEwbWzdoEjaPaonuCpi+goTKe1GBU
 HSdY+Hd8n+yHnfPsVyYjn64ixZDMphX0KqK9Bx1jnGE4kFitVsV3Tz/Ktp5xpzpY9pfU
 VRNA==
X-Gm-Message-State: APjAAAXHWej0DrDLvsMQRMaRLOtO74DiRVx7Mg7LiJxbglT7JNLdH8UX
 deOTCoRLLzds8rSuJoXb/ks=
X-Google-Smtp-Source: APXvYqyEBPgz7pQYmv0XHHjqZAEVk/5ga6fBOfnavOBQradYIrMGl3pLWPJyoOOoQeOQEDoBAIeMEA==
X-Received: by 2002:a17:902:8a81:: with SMTP id
 p1mr10766574plo.284.1581098893117; 
 Fri, 07 Feb 2020 10:08:13 -0800 (PST)
Received: from localhost.localdomain ([103.211.17.120])
 by smtp.googlemail.com with ESMTPSA id gx18sm3088795pjb.8.2020.02.07.10.08.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 10:08:12 -0800 (PST)
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
Date: Fri,  7 Feb 2020 23:35:04 +0530
Message-Id: <20200207180504.4200-2-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200207180504.4200-1-frextrite@gmail.com>
References: <20200207180504.4200-1-frextrite@gmail.com>
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, linux-audit@redhat.com,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 2/3] cred: Do not use RCU primitives
	to access cred pointer
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

Since task_struct::cred can only be used task-synchronously,
and is not visible to other threads under RCU context,
we do not require RCU primitives to read/write to it and incur
heavy barriers.

Suggested-by: Jann Horn <jannh@google.com>
Co-developed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
Signed-off-by: Amol Grover <frextrite@gmail.com>
---
 include/linux/cred.h | 5 ++---
 kernel/cred.c        | 6 +++---
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/include/linux/cred.h b/include/linux/cred.h
index 18639c069263..5973791e5fe4 100644
--- a/include/linux/cred.h
+++ b/include/linux/cred.h
@@ -291,11 +291,10 @@ static inline void put_cred(const struct cred *_cred)
 /**
  * current_cred - Access the current task's subjective credentials
  *
- * Access the subjective credentials of the current task.  RCU-safe,
- * since nobody else can modify it.
+ * Access the subjective credentials of the current task.
  */
 #define current_cred() \
-	rcu_dereference_protected(current->cred, 1)
+	(current->cred)
 
 /**
  * current_real_cred - Access the current task's objective credentials
diff --git a/kernel/cred.c b/kernel/cred.c
index 809a985b1793..3956c31d068d 100644
--- a/kernel/cred.c
+++ b/kernel/cred.c
@@ -485,7 +485,7 @@ int commit_creds(struct cred *new)
 	if (new->user != old->user)
 		atomic_inc(&new->user->processes);
 	rcu_assign_pointer(task->real_cred, new);
-	rcu_assign_pointer(task->cred, new);
+	task->cred = new;
 	if (new->user != old->user)
 		atomic_dec(&old->user->processes);
 	alter_cred_subscribers(old, -2);
@@ -562,7 +562,7 @@ const struct cred *override_creds(const struct cred *new)
 	 */
 	get_new_cred((struct cred *)new);
 	alter_cred_subscribers(new, 1);
-	rcu_assign_pointer(current->cred, new);
+	current->cred = new;
 	alter_cred_subscribers(old, -1);
 
 	kdebug("override_creds() = %p{%d,%d}", old,
@@ -590,7 +590,7 @@ void revert_creds(const struct cred *old)
 	validate_creds(old);
 	validate_creds(override);
 	alter_cred_subscribers(old, 1);
-	rcu_assign_pointer(current->cred, old);
+	current->cred = old;
 	alter_cred_subscribers(override, -1);
 	put_cred(override);
 }
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
