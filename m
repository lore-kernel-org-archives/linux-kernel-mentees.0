Return-Path: <SRS0=CDUK=EG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B742C388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 31 Oct 2020 13:26:09 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA135206B5
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 31 Oct 2020 13:26:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hg7eSqGJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA135206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 78ADB8718F;
	Sat, 31 Oct 2020 13:26:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nu4GmQOiAG1u; Sat, 31 Oct 2020 13:26:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1B3978714E;
	Sat, 31 Oct 2020 13:26:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E7DEDC1AD8;
	Sat, 31 Oct 2020 13:26:07 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E6D79C1AD9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 13:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B3A138714E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 13:26:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yCPLC1YXq14q
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 13:26:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D7A47871C8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 13:26:05 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id f21so4390932plr.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 06:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=0hWZDcUTYlump+9ewKbPLwES33ljD/aOCIpVJgr+dWk=;
 b=hg7eSqGJhd3q1T0n8a2hFnuityMjPB0H7J9aeFqLWyjgwSx7OfPcetySUni35X5eVn
 zxb/UB+Wwil9RvkmzcadTjyoSqaT2AWfkjkUNt8RIr3m9mPRIiRd7RyJjFTNB7WvjCi6
 r8PgMHj9rJzfGz+UvanJ7lnexoNoWT2svRwtEisyTc49bOBW3h3T/EDHBdOeP//GFU93
 RllxFIJIDzIoeox1LaL02kB7j49JGsp51H8Hs575ZqxeIcmGiGUudMVIXiqF1xIgtwuR
 8/7MI/q90VLBtAqItxWme188Q2P/HIMGjtVBRr5OlX8P/MI/u8t6OxoksApzu/P/IYEN
 czXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=0hWZDcUTYlump+9ewKbPLwES33ljD/aOCIpVJgr+dWk=;
 b=FGhR/PVfSgXFNU9E1jkDsGSd1IGlCS6zZlNAlx6o+1EpyoZKP7AxCzGp86fw0EHZ06
 b75eucgXn0LjwWdGCJAfx591lLd3KM8fyaPRuoKPWsdS7RK9RGwxjjVdwc/DAQR6x4nb
 akOVjSz4PYoz/pGOc/4B0DylX/PnGB2NfUWfORxIKmQ8XUolVjKawx+kH0/M298FQ7N5
 o8WS2aBazJs0SAG+bg/0Kyy8EJ5mmLgwPAp8wsZymqNPUG5omtRqhSFBrj2qxqvtlgr/
 YoxLbDJPZRVRQkxJmrJ+JpBiYlLEhIaPLXIClz3Ihhj/NyF0tl8kUU2h0Rwx1ddqSU2X
 ixUA==
X-Gm-Message-State: AOAM532R3hv1+fuFZLukx8RRIDUwddHeID/yXErOLlUCTxOmpcG9MeIH
 dAGSK6F08/6N+5DzNAALqqc=
X-Google-Smtp-Source: ABdhPJzkbnFLvks3B3T9uyZzFtchgajgPoi5vfsN1Coxb/50h+K3Sm7HipqK2j5ie4rNxQLaQ5Nqcg==
X-Received: by 2002:a17:90a:c282:: with SMTP id
 f2mr8774871pjt.170.1604150765391; 
 Sat, 31 Oct 2020 06:26:05 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:41a:4007:2dbb:cea1:e3c5:6a3])
 by smtp.googlemail.com with ESMTPSA id
 z185sm8602479pfz.32.2020.10.31.06.26.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2020 06:26:04 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Sat, 31 Oct 2020 18:55:56 +0530
Message-Id: <20201031132556.10379-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Aditya Srivastava <yashsri421@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: add fix option for
	COMMIT_LOG_LONG_LINE
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

Currently, if a line exceeds 75 characters in a commit message,
checkpatch.pl gives a warning corresponding to the same.

E.g., running checkpatch on commit a1af2afbd244 ("drm/nouveau/volt:Fix
for some cards having 0 maximum voltage") reports this warning:

WARNING: Possible unwrapped commit description (prefer a maximum 75
chars per line)

Some, mostly Fermi, vbioses appear to have zero max voltage. That causes Nouveau to not parse voltage entries, thus users not being able to set higher clocks.

Fix this warning by truncating the line after 75 chars, and push the
remaining content to the next line

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 scripts/checkpatch.pl | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 5329927fc1c1..a0107ed257d1 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2881,8 +2881,20 @@ sub process {
 		      $line =~ /^\s*(?:Fixes:|Link:)/i ||
 					# A Fixes: or Link: line
 		      $commit_log_possible_stack_dump)) {
-			WARN("COMMIT_LOG_LONG_LINE",
-			     "Possible unwrapped commit description (prefer a maximum 75 chars per line)\n" . $herecurr);
+			if (WARN("COMMIT_LOG_LONG_LINE",
+			     	 "Possible unwrapped commit description (prefer a maximum 75 chars per line)\n" . $herecurr) &&
+			    $fix) {
+				fix_delete_line($fixlinenr, $rawline);
+				my $curr_line = $rawline;
+				my $fixedline;
+				while (length($curr_line) > 0) {
+					# trim current line for any unnecessary spaces
+					$curr_line = trim($curr_line);
+					$fixedline = substr($curr_line, 0, 75);
+					fix_insert_line($fixlinenr+1, $fixedline);
+					$curr_line =~ s/$fixedline//;
+				}
+			}
 			$commit_log_long_line = 1;
 		}
 
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
