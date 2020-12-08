Return-Path: <SRS0=ZryW=FM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 695B7C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Dec 2020 17:53:11 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7DE223B85
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Dec 2020 17:53:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7DE223B85
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3CB0B875CF;
	Tue,  8 Dec 2020 17:53:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wmoUOlOEQnQ3; Tue,  8 Dec 2020 17:53:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C0B4587627;
	Tue,  8 Dec 2020 17:53:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AF582C0FA7;
	Tue,  8 Dec 2020 17:53:09 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 56B39C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Dec 2020 17:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4598887627
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Dec 2020 17:53:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 52ZxNNPjoL6M
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Dec 2020 17:53:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BC44D875CF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Dec 2020 17:53:07 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id b26so14581445pfi.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 08 Dec 2020 09:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2Gy7HsFgDVrJVwku+0SgTgMVTEQfYWF13dogZ1Wd4kY=;
 b=T9R+CErmIP/VtGMc7o1zN+qUcp3kLUPM0NPp8aeVZfTKzBsTDZ03F3cJHZYNbsRUop
 8bfE2AjBCt9r7IjpH29o59b1fzvnPNKR5nj2uOzWGHJs8pt9SltcmUklJyRVWIJZeLpu
 ZGfqUidMiKUrc6BvYqN7Ao1rSJVjAh0kmWzuXYD59o2kwD9AqeclBxNnnxUX686018AO
 5HUSWY3t/UJUiQBixkb951fmWNmbi/0DEV8FMP6M7tNMnKtKvbXM0b0wLbCILjuih9YI
 WOB77wxAN78awvcvyaz8gnW68/mJpol9qL8DEMcRChSa1uspREbgQ3FigQgMqdI8bStL
 4ylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2Gy7HsFgDVrJVwku+0SgTgMVTEQfYWF13dogZ1Wd4kY=;
 b=aOWU7g7EiN30B3YnT/Fz42TiazKXnP3sVzNR7Ak+EYDy37UNZNz4IoPk7FegBrY9uU
 PBspAK2uOYSs6JOCBESvEBkPNXsFn3DtjvJ47ct80YIQ68GzCWtV0L/6fXWIf8vBAJzm
 7so4+2nUP47dYgFb2Pil/6msh9K44/TmFkfSKQuk67zYYRDICRQ/bgy5+WTl0FJg6UsN
 0zbLIdR8crF4A6Fq5SjleoIHECb7mqrQKt1Y5XtKymdMwg0JBx6YWAfG3jf1975JHp9P
 mwTGjMW6RQdqeY9G3lAWtkB0/JMKBzvsEbjnizY6Jl1UD9MI6ROiYDVnvYWE1JGgpjJb
 g0HA==
X-Gm-Message-State: AOAM530RvU/VFJcXbWNFGy80CkATC7h0VniWx80cux6N6fYQ2ZZ0PJCF
 JWGtyXa8AXwuzd27JxQbd/0=
X-Google-Smtp-Source: ABdhPJz8SVk7sLEqypqrRK8v3Bt7dCvcTtU1gHDD7VdlrvmW68cffoe9mjLm/ixNN1EYYJhyiX2DBg==
X-Received: by 2002:a17:90a:e38d:: with SMTP id
 b13mr5318016pjz.101.1607449987116; 
 Tue, 08 Dec 2020 09:53:07 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:409:eab8:d9f9:133a:8ce7:6fdc])
 by smtp.googlemail.com with ESMTPSA id
 k14sm17107919pfp.132.2020.12.08.09.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 09:53:06 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Tue,  8 Dec 2020 23:22:56 +0530
Message-Id: <20201208175256.13004-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <9ee46b5d-d849-cd6c-39f4-11e6850edbd6@gmail.com>
References: <9ee46b5d-d849-cd6c-39f4-11e6850edbd6@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: add fix option for
	BAD_SIGN_OFF
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

Currently checkpatch warns us if the Co-developed-by line for an author
isn't immediately followed by the Signed-off-by line.

Generally, this warning occurs because of:
1) Absence of Signed-off-by line for the author from the patch
2) Misplaced Signed-off-by line for the author in the patch

Provide a simple fix by:
1) Inserting Signed-off-by line for the author immediately after the
Co-developed-by line

2) Removing Signed-off-by line for the author (if it pre-existed on
some other line)

Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 scripts/checkpatch.pl | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index ca5bb5a3f8f6..8bd8e4518f7f 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2496,6 +2496,9 @@ sub process {
 	my @setup_docs = ();
 	my $setup_docs = 0;
 
+	my %signed_off_by_lines;
+	my %co_developed_by_lines;
+
 	my $camelcase_file_seeded = 0;
 
 	my $checklicenseline = 1;
@@ -2781,6 +2784,7 @@ sub process {
 					my $ctx = $1;
 					my ($email_name, $email_comment, $email_address, $comment1) = parse_email($ctx);
 					my ($author_name, $author_comment, $author_address, $comment2) = parse_email($author);
+					$signed_off_by_lines{$ctx} = $fixlinenr;
 
 					if ($email_address eq $author_address && $email_name eq $author_name) {
 						$author_sob = $ctx;
@@ -2972,11 +2976,17 @@ sub process {
 					      "Co-developed-by: should not be used to attribute nominal patch author '$author'\n" . "$here\n" . $rawline);
 				}
 				if (!defined $lines[$linenr]) {
-					WARN("BAD_SIGN_OFF",
-                                             "Co-developed-by: must be immediately followed by Signed-off-by:\n" . "$here\n" . $rawline);
+					if (WARN("BAD_SIGN_OFF",
+						 "Co-developed-by: must be immediately followed by Signed-off-by:\n" . "$here\n" . $rawline) &&
+					    $fix) {
+						$co_developed_by_lines{$email} = $fixlinenr;
+					}
 				} elsif ($rawlines[$linenr] !~ /^\s*signed-off-by:\s*(.*)/i) {
-					WARN("BAD_SIGN_OFF",
-					     "Co-developed-by: must be immediately followed by Signed-off-by:\n" . "$here\n" . $rawline . "\n" .$rawlines[$linenr]);
+					if (WARN("BAD_SIGN_OFF",
+						 "Co-developed-by: must be immediately followed by Signed-off-by:\n" . "$here\n" . $rawline . "\n" .$rawlines[$linenr]) &&
+					    $fix) {
+						$co_developed_by_lines{$email} = $fixlinenr;
+					}
 				} elsif ($1 ne $email) {
 					WARN("BAD_SIGN_OFF",
 					     "Co-developed-by and Signed-off-by: name/email do not match \n" . "$here\n" . $rawline . "\n" .$rawlines[$linenr]);
@@ -7238,6 +7248,16 @@ sub process {
 		ERROR("NOT_UNIFIED_DIFF",
 		      "Does not appear to be a unified-diff format patch\n");
 	}
+
+	if (%co_developed_by_lines) {
+		foreach my $co_developer (keys %co_developed_by_lines) {
+			if (exists($signed_off_by_lines{$co_developer})) {
+				fix_delete_line($signed_off_by_lines{$co_developer}, "Signed-off-by: $co_developer");
+			}
+			fix_insert_line($co_developed_by_lines{$co_developer} + 1, "Signed-off-by: $co_developer");
+		}
+	}
+
 	if ($is_patch && $has_commit_log && $chk_signoff) {
 		if ($signoff == 0) {
 			ERROR("MISSING_SIGN_OFF",
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
