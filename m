Return-Path: <SRS0=5+BN=GH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 748A4C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  4 Jan 2021 13:25:53 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01C07207AE
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  4 Jan 2021 13:25:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01C07207AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7C46E85F71;
	Mon,  4 Jan 2021 13:25:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UK1n-NVs88-d; Mon,  4 Jan 2021 13:25:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A57A685D3D;
	Mon,  4 Jan 2021 13:25:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9ED10C088B;
	Mon,  4 Jan 2021 13:25:51 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BB182C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Jan 2021 13:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A9E3F870EA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Jan 2021 13:25:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AFnFExoc5if1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Jan 2021 13:25:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 00E1B870DE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Jan 2021 13:25:49 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id b8so14551229plx.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 04 Jan 2021 05:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wd6v6NV3QH+choqFacBY5QqMB1xLnvsemq4BBaXi04A=;
 b=pfEQhSwIH5b9Ox6JdZ57ycB4C1F/coqHVrLwtmpr6FOaUFfdhWT4VPHycztzB2Abg3
 bCXfF7ZWbSRhIpcDLw2l0siamOb8rnN7OvSMTwh16a/WhMEfPQqp2/J2S6xeytfXtxMh
 7M+4SUYW8831WMcXFTcJos17zbJlRuxHp21VzzxXiX6r5R0vpFnpq+WFuKE6qWw9YUKj
 C/guy/HZOGbgsgQr5f0oGUUp6yFJWiyaT3h+lqS2zdEuNbPgld1rAZavjyf0hYiLlQaG
 9AXSWf0Sx5o02deyi5NC2If9iGo1Z16n+Ap8A3t1sIi7+rjuVTsUYWxXOYsK8iDT9wJW
 LNcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wd6v6NV3QH+choqFacBY5QqMB1xLnvsemq4BBaXi04A=;
 b=scIV+DywCKQEnU50/otiaYIeP496tyQZKumthdxH4C266GswD4cWtf5F/DE7Z1OsZx
 rTlE/H7+2GJki9k6A5ASTiDi6XiOvVXqchqEqC9PSvPGOETeSSl6YNnLG8FORQpztpiW
 RxEGzTwoLUr9pSUeQ4gdjAOrjGvXQnvpkC9bHiNj2as+bfM/Dv4B9G/4vgkD2mZs+yAW
 NDwKvClL+yVVI0SHrhIXvkefeLrBkJrqcTkZQEXeuqyOG+oJmSMAO7oiSyI1cFry9Mk9
 j7Y4gJ5tY1e+H4KEqztAZCtMecOMFt1+iXMgHmF8FlbMJ1AalPl0OulgMxT6V7ihTpSy
 S48g==
X-Gm-Message-State: AOAM532XXL7P8oCBqE+PzSViRFl4xA3a80A95HKZQwerUb80LAwdINmt
 RNkQwvtziep9RW4HaEzoOgs=
X-Google-Smtp-Source: ABdhPJzKCxE9lXY0sYFlj/F045/V/bIJ27d8sXYC2pZ0h69N22udoiRlR0JYOtKehuGl14G+n5NOug==
X-Received: by 2002:a17:902:59d0:b029:da:69a8:11a8 with SMTP id
 d16-20020a17090259d0b02900da69a811a8mr73401210plj.63.1609766749265; 
 Mon, 04 Jan 2021 05:25:49 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:68a1:dd5e:15ee:643c:b4db])
 by smtp.gmail.com with ESMTPSA id c10sm21479605pjn.22.2021.01.04.05.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 05:25:48 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Mon,  4 Jan 2021 18:55:35 +0530
Message-Id: <20210104132536.38016-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: trivial style fixes
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

Indentations should use tabs wherever possible.
Replace spaces by tabs for indents.

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index b212f5f12ca6..d6a4d25b0972 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2973,7 +2973,7 @@ sub process {
 				}
 				if (!defined $lines[$linenr]) {
 					WARN("BAD_SIGN_OFF",
-                                             "Co-developed-by: must be immediately followed by Signed-off-by:\n" . "$here\n" . $rawline);
+					     "Co-developed-by: must be immediately followed by Signed-off-by:\n" . "$here\n" . $rawline);
 				} elsif ($rawlines[$linenr] !~ /^\s*signed-off-by:\s*(.*)/i) {
 					WARN("BAD_SIGN_OFF",
 					     "Co-developed-by: must be immediately followed by Signed-off-by:\n" . "$here\n" . $rawline . "\n" .$rawlines[$linenr]);
@@ -2996,8 +2996,8 @@ sub process {
 			if (ERROR("GERRIT_CHANGE_ID",
 			          "Remove Gerrit Change-Id's before submitting upstream\n" . $herecurr) &&
 			    $fix) {
-                                fix_delete_line($fixlinenr, $rawline);
-                        }
+				fix_delete_line($fixlinenr, $rawline);
+			}
 		}
 
 # Check if the commit log is in a possible stack dump
@@ -3239,10 +3239,10 @@ sub process {
 				next if ($start_char =~ /^\S$/);
 				next if (index(" \t.,;?!", $end_char) == -1);
 
-                                # avoid repeating hex occurrences like 'ff ff fe 09 ...'
-                                if ($first =~ /\b[0-9a-f]{2,}\b/i) {
-                                        next if (!exists($allow_repeated_words{lc($first)}));
-                                }
+				# avoid repeating hex occurrences like 'ff ff fe 09 ...'
+				if ($first =~ /\b[0-9a-f]{2,}\b/i) {
+					next if (!exists($allow_repeated_words{lc($first)}));
+				}
 
 				if (WARN("REPEATED_WORD",
 					 "Possible repeated word: '$first'\n" . $herecurr) &&
@@ -4426,7 +4426,7 @@ sub process {
 			WARN("STATIC_CONST_CHAR_ARRAY",
 			     "char * array declaration might be better as static const\n" .
 				$herecurr);
-               }
+		}
 
 # check for sizeof(foo)/sizeof(foo[0]) that could be ARRAY_SIZE(foo)
 		if ($line =~ m@\bsizeof\s*\(\s*($Lval)\s*\)@) {
@@ -5279,7 +5279,7 @@ sub process {
 		    $lines[$linenr - 3] !~ /^[ +]\s*$Ident\s*:/) {
 			WARN("RETURN_VOID",
 			     "void function return statements are not generally useful\n" . $hereprev);
-               }
+		}
 
 # if statements using unnecessary parentheses - ie: if ((foo == bar))
 		if ($perl_version_ok &&
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
