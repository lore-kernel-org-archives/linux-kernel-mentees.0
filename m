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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92065C35240
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jan 2020 16:10:10 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6844D2071E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jan 2020 16:10:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c7W8xJl3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6844D2071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 44B4921552;
	Wed, 29 Jan 2020 16:10:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SdjDOsUZdXHP; Wed, 29 Jan 2020 16:10:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6B1A1203EE;
	Wed, 29 Jan 2020 16:10:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5154DC0881;
	Wed, 29 Jan 2020 16:10:09 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D1D45C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 16:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5933D82D57
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 16:09:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BQYdF4MJwNy8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 16:09:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 49BAB85F5A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 16:09:16 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id c23so110899plz.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 08:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2w+XND7PBGeesb5X+LaSnTAVC7q/SmsQ7bhG7hGGu3k=;
 b=c7W8xJl31owTz1Yx+RJ0t0lJeWMHmojPOvI9FTa0hToQ9rjk61F9cJpECaP8EbV9jV
 WRZWrG5hZ7ErbuZZDvb4Z2ar70aqpQH+u6FO0iuWYBi7MWWnFPiRRLuaAnpssV+DyGNN
 MisbUq3yuk+p3LM/1fKZ+8GjZEWkz7BLcGV8HFs/oPmu3w8rA+kTmif0eg8BeaZU0AuK
 cEO1sVF3TrYI7hjmzlHWu4qdxcwtEn6XUo4TH+0B33NSGwu2HBe9wer6Pfz1830NTLdq
 erOkBytkQCIlCU8kECVoDaG7m+JHQrcGcj1Tgu21IsrQnesl0MMlbNHzSs20osvTKgHn
 Ahqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2w+XND7PBGeesb5X+LaSnTAVC7q/SmsQ7bhG7hGGu3k=;
 b=LHFrUP/FQKkHO/zKWjOnAnqRxUUYfT1z40mG3Az+SOks/y5WNCN7e8XCx7VWphK31J
 rMEdSfdYF2D5kmhWdc+7u5ZMLRMp8CKlS1D1ttXVIBqRXk4Q/4kzAoPlf+MlpGhKGXL0
 GHRRVVKlKioHx/TU6ws2yGH0zjtP4HvHST6PUynuhSsZ3KsO0yum3WZbunKynMtrn73h
 wRQVziYTXc1h5ccewZZ+nbrKVDhmFa54YjVdMKamzQWUEhm6n2UhcHR/NipEUNCQbaeX
 5csDkv2k1Ek0HK7LqdvZCn7wwbUrcm6P6cLL3vMGIT87bgm8EklSiFEbBxTm1L1GdxiZ
 xqGw==
X-Gm-Message-State: APjAAAVzLV2o+iEsNYTTLYml1RkbekPE6QEq3QiyNAdxtDWg0qDs3Ve6
 P3b4G6xlWctREpvGxn9g814=
X-Google-Smtp-Source: APXvYqyecajgm+oWpK3P0WbUAVW3ldWDqy8/QBKpagphreZeSIqivw+c88aMbpIHn528OveKK7/n2g==
X-Received: by 2002:a17:90a:9f04:: with SMTP id n4mr363732pjp.76.1580314155804; 
 Wed, 29 Jan 2020 08:09:15 -0800 (PST)
Received: from localhost.localdomain ([146.196.37.139])
 by smtp.googlemail.com with ESMTPSA id 73sm3258801pgc.13.2020.01.29.08.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 08:09:15 -0800 (PST)
From: Amol Grover <frextrite@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>
Date: Wed, 29 Jan 2020 21:38:13 +0530
Message-Id: <20200129160813.14263-2-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200129160813.14263-1-frextrite@gmail.com>
References: <20200129160813.14263-1-frextrite@gmail.com>
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 2/2] events: callchain: Use RCU API
	to access RCU pointer
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

callchain_cpus_entries is annotated as an RCU pointer.
Hence rcu_dereference_protected or similar RCU API is
required to dereference the pointer.

This fixes the following sparse warning
kernel/events/callchain.c:65:17: warning: incorrect type in assignment

Signed-off-by: Amol Grover <frextrite@gmail.com>
---
 kernel/events/callchain.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/events/callchain.c b/kernel/events/callchain.c
index f91e1f41d25d..a672d02a1b3a 100644
--- a/kernel/events/callchain.c
+++ b/kernel/events/callchain.c
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
