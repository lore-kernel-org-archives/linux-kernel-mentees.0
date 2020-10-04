Return-Path: <SRS0=vwAy=DL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 567BBC4363C
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  4 Oct 2020 14:38:59 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF2712067D
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  4 Oct 2020 14:38:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hy85Ix6a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF2712067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7494E20352;
	Sun,  4 Oct 2020 14:38:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7BlvUfuIds0a; Sun,  4 Oct 2020 14:38:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3646D20130;
	Sun,  4 Oct 2020 14:38:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 221FAC07FF;
	Sun,  4 Oct 2020 14:38:57 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C4BD3C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  4 Oct 2020 14:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A68B820352
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  4 Oct 2020 14:38:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rYPHtTKLRTmf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  4 Oct 2020 14:38:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 0340720130
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  4 Oct 2020 14:38:53 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id 22so116624pgv.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 04 Oct 2020 07:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2YMJKUBQWqe4WrdZzvyob/7srqhjh6V2uGdYps13OMc=;
 b=Hy85Ix6ae8xBGF4hGnTKr+htEPIm4DWuZnVlQLG+5KZ7EiZNl5OFtc0GyAR5EgT13Z
 IQFVSCf2PXBAsff9EjyeyC87jcrC+a+dnFZD1IcOLt7f8E3JdTmHrgfYjnVrm3+6qUKa
 HtxxCFdzXr+wb4j2cOYm++cGaE4buaI+slf4M0AgiA7q6gb7w7ZkIZJW4cU0ai0hQmO4
 i7DJLpfF1JhWl8qAchzIQsvkPByYMS5LkUWr2gRrO7JGFD4NGitGvMLrCqPmfilrtNNx
 wVej4QaABFxFdZJkE/1hHd0uDB9D90NJ1dkk9ZAF8wxD7MmQzO7RcHCw3hkQmdgyPnR4
 vIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2YMJKUBQWqe4WrdZzvyob/7srqhjh6V2uGdYps13OMc=;
 b=DesCHRlJWhqgmeUfDSd7PBvdlrCsJ+a22pjMt9rZuhyOt/m8UnD9JYjX+R27SIgvw+
 SE6QxCrZeXgD1QCqSBp8akI1FFPo6n2HAPjder+mrWjLbxxsP/+6GQ+TAVeAL7J9rMi5
 +G22HnFfulYdhQVDPwXlIqz9/Vgfxuf4E46MxZmwRTBd7Uo8r6ikEoHy1izTLnYCrpyj
 yaStgbcvPllT5WQsR/S8oySvWW5EhLC6WIm5DKhhMzVQl6uvMwWlhfxNxucs0xmZVeJR
 HIhnW12DWtj2KDZjuCEGhgK39td9Cgp+zxDAiL2gnwKkuEDolvRNoQ3zlquwK+CGzfqD
 Hc/Q==
X-Gm-Message-State: AOAM530La4FXhAJilLkEqf5/jkfb4uM0Nuot7HBymUcDaKx0TEBsB5Rk
 iQXaE0X1LxTvdW0acqmMQO0=
X-Google-Smtp-Source: ABdhPJzkjGpKXsmm403jmaKLms9IfT8Vt7HScCVTTElloa/4kO5poCfzDV+y2xiS+s0hjML59GFRaw==
X-Received: by 2002:a62:bd05:0:b029:142:2501:3a02 with SMTP id
 a5-20020a62bd050000b029014225013a02mr11565133pff.81.1601822333129; 
 Sun, 04 Oct 2020 07:38:53 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:9004:690c:bc27:72eb:81e0:dbc9])
 by smtp.gmail.com with ESMTPSA id v1sm5525837pjd.7.2020.10.04.07.38.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2020 07:38:52 -0700 (PDT)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Sun,  4 Oct 2020 20:08:12 +0530
Message-Id: <20201004143812.117455-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
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
