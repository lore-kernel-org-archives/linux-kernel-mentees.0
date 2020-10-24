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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FD18C55178
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 24 Oct 2020 00:08:54 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3B46214F1
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 24 Oct 2020 00:08:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a3N6xit6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3B46214F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C3AFC86A94;
	Sat, 24 Oct 2020 00:08:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bTtsWxfxrG9U; Sat, 24 Oct 2020 00:08:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E3BEB86903;
	Sat, 24 Oct 2020 00:08:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BFD1DC088B;
	Sat, 24 Oct 2020 00:08:43 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B2DE1C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 00:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9A4218775A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 00:08:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XaB3Yda+6JrF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 00:08:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E78D387759
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 00:08:41 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id m3so100159pjf.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 17:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ELtm28Vl0mdQlp5QVj6XQMpSZ1M2eKnxUctFAp+J6CQ=;
 b=a3N6xit6/Nqlq1MUZFQ4Y4RHVbqiLwuE5DnOMiMnx6J3Hl+SEikhuBmONLM3fVip7m
 G1t/iUoiDvm9b1Sjx+0xmEpftOOx8WJwqsJU+J2V/CAuYD+MvZeo+g45lTglP2iu6Lkv
 ABBHtMSyUJg72p+gGOpfCoF7zItMd5GSCGsywMj37us49OJ+sexg9K1Khw+KFxNhfODL
 NBseTHtY+AQWAlSqfTayEv75UzDNtnLWovz2tSSQVVzH8v/DN8GN9Q4OU7cGxYUYVydw
 MCj98joQUpPnXQL2FAyiFG/CN1pIfMHctbI8Ku07JphaXx31U/zbvPqlP7wzWGK1vYZp
 H2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ELtm28Vl0mdQlp5QVj6XQMpSZ1M2eKnxUctFAp+J6CQ=;
 b=mFeow0emJmwj+xJR7ohSgGidRvk46YQuB1UVvn3w3FlOJri5B/wuiNWskKh3kXDzS6
 60ZAmtqJ0hU6kXQDykghiw24Za4jN4PxfiJeE1NwJzzXSQM1/O/L7R8ZEN5e9mYiNVIY
 RepyGNuo4M/Sr5nb1dVbpVk9iy52HSkatPgDaeqrjzG45sdOLdCwHZrkYliplaiLFHUU
 CTNgJYvHSxw3icG0d/QKOD7yrnmIhrEpw5scOMqiPc0YgP5szbi60NrRQ4SOjhHlEWCe
 ge8atCyCu1Q9w2uG8CXtLbkALPb20csyDI4B3Ox/5exlNyMta6UPNCSJGfuROx3jZ9lo
 1bPg==
X-Gm-Message-State: AOAM530rgawpgYUhImGEJrNC4JKEKD0DAxvccNQSeRDCFsOB508pa8FM
 Z70wL9yT85IU0wHEHRrauQE=
X-Google-Smtp-Source: ABdhPJy6qXABwqTeRPQqVu4tiegEa8MYXN3fKBzw0WR6Uj9vdOwcRgD59rLTgrjcEGq/luyl4N/0KQ==
X-Received: by 2002:a17:90a:be11:: with SMTP id
 a17mr5073562pjs.181.1603498121409; 
 Fri, 23 Oct 2020 17:08:41 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:429:6ba7:30ef:4722:a786:585f])
 by smtp.googlemail.com with ESMTPSA id bo16sm4252137pjb.41.2020.10.23.17.08.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 17:08:40 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: joe@perches.com
Date: Sat, 24 Oct 2020 05:38:30 +0530
Message-Id: <20201024000830.12871-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Aditya Srivastava <yashsri421@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 dwaipayanray1@gmail.com
Subject: [Linux-kernel-mentees] [PATCH v4] checkpatch: fix false positives
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
index 7e505688257a..1d42d08d520b 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3049,7 +3049,9 @@ sub process {
 		}
 
 # check for repeated words separated by a single space
-		if ($rawline =~ /^\+/ || $in_commit_log) {
+# avoid false positive from list command eg, '-rw-r--r-- 1 root root'
+		if (($rawline =~ /^\+/ || $in_commit_log) &&
+                    $rawline !~ /[bcCdDlMnpPs\?-][rwxsStT-]{9}/) {
 			pos($rawline) = 1 if (!$in_commit_log);
 			while ($rawline =~ /\b($word_pattern) (?=($word_pattern))/g) {
 
@@ -3074,6 +3076,17 @@ sub process {
 				next if ($start_char =~ /^\S$/);
 				next if (index(" \t.,;?!", $end_char) == -1);
 
+                                # avoid repeating hex occurrences like 'ff ff fe 09 ...'
+                                my %allow_repeated_words = (
+                                        add => '',
+                                        added => '',
+                                        bad => '',
+                                        be => '',
+                                );
+                                if ($first =~ /\b[0-9a-f]{2,}\b/) {
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
