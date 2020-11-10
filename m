Return-Path: <SRS0=mimn=EQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 988E9C388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 09:32:29 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4F5E20780
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 09:32:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qVCJvm9F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4F5E20780
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4270120513;
	Tue, 10 Nov 2020 09:32:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SWWEVEIdHEro; Tue, 10 Nov 2020 09:32:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2DA152050D;
	Tue, 10 Nov 2020 09:32:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1FFA8C088B;
	Tue, 10 Nov 2020 09:32:27 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A930EC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 09:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 97F4487163
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 09:32:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id shUxUthh6A9R
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 09:32:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B1E53870C6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 09:32:25 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id j5so6202989plk.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 01:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=A2SmRAA8D1b8Uf+IYDXWbTN66Sv/n0JmpFYCM0SGAvo=;
 b=qVCJvm9FrpQaIh0uzLAMQODs7Ma0u7WxG92Zd/32RkfKTJNId6Edf50v/sub+GPEnA
 S0i8uxdNul3B5B47imtzBbOfWUPKp02bcCYlnd4BdfWODt16fQl2VnBDJtEl36ZO+xtB
 69KuVyr3Ntky7KjBUv2EhBRMbSHZcbNrugRZP05pAG74VirLKeG7AtqOfzQYZnXnWDEj
 4Cb+8Nuk6GPuWzOilwrWHpaGkKXiGhxBCJQLAcq/k9YkLuEsRzQnOlfrlB7+VNFU1/Rk
 5QyRYQqNtGGY+AhLolEC+pgs6cMlPMKUsiXCfnorgQsGEy5ZrCm8v+GXsByqtaH5uLBb
 4hbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=A2SmRAA8D1b8Uf+IYDXWbTN66Sv/n0JmpFYCM0SGAvo=;
 b=ZEhb6+sY8ktc+WoT6CvuxBeXWQvpaqK4p1VW4Kd93QCZwuXegkLoFZIkPC7a2T1Zjw
 l86B4Po0arO7a4pD2xGlDapglWUu4fAPjrXuzObqKsDYkB6niNDUZqQYYmewgXfzD+8X
 +VUMd0oWidZACLMtHz8vQ/0l34IJiJvTDs6gpDsOZMCA+L6ZQDSdEnz9D8fV6DYZt16p
 TeLxRqHEo35+ScF+6LUAyEm1zZipY5HY3ki0o/hqj5kUJfEJGLE9Xrcycn9dEdFz5mmv
 Sn1Csu0G7R2pv2EGdFSkMW4vCnakT70ACqkSsNhBKr6GtYVQs4M4aNAe4Vs+1NbtVbg0
 PvOw==
X-Gm-Message-State: AOAM530lrZuogaDNbdcteLQezN80JoucQHb6U58IR1GInPkBVDJB6g11
 MdzWUqV0XA4JWtsOxYYWybo=
X-Google-Smtp-Source: ABdhPJyQ0QIR+lqs7fJq96bo6esWWwoaHIYuQ6wWVK7SGjXFS5eFsmOio2swNjTmx288RluzRNWjJw==
X-Received: by 2002:a17:902:a50f:b029:d6:da2:aaa7 with SMTP id
 s15-20020a170902a50fb02900d60da2aaa7mr16770217plq.42.1605000745185; 
 Tue, 10 Nov 2020 01:32:25 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:413:8adf:79d0:1679:313c:70a2])
 by smtp.googlemail.com with ESMTPSA id r6sm2592819pjo.0.2020.11.10.01.32.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 01:32:24 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Tue, 10 Nov 2020 15:02:16 +0530
Message-Id: <20201110093216.14291-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: add fix option for
	MISSING_SIGN_OFF
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

Currently checkpatch warns us if there is no 'Signed-off-by' line
for the patch.

E.g., running checkpatch on commit 9ac060a708e0 ("leaking_addresses:
Completely remove --version flag") reports this error:

ERROR: Missing Signed-off-by: line(s)

Provide a fix by adding a Signed-off-by line corresponding to the author
of the patch before the patch separator line. Also avoid this error for
the commits where some typo is present in the sign offs.

E.g. for commit 8cde5d5f7361 ("bus: ti-sysc: Detect omap4 type timers
for quirk") we get missing sign off as well as bad sign off for:
Siganed-off-by: Tony Lindgren <tony@atomide.com>

Here it is probably best to give BAD_SIGN_OFF warning for Non-standard
signature and avoid MISSING_SIGN_OFF

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 scripts/checkpatch.pl | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index cb46288127ac..849e4a510767 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2404,6 +2404,8 @@ sub process {
 
 	my $last_blank_line = 0;
 	my $last_coalesced_string_linenr = -1;
+	my $patch_separator_linenr = 0;
+	my $is_signed_off = 0;
 
 	our @report = ();
 	our $cnt_lines = 0;
@@ -2755,6 +2757,10 @@ sub process {
 		if ($line =~ /^---$/) {
 			$has_patch_separator = 1;
 			$in_commit_log = 0;
+			# to add missing sign off line before diff(s)
+			if($patch_separator_linenr == 0) {
+				$patch_separator_linenr = $fixlinenr;
+			}
 		}
 
 # Check if MAINTAINERS is being updated.  If so, there's probably no need to
@@ -2771,6 +2777,8 @@ sub process {
 			my $space_after = $3;
 			my $email = $4;
 			my $ucfirst_sign_off = ucfirst(lc($sign_off));
+			# to avoid missing_sign_off error as it most probably is a typo
+			$is_signed_off = 1;
 
 			if ($sign_off !~ /$signature_tags/) {
 				WARN("BAD_SIGN_OFF",
@@ -7118,9 +7126,12 @@ sub process {
 		      "Does not appear to be a unified-diff format patch\n");
 	}
 	if ($is_patch && $has_commit_log && $chk_signoff) {
-		if ($signoff == 0) {
-			ERROR("MISSING_SIGN_OFF",
-			      "Missing Signed-off-by: line(s)\n");
+		if ($signoff == 0 && !$is_signed_off) {
+			if (ERROR("MISSING_SIGN_OFF",
+				  "Missing Signed-off-by: line(s)\n") &&
+			    $fix) {
+				fix_insert_line($patch_separator_linenr, "Signed-off-by: $author");
+			}
 		} elsif ($authorsignoff != 1) {
 			# authorsignoff values:
 			# 0 -> missing sign off
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
