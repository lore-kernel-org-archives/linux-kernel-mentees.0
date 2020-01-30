Return-Path: <SRS0=9uDz=3T=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D925C2D0DB
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jan 2020 14:23:20 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3482720707
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jan 2020 14:23:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R3LnSqcA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3482720707
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 035EB88409;
	Thu, 30 Jan 2020 14:23:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R-3efrt3Rb5m; Thu, 30 Jan 2020 14:23:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7E059882AC;
	Thu, 30 Jan 2020 14:23:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 649B4C1796;
	Thu, 30 Jan 2020 14:23:19 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D25E5C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jan 2020 14:23:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CEA028659E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jan 2020 14:23:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iMWYeLPrZQjQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jan 2020 14:23:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7D7D286599
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jan 2020 14:23:16 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 4so1565565pfz.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jan 2020 06:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6T7BA/VeHSTmsgbu5fmQVa4i4NpuWX85GL9aH8ZEE74=;
 b=R3LnSqcAeDVQOAHlpG1owMpEpBN/wKJXlNPE4yy2OJftYy+o1XFdg2UvFuYOcApUCs
 wzj6xHPsgPqTmDBIZ31a33yVDP95XBf9aS8RiBaegWDx0USmHQD2N6xncypmbbIL/V7S
 pAZF1CnqdBCMYawpCCBIulwl5/aQ0566iMvNDUqD0+AwGHu/QG8wdXxZQtTPEX4MvPUC
 TJsILeo5ZsI7D1qb7HpdCPLQbJX37Lnr/P/obM2hE2jPsiRiv9YkcHI+EORU2tzzekTd
 lusGAtCSo5AWjvSe9SLGDRS1HbgWyDPTbTnruPvJ3wy/CXxvixVGmJ+tpuY6OacDhaFS
 i1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6T7BA/VeHSTmsgbu5fmQVa4i4NpuWX85GL9aH8ZEE74=;
 b=PR4eYpaJJ3c5s9oVxKbzu4UTDKEnd8Wg5uuE8bCdtAY6A3Sf3y2n+tu5aDrgIXL1SE
 XqSqj5rJAjmvjI76lBI7UA1YPVDQSrYzUV7P7dwB2PsigLLeSYz1ys1UQXjSy86xBfHz
 QQ1oER30a3fyM62WmaxSQKnEVlF7OjoNpPCM7+sNZMpFp7PCg4z0mNEtVbHeXnGPKZ8h
 g73OCNypPhF9+hrzyofU5TK6eEGipjVzs5RMgo0yp02qyPwpnSEucqYkPUWMuTJlFfxL
 v5vvdnPYGVv9ne8DiVUb27B5WIt2hrXBEw+Yqvti/WoOQYDADutJTrqAea8a3C1AeJ0K
 ekRg==
X-Gm-Message-State: APjAAAVK1QJ0WCOiBuObvpgH31dj5gC4F7WhWt1+tOOsIdSxkW/Ry8i4
 NRgUfSMJHEwuuyd+DyzqPPY=
X-Google-Smtp-Source: APXvYqyd+aww2fw9g4HcNT4GjoA8fFMGIE5pWD4/IgsGGZeCK+OdvzCgNlecdkjgsjA9wLillvUIvA==
X-Received: by 2002:aa7:874b:: with SMTP id g11mr5469169pfo.225.1580394195955; 
 Thu, 30 Jan 2020 06:23:15 -0800 (PST)
Received: from localhost.localdomain ([103.211.17.117])
 by smtp.googlemail.com with ESMTPSA id m71sm9840602pje.0.2020.01.30.06.23.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2020 06:23:15 -0800 (PST)
From: Amol Grover <frextrite@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>
Date: Thu, 30 Jan 2020 19:48:19 +0530
Message-Id: <20200130141818.18391-1-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2] callchain: Annotate RCU pointer
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Fixes following instances of sparse error
error: incompatible types in comparison expression
(different address spaces)
kernel/events/callchain.c:66:9: error: incompatible types in comparison
kernel/events/callchain.c:96:9: error: incompatible types in comparison
kernel/events/callchain.c:161:19: error: incompatible types in comparison

This introduces the following warning
kernel/events/callchain.c:65:17: warning: incorrect type in assignment
which is fixed as below

callchain_cpus_entries is annotated as an RCU pointer.
Hence rcu_dereference_protected or similar RCU API is
required to dereference the pointer.

Signed-off-by: Amol Grover <frextrite@gmail.com>
---
v2:
- Squash both the commits into a single one.

 kernel/events/callchain.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/kernel/events/callchain.c b/kernel/events/callchain.c
index c2b41a263166..a672d02a1b3a 100644
--- a/kernel/events/callchain.c
+++ b/kernel/events/callchain.c
@@ -32,7 +32,7 @@ static inline size_t perf_callchain_entry__sizeof(void)
 static DEFINE_PER_CPU(int, callchain_recursion[PERF_NR_CONTEXTS]);
 static atomic_t nr_callchain_events;
 static DEFINE_MUTEX(callchain_mutex);
-static struct callchain_cpus_entries *callchain_cpus_entries;
+static struct callchain_cpus_entries __rcu *callchain_cpus_entries;
 
 
 __weak void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
@@ -62,7 +62,8 @@ static void release_callchain_buffers(void)
 {
 	struct callchain_cpus_entries *entries;
 
-	entries = callchain_cpus_entries;
+	entries = rcu_dereference_protected(callchain_cpus_entries,
+					    lockdep_is_held(&callchain_mutex));
 	RCU_INIT_POINTER(callchain_cpus_entries, NULL);
 	call_rcu(&entries->rcu_head, release_callchain_buffers_rcu);
 }
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
