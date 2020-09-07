Return-Path: <SRS0=YKtx=CQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 843B4C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Sep 2020 15:14:54 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3598320678
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Sep 2020 15:14:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Gx46FcVP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3598320678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=disroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DCE3987190;
	Mon,  7 Sep 2020 15:14:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f+GMmH6qfX1E; Mon,  7 Sep 2020 15:14:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 517A687182;
	Mon,  7 Sep 2020 15:14:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3B5E9C0859;
	Mon,  7 Sep 2020 15:14:52 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 08D36C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 15:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0372620518
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 15:14:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rt7UcViyH2FY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 15:14:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from knopi.disroot.org (knopi.disroot.org [178.21.23.139])
 by silver.osuosl.org (Postfix) with ESMTPS id 6C31F2037B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 15:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 227DB52936;
 Mon,  7 Sep 2020 17:14:47 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5GcKh7PTF4hG; Mon,  7 Sep 2020 17:14:45 +0200 (CEST)
From: Ayush <ayush@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1599491685; bh=HinIpuOUT+QkPKWSb0kfKn4YjfUkYh9Vg3GGwh1NrCs=;
 h=From:To:Cc:Subject:Date;
 b=Gx46FcVPELLOUN2BkOKb4WwOxSj3HuiQASQCwXReo4njUMdojg6NCf3HRQKEVmEcb
 1DIuGVaFAr8XNQFq7De5P8/Eb4OtLg1BwP/QrnYju8Z81gtwKaKe0hn6IJ7ycqdeH9
 +ALg4X29ygfpVqaB0NMrfuU0RSdxU4YxtJ4nd01mEXciDFek5wksjf1qX/tva/Xn2W
 a6Oqbukh3hVniXqzlLBdTJR29zs7Wm7i1oltlhW0zW5M35kIV9JEIJ8JJT3pAUwPvU
 zX35cRgEYn53OggpNEQzTBRqtErdgAyt5/dHz5DQq6azLLZISdxfXXQo/W7lWbcMG9
 G3fwiLSVkFvig==
To: apw@canonical.com,
	joe@perches.com
Date: Mon,  7 Sep 2020 20:44:17 +0530
Message-Id: <20200907151417.44453-1-ayush@disroot.org>
Mime-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: GIT_COMMIT_ID: handle
	commit messages with multiple quotes
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

Commits which mentioned/referenced "revert commits" in their description will
get error even if they follow the proper syntax.

for reference:
commit e8a170ff9a35 ("drm/amdgpu: enable -msse2 for GCC 7.1+ users")

This patch checks for quotes inside the commit message and adds it
to $orig_desc.

Earlier, the script just won't update in case of such commit message.
I modified old condition and added new conditions to check possible
patterns.

Following patters are solved (commit taken as example):
- commit 193392ed9f69 ("Revert "drm/amd/display: add -msse2 to prevent Clang from emitting libcalls to undefined SW FP routines"")

- commit 193392ed9f69 ("Revert
"drm/amd/display: add -msse2 to prevent Clang from emitting libcalls to undefined SW FP routines"")

- commit 193392ed9f69 ("Revert "drm/amd/display:
add -msse2 to prevent Clang from emitting libcalls to undefined SW FP routines"")

- commit 193392ed9f69
("Revert "drm/amd/display: add -msse2 to prevent Clang from emitting libcalls to undefined SW FP routines"")

Signed-off-by: Ayush <ayush@disroot.org>
---
 scripts/checkpatch.pl | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 149518d2a6a7..e90e13b013d3 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2862,23 +2862,42 @@ sub process {
 				$orig_desc = $1;
 				$hasparens = 1;
 			} elsif ($line =~ /\bcommit\s+[0-9a-f]{5,}\s*$/i &&
-				 defined $rawlines[$linenr] &&
-				 $rawlines[$linenr] =~ /^\s*\("([^"]+)"\)/) {
+				 defined $rawlines[$linenr]) {
+				if ($rawlines[$linenr] =~ /^\s*\("([^"]+)"\)/) {
+					$orig_desc = $1;
+					$hasparens = 1;
+				} elsif ($rawlines[$linenr] =~ /^\s*\("([^"]+"[^"]+[^"]")"\)/) {
+					$orig_desc = $1;
+					$hasparens = 1;
+				}
+			} elsif ($line =~ /\bcommit\s+[0-9a-f]{5,}\s+\("[^"]+$/i &&
+				 defined $rawlines[$linenr]) {
+				$line =~ /\bcommit\s+[0-9a-f]{5,}\s+\("([^"]+)$/i;
 				$orig_desc = $1;
+				if($rawlines[$linenr] =~ /^\s*[^"]+"\)/) {
+					$rawlines[$linenr] =~ /^\s*([^"]+)"\)/;
+					$orig_desc .= " " . $1;
 				$hasparens = 1;
-			} elsif ($line =~ /\bcommit\s+[0-9a-f]{5,}\s+\("[^"]+$/i &&
+				} elsif ($rawlines[$linenr] =~ /^\s*"[^"]+""\)/) {
+					$rawlines[$linenr] =~ /^\s*("[^"]+")"\)/;
+					$orig_desc .= " " . $1;
+					$hasparens = 1;
+				}
+			} elsif ($line =~ /\bcommit\s+[0-9a-f]{5,}\s+\("([^"]+"[^"]+[^"]")"\)/i) {
+				$orig_desc = $1;
+			    $hasparens = 1;
+			} elsif ($line =~ /\bcommit\s+[0-9a-f]{5,}\s+\("[^"]+"[^"]+$/i &&
 				 defined $rawlines[$linenr] &&
-				 $rawlines[$linenr] =~ /^\s*[^"]+"\)/) {
-				$line =~ /\bcommit\s+[0-9a-f]{5,}\s+\("([^"]+)$/i;
+				 $rawlines[$linenr] =~ /^\s*[^"]+""\)/) {
+				$line =~ /\bcommit\s+[0-9a-f]{5,}\s+\("([^"]+"[^"]+)$/i;
 				$orig_desc = $1;
-				$rawlines[$linenr] =~ /^\s*([^"]+)"\)/;
+				$rawlines[$linenr] =~ /^\s*([^"]+")"\)/;
 				$orig_desc .= " " . $1;
 				$hasparens = 1;
 			}
 
 			($id, $description) = git_commit_info($orig_commit,
 							      $id, $orig_desc);

 			if (defined($id) &&
 			   ($short || $long || $space || $case || ($orig_desc ne $description) || !$hasparens)) {
 				ERROR("GIT_COMMIT_ID",
-- 
2.28.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
