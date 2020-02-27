Return-Path: <SRS0=V8/f=4P=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F0DC4BA06
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 Feb 2020 09:09:06 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D66B2467F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 Feb 2020 09:09:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BqnCB4Er"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D66B2467F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EC84384E42;
	Thu, 27 Feb 2020 09:09:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wavltkkQ27MS; Thu, 27 Feb 2020 09:09:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2B13385A78;
	Thu, 27 Feb 2020 09:09:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 19837C1D80;
	Thu, 27 Feb 2020 09:09:04 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9030BC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Feb 2020 09:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7C91085D21
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Feb 2020 09:09:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CR-ycDLGHNWO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Feb 2020 09:09:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DD34F855E1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Feb 2020 09:09:01 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id n7so1306980pfn.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Feb 2020 01:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7vaQ7QjOo9Se0T2Q2xPF6qY4GtLPfQLgWURgHlmpa9Y=;
 b=BqnCB4Er3oF2o5IN15+LOkwinBZOxRYQCo4EGX4oH8xeUB3MwJlgFCg0L3JYst45O+
 JjF6DLkrtqxrp1CK6/ZTiH66sUENhhaOtWYn1Fg5LLgLpaGCRMTIzI2hTQsAwzaCyvR3
 wfUt+qTC5Na9npr0JTClPBcasifIOadGEk+jWZq3DJr2jkRJX4PyuOs/9RFq2MX8Xkw0
 KnlTUleiOIqAuQTBfiUCdshOoMA1H90YnZ3IFxLuSBymdnsuVjERa/hXH5sSiHj699Aj
 ArXDa8oedb8rQ6UG4ZcQ3/3qgayXymHOajWKPfM3ndyqoePz1bd2IYR5bdrBar50E5e0
 gF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7vaQ7QjOo9Se0T2Q2xPF6qY4GtLPfQLgWURgHlmpa9Y=;
 b=EKg/jtQikE1wB0lVEEWFqxI5Id0B6nUs6KvfK5RSMjfIQMYsu3DWPET7qdbP5VBmsx
 v07h5r6nWRKLu54mPNaARTfcknqmdcWM9YxF282IpWiQ/6MiJXhVBSPKHUc4sus8QF6i
 0Lfh2z5u5nWOujVchlDJkiQ7q5gIDZJb6gVZTZsElBe8/U4EhkbFUaL7GKv56io9/FJT
 AsigBg3WHNBvosRwmf21x0jypxNVBP4I1lDzyUSHecEDqZlFkOlOgH8xuOml/u63alT3
 FDWGKPkM60tc5d4vGDhF9dhdlnxXyYcaAGsjsduk28hRY9mSXLDOUURJ/ey+8cFwHAZ3
 8kWg==
X-Gm-Message-State: APjAAAXpMePHH2ezfSOCYvcUg2VhcQ53mizRGb+zi36IDaAnZffTqyr4
 d2v72sugv3oCZGiootkYp23slb1y7qwbr8jC
X-Google-Smtp-Source: APXvYqwrD+o+y8bKo8X5wlJp0Eqfc4ggjlZK8W2rxPa0DGLux+knPP2Ho1qR7dnimC3gqRBfj2k2eA==
X-Received: by 2002:a65:6715:: with SMTP id u21mr2984536pgf.17.1582794541092; 
 Thu, 27 Feb 2020 01:09:01 -0800 (PST)
Received: from localhost.localdomain ([103.46.201.26])
 by smtp.gmail.com with ESMTPSA id 3sm5700096pjg.27.2020.02.27.01.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 01:09:00 -0800 (PST)
From: Aman Sharma <amanharitsh123@gmail.com>
To: 
Date: Thu, 27 Feb 2020 14:38:54 +0530
Message-Id: <20200227090854.18207-1-amanharitsh123@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200225183916.4555-1-amanharitsh123@gmail.com>
References: <20200225183916.4555-1-amanharitsh123@gmail.com>
MIME-Version: 1.0
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Lai Jiangshan <jiangshanlai@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 Josh Triplett <josh@joshtriplett.org>, rcu@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2] doc: Convert to checklist.txt to
	checklist.rst
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

From: amanharitsh123 <amanharitsh123@gmail.com>

This patch converts checklist.txt to checklist.rst and
adds it to index.rst

Signed-off-by: Aman Sharma <amanharitsh123@gmail.com>
---
 Documentation/RCU/{checklist.txt => checklist.rst} | 8 +++++---
 Documentation/RCU/index.rst                        | 1 +
 2 files changed, 6 insertions(+), 3 deletions(-)
 rename Documentation/RCU/{checklist.txt => checklist.rst} (99%)

diff --git a/Documentation/RCU/checklist.txt b/Documentation/RCU/checklist.rst
similarity index 99%
rename from Documentation/RCU/checklist.txt
rename to Documentation/RCU/checklist.rst
index e98ff261a438..50fd557b9acd 100644
--- a/Documentation/RCU/checklist.txt
+++ b/Documentation/RCU/checklist.rst
@@ -1,5 +1,7 @@
-Review Checklist for RCU Patches
+.. _checklist_doc: 
 
+Review Checklist for RCU Patches
+================================
 
 This document contains a checklist for producing and reviewing patches
 that make use of RCU.  Violating any of the rules listed below will
@@ -442,8 +444,8 @@ over a rather long period of time, but improvements are always welcome!
 
 	You instead need to use one of the barrier functions:
 
-	o	call_rcu() -> rcu_barrier()
-	o	call_srcu() -> srcu_barrier()
+	-	call_rcu() -> rcu_barrier()
+	-	call_srcu() -> srcu_barrier()
 
 	However, these barrier functions are absolutely -not- guaranteed
 	to wait for a grace period.  In fact, if there are no call_rcu()
diff --git a/Documentation/RCU/index.rst b/Documentation/RCU/index.rst
index 81a0a1e5f767..d60eb4ba2cd0 100644
--- a/Documentation/RCU/index.rst
+++ b/Documentation/RCU/index.rst
@@ -10,6 +10,7 @@ RCU concepts
    arrayRCU
    rcubarrier
    rcu_dereference
+   checklist
    whatisRCU
    rcu
    listRCU
-- 
2.20.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
