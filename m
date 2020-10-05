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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 135D5C4363D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  5 Oct 2020 09:57:24 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DE2D20776
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  5 Oct 2020 09:57:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CYYpenJN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DE2D20776
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4C605863D9;
	Mon,  5 Oct 2020 09:57:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uldKeATNWgvy; Mon,  5 Oct 2020 09:57:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B272F86123;
	Mon,  5 Oct 2020 09:57:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 98903C07FF;
	Mon,  5 Oct 2020 09:57:22 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 200D1C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 09:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1357720400
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 09:57:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZoBjCIL3AMkR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 09:57:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 4C81F20021
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 09:57:20 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id b26so3171740pff.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 05 Oct 2020 02:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/IoJoNYbBDSbDqwZiSlHtTRYjIsZ6k2VWRarueMjVz0=;
 b=CYYpenJN983fy2kAMibknqXZh69ey3oQne0pBNEor4ZNIaZLK5jMuONutGNMnZx59M
 AZojRiNCIdWeGRSXSWKkdIkTEtzuL68YE5j/NMwcnhFvhDQBdQjbN03Y2v6V3eiHw4uS
 12CEckxRvPe4TT+dMzDotSOZ3yOH0MsRtU08wviLrLGNENFFlVCTlpJl+nuRHebUOGKQ
 r5NkjpukPuO4j8qMffWjgHicxyo5gOLPUylKM5GV3zFierrRhy8C9ikrc6sYxuSKSh18
 ip8+nSY0jWVHZx5PisN0xo9gsVPLuJDFgtWHAWpG4U85xWNH3iLsd9amZfjOcQZN1J5v
 42oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/IoJoNYbBDSbDqwZiSlHtTRYjIsZ6k2VWRarueMjVz0=;
 b=paPz9HGFcwMV5DNPqb+IOn7+CrREnHlv0oqpb0PXIw1VF1Vngkg1VztadHf+wcGRqM
 SxRDa0JnqgdXjT6/CeMSrEy/NBwbvCvN8q/6B21uaOLEUf9hZNnSl7K+uO5zLO7H6xaJ
 rZ27E8qTVSgtqSeL4eaOklbyeEr5ghY6FNbUjClXHu495DgZ19wrHXtBjC1kyvZTIHib
 GJz1nX8lpeth+4C74gJlZSnvEEzTpqTf7BYfgeUj0Kjfw6UigIa5GLgDU1NQ2LkbcRQs
 muatPkhCmAR/LFOLCQrSEo+3oNyo/46BLNDiO6F9qqX7fOMUTnoAvyp8Hp1rBnROtmXe
 A9ng==
X-Gm-Message-State: AOAM5314sCZUxOziwCkXWdSMX8mGNRx/Y9XFXokL+Y9jOMslrUFk555r
 DrG/cZT7AMAVKRY5HuV8sws=
X-Google-Smtp-Source: ABdhPJw9YEKJFcnvmQXMdvmON5e6tFdQWv9VMTc5b05UNHvzGHA7FrPvgs52yRl7mum/RFoHtZayVQ==
X-Received: by 2002:a63:5663:: with SMTP id g35mr14278539pgm.163.1601891839589; 
 Mon, 05 Oct 2020 02:57:19 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:9004:6930:697a:aab2:e913:9e57])
 by smtp.gmail.com with ESMTPSA id o17sm2774555pji.30.2020.10.05.02.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 02:57:18 -0700 (PDT)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Mon,  5 Oct 2020 15:26:34 +0530
Message-Id: <20201005095634.69713-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: add new warnings to
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

Link: https://lore.kernel.org/lkml/7958ded756c895ca614ba900aae7b830a992475e.camel@perches.com/
Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 54 +++++++++++++++++++++++++++++++++++++++----
 1 file changed, 50 insertions(+), 4 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 31624bbb342e..1380212f1a9d 100755
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
+							$address1 = $1.$2;
+						}
+						if ($address2 =~ /(\S+)\+\S+(\@.*)/) {
+							$address2 = $1.$2;
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
+			# 4 -> names match, addresses excuding mail extensions (subaddresses) match
+
+			my $sob_msg = "'From: $author' != 'Signed-off-by: $author_sob'";
+
+			if ($authorsignoff == 0) {
+				WARN("NO_AUTHOR_SIGN_OFF",
+					 "Missing Signed-off-by: line by nominal patch author '$author'\n");
+			} elsif ($authorsignoff == 2) {
+				WARN("NO_AUTHOR_SIGN_OFF",
+					 "From:/Signed-off-by: email name mismatch:\n$sob_msg\n");
+			} elsif ($authorsignoff == 3) {
+				WARN("NO_AUTHOR_SIGN_OFF",
+					 "From:/Signed-off-by: email address mismatch:\n$sob_msg\n");
+			} elsif ($authorsignoff == 4) {
+				CHK("NO_AUTHOR_SIGN_OFF",
+					"From:/Signed-off-by: email extension mismatch:\n$sob_msg\n");
+			}
 		}
 	}
 
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
