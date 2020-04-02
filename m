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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B72CC2D0E9
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Apr 2020 05:57:16 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E198206D3
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Apr 2020 05:57:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G7uZ1Wcv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E198206D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DF88887E46;
	Thu,  2 Apr 2020 05:57:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nfYu2Cn34Si5; Thu,  2 Apr 2020 05:57:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4DDD587E09;
	Thu,  2 Apr 2020 05:57:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 43262C1AE2;
	Thu,  2 Apr 2020 05:57:15 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 831F4C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Apr 2020 05:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7A18486E92
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Apr 2020 05:57:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6MK9SDRxeUF6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Apr 2020 05:57:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3C95285E5C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Apr 2020 05:57:12 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id c12so948293plz.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 01 Apr 2020 22:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0v8qFG+lakbNwCs1dTA5aCEVT1bp7ahYq6NmZeNOrGQ=;
 b=G7uZ1WcvWQXQhE89TjGanF83SSBtnYTzfsKrsZMSO99kV3o0lqB4hLjVXUJgPIlEKN
 MMVBXIwdagq4gBOwV1UYGru2LrNs1b2VXa5vu5r3MzNYwBfTIJ8ITowd1B36Go8wrBru
 DRTpy/WThWpv9D+uoEjemiAT3xmnzkOOv9JPYZxXQn4x2ogiXP+LkuHhR0IsefzV1Lw8
 S06y5Yq7W8YqatW+5AjcTHL3m2WsvWt6kCHqhgRN7d3t4XxGV/DEIKS2TpRbRb9glSzl
 5Mmy6E9a3tylkrg9wUbIO9IWA16tWCpLmACemp8pmWBs5Sw9SKKy1cWB+OIsx6lZogXv
 ECug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0v8qFG+lakbNwCs1dTA5aCEVT1bp7ahYq6NmZeNOrGQ=;
 b=F3/W6GTN+y9wgxQ/+XQZrnP2GWyZFcSPajuGeOF5iOBJZxOLmi8C2WzX53hi/m97Wj
 2mWfV9NGSx7ua4FWekmasyhqZQZ7E8lpSE4Jjx8WytgLlcEWex3/7kPmguLdwduSP4sl
 +PEL3aQYo4DO/pz+V274RZiGnNB+ymz6JBhwrmWlfRl7Sf1GkBYneaVKgs504jfklMD+
 gcU/MBCuF1UdZepuuYRmqZ3AGu3UCfHmETsHpSHislu+qP5LBQZsf17AgNZV1yknwa0s
 qQdG0TvO7p/u36yj+Sx1Fq/NLkru8HVh5Bxvrc7RzK0gigMjL79c6Cl55ghU52lIYQjI
 YdBQ==
X-Gm-Message-State: AGi0PuYNzxjSZHG0P7Sgjg+2QLEifFlOGCWmWejP0Bb1eq7dJpwBTMQv
 1EliQzGk7ugsFHn3iSnYV7Y=
X-Google-Smtp-Source: APiQypLJsNATH03qXt80StDeQlmOxYsyjU6euM+h1RDJeAOmpFoPbaurqtKpPF1ZmeSswUcufB1swQ==
X-Received: by 2002:a17:90a:fe18:: with SMTP id
 ck24mr2037363pjb.57.1585807031699; 
 Wed, 01 Apr 2020 22:57:11 -0700 (PDT)
Received: from localhost.localdomain ([103.87.57.161])
 by smtp.googlemail.com with ESMTPSA id 207sm2776058pgg.19.2020.04.01.22.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2020 22:57:11 -0700 (PDT)
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
Date: Thu,  2 Apr 2020 11:26:38 +0530
Message-Id: <20200402055640.6677-1-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, linux-audit@redhat.com,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 1/3 RESEND] sched: Remove __rcu
	annotation from cred pointer
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
