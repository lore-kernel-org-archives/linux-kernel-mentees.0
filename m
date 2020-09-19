Return-Path: <SRS0=DonT=C4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C1CDC43463
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 19 Sep 2020 08:13:38 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 175CE21741
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 19 Sep 2020 08:13:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EP8+HzlU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 175CE21741
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A5C2886FF8;
	Sat, 19 Sep 2020 08:13:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cXFnZveFTjyr; Sat, 19 Sep 2020 08:13:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DDF9886E90;
	Sat, 19 Sep 2020 08:13:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C65FEC0859;
	Sat, 19 Sep 2020 08:13:34 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C7FF6C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 08:13:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B142186879
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 08:13:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pLLeF_A6w1qJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 08:13:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3C33F864AD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 08:13:33 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id w7so4979333pfi.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 01:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qo1Kncp7nKtQTMgD/J1YluzPmB67ylbz1cdDpQ+cS5k=;
 b=EP8+HzlUvVotYon/NYKsW6/THtUATQp5TfUmOCBvOYwQ9wHqZTKiA6zwD8u/IN7h8W
 ESOAfXDWGqkVGLQSwVPxXqP9Oyba8OFWKsCmvCi5HuqO868vGzHQDxUqu50YrCL19ySY
 uAfhsCrPNB2rqcwU8w3POpzDl43JAMA4BW/BZzKXAtyMSC4c8s39VXOuicaqOvt4rOqq
 5MEZLwPMrmf1KLPoHDpXsmGlHvU+xPZTLY5QWHe1H5jn/BOkjOokvrp6VzFXHPZS8aEZ
 Cna/GDso0xnNpdMrbUM/Qk89u2NlNNQm0Q4FrHUNh04jyLPSQ8AyNiBSE3fBy77uCuIn
 lsdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qo1Kncp7nKtQTMgD/J1YluzPmB67ylbz1cdDpQ+cS5k=;
 b=pogaBZDhf+GrNU1UkY11fTKZlBZbnv2J1jaq2b+5Dl3jogPyCeRp5PVLuq+RFzFSkY
 inMX1Y09+3uMQzWO2hC34t7QQChyZHbHZjOqCYG2ejJcIAUr8EM5sxpqVKEPk5m7/Ng6
 HfkuY9yI0LdzXXXoROfpPizZth9iRK8SjQ0uBj7/Qhvqb2QJoN//+7X52f6JxtRH05r2
 SWiLXoawvsYMhdFB6XNgVsPTot99n5VowTsnQ51K5Oz1pUZabcUJhVHVkhHiPuAVubf8
 aBVjZX7e/hb4XmtJkDUPjRge74cjlTW5ngKh5590qSAC4Mz6EdpP3x7EfgmVfT7FMcJ+
 w9ww==
X-Gm-Message-State: AOAM5318/jHcfyer7UR5iDH9ss2/i5nfqlUWd/kHaWyegwVc4SXHIJoV
 SU0AxE2pI99EKivIfNc1Kok=
X-Google-Smtp-Source: ABdhPJxkjZjT5tsSB75IW5oSZ/wI8SxbNKgOOYjkAPAa384Q2qlI/PfR5bdMAORT0BOWL2DqJ2uPYQ==
X-Received: by 2002:a63:2c4:: with SMTP id 187mr24754410pgc.127.1600503212626; 
 Sat, 19 Sep 2020 01:13:32 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:9004:68b6:22a6:478b:7326:9143])
 by smtp.gmail.com with ESMTPSA id br22sm4853463pjb.35.2020.09.19.01.13.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Sep 2020 01:13:32 -0700 (PDT)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Sat, 19 Sep 2020 13:42:25 +0530
Message-Id: <20200919081225.28624-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: apw@canonical.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, dwaipayanray1@gmail.com
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: extend author
	Signed-off-by check for split From: header
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

Checkpatch did not handle cases where the author From: header
was split into two lines. The author string went empty and
checkpatch generated a false NO_AUTHOR_SIGN_OFF warning.

Support split From: headers in AUTHOR_SIGN_OFF check by adding
an additional clause to resolve author identity in such cases.

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 504d2e431c60..86975baead22 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1210,6 +1210,16 @@ sub reformat_email {
 	return format_email($email_name, $email_address);
 }
 
+sub format_author_email {
+	my ($email, $from) = @_;
+
+	$email = encode("utf8", $email) if ($from =~ /=\?utf-8\?/i);
+	$email =~ s/"//g;
+	$email = reformat_email($email);
+
+	return $email;
+}
+
 sub same_email_addresses {
 	my ($email1, $email2) = @_;
 
@@ -2347,6 +2357,7 @@ sub process {
 	my $signoff = 0;
 	my $author = '';
 	my $authorsignoff = 0;
+	my $prevheader = '';
 	my $is_patch = 0;
 	my $is_binding_patch = -1;
 	my $in_header_lines = $file ? 0 : 1;
@@ -2658,12 +2669,21 @@ sub process {
 			}
 		}
 
+# Check the patch for a split From:
+		if($prevheader ne '') {
+			if ($author eq '' && decode("MIME-Header", $prevheader) =~ /^From:\s*(.*)/) {
+				my $email = $1.$line;
+				$author = format_author_email($email, $prevheader);
+			}
+			$prevheader = '';
+		}
+
 # Check the patch for a From:
 		if (decode("MIME-Header", $line) =~ /^From:\s*(.*)/) {
-			$author = $1;
-			$author = encode("utf8", $author) if ($line =~ /=\?utf-8\?/i);
-			$author =~ s/"//g;
-			$author = reformat_email($author);
+			$author = format_author_email($1, $line);
+			if($author eq '') {
+				$prevheader = $line;
+			}
 		}
 
 # Check the patch for a signoff:
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
