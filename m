Return-Path: <SRS0=JPIQ=Y2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED64CA9ED1
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  2 Nov 2019 11:55:36 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64BC520862
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  2 Nov 2019 11:55:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UnWMI5MI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64BC520862
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 363DBE42;
	Sat,  2 Nov 2019 11:55:36 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1A370E39
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sat,  2 Nov 2019 11:55:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5C98314D
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sat,  2 Nov 2019 11:55:34 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id x28so5587433pfo.6
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sat, 02 Nov 2019 04:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7u/iOR7HJqtZD8nquIFJaMlxUwUZ2mligFudZlnPrWU=;
	b=UnWMI5MI5/gxEd8ihgP7kS9XWpzKHAH7ezgi6KAANGgBemAcX1+iFM6NVxnzuzVjf4
	tn0H2sMS8+m71lBTPPzsca+MSFg5ULBumVtzCY/TYQcMdGZpkWwQems7wB74qLPNXsaA
	w2VJremR97MGbNCqbv+mXjqQvVyJz4li6FdYz7V8n9ubDmsrBk5TjeGYWkdTXKEBfDpX
	NkCQj4P0XePvhDx8OUWuaFwtYeb20FutncuFZvt2sQqJ7By14n8Oo4iy/RIMyk/OWOXX
	fAF5ALjaQvnr3PWHJ6/1qDqLcqs/hxOg74Y6H4yWVkAjA6eYNDX8lM+zZJjb8ErwBMLV
	Wfiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7u/iOR7HJqtZD8nquIFJaMlxUwUZ2mligFudZlnPrWU=;
	b=Oo1w3OMjrWmmbXXvmjqG13RofK85T6vA13jwAKiDut3jGNlaWlEgBHhyfBzgMjfvSO
	VP/hkcEEAwF0CtlfXh/X2H6YU0VIEdisjqZVU6IK0Muy+sckXNbd6vKGpvtDYPOumcLw
	CIxc8a/tCjBOqGusgAGA+wQ9TsLWKem/LHNT5NcTq+/DW3CDU1y92BlLKC3v9ReOukzF
	nM4wM9HPJWyZf/xfXwJFm+5d5VtlVlmvnbfuzvMouOkjpZ5szjlu4kL+6kLcv1gBFhZy
	UYNouPdG5QtgsV8No0+LpOW60R65WqrZ6JalslIsb/xKn8/XSpyDC4Rmw9VAEr0HCiwR
	D56A==
X-Gm-Message-State: APjAAAVLo7ufyXZBIpD+w2UhjYjRxVaSLx5L2P2sO2I739rk37WQGwX1
	fRb+sUzSFp6tBexmBS1Avr8=
X-Google-Smtp-Source: APXvYqx5DViiAj0X3gP1IMt5ru+wl84hoOd5wSYkowEoxDjDaT8Br+oaj/Eo+YAEW9+cN7erRjKmRg==
X-Received: by 2002:a17:90a:d993:: with SMTP id
	d19mr21679885pjv.26.1572695733504; 
	Sat, 02 Nov 2019 04:55:33 -0700 (PDT)
Received: from debian.net.fpt ([2405:4800:58f7:55d9:3e01:3008:2e64:188f])
	by smtp.gmail.com with ESMTPSA id
	a12sm5122320pfo.136.2019.11.02.04.55.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 02 Nov 2019 04:55:32 -0700 (PDT)
From: Phong Tran <tranmanphong@gmail.com>
To: paulmck@kernel.org, josh@joshtriplett.org, rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com,
	joel@joelfernandes.org, corbet@lwn.net, madhuparnabhowmik04@gmail.com
Date: Sat,  2 Nov 2019 18:55:17 +0700
Message-Id: <20191102115517.6378-1-tranmanphong@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] Doc: Improve format for whatisRCU.rst
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>,
	<mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>,
	<mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Message-ID: <20191102115517.f-y9XvLblPGcoARlwQofWLwoMVwmQWSirpWgJ4-d-D4@z>

Adding crossreference target for some headers, answer of quizzes

Signed-off-by: Phong Tran <tranmanphong@gmail.com>
---
 Documentation/RCU/whatisRCU.rst | 73 +++++++++++++++++++++++----------
 1 file changed, 52 insertions(+), 21 deletions(-)

diff --git a/Documentation/RCU/whatisRCU.rst b/Documentation/RCU/whatisRCU.rst
index 70d0e4c21917..ae40c8bcc56c 100644
--- a/Documentation/RCU/whatisRCU.rst
+++ b/Documentation/RCU/whatisRCU.rst
@@ -1,4 +1,4 @@
-.. _rcu_doc:
+.. _whatisrcu_doc:
 
 What is RCU?  --  "Read, Copy, Update"
 ======================================
@@ -27,14 +27,21 @@ the experience has been that different people must take different paths
 to arrive at an understanding of RCU.  This document provides several
 different paths, as follows:
 
-1.	RCU OVERVIEW
-2.	WHAT IS RCU'S CORE API?
-3.	WHAT ARE SOME EXAMPLE USES OF CORE RCU API?
-4.	WHAT IF MY UPDATING THREAD CANNOT BLOCK?
-5.	WHAT ARE SOME SIMPLE IMPLEMENTATIONS OF RCU?
-6.	ANALOGY WITH READER-WRITER LOCKING
-7.	FULL LIST OF RCU APIs
-8.	ANSWERS TO QUICK QUIZZES
+:ref:`1.	RCU OVERVIEW <1_whatisRCU>`
+
+:ref:`2.	WHAT IS RCU'S CORE API? <2_whatisRCU>`
+
+:ref:`3.	WHAT ARE SOME EXAMPLE USES OF CORE RCU API? <3_whatisRCU>`
+
+:ref:`4.	WHAT IF MY UPDATING THREAD CANNOT BLOCK? <4_whatisRCU>`
+
+:ref:`5.	WHAT ARE SOME SIMPLE IMPLEMENTATIONS OF RCU? <5_whatisRCU>`
+
+:ref:`6.	ANALOGY WITH READER-WRITER LOCKING <6_whatisRCU>`
+
+:ref:`7.	FULL LIST OF RCU APIs <7_whatisRCU>`
+
+:ref:`8.	ANSWERS TO QUICK QUIZZES <8_whatisRCU>`
 
 People who prefer starting with a conceptual overview should focus on
 Section 1, though most readers will profit by reading this section at
@@ -52,6 +59,7 @@ everything, feel free to read the whole thing -- but if you are really
 that type of person, you have perused the source code and will therefore
 never need this document anyway.  ;-)
 
+.. _1_whatisRCU:
 
 1.  RCU OVERVIEW
 ----------------
@@ -120,6 +128,7 @@ So how the heck can a reclaimer tell when a reader is done, given
 that readers are not doing any sort of synchronization operations???
 Read on to learn about how RCU's API makes this easy.
 
+.. _2_whatisRCU:
 
 2.  WHAT IS RCU'S CORE API?
 ---------------------------
@@ -381,13 +390,15 @@ c.	RCU applied to scheduler and interrupt/NMI-handler tasks.
 Again, most uses will be of (a).  The (b) and (c) cases are important
 for specialized uses, but are relatively uncommon.
 
+.. _3_whatisRCU:
 
 3.  WHAT ARE SOME EXAMPLE USES OF CORE RCU API?
 -----------------------------------------------
 
 This section shows a simple use of the core RCU API to protect a
 global pointer to a dynamically allocated structure.  More-typical
-uses of RCU may be found in listRCU.txt, arrayRCU.txt, and NMI-RCU.txt.
+uses of RCU may be found in :ref:`listRCU.rst <list_rcu_doc>`,
+:ref:`arrayRCU.rst <array_rcu_doc>`, and :ref:`NMI-RCU.rst <NMI_rcu_doc>`.
 ::
 
 	struct foo {
@@ -470,9 +481,11 @@ o	Use synchronize_rcu() -after- removing a data element from an
 	data item.
 
 See checklist.txt for additional rules to follow when using RCU.
-And again, more-typical uses of RCU may be found in listRCU.txt,
-arrayRCU.txt, and NMI-RCU.txt.
+And again, more-typical uses of RCU may be found in :ref:`listRCU.rst
+<list_rcu_doc>`, :ref:`arrayRCU.rst <array_rcu_doc>`, and :ref:`NMI-RCU.rst
+<NMI_rcu_doc>`.
 
+.. _4_whatisRCU:
 
 4.  WHAT IF MY UPDATING THREAD CANNOT BLOCK?
 --------------------------------------------
@@ -567,6 +580,7 @@ to avoid having to write your own callback::
 
 Again, see checklist.txt for additional rules governing the use of RCU.
 
+.. _5_whatisRCU:
 
 5.  WHAT ARE SOME SIMPLE IMPLEMENTATIONS OF RCU?
 ------------------------------------------------
@@ -657,10 +671,12 @@ that the only thing that can block rcu_read_lock() is a synchronize_rcu().
 But synchronize_rcu() does not acquire any locks while holding rcu_gp_mutex,
 so there can be no deadlock cycle.
 
-Quick Quiz #1:	Why is this argument naive?  How could a deadlock
+Quick Quiz #1:
+		Why is this argument naive?  How could a deadlock
 		occur when using this algorithm in a real-world Linux
 		kernel?  How could this deadlock be avoided?
 
+:ref:`Answers to Quick Quiz <8_whatisRCU>`
 
 5B.  "TOY" EXAMPLE #2: CLASSIC RCU
 
@@ -709,13 +725,20 @@ synchronize_rcu().  Once synchronize_rcu() returns, we are guaranteed
 that there are no RCU read-side critical sections holding a reference
 to that data item, so we can safely reclaim it.
 
-Quick Quiz #2:	Give an example where Classic RCU's read-side
+Quick Quiz #2:
+		Give an example where Classic RCU's read-side
 		overhead is -negative-.
 
-Quick Quiz #3:  If it is illegal to block in an RCU read-side
+:ref:`Answers to Quick Quiz <8_whatisRCU>`
+
+Quick Quiz #3:
+		If it is illegal to block in an RCU read-side
 		critical section, what the heck do you do in
 		PREEMPT_RT, where normal spinlocks can block???
 
+:ref:`Answers to Quick Quiz <8_whatisRCU>`
+
+.. _6_whatisRCU:
 
 6.  ANALOGY WITH READER-WRITER LOCKING
 --------------------------------------
@@ -842,6 +865,7 @@ delete() can now block.  If this is a problem, there is a callback-based
 mechanism that never blocks, namely call_rcu() or kfree_rcu(), that can
 be used in place of synchronize_rcu().
 
+.. _7_whatisRCU:
 
 7.  FULL LIST OF RCU APIs
 -------------------------
@@ -1001,16 +1025,19 @@ g.	Otherwise, use RCU.
 Of course, this all assumes that you have determined that RCU is in fact
 the right tool for your job.
 
+.. _8_whatisRCU:
 
 8.  ANSWERS TO QUICK QUIZZES
 ----------------------------
 
-Quick Quiz #1:	Why is this argument naive?  How could a deadlock
+Quick Quiz #1:
+		Why is this argument naive?  How could a deadlock
 		occur when using this algorithm in a real-world Linux
 		kernel?  [Referring to the lock-based "toy" RCU
 		algorithm.]
 
-Answer:		Consider the following sequence of events:
+Answer:
+		Consider the following sequence of events:
 
 		1.	CPU 0 acquires some unrelated lock, call it
 			"problematic_lock", disabling irq via
@@ -1049,10 +1076,12 @@ Answer:		Consider the following sequence of events:
 		approach where tasks in RCU read-side critical sections
 		cannot be blocked by tasks executing synchronize_rcu().
 
-Quick Quiz #2:	Give an example where Classic RCU's read-side
+Quick Quiz #2:
+		Give an example where Classic RCU's read-side
 		overhead is -negative-.
 
-Answer:		Imagine a single-CPU system with a non-CONFIG_PREEMPT
+Answer:
+		Imagine a single-CPU system with a non-CONFIG_PREEMPT
 		kernel where a routing table is used by process-context
 		code, but can be updated by irq-context code (for example,
 		by an "ICMP REDIRECT" packet).	The usual way of handling
@@ -1074,11 +1103,13 @@ Answer:		Imagine a single-CPU system with a non-CONFIG_PREEMPT
 		even the theoretical possibility of negative overhead for
 		a synchronization primitive is a bit unexpected.  ;-)
 
-Quick Quiz #3:  If it is illegal to block in an RCU read-side
+Quick Quiz #3:
+		If it is illegal to block in an RCU read-side
 		critical section, what the heck do you do in
 		PREEMPT_RT, where normal spinlocks can block???
 
-Answer:		Just as PREEMPT_RT permits preemption of spinlock
+Answer:
+		Just as PREEMPT_RT permits preemption of spinlock
 		critical sections, it permits preemption of RCU
 		read-side critical sections.  It also permits
 		spinlocks blocking while in RCU read-side critical
-- 
2.20.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
