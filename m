Return-Path: <SRS0=yuUc=E7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75622C56202
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 Nov 2020 11:25:15 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5F312075A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 Nov 2020 11:25:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R1E5tAmc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5F312075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 343A186E59;
	Wed, 25 Nov 2020 11:25:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qem0+dT4MOoG; Wed, 25 Nov 2020 11:25:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7874486E31;
	Wed, 25 Nov 2020 11:25:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5F0B7C163C;
	Wed, 25 Nov 2020 11:25:13 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2A001C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Nov 2020 11:25:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 25D0C86E4F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Nov 2020 11:25:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8i2xCHZPAu9F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Nov 2020 11:25:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5EC9A86E31
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Nov 2020 11:25:11 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id e8so2038760pfh.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Nov 2020 03:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zO3libh0JDwojNLS1t1RCsxJR3qhevTd029lQqKZRzo=;
 b=R1E5tAmci2o3X1djBwQOCxiOLwky1MCZ8avbTAActW+psCb+io8LJh4ryNlXvmrbog
 YilJ4C5Pk7OezDymhNjhl9BCcb96svqQBVjAbZIGE0Ta9sc70szXKIHo0iJlSd6eSUMg
 f0VILaxSm+NhOUZZD1Rd0marnTDtAwy7SosHDylfA+tPzN/LBfh4zeg9HEQ5vI81lxTG
 lcrbzPhX8YiHBkTDrCAGNPY3nPiVORHDLH9B+dwxssyeQFTNYiHcTPX59hHVXhSZpFKh
 r1erAaQufL9Ezufh8adqR9TypYLu4xYpvO1AA4fXlLeEe6ae4uQyXmbd3FbTwsbkGLSB
 t75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=zO3libh0JDwojNLS1t1RCsxJR3qhevTd029lQqKZRzo=;
 b=GneXtSRHQ/nqgYu9+N/MtGiVIpnAucqo7Oav3AziwchRkknFuHS5XbnRxmffb3CJtC
 eKAjA6WUcN91GD3ZgpSqi7sY+24egui+fbQmrbmdWA6SecapUJvUWUU5lDoZUd59KxHP
 tJLfvAFQzLSu9xuaK5WI3SLr7Z0Hfxrfw357POAotgxtD42FYGl9FA0hpBH42sxphYRu
 tidt9tc7DzxgzaP+3cDRvQWdDbqZtstD77N1fE5qfgpH03IDCcANRD0+WH29DNLV6PBq
 fDbtLsk9UA833ZkXeYxRmT+UDayBIdBHi/RFMvk/jYIyV4ywICDw3KK+SB8QA+S20a1L
 C39Q==
X-Gm-Message-State: AOAM533DqcFz9MgZKlRdE/yMyZJSTRYG+7hoS7CZFEmDrlTW2El/v7if
 xQ9HOLKco2R81uJllmqykYU=
X-Google-Smtp-Source: ABdhPJxqKLwZIlS3B/r/ohvxD54+Zgg7u5ch4vbvwf0FK+fTSQJ45izRj/65jA4J20f3LiUNaqbcwg==
X-Received: by 2002:aa7:938f:0:b029:18b:48fa:a426 with SMTP id
 t15-20020aa7938f0000b029018b48faa426mr2056983pfe.6.1606303510778; 
 Wed, 25 Nov 2020 03:25:10 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:420:7007:58b5:e884:d92a:b961])
 by smtp.googlemail.com with ESMTPSA id r68sm1894623pfr.113.2020.11.25.03.25.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 03:25:10 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Wed, 25 Nov 2020 16:55:02 +0530
Message-Id: <20201125112502.16351-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAKXUXMxFK9=rs+_VtYgA0S6X=ds0yfbTLu+7KQL9VYOsfVMh5Q@mail.gmail.com>
References: <CAKXUXMxFK9=rs+_VtYgA0S6X=ds0yfbTLu+7KQL9VYOsfVMh5Q@mail.gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH v3] checkpatch: add fix and improve
	warning msg for Non-standard signature
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
signoffs. An evaluation over v4.13..v5.8 revealed that out of 539
warnings due to Non-standard signatures, 87 are due to typo mistakes.

Following are the standard signature tags which are often incorrectly
used with their counts(over v4.13..v5.8):

1) Reviewed-by => 42
2) Signed-off-by => 25
3) Reported-by => 6
4) Acked-by => 4
5) Tested-by => 4
6) Suggested-by => 4

Provide a fix by calculating levenshtein distance for the signature tag
with all the standard signatures and suggest a fix with signature, whose
edit distance is less than or equal to 2 with the misspelt signature.

Out of the 87 misspelt signatures fixed with this approach, 85 were
found to be good corrections and 2 were bad corrections.

The signature tags which are good corrections using this approach are:

1)Reviwed-by (count: 19) => Reviewed-by
2)Reviewd-by (count: 9) => Reviewed-by
3)Singed-off-by (count: 8) => Signed-off-by
4)Signed-of-by (count: 6) => Signed-off-by
5)Rewieved-by (count: 3) => Reviewed-by
6)Signed-off--by (count: 3) => Signed-off-by
7)Revieved-by (count: 3) => Reviewed-by
8)Reivewed-by (count: 2) => Reviewed-by
9)Signef-off-by (count: 2) => Signed-off-by
10)Test-by (count: 2) => Tested-by
11)Acked_by (count: 2) => Acked-by
12)Signed-off-by-by (count: 2) => Signed-off-by
13)Reported-by-by (count: 1) => Reported-by
14)Reporetd-by (count: 1) => Reported-by
15)Reviewed--by (count: 1) => Reviewed-by
16)Sugested-by (count: 1) => Suggested-by
17)Suggested--by (count: 1) => Suggested-by
18)Repoted-by (count: 1) => Reported-by
19)Rported-by (count: 1) => Reported-by
20)eigned-off-by (count: 1) => Signed-off-by
21)Reveiwed-by (count: 1) => Reviewed-by
22)igned-off-by (count: 1) => Signed-off-by
23)Tested-by-by (count: 1) => Tested-by
24)Sugessted-by (count: 1) => Suggested-by
25)Rewiewed-by (count: 1) => Reviewed-by
26)Teste-by (count: 1) => Tested-by
27)Signee-off-by (count: 1) => Signed-off-by
28)Signen-off-by (count: 1) => Signed-off-by
29)Reviwed-By (count: 1) => Reviewed-by
30)eported-by (count: 1) => Reported-by
31)Reviewedy-by (count: 1) => Reviewed-by
32)Siganed-off-by (count: 1) => Signed-off-by
33)Ackedy-by (count: 1) => Acked-by
34)Review-by (count: 1) => Reviewed-by
35)Suggsted-by (count: 1) => Suggested-by
36)Ack-by (count: 1) => Acked-by
37)Reorted-by (count: 1) => Reported-by

Following were found to be bad corrections:

1)-By (count: 1) => To
2)Tweeted-by (count: 1) => Tested-by

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
changes in v2: modify commit message: replace specific example with overall evaluation, minor changes

changes in v3: summarize commit message

 scripts/checkpatch.pl | 85 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 83 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index fdfd5ec09be6..775a49a06179 100755
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
+		'reviewed-by:', 'reported-by:', 'suggested-by:', 'to:', 'cc:'
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
