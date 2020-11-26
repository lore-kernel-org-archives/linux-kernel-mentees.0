Return-Path: <SRS0=R4Bt=FA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4DBDC56202
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 26 Nov 2020 09:47:57 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20FFD208CA
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 26 Nov 2020 09:47:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p4PO4IDD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20FFD208CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 71BD0876A0;
	Thu, 26 Nov 2020 09:47:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yd6ibJOHZ47i; Thu, 26 Nov 2020 09:47:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CB7EF876AA;
	Thu, 26 Nov 2020 09:47:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B5F85C0891;
	Thu, 26 Nov 2020 09:47:55 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E4C47C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Nov 2020 09:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D573087280
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Nov 2020 09:47:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qzyfMx1xeyxV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Nov 2020 09:47:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1579287261
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Nov 2020 09:47:53 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id t21so1289545pgl.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Nov 2020 01:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=40I+DIhtIwF3/QquGDrYZtNfaZH79OzOk+Isrg/radc=;
 b=p4PO4IDDg6LEF7mA3WpjDKl5o2dUC7raFVgS22sFLfiJA9lMcCX5x021yNZv2vqaWU
 MUhhvhMkMrFnLjW+IH9uu0TSUShPP0dNPSZv5g/z0GQuLbBDIrnCg46nvLg+AL+dnPuT
 cOqTuTUkN/oAmlhvcr/HvrAZAvSwmPLoxcGTCWykP2FzDDf2FvAKZHD1yT1SmSUdElke
 O5TsOb7iskJUbpJsnRViea/MdQnClZ1+TV2Vhcu1NjGywg/IJfy3VvPTkalxR7Ktyxf4
 PXA0TQUDV2jwzHO6L+AU/RrVOzU05exL3SB+0y6W1yo5DWdK/NKpjqiNZpOVxdBwQeCp
 48/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=40I+DIhtIwF3/QquGDrYZtNfaZH79OzOk+Isrg/radc=;
 b=AqSCtMBimt6+jB41pfCifMw8KKEIHti+0figM7roW7l5b3k0YO8sKZfDYfWzKbt2rq
 SR3ZC7/8VfDmToO73AtGivoVbwNNe7wQfgx9UweAAKDt2XB5ohLSF/mmL/5xg06rmkgv
 p6V/XpIuGzjyc1g8xBvOzJVQRxPa0Sc0BZYkj3Xn1uHYuvpXSwzSKRQ9Jcab9/DrsqlV
 LdzUhRMoAHX6ahjhQ1MU7jtFM/99+RIgtiOv1T4leqGmXra3/8gZN28rdEZKPAqNgjUZ
 32UkX3Yw+oYB5o7euVnsXmY9ojgnMMG4iUMuqa1zKfO9qlHUTJOtusUu2CRUrhoixayz
 TR2g==
X-Gm-Message-State: AOAM531DAOyI5ZBSQzkF+UD9rroOjZp/lxexahby84Vvnc6dOKzvT7/J
 SoPlc76PzBK8pPHTxXe/BGY=
X-Google-Smtp-Source: ABdhPJwab6b6Nh+OHWvU+WIq4LcoDMqfGsAJwoJBhVHs5jSDvBjNrC1Z6p91N0iBc/zQccw0Zxairg==
X-Received: by 2002:a62:e519:0:b029:197:bcec:7c0c with SMTP id
 n25-20020a62e5190000b0290197bcec7c0cmr2151605pff.63.1606384072498; 
 Thu, 26 Nov 2020 01:47:52 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:6052:6026:75db:5ad2:e7b3])
 by smtp.gmail.com with ESMTPSA id t9sm6142749pjq.46.2020.11.26.01.47.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 01:47:51 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Thu, 26 Nov 2020 15:17:27 +0530
Message-Id: <20201126094727.43265-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 yepeilin.cs@gmail.com
Subject: [Linux-kernel-mentees] [PATCH RFC] checkpatch: fix TYPO_SPELLING
	check for words with apostrophe
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

checkpatch reports a false warning for some words containing an
apostrophe.

A false positive is "doesn't". Occurrence of the word causes
checkpatch to emit the following warning:

"WARNING: 'doesn'' may be misspelled - perhaps 'doesn't'?"

Check if any word character is present after the word boundary
in such cases. If present, it means a subpart of the word has
been matched and a warning should not be emitted.

Reported-by: Peilin Ye <yepeilin.cs@gmail.com>
Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index d1ecb852f384..47b964984ce0 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3106,7 +3106,7 @@ sub process {
 # Check for various typo / spelling mistakes
 		if (defined($misspellings) &&
 		    ($in_commit_log || $line =~ /^(?:\+|Subject:)/i)) {
-			while ($rawline =~ /(?:^|[^a-z@])($misspellings)(?:\b|$|[^a-z@])/gi) {
+			while ($rawline =~ /(?:^|[^a-z@])($misspellings)(?:\b(?![a-z@]+)|$|[^a-z@])/gi) {
 				my $typo = $1;
 				my $typo_fix = $spelling_fix{lc($typo)};
 				$typo_fix = ucfirst($typo_fix) if ($typo =~ /^[A-Z]/);
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
