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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EA6BC63798
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 28 Nov 2020 20:43:49 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8573221FF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 28 Nov 2020 20:43:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sfOhxjo+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8573221FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3C992872FC;
	Sat, 28 Nov 2020 20:43:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n2_Mi9HpBAyA; Sat, 28 Nov 2020 20:43:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 687A8872CF;
	Sat, 28 Nov 2020 20:43:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5B538C163C;
	Sat, 28 Nov 2020 20:43:46 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4F2C8C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 20:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 35AB087959
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 20:43:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RkLF9yLLD2FZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 20:43:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 924A787955
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 20:43:44 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id t18so4350415plo.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 12:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=cdsJyh5jij8oKn4gXX0267hbBIKcbUaCIrKyrDn2vdA=;
 b=sfOhxjo+yAyhE0eyu5tXl75LHglUPRagWrqh0D7N39bWZEJf4R9CKOXVr6roJAxpfm
 bzjYo4VvDLtdab6adnq6m3pLNpO9gIajlVHK8vuSZhIGNYCClBR7CCy8oUugKiYsZqhB
 dpaejTxCjB9ZNVp+En3ddgjxjixWnLtoEriUDxtLS8DS5M+F8R8j/epMDd7M/PQaFVoH
 UJ/2H2q52lfB408W5AmFZ7SrZBKAcu0M/3ZLEEfJ/ihEtNwYXkG4QVXKzzx1L/pqNPdN
 0fws27VLgM/tTwp3YnEKw1LIwfl5STNHV4KoQt4ARdkEdngyy0f7OiWiSWxiwKcPYTTI
 vYFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=cdsJyh5jij8oKn4gXX0267hbBIKcbUaCIrKyrDn2vdA=;
 b=fPZmz/f6eLx/SbWC26CT9wHSqhCW9BEvfFRy+o7gm/p73e6F86iHSjZSyFQ+n6+Brr
 tHEkW1cnsTQkbivDnqYgYjC3IM0+UfO7fq3dBiVvQKY4pZIiNMbGILmw4fn/HIV7cr5p
 Zp/5VzsA9F02mr0UxJCUlBmvJWiwUMKDiYnIZFWqgBl1YT3Oo00z1lQq6ni0Y4S+ynPp
 FfUQg3WUYFH5gAzkO+xH+nOADWR7+c2ZWg7cIGJ70tV1eKhXHYuHNcmzB7vrQj2uq/2H
 mFtxtPwFyw8wkTJUHhmelp1NhVghC2Oq1KykQmZ1JK8FzM2X2lIaabTYF30f0jgdX+YQ
 eNkQ==
X-Gm-Message-State: AOAM5337nSfw7+zjC9Km44fcJhKIRwON+0SBOPhP8m9ES9ohyAmzMyb7
 X+73lGo7MbJNsZtNypt7uJE=
X-Google-Smtp-Source: ABdhPJykVc8v6DRRnQ+Ewjgfk7w7HIHAoxkADwJC2mR1ucCf1zLgX/4MMsY9+VI3Z5g/yIk39auxrg==
X-Received: by 2002:a17:902:c203:b029:da:725b:fcea with SMTP id
 3-20020a170902c203b02900da725bfceamr221745pll.16.1606596223975; 
 Sat, 28 Nov 2020 12:43:43 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:410:2e8b:3868:c1d5:d398:f361])
 by smtp.googlemail.com with ESMTPSA id z29sm10745577pgc.68.2020.11.28.12.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 12:43:43 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: joe@perches.com
Date: Sun, 29 Nov 2020 02:13:33 +0530
Message-Id: <20201128204333.7054-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <c2087e41b85c3d45f1d224373b36ecff88d80298.camel@perches.com>
References: <c2087e41b85c3d45f1d224373b36ecff88d80298.camel@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH v6] checkpatch: add fix and improve
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
applies on next-20201120

changes in v2: modify commit message: replace specific example with overall evaluation, minor changes

changes in v3: summarize commit message

changes in v4: improve commit message; remove signature suggestions of small length (ie 'cc' and 'to')

changes in v5: modify coding styles: improve function names, whitespaces

changes in v6: Simplify foreach loop; change standard signature tag values to normal ucfirst; modify warning message

 scripts/checkpatch.pl | 71 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 69 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index fdfd5ec09be6..4a026926139f 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -506,6 +506,64 @@ our $signature_tags = qr{(?xi:
 	Cc:
 )};
 
+sub edit_distance_min {
+	my (@arr) = @_;
+	my $len = scalar @arr;
+	if ((scalar @arr) < 1) {
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
+	$str1 = lc($str1);
+	$str2 = lc($str2);
+	$str1 =~ s/-//g;
+	$str2 =~ s/-//g;
+	my $len1 = length($str1);
+	my $len2 = length($str2);
+	# two dimensional array storing minimum edit distance
+	my @distance;
+	for my $i (0 .. $len1) {
+		for my $j (0 .. $len2) {
+			if ($i == 0) {
+				$distance[$i][$j] = $j;
+			} elsif ($j == 0) {
+				$distance[$i][$j] = $i;
+			} elsif (substr($str1, $i-1, 1) eq substr($str2, $j-1, 1)) {
+				$distance[$i][$j] = $distance[$i - 1][$j - 1];
+			} else {
+				my $dist1 = $distance[$i][$j - 1]; #insert distance
+				my $dist2 = $distance[$i - 1][$j]; # remove
+				my $dist3 = $distance[$i - 1][$j - 1]; #replace
+				$distance[$i][$j] = 1 + edit_distance_min($dist1, $dist2, $dist3);
+			}
+		}
+	}
+	return $distance[$len1][$len2];
+}
+
+sub find_standard_signature {
+	my ($sign_off) = @_;
+	my @standard_signature_tags = (
+		'Signed-off-by:', 'Co-developed-by:', 'Acked-by:', 'Tested-by:',
+		'Reviewed-by:', 'Reported-by:', 'Suggested-by:'
+	);
+	foreach my $signature (@standard_signature_tags) {
+		return $signature if (get_edit_distance($sign_off, $signature) <= 2);
+	}
+
+	return "";
+}
+
 our @typeListMisordered = (
 	qr{char\s+(?:un)?signed},
 	qr{int\s+(?:(?:un)?signed\s+)?short\s},
@@ -2773,8 +2831,17 @@ sub process {
 			my $ucfirst_sign_off = ucfirst(lc($sign_off));
 
 			if ($sign_off !~ /$signature_tags/) {
-				WARN("BAD_SIGN_OFF",
-				     "Non-standard signature: $sign_off\n" . $herecurr);
+				my $suggested_signature = find_standard_signature($sign_off);
+				if ($suggested_signature eq "") {
+					WARN("BAD_SIGN_OFF",
+					     "Non-standard signature: $sign_off\n" . $herecurr);
+				} else {
+					if (WARN("BAD_SIGN_OFF",
+						 "Non-standard signature: '$sign_off' - perhaps '$suggested_signature'?\n" . $herecurr) &&
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
