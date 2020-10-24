Return-Path: <SRS0=3SZq=D7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3860C55178
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 24 Oct 2020 10:23:13 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CA4C20780
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 24 Oct 2020 10:23:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tebyPb+U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CA4C20780
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 01F2486E07;
	Sat, 24 Oct 2020 10:23:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j9NsSQLTp5L3; Sat, 24 Oct 2020 10:23:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3ADAC86DDC;
	Sat, 24 Oct 2020 10:23:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 19BAAC088B;
	Sat, 24 Oct 2020 10:23:12 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EE0F0C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 10:23:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CE341873E3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 10:23:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e-nW1waRuMaF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 10:23:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 260FE8707B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 10:23:08 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id s22so3130109pga.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 03:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=TW0QDJwCpRN+e9wSIAwnUCXLcSQzbcqS3iQfCVGdyHI=;
 b=tebyPb+UpZYBlJOP808zL4Tpl4gDzkJRzwZimWEA4zaEV9IW8sG8P1+mYZXYszOx90
 IQhlq4aCOaIRce9LE3E8xQpjDoBt7Mu2BqOn9uCCEmdeMnWqqPFF0B+tRO3AXYVSzb0C
 fCNtilLtJaElIW5oMgFxuOx9fPbEGlvjradg50ytzCACwjcHQ9VJez8RiFMEGl0WbJJJ
 QtXTCWjsHlpG57bjUfoclQxgoXHI0BjJTF15vxmBVPATQqtORsfYBEMt6+9merl40OCz
 qt6XJVpJmihUPEcWca6cmd4w06kh7kglS8JBEzUnPUv2WAeOh1mFXHx/XysmJx1BKDks
 wQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=TW0QDJwCpRN+e9wSIAwnUCXLcSQzbcqS3iQfCVGdyHI=;
 b=fXMlhleJgYzRyB8WQVvUm/mAoVJ9UVVPi6Y3uF/BOO/KqIObN1kVjPZuj55m6I/BxW
 sNllq6P/ctlKsWQs+jFr7TdkvNMN3pwpYgn80h9vnx54lPG7Z+fVSec7KGAnkfX/ArCC
 xuKDLWl0XSaDDdorwiTkgUprG3wVcQvyvLrpPKxWcs2UPwD6kSUN/dFIbet7LpW0kTAX
 IWhUOxPS9PhrptPmEh5Z1gZK/XzTEOG8HG4wSapNhhqgqpewBcR3bvEGVtXmH9ClZZJQ
 sUPSXEP6zhkEbvBdhTU4vvdejwRiXHkU8QEtjcMvstgBSVpoUYQ8wgEYr/d3jMmhsN6i
 rZqA==
X-Gm-Message-State: AOAM5318kTziaOV8R2Yp1Vq9DJb/neHhV95feiSsjhqzfgIkKv7nxM8e
 XEGN2DYCaeVrlNRGOLSnccs=
X-Google-Smtp-Source: ABdhPJy5l3E3Hsspr8E8VNeRm7cjQv3TA/Xr1wJfE++FJKlNVg7aejHcDC1bikXbQFU1Pnh/IcspZw==
X-Received: by 2002:aa7:96ce:0:b029:155:8c02:e74a with SMTP id
 h14-20020aa796ce0000b02901558c02e74amr3136988pfq.32.1603534987552; 
 Sat, 24 Oct 2020 03:23:07 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:40f:9156:55ee:fad5:f15e:347e])
 by smtp.googlemail.com with ESMTPSA id v65sm4405024pgv.21.2020.10.24.03.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Oct 2020 03:23:06 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: joe@perches.com
Date: Sat, 24 Oct 2020 15:52:53 +0530
Message-Id: <20201024102253.13614-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Aditya Srivastava <yashsri421@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 dwaipayanray1@gmail.com
Subject: [Linux-kernel-mentees] [PATCH v5] checkpatch: fix false positives
	in REPEATED_WORD warning
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

Presence of hexadecimal address or symbol results in false warning
message by checkpatch.pl.

For example, running checkpatch on commit b8ad540dd4e4 ("mptcp: fix
memory leak in mptcp_subflow_create_socket()") results in warning:

WARNING:REPEATED_WORD: Possible repeated word: 'ff'
    00 00 00 00 00 00 00 00 00 2f 30 0a 81 88 ff ff  ........./0.....

Similarly, the presence of list command output in commit results in
an unnecessary warning.

For example, running checkpatch on commit 899e5ffbf246 ("perf record:
Introduce --switch-output-event") gives:

WARNING:REPEATED_WORD: Possible repeated word: 'root'
  dr-xr-x---. 12 root root    4096 Apr 27 17:46 ..

Here, it reports 'ff' and 'root' to be repeated, but it is in fact part
of some address or code, where it has to be repeated.

In these cases, the intent of the warning to find stylistic issues in
commit messages is not met and the warning is just completely wrong in
this case.

To avoid these warnings, add an additional regex check for the
directory permission pattern and avoid checking the line for this
class of warning. Similarly, to avoid hex pattern, check if the word
consists of hex symbols and skip this warning if it is not among the
common english words formed using hex letters.

A quick evaluation on v5.6..v5.8 showed that this fix reduces
REPEATED_WORD warnings by the frequency of 1890.

A quick manual check found all cases are related to hex output or
list command outputs in commit messages.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 scripts/checkpatch.pl | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 7e505688257a..519da711cb12 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -853,6 +853,13 @@ our $declaration_macros = qr{(?x:
 	(?:SKCIPHER_REQUEST|SHASH_DESC|AHASH_REQUEST)_ON_STACK\s*\(
 )};
 
+our %allow_repeated_words = (
+	add => '',
+	added => '',
+	bad => '',
+	be => '',
+);
+
 sub deparenthesize {
 	my ($string) = @_;
 	return "" if (!defined($string));
@@ -3049,7 +3056,9 @@ sub process {
 		}
 
 # check for repeated words separated by a single space
-		if ($rawline =~ /^\+/ || $in_commit_log) {
+# avoid false positive from list command eg, '-rw-r--r-- 1 root root'
+		if (($rawline =~ /^\+/ || $in_commit_log) &&
+		    $rawline !~ /[bcCdDlMnpPs\?-][rwxsStT-]{9}/) {
 			pos($rawline) = 1 if (!$in_commit_log);
 			while ($rawline =~ /\b($word_pattern) (?=($word_pattern))/g) {
 
@@ -3074,6 +3083,11 @@ sub process {
 				next if ($start_char =~ /^\S$/);
 				next if (index(" \t.,;?!", $end_char) == -1);
 
+                                # avoid repeating hex occurrences like 'ff ff fe 09 ...'
+                                if ($first =~ /\b[0-9a-f]{2,}\b/i) {
+                                        next if (!exists($allow_repeated_words{lc($first)}));
+                                }
+
 				if (WARN("REPEATED_WORD",
 					 "Possible repeated word: '$first'\n" . $herecurr) &&
 				    $fix) {
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
