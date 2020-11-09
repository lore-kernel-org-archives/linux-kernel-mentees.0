Return-Path: <SRS0=nBzY=EP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 498EBC388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Nov 2020 13:10:53 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3EAA20789
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Nov 2020 13:10:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RUm6Vv1P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3EAA20789
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0AAB3204D2;
	Mon,  9 Nov 2020 13:10:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eMHQg4prw2VK; Mon,  9 Nov 2020 13:10:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5B420203FC;
	Mon,  9 Nov 2020 13:10:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4D9B1C088B;
	Mon,  9 Nov 2020 13:10:51 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B896CC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Nov 2020 13:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B4E46863D0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Nov 2020 13:10:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PVJbnOBDudWz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Nov 2020 13:10:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1EABB85477
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Nov 2020 13:10:49 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id g7so8141144pfc.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 09 Nov 2020 05:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=eWnk8ubiUMvLBwWW6bzsVEFk7ESVIJY7im2ZfNGrMIo=;
 b=RUm6Vv1Pq4eesoh5UymLM35Fx9ztCLEajH6L6NW6ss/I5jtvUYr4k7cphPEVv/v3U6
 BIkp7B/snR3d9m16lBJk1EsAaXwXj/Yy4pIk3S5uDpW2XleMMC2ru/E8qFbDgHkoe4EH
 687y3g+2trz5EjTDsn7uPt3nXSjqxbko5mLTluvSE/IPHL3jJmW8OWiQKXi72h/+EL8o
 fWc9wrKp+kesJwVqCn5EUiIiXYpeaSdafayGmofD65YuxG+czYhxvkWK75ulMA5MqJDm
 ikE2y0fC83VM6rUo37IQCO7Khf0282TbrA+EGC525NY0ClzV/jFHJqB+bDELfT7YtIT1
 kE6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=eWnk8ubiUMvLBwWW6bzsVEFk7ESVIJY7im2ZfNGrMIo=;
 b=mvnJU+AEyGPv18Y3tmjnxNSVoD8Gvtn6XPRPj9CWzLvxJO9NR2MrysYz1fVjSH9zAf
 9s2Te/YSMDCBnBmmidxOJAboyI1KddPieT4KUPeXJomUYdjQigtfmzII4HTJ1JeCmR4n
 RjAfBFbuSMlYWnVb+7xA1BcFHDP+JdtLE4mPhPz+nk2TBWpgIvDUlvBPN8Py1Q4C79Vq
 BzYIJ3bXMePiRj6BwompE3uih9T3UPwf6sZt6k/k4EDdyOBzNIptM1dmZPNI1ED6kfBd
 Vhdlhh7BiMq6zp3ht+WXan+Gc14nWhdlBjDtQpJpiX3Zcdn3W+HmdvbgTl6M9xxVXhdI
 q9Jw==
X-Gm-Message-State: AOAM530mQn94+8uuuKJJIowGNnoSO2ITiwDBYxRYwo064hR6eJVuvoM5
 TTorBPosLfkHT5O5he6KLUE=
X-Google-Smtp-Source: ABdhPJzHsnHScQIW6vMldRYXO+1HV1C0hUmJxmt0RTv4Y9PahOYo0BO8oMBP6kL3gjUJaqMCQd7k8w==
X-Received: by 2002:a63:6c09:: with SMTP id h9mr12426951pgc.214.1604927448563; 
 Mon, 09 Nov 2020 05:10:48 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:415:19be:b84e:68cf:38c6:95bd])
 by smtp.googlemail.com with ESMTPSA id i7sm2751950pjj.20.2020.11.09.05.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 05:10:48 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Mon,  9 Nov 2020 18:40:40 +0530
Message-Id: <20201109131040.19266-1-yashsri421@gmail.com>
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

E.g., running checkpatch on commit f68e7927212f ("Revert
"powerpc/book3s32: Reorder _PAGE_XXX flags to simplify TLB handling"")
reports this error:

ERROR: Missing Signed-off-by: line(s)

Provide a fix by adding a Signed-off-by line corresponding to the author
of the patch before the start of diff(s)

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 scripts/checkpatch.pl | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index cb46288127ac..bc447aa4e5b0 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2404,6 +2404,7 @@ sub process {
 
 	my $last_blank_line = 0;
 	my $last_coalesced_string_linenr = -1;
+	my $diff_linenr = 0;
 
 	our @report = ();
 	our $cnt_lines = 0;
@@ -2602,6 +2603,10 @@ sub process {
 			$realfile =~ s@^([^/]*)/@@ if (!$file);
 			$in_commit_log = 0;
 			$found_file = 1;
+			# to add missing sign off line before diff(s)
+			if($diff_linenr == 0) {
+				$diff_linenr = $fixlinenr;
+			}
 		} elsif ($line =~ /^\+\+\+\s+(\S+)/) {
 			$realfile = $1;
 			$realfile =~ s@^([^/]*)/@@ if (!$file);
@@ -7119,8 +7124,11 @@ sub process {
 	}
 	if ($is_patch && $has_commit_log && $chk_signoff) {
 		if ($signoff == 0) {
-			ERROR("MISSING_SIGN_OFF",
-			      "Missing Signed-off-by: line(s)\n");
+			if (ERROR("MISSING_SIGN_OFF",
+				  "Missing Signed-off-by: line(s)\n") &&
+			    $fix) {
+				fix_insert_line($diff_linenr, "Signed-off-by: $author\n");
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
