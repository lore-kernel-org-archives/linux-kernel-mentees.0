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
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC288C11D3D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 Feb 2020 17:12:15 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 801B72469B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 Feb 2020 17:12:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ShWOVZhZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 801B72469B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3CFA92214F;
	Thu, 27 Feb 2020 17:12:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hDRUA4fG+Qj4; Thu, 27 Feb 2020 17:12:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A130422193;
	Thu, 27 Feb 2020 17:12:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8A348C1D80;
	Thu, 27 Feb 2020 17:12:14 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 56AC9C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Feb 2020 17:12:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 453D387E3C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Feb 2020 17:12:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F5g-GB5pqjR5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Feb 2020 17:12:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B4ADD87DB2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Feb 2020 17:12:12 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id t14so39756plr.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Feb 2020 09:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nu4qWyGXEitkgI8n8p9Q8iibxQxSQ0j2p8JZ5tAMehw=;
 b=ShWOVZhZMU1h5z7e67vLxFRq0ddF7fjuyvnWSIUdUJRrlJt0GzFQnvLT0ysIjRzQ4d
 mxi/DGZ8DeUhiIkJLaKPvn3juJwWith+GTZ+2tA/QpJ/IqXj3UYzz04J0oO3ciDuUluR
 bQBvlrLG3EJ82COLZJMkTOBajQL1in0v1SfzxJ5QzEZ0/HQokcU3t+SeG0tW5swYinaD
 CEfFHyRBZKsv/2NibN/dfRq7ZUmNK5+kR+92DDbf9o+QGY7Q+tQL7eAcLDOQhy4zOQ48
 gxqROSJzAo1ng5yncV60cb3f55CO3o2z7HUReWhX3Gb0dILvpqtcLSiIsGNEKM27ol+s
 sv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nu4qWyGXEitkgI8n8p9Q8iibxQxSQ0j2p8JZ5tAMehw=;
 b=d0xTBCkyhy5r4SPswMJcYUDepmjawTqzcWfH2/Nu8Vcs4UxKwdeK6hl13H3C3DGPLX
 exefZzC12lt6Bw4w8+XiCsCxUjDzO3u+P/n1tkwgheW7wsdcQHEQBvEcYxyKU6G/FJY3
 I3fL9L2+sgZ+Zy+32xHrVRqHRr6h5xrkFlw4SZNEPU32n7eUKPJOekbKH+yKFmv3xBzQ
 3m0DOkf3JqD8EcrQkSOL6runWfXciSpmo2KJtHxTYAJ1Sqhdz95yoZ5bbo7ICz2wAqa4
 Z/aGfUI/CE2yBOSLt3WQQ41hHZtbsKI6w/rJe2Q2pgpQXcR6KeMzp7BjEIK5nscGyR6+
 R5sQ==
X-Gm-Message-State: APjAAAV7FRQQmL06q/mIIo58fMbYE90Hlv+JtS0pmKVav3SDUQqnbp7u
 6fAPnQi48JUKXe32CwjJO5lMcZdNnp4f4M3p
X-Google-Smtp-Source: APXvYqz8zPfpKvsfrLpSuJya/PbapvntvKW36WMJdNIngeaxNfC/zcbKYNJrejhLAJNEpsfE31p1Xw==
X-Received: by 2002:a17:902:8d8d:: with SMTP id
 v13mr687962plo.260.1582823531438; 
 Thu, 27 Feb 2020 09:12:11 -0800 (PST)
Received: from localhost.localdomain ([103.46.201.150])
 by smtp.gmail.com with ESMTPSA id t28sm8070401pfq.122.2020.02.27.09.12.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 09:12:10 -0800 (PST)
From: amanharitsh123 <amanharitsh123@gmail.com>
To: 
Date: Thu, 27 Feb 2020 22:42:06 +0530
Message-Id: <20200227171206.847-1-amanharitsh123@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

This patch converts checklist.txt to checklist.rst and
adds it to index.rst

Signed-off-by: Aman Sharma <amanharitsh123@gmail.com>
Signed-off-by: amanharitsh123 <amanharitsh123@gmail.com>
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
