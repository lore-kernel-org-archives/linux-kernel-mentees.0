Return-Path: <SRS0=9pg8=FE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF91C5519F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Nov 2020 09:16:00 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6DD52074A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Nov 2020 09:15:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a+rz0XPP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6DD52074A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1F5492045D;
	Mon, 30 Nov 2020 09:15:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fwT67ocIsbEp; Mon, 30 Nov 2020 09:15:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2ADE92039C;
	Mon, 30 Nov 2020 09:15:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0C136C0859;
	Mon, 30 Nov 2020 09:15:58 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9D1FCC0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 09:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 82E2E873BE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 09:15:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CL-WrGOAljfc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 09:15:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 306FD873B1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 09:15:55 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id e5so952196pjt.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 01:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=FXZaPZ6Wa2Q+4SL2vnWGOCxVYyiUYdZrOWiFlU+FIk8=;
 b=a+rz0XPPQfOkYA/WQqaYHGtorilV18qfphK1msjTfOrgdHfTHJu9czmXuGa/sJFpbC
 TYfGL7lU8se6EtNDZuaY6ZF25tep1rcsjwRR6+C7gJ/ADMFzK2JLW1m5C/lvSIX1LfjL
 vZLM/j1+t1Lpykl9mbgKHLjVrKZYjbtJ/Hu8DI6cQJrZ+ix9flUQgNPJ8KFO60RkKa1r
 pdecNr/D3DTDSNZCo2ITBAlg1f8ysLjC5JwG6epyEAU3Idy0NymL8bqVp6BdVJ44L8YE
 NhyoKoFH3ym69VtEabbp5QNu7UovRuU/h0Uwk6CIqC2NvmMDZK7QfuEI6d1phA1UtNDA
 MmeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=FXZaPZ6Wa2Q+4SL2vnWGOCxVYyiUYdZrOWiFlU+FIk8=;
 b=Joe8lHWOAcQeOsp1NMrvzq2iyZawRCe/whriSzP/XfIj+1P4wISbm3WmljeR3xBtWA
 BLXb8nHjkxXTnCN6vkdugBHdXsMk6uNjwxrqCKNRnlwV2MNfj46CPmY7BgEmSqswvkkN
 FGAFuG+uKf54tu1DV8cHkevTUX66/yJiYZmi4PlhaHJgWBLwML00tx4q241GB0M4WQ+s
 KNkE1H1slOJQWovESS/tahGA43B0gdJcnRw/exJT4ZRpXXjmb1uH0V/by+YKpSUrKcfd
 KCsoNG0C9QncbMubqrP3HDMfKPfKpE0sGEuU4uu0As+l2Ew8PNINqABuNxaiEns/0cex
 kjcg==
X-Gm-Message-State: AOAM530kVStV4O6372WDEYSFRncJIiptnso2oXWKw+QYx6JOeCxLy3kk
 O8OOmgR9VAPhtoU8nmA+xOw=
X-Google-Smtp-Source: ABdhPJwtwyU15Po6OMUqRSu8ArVRfNBEfzMPAapekf9/lYW0UFYwnwrl6D8XGQNQvBG4MmQt938PpQ==
X-Received: by 2002:a17:90a:fa81:: with SMTP id
 cu1mr7080966pjb.39.1606727754623; 
 Mon, 30 Nov 2020 01:15:54 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:419:6b90:c59c:7043:caf9:832d])
 by smtp.googlemail.com with ESMTPSA id
 fs12sm12637132pjb.49.2020.11.30.01.15.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 01:15:54 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: joe@perches.com
Date: Mon, 30 Nov 2020 14:45:45 +0530
Message-Id: <20201130091545.15585-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201130091042.14987-1-yashsri421@gmail.com>
References: <20201130091042.14987-1-yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH v3] checkpatch: add fix option for
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

Currently checkpatch warns us if there is no 'Signed-off-by' line for
the patch.

E.g., running checkpatch on commit 9ac060a708e0 ("leaking_addresses:
Completely remove --version flag") reports this error:

ERROR: Missing Signed-off-by: line(s)

Provide a fix by adding a Signed-off-by line corresponding to the author
of the patch before the patch separator line.

Also, avoid this fix with the Non-standard signature warning, as the
missing sign off is most likely because of typo.

E.g. for commit 8cde5d5f7361 ("bus: ti-sysc: Detect omap4 type timers
for quirk") we get missing sign off as well as bad sign off warnings for:

Siganed-off-by: Tony Lindgren <tony@atomide.com>

Here it is probably best to fix the typo with BAD_SIGN_OFF warning and
avoid adding an additional signoff.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
applies over next-20201120 and my last changes at:https://lore.kernel.org/linux-kernel-mentees/db1195235752685fc85fb52ecb1b1af3f35b5394.camel@perches.com/T/#u

Changes in v2:
  Add space after 'if'
  Add check for $patch_separator_linenr to be greater than 0

Changes in v3:
  Give MISSING_SIGN_OFF warning irrespective of the value of $non_standard_signature, add check with fix option instead
  Modify commit message accordingly

 scripts/checkpatch.pl | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 4a026926139f..3abf34bb9b00 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2462,6 +2462,8 @@ sub process {
 
 	my $last_blank_line = 0;
 	my $last_coalesced_string_linenr = -1;
+	my $patch_separator_linenr = 0;
+	my $non_standard_signature = 0;
 
 	our @report = ();
 	our $cnt_lines = 0;
@@ -2813,6 +2815,10 @@ sub process {
 		if ($line =~ /^---$/) {
 			$has_patch_separator = 1;
 			$in_commit_log = 0;
+			# to add missing signed-off-by line before diff(s)
+			if ($patch_separator_linenr == 0) {
+				$patch_separator_linenr = $linenr;
+			}
 		}
 
 # Check if MAINTAINERS is being updated.  If so, there's probably no need to
@@ -2842,6 +2848,7 @@ sub process {
 						$fixed[$fixlinenr] =~ s/$sign_off/$suggested_signature/;
 					}
 				}
+				$non_standard_signature = 1;
 			}
 			if (defined $space_before && $space_before ne "") {
 				if (WARN("BAD_SIGN_OFF",
@@ -7188,8 +7195,11 @@ sub process {
 	}
 	if ($is_patch && $has_commit_log && $chk_signoff) {
 		if ($signoff == 0) {
-			ERROR("MISSING_SIGN_OFF",
-			      "Missing Signed-off-by: line(s)\n");
+			if (ERROR("MISSING_SIGN_OFF",
+				  "Missing Signed-off-by: line(s)\n") &&
+			    $fix && !$non_standard_signature && $patch_separator_linenr > 0) {
+				fix_insert_line($patch_separator_linenr - 1, "Signed-off-by: $author");
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
