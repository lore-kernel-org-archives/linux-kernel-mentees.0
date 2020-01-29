Return-Path: <SRS0=ogxK=3S=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F081C2D0DB
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jan 2020 16:10:10 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A41D2070E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jan 2020 16:10:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eamuglrt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A41D2070E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0E59F84D81;
	Wed, 29 Jan 2020 16:10:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ucMeYp6O_NKM; Wed, 29 Jan 2020 16:10:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9AD1880EBF;
	Wed, 29 Jan 2020 16:10:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 86A0BC0881;
	Wed, 29 Jan 2020 16:10:09 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E436FC0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 16:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C7BA181A22
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 16:10:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k_Y1jpqzeHv5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 16:09:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C60E584559
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 16:09:11 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id j4so6749pgi.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 08:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+oq96d085fk9R1zembWjfCyukhjjIatlVof2J+sNPxs=;
 b=EamuglrtmZ9uGundx/IPRJmVpL0Y/3ThnGKOVz4Zqb8m1MOH+bYP3fPoP5u8oz49Pn
 1Ij0uVWlWzH+x4BHRgxbd/WvXmQvpf1139nKPgvcQwhptH7/kdEQp58OBYTmsNidNqu+
 t2BBYY5mNpfr1yt+vHtvAupk/RTbYduLBjxPdP3PIsc4rgg5R1XSPm2TAPcEGkAOASzE
 kY1PCIFULGkg/YJjrCq9QmJB8D/tSTQv/nAfwwkcDJjKNBiSDRAPmySG9yxlrYhEs4qd
 uM1e2ZNWjtHQ2PpOvWQBMcJKxfTO350EfYmBRbw1WpRyyTa+cta9B1bu6pubqqsmNGK6
 5oVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+oq96d085fk9R1zembWjfCyukhjjIatlVof2J+sNPxs=;
 b=DVoo+ZKJeWX/0eEhnIUTxqfNFH6usFoHDAn7DFG2QpgDtwPiuHW8/G+7yxXrna1cFO
 6i3j21utDC0l9Qv7Z74FwQJqxyWJQymY2TchWMA3Mh5+SKMrIKpjCIrjA6QEGC4XHozN
 REBNtvkTSDYalfuG5Hv4XU5iAs7r6KElDXnwn1HXaDgHTcK5VlH6jgdV2jkxycL7CxF1
 rJA2c2rDeWohAq8A3T5wbT+PffcPIvcTnM9m8pBz2Y8ihKT73kOooviSJmy6pDP8Qf+A
 bl2SbR5pccClig4VhUPeRgWdCjAIhR238yOKgpEOcakGzzK8VyOmDDp5epH7uciPau3i
 00Qg==
X-Gm-Message-State: APjAAAW4jIKB6NxY9tip5hreTjJrJcGFNx6/X+B6W9WKVem5HfH5HhFi
 jqBwEq8RZpK8Xni6ww0sS2I=
X-Google-Smtp-Source: APXvYqyhg/HldHGGdfEgHowy5IgtRURU9SafwhhUwsow9z2iqxxg52P1LutbN5nUIyb+3aqkQpZ/Eg==
X-Received: by 2002:a65:5809:: with SMTP id g9mr31259946pgr.146.1580314151330; 
 Wed, 29 Jan 2020 08:09:11 -0800 (PST)
Received: from localhost.localdomain ([146.196.37.139])
 by smtp.googlemail.com with ESMTPSA id 73sm3258801pgc.13.2020.01.29.08.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 08:09:10 -0800 (PST)
From: Amol Grover <frextrite@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>
Date: Wed, 29 Jan 2020 21:38:12 +0530
Message-Id: <20200129160813.14263-1-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 1/2] events: callchain: Annotate RCU
	pointer with __rcu
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

Signed-off-by: Amol Grover <frextrite@gmail.com>
---
 kernel/events/callchain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/events/callchain.c b/kernel/events/callchain.c
index c2b41a263166..f91e1f41d25d 100644
--- a/kernel/events/callchain.c
+++ b/kernel/events/callchain.c
@@ -32,7 +32,7 @@ static inline size_t perf_callchain_entry__sizeof(void)
 static DEFINE_PER_CPU(int, callchain_recursion[PERF_NR_CONTEXTS]);
 static atomic_t nr_callchain_events;
 static DEFINE_MUTEX(callchain_mutex);
-static struct callchain_cpus_entries *callchain_cpus_entries;
+static struct callchain_cpus_entries __rcu *callchain_cpus_entries;
 
 
 __weak void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
