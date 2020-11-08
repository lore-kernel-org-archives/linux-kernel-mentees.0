Return-Path: <SRS0=ep41=EO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2AFCC55178
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Nov 2020 10:07:13 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80318206ED
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Nov 2020 10:07:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RVhR63zt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80318206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2EDEE866F4;
	Sun,  8 Nov 2020 10:07:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bm2UfqPg+ELP; Sun,  8 Nov 2020 10:07:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 68DBE866C8;
	Sun,  8 Nov 2020 10:07:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 594BFC0889;
	Sun,  8 Nov 2020 10:07:12 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CBC62C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Nov 2020 10:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B18BE866E3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Nov 2020 10:07:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1d0YWf3N+shO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Nov 2020 10:07:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A7976866C8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Nov 2020 10:07:09 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id m26so960517pgd.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 08 Nov 2020 02:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ad1WQa8ln8fqmJEMI++EgB7/ogu0ixy+FUkMF3j+aiE=;
 b=RVhR63ztPLCMmfkik7sJFikU9TYM5S9QqKqwS2TfHvVZ4Jykx9CGfz2gZVYgrxM5MX
 rxsrrFXsjJ/BB1Xj4yxtnkzxlfIcRNXj81D8TdZx1yM0mzut0zrCC3qRByEUJPukowzL
 AR/N8pw32Ugayo55H9M1AU1DH+oiv/9ywubXDRVPvFb7J6adYHI5CNQMt5CQXj3MjpZc
 GjZq0U6RLYAFJUvMhlPUBlK+X2MK9z7bV6lHON98aSs0PewadJpdgkWNBMDPmMzfNS+i
 CGwZ3WFl7vwSHu70N5mi1iettS7Iod0Vn0pM9OSGCvqVXqLyAVSZk0sgXFU9RTbf2BTM
 xpHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ad1WQa8ln8fqmJEMI++EgB7/ogu0ixy+FUkMF3j+aiE=;
 b=U17cFPkKIzSXHbgMSwYKkzOBgzmS8gzrOg+bC8dRfX8PEURmk1JN6zX3w1Ap1SALSw
 TqRGiL24B8rRH1lC607pRVuA8uADoHmYiXB56Ie856iUgXub8RbLKIxIEMFzYaMYLb/Z
 eAstWmAY7+QTrxxoR2Q+qIgvKI3hkOGccH8x/4BIiUg0mzyqacxT0kyNYuC1vVVlumSB
 ++m0lkQilGdbZPaP+9E8krtKrZbRaX4prqyTbpv0tLO3XgyOBJAC3gzsCxwvR4qTxlMs
 KTLQIe/wnP1REpyTZjEQhHisIiMSMDP3iiEXhLjWDdemm5BxnzEanZhcTBq9cMqan3L3
 WPng==
X-Gm-Message-State: AOAM531n+3QYAm0OpDnyk0LXfoe04t2O4ZI0Z7xBRrtXMXkN4NIbCjeQ
 wzkMqljTwA0kkVyARhk9src=
X-Google-Smtp-Source: ABdhPJysPH3v9IWbQ7zqMqDEP4bTLoTY8uiPaXHYf0G7MvdYW8Pf5chtFx22Q5dTWIrv1M9Z8kip9w==
X-Received: by 2002:aa7:8d05:0:b029:18b:6f5f:1ea with SMTP id
 j5-20020aa78d050000b029018b6f5f01eamr9451540pfe.38.1604830029171; 
 Sun, 08 Nov 2020 02:07:09 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:6086:c6ff:8523:6d2b:2dc7])
 by smtp.gmail.com with ESMTPSA id c19sm7866572pfp.1.2020.11.08.02.07.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Nov 2020 02:07:08 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Sun,  8 Nov 2020 15:36:32 +0530
Message-Id: <20201108100632.75340-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, yashsri421@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v5] checkpatch: improve email parsing
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

Link: https://lore.kernel.org/linux-kernel-mentees/6c275d95c3033422addfc256a30e6ae3dd37941d.camel@perches.com/
Link: https://lore.kernel.org/linux-kernel-mentees/20201105200857.GC1333458@kroah.com/
Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 108 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 91 insertions(+), 17 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index fab38b493cef..52d355387c44 100755
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
+	# "John D. (Doe)" - Do not extract
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
+	$name_comment = " $name_comment" if ($name_comment ne "");
+	$comment = trim($comment);
+	$comment = " $comment" if ($comment ne "");
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
@@ -2800,9 +2806,77 @@ sub process {
 				$dequoted =~ s/" </ </;
 				# Don't force email to have quotes
 				# Allow just an angle bracketed address
-				if (!same_email_addresses($email, $suggested_email, 0)) {
+				if (!same_email_addresses($email, $suggested_email)) {
+					if (WARN("BAD_SIGN_OFF",
+						 "email address '$email' might be better as '$suggested_email'\n" . $herecurr) &&
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
+						 "address part of email should not have comments: '$email_address'\n" . $herecurr) &&
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
+				if ($email =~ /^.*stable\@(?:vger\.)?kernel\.org/i) {
+					if (($comment ne "" && $comment !~ /^#.+/) ||
+					    ($email_name ne "")) {
+						my $cur_name = $email_name;
+						my $new_comment = $comment;
+						$cur_name =~ s/[a-zA-Z\s\-\"]+//g;
+
+						# Remove brackets enclosing comment text
+						# and # from start of comments to get comment text
+						$new_comment =~ s/^\((.*)\)$/$1/;
+						$new_comment =~ s/^\[(.*)\]$/$1/;
+						$new_comment =~ s/^[\s\#]+|\s+$//g;
+
+						$new_comment = trim("$new_comment $cur_name") if ($cur_name ne $new_comment);
+						$new_comment = " # $new_comment" if ($new_comment ne "");
+						my $new_email = "$email_address$new_comment";
+
+						if (WARN("BAD_STABLE_ADDRESS_STYLE",
+							 "Invalid email format for stable: '$email', prefer '$new_email'\n" . $herecurr) &&
+						    $fix) {
+							$fixed[$fixlinenr] =~ s/\Q$email\E/$new_email/;
+						}
+					}
+				} elsif ($comment ne "" && $comment !~ /^(?:#.+|\(.+\))$/) {
+					my $new_comment = $comment;
+
+					# Extract comment text from within brackets or
+					# c89 style /*...*/ comments
+					$new_comment =~ s/^\[(.*)\]$/$1/;
+					$new_comment =~ s/^\/\*(.*)\*\/$/$1/;
+
+					$new_comment = trim($new_comment);
+					$new_comment =~ s/^[^\w]$//; # Single lettered comment with non word character is usually a typo
+					$new_comment = "($new_comment)" if ($new_comment ne "");
+					my $new_email = format_email($email_name, $name_comment, $email_address, $new_comment);
+
+					if (WARN("BAD_SIGN_OFF",
+						 "Unexpected content after email: '$email', should be: '$new_email'\n" . $herecurr) &&
+					    $fix) {
+						$fixed[$fixlinenr] =~ s/\Q$email\E/$new_email/;
+					}
 				}
 			}
 
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
