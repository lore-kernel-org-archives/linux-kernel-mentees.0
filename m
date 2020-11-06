Return-Path: <SRS0=GHoo=EM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDF89C55179
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Nov 2020 21:46:06 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4464220735
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Nov 2020 21:46:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JZmP0ONh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4464220735
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B67E420434;
	Fri,  6 Nov 2020 21:46:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Go72lcJ53wZL; Fri,  6 Nov 2020 21:46:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 442B12040F;
	Fri,  6 Nov 2020 21:46:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2C21FC088B;
	Fri,  6 Nov 2020 21:46:04 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B7D2AC0889
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 21:46:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id ABAED869AB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 21:46:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OAHexfeQ4SaU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 21:46:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by whitealder.osuosl.org (Postfix) with ESMTPS id AD77585329
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 21:46:00 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id e21so1960608pgr.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 06 Nov 2020 13:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JQd258nAXtkhBpfrjQtJmjO7+TGrIP+ES5n2twCl6tA=;
 b=JZmP0ONhTyrQEcVUI+jx7+Z+WvLToeoecviiEqdPZum3UOtb+R/brE78oo3G4JxlCm
 J7hrFtXvqd0Vn4mskAyGy+v1egvzI5N/0Kp410tlJaur1+B/KNGrKJBu4I/1vJn/eW+Z
 HrmjgxqL7xBsQJgDK1By1vCsZk1TybGOzfArLHKew1XXxYNZIQBKSrjiPBpKc1v/9GBL
 9o4g77rWuZxmvmynbGebtfkVmvI9s16PTPb26yPR3SN0lAoS3hF7o27JYbYHJG9Xj1EW
 RzusZYogtmNAA9aNRtVCdwhxpxwZkAXljAtHsocOzfnHbeUuDCanrUcLTwv1dYhinkQh
 eowQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JQd258nAXtkhBpfrjQtJmjO7+TGrIP+ES5n2twCl6tA=;
 b=ddNjL4yz5VofmQI/5cSPkbwAzV/kJA1OoXHq5e5/T4uEeEYc0+Rs4VjkpEBGVHv5Ez
 LT0KdxQpr4YiShao1JUekHS2KJZm/socOVtCArDZTA6AX96DaP2CsiNiKNg1w+DcWUdy
 mxPuBOJ3QsRdX7OsPMqDBwqRrugs5VGTY6jHT0XR/mj6g+8Hve6J5swtpRl40TKESgwG
 xXRCzfx9RlFognaa19jbLNWqud3XfYJTJdVh+s/EwWWVCfsiYv6LbzPfK6hcLNqVaO9e
 fIMPiimTZmEKDkcRtTlE4QVNHHTkAHBElT4jNmuHGjUc/VL9KcPNeDBUu4aVkp5nOlh8
 MmBA==
X-Gm-Message-State: AOAM5312fbAWBtbH9hvjGiGywH6tUovQa/TJJS3PhWsG6qeLf8h7OvRT
 cSHa5STCW+OIN68q7nsbbRY=
X-Google-Smtp-Source: ABdhPJx4ffbvc4iL7gdpnXvyWDpJzQEMdMNsuTqK06B4RuLmreUlNRWJrv/kwXLgR3XLNooBDyENkQ==
X-Received: by 2002:a17:90b:2343:: with SMTP id
 ms3mr1652613pjb.130.1604699160051; 
 Fri, 06 Nov 2020 13:46:00 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:60c3:15ce:d78:bdc8:182f])
 by smtp.gmail.com with ESMTPSA id
 i123sm3273075pfc.13.2020.11.06.13.45.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 13:45:59 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Sat,  7 Nov 2020 03:15:30 +0530
Message-Id: <20201106214530.367247-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, yashsri421@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v4] checkpatch: improve email parsing
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

checkpatch doesn't report warnings for many common mistakes
in emails. Some of which are trailing commas and incorrect
use of email comments.

At the same time several false positives are reported due to
incorrect handling of mail comments. The most common of which
is due to the pattern:

<stable@vger.kernel.org> # X.X

Improve email parsing in checkpatch.

Some general email rules are defined:

- Multiple name comments should not be allowed.
- Comments inside address should not be allowed.
- In general comments should be enclosed within parentheses.
  Relaxation is given to comments beginning with #.
- Stable addresses should not begin with a name.
- Comments in stable addresses should begin only
  with a #.

Improvements to parsing:

- Detect and report unexpected content after email.
- Quoted names are excluded from comment parsing.
- Trailing dots, commas or quotes in email are removed during
  formatting. Correspondingly a BAD_SIGN_OFF warning
  is emitted.
- Improperly quoted email like '"name <address>"' are now
  warned about.

In addition, added fixes for all the possible rules.

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 97 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 80 insertions(+), 17 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index fab38b493cef..d866c4321182 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1152,6 +1152,7 @@ sub parse_email {
 	my ($formatted_email) = @_;
 
 	my $name = "";
+	my $quoted = "";
 	my $name_comment = "";
 	my $address = "";
 	my $comment = "";
@@ -1183,14 +1184,20 @@ sub parse_email {
 		}
 	}
 
-	$comment = trim($comment);
-	$name = trim($name);
-	$name =~ s/^\"|\"$//g;
-	if ($name =~ s/(\s*\([^\)]+\))\s*//) {
-		$name_comment = trim($1);
+	# Extract comments from names excluding quoted parts
+	# "John A. (Kennedy)" - Do not extract
+	if ($name =~ s/\"(.+)\"//) {
+		$quoted = $1;
+	}
+	while ($name =~ s/\s*($balanced_parens)\s*/ /) {
+		$name_comment .= trim($1);
 	}
+	$name =~ s/^[ \"]+|[ \"]+$//g;
+	$name = trim("$quoted $name");
+
 	$address = trim($address);
 	$address =~ s/^\<|\>$//g;
+	$comment = trim($comment);
 
 	if ($name =~ /[^\w \-]/i) { ##has "must quote" chars
 		$name =~ s/(?<!\\)"/\\"/g; ##escape quotes
@@ -1205,17 +1212,20 @@ sub format_email {
 
 	my $formatted_email;
 
-	$name_comment = trim($name_comment);
-	$comment = trim($comment);
-	$name = trim($name);
-	$name =~ s/^\"|\"$//g;
+	$name =~ s/^[ \"]+|[ \"]+$//g;
 	$address = trim($address);
+	$address =~ s/(?:\.|\,|\")+$//; ##trailing commas, dots or quotes
 
 	if ($name =~ /[^\w \-]/i) { ##has "must quote" chars
 		$name =~ s/(?<!\\)"/\\"/g; ##escape quotes
 		$name = "\"$name\"";
 	}
 
+	$name_comment = trim($name_comment);
+	$name_comment = " $name_comment" if length($name_comment) > 0;
+	$comment = trim($comment);
+	$comment = " $comment" if length($comment) > 0;
+
 	if ("$name" eq "") {
 		$formatted_email = "$address";
 	} else {
@@ -1233,15 +1243,11 @@ sub reformat_email {
 }
 
 sub same_email_addresses {
-	my ($email1, $email2, $match_comment) = @_;
+	my ($email1, $email2) = @_;
 
 	my ($email1_name, $name1_comment, $email1_address, $comment1) = parse_email($email1);
 	my ($email2_name, $name2_comment, $email2_address, $comment2) = parse_email($email2);
 
-	if ($match_comment != 1) {
-		return $email1_name eq $email2_name &&
-		       $email1_address eq $email2_address;
-	}
 	return $email1_name eq $email2_name &&
 	       $email1_address eq $email2_address &&
 	       $name1_comment eq $name2_comment &&
@@ -2704,7 +2710,7 @@ sub process {
 			$signoff++;
 			$in_commit_log = 0;
 			if ($author ne ''  && $authorsignoff != 1) {
-				if (same_email_addresses($1, $author, 1)) {
+				if (same_email_addresses($1, $author)) {
 					$authorsignoff = 1;
 				} else {
 					my $ctx = $1;
@@ -2800,9 +2806,66 @@ sub process {
 				$dequoted =~ s/" </ </;
 				# Don't force email to have quotes
 				# Allow just an angle bracketed address
-				if (!same_email_addresses($email, $suggested_email, 0)) {
+				if (!same_email_addresses($email, $suggested_email)) {
+					if (WARN("BAD_SIGN_OFF",
+					    "email address '$email' might be better as '$suggested_email'\n" . $herecurr) &&
+					    $fix) {
+						$fixed[$fixlinenr] =~ s/\Q$email\E/$suggested_email/;
+					}
+				}
+
+				# Address part shouldn't have comments
+				my $stripped_address = $email_address;
+				$stripped_address =~ s/\([^\(\)]*\)//g;
+				if ($email_address ne $stripped_address) {
+					if (WARN("BAD_SIGN_OFF",
+					    "address part of email should not have comments: '$email_address'\n" . $herecurr) &&
+					    $fix) {
+						$fixed[$fixlinenr] =~ s/\Q$email_address\E/$stripped_address/;
+					}
+				}
+
+				# Only one name comment should be allowed
+				my $comment_count = () = $name_comment =~ /\([^\)]+\)/g;
+				if ($comment_count > 1) {
 					WARN("BAD_SIGN_OFF",
-					     "email address '$email' might be better as '$suggested_email'\n" . $herecurr);
+					     "Use a single name comment in email: '$email'\n" . $herecurr);
+				}
+
+
+				# stable@vger.kernel.org or stable@kernel.org shouldn't
+				# have an email name. In addition commments should strictly
+				# begin with a #
+				if ($email =~ /^.*stable\@(?:vger\.)?kernel\.org/) {
+					if ($sign_off =~ /cc:$/i && (($comment ne "" && $comment !~ /^#.+/) ||
+					    ($email_name ne ""))) {
+						my $cur_name = $email_name;
+						my $new_comment = $comment;
+
+						$cur_name =~ s/[a-zA-Z\s\-\"]+//g;
+						$new_comment =~ s/^[\s\#\(\[]+|[\s\)\]]+$//g;
+						$new_comment = trim("$new_comment $cur_name") if $cur_name ne $new_comment;
+						$new_comment = " # $new_comment" if length($new_comment) > 0;
+						my $new_email = "$email_address$new_comment";
+
+						if (WARN("BAD_SIGN_OFF",
+						    "Invalid email format for stable: '$email', prefer '$new_email'\n" . $herecurr) &&
+						    $fix) {
+							$fixed[$fixlinenr] =~ s/\Q$email\E/$new_email/;
+						}
+					}
+				} else {
+					if ($comment ne "" && $comment !~ /^(?:#.+|\(.+\))$/) {
+						if (WARN("BAD_SIGN_OFF",
+						    "Unexpected content after email: '$email'\n" . $herecurr) &&
+						    $fix) {
+							my $new_comment = $comment;
+							$new_comment =~ s/^(?:\/\*|\.|\,)//g;
+							$new_comment =~ s/^[\s\{\[]+|[\s\}\]]+$//g;
+							$new_comment = " ($new_comment)" if length($new_comment) > 0;
+							$fixed[$fixlinenr] =~ s/\s*\Q$comment\E$/$new_comment/;
+						}
+					}
 				}
 			}
 
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
