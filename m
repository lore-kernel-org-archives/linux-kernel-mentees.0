Return-Path: <SRS0=PE7C=DY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05A38C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Oct 2020 16:28:02 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 804092074A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Oct 2020 16:28:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="t4z/pDT8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 804092074A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0DA4B87E59;
	Sat, 17 Oct 2020 16:28:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tx4e1D00G0aS; Sat, 17 Oct 2020 16:28:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0483A87E52;
	Sat, 17 Oct 2020 16:27:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D233BC0052;
	Sat, 17 Oct 2020 16:27:59 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A823EC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 16:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9B8C887DDB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 16:27:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8cQ4WxO89c6V
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 16:27:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0335887DD9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 16:27:58 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id l18so3324817pgg.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 09:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ncjr9V8hWhASX7GIOyrLkyJY1TQp2fFEJrqAO+qOGx4=;
 b=t4z/pDT8KwU7vYU8K5+n3ABCnTdw1fFu21Uk8SkdzEqKRA+ORmoUzfZx4Hzv3QDIhp
 YLkjvzt+rxcRTvhqktscJEaqy6ARVD12SVNLj12qA2WZIDgf7SLlvxkXePhYVNUmZEiR
 6NKY0Sq/FNX/QJgXvwWQR5f4jsmveVsfDBUj6Yw9rFsS46G+h62PdyayIkOwVNKuoudj
 x912tBnYvb8tzD60qyFOPcOn0p+C+wYQrDD1DU497JYf6SV19M6MtLp5YIIwvPAdm1ei
 XuwCIa9iCuTfbN8wxlva28zzPq3FG7STlfCNA5Gme3KIRxNDmxaTG7ARULLU2XKgxBl1
 Tljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ncjr9V8hWhASX7GIOyrLkyJY1TQp2fFEJrqAO+qOGx4=;
 b=ejbuHEdiWXOnSyEAIghSEZS94RhCtqU73nTNKtOEqahOWTawef6c1GmnV3Oo7eQi3L
 5NphAJ0/E7qMahLWFRSqhOG7v70htj+f5AkB9dnoJoz8tAK04BBMNgtJna+vGjGNpjDB
 CM8WthKOQ5mXAJ0tWF0pYN7WzdLNwfWvVVi5gspUFg/q1wvAHPpWSbCD8IronrsKaoUX
 KJPjGM/KqVJVI6eP3G54XMnSQuZhY47FNB2rJBIY5buyMdn0/J+vFfqpRHgvN1aMrIYz
 Y9RmVWM0PDTjqFfP5uN1q1HV66opSrY6jOPmzan+MWg1qeKAET1uRT4Uot/R8bQXuX9d
 GbLw==
X-Gm-Message-State: AOAM533nMLujvnAjbd0C+IhdmsTJ17NCBFiXyLQUeD1di5ZILvAE0kBO
 zfdJoAIgE91z/8KCwjxj610=
X-Google-Smtp-Source: ABdhPJz0m0fZ3zExVkIbuYDYHHUh2usPfKeQI2OToi64nJGxjOhdCp2nIp6PMtoQGw/5Qg7Q3zGxRA==
X-Received: by 2002:a62:cd46:0:b029:150:ddeb:646b with SMTP id
 o67-20020a62cd460000b0290150ddeb646bmr8834755pfg.27.1602952077354; 
 Sat, 17 Oct 2020 09:27:57 -0700 (PDT)
Received: from localhost.localdomain ([49.37.87.35])
 by smtp.gmail.com with ESMTPSA id b10sm5850496pgm.64.2020.10.17.09.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Oct 2020 09:27:56 -0700 (PDT)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Sat, 17 Oct 2020 21:57:32 +0530
Message-Id: <20201017162732.152351-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v5] checkpatch: add new exception to
	repeated word check
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

Recently, commit 4f6ad8aa1eac ("checkpatch: move repeated word test")
moved the repeated word test to check for more file types. But after
this, if checkpatch.pl is run on MAINTAINERS, it generates several
new warnings of the type:

WARNING: Possible repeated word: 'git'

For example:
WARNING: Possible repeated word: 'git'
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rw/uml.git

So, the pattern "git git://..." is a false positive in this case.

There are several other combinations which may produce a wrong
warning message, such as "@size size", ":Begin begin", etc.

Extend repeated word check to compare the characters before and
after the word matches.

If there is a non whitespace character before the first word or a
non whitespace character excluding punctuation characters after
the second word, then the check is skipped and the warning is avoided.

Also add case insensitive word matching to the repeated word check.

Link: https://lore.kernel.org/linux-kernel-mentees/81b6a0bb2c7b9256361573f7a13201ebcd4876f1.camel@perches.com/
Suggested-by: Joe Perches <joe@perches.com>
Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index f1a4e61917eb..ec380626bebc 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3052,19 +3052,30 @@ sub process {
 
 # check for repeated words separated by a single space
 		if ($rawline =~ /^\+/ || $in_commit_log) {
+			pos($rawline) = 1 if (!$in_commit_log);
 			while ($rawline =~ /\b($word_pattern) (?=($word_pattern))/g) {
 
 				my $first = $1;
 				my $second = $2;
-
+				my $start_pos = $-[1];
+				my $end_pos = $+[2];
 				if ($first =~ /(?:struct|union|enum)/) {
 					pos($rawline) += length($first) + length($second) + 1;
 					next;
 				}
 
-				next if ($first ne $second);
+				next if (lc($first) ne lc($second));
 				next if ($first eq 'long');
 
+				# check for character before and after the word matches
+				my $start_char = '';
+				my $end_char = '';
+				$start_char = substr($rawline, $start_pos - 1, 1) if ($start_pos > ($in_commit_log ? 0 : 1));
+				$end_char = substr($rawline, $end_pos, 1) if ($end_pos < length($rawline));
+
+				next if ($start_char =~ /^\S$/);
+				next if (index(" \t.,;?!", $end_char) == -1);
+
 				if (WARN("REPEATED_WORD",
 					 "Possible repeated word: '$first'\n" . $herecurr) &&
 				    $fix) {
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
