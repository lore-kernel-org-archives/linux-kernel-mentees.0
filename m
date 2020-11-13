Return-Path: <SRS0=I6GU=ET=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1620EC388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Nov 2020 12:31:37 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51CDC2065E
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Nov 2020 12:31:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PP5OGMCA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51CDC2065E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id DAE5D204A7;
	Fri, 13 Nov 2020 12:31:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hrqK8hk7u5SI; Fri, 13 Nov 2020 12:31:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 471242048B;
	Fri, 13 Nov 2020 12:31:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 32699C0FAA;
	Fri, 13 Nov 2020 12:31:34 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3BE51C088E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 12:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 31E6A87498
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 12:31:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Kr7n17O2fTA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 12:31:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 653A687497
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 12:31:32 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id j19so178365pgg.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 04:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/6mQ9czDeNuZjqSI00ivo4f1F821Tujfsv0cKG8Lv8k=;
 b=PP5OGMCAcdjMBBeG0kkfSQv+y1gwugp1XUD7N8xJpgyjfq/wA5Y6uOIGkYIdwd63nR
 UlAnBrON3PZuoXC4OqrqdyCKQc2y2oUy4kPjygWG5gJgqEhKFIRRxubEO5DmCr2x7BnD
 XxJigFYrEHaW/YqQ/eD/RdgZhu09eDTTS3qaXZTs4m2Gx2RO7xu6vQrbkXRwEiEJta11
 4ZgO5XOWE9hMqlYd9J/aXGeNXilPfw93QQ8C0JDLyonu0wk1YB/x8hIR7XkSCD6SX0RW
 cyqmUFuXfC3JdhF4KQP86zkk4L0g9nsYRG1gpdhwx2+EHBXTEUnApUJjnicNB8V69Qr/
 jTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/6mQ9czDeNuZjqSI00ivo4f1F821Tujfsv0cKG8Lv8k=;
 b=mVAl8Oiq4iNTCc6MvdBCoeeY/zp1CBPEhHaRBEAgv7sjQb0JDBJpoT0mdnCun7iPu4
 ilu69Of9cIYnsgzqWR69WdXs18puzhXsxyTbit7tRNwXxw6WDKB3ef7+FSso4yc0h6gk
 sKX/b06eBywadZUHWWkGlvoCFe1urR38ouYYB01LEA6+YliJFYI335ZMPaceDWcVTpRW
 RtmOcDxeCHWsJ5/LBsuwFO2oIV87Kt/CB+Aa6Xh/DVhjjCPwin5g1vG/K6lbQP6E+q61
 kVYFV9LbdpB7yEXZAVuYA8MdtyGXZ64OQTqS27xn38Gm19cUKFrYwuKOxcIVUI7i718z
 84ZQ==
X-Gm-Message-State: AOAM5337phV7iix7jaWcv4QFtOBCtmHgngI27dESKWHRFT/EyZf8+dum
 4HRxU22BG2iTfGkv8T3tVdU=
X-Google-Smtp-Source: ABdhPJzHTscFdDbU+jgocb+g0TaFD9aR+gb4VoHte6gYYbnVNHFmu2e09HpnyWbiLFe5t1hXHlzqhQ==
X-Received: by 2002:aa7:8c4f:0:b029:18b:f361:4aa3 with SMTP id
 e15-20020aa78c4f0000b029018bf3614aa3mr1905564pfd.73.1605270691778; 
 Fri, 13 Nov 2020 04:31:31 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:6819:f451:9e0a:873f:ed68])
 by smtp.gmail.com with ESMTPSA id l17sm10627610pjy.29.2020.11.13.04.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 04:31:30 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Fri, 13 Nov 2020 18:01:01 +0530
Message-Id: <20201113123101.29057-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH RFC] checkpatch: add new cases to
	commit handling
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

Commit extraction in checkpatch fails in some cases.
One of the most common false positives is a split line
between "commit" and the git SHA of the commit.

Improve commit handling to reduce false positives.

Improvements:
- handle split line between commit and git SHA of commit.
- fix handling of split commit description.

A quick evaluation of 50k commits from v5.4 showed that
the GIT_COMMIT_ID errors dropped from 1032 to 897. Most
of these were split lines between commit and its hash.

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 024514946bed..f5ba2beac008 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2990,6 +2990,16 @@ sub process {
 			if ($line =~ /\bcommit\s+[0-9a-f]{5,}\s+\("([^"]+)"\)/i) {
 				$orig_desc = $1;
 				$hasparens = 1;
+			} elsif ($line =~ /^\s*[0-9a-f]{5,}\s+\("([^"]+)"\)/i &&
+				 defined $rawlines[$linenr-2] &&
+				 $rawlines[$linenr-2] =~ /\bcommit\s*$/i) {
+				$line =~ /^\s*[0-9a-f]{5,}\s+\("([^"]+)"\)/i;
+				$orig_desc = $1;
+				$hasparens = 1;
+				$space = 0;
+				$short = 0 if ($line =~ /\b[0-9a-f]{12,40}/i);
+				$long = 1 if ($line =~ /\b[0-9a-f]{41,}/i);
+				$case = 0 if ($line =~ /\b[0-9a-f]{5,40}[^A-F]/ && $rawlines[$linenr-2] =~ /\b[Cc]ommit\s*$/);
 			} elsif ($line =~ /\bcommit\s+[0-9a-f]{5,}\s*$/i &&
 				 defined $rawlines[$linenr] &&
 				 $rawlines[$linenr] =~ /^\s*\("([^"]+)"\)/) {
@@ -3001,7 +3011,9 @@ sub process {
 				$line =~ /\bcommit\s+[0-9a-f]{5,}\s+\("([^"]+)$/i;
 				$orig_desc = $1;
 				$rawlines[$linenr] =~ /^\s*([^"]+)"\)/;
-				$orig_desc .= " " . $1;
+				my $split_desc = $1;
+				$split_desc = " $split_desc" if ($line =~ /[\w\,\.]$/);
+				$orig_desc .= $split_desc;
 				$hasparens = 1;
 			}
 
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
