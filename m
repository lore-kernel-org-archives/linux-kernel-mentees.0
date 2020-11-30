Return-Path: <SRS0=9pg8=FE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 282C0C63777
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Nov 2020 09:11:01 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78CDC2074A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Nov 2020 09:11:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vUsFZJkj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78CDC2074A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0779F86CE6;
	Mon, 30 Nov 2020 09:11:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HrCG6sZ45cNl; Mon, 30 Nov 2020 09:10:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 43BEC86CC1;
	Mon, 30 Nov 2020 09:10:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1E37DC0859;
	Mon, 30 Nov 2020 09:10:57 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2AD5DC0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 09:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 18F19873BF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 09:10:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EDoa2DtTleVz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 09:10:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 77E5B873BE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 09:10:52 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id w202so9980275pff.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 01:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vp1UjA5b9iBMvCva/GTPQT8GBuBUjUwESyb+0XNUQHk=;
 b=vUsFZJkjljQRsf9VNi2Ik/OOCnpFaA9u+T+dZ3uLQxbig+bKcH8QHlpPjMdRkRsfxd
 uY+XECfpydm0V5nzLb3LPKqPejeCdi3SqQ1eMxhyTbDVp12O8my2yaI6S1xk/F62gG+z
 cLnKUmG/GIa6sE6PiraFvPdBIOn94olLZESrADS5XL20qKNMnB8ptlq8xGjAHU9B7XF9
 fq+4TZgC1hY89HS46clIWjLZKAXMBJMc2VyNV0i1pi0KRmou0MHdeaYJ/qNVrKgeCU4K
 u9xMoWxwjAtOcsBnxXikWChGpGJP7wHXhYsc/9tdDV+VwHYDmQdoLYB3/yk9en/sENx1
 HBRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=vp1UjA5b9iBMvCva/GTPQT8GBuBUjUwESyb+0XNUQHk=;
 b=hfNv83iaRtqkWT3C/IIXhS9XYoo9ENx/0IsH7eXiSj/rCPZPTif6NtDpwmDgOWhljP
 Hd6wktX5C1TOIK5dSw6qr+CL1mBVAq0EfAzWDoiSu1HM5JFJIZSWBELX+XYeWARxEN7S
 Ew67C5/7fVZlKvcGaFX8MZitxEljG1X+hAKcYpCrs0XgxFCVnwVQdHPJ647GWeeAIshV
 nr9PFpjlZEI+9HE82dJ6E9HEBRm52iHqUWSBJ//Q0KCvqF6Gdqw/EU+3W9taZssIhmNu
 nKKWbj8h6e80JA+hVeUPjNLsKPKg+57jU1Gkhv5WW55XXtw6/Wcs/uoPt8e/cwv/f6z8
 Hk6A==
X-Gm-Message-State: AOAM530TdjZ4bTccEp7xIYxeQdY3ZS7g2Jx8l9azg9rLI7kObzA6+/L/
 rFydHoMHNwKm2Xzy8qb1jiI=
X-Google-Smtp-Source: ABdhPJzQl1jY6Z9l133uc1HNol3T7kcSrpSQR4y0UOJo2FSrlKImdeFFgyjdXofTzMKR/N+dirFEsw==
X-Received: by 2002:aa7:8dc1:0:b029:197:5d15:279d with SMTP id
 j1-20020aa78dc10000b02901975d15279dmr17245610pfr.71.1606727451760; 
 Mon, 30 Nov 2020 01:10:51 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:419:6b90:c59c:7043:caf9:832d])
 by smtp.googlemail.com with ESMTPSA id
 y188sm15852589pfy.98.2020.11.30.01.10.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 01:10:51 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: joe@perches.com
Date: Mon, 30 Nov 2020 14:40:42 +0530
Message-Id: <20201130091042.14987-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <21acc492ab37acc42390abffb61aed370a22118.camel@perches.com>
References: <21acc492ab37acc42390abffb61aed370a22118.camel@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH v3] Currently checkpatch warns us if
	there is no 'Signed-off-by' line for the patch.
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

E.g., running checkpatch on commit 9ac060a708e0 ("leaking_addresses:
Completely remove --version flag") reports this error:

ERROR: Missing Signed-off-by: line(s)

Provide a fix by adding a Signed-off-by line corresponding to the author
of the patch before the patch separator line.

Also, avoid this fix with the Non-standard signature warning, as the
missing sign off is most likely because of typo.

E.g. for commit 8cde5d5f7361 ("bus: ti-sysc: Detect omap4 type timers
for quirk") we get missing sign off as well as bad sign off warnings for:

Siganed-off-by: Tony Lindgren <tony@atomide.com>

Here it is probably best to fix the typo with BAD_SIGN_OFF warning and
avoid adding an additional signoff.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
applies over next-20201120 and my last changes at:https://lore.kernel.org/linux-kernel-mentees/db1195235752685fc85fb52ecb1b1af3f35b5394.camel@perches.com/T/#u

Changes in v2:
  Add space after 'if'
  Add check for $patch_separator_linenr to be greater than 0

Changes in v3:
  Give MISSING_SIGN_OFF warning irrespective of the value of $non_standard_signature, add check with fix option instead
  Modify commit message accordingly

 scripts/checkpatch.pl | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 4a026926139f..3abf34bb9b00 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2462,6 +2462,8 @@ sub process {
 
 	my $last_blank_line = 0;
 	my $last_coalesced_string_linenr = -1;
+	my $patch_separator_linenr = 0;
+	my $non_standard_signature = 0;
 
 	our @report = ();
 	our $cnt_lines = 0;
@@ -2813,6 +2815,10 @@ sub process {
 		if ($line =~ /^---$/) {
 			$has_patch_separator = 1;
 			$in_commit_log = 0;
+			# to add missing signed-off-by line before diff(s)
+			if ($patch_separator_linenr == 0) {
+				$patch_separator_linenr = $linenr;
+			}
 		}
 
 # Check if MAINTAINERS is being updated.  If so, there's probably no need to
@@ -2842,6 +2848,7 @@ sub process {
 						$fixed[$fixlinenr] =~ s/$sign_off/$suggested_signature/;
 					}
 				}
+				$non_standard_signature = 1;
 			}
 			if (defined $space_before && $space_before ne "") {
 				if (WARN("BAD_SIGN_OFF",
@@ -7188,8 +7195,11 @@ sub process {
 	}
 	if ($is_patch && $has_commit_log && $chk_signoff) {
 		if ($signoff == 0) {
-			ERROR("MISSING_SIGN_OFF",
-			      "Missing Signed-off-by: line(s)\n");
+			if (ERROR("MISSING_SIGN_OFF",
+				  "Missing Signed-off-by: line(s)\n") &&
+			    $fix && !$non_standard_signature && $patch_separator_linenr > 0) {
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
