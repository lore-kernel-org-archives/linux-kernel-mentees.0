Return-Path: <SRS0=Y4zm=D6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BAE8C388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Oct 2020 13:39:04 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91A5220FC3
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Oct 2020 13:39:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MbsGjegx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91A5220FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0009487377;
	Fri, 23 Oct 2020 13:39:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IijFpnBmR7be; Fri, 23 Oct 2020 13:39:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7275D87319;
	Fri, 23 Oct 2020 13:39:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 58D24C088B;
	Fri, 23 Oct 2020 13:39:02 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4B1C1C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 13:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1F6932076B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 13:39:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O1FikDWDzXJo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 13:39:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by silver.osuosl.org (Postfix) with ESMTPS id 2268A20362
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 13:39:00 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id 10so1316413pfp.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 06:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=uws+JYyiHml5EpGq+vV5iyy96yuu5XLUr066AbKDfI8=;
 b=MbsGjegxzI0teFzRZSVx9j0E/NXIRk8k6/wqGbQVRxWnh+AN0PUP5wbti2gfnqtSI7
 Kl7WxroJxfCeq4CknbLZShPVbc/BaHXsrHfs7Q79S96SJz5FoDtoxTZvb/DQcYGuEH1w
 3Vjz2Iq1j7p3qAMgRx8CZyU+PbCmnf46Hd9WCjviXkHPEr2FQ1z4p5yo1H8hSNUYZktr
 2yH2RVVrrg2N7iDaDYt5rLAlwJ9uzNDpA3CnCZboQwWuOF191pim1coL6uHwap5Ll1Rk
 hs5i0a9t1RL967ZT3JT2GdYTsurO3aFVdQ4+p38BpgAAtraLnOju0HS7bGFxGXJdxWUX
 JpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=uws+JYyiHml5EpGq+vV5iyy96yuu5XLUr066AbKDfI8=;
 b=QI/CYorCEhMELDvCQ4WKZTf2PS+MqHmUf2AyHnMc7JMdqYUN3ZvMTNO5IgcScwEhiH
 5K+h6VBYLtoxDVjRNHtonl2akdJy2mTuCCdzexmCvxGxdM4RUuYmRpAS4tLZTe0MHB7p
 ZyIu4wZslhWW5IQrFcIxVYvvxLIu7PTjby7KtW02ckxs8gkX0hHCvvEGGDuFKm5OFh9j
 CL0IH4Jlm9qAcbyYGRFxzzOjSdp+dhTEuE2YzuDSAqw+mxiEoJB53zZHrXDFBuTn6fV0
 3c15pK5EK5W+gaXkzL8JXuuIdW1SdBcp5PW20/4R72NOi3knJhDULftuGC0tAv6q7IU7
 FjOg==
X-Gm-Message-State: AOAM531M0jYrcydjfGLrKgquLeHn6fcIGZikAgcqaLGX/yNkGB72Ocue
 LgmSPWVNeMy7xUp7S4Q3+MY=
X-Google-Smtp-Source: ABdhPJzublLYTRPjOB1KBR4G7XBHj4nlp5zrC+neZQ8N2fPuRMGgDLGyJrnPYHDaUprRnfLalqn5TA==
X-Received: by 2002:a17:90a:65cc:: with SMTP id
 i12mr2569971pjs.193.1603460338119; 
 Fri, 23 Oct 2020 06:38:58 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:429:6ba7:30ef:4722:a786:585f])
 by smtp.googlemail.com with ESMTPSA id z23sm1932467pgf.12.2020.10.23.06.38.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 06:38:57 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: joe@perches.com
Date: Fri, 23 Oct 2020 19:08:28 +0530
Message-Id: <20201023133828.19609-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Aditya Srivastava <yashsri421@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 dwaipayanray1@gmail.com
Subject: [Linux-kernel-mentees] [PATCH v3] checkpatch: fix false positives
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

Here, it reports 'ff' and 'root to be repeated, but it is in fact part
of some address or code, where it has to be repeated.

In these cases, the intent of the warning to find stylistic issues in
commit messages is not met and the warning is just completely wrong in
this case.

To avoid these warnings, add additional regex check for the
directory permission pattern and avoid checking the line for this
class of warning. Similarly, to avoid hex pattern, check if the word
consists of hex symbols and skip this warning if it is not among the
common english words formed using hex letters.

A quick evaluation on v5.6..v5.8 showed that this fix reduces
REPEATED_WORD warnings from 2797 to 907.

A quick manual check found all cases are related to hex output or
list command outputs in commit messages.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 scripts/checkpatch.pl | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 9b9ffd876e8a..3bd8205c48d8 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3051,7 +3051,9 @@ sub process {
 		}
 
 # check for repeated words separated by a single space
-		if ($rawline =~ /^\+/ || $in_commit_log) {
+# avoid false positive from list command eg, '-rw-r--r-- 1 root root'
+		if (($rawline =~ /^\+/ || $in_commit_log) &&
+				$rawline !~ /[bcCdDlMnpPs\?-][rwxsStT-]{9}/) {
 			while ($rawline =~ /\b($word_pattern) (?=($word_pattern))/g) {
 
 				my $first = $1;
@@ -3065,6 +3067,17 @@ sub process {
 				next if ($first ne $second);
 				next if ($first eq 'long');
 
+				# avoid repeating hex occurrences like 'ff ff fe 09 ...'
+				my @non_hex_words = (
+					"add", "added", "ace", "aced", "bad", "be", "bed", "bead",
+					"beaded", "bedded", "cab", "cabbed", "cede", "ceded",
+					"dead", "deaf", "deb", "decade", "deed", "deface", "defaced", "efface",
+					"effaced", "face", "faced", "fade", "faded", "fed", "fee", "feed"
+				);
+				if ($first =~ /\b[0-9a-f]{2,}\b/) {
+					next if (!grep(/^$first$/, @non_hex_words));
+				}
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
