Return-Path: <SRS0=QXRK=33=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7328C2BA83
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  7 Feb 2020 18:08:11 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EFB920726
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  7 Feb 2020 18:08:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZFLV0Uw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EFB920726
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4D39B2048A;
	Fri,  7 Feb 2020 18:08:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4WYnSEujr0t3; Fri,  7 Feb 2020 18:08:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9951120131;
	Fri,  7 Feb 2020 18:08:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7FFF9C1796;
	Fri,  7 Feb 2020 18:08:10 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7A4B8C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Feb 2020 18:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 579E42048A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Feb 2020 18:08:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F1K19vEqITNA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Feb 2020 18:08:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 7F8B120131
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Feb 2020 18:08:08 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id j15so162997pgm.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 07 Feb 2020 10:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0v8qFG+lakbNwCs1dTA5aCEVT1bp7ahYq6NmZeNOrGQ=;
 b=YZFLV0Uw3aGkA8Di8/+VdoaniHd8W36VUerYnREvcVaDz4ZrjpBC4fp7llzYwLLqjE
 /dh336xBMloCOnEejmmoYQAr0i95xSJlW4+cMn/Rnw8K9BM4eSB+8E0tAcdHodTR5X6p
 e2x/gsyjUYhqYvdt+wKzZHifjOXU37OXwd0HShElOPyGhZhRlycYXLRVoKCDxy6Cobd/
 MgawCZ3tNO5lRvO0ZFjRWNxUisGE57LqlAtmsYlV+6bveBq2YnCqRIo48IEw6M30/cZ/
 9bi/LcSXSpWVhq2qIL43638VAiF0MCaPG3Ms98jKGeMtEzVepZwziTrhIAoyrFHjTCEj
 blWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0v8qFG+lakbNwCs1dTA5aCEVT1bp7ahYq6NmZeNOrGQ=;
 b=fZxzVAA+XOO/cE48CwigNXo7d7h+KykS+hRYiCNosuuq69yfW/4sLD84hCkHkF2uub
 JsIl4ZsbQ4mSjkhtsEygetDIUDXpiSMl/U9QOSB8eR1enojZdGynsTWaylFzpqI9ZRFL
 mswoqldJOhvbQBTgg2JZWbCw3ey1kUAf6ONtfRX9RRR2urpJUeN7/tyMvlDGw7Azdxda
 jR8vdVCxxBQxJkQZfFU3iv2CzyaEYBf1x0X70TN0SzVui/NUo7CWD/S3AT0yJE7gtpb5
 Fwrjuc9nhi51PpZZOX4uoX19btt20+lZNhKLQ3LmVqgTAUv0qyeeE3YREBL9MHdnBHwq
 Suow==
X-Gm-Message-State: APjAAAV1t9ZEV0Ae51TuLn8BKl3cHhtIMVXLU7tUIkFPsVn1Rp0KJSgv
 Yf/UHVrB4SMEau1uIqWP4ws=
X-Google-Smtp-Source: APXvYqzaBM/+hmIPNy9bRy1dcY11rU8mCOKoOMHz1OaRc6/wqt8f9BoesHM+STBvRwQHi4+d72LfiQ==
X-Received: by 2002:aa7:979a:: with SMTP id o26mr105769pfp.257.1581098888027; 
 Fri, 07 Feb 2020 10:08:08 -0800 (PST)
Received: from localhost.localdomain ([103.211.17.120])
 by smtp.googlemail.com with ESMTPSA id gx18sm3088795pjb.8.2020.02.07.10.08.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 10:08:07 -0800 (PST)
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
Date: Fri,  7 Feb 2020 23:35:03 +0530
Message-Id: <20200207180504.4200-1-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, linux-audit@redhat.com,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 1/3] sched: Remove __rcu annotation
	from cred pointer
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

task_struct::cred (subjective credentials) is *always* used
task-synchronously, hence, does not require RCU semantics.

task_struct::real_cred (objective credentials) can be used in
RCU context and its __rcu annotation is retained.

However, task_struct::cred and task_struct::real_cred *may*
point to the same object, hence, the object pointed to by
task_struct::cred *may* have RCU delayed freeing.

Suggested-by: Jann Horn <jannh@google.com>
Co-developed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
Signed-off-by: Amol Grover <frextrite@gmail.com>
---
 include/linux/sched.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 716ad1d8d95e..39924e6e0cf2 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -879,8 +879,11 @@ struct task_struct {
 	/* Objective and real subjective task credentials (COW): */
 	const struct cred __rcu		*real_cred;
 
-	/* Effective (overridable) subjective task credentials (COW): */
-	const struct cred __rcu		*cred;
+	/*
+	 * Effective (overridable) subjective task credentials (COW)
+	 * which is used task-synchronously
+	 */
+	const struct cred		*cred;
 
 #ifdef CONFIG_KEYS
 	/* Cached requested key. */
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
