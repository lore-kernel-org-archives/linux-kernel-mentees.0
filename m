Return-Path: <SRS0=w7vp=DN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BF93C47095
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  6 Oct 2020 18:51:43 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9968F20674
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  6 Oct 2020 18:51:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JT+We4U5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9968F20674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1EABF84BC2;
	Tue,  6 Oct 2020 18:51:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mAlwzzrHtgIq; Tue,  6 Oct 2020 18:51:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BE35C84C20;
	Tue,  6 Oct 2020 18:51:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AC75FC07FF;
	Tue,  6 Oct 2020 18:51:40 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 827F3C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 18:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6A26985A37
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 18:51:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8gQrorMdKNvq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 18:51:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A01AC845C7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 18:51:38 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id az3so1982892pjb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 06 Oct 2020 11:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hjPkM53PpC7kPlO6DeFftljyccx+GJzIyJhLBwe7Yo8=;
 b=JT+We4U5LY9eWnluzXC6g9nu4Rp/DmPuFgXojmo1OvR7RP8lxSIsjH5l7Phu3CKDiJ
 wBu4WEnAm75p5Fh3SV0P3MtifQ7yuTppTK7Vx9qZOYlSnLsHgmomXiF8fh61p0XUH+k9
 X0yMuIqYJHhQzdvRgJ8fQqWRAk9FMyISaJuC5oERXdk2rEXsd6OufrJHXd45K/Db2jMY
 P6+1W8t0W5tGqfaFo97CFhxsg4CevJp5sQARL6BQrv4UQ0HnBkovdDgEyRXml2WZqXlc
 HQbBhhpLUBxalwWOPRwgB1MExoVnrMv7whxkdouzcU354lqJVR+P/Z0Ok0sCHNTvpZ30
 IQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hjPkM53PpC7kPlO6DeFftljyccx+GJzIyJhLBwe7Yo8=;
 b=cOituDZJY6TAiMbrTweVips7uC3qyrx/5DH4K5h5oQVUBONlNRBTiQhaYNKYCdR2mI
 ADdrgopSja6R/kMmFxpsZL9akhB+1grO90QzD228hPYVdPtOURxztcyLgtJIgD5Dn22g
 c9veLGxv4IdPfUzL7Li7zgL/L7keTriiIvRzMfdVB1uxcPhPAqDfxuD6oeHnKg/2y07n
 +CdUyX+2HHdstChGzTuWDt1zqHBgqsMZUH5nFiqe6idhNGCnY2HAjnQXilK43R9+bXBm
 kCVy7xtvQFoJGd/BoVeZ/Lyf0EHlWvflbpMMfAorygR/Tvn1mX7HGdhhWFz95ZpJ0JE/
 t4Mg==
X-Gm-Message-State: AOAM531ihaeZCsza+z+s/PSyc/UqL7nJq0Vb7B97MqbV3u7ypq3Whc9U
 2mBmhP3nTXxWouOnG/yAu2M=
X-Google-Smtp-Source: ABdhPJy7JSjbC092lZGYGNyGH5P7NzyjRy11jri/wnELKsm0/P8GtK/L2NXHmzXtKTl/wJ7COJwEuw==
X-Received: by 2002:a17:902:424:b029:d2:8cdd:dc00 with SMTP id
 33-20020a1709020424b02900d28cdddc00mr4581819ple.7.1602010297856; 
 Tue, 06 Oct 2020 11:51:37 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:9004:60b7:b4c7:8a32:f7cb:8bc0])
 by smtp.gmail.com with ESMTPSA id a1sm3409041pjh.2.2020.10.06.11.51.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 11:51:37 -0700 (PDT)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Wed,  7 Oct 2020 00:21:14 +0530
Message-Id: <20201006185114.168358-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v4] checkpatch: add new warnings to
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

For case 0, an error is generated and for the
other cases 2, 3 and 4, warnings are generated.

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
+				ERROR("NO_AUTHOR_SIGN_OFF",
+				      "Missing Signed-off-by: line by nominal patch author '$author'\n");
+			} elsif ($authorsignoff == 2) {
+				WARN("NO_AUTHOR_SIGN_OFF",
+				     "From:/Signed-off-by: email name mismatch: $sob_msg\n");
+			} elsif ($authorsignoff == 3) {
+				WARN("NO_AUTHOR_SIGN_OFF",
+				     "From:/Signed-off-by: email address mismatch: $sob_msg\n");
+			} elsif ($authorsignoff == 4) {
+				WARN("NO_AUTHOR_SIGN_OFF",
+				     "From:/Signed-off-by: email extension mismatch: $sob_msg\n");
+			}
 		}
 	}
 
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
