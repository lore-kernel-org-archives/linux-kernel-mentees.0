Return-Path: <SRS0=ep41=EO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A7C1C56201
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Nov 2020 13:43:29 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6445206E3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Nov 2020 13:43:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gbvjPNou"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6445206E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 75433872A2;
	Sun,  8 Nov 2020 13:43:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LGsVIh8sggXN; Sun,  8 Nov 2020 13:43:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5659687294;
	Sun,  8 Nov 2020 13:43:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 452B0C088B;
	Sun,  8 Nov 2020 13:43:28 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 552F4C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Nov 2020 13:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 406EE872A2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Nov 2020 13:43:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mi10PkoEwlJY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Nov 2020 13:43:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id AD01B87294
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Nov 2020 13:43:26 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id w20so1872010pjh.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 08 Nov 2020 05:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=e0vmOXUAgAOOzA9cqQrS6Zywvk+7YcaoYXyrZKYC2Eo=;
 b=gbvjPNouvqPF9qLDMhqoR9z9SwQbkh2Hj8ILrNbmhKsY65HUPF1WHgrFUA7uCdq0Gh
 10vrlyCMPKU9+uXKQLDhpAXhxb+eTee06R3ArfaAprJ156l9uY/pSLDnWDDyLfGh5xxn
 i3ymRzGdBK4jaO0t8yJ+Thw5Mg6PAWzPisXXoUpt9MTPdmZioajDWOWQIsT4lz24Vind
 WJtGTrE/M9F1TN6BQTN1LhNFQPeoq6Xp3I5407mSGqvK70KcPg/kngCbtW2NFk7YIdjR
 T86HCDCycNPSry6Wm4WnA/x6/nZ7GhjsvLP3UNMBWtXH6zS6CVZ9YS8Ag3W7PnsCdvh0
 qG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=e0vmOXUAgAOOzA9cqQrS6Zywvk+7YcaoYXyrZKYC2Eo=;
 b=HzmI6fg0+pvgtdsI5StwRf5diZkV353lh74E8h2Ms/U9DJ7ge5Xno92YoDD1LbVd/x
 j9zAoXDeuydNKwNpoVTfWb03gm7oBqIuvRFBQGqiR4z0Y2lDLxcVor70hBrNfm+wDV/o
 fNd6nw0n8b7xJ5OGXd/S1VH/6+z4YRZTV28ncxlQxVdv3lccUwbvwZvBqpOhNhJM5D0V
 hdWZwCcUYPdUnwWmqLrEjJaFeD4CCYjqXgNR5vbjv/Y/cwBYSAvHsXLUtZUPEZFxbUd8
 qCEvr5c0rb9nroLks5v6KxAFouYdtYsXa3cvJ8rvOOOe8cdKR+OnlCbOsyEUj/Btsm7u
 YMdQ==
X-Gm-Message-State: AOAM531rts4YhmHE3VMQEAzP/XlUAMm9V4NFGhuNaYwUOrL/4nXeWSFM
 cra6uHcONS5BjCCa27Q5ONU=
X-Google-Smtp-Source: ABdhPJx4zC0jWZjFIemZzvDFcVm9GKPUDhr83QMyNpXVnbVvGaXglRygdtrdwLULRDKeicPaINru+g==
X-Received: by 2002:a17:90b:4ad2:: with SMTP id
 mh18mr8093265pjb.0.1604843006189; 
 Sun, 08 Nov 2020 05:43:26 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:42f:431f:a8c7:19b8:cb80:f5a3])
 by smtp.googlemail.com with ESMTPSA id gc17sm8188020pjb.47.2020.11.08.05.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Nov 2020 05:43:25 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: joe@perches.com
Date: Sun,  8 Nov 2020 19:13:17 +0530
Message-Id: <20201108134317.25400-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: add fix for BAD_SIGN_OFF
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

Currently, checkpatch warns us if the author of the commit signs-off
as co-developed-by.
E.g. for commit 6e88559470f5 ("Documentation: Add section about
CPU vulnerabilities for Spectre") we get:

WARNING: Co-developed-by: should not be used to attribute nominal
patch author 'Tim Chen <tim.c.chen@linux.intel.com>'
Co-developed-by: Tim Chen <tim.c.chen@linux.intel.com>

Provide a simple fix by removing the co-developed-by line from the
commit message

A quick evaluation on v4.13..v5.8 showed that this fix was getting
triggered 6 times.
A quick manual check found out that all fixes were correct in those
cases.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 scripts/checkpatch.pl | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 58095d9d8f34..1030d4fc2abf 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2827,8 +2827,11 @@ sub process {
 # Check Co-developed-by: immediately followed by Signed-off-by: with same name and email
 			if ($sign_off =~ /^co-developed-by:$/i) {
 				if ($email eq $author) {
-					WARN("BAD_SIGN_OFF",
-					      "Co-developed-by: should not be used to attribute nominal patch author '$author'\n" . "$here\n" . $rawline);
+					if (WARN("BAD_SIGN_OFF",
+						 "Co-developed-by: should not be used to attribute nominal patch author '$author'\n" . "$here\n" . $rawline) &&
+					    $fix) {
+						fix_delete_line($fixlinenr, $rawline);
+					}
 				}
 				if (!defined $lines[$linenr]) {
 					WARN("BAD_SIGN_OFF",
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
