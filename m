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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0413C6369E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Dec 2020 20:23:11 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17FD521527
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Dec 2020 20:23:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17FD521527
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 62B1D87A24;
	Wed,  2 Dec 2020 20:23:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j5W+Puokhigr; Wed,  2 Dec 2020 20:23:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id F08F5879EE;
	Wed,  2 Dec 2020 20:23:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D5975C163C;
	Wed,  2 Dec 2020 20:23:09 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 59310C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 20:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3CBCE87A3C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 20:23:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gAQ-trIl3l+x
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 20:23:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A854B87A24
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 20:23:07 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id q22so1954301pfk.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 02 Dec 2020 12:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v7/0OydT0uaoKYqJ+NWnjPhTlLAtk0+KpXs9CvRvSLU=;
 b=jIPucXykd5bAsFogVVKpB1pET0yIvCcmDDjrr76g4Se3CUszOfn9CbPtJs0tySu7sw
 2GZ8HjdBttEvChQhF9hie5D4kx2USsos9waRFNr4IZpLikx9e7NazeT4M5H3DgQovFz2
 m3AqJnyq3IdTFRYSx5vjpueByrZSDCoAx08cIGvArLWJ5PRarNYbpbtbczqLbvsZ2TJ7
 bBKzSQt/w8240ECmB06r4j7l/oInGxWbno/WDIwrOz6iCPNNTZo9z/MJ6+y3zPJzIxEx
 O4/jj4CkTPsUQmSf7/v4UrZLBZbTf5HXrPrxQgpoErr3NL2YoWaQMzHVaBFqpZ8vVhFG
 tDjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v7/0OydT0uaoKYqJ+NWnjPhTlLAtk0+KpXs9CvRvSLU=;
 b=MzTgyDu4Yl98GOVu/jYRPwDveKtnLJra4FmCkvrJQhAid04qdyBT9bFx5eLWN4FWFs
 XhzA4Alnw3L/2bREgBl2QQNlnOjnDwhV6pWpny/lQv36ZVQQjgdFGCMOTDBxdPMBQ0eH
 gLQr8xsvgB+Jwp9asIfZUXxsdWLNM4ljCaGrHFn4dE4W1sYoUnyb0O6CfHZNzY3I+JQp
 jIx8SfGc8tOd9qdEGzxUO3s203k8D5z/mM5Get1+yStKFxqDqU4QBJon+td+vnGzQ1QK
 5PwExxGFEDWfDDERiQXhqX6V1Qrxd+q9jLFmy6gUdGp40uP4Hwv4KBprXEbDA5fcOofs
 4nXw==
X-Gm-Message-State: AOAM533nLgG+ler7/GhKBL/2Gc9q2542QeQ7ckGElXedT8+5UKGWI0sq
 608lp8NGNRrLtRnjxbZ5OyM=
X-Google-Smtp-Source: ABdhPJxnM3PfBxHyTdB5T6wf7+ddR2b23jX5a1d21P3ZQFZ9p+p/OzrUhOHyDXHmS2FdmOP9NC5BMQ==
X-Received: by 2002:a05:6a00:2302:b029:198:4459:e6c9 with SMTP id
 h2-20020a056a002302b02901984459e6c9mr4453093pfh.33.1606940587058; 
 Wed, 02 Dec 2020 12:23:07 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:6a1b:d60e:9bc5:1ecd:a6f8])
 by smtp.gmail.com with ESMTPSA id i11sm398894pjl.53.2020.12.02.12.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 12:23:06 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Thu,  3 Dec 2020 01:52:29 +0530
Message-Id: <20201202202229.120898-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: Peilin Ye <yepeilin.cs@gmail.com>, dwaipayanray1@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v2] checkpatch: add warning for lines
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
Changes in v2:
- Modify warning message and type
- Style fixes

 scripts/checkpatch.pl | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index e8c1ed0b1fad..eb8b13cf3f40 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2966,6 +2966,15 @@ sub process {
 			$commit_log_possible_stack_dump = 0;
 		}
 
+# Check for lines starting with a #
+		if ($in_commit_log && $line =~ /^#/) {
+			if (WARN("COMMIT_COMMENT_SYMBOL",
+				 "Commit log lines starting with a '#' will be dropped by git as a comment\n" . $herecurr) &&
+			    $fix) {
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
