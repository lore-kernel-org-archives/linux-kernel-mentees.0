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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8591C388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 13:06:14 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D85CC20674
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 13:06:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bg3Y0qLF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D85CC20674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 49CBE86F8D;
	Tue, 10 Nov 2020 13:06:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SoPRVAfzQwx1; Tue, 10 Nov 2020 13:06:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B6E0286ECC;
	Tue, 10 Nov 2020 13:06:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A3C3EC0889;
	Tue, 10 Nov 2020 13:06:12 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E32C6C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 13:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DDE24850E1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 13:06:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NZue-R6w9f9A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 13:06:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A759C84E24
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 13:06:10 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id x13so11359485pfa.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 05:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Zwu2Ec3fIzUJmotdZkFkitFa11zJKebILLcfhgoCK+4=;
 b=bg3Y0qLFC+FYB3M0bR5jD6xUvJ9jEqbKkL13ikmwpASu2gOiNLCHEtCBIuT7FXx6kz
 GPtDRPYObb109stmbAS9W7pZQ7g5FSZf1qOcQlER/fMlda+Q/9ROUfKoc7I3P4WFdXpU
 AJWkr0nTNGlwN/tb2jOO91sc9pG1WMJ0VLKzYyp6hEjmFYEBy7gsG4wrheP1SgavYbJp
 bZ+EJqv2ZdE3P83holH8gAi9+E5dEl1J38lXWvcHYiskeEg2CfV2uEwrPfPT7PAoxUbI
 yTjti05fbF6wLmNhpUN9pLRJmGJmttDojIp2aiYcN9Q973E9xcIAHsHL08eHUJsO/21y
 /SrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Zwu2Ec3fIzUJmotdZkFkitFa11zJKebILLcfhgoCK+4=;
 b=ZqAEvOK3B+tkOm6DbJY9SnLqeQLmLejCh2Q1EDl/FqwTv+LMLrWPSREMqVV2IIJW+x
 4T1I3EwwKfEHNT1M5KM84ZYWTOhrzEduh/jyk4ZUheJn33mP0iqZTui430pjVgA3cwMz
 gxoslYds6enkf1+NaAb/HqT4KstM4wzfkTUQmwTDcGokYOx/l5VYW2HF98wFVQnDItSH
 ssBTqaGtJAqorageVfVgggWQou+xok45m9Zl+RCq+0Iv2yaEfcoyyV05u5i/qoSyZDRF
 7A8U0nalqZ0m6ucnFt4Xyowz81uWmNHtXVHK96OgxxcTeOBHZpRhFDo8x3mrktEHL+tL
 wv/g==
X-Gm-Message-State: AOAM532obt1j+9Gt90ZPykQmGmKkjFqUCRy9hgz6FmB2ZRdHxpNBcAlj
 UB5lbD66J83El+eUgSFOiB4=
X-Google-Smtp-Source: ABdhPJw6ei4XxEIyPDzmwdztXpQU2mAqFZS0egKgMHBU6VaNK1HZmWu72dO+wNQD/6VRWLTRH3xBkg==
X-Received: by 2002:a17:90a:5d90:: with SMTP id
 t16mr4815301pji.24.1605013570081; 
 Tue, 10 Nov 2020 05:06:10 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:413:8adf:79d0:1679:313c:70a2])
 by smtp.googlemail.com with ESMTPSA id q11sm13273088pgm.79.2020.11.10.05.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 05:06:09 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Tue, 10 Nov 2020 18:36:02 +0530
Message-Id: <20201110130602.22359-1-yashsri421@gmail.com>
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
the commits where some typo is present in the sign off.

E.g. for commit 8cde5d5f7361 ("bus: ti-sysc: Detect omap4 type timers
for quirk") we get missing sign off as well as bad sign off for:

Siganed-off-by: Tony Lindgren <tony@atomide.com>

Here it is probably best to give BAD_SIGN_OFF warning for Non-standard
signature and avoid MISSING_SIGN_OFF

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
This patch was made after applying https://lore.kernel.org/linux-kernel-mentees/20201108100632.75340-1-dwaipayanray1@gmail.com/
and my last changes at https://lore.kernel.org/linux-kernel-mentees/20201108134317.25400-1-yashsri421@gmail.com/

 scripts/checkpatch.pl | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index cb46288127ac..2deffd0c091b 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2404,6 +2404,8 @@ sub process {
 
 	my $last_blank_line = 0;
 	my $last_coalesced_string_linenr = -1;
+	my $patch_separator_linenr = 0;
+	my $non_standard_signature = 0;
 
 	our @report = ();
 	our $cnt_lines = 0;
@@ -2755,6 +2757,10 @@ sub process {
 		if ($line =~ /^---$/) {
 			$has_patch_separator = 1;
 			$in_commit_log = 0;
+			# to add missing sign off line before diff(s)
+			if($patch_separator_linenr == 0) {
+				$patch_separator_linenr = $linenr;
+			}
 		}
 
 # Check if MAINTAINERS is being updated.  If so, there's probably no need to
@@ -2775,6 +2781,9 @@ sub process {
 			if ($sign_off !~ /$signature_tags/) {
 				WARN("BAD_SIGN_OFF",
 				     "Non-standard signature: $sign_off\n" . $herecurr);
+
+				# to avoid missing_sign_off error as it most probably is just a typo
+				$non_standard_signature = 1;
 			}
 			if (defined $space_before && $space_before ne "") {
 				if (WARN("BAD_SIGN_OFF",
@@ -7118,9 +7127,12 @@ sub process {
 		      "Does not appear to be a unified-diff format patch\n");
 	}
 	if ($is_patch && $has_commit_log && $chk_signoff) {
-		if ($signoff == 0) {
-			ERROR("MISSING_SIGN_OFF",
-			      "Missing Signed-off-by: line(s)\n");
+		if ($signoff == 0 && !$non_standard_signature) {
+			if (ERROR("MISSING_SIGN_OFF",
+				  "Missing Signed-off-by: line(s)\n") &&
+			    $fix) {
+				fix_insert_line($patch_separator_linenr - 1, "Signed-off-by: $author");
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
