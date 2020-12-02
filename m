Return-Path: <SRS0=wdXo=FG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5854DC71155
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Dec 2020 10:15:22 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2E642222C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Dec 2020 10:15:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2E642222C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 33E2888270;
	Wed,  2 Dec 2020 10:15:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WkQp6sy28DtF; Wed,  2 Dec 2020 10:15:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id F2BAA88271;
	Wed,  2 Dec 2020 10:15:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DD36AC163C;
	Wed,  2 Dec 2020 10:15:19 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C3DE5C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 10:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B286A2E214
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 10:15:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QyOhOgCgb8cd
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 10:15:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by silver.osuosl.org (Postfix) with ESMTPS id E880520011
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 10:15:17 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id r2so874113pls.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 02 Dec 2020 02:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WWjb6zrEMy2J76Z4aT/3tobNbUFtkhliXqvzagYlv+E=;
 b=gxRccWuGGU41q3Km4iGrDQa3cvPUG5oPMlBZaKbiEeL6JhT9eqx8Ug47sHEh5QK77y
 XYn248vJZKhh/cxygPf5uxHUsYhvXDypHKjiwGeVyonRbHOlUgR10hnpT+UH9KBLbZGd
 PcX9vYxynhY0WDh3BANRcIm0br5+sTenJX2/DwSKWDD00Oi1fnaBJ7ZmBN+mQcDOzbw8
 b7d43HxvK4rPax8sLgHphgRA14Msw2uf7kGa6CkMm136YgqhjsjuXXyvvnsBmGs0VwjO
 UIFydasllGD0xAi70Hv13Y4nwuCSPxJrykNomFZJfAp99aJU0UfL9ND53oYasHO0ARp7
 OsoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WWjb6zrEMy2J76Z4aT/3tobNbUFtkhliXqvzagYlv+E=;
 b=OeixZMBZk22PGpFPt1srMx9vRM21IprDpgZwCleMSsh9DIkyctSC2DEd+VeAxDskOh
 xNodEEWDbBcpSRxc29zUlpLJhaBL2IhdjrvQaNzBO/f57ddWVBVW+cnrcy6Ysl2awOcG
 gBXOl/T1XgPMQmyCnXTBuNfGF50Mk4kvz3VVjDQmhx2GZEStS7A9b0JKhBz2GSRcltxS
 brVbbR1+zWjV/Lf0hwmSHzcIf3+nmsDiMXvGLoSiwTXXx1oaHw74Ypz2tmBf8Ym0qXek
 7xO4VAZoywJNPebAxiNZpV8w+ntRki/UnuuDfs/BXihwQip/yxuVwhozz5rxgmnjWDFC
 AxYg==
X-Gm-Message-State: AOAM5335FoWBzSdBW8AuVDzM1hnh9tk6ErTBlSkRz+kfxq3cYTDwwxwX
 wTIKKdL1flXSaqd6qrmgH34=
X-Google-Smtp-Source: ABdhPJyo+01CcdRYzhUvf15PRmTg1LbB5GaQeqEeQlewZHlpQ1Lj4hwkKG+6BwWDHvlhhA2raO8kxA==
X-Received: by 2002:a17:902:9b87:b029:d8:d123:2283 with SMTP id
 y7-20020a1709029b87b02900d8d1232283mr2064184plp.60.1606904117364; 
 Wed, 02 Dec 2020 02:15:17 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:6a1b:d60e:9bc5:1ecd:a6f8])
 by smtp.gmail.com with ESMTPSA id o11sm953936pjs.36.2020.12.02.02.15.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 02:15:16 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Wed,  2 Dec 2020 15:44:48 +0530
Message-Id: <20201202101448.8494-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: Peilin Ye <yepeilin.cs@gmail.com>, dwaipayanray1@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: add warning for lines
	starting with a '#' in commit log
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

Commit log lines starting with a '#' can be dropped by git if
the corresponding commit message is reworded by a maintainer.
This minor error can be easily avoided if checkpatch warns
for the same.

Add a new check which emits a warning on finding lines starting
with a '#'. Also add a quick fix by adding a tab in front of
such lines.

Suggested-by: Peilin Ye <yepeilin.cs@gmail.com>
Tested-by: Peilin Ye <yepeilin.cs@gmail.com>
Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index e8c1ed0b1fad..a12edcf4f63a 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2966,6 +2966,15 @@ sub process {
 			$commit_log_possible_stack_dump = 0;
 		}
 
+# Check for lines starting with a #
+		if ($in_commit_log && $line =~ /^#/) {
+			if (WARN("POSSIBLE_IGNORED_LINE",
+				 "Commit log lines starting with a '#' might be dropped by git.\n" . $herecurr)
+			    && $fix) {
+				$fixed[$fixlinenr] =~ s/^#/\t#/;
+			}
+		}
+
 # Check for git id commit length and improperly formed commit descriptions
 		if ($in_commit_log && !$commit_log_possible_stack_dump &&
 		    $line !~ /^\s*(?:Link|Patchwork|http|https|BugLink|base-commit):/i &&
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
