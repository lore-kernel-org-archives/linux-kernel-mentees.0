Return-Path: <SRS0=D8c5=34=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 734EFC352A1
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  8 Feb 2020 14:46:29 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F9B221741
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  8 Feb 2020 14:46:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="u0Er+8CL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F9B221741
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 145AF8651F;
	Sat,  8 Feb 2020 14:46:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qvmk8bEr7lDC; Sat,  8 Feb 2020 14:46:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AE3AD860E1;
	Sat,  8 Feb 2020 14:46:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A6732C0178;
	Sat,  8 Feb 2020 14:46:28 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 381F6C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  8 Feb 2020 14:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2604487E23
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  8 Feb 2020 14:46:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wHu+6J4ByLqe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  8 Feb 2020 14:46:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CD55D877E9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  8 Feb 2020 14:46:25 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id f2so1958523pjq.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 08 Feb 2020 06:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=umKYkZ+n1hghb0Jr4hdnB/RVp/UqOXWLvmLyfjg6Ugw=;
 b=u0Er+8CLUzoLx1hW2cmiqFqvmrAiNsVQbwOI9477K3oZVp5LbUl3zEcES5biwTiRMt
 Cdig9edK6EUn2HOv18tQS1FslaP/XD/Xq1VlYLaOkoHzprGxCE2bJyIbrlcaLxxomzuC
 hkSJ51ehrfIMbrExu/ZasJ908ZuPnYGGOLE0A4B81PQ2ONXxl63+qEk5DoGrv/Lho9B0
 HAcYDmW6xSgKXrJ2UulT/JQKahpQGI+TGXkfj1QWg5zI5BxnNa5TZkqtgejRnpYFUYls
 r+m5Q0Q+EVweJplXvOJ3Kph/gxj7TF3ZMoX106lyFCo2zX660nPCifoSNw+JVMlcRqQL
 yQ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=umKYkZ+n1hghb0Jr4hdnB/RVp/UqOXWLvmLyfjg6Ugw=;
 b=alBtvAcXCYDcBcMzf1CwIpqMfo69VOkftuelaryoL9Ulv2l/rDbEwfLTfQ7aj1stds
 HPQoNQ5+Nw0zdPVTkn3LGzMUZQqDQ+X3gw8HfeKcc2aReeh7dV4obfUBoetbTSEx624V
 TCXHP6iWDykbeNw3s4WJoqiGt6uVs5xCMquXpbHQjYK+R0EN2GAbVYDyScImdUV4P3n/
 zitGyOojoCldp9fAf1ABYaLSfR0g+vSA1tt6217VfeHzzARISYFvjPEB0PACduqEwzQ3
 jJaxwT6BbtNSeX9Ij4kr/WxcFn7FvqWrP0AVwpRNEhwCn1Kyr1ABGe1mC5oBqQjPT2qh
 RUOg==
X-Gm-Message-State: APjAAAUDzVuaY/NuRXFlJYoasrjlMefkVCtcQXr0NOJ06VxRFHIpx+F1
 VB5kATGyRT6M/nC7L8uXv+k=
X-Google-Smtp-Source: APXvYqx/IS2payZIY8op7Vby44AcisLhlL44sRCs5E5PXAo5D+NnApmONveTPEDK1ROMBceD0aF7Lg==
X-Received: by 2002:a17:90a:c301:: with SMTP id
 g1mr10355574pjt.88.1581173185375; 
 Sat, 08 Feb 2020 06:46:25 -0800 (PST)
Received: from localhost.localdomain ([146.196.37.145])
 by smtp.googlemail.com with ESMTPSA id p24sm6750353pff.69.2020.02.08.06.46.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2020 06:46:24 -0800 (PST)
From: Amol Grover <frextrite@gmail.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>
Date: Sat,  8 Feb 2020 20:15:51 +0530
Message-Id: <20200208144550.18486-1-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] sched: Annotate perf_event_ctxp with
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

perf_event_ctxp is used in RCU context in kernel/events/core.c,
tell sparse about it as well.

Fix the following instances of sparse error:
kernel/events/core.c:1384:15: error: incompatible types in comparison
kernel/events/core.c:1397:28: error: incompatible types in comparison
kernel/events/core.c:3264:25: error: incompatible types in comparison
kernel/events/core.c:3265:25: error: incompatible types in comparison
kernel/events/core.c:4340:25: error: incompatible types in comparison
kernel/events/core.c:7091:23: error: incompatible types in comparison
kernel/events/core.c:7870:23: error: incompatible types in comparison
kernel/events/core.c:8971:23: error: incompatible types in comparison
kernel/events/core.c:11865:9: error: incompatible types in comparison
kernel/events/core.c:11975:17: error: incompatible types in comparison

Signed-off-by: Amol Grover <frextrite@gmail.com>
---
 include/linux/sched.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 716ad1d8d95e..5df1778cfdf4 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1063,7 +1063,7 @@ struct task_struct {
 	unsigned int			futex_state;
 #endif
 #ifdef CONFIG_PERF_EVENTS
-	struct perf_event_context	*perf_event_ctxp[perf_nr_task_contexts];
+	struct perf_event_context __rcu	*perf_event_ctxp[perf_nr_task_contexts];
 	struct mutex			perf_event_mutex;
 	struct list_head		perf_event_list;
 #endif
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
