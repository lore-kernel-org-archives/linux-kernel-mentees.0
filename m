Return-Path: <SRS0=2/a+=CV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A24BCC43461
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Sep 2020 09:48:56 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BC14214D8
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Sep 2020 09:48:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="QB8YDwRr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BC14214D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=disroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1825987817;
	Sat, 12 Sep 2020 09:48:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wHoyzH4OI0N4; Sat, 12 Sep 2020 09:48:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1247D87816;
	Sat, 12 Sep 2020 09:48:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 051DFC0052;
	Sat, 12 Sep 2020 09:48:54 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A64A0C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 09:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9C420877E0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 09:48:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eaAK4egoRNks
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 09:48:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from knopi.disroot.org (knopi.disroot.org [178.21.23.139])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 09E8A877DB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 09:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 27F89529E8;
 Sat, 12 Sep 2020 11:48:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dvR_ToyoLeoN; Sat, 12 Sep 2020 11:48:46 +0200 (CEST)
From: Ayush <ayush@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1599904126; bh=QW8IAjeNxogWQ+wvXievuL3pKRssC65D1/gTL0THBGg=;
 h=From:To:Cc:Subject:Date;
 b=QB8YDwRrz6hBSgilW6hwXksjzupibMyo4gtfaN3c/cYrWIRV6qiG/651KY28rP7sl
 STcQoq88M3BHhV+36GtVF0uIJJsUo1Tpu3WRJJrFZ1MOUwxL+u0j4CsgIY+jScAMTA
 Zqc0JXi8w6jOqBNqaSPu7uWwzB2+fEKSO9HVJ+KL5JTw65UyVgQuEd1UmI3edAiXTD
 DMJvWjLENzKsgDi0djS4DEGjHfM5NKieLdiFAUur33Ldt2U+oW6v+l6hWaQSgF2mcA
 L8D/tQLeQv0PQ9RX7B5fnabG8KQhuZ3sjhCqfAFnMoOMdXlqRJaiXUDpCE1eoQCjZz
 XdoRUj6fAbgbQ==
To: lukas.bulwahn@gmail.com
Date: Sat, 12 Sep 2020 15:18:26 +0530
Message-Id: <20200912094826.150170-1-ayush@disroot.org>
Mime-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2] checkpatch: handle line break
	between commit and hash value
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

checkpatch.pl checks for proper references to other commits with
the intended format, commit <12+ characters of SHA-1 ID> ("<commit
message") and warns about typical mistakes. Currently, it does
not handle the case where there is a line break between commit and the
hash value.
It falsely warns that the hash is not prefixed by the word commit.

This adds new conditions to parse and identify such commits and
to not report an error in such cases.

following type of commit reference is handled:

- commit
f4d51dffc6c01 ("Linux 5.9-rc4")

This issue was discovered through a thorough analysis of checkpatch.pl
errors and warnings of type GIT_COMMIT_ID on commits between v5.7 and v5.8.

Before applying this patch, checkpatch.pl reported 342 errors of type
GIT_COMMIT_ID. After applying patch, errors reduced to 284.

Signed-off-by: Ayush <ayush@disroot.org>
---
Change in v2:
    - Add conditions to check and not report error if "commit" is last
      word of line.
    - Remove handling of multiple quotes in commit message (Will be
      added in another patch).
    - If a line break is encountered between commit and hash value, then
      it will again check for next line (starting with hash) and report 
      error. Add a condition to skip checking next line.

 scripts/checkpatch.pl | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 149518d2a6a7..42de3939a445 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -68,7 +68,7 @@ my $allow_c99_comments = 1; # Can be overridden by --ignore C99_COMMENT_TOLERANC
 my $git_command ='export LANGUAGE=en_US.UTF-8; git';
 my $tabsize = 8;
 my ${CONFIG_} = "CONFIG_";
-
+my $c_count = 0;
 sub help {
 	my ($exitcode) = @_;
 
@@ -2831,8 +2831,9 @@ sub process {
 		if ($in_commit_log && !$commit_log_possible_stack_dump &&
 		    $line !~ /^\s*(?:Link|Patchwork|http|https|BugLink|base-commit):/i &&
 		    $line !~ /^This reverts commit [0-9a-f]{7,40}/ &&
-		    ($line =~ /\bcommit\s+[0-9a-f]{5,}\b/i ||
-		     ($line =~ /(?:\s|^)[0-9a-f]{12,40}(?:[\s"'\(\[]|$)/i &&
+		    (($line =~ /\bcommit$/i && ($rawlines[$linenr] =~ /^[0-9a-f]{5,}/i))||
+		     $line =~ /\bcommit\s+[0-9a-f]{5,}\b/i ||
+		     ((($line =~ /(?:\s|^)[0-9a-f]{12,40}(?:[\s"'\(\[]|$)/i) && ($c_count++ != 1)) &&
 		      $line !~ /[\<\[][0-9a-f]{12,40}[\>\]]/i &&
 		      $line !~ /\bfixes:\s*[0-9a-f]{12,40}/i))) {
 			my $init_char = "c";
@@ -2846,12 +2847,15 @@ sub process {
 			my $id = '0123456789ab';
 			my $orig_desc = "commit description";
 			my $description = "";
+			$c_count = 0;
 
 			if ($line =~ /\b(c)ommit\s+([0-9a-f]{5,})\b/i) {
 				$init_char = $1;
 				$orig_commit = lc($2);
 			} elsif ($line =~ /\b([0-9a-f]{12,40})\b/i) {
 				$orig_commit = lc($1);
+			} elsif ($rawlines[$linenr] =~ /^([0-9a-f]{12,40})\b/i) {
+				$orig_commit = lc($1);
 			}
 
 			$short = 0 if ($line =~ /\bcommit\s+[0-9a-f]{12,40}/i);
@@ -2874,6 +2878,17 @@ sub process {
 				$rawlines[$linenr] =~ /^\s*([^"]+)"\)/;
 				$orig_desc .= " " . $1;
 				$hasparens = 1;
+			} elsif ($line =~ /\bcommit$/i &&
+				 defined $rawlines[$linenr]) {
+				if($rawlines[$linenr] =~ /\b[0-9a-f]{5,}\s+\("([^"]+)"\)/i) {
+					$orig_desc = $1;
+				}
+				$hasparens = 1;
+				$space = 0;
+				$short = 0 if ($rawlines[$linenr] =~ /^[0-9a-f]{12,40}/i);
+				$long = 1 if ($rawlines[$linenr] =~ /^[0-9a-f]{41,}/i);
+				$case = 0 if ($rawlines[$linenr] =~ /^[0-9a-f]{5,40}[^A-F]/i);
+				$c_count = 1;
 			}
 
 			($id, $description) = git_commit_info($orig_commit,
-- 
2.28.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
