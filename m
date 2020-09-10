Return-Path: <SRS0=Icdq=CT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 299DCC43461
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 10 Sep 2020 06:39:17 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11DAD221EE
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 10 Sep 2020 06:39:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Zxij6PEs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11DAD221EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=disroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B364F864A6;
	Thu, 10 Sep 2020 06:39:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SHIoVGupFuaT; Thu, 10 Sep 2020 06:39:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 28FD086463;
	Thu, 10 Sep 2020 06:39:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0D436C0052;
	Thu, 10 Sep 2020 06:39:13 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4F880C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Sep 2020 06:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 30FC08763D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Sep 2020 06:39:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cEYeID+Y0Zre
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Sep 2020 06:39:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from knopi.disroot.org (knopi.disroot.org [178.21.23.139])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C0203875EA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Sep 2020 06:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id EBDE5529A1;
 Thu, 10 Sep 2020 08:39:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HOUq0zlSkrsS; Thu, 10 Sep 2020 08:39:05 +0200 (CEST)
From: Ayush <ayush@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1599719945; bh=QGfor5MkQV6HC+R0L7de7szSfDLFY0TIhfykflNbwZg=;
 h=From:To:Cc:Subject:Date;
 b=Zxij6PEsxFOjL7tPGTWET2KYi4DtnNOvELS5s2htJfqEZOu1mu21goSQWrQ9ge6DE
 KidC6gz3JgPhWQNeKbRTf/I3pHsWuaIwz/Xew0zSma0/rqXX0H/3f7UYa9wPNk+BCw
 UheBGEMBOJEdxG40axC1tuQFUxBchcqNNQO4FoOYMYUOcDxusIgUO7Mv7fZ2Ly4j95
 lrqWulToWIIqTQvfrJ+W8ru8J0q4mJ5gBtMtXdSe87xNhqH83w4EwcPFhQMQn77IvU
 gLtEP+/HK9Ju9l3H4dNR8GS9iPqrx8Uli36QO4myMowjgAfbSPsP+zJzdWBd7W5UIW
 H9JKkBLQjb3xw==
To: lukas.bulwahn@gmail.com
Date: Thu, 10 Sep 2020 12:08:34 +0530
Message-Id: <20200910063834.42495-1-ayush@disroot.org>
Mime-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: handle line break
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

While checking for improperly formed commit desciptions,
those cases where there is a line break between commit and
hash value, are not handled properly and an error is given.

This adds new conditions to parse and identify such commits and
to not give error in such cases.

following type of cases are handled:

- Without quotes in commits message.
commit
f4d51dffc6c01 ("Linux 5.9-rc4")

- With quotes in commit message.
commit
77f4689de17c ("fix regression in "epoll: Keep a reference on files added to the check list"")

(commits taken as example only)

Signed-off-by: Ayush <ayush@disroot.org>
---
 scripts/checkpatch.pl | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 149518d2a6a7..639eb55041eb 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2831,8 +2831,9 @@ sub process {
 		if ($in_commit_log && !$commit_log_possible_stack_dump &&
 		    $line !~ /^\s*(?:Link|Patchwork|http|https|BugLink|base-commit):/i &&
 		    $line !~ /^This reverts commit [0-9a-f]{7,40}/ &&
-		    ($line =~ /\bcommit\s+[0-9a-f]{5,}\b/i ||
-		     ($line =~ /(?:\s|^)[0-9a-f]{12,40}(?:[\s"'\(\[]|$)/i &&
+		    ($line =~ /\bcommit$/i ||
+		     $line =~ /\bcommit\s+[0-9a-f]{5,}\b/i ||
+		     ($line =~ /(?:\s)[0-9a-f]{12,40}(?:[\s"'\(\[]|$)/i &&
 		      $line !~ /[\<\[][0-9a-f]{12,40}[\>\]]/i &&
 		      $line !~ /\bfixes:\s*[0-9a-f]{12,40}/i))) {
 			my $init_char = "c";
@@ -2852,6 +2853,8 @@ sub process {
 				$orig_commit = lc($2);
 			} elsif ($line =~ /\b([0-9a-f]{12,40})\b/i) {
 				$orig_commit = lc($1);
+			} elsif ($rawlines[$linenr] =~ /^([0-9a-f]{12,40})\b/i) {
+				$orig_commit = lc($1);
 			}
 
 			$short = 0 if ($line =~ /\bcommit\s+[0-9a-f]{12,40}/i);
@@ -2874,6 +2877,18 @@ sub process {
 				$rawlines[$linenr] =~ /^\s*([^"]+)"\)/;
 				$orig_desc .= " " . $1;
 				$hasparens = 1;
+			} elsif ($line =~ /\bcommit$/i &&
+				 defined $rawlines[$linenr]) {
+				if($rawlines[$linenr] =~ /\b[0-9a-f]{5,}\s+\("([^"]+)"\)/i) {
+					$orig_desc = $1;
+				} elsif($rawlines[$linenr] =~ /\b[0-9a-f]{5,}\s+\("([^"]+"[^"]+[^"]")"\)/i) {
+					$orig_desc = $1;
+				}
+				$hasparens = 1;
+				$space = 0;
+				$short = 0 if ($rawlines[$linenr] =~ /^[0-9a-f]{12,40}/i);
+				$long = 1 if ($rawlines[$linenr] =~ /^[0-9a-f]{41,}/i);
+				$case = 0 if ($rawlines[$linenr] =~ /^[0-9a-f]{5,40}[^A-F]/i);
 			}
 
 			($id, $description) = git_commit_info($orig_commit,
-- 
2.28.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
