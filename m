Return-Path: <SRS0=D8c5=34=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1832DC35250
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  8 Feb 2020 14:47:32 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E413A21741
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  8 Feb 2020 14:47:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xj7br3Cn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E413A21741
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BD9432035E;
	Sat,  8 Feb 2020 14:47:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FxZM0agKGnPI; Sat,  8 Feb 2020 14:47:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 055AD2040B;
	Sat,  8 Feb 2020 14:47:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 011ECC0178;
	Sat,  8 Feb 2020 14:47:31 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DC698C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  8 Feb 2020 14:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id CB25187994
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  8 Feb 2020 14:47:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4xYy-6fXbzwq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  8 Feb 2020 14:47:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1698085707
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  8 Feb 2020 14:47:28 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id j15so1384241pgm.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 08 Feb 2020 06:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bnds2NHqFSNWETn/RSq50/pXatc/ztN0cLMrVRUxkUU=;
 b=Xj7br3CnVPxHIhw8uOFA5f70SvXfdioQ2O93Aadvt9BvpCZRic7FVB32guF5lnBMS+
 CU9rUvQovegjrRi98LW1H7ntRM9b9NUxVgpnqyBsv91UMxKzf5qClcasOAR/qYydN81+
 O/lUtc0pFPnlvzImTPqrbWtdO0DpgkxfODSvqSiirLvOSoiHwKWwpdO4NZaNq1DWU2lW
 KFT6Xgeg1LdtCoMbsl+AkDmGVmL75Yp9pnhyObj5jAQWVV3g9dIUCsjHTqAzONw7hjSE
 zl/zIEGfnGPftdx3B/iOSzNYtBl2/7dSfqmDaPkE5e0anLvgeLCNyJ2JdZcAa5L/+m8a
 oPZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bnds2NHqFSNWETn/RSq50/pXatc/ztN0cLMrVRUxkUU=;
 b=mvhSri2CDYMZNrGjRQsVIlBJg3IKSJVqlvk7xSQd56EI07I3vCXm+L21HaeKvQDuOA
 jlwqjU1u/ZOEPZ8zVBvRiVVwJOBG0tPp+mmAgebRJnafsNTSXt/0hiSfgFO3w6U/TI6V
 M1F3czydEGhk1TSZD6s9zDINoygFbkI25mu5ZVVxruEhI+Thd4yIxv5Wf63zKA4cN26R
 PRZ8AgWUAl5O6FwrpV5YdqHKbcDbuWbzcKjOXZ373PFxKxzt+4vFL3cEC7STD+dCnhJi
 lktuTaPxb+hqHOKRZD0N2oAs5PjU4rv2c01wAR9612h802Qfkl0jCHuSwQD5Gz17fQav
 O9MA==
X-Gm-Message-State: APjAAAXpCHrw4atH/zvpIF6I9DpltqwIfStC3uprsEKMz7hyMs2I7eu7
 PiuMmimXQM1OJ2gkFOE0dH0=
X-Google-Smtp-Source: APXvYqy5IbKxoaPJD/HvfsAxaGYzvw1KtJ98ESXByWVCM6KLuM/SppRuSoOuizLrX4gcUIY0z9/NbQ==
X-Received: by 2002:aa7:87c5:: with SMTP id i5mr4569744pfo.114.1581173247433; 
 Sat, 08 Feb 2020 06:47:27 -0800 (PST)
Received: from localhost.localdomain ([146.196.37.145])
 by smtp.googlemail.com with ESMTPSA id k29sm7188817pfh.77.2020.02.08.06.47.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2020 06:47:27 -0800 (PST)
From: Amol Grover <frextrite@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>
Date: Sat,  8 Feb 2020 20:16:49 +0530
Message-Id: <20200208144648.18833-1-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] events: Annotate parent_ctx with
	__rcu
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

parent_ctx is used under RCU context in kernel/events/core.c,
tell sparse about it aswell.

Fixes the following instances of sparse error:
kernel/events/core.c:3221:18: error: incompatible types in comparison
kernel/events/core.c:3222:23: error: incompatible types in comparison

This introduces the following two sparse errors:
kernel/events/core.c:3117:18: error: incompatible types in comparison
kernel/events/core.c:3121:30: error: incompatible types in comparison

Hence, use rcu_dereference() to access parent_ctx and silence
the newly introduced errors.

Signed-off-by: Amol Grover <frextrite@gmail.com>
---
 include/linux/perf_event.h |  2 +-
 kernel/events/core.c       | 11 ++++++++---
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 6d4c22aee384..e18a7bdc6f98 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -810,7 +810,7 @@ struct perf_event_context {
 	 * These fields let us detect when two contexts have both
 	 * been cloned (inherited) from a common ancestor.
 	 */
-	struct perf_event_context	*parent_ctx;
+	struct perf_event_context __rcu	*parent_ctx;
 	u64				parent_gen;
 	u64				generation;
 	int				pin_count;
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 2173c23c25b4..2a8c5670b254 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -3106,26 +3106,31 @@ static void ctx_sched_out(struct perf_event_context *ctx,
 static int context_equiv(struct perf_event_context *ctx1,
 			 struct perf_event_context *ctx2)
 {
+	struct perf_event_context *parent_ctx1, *parent_ctx2;
+
 	lockdep_assert_held(&ctx1->lock);
 	lockdep_assert_held(&ctx2->lock);
 
+	parent_ctx1 = rcu_dereference(ctx1->parent_ctx);
+	parent_ctx2 = rcu_dereference(ctx2->parent_ctx);
+
 	/* Pinning disables the swap optimization */
 	if (ctx1->pin_count || ctx2->pin_count)
 		return 0;
 
 	/* If ctx1 is the parent of ctx2 */
-	if (ctx1 == ctx2->parent_ctx && ctx1->generation == ctx2->parent_gen)
+	if (ctx1 == parent_ctx2 && ctx1->generation == ctx2->parent_gen)
 		return 1;
 
 	/* If ctx2 is the parent of ctx1 */
-	if (ctx1->parent_ctx == ctx2 && ctx1->parent_gen == ctx2->generation)
+	if (parent_ctx1 == ctx2 && ctx1->parent_gen == ctx2->generation)
 		return 1;
 
 	/*
 	 * If ctx1 and ctx2 have the same parent; we flatten the parent
 	 * hierarchy, see perf_event_init_context().
 	 */
-	if (ctx1->parent_ctx && ctx1->parent_ctx == ctx2->parent_ctx &&
+	if (ctx1->parent_ctx && parent_ctx1 == parent_ctx2 &&
 			ctx1->parent_gen == ctx2->parent_gen)
 		return 1;
 
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
