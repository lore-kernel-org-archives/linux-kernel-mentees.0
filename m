Return-Path: <SRS0=AIAE=EJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F8EC388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Nov 2020 05:48:47 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B62722277
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Nov 2020 05:48:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T1/EcaPJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B62722277
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 30C98872A2;
	Tue,  3 Nov 2020 05:48:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z3t-FPLTJSsV; Tue,  3 Nov 2020 05:48:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8E201871BA;
	Tue,  3 Nov 2020 05:48:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 76237C088B;
	Tue,  3 Nov 2020 05:48:45 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 42283C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 05:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2655686968
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 05:48:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bghXQNX9Qq0H
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 05:48:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 75F5686961
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 05:48:40 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id f21so8043809plr.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Nov 2020 21:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mR1QkDyPTyXg0sfV86lfe9Sb5xsrO/S7r01fQ+mnp6Q=;
 b=T1/EcaPJZSf64kQx/eeiXOxrDxi5NedAfCmLUzI68doU3cKMYX0i/pynTGah3jEmWp
 qtIayvkROX6ldtNFhSZAqyth4RKR1zCduetEhHg0HOJVXqA6MC3DPR5Tf/Rkvg3EDEI4
 h/a4LCEbLVqHmkyetn4hhHOdUSn4hShI9ubdeGt8KjiduGFFYkR1SsoHXUdhnXvNPlo/
 8HcxpoCH0SGvGPDq63VTou77H0WrWZ7MTl7GOSEAamqtnvpQq8zoMDAL9EW/wwMz/RTt
 FYGEqRUMFtv/GGXrjIuaodgS4169EJN2wkg+yRXYdEg6k9n8e9CpJeB/ypaEyHSAa0yC
 CPSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mR1QkDyPTyXg0sfV86lfe9Sb5xsrO/S7r01fQ+mnp6Q=;
 b=DB1NUVMT+G4x/vVykjGWLisuyka2zvijPxEJIyAqNISauVef4dNtvsySoGimFvmwtX
 zY8SdnM3GfrFZUfRHRqhS8rnhI8v+NymPi6UG3H5DTbstf+Fl252l+V8IUuirCIWhAq/
 tRizEAuiRLq/0EJso89530ICtmkQJJ9YwcVTnSz4yE/82EuVMggMVSTVhaTNhdUfyeGX
 xFa9Go2YzLo5Zt9YW0vjAQvlAgSv4o2Tr2AGa3Z+9+SRbTm2+wwWm965kZefltaD2O6z
 p/ucsjvvMXffIyJ/mtsq4tCM43LLnG2fm2KpMDSCbs1pAgXH3xxx9l7nBrIiEDHGlFjO
 WldQ==
X-Gm-Message-State: AOAM530vVpcR7mrBLmDREOo30GdPvUfhDVkPPI2e0LdcWmDrGcpxPESi
 9m984Ku6Sj+6qFRStOTjtbo=
X-Google-Smtp-Source: ABdhPJwJ+t8XYHF2C4S4h0qHAV86mWJWEsbuLFK4FUIT6TKEv05JsmNehBIFFWQ49btQwLKp3NaErg==
X-Received: by 2002:a17:902:7408:b029:d6:8208:bc7 with SMTP id
 g8-20020a1709027408b02900d682080bc7mr23942194pll.82.1604382519915; 
 Mon, 02 Nov 2020 21:48:39 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:605e:3f8e:a675:34b8:3ea1])
 by smtp.gmail.com with ESMTPSA id s18sm14023643pgh.60.2020.11.02.21.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 21:48:39 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Tue,  3 Nov 2020 11:18:10 +0530
Message-Id: <20201103054810.21978-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, yashsri421@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v2] checkpatch: improve email parsing
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

Improve email parsing mechanism in checkpatch.

What is added:

- Support for multiple name/address comments.
- Improved handling of quoted names.
- Sanitize improperly formatted comments.
- Sanitize trailing semicolon or dot after email.

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 44 +++++++++++++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index fab38b493cef..9a9049480077 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1152,6 +1152,7 @@ sub parse_email {
 	my ($formatted_email) = @_;
 
 	my $name = "";
+	my $quoted = "";
 	my $name_comment = "";
 	my $address = "";
 	my $comment = "";
@@ -1183,14 +1184,25 @@ sub parse_email {
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
+	}
+	$name =~ s/^[ \"]|[ \"]$//g;
+	$name = trim("$quoted $name");
+
+	# Extract comments from address
+	# <john(his mail)@doe.com>
+	while ($address =~ s/\s*($balanced_parens)\s*//) {
+		$comment .= trim($1);
 	}
 	$address = trim($address);
 	$address =~ s/^\<|\>$//g;
+	$comment = trim($comment);
 
 	if ($name =~ /[^\w \-]/i) { ##has "must quote" chars
 		$name =~ s/(?<!\\)"/\\"/g; ##escape quotes
@@ -1205,17 +1217,25 @@ sub format_email {
 
 	my $formatted_email;
 
-	$name_comment = trim($name_comment);
-	$comment = trim($comment);
 	$name = trim($name);
 	$name =~ s/^\"|\"$//g;
 	$address = trim($address);
+	$address =~ s/(?:\.|\,)*$//; ##trailing commas or dots
 
 	if ($name =~ /[^\w \-]/i) { ##has "must quote" chars
 		$name =~ s/(?<!\\)"/\\"/g; ##escape quotes
 		$name = "\"$name\"";
 	}
 
+	$name_comment = trim($name_comment);
+	$name_comment =~ s/(.+)/ $1/;
+
+	# Sanitize comment
+	$comment = trim($comment);
+	if ($comment ne "" && $comment !~ s/^\s*((?:\#|\(|\/|\[).*)/ $1/) {
+		$comment = "";
+	}
+
 	if ("$name" eq "") {
 		$formatted_email = "$address";
 	} else {
@@ -1233,15 +1253,11 @@ sub reformat_email {
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
@@ -2704,7 +2720,7 @@ sub process {
 			$signoff++;
 			$in_commit_log = 0;
 			if ($author ne ''  && $authorsignoff != 1) {
-				if (same_email_addresses($1, $author, 1)) {
+				if (same_email_addresses($1, $author)) {
 					$authorsignoff = 1;
 				} else {
 					my $ctx = $1;
@@ -2800,7 +2816,7 @@ sub process {
 				$dequoted =~ s/" </ </;
 				# Don't force email to have quotes
 				# Allow just an angle bracketed address
-				if (!same_email_addresses($email, $suggested_email, 0)) {
+				if (!same_email_addresses($email, $suggested_email)) {
 					WARN("BAD_SIGN_OFF",
 					     "email address '$email' might be better as '$suggested_email'\n" . $herecurr);
 				}
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
