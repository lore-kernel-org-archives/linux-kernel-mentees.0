Return-Path: <SRS0=nBaC=E6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D534C2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 24 Nov 2020 11:17:15 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 915872073C
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 24 Nov 2020 11:17:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wr+lQbbJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 915872073C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B3C7586489;
	Tue, 24 Nov 2020 11:17:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cs-CdeKrgt41; Tue, 24 Nov 2020 11:17:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0D8ED85FAC;
	Tue, 24 Nov 2020 11:17:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EC646C163C;
	Tue, 24 Nov 2020 11:17:10 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E0F30C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Nov 2020 11:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C84B985FAC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Nov 2020 11:17:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fhw1FcadPS4L
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Nov 2020 11:17:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B339C848F4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Nov 2020 11:17:08 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id 18so10516363pli.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Nov 2020 03:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=JTBaSRsmMxEi91P/E5w00Gkl/sDHWIBWduLqPJW37b4=;
 b=Wr+lQbbJW4wkcZ0xbPYORs7tXyNFP3cnXUWlvSunA9HVHrOKna0dMTbkXlQmdlsdoF
 wN8bpXQ9g+1TyzV7tN0cEROi7lpll7qRBeMu70oTEYhLZcZBdIb7d9R/Xa0xeX2VYN79
 wLCc+xiHIZ4MUE8enD31+qu97droRe8UtDnML1ZwppePWsEhC7ct/mg3GOXew0dKvOjJ
 0S93RmrDeQUyFHhfoj5EegWYCU8Nt2hBh6vl+GYlvag1+YJPxwuXUoS2yDzZCwIAsVPd
 vTJH14gpQqnyJc+wKFt71p4Qg0NUmzuvhUAlc3PwCpE4iKaOSiMczWWJznyV8Qat4mee
 agBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=JTBaSRsmMxEi91P/E5w00Gkl/sDHWIBWduLqPJW37b4=;
 b=HJIP6nLEO45WklEcd25AWoUrAd8a3tSQ9E6E4Df5PxxJsk7Nwtewmz95ZX0SIuXSSt
 pb9bo/vUEbCs3/kZfSD8nMO2xxc8UdBdeis9mwp+Ap74fYSsQKvvFZm9p5Qx0BPRp1mQ
 XF9wKveKk5wTxaooaQRmes453gLCYoSMZCsEVdwoU2D/c4UTXvH4kuvou/YGaYx94qzP
 zxVl1udOaMLjojakk+pxN17CI/KTfebA39NQUdDKDRsJoMpseTf5rr9wUaMOpa3YcCMB
 3nDQSf+oed6UHq/yM/9k/WhKIMpH8KRuEQQyYbP2n72f496RFqaHDFsEv7DWTa5DeuIq
 BDFA==
X-Gm-Message-State: AOAM531eAA3KJVXNardwzb+93UhsFE+Blxle1Hh9p4rYSekcuBn3vKin
 kv8OyTFjk0WAH84rnPnbG4Q=
X-Google-Smtp-Source: ABdhPJwmfs+tTkx+FiRQYvWX2KK7ZyAWru7PuFYW3vBx1Op3ubx785OW0W8uESzyvip7nA6Lv1EWEA==
X-Received: by 2002:a17:902:7b90:b029:d6:ad06:d4c0 with SMTP id
 w16-20020a1709027b90b02900d6ad06d4c0mr3665485pll.35.1606216628026; 
 Tue, 24 Nov 2020 03:17:08 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:401:852a:24a9:89:73b9:b33c])
 by smtp.googlemail.com with ESMTPSA id
 x61sm3014955pjj.4.2020.11.24.03.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 03:17:07 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Tue, 24 Nov 2020 16:46:59 +0530
Message-Id: <20201124111659.16854-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: add fix and improve
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
signoffs.
An evaluation over v4.13..v5.8 revealed that out of 539 warnings due to
Non-standard signatures, 85 are due to typo mistakes.

Eg. running checkpatch on commit da785a87787c ("ARM: bcm2835: Fix
integer overflow in rpi_firmware_print_firmware_revision()") reports
this warning:

WARNING:Non-standard signature: Revieved-by:
Revieved-by: Petr Mladek <pmladek@suse.com>

Here the signoff 'Reviewed-by' is misspelt.

Provide a fix by calculating levenshtein distance for the signoff over
all the standard signatures and suggest a fix if the distance for any
signature is less than or equal to 2.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
applied on my last patch and next-20201120

 scripts/checkpatch.pl | 73 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 72 insertions(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index b018deecec1a..2198360eebbd 100755
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
 our %standard_signature_fix = (
 	"Requested-by:" => {
 		suggestion => "Suggested-by:",
@@ -2848,7 +2919,7 @@ sub process {
 			my $ucfirst_sign_off = ucfirst(lc($sign_off));
 
 			if ($sign_off !~ /$signature_tags/) {
-				my $suggested_signature = "";
+				my $suggested_signature = get_standard_signature($sign_off);
 				my $rationale = "";
 				if (exists($standard_signature_fix{$sign_off})) {
 					$suggested_signature = $standard_signature_fix{$sign_off}{'suggestion'};
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
