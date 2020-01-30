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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F3E2C2D0DB
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jan 2020 14:47:54 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33948214DB
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jan 2020 14:47:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dTYRlrP1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33948214DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 06221882E7;
	Thu, 30 Jan 2020 14:47:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NRYC-oTK5s4h; Thu, 30 Jan 2020 14:47:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A5A0B87E81;
	Thu, 30 Jan 2020 14:47:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 94236C1796;
	Thu, 30 Jan 2020 14:47:53 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0AF2FC0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jan 2020 14:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id EE5A687849
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jan 2020 14:47:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yc+mIll3Ws6O
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jan 2020 14:47:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9481187846
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jan 2020 14:47:51 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id p11so1429004plq.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jan 2020 06:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=8j7vPXQ8NnTfCALzCvlEWGGchYaunD8ZmjFF9OfryBo=;
 b=dTYRlrP1Sg5/xLx73QGqX7OvqDFxXjeAQpEcGzWdvNok45gR/uNcMELPLogJvlqukJ
 5p6eRnQKAbCK+qxWIuVY8ecUzC35l3XjURCG9TmnYqtJDnGYqCcULECCl8n4gLWy1muU
 zd1xmyRkjTwHELeVGWvx8ku+TYdQpEesAFPd61I6wmI4hUQ2878FMLmlZdGCy4c0zBx2
 AZ9l4ruslNPJ4yCPjHNECJKtZs5fIMHSByDfxIr0QxPzGmCDi3mY+d5hPkbQwH3AwTTJ
 ATO6K/wdTw2kRcqd9UuUimpgQnjlBuiCQ0Q8t6/+FhMdxKU/84RmSgaOQJYUczl86xuR
 +23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=8j7vPXQ8NnTfCALzCvlEWGGchYaunD8ZmjFF9OfryBo=;
 b=ciVyQFTL6OTmtBzDQjyvFuPb68Q6HUmGGA7iHGXN+ZOlcqIqFJ5vuAVXEz3Cb/7oRx
 qWBIEw3yv1Is5vx+8ATydI0Xwwwufcqw478SSAR9X3awa8RjWQUHJKCsEQhvRlJtINbt
 QRB/xj+CV5zU3f6hR9EgaAKCTet4Wxe/LLUnowPMnOJDPMXIQODpkUwk+ROxCNgrBeyA
 VCXdCrLB2CIwu5G0laHUvPXMOVvXjYx9Gc7WlYHr08pL6aWHVNYnumJesPPU10/v94CQ
 P3SkuP/m/aalAdU7cSBb5ogOtapm2Td5Jpi/qowO2H6NyHfhvLnl2h2EjDdqw/DXFfJC
 hOHQ==
X-Gm-Message-State: APjAAAU7z6VeGARZ/16WQ3TsAoyq3ByaMF76p7pIBFgTX4jpTVgTnLy2
 Rq73OoGoPWkuVDnO/aNk1g==
X-Google-Smtp-Source: APXvYqxweGS12eq7xzPRA2TGNxLW34igZlRxFgUer0mcaJqfFCqFllIcyokHKrPw9a9xIZBKM24v8g==
X-Received: by 2002:a17:90a:e653:: with SMTP id
 ep19mr6606383pjb.58.1580395671183; 
 Thu, 30 Jan 2020 06:47:51 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:1ee1:f815:d421:7a49:b2e4:2bd6])
 by smtp.gmail.com with ESMTPSA id b1sm7204927pfg.182.2020.01.30.06.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2020 06:47:50 -0800 (PST)
From: madhuparnabhowmik10@gmail.com
To: peterz@infradead.org, mingo@redhat.com, acme@kernel.org,
 mark.rutland@arm.com, alexander.shishkin@linux.intel.com, olsa@redhat.com,
 namhyung@kernel.org
Date: Thu, 30 Jan 2020 20:17:28 +0530
Message-Id: <20200130144728.24072-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: paulmck@kernel.org, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] perf_event.h: Add RCU Annotation to
	struct ring_buffer in perf_event
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

This patch fixes the following sparse errors in events/core.c
and events/ring_buffer.c by adding RCU Annotation to struct
ring_buffer in perf_event:

kernel/events/core.c:5597:9: error: incompatible types in comparison expression
kernel/events/core.c:5303:22: error: incompatible types in comparison expression
kernel/events/core.c:5439:14: error: incompatible types in comparison expression
kernel/events/core.c:5472:14: error: incompatible types in comparison expression
kernel/events/core.c:5529:14: error: incompatible types in comparison expression
kernel/events/core.c:5615:14: error: incompatible types in comparison expression
kernel/events/core.c:5615:14: error: incompatible types in comparison expression
kernel/events/core.c:7183:13: error: incompatible types in comparison expression

kernel/events/ring_buffer.c:169:14: error: incompatible types in comparison expression

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
---
 include/linux/perf_event.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 6d4c22aee384..1691107d2800 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -694,7 +694,7 @@ struct perf_event {
 	struct mutex			mmap_mutex;
 	atomic_t			mmap_count;
 
-	struct ring_buffer		*rb;
+	struct ring_buffer __rcu	*rb;
 	struct list_head		rb_entry;
 	unsigned long			rcu_batches;
 	int				rcu_pending;
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
