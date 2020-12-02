Return-Path: <SRS0=wdXo=FG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58E10C71155
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Dec 2020 18:37:05 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BC6E206D5
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Dec 2020 18:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BC6E206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 075CD872CC;
	Wed,  2 Dec 2020 18:37:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iF86psriW6zO; Wed,  2 Dec 2020 18:37:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 60AA6872C3;
	Wed,  2 Dec 2020 18:37:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4CDACC163C;
	Wed,  2 Dec 2020 18:37:03 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A39AAC0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 18:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8116D2E299
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 18:37:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EAKW8LLRNdXP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 18:37:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by silver.osuosl.org (Postfix) with ESMTPS id DA1F42E298
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 18:37:00 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id u2so1594213pls.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 02 Dec 2020 10:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=A16io8v3Hgcg3yQ7E7B4wAVO4ZjVE47MlTrJyGPj05U=;
 b=bOIx8dpyhdwOyneXmXb6HiWFOLKYvFTw7A55Hqd2igabIv/djhl8oMF2uRLjmKHl9N
 t7+slbhE1SyBPsY+fb+lgaOvMUs7jsnnhcVZc2pNudJ4y5eDA0og477g1O8LRMzrybU1
 8f4Q2+AeMB+Y3hX2ckwvXH7iK1I7miOrdH8Sd4e4PofQLSB/RqVLU8cz+cb2lf1/96sw
 LT9T69xfyPe0Ew3DfzK1C3RUc+8oLB7FAdaXFTg57QoqoVURIaaMdTUwa48P+v5EXWtf
 wKW7z4yhBpovFd2DHbpic/nZD8CwW9uHKF/Oil4e4tCqZudi6QpXsVy/L+flKPHC+LM8
 091A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=A16io8v3Hgcg3yQ7E7B4wAVO4ZjVE47MlTrJyGPj05U=;
 b=DYVAG9EC8kqZzX7R0ojH6sGz8H6LIg9fj1hPRue3oOOURobfwoe41xHhyHlLY8gifT
 30StBmnH+F0wa/Dfa0uV2tqr/tccjcsStc+dClzFgZEQQio/QIRcxGj86fhVIrDkaRAX
 bJGxzpvHnVMvh05tCBiTOu1/RlyrKN569tRcq/i3a6YPYFNOM4EHqIX0QOpPDZFxqeI9
 F50T5c/ZvCJFgLpzvot6hamKbFtTlJqykqNzob65ZlGpJGzX1HPa2bHewASFwf60VoOQ
 iENgKkJgnwMS+pImbtmMcVNVw+fM4X286oo7CsAARaJvYX//0QLAGLOawYbywy7prF6W
 /aFw==
X-Gm-Message-State: AOAM532DFdI63frdI4uE5eiAAcRe5syLY9GmqLeHV4shJ0Ym4qj9voUg
 snmOluz8k1xZef7TgVFX9JM=
X-Google-Smtp-Source: ABdhPJwjOo2PWuvdczqT+NAjNURkllnLUMK2dXCeD5ItI18eQ8CEZVIAiLeM3sA7wQ+qILobjV9wug==
X-Received: by 2002:a17:90a:154a:: with SMTP id
 y10mr1166180pja.6.1606934220429; 
 Wed, 02 Dec 2020 10:37:00 -0800 (PST)
Received: from localhost.localdomain
 ([2409:4063:4e14:4867:9984:8aed:2f75:bf22])
 by smtp.googlemail.com with ESMTPSA id h12sm409949pgf.49.2020.12.02.10.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 10:36:59 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Thu,  3 Dec 2020 00:06:49 +0530
Message-Id: <20201202183649.9773-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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
index 5c9f13a97c12..d8f9d4d8b13d 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2509,6 +2509,9 @@ sub process {
 	my @setup_docs = ();
 	my $setup_docs = 0;
 
+	my %signed_off_by_lines;
+	my %co_developed_by_lines;
+
 	my $camelcase_file_seeded = 0;
 
 	my $checklicenseline = 1;
@@ -2794,6 +2797,7 @@ sub process {
 					my $ctx = $1;
 					my ($email_name, $email_comment, $email_address, $comment1) = parse_email($ctx);
 					my ($author_name, $author_comment, $author_address, $comment2) = parse_email($author);
+					$signed_off_by_lines{$ctx} = $fixlinenr;
 
 					if ($email_address eq $author_address && $email_name eq $author_name) {
 						$author_sob = $ctx;
@@ -2989,11 +2993,17 @@ sub process {
 					}
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
@@ -7203,6 +7213,16 @@ sub process {
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
