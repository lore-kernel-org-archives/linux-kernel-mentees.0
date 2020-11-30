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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98D4FC64E8A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Nov 2020 14:45:53 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE9F620725
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Nov 2020 14:45:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k2AufPqI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE9F620725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 60D6286AFF;
	Mon, 30 Nov 2020 14:45:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 17TI1W0TRgDx; Mon, 30 Nov 2020 14:45:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 22E7986AF6;
	Mon, 30 Nov 2020 14:45:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 10DC3C163C;
	Mon, 30 Nov 2020 14:45:51 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D1F5FC0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 14:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3D09E203F0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 14:45:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CY2w3rSpolV0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 14:45:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 2FC0A20000
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 14:45:48 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id w187so10543147pfd.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 06:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0o+iVkGkhtW/JsLRW2aT613wTEd5WF5NdfyQyW4sAW0=;
 b=k2AufPqIo2BSbBECgdgXaaIiMHQNIqq4alWPXBAR6n6tzaXjiSREKjdREnPMTHpCZP
 zqv7pTdTkKllAeYS3nZupgxFAsBZHA71++zPXENwklQd1ofhMEnVnBV1WZCzo3Zxn5hx
 EiU5Pqm0NKixQmCGyx5gsV5ESxVvgpp+pTqAI3B24BG3m6zvPGnaSi23XEyrm09rjJKq
 W9FxPn6oAUgUnqVB5MQ5GmVxzPrtxQ76q0eCWKmJo2+iInUAj2P5ZjLo5hPKb7IvSifv
 yWJ8DsZ9qn4X3CE5rxVAy9GECGI9/1/XnlC1UuNAqxR55WyObkzxURhaJy+pXT56Axdc
 NMQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0o+iVkGkhtW/JsLRW2aT613wTEd5WF5NdfyQyW4sAW0=;
 b=YcUtYWhtmQOCbu8wHbC8kxrQK8JRK2n3GNtGhaWFtj2BOlG6Ainyavjar26JL239GS
 38bGa7+Px+pnBBmVBTWnVULwRvHIWzwjMk6XTtubi5kBVkvYO0K5VHJuDc84XPfvRKM/
 BnVXnaL5low2+s7wRz845fiMTyq8WCGgKEbQ7Ci5rr8uvj7G3JntZwz/tnWQ8oIUYUq5
 Oo2x6mPFtUXGE17Ec8+dd2tsbaosana9TWR32fhQ/OX8/b3dwuxsyMTUDb4f0YVvi1D0
 aYKUcrmNVGz8ihM4cK+PSaxOuCNtfUu+s9Hg1ebS6tY3pRet6Osjym/s4BfOOWXbSL8+
 uB3A==
X-Gm-Message-State: AOAM533Yp72lbQDlrfANCxDgBDzRLLMtJIP+vLrD032xNcA5S3xMiG4K
 hCcHmdHvC+JGNvbvwF1kWoo=
X-Google-Smtp-Source: ABdhPJzYL1YzKkVrRoBDuApEp6dCP2TNK2FVpUPRoSRuAvqj0QtgFp6AmNa9w6bRMzAQ3yKgQRtJNA==
X-Received: by 2002:a62:7f4c:0:b029:198:bfe:96f6 with SMTP id
 a73-20020a627f4c0000b02901980bfe96f6mr19200149pfd.23.1606747547541; 
 Mon, 30 Nov 2020 06:45:47 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:60e4:5627:76c2:b847:1df3])
 by smtp.gmail.com with ESMTPSA id z19sm16888333pfa.122.2020.11.30.06.45.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 06:45:45 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Mon, 30 Nov 2020 20:15:15 +0530
Message-Id: <20201130144515.8320-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: Peilin Ye <yepeilin.cs@gmail.com>, dwaipayanray1@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: fix TYPO_SPELLING check
	for words with apostrophe
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

checkpatch reports a false TYPO_SPELLING warning for some words
containing an apostrophe.

A false positive is "doesn't". Occurrence of the word causes
checkpatch to emit the following warning:

"WARNING: 'doesn'' may be misspelled - perhaps 'doesn't'?"

Check the word boundary for such cases so that words like
"doesn't", "zig-zag", etc. aren't misinterpreted due to wrong
splitting of the word by the \b regex metacharacter.

Reported-by: Peilin Ye <yepeilin.cs@gmail.com>
Tested-by: Peilin Ye <yepeilin.cs@gmail.com>
Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 3c86ea737e9c..be6d09929941 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3106,7 +3106,7 @@ sub process {
 # Check for various typo / spelling mistakes
 		if (defined($misspellings) &&
 		    ($in_commit_log || $line =~ /^(?:\+|Subject:)/i)) {
-			while ($rawline =~ /(?:^|[^a-z@])($misspellings)(?:\b|$|[^a-z@])/gi) {
+			while ($rawline =~ /(?:^|[^a-z@])($misspellings)(?:\b(?![^\w]?[a-z@]+)|$|[^a-z@])/gi) {
 				my $typo = $1;
 				my $typo_fix = $spelling_fix{lc($typo)};
 				$typo_fix = ucfirst($typo_fix) if ($typo =~ /^[A-Z]/);
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
