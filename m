Return-Path: <SRS0=4Pq9=4U=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9081BC3F2D7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Mar 2020 14:46:00 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5745920838
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Mar 2020 14:46:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tfVPG1Dw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5745920838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1AF4D2000A;
	Tue,  3 Mar 2020 14:46:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vQMaGx072qrk; Tue,  3 Mar 2020 14:45:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 684351FEED;
	Tue,  3 Mar 2020 14:45:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4D726C1AE2;
	Tue,  3 Mar 2020 14:45:59 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C0129C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Mar 2020 14:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id AEC5187216
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Mar 2020 14:45:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X3uXJuRxTDgQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Mar 2020 14:45:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3704A86B58
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Mar 2020 14:45:57 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id m5so1651621pgg.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Mar 2020 06:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=7+OPrhcCxhD88nBBppkS0Unot2bwdV1u+1a7nZ3TUsA=;
 b=tfVPG1Dw9PQ6yj4UwhgU3mxjYGO0RhTzt8ID6jjhlLmQXtMp52UV0OzfSqh/wdtHa6
 Kpadqio3VhBHTE/ZxRWUy1+y8qQOqbcUwNBdQzpRPBY51Ja6iPa7cgfxX5e3I0PU6xb+
 3WL6PQcWb1xkmUkC1ZN7+Bh++lKbI2tc4camwkdNPmwLbk9Xj0qcSe+fLn3nPG5N2QcC
 aijaQJOyDt0n9HnxM1+qspoC0ISrkUxvjH3HWzmLSpHaHEf4diNiiD9rpy/vkvbWPNFX
 KSRx9Qv2eJ4tsoDsMdim1pPo5zpt5UH4Bt2mpw2iEFESfH6aOgyG8tPXSdCc4dEzEKez
 9dHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=7+OPrhcCxhD88nBBppkS0Unot2bwdV1u+1a7nZ3TUsA=;
 b=AOHdEFKRF6E0G4onI4t+3CNZp6/moh1mSGNMuRjIf9cjvSkFPY6rxtoEHkqOq4SWG0
 AKRscTeHwm7OwE9M38HRdgckCqMxac/Ixaw1K06rmJOvbkin+4K7rgzjENXMBqt5fmUF
 C6gT7t+lEab1Lm5TzE/VoZ2COMC07xvhUIzQA45H7Yqghn8y0Gk5yo7O8+WaH+YQpxVG
 cuTlQPbsA+haroIm9CIK6KnKU3i4WDCuZakiSYCHWrM/6o4eZRl8stTNGg55cW+TXxtE
 Kf1J+qI0GgVbM83mAmBud801IjIQjdCGVxmf+JQdQunObRWTnC5Ofap7d4s55xcOxGkH
 uZ9g==
X-Gm-Message-State: ANhLgQ2VRCElvQ9tDnm+OVvxW3YMWEfpr6WtdqQk60W7NkCHVIiBwK54
 9/+TXtXwE35RiW/boT80cA8=
X-Google-Smtp-Source: ADFU+vv+wWZZSCz/PWWSj2zrrPSejDYdYRTa8dEA0uwFrJBvvQJareiMv0Ev1scHr5djPToJqBs40A==
X-Received: by 2002:a63:fc62:: with SMTP id r34mr4498737pgk.437.1583246756508; 
 Tue, 03 Mar 2020 06:45:56 -0800 (PST)
Received: from localhost.localdomain ([103.118.34.152])
 by smtp.gmail.com with ESMTPSA id e12sm9344869pff.168.2020.03.03.06.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 06:45:56 -0800 (PST)
From: Pawan Kumar Meena <pawank1804@gmail.com>
To: paulmck@kernel.org,
	joel@joelfernandes.org
Date: Tue,  3 Mar 2020 20:15:46 +0530
Message-Id: <20200303144546.20405-1-pawank1804@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH RESEND] Documentation: RCU:
	lockdep.txt: Convert to lockdep.rst
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

This patch converts lockdep.txt to lockdep.rst and adds it to index.rst.

Signed-off-by: Pawan Kumar Meena <pawank1804@gmail.com>
---
 Documentation/RCU/index.rst                    | 1 +
 Documentation/RCU/{lockdep.txt => lockdep.rst} | 9 ++++++---
 2 files changed, 7 insertions(+), 3 deletions(-)
 rename Documentation/RCU/{lockdep.txt => lockdep.rst} (97%)

diff --git a/Documentation/RCU/index.rst b/Documentation/RCU/index.rst
index 81a0a1e5f767..109dea13f165 100644
--- a/Documentation/RCU/index.rst
+++ b/Documentation/RCU/index.rst
@@ -10,6 +10,7 @@ RCU concepts
    arrayRCU
    rcubarrier
    rcu_dereference
+   lockdep
    whatisRCU
    rcu
    listRCU
diff --git a/Documentation/RCU/lockdep.txt b/Documentation/RCU/lockdep.rst
similarity index 97%
rename from Documentation/RCU/lockdep.txt
rename to Documentation/RCU/lockdep.rst
index 89db949eeca0..3a88d8a59753 100644
--- a/Documentation/RCU/lockdep.txt
+++ b/Documentation/RCU/lockdep.rst
@@ -1,4 +1,7 @@
+.. _lockdep_doc:
+
 RCU and lockdep checking
+========================
 
 All flavors of RCU have lockdep checking available, so that lockdep is
 aware of when each task enters and leaves any flavor of RCU read-side
@@ -63,7 +66,7 @@ checking of rcu_dereference() primitives:
 The rcu_dereference_check() check expression can be any boolean
 expression, but would normally include a lockdep expression.  However,
 any boolean expression can be used.  For a moderately ornate example,
-consider the following:
+consider the following::
 
 	file = rcu_dereference_check(fdt->fd[fd],
 				     lockdep_is_held(&files->file_lock) ||
@@ -82,7 +85,7 @@ RCU read-side critical sections, in case (2) the ->file_lock prevents
 any change from taking place, and finally, in case (3) the current task
 is the only task accessing the file_struct, again preventing any change
 from taking place.  If the above statement was invoked only from updater
-code, it could instead be written as follows:
+code, it could instead be written as follows::
 
 	file = rcu_dereference_protected(fdt->fd[fd],
 					 lockdep_is_held(&files->file_lock) ||
@@ -105,7 +108,7 @@ false and they are called from outside any RCU read-side critical section.
 
 For example, the workqueue for_each_pwq() macro is intended to be used
 either within an RCU read-side critical section or with wq->mutex held.
-It is thus implemented as follows:
+It is thus implemented as follows::
 
 	#define for_each_pwq(pwq, wq)
 		list_for_each_entry_rcu((pwq), &(wq)->pwqs, pwqs_node,
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
