Return-Path: <SRS0=fOLH=Y5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A798C47E49
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Nov 2019 21:29:44 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A75E21D71
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Nov 2019 21:29:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y8+nN28M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A75E21D71
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 12277DC3;
	Tue,  5 Nov 2019 21:29:44 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6E4BCDB7
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  5 Nov 2019 21:29:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 11C74844
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  5 Nov 2019 21:29:42 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id c184so16938088pfb.0
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 05 Nov 2019 13:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=/3vtuMbo2Nno4c5epkK+9ZuqU3gi24D4qXzwnR0105w=;
	b=Y8+nN28MJHvNLkconUxm0D1DW279dP/3XKV0xks7lwjKbgkFsUv2Gk0c45Sm5pdytv
	TvD0z3uMV4BeEC0Vdw2mgg3Xtox3TfLlW8CBqdy/5wQMorTCTCMsJaTaowX4K8RMubUS
	F7oMgWull7Car2vzHrlJZ6TnOuVBZq71dpDhsT2pXCIpSSdGgnybUU+J3x/glyk9085A
	xiIZ83J6qznRdSjBKytP8yK9dIfwr5ItY1oe+8C0D4pBGmJ1b7Jx5mrWx3TY1yYudONw
	tUMX3k8okcXeiQcf+FiBUnVbLCpxzd5DbKoUjEKALAzt0LOUhb9B7K4qPJb2KlIKulBC
	gLsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/3vtuMbo2Nno4c5epkK+9ZuqU3gi24D4qXzwnR0105w=;
	b=S/T/SOlbaVqhhNBXZ2cLidkcQ2kYNtZpVBCzSRkjaZBC6AZOkWq3Gg8Mxij1wQuDc2
	2tV/rQwskQFedBL1R2B57D3JBKA4irwdLQhpGhHxPG9XkwjLQ3It6DN7qQWnSDEvA8FJ
	cUbC5CtsycvPL3v/KMH3c4ryE3TWDXT9p1WVdTKCjF5xLqYc84ENQc/jvapuc/V3jFEF
	xGCA2X/aAuKjfKsGDbhrYFZt0/qbOeCqZugUk/LLNOFkK04Op9tC5Xt5qLiNI8Qqw046
	BEPH+r8uy53gYwKBI4F9YuxwCpPsfWVArPUuEVvP8nJ4C0BgCEs/PiuYl+W9MRbYkhEB
	MniQ==
X-Gm-Message-State: APjAAAVG78pPZ4ylS6LQJ/MvxFTVgvBd8Nbk46AftyXv54YbrM1In7T/
	83DTScWIWXcK5CuXBhXpTuo=
X-Google-Smtp-Source: APXvYqx/DEl3pgVzSwinBSwE4HEKhElQMucE6B2yI9QSj1UbKcFLQBhjSG+gAIzhYt2jG98V9aDf1w==
X-Received: by 2002:a17:90a:6583:: with SMTP id
	k3mr1522054pjj.50.1572989381200; 
	Tue, 05 Nov 2019 13:29:41 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
	([2402:3a80:50b:6566:c4f0:fef1:89e3:687])
	by smtp.gmail.com with ESMTPSA id
	z63sm19040007pgb.75.2019.11.05.13.29.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 05 Nov 2019 13:29:40 -0800 (PST)
From: madhuparnabhowmik04@gmail.com
To: paulmck@kernel.org,
	tranmanphong@gmail.com,
	frextrite@gmail.com
Date: Wed,  6 Nov 2019 02:59:27 +0530
Message-Id: <20191105212927.13924-1-madhuparnabhowmik04@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	joel@joelfernandes.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 2/2] Documentation: RCU: arrayRCU:
	Improve format for arrayRCU.rst
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org

From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>

This patch adds cross-references and fixes a few formtting issues.

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
---
 Documentation/RCU/arrayRCU.rst | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/Documentation/RCU/arrayRCU.rst b/Documentation/RCU/arrayRCU.rst
index ed5ae24b196e..30c007edfbfb 100644
--- a/Documentation/RCU/arrayRCU.rst
+++ b/Documentation/RCU/arrayRCU.rst
@@ -6,16 +6,16 @@ Using RCU to Protect Read-Mostly Arrays
 Although RCU is more commonly used to protect linked lists, it can
 also be used to protect arrays.  Three situations are as follows:
 
-1.  Hash Tables
+1.  :ref:`Hash Tables <hash_tables>`
 
-2.  Static Arrays
+2.  :ref:`Static Arrays <static_arrays>`
 
-3.  Resizeable Arrays
+3.  :ref:`Resizeable Arrays <resizeable_arrays>`
 
 Each of these three situations involves an RCU-protected pointer to an
 array that is separately indexed.  It might be tempting to consider use
 of RCU to instead protect the index into an array, however, this use
-case is -not- supported.  The problem with RCU-protected indexes into
+case is **not** supported.  The problem with RCU-protected indexes into
 arrays is that compilers can play way too many optimization games with
 integers, which means that the rules governing handling of these indexes
 are far more trouble than they are worth.  If RCU-protected indexes into
@@ -26,6 +26,7 @@ to be safely used.
 That aside, each of the three RCU-protected pointer situations are
 described in the following sections.
 
+.. _hash_tables:
 
 Situation 1: Hash Tables
 ------------------------
@@ -35,6 +36,7 @@ has a linked-list hash chain.  Each hash chain can be protected by RCU
 as described in the listRCU.txt document.  This approach also applies
 to other array-of-list situations, such as radix trees.
 
+.. _static_arrays:
 
 Situation 2: Static Arrays
 --------------------------
@@ -50,6 +52,8 @@ Quick Quiz:
 
 :ref:`Answer to Quick Quiz <answer_quick_quiz_seqlock>`
 
+.. _resizeable_arrays:
+
 Situation 3: Resizeable Arrays
 ------------------------------
 
@@ -66,7 +70,7 @@ the remainder of the new, updates the ids->entries pointer to point to
 the new array, and invokes ipc_rcu_putref() to free up the old array.
 Note that rcu_assign_pointer() is used to update the ids->entries pointer,
 which includes any memory barriers required on whatever architecture
-you are running on.::
+you are running on::
 
 	static int grow_ary(struct ipc_ids* ids, int newsize)
 	{
@@ -118,7 +122,7 @@ a simple check suffices.  The pointer to the structure corresponding
 to the desired IPC object is placed in "out", with NULL indicating
 a non-existent entry.  After acquiring "out->lock", the "out->deleted"
 flag indicates whether the IPC object is in the process of being
-deleted, and, if not, the pointer is returned.::
+deleted, and, if not, the pointer is returned::
 
 	struct kern_ipc_perm* ipc_lock(struct ipc_ids* ids, int id)
 	{
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
