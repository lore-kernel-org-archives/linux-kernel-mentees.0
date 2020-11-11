Return-Path: <SRS0=RhO4=ER=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55EADC4742C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Nov 2020 09:01:58 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A22A6206E3
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Nov 2020 09:01:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dp8Mbx7d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A22A6206E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id F2B4C87198;
	Wed, 11 Nov 2020 09:01:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zaaqs7Lhs1jC; Wed, 11 Nov 2020 09:01:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 640C884794;
	Wed, 11 Nov 2020 09:01:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5C8E7C088B;
	Wed, 11 Nov 2020 09:01:56 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 70758C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 09:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5295523039
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 09:01:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k5DSA18f23eJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 09:01:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by silver.osuosl.org (Postfix) with ESMTPS id 75B51214FD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 09:01:52 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id 62so1018275pgg.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 01:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ZvE414n0h/SmbnlBo0DI3+dcCiuwLX2TAnqhW16Qji4=;
 b=Dp8Mbx7dscApf3G52JFH1lkb+gNXx9FmiGHYXQ07t87qoFgVfSmJG2Z9Ky3KOuAugk
 lAp5oUhDFBIMStnb8+ZG5J1r4yTzpd050BRieOTOmnnbC3x4i+IsvlVCfCy5N9fm1EgS
 PY05bb2qAHCeQ0PG313qloVs7Ryfu8qlcIztbroU7EsBIZCGzRrqk9rbgkPgfMvOFhBm
 R++bvH1NMhSznuslyTvEmRhwWZ/ArdNnIb6ZDkTf/HvHg4mt+BvSeFsF/N9XgcpixrJ/
 LHF1PgqcuJjCQ98Ze8ZFaTSlPpXZvl+0/Hz6ZZYuuMkGXQQnrdOBzFRul2fzpAqGWQi/
 fYCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ZvE414n0h/SmbnlBo0DI3+dcCiuwLX2TAnqhW16Qji4=;
 b=onvx5TeG/XvInupFFXxeBy4CJn/mWpkCR/lYZ/ZzCf6TKdbsza6X/cP6+yEcgQ+gKk
 p7rN0n7s36srn+SjEOGBikQa6xw45/YUNxUgUnq6VDCyE7BJhcpMSEuUDvdhSjNdmyNw
 2ES9qyAOCnrnO0ERdMQuBECJs43Ajgaxzp9O4mLi6UR3e6wax0EAQFYYUsNwKu3WwJam
 5kG6LPyTrBNS9or1anXY6eDVmPkna5Hf9/ASLWmuuVRyIF6Dt4oUo/eCg7fT9lI/qp/N
 d4CJm8g/ZobAJPR9k1Q11w+1cmjWGNX1/AqA0Gd1OoTqC071zqbPB2eQuO13kGOCrBi8
 3yEw==
X-Gm-Message-State: AOAM532oVEmoDaHGnX6n0wmvUurBTos7gtp6XC5Mr+hmi+G0XpKlwnWU
 +7bJLxmMcHdzLddwyjcuQNg=
X-Google-Smtp-Source: ABdhPJwar0e1mqK2loFZz/NZNHzxXWeeS/A27pWx17sJ2XOD7kDS+IQgi5cN6S4NrdKGMMB/t/F40g==
X-Received: by 2002:aa7:9903:0:b029:18b:9271:a468 with SMTP id
 z3-20020aa799030000b029018b9271a468mr22324477pff.11.1605085311951; 
 Wed, 11 Nov 2020 01:01:51 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:41c:a166:90d7:ac69:6d50:789e])
 by smtp.googlemail.com with ESMTPSA id ji2sm1682914pjb.35.2020.11.11.01.01.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 01:01:51 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: joe@perches.com
Date: Wed, 11 Nov 2020 14:31:43 +0530
Message-Id: <20201111090143.9230-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH v2] checkpatch: add fix option for
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
Changes in v2:
Add space after 'if'
Add check for $patch_separator_linenr to be greater than 0

 scripts/checkpatch.pl | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index cb46288127ac..ac7e5ac80b58 100755
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
+			if ($patch_separator_linenr == 0) {
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
+			    $fix && $patch_separator_linenr > 0) {
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
