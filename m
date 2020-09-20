Return-Path: <SRS0=4nEd=C5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26428C43468
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 20 Sep 2020 09:17:46 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97250214F1
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 20 Sep 2020 09:17:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fmVPGfww"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97250214F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 40601203AB;
	Sun, 20 Sep 2020 09:17:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id orBUWu-yKsFo; Sun, 20 Sep 2020 09:17:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 821A720336;
	Sun, 20 Sep 2020 09:17:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 74F12C0859;
	Sun, 20 Sep 2020 09:17:44 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C2B8FC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Sep 2020 09:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id AFBEA203AB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Sep 2020 09:17:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id udmkKKn0gH4O
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Sep 2020 09:17:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by silver.osuosl.org (Postfix) with ESMTPS id CC26120336
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Sep 2020 09:17:41 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id u3so5383605pjr.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Sep 2020 02:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BLh8jEiP3fcWPoHCO2EhENY21oC8+9SSibluvL2NtU4=;
 b=fmVPGfwwy5eZhM+d8MjZv60YBKPgMpyFq2LDJVDHKIUq37RzzeenWObfbgY+hddE2W
 p3mJFn8tU/kXzNnknxh3U25qIaZtYPa4bNuxhqIK4SxpUy5y8TQQT8+JU42sbhVZSflR
 W45IIchFhppXZq4L3T2Arttnv9NVjOe8a2EHH2jPHRbPYC00ZjR1q+Epqbxts6dopTXR
 ELm5JgF4BJyPr4Tni5Jfn66Iim62IHAF20+yhn3oxW5gRk3ScmEPloV+tsOTEjnYrhaA
 s9mr3uCPTcdhLX4LDgPFniRw6Z9Sdxx4N/uC7XRMd0D2TypYa3v1rCyXiWO3yS5nudVL
 K4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BLh8jEiP3fcWPoHCO2EhENY21oC8+9SSibluvL2NtU4=;
 b=RMG7yglLEyA3LmTkANi+UzI7AojW2quDHv4N75AFJoeEiQt6YRs8CNrb3qAlhtJMDK
 BnF1FL7cpA1udmCSx8RWmwPQ6k1purQQs21QBmgTuXD13FgUh6spKndnqXN3TszLRYOo
 gmDf+vUljAtkQ5A3zw6el37ewR6OnV6s+wbFvdE5NEckiJjs2Xl7q5t5klEA9MBbiYAM
 SB/nGBqjqspzXiTbBOTvPlxAuVCkJRARfYJA4l09LXTu2PKkCqHYFMB8LxKksQ4fuGRn
 GA3+TT0uHozQU+22o1p5Z0KSLqFUKo+9X+7/MQYWZqPlng1iNK/cZJvxQlLMVBAS5yWI
 aspw==
X-Gm-Message-State: AOAM531kPLpuBiRgN5bOqkk/YJaOwIvRXIwwdeN8WsJCKuqnB2rzzqeI
 EEWJkGoPMOint3kTK6Jvg+E=
X-Google-Smtp-Source: ABdhPJxzIP3Cg0MyB9MnH3OFDdRe2j6bU1fI0acOTGmlSCk4qG0s4wPL0VpNu00L+sBMtRm7R7HKRg==
X-Received: by 2002:a17:90b:4718:: with SMTP id
 jc24mr19312829pjb.214.1600593461301; 
 Sun, 20 Sep 2020 02:17:41 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:9004:6887:77d0:e456:ba13:9d2d])
 by smtp.gmail.com with ESMTPSA id w10sm8658942pgr.27.2020.09.20.02.17.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2020 02:17:40 -0700 (PDT)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Sun, 20 Sep 2020 14:47:06 +0530
Message-Id: <20200920091706.56276-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: apw@canonical.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, dwaipayanray1@gmail.com
Subject: [Linux-kernel-mentees] [PATCH v2] checkpatch: extend author
	Signed-off-by check for split From: header
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

Checkpatch did not handle cases where the author From: header
was split into multiple lines. The author identity could not
be resolved and checkpatch generated a false NO_AUTHOR_SIGN_OFF
warning.

A typical example is Commit e33bcbab16d1 ("tee: add support for
session's client UUID generation"). When checkpatch was run on
this commit, it displayed:

"WARNING:NO_AUTHOR_SIGN_OFF: Missing Signed-off-by: line by nominal
patch author ''"

This was due to split header lines not being handled properly and
the author himself wrote in Commit cd2614967d8b ("checkpatch: warn
if missing author Signed-off-by"):

"Split From: headers are not fully handled: only the first part
is compared."

Support split From: headers by correctly parsing the header
extension lines. RFC 2822, Section-2.2.3 stated that each extended
line must start with a WSP character (a space or htab). The solution
was therefore to concatenate the lines which start with a WSP to
get the correct long header.

Suggested-by: Joe Perches <joe@perches.com>
Link: https://lore.kernel.org/linux-kernel-mentees/f5d8124e54a50480b0a9fa638787bc29b6e09854.camel@perches.com/
Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 504d2e431c60..9e65d21456f1 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2661,6 +2661,10 @@ sub process {
 # Check the patch for a From:
 		if (decode("MIME-Header", $line) =~ /^From:\s*(.*)/) {
 			$author = $1;
+			my $curline = $linenr;
+			while(defined($rawlines[$curline]) && ($rawlines[$curline++] =~ /^[ \t]\s*(.*)/)) {
+				$author .= $1;
+			}
 			$author = encode("utf8", $author) if ($line =~ /=\?utf-8\?/i);
 			$author =~ s/"//g;
 			$author = reformat_email($author);
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
