Return-Path: <SRS0=G515=D5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF733C55179
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Oct 2020 14:50:52 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4232624197
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Oct 2020 14:50:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ATORAaEH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4232624197
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 98CDE87831;
	Thu, 22 Oct 2020 14:50:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nUcOKFKzlgzO; Thu, 22 Oct 2020 14:50:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 118D1875CF;
	Thu, 22 Oct 2020 14:50:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EFCD4C0052;
	Thu, 22 Oct 2020 14:50:50 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EC105C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 14:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DDB9F87831
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 14:50:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a+kg9LXjX73y
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 14:50:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1CBB6875CF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 14:50:48 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id t4so1065683plq.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 07:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=MaModaN+/sVf8Cgdp6hffgsQePCGB5G1xW2BzLPiDLI=;
 b=ATORAaEHRLju/xDhnBYQSd9eUdaapI2TLLsacoAfLCpdq9lnS6eOHqC4pEVo+zrfhr
 usStwU5K1pnL2dS/ZY0aa1ahfQDbFB4jmNDYRsUfJ6QMvZxHpQJoECnPkvsXjbSNIIWk
 lmZWq+PGjIRktcem4Ubt98ReS4My/MIuA2kH7R1NpYRYTR/YTSAR+IeAPvt2bOUmjFi7
 vg7/F6lhXoQWvdXltMIQ5CqZCuiGMSk8G9/7axIqsUQoMOfKlHrga4nDhAkUBSAroNFX
 uq3Tw5+36IYjY08Lm6bgTUGs+uEU3HXow1kWcKdTFEKw252ZJBglcXhuRqU4+O8PkIhV
 JgTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=MaModaN+/sVf8Cgdp6hffgsQePCGB5G1xW2BzLPiDLI=;
 b=UerfqIQcE7DkVhl0hKY4pT+qyhM92JOTuZ1eetWpQpozNRcDs0VXJGzuwzfXpIrSFg
 txv17jV/11mJIbh7GCGbxRuvuTBVYkrVXG4ruKuTKeN9joV1ryJ6OkFekyAa5LinKZFH
 pFOtQNm95gTSsVPAFFCbFfkxCSHGm4d7fhl12pEe67Hej+PsH/fCSyOTMpeVn1feIJGe
 koLWDNZaFNpQbM/vEWzbCHYd9sP/wUtPo0Pdeh54S35rU0HULCfm6MDAdOuNGF4l7DMM
 bjHb7v1eNhLpIycHwbajPQKtdTAnaWHbQNpGb5/nMfyvvA6DSBvP51DVN8Dmy/pngpsB
 jRdg==
X-Gm-Message-State: AOAM531+UmNaG7W3BRvyTYB+H6bWM9JsSHBxd9asYzygn2EtLm5Qt4dH
 6aQRDTABRnxSO5UNtirG5dg=
X-Google-Smtp-Source: ABdhPJz/5oVSh4IIHytnN2Co+bqhq3sqEBCvWFuNxfM3wiApT3nuTVQ9lgs4YfCQ/fBAGeeF81a3TA==
X-Received: by 2002:a17:90a:3007:: with SMTP id
 g7mr2692283pjb.58.1603378247164; 
 Thu, 22 Oct 2020 07:50:47 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:41a:7419:e1bd:6bc1:d06a:efd1])
 by smtp.googlemail.com with ESMTPSA id
 c187sm2871677pfc.153.2020.10.22.07.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2020 07:50:46 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: joe@perches.com
Date: Thu, 22 Oct 2020 20:20:21 +0530
Message-Id: <20201022145021.28211-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Aditya Srivastava <yashsri421@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 dwaipayanray1@gmail.com
Subject: [Linux-kernel-mentees] [PATCH v2] checkpatch: fix false positives
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
consists of hex symbols and skip this warning if, it forms a pattern
of repeating sequence or contains more special character after pattern
than non hex characters.

A quick evaluation on v5.6..v5.8 showed that this fix reduces
REPEATED_WORD warnings from 2797 to 907.

A quick manual check found all cases are related to hex output or
list command outputs in commit messages.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 scripts/checkpatch.pl | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 9b9ffd876e8a..0f57e99ed670 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3051,7 +3051,10 @@ sub process {
 		}
 
 # check for repeated words separated by a single space
-		if ($rawline =~ /^\+/ || $in_commit_log) {
+# avoid false positive from list command eg, '-rw-r--r-- 1 root root'
+		if (($rawline =~ /^\+/ || $in_commit_log) &&
+		$rawline !~ /[bcCdDlMnpPs\?-][rwxsStT-]{9}/) {
+			my @hex_seq = $rawline =~ /\b[0-9a-f]{2,} \b/g;
 			while ($rawline =~ /\b($word_pattern) (?=($word_pattern))/g) {
 
 				my $first = $1;
@@ -3065,6 +3068,34 @@ sub process {
 				next if ($first ne $second);
 				next if ($first eq 'long');
 
+				# avoid repeating hex occurrences like 'ff ff fe 09 ...'
+				if ($first =~ /\b[0-9a-f]{2,}/) {
+					# if such sequence occurs more than 4, it is most probably part of some of code
+					next if ((scalar @hex_seq)>4);
+
+					# for hex occurrences which are less than 4
+					# get first hex word in the line
+					if ($rawline =~ /\b[0-9a-f]{2,} /) {
+						my $post_hex_seq = $';
+
+						# set suffieciently high default values to avoid ignoring or counting in absence of another
+						my $non_hex_char_pos = 1000;
+						my $special_chars_pos = 500;
+
+						if ($post_hex_seq =~ /[g-z]+/) {
+							# first non hex character in post_hex_seq
+							$non_hex_char_pos = $-[0];
+						}
+						if($post_hex_seq =~ /[^a-zA-Z0-9]{2,}/) {
+							# first occurrence of 2 or more special chars
+							$special_chars_pos = $-[0];
+						}
+
+						# as such occurrences are not common, it is more likely to be a part of some code
+						next if ($special_chars_pos<$non_hex_char_pos);
+					}
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
