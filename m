Return-Path: <SRS0=mimn=EQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0554C388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 10:06:07 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA89C20780
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 10:06:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qvVm2ySm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA89C20780
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 22A8F871C0;
	Tue, 10 Nov 2020 10:06:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BmhcgxF4C0rf; Tue, 10 Nov 2020 10:06:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8BFBD87267;
	Tue, 10 Nov 2020 10:06:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 72627C088B;
	Tue, 10 Nov 2020 10:06:04 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D6451C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 10:06:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D0B24865E2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 10:06:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mjfNw7rvI2LP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 10:06:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 42B2A862C7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 10:06:03 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id x15so5420712pll.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 02:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=AIhXcPN2MFExvWPLs/0cjSC2lNKguYNlSXb0urmzzQ4=;
 b=qvVm2ySm9C/KwQM2OLcF5qh0PedLrWf7Dl/+yEMpeR5y/wSrTbOGjoueHS+FLCjUl+
 wwtEyx/9KS0d+0/YSJH7XVmAEsQ4Wg0VQeD654bplEzLcE41sz5q37h3V3eJIBtlCzuQ
 klLUuMzh5rjKwCM5ojmiNVVtG2mdEPCbkJUEAncwlI05YRqT7hypJM4iv1qFZpzzd12G
 9dMuB2LInR45y3nlDKfTj0MNNNlS8yG4ruYSu3TMbAiK+0nAB6c+/cE7hF6zgj/vr/27
 /Lfhdc3qOdFPVnlo/YKNZ85Yf5a0ZSUDY+OSSTkJOYj4zwVLX/1K3LSmojuwifhm4FUL
 /tpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=AIhXcPN2MFExvWPLs/0cjSC2lNKguYNlSXb0urmzzQ4=;
 b=aaka/l3vrBagO9ZMnNksqaM0Appjkq6wRq5EoSWgvhMNvJ84k/scwl1XBNgVB43B00
 wzWORVWv0lXS0rjyWsHjYBNjN/P+nACKuO0QTOiVJwnhTDPYTBXsmD2YYG/NgSqQLPD3
 nLx+rEhuMfkfhGclB95cfpUNWGPG5xKdiiIFWaq35H3MQBqeo3Y2hf39Tmh0nJDa188Y
 aEYUfmzBwS0MfJYns+DtUNGniADSeeps/Y4046gNV2b02JcgmEkkS+B3iAJaJ24HDzIq
 RoQ3SnpdSUS5soYNzsmW60r3FP1bRQ1ca8dHmwjbLhbixRr6/TotU4quLnG2Tdcisjqh
 5KOQ==
X-Gm-Message-State: AOAM531yv68BR3HZKO/RFFjXQVb3rCJwLa8tyxm1sFROzcFvrHuZNkFA
 nJnKYo6RCBge603sN7nSaoI=
X-Google-Smtp-Source: ABdhPJyAN4yF8APkGnlZRNEE9fXQ8jV1dMfnk/AdCqEro9CI27vrvOq8aJBi80FXcdPz5rwlrfMQ0A==
X-Received: by 2002:a17:902:8508:b029:d5:af79:8b40 with SMTP id
 bj8-20020a1709028508b02900d5af798b40mr16186162plb.28.1605002762726; 
 Tue, 10 Nov 2020 02:06:02 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:413:8adf:79d0:1679:313c:70a2])
 by smtp.googlemail.com with ESMTPSA id r8sm14599833pgn.30.2020.11.10.02.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 02:06:02 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Tue, 10 Nov 2020 15:35:54 +0530
Message-Id: <20201110100554.15995-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: add fix option for
	MISSING_SIGN_OFF
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

Currently checkpatch warns us if there is no 'Signed-off-by' line
for the patch.

E.g., running checkpatch on commit 9ac060a708e0 ("leaking_addresses:
Completely remove --version flag") reports this error:

ERROR: Missing Signed-off-by: line(s)

Provide a fix by adding a Signed-off-by line corresponding to the author
of the patch before the patch separator line. Also avoid this error for
the commits where some typo is present in the sign off.

E.g. for commit 8cde5d5f7361 ("bus: ti-sysc: Detect omap4 type timers
for quirk") we get missing sign off as well as bad sign off for:

Siganed-off-by: Tony Lindgren <tony@atomide.com>

Here it is probably best to give BAD_SIGN_OFF warning for Non-standard
signature and avoid MISSING_SIGN_OFF

A quick evaluation over v4.13..v5.8 found out that 4 out of 11 cases
for this error is because of missing sign offs in reverts. Add
documentation regarding it for the future users.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 Documentation/process/submitting-patches.rst |  2 ++
 scripts/checkpatch.pl                        | 17 ++++++++++++++---
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 83d9a82055a7..ff065e1f6a25 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -404,6 +404,8 @@ then you just add a line saying::
 
 using your real name (sorry, no pseudonyms or anonymous contributions.)
 This will be done for you automatically if you use ``git commit -s``.
+Also reverts should include a Signed-off-by. ``git revert -s`` does
+that for you.
 
 Some people also put extra tags at the end.  They'll just be ignored for
 now, but you can do this to mark internal company procedures or just
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index cb46288127ac..849e4a510767 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2404,6 +2404,8 @@ sub process {
 
 	my $last_blank_line = 0;
 	my $last_coalesced_string_linenr = -1;
+	my $patch_separator_linenr = 0;
+	my $is_signed_off = 0;
 
 	our @report = ();
 	our $cnt_lines = 0;
@@ -2755,6 +2757,10 @@ sub process {
 		if ($line =~ /^---$/) {
 			$has_patch_separator = 1;
 			$in_commit_log = 0;
+			# to add missing sign off line before diff(s)
+			if($patch_separator_linenr == 0) {
+				$patch_separator_linenr = $fixlinenr;
+			}
 		}
 
 # Check if MAINTAINERS is being updated.  If so, there's probably no need to
@@ -2771,6 +2777,8 @@ sub process {
 			my $space_after = $3;
 			my $email = $4;
 			my $ucfirst_sign_off = ucfirst(lc($sign_off));
+			# to avoid missing_sign_off error as it most probably is a typo
+			$is_signed_off = 1;
 
 			if ($sign_off !~ /$signature_tags/) {
 				WARN("BAD_SIGN_OFF",
@@ -7118,9 +7126,12 @@ sub process {
 		      "Does not appear to be a unified-diff format patch\n");
 	}
 	if ($is_patch && $has_commit_log && $chk_signoff) {
-		if ($signoff == 0) {
-			ERROR("MISSING_SIGN_OFF",
-			      "Missing Signed-off-by: line(s)\n");
+		if ($signoff == 0 && !$is_signed_off) {
+			if (ERROR("MISSING_SIGN_OFF",
+				  "Missing Signed-off-by: line(s)\n") &&
+			    $fix) {
+				fix_insert_line($patch_separator_linenr, "Signed-off-by: $author");
+			}
 		} elsif ($authorsignoff != 1) {
 			# authorsignoff values:
 			# 0 -> missing sign off
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
