Return-Path: <SRS0=sPDn=3N=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02AD7C2D0CE
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Jan 2020 04:59:32 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF58A2072C
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Jan 2020 04:59:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LgS4/gVS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF58A2072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 88E1F875EA;
	Fri, 24 Jan 2020 04:59:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4AAJdKXRT6aA; Fri, 24 Jan 2020 04:59:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 80B1586C11;
	Fri, 24 Jan 2020 04:59:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 76898C0176;
	Fri, 24 Jan 2020 04:59:30 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 430FAC0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jan 2020 04:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2AAB48851E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jan 2020 04:59:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3kgNqWFCFYdC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jan 2020 04:59:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id AF2B48852A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jan 2020 04:59:28 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 2so489504pfg.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 20:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=oOSQMwxHrwpswTLtDsPfKJzl+DtBJm84K0zAoJhjCSc=;
 b=LgS4/gVSwk+VUuIpn31qywoCF6O/vIt9PEnG13y9vr0YNNMriFnwVVpWKaztD/TO2w
 HAVvQjQU+mqiW0wF24cqZSOd7H81NKnP7ukMolSGgWZ9gzALpzXmOiBAQDp3wK+cpLx5
 HYFGAyXibXCeUdFp1ILPs3oHyynj9I52glMPJ/L4Cr8J3QSJEQVyfgBhiPoe5Q071jNi
 5+A2y2Bn7SARBRQpM/cCFo6AlBVbi1mTWZIbWcCUDIvbuCmtwt3FE5eoFzWF/8lQ9s9H
 xV/R2Rx5R9ZD7tRoCbRBGvAf5qq289qt2nurAZL7S8EKrsq5CX6miuQihItnmc/mDIJH
 HB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=oOSQMwxHrwpswTLtDsPfKJzl+DtBJm84K0zAoJhjCSc=;
 b=oSxgPW/4DYS96fu++cev/jUK/+/YoI0jPyKZngQlX23tIjOh26ntzIf8br0PkFBiA9
 +KIrW9urbJb0u5hNcKU9UjjgA2lJc1djo2GUjv1qYVjbjg0BI+A9S2zY4A3spXpy6IQl
 XQB7XU6iJozG6CnX15ahPbNklKeRrvzb+EyU1OGuRwV9kndYAEUy1KOT+FO9nbVWIufG
 UQogVGsl54KMv6Xb81mUrXfuzUxHBIEuz1LCW3uj6uXaLNebqrKkeTl+5cj5lCAlWHUK
 3GfTiGXXgaShisM6CvYLxgOUw2jbIEJJ+ZpV+TZlSILqzgA5ponJrLuhFwwS/e4jY2CE
 yCyQ==
X-Gm-Message-State: APjAAAUm9YfvMVFiKM8c3aWFcUwlKIRdgoYIMdeNEHH8yTnN+iq1iMnl
 mg5ae3L0X2RPKoeBAQ/otw==
X-Google-Smtp-Source: APXvYqzZmm/J/2bN7SPdZkjqtyzQWQPFVFUb3O9enD9Larc5uGqsZiP5cy3GcbEniXFpRsttYfbCbQ==
X-Received: by 2002:a65:4c82:: with SMTP id m2mr2003067pgt.432.1579841968170; 
 Thu, 23 Jan 2020 20:59:28 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:1ee5:e37b:209c:91b0:b68a:515f])
 by smtp.gmail.com with ESMTPSA id m22sm4949610pgn.8.2020.01.23.20.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2020 20:59:27 -0800 (PST)
From: madhuparnabhowmik10@gmail.com
To: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, ebiederm@xmission.com,
 christian.brauner@ubuntu.com, oleg@redhat.com, paulmck@kernel.org
Date: Fri, 24 Jan 2020 10:29:08 +0530
Message-Id: <20200124045908.26389-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] sched.h: Annotate sighand_struct
	with __rcu
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>

This patch fixes the following sparse errors by annotating the
sighand_struct with __rcu

kernel/fork.c:1511:9: error: incompatible types in comparison expression
kernel/exit.c:100:19: error: incompatible types in comparison expression
kernel/signal.c:1370:27: error: incompatible types in comparison expression

This fix introduces the following sparse error in signal.c due to
checking the sighand pointer without rcu primitives:

kernel/signal.c:1386:21: error: incompatible types in comparison expression

This new sparse error is also fixed in this patch.

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
---
 include/linux/sched.h | 2 +-
 kernel/signal.c       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index b511e178a89f..7a351360ad54 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -918,7 +918,7 @@ struct task_struct {
 
 	/* Signal handlers: */
 	struct signal_struct		*signal;
-	struct sighand_struct		*sighand;
+	struct sighand_struct __rcu		*sighand;
 	sigset_t			blocked;
 	sigset_t			real_blocked;
 	/* Restored if set_restore_sigmask() was used: */
diff --git a/kernel/signal.c b/kernel/signal.c
index bcd46f547db3..9ad8dea93dbb 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -1383,7 +1383,7 @@ struct sighand_struct *__lock_task_sighand(struct task_struct *tsk,
 		 * must see ->sighand == NULL.
 		 */
 		spin_lock_irqsave(&sighand->siglock, *flags);
-		if (likely(sighand == tsk->sighand))
+		if (likely(sighand == rcu_access_pointer(tsk->sighand)))
 			break;
 		spin_unlock_irqrestore(&sighand->siglock, *flags);
 	}
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
