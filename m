Return-Path: <SRS0=g3Jo=DM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E392BC46466
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  5 Oct 2020 19:25:12 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43ACC207BC
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  5 Oct 2020 19:25:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KTIo1bsJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43ACC207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9CC5982067;
	Mon,  5 Oct 2020 19:25:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6BsDydgFn+gz; Mon,  5 Oct 2020 19:25:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id ABB2E84CF3;
	Mon,  5 Oct 2020 19:25:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 94D6AC016F;
	Mon,  5 Oct 2020 19:25:10 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2B991C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 19:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 151BC84CF3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 19:25:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zERXJifwBjpr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 19:25:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 20CFE866EC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 19:25:08 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id b26so4259777pff.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 05 Oct 2020 12:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DUHzU994asFuDsR5vXXKO1RIre9z7+ihbRduDUcsWCM=;
 b=KTIo1bsJOi4gTjQ0hVp2YcFgyY8jzGe/b83zbBRsaEntaSmg1/eJnQ5DoIvKStRReR
 +/YSrAB2EqcLh0szDtcJfiI7rYu4IsL/7GC8AApQmKvbi+P3PgQVNUncvXcLbDy9C9z1
 fSjqmwllcL0+CuRpO0Iq31tyERLZgtT5uIohDneXALXagC/g66ZSaAOpep6qcd/rb/77
 K4b2Zcg3IV1IQ/VaGKukPA7vpjZU2S1xO0HKdLUPxfC7CnFybgzEDlfc6ysQL7WxcQcL
 nDGhDfCNA1Box0NKpb6nfUiCbwf53dAPpp2X6hdwDXtdKNgpqdGNWXvoIk7U5XQ63AZP
 aBfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DUHzU994asFuDsR5vXXKO1RIre9z7+ihbRduDUcsWCM=;
 b=GFYmvhqtoHoVCyfkgpbvYGNpmvqIEn1UnIDPVDwfhUR54UIIE5qTgujEKQEWra3khZ
 jBvz1DhZYXxDSCyzn46eH/Rmju/nepNuXm5URPmqLC2174CSpLXaL4w36f9GCkw5CPnz
 78VfvFxhgByM/3oksbfGArhjvkUfa+TdB1sA7lwKEH0flkhiQcbgeiGT98XJy+6et6Yq
 KDcBXHeYxRJbzlbibuBnRY1SMIArN0DGpadJy0vrdzORaVOny92jP9Pa/Rha9ZILgimR
 CHo9JP0/JsaQ/3wGxynjQn1y0vjW7PA8LWNTvSf05w8u4oNvicBD0Cohz04NJ1I5LV+n
 sEkA==
X-Gm-Message-State: AOAM533l5UPMat8pajpzUU5NJ744WXlNMImMisS7YRED/FDpSkEaJ2Ov
 VmNqvnDwsEY1ckTzTpGi3pA=
X-Google-Smtp-Source: ABdhPJyHerIA1lW+acDgHBcvERRxWfkATPzD7fxYwZ2tKkdq+R0yY08S/elZlepol7zltjSNx94BEA==
X-Received: by 2002:a63:1061:: with SMTP id 33mr1069168pgq.204.1601925907522; 
 Mon, 05 Oct 2020 12:25:07 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:9004:6930:697a:aab2:e913:9e57])
 by smtp.gmail.com with ESMTPSA id 138sm717388pfu.180.2020.10.05.12.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 12:25:06 -0700 (PDT)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Tue,  6 Oct 2020 00:54:09 +0530
Message-Id: <20201005192409.192317-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v3] checkpatch: add new warnings to
	author signoff checks.
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

The author signed-off-by checks are currently very vague.
Cases like same name or same address are not handled separately.

For example, running checkpatch on commit be6577af0cef
("parisc: Add atomic64_set_release() define to avoid CPU soft lockups"),
gives:

WARNING: Missing Signed-off-by: line by nominal patch author
'John David Anglin <dave.anglin@bell.net>'

The signoff line was:
"Signed-off-by: Dave Anglin <dave.anglin@bell.net>"

Clearly the author has signed off but with a slightly different version
of his name. A more appropriate warning would have been to point out
at the name mismatch instead.

Previously, the values assumed by $authorsignoff were either 0 or 1
to indicate whether a proper sign off by author is present.
Extended the checks to handle three new cases.

$authorsignoff values now denote the following:

0: Missing sign off by patch author.

1: Sign off present and identical.

2: Addresses match, but names are different.
   "James Watson <james@gmail.com>", "James <james@gmail.com>"

3: Names match, but addresses are different.
   "James Watson <james@watson.com>", "James Watson <james@gmail.com>"

4: Names match, addresses excluding subaddress details (RFC 5233) match.
   "James Watson <james@gmail.com>", "James Watson <james+a@gmail.com>"

For case 4, a --strict check message is generated, and for the
other cases 0, 2 and 3, warnings are generated.

Link: https://lore.kernel.org/lkml/7958ded756c895ca614ba900aae7b830a992475e.camel@perches.com/
Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 54 +++++++++++++++++++++++++++++++++++++++----
 1 file changed, 50 insertions(+), 4 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 31624bbb342e..e81f0bebbeb9 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2347,6 +2347,7 @@ sub process {
 	my $signoff = 0;
 	my $author = '';
 	my $authorsignoff = 0;
+	my $author_sob = '';
 	my $is_patch = 0;
 	my $is_binding_patch = -1;
 	my $in_header_lines = $file ? 0 : 1;
@@ -2674,9 +2675,34 @@ sub process {
 		if ($line =~ /^\s*signed-off-by:\s*(.*)/i) {
 			$signoff++;
 			$in_commit_log = 0;
-			if ($author ne '') {
+			if ($author ne ''  && $authorsignoff != 1) {
 				if (same_email_addresses($1, $author)) {
 					$authorsignoff = 1;
+				} else {
+					my $ctx = $1;
+					my ($email_name, $email_comment, $email_address, $comment1) = parse_email($ctx);
+					my ($author_name, $author_comment, $author_address, $comment2) = parse_email($author);
+
+					if ($email_address eq $author_address) {
+						$author_sob = $ctx;
+						$authorsignoff = 2;
+					} elsif ($email_name eq $author_name) {
+						$author_sob = $ctx;
+						$authorsignoff = 3;
+
+						my $address1 = $email_address;
+						my $address2 = $author_address;
+
+						if ($address1 =~ /(\S+)\+\S+(\@.*)/) {
+							$address1 = "$1$2";
+						}
+						if ($address2 =~ /(\S+)\+\S+(\@.*)/) {
+							$address2 = "$1$2";
+						}
+						if ($address1 eq $address2) {
+							$authorsignoff = 4;
+						}
+					}
 				}
 			}
 		}
@@ -6891,9 +6917,29 @@ sub process {
 		if ($signoff == 0) {
 			ERROR("MISSING_SIGN_OFF",
 			      "Missing Signed-off-by: line(s)\n");
-		} elsif (!$authorsignoff) {
-			WARN("NO_AUTHOR_SIGN_OFF",
-			     "Missing Signed-off-by: line by nominal patch author '$author'\n");
+		} elsif ($authorsignoff != 1) {
+			# authorsignoff values:
+			# 0 -> missing sign off
+			# 1 -> sign off identical
+			# 2 -> addresses match, names different
+			# 3 -> names match, addresses different
+			# 4 -> names match, addresses excluding subaddress details (refer RFC 5233) match
+
+			my $sob_msg = "'From: $author' != 'Signed-off-by: $author_sob'";
+
+			if ($authorsignoff == 0) {
+				WARN("NO_AUTHOR_SIGN_OFF",
+				     "Missing Signed-off-by: line by nominal patch author '$author'\n");
+			} elsif ($authorsignoff == 2) {
+				WARN("NO_AUTHOR_SIGN_OFF",
+				     "From:/Signed-off-by: email name mismatch: $sob_msg\n");
+			} elsif ($authorsignoff == 3) {
+				WARN("NO_AUTHOR_SIGN_OFF",
+				     "From:/Signed-off-by: email address mismatch: $sob_msg\n");
+			} elsif ($authorsignoff == 4) {
+				CHK("NO_AUTHOR_SIGN_OFF",
+				    "From:/Signed-off-by: email extension mismatch: $sob_msg\n");
+			}
 		}
 	}
 
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
