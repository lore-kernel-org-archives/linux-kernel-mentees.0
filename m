Return-Path: <SRS0=hNXL=FC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3678C63697
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 28 Nov 2020 13:05:16 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6222C24658
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 28 Nov 2020 13:05:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vivdeg63"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6222C24658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 088D087B12;
	Sat, 28 Nov 2020 13:05:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7yr7IaeKOldD; Sat, 28 Nov 2020 13:05:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6EAE887AEA;
	Sat, 28 Nov 2020 13:05:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4D2D1C163C;
	Sat, 28 Nov 2020 13:05:15 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4883CC0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 13:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2201920477
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 13:05:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r+XokyTbNB6q
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 13:05:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by silver.osuosl.org (Postfix) with ESMTPS id E191C20419
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 13:05:12 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id w6so6866387pfu.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 05:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Xj/wOuewoXtxSC2fvuTGoHr7LuRtI1vwyFKb4n55N8M=;
 b=Vivdeg63zuyH99Tu6ZodGMLMs2snTtoCeMiCy8Iw9rO6bhqnszPnwStsH2mdk4IV98
 QyuApsUzeJunT4wNwUC35Sk1Bo6Wx6BF3/3HOOFw0ZKFcecybeQ+ABdFE2dA6xqEVFHC
 USZZ4VU+rbtr/kvs0HMJUhCmnPnhpyUn8CglSs7WWEozB9rPDprRML45TOErSPg/55Xg
 VBI/fJtAZMmn9xhQ/e6NzD2TSMiyzihVVttv7sSxwp/YzXtQLpefHEsP7UjCL6YAugWf
 wA3E+ZFtu8uJ2hQLVPKF9rYylSU1hUZZjQpQzGHrer6ftk2IPt8p6dWLRqRdf/rQJyd4
 Uahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Xj/wOuewoXtxSC2fvuTGoHr7LuRtI1vwyFKb4n55N8M=;
 b=pqtq9wQOmDuBiFeWcpHSFy3y04e+7hI9cr36VhTiev4xdpJs9BXgJEUpJNQIhzFAJt
 5kfahKyoRCAiKAGayjUfCS+cUFJVG7UeKVqB2NbJbaCsMT/Zz0SXUlVVv16/vCSOoo5x
 eHbGdvR6PFK/EiFRFkXt/g+Q4IyOewgOc8ZjUoDA/8id14bLd3nD3JA0HIJ222wQXaq+
 nOAtsfyiUatIIK1PyKi602J8/ROQEaUgipT4C7OuUeEeuSrjEzEK8vc5tX9Hw7BUfMrm
 3rJ97pD+L2CKETUitdf+ZEFoYpjER3QGFSX817ANIDixOuX82ziBUvAjAkBT3Qh14YRE
 CSMQ==
X-Gm-Message-State: AOAM530Kefj+TjH0mwmVwt3xw+7E4LmOPfGtNZk/yjrNy+naBLUlfE7Q
 DoUeYggK9P87o1+9q9QL+hA=
X-Google-Smtp-Source: ABdhPJwSLoLLS/cP/1h1WGDVTAGN0DMvMaRmhps5HAWHQtXSEqmS5Io8bMox6NlIa+Cuagqra31G1g==
X-Received: by 2002:a17:90a:c484:: with SMTP id
 j4mr11130527pjt.69.1606568712219; 
 Sat, 28 Nov 2020 05:05:12 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:410:2e8b:3868:c1d5:d398:f361])
 by smtp.googlemail.com with ESMTPSA id 84sm10472123pfu.53.2020.11.28.05.05.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 05:05:11 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: joe@perches.com
Date: Sat, 28 Nov 2020 18:35:01 +0530
Message-Id: <20201128130501.23448-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH v4] checkpatch: add fix and improve
	warning msg for non-standard signature
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

Currently checkpatch warns for BAD_SIGN_OFF on non-standard signature
styles.

A large number of these warnings occur because of typo mistakes in
signature tags. An evaluation over v4.13..v5.8 showed that out of 539
warnings due to non-standard signatures, 87 are due to typo mistakes.

Following are the standard signature tags which are often incorrectly
used, along with their individual counts of incorrect use (over
v4.13..v5.8):

 Reviewed-by: 42
 Signed-off-by: 25
 Reported-by: 6
 Acked-by: 4
 Tested-by: 4
 Suggested-by: 4

Provide a fix by calculating levenshtein distance for the signature tag
with all the standard signatures and suggest a fix with a signature, whose
edit distance is less than or equal to 2 with the misspelled signature.

Out of the 86 mispelled signatures fixed with this approach, 85 were
found to be good corrections and 1 was bad correction.

Following was found to be a bad correction:
 Tweeted-by (count: 1) => Tested-by

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
changes in v2: modify commit message: replace specific example with overall evaluation, minor changes

changes in v3: summarize commit message

changes in v4: improve commit message; remove signature suggestions of small length (ie 'cc' and 'to')

 scripts/checkpatch.pl | 85 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 83 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index fdfd5ec09be6..2b1afd763d8d 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -506,6 +506,77 @@ our $signature_tags = qr{(?xi:
 	Cc:
 )};
 
+sub get_min {
+	my (@arr) = @_;
+	my $len = scalar @arr;
+	if((scalar @arr) < 1) {
+		# if underflow, return
+		return;
+	}
+	my $min = $arr[0];
+	for my $i (0 .. ($len-1)) {
+		if ($arr[$i] < $min) {
+			$min = $arr[$i];
+		}
+	}
+	return $min;
+}
+
+sub get_edit_distance {
+	my ($str1, $str2) = @_;
+	my $len1 = length($str1);
+	my $len2 = length($str2);
+	# two dimensional array storing minimum edit distance
+	my @distance;
+	for my $i (0 .. $len1) {
+		for my $j (0 .. $len2) {
+			if ($i == 0) {
+				$distance[$i][$j] = $j;
+			}
+			elsif ($j == 0) {
+				$distance[$i][$j] = $i;
+			}
+			elsif (substr($str1, $i-1, 1) eq substr($str2, $j-1, 1)) {
+				$distance[$i][$j] = $distance[$i - 1][$j - 1];
+			}
+			else {
+				my $dist1 = $distance[$i][$j - 1]; #insert distance
+				my $dist2 = $distance[$i - 1][$j]; # remove
+				my $dist3 = $distance[$i - 1][$j - 1]; #replace
+				$distance[$i][$j] = 1 + get_min($dist1, $dist2, $dist3);
+			}
+		}
+	}
+	return $distance[$len1][$len2];
+}
+
+sub get_standard_signature {
+	my ($sign_off) = @_;
+	$sign_off = lc($sign_off);
+	$sign_off =~ s/\-//g; # to match with formed hash
+	my @standard_signature_tags = (
+		'signed-off-by:', 'co-developed-by:', 'acked-by:', 'tested-by:',
+		'reviewed-by:', 'reported-by:', 'suggested-by:'
+	);
+	# setting default values
+	my $standard_signature = 'signed-off-by';
+	my $min_edit_distance = 20;
+	my $edit_distance;
+	foreach (@standard_signature_tags) {
+		my $signature = $_;
+		$_ =~ s/\-//g;
+		$edit_distance = get_edit_distance($sign_off, $_);
+		if ($edit_distance < $min_edit_distance) {
+			$min_edit_distance = $edit_distance;
+			$standard_signature = $signature;
+		}
+	}
+        if($min_edit_distance<=2) {
+		return ucfirst($standard_signature);
+        }
+	return "";
+}
+
 our @typeListMisordered = (
 	qr{char\s+(?:un)?signed},
 	qr{int\s+(?:(?:un)?signed\s+)?short\s},
@@ -2773,8 +2844,18 @@ sub process {
 			my $ucfirst_sign_off = ucfirst(lc($sign_off));
 
 			if ($sign_off !~ /$signature_tags/) {
-				WARN("BAD_SIGN_OFF",
-				     "Non-standard signature: $sign_off\n" . $herecurr);
+				my $suggested_signature = get_standard_signature($sign_off);
+				if ($suggested_signature eq "") {
+					WARN("BAD_SIGN_OFF",
+					"Non-standard signature: $sign_off\n" . $herecurr);
+				}
+				else {
+					if (WARN("BAD_SIGN_OFF",
+						 "Non-standard signature: $sign_off. Please use '$suggested_signature' instead\n" . $herecurr) &&
+					    $fix) {
+						$fixed[$fixlinenr] =~ s/$sign_off/$suggested_signature/;
+					}
+				}
 			}
 			if (defined $space_before && $space_before ne "") {
 				if (WARN("BAD_SIGN_OFF",
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
