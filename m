Return-Path: <SRS0=g3Jo=DM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26520C4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  5 Oct 2020 06:49:20 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A09DE206C3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  5 Oct 2020 06:49:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bR5GZlm4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A09DE206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 56AA587033;
	Mon,  5 Oct 2020 06:49:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dxYo62E1zvRa; Mon,  5 Oct 2020 06:49:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BAE758702E;
	Mon,  5 Oct 2020 06:49:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A2F2DC016F;
	Mon,  5 Oct 2020 06:49:18 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9073BC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 06:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7EF6A20395
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 06:49:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xEYAbNmiKa5H
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 06:49:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by silver.osuosl.org (Postfix) with ESMTPS id BD33320367
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 06:49:16 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id t14so5374697pgl.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 04 Oct 2020 23:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2YMJKUBQWqe4WrdZzvyob/7srqhjh6V2uGdYps13OMc=;
 b=bR5GZlm4spcHgHFQPhgbb0PKQkZ5ASSTLKS2SBi2sqm6fFuVWmBOk5K6rIyULXNxb2
 JjmYP8bALPvX1zyXDs9oZF+5uyjg8agP+twwGIDCaP8VDdEeocApU62C9nMa3Wm9R3tf
 qA+Dq0MI5MZSGgYshe8rwpnuGkwGtxI+bo9RSu/zqN37rIHUUaW4BLeLjhVHbw60UzfN
 alujfyFt6C0I9t6Rg44HTICNf0tGrQwBWOVJdKeLAHcx12nnGUp4+fgpxQZZ2p1k2L+7
 /g3ZRn/WCzsRFXZlETXMHN1iAqRL2cJ3klNPiKrPyDcEvXG0lilnUsuIsnZIkw4v3756
 Q9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2YMJKUBQWqe4WrdZzvyob/7srqhjh6V2uGdYps13OMc=;
 b=PTdQ/gDniBxPdpzx76MNOf8ABugVH3ecvaf+qwCfRhDjS+wak7KlOtTleFwtEo3yT5
 tnbBMdIOAdcE3dbhos8fqztH4zkFR3yizv9fOqoMojs5kKm8BE8jJnlK71mIjlqCKNa7
 9Z2rLEBVKrWkJDfxmNgfGiJaNQj8SBue+U3A9rmBliHEqqZM7qjBLQaGQkKTXcVgvD2p
 LAr7+EUe/7UbUDdds3F80PDVXBKNnbAdQMLYX2xS/4kH9Qts4sksRmR0vmA8XtvUsVG1
 26iuPrCBrYZecvei3fk5uOJzgVMW7fPtUCaawd/xhYjv71B6UmJBQvls+AQXqOxo/haN
 UiyA==
X-Gm-Message-State: AOAM530Ll0bMZ/QxxZJu/iZyFNLojru7jODvk6PQ9mewE9UI5pN9d3UJ
 ot/a+SHsTC9LE8UnipkWDEI=
X-Google-Smtp-Source: ABdhPJyFQ4Ao+3lxLWtfEGldHrrbYHfOBU2VSqBcc1zBT2DMiHP3+4rt2h8BfyJAFXuENzEFgtN8bg==
X-Received: by 2002:aa7:9492:0:b029:152:545f:90d with SMTP id
 z18-20020aa794920000b0290152545f090dmr8886157pfk.9.1601880556125; 
 Sun, 04 Oct 2020 23:49:16 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:9004:6930:697a:aab2:e913:9e57])
 by smtp.gmail.com with ESMTPSA id 8sm7865411pfn.54.2020.10.04.23.49.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2020 23:49:15 -0700 (PDT)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Mon,  5 Oct 2020 12:18:42 +0530
Message-Id: <20201005064842.33495-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH RFC] checkpatch: add new warnings to
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

Introduced three new types of warnings:

1) Address matches, but names are different.
   "James Watson <james@gmail.com>", "James <james@gmail.com>"

2) Name matches, but addresses are different.
   "James Watson <james@watson.com>", "James Watson <james@gmail.com>"

3) Name matches, but addresses without mail extensions are same.
   "James Watson <james@gmail.com>", "James Watson <james+a@gmail.com>"

For the 3rd class, a --strict check message is generated, and for the
other two, warnings are generated.

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 57 ++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 53 insertions(+), 4 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 31624bbb342e..80feb15f93cb 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2347,6 +2347,7 @@ sub process {
 	my $signoff = 0;
 	my $author = '';
 	my $authorsignoff = 0;
+	my $authorsignoff_ctx = '';
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
+					if($email_address eq $author_address) {
+						$authorsignoff_ctx = $ctx;
+						$authorsignoff = 2;
+					} elsif ($email_name eq $author_name) {
+						$authorsignoff_ctx = $ctx;
+						$authorsignoff = 3;
+
+						my $address1 = $email_address;
+						my $address2 = $author_address;
+
+						if ($address1 =~ /(\S+)\+\S+(\@.*)/) {
+							$address1 = $1.$2;
+						}
+						if ($address2 =~ /(\S+)\+\S+(\@.*)/) {
+							$address2 = $1.$2;
+						}
+						if($address1 eq $address2) {
+							$authorsignoff = 4;
+						}
+					}
 				}
 			}
 		}
@@ -6891,9 +6917,32 @@ sub process {
 		if ($signoff == 0) {
 			ERROR("MISSING_SIGN_OFF",
 			      "Missing Signed-off-by: line(s)\n");
-		} elsif (!$authorsignoff) {
-			WARN("NO_AUTHOR_SIGN_OFF",
-			     "Missing Signed-off-by: line by nominal patch author '$author'\n");
+		} elsif ($authorsignoff != 1) {
+			# authorsignoff values:
+			# 0 -> missing sign off
+			# 1 -> sign off present
+			# 2 -> address matches, name different
+			# 3 -> name matches, address different
+			# 4 -> name matches, address matches without extension
+
+			my $ctx_msg = "'Signed-off-by: $authorsignoff_ctx' should be:\n'Signed-off-by: $author'";
+
+			if($authorsignoff == 0) {
+				WARN("NO_AUTHOR_SIGN_OFF",
+					"Missing Signed-off-by: line by nominal patch author '$author'\n");
+			}
+			elsif($authorsignoff == 2) {
+				WARN("NO_AUTHOR_SIGN_OFF",
+					"Author name mismatch:\n$ctx_msg\n");
+			}
+			elsif($authorsignoff == 3) {
+				WARN("NO_AUTHOR_SIGN_OFF",
+					"Author address mismatch:\n$ctx_msg\n");
+			}
+			elsif($authorsignoff == 4) {
+				CHK("NO_AUTHOR_SIGN_OFF",
+					"Author mail extension mismatch:\n$ctx_msg\n");
+			}
 		}
 	}
 
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
