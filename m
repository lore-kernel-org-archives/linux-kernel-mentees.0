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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08CB8C4742C
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Nov 2020 13:58:11 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 971FE20797
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Nov 2020 13:58:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dp6zxRbX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 971FE20797
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id DC20C2E1F8;
	Fri, 13 Nov 2020 13:58:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qfCH1yu2qOg9; Fri, 13 Nov 2020 13:58:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 597142E162;
	Fri, 13 Nov 2020 13:58:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3F6E6C0891;
	Fri, 13 Nov 2020 13:58:09 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D7AB3C0800
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 13:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BC9B0874B3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 13:58:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1NaDuxRXZdXZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 13:58:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4F7BE874AE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 13:58:07 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id j19so337169pgg.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 05:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2vTnsverZoGzLekH1zBmdh7TzAPle0ubBo5+gTweQfA=;
 b=Dp6zxRbXMqegXAhGPbxdglMuJR1k93K1FEsMyluCXpNYX968qprlhGjT1ui4oSFvLD
 t/EwjOwyziznw6x3td07nrFR1dpN4VYnZyambrJ/zSwBtn+egDE4wVkW8TMNNaLN4RVB
 R13/4RPSSPzJiXvbN4C7s2VGwpxZor8/EhCJf0yuu8Ds6jZ40NOGsWrWsRkehtAaHsjn
 9jKpS5XlzcZCKgEGfvfiNLCmSlfxSdOLAHPDfOIpKsRcU+3Hv0FpHY9qf+QulWLU8pwy
 oyCczicKfYkLEG/XZceegbbOrDqXefGQjTzxrBQVy9cmMyh9Jo9qKxGxnMVcvyTR6Wc4
 wAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2vTnsverZoGzLekH1zBmdh7TzAPle0ubBo5+gTweQfA=;
 b=LSS160z+POlZHg/LsUnKiLGTza5+IIcS8tKG3vIvAxZGnzY3k5vK3azQSJniD2Wxi7
 joA4lPg9fYt6yx3lMuNhM+AtJOMD4lm8ek3HKpD21N5imRAqfAiUAfYfma3k2tByzTnB
 S4tdhJ78bfbLoIkmzZM8YaVdKQyeHoZc7CEptMpS/3BdMghyEE6EgbllTxk5BpCWCaaV
 sYWCrkwUCL87NYRnpUGDAQ9+GtojeHHcseAYqwrKoJ1x0/wKUsVu14tsY0OKVr8Skp0j
 OA4NQ78F9WdQsDM38rp4PPvUb4BN0cyWV1nf4qnxrnfoQr9YyUF7oINgZK1WvbxHwQ07
 CYRg==
X-Gm-Message-State: AOAM531J+ZHyQ5Gwpqeuc6k2EINA1VZvddHTc4RqsyUIAYrtNy2TMV2v
 GWsbBWIiACL8x0CGbq4CD9Y=
X-Google-Smtp-Source: ABdhPJwhVQmLyDRRjbaZXdhrHtxVXl2LeaJC7RjdFj5fMvnBU/Nf1v+RbFZw+uy/mvAJvbZR0UIXvA==
X-Received: by 2002:a17:90a:cb08:: with SMTP id
 z8mr2940899pjt.152.1605275886547; 
 Fri, 13 Nov 2020 05:58:06 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:6819:f451:9e0a:873f:ed68])
 by smtp.gmail.com with ESMTPSA id v23sm10609956pjh.46.2020.11.13.05.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 05:58:05 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Fri, 13 Nov 2020 19:27:39 +0530
Message-Id: <20201113135739.46776-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: fix typo and remove
	duplicate word
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

Delete repeated word in scripts/checkpatch.pl:
"are are" -> "are"

Fix typos:
"commments" -> "comments"
"falsly" -> "falsely"

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 2749f32dffe9..041b82f6669e 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2841,7 +2841,7 @@ sub process {
 
 
 				# stable@vger.kernel.org or stable@kernel.org shouldn't
-				# have an email name. In addition commments should strictly
+				# have an email name. In addition comments should strictly
 				# begin with a #
 				if ($email =~ /^.*stable\@(?:vger\.)?kernel\.org/i) {
 					if (($comment ne "" && $comment !~ /^#.+/) ||
@@ -5000,7 +5000,7 @@ sub process {
 ## 		    $line !~ /^.\s*$Type\s+$Ident(?:\s*=[^,{]*)?\s*,\s*$Type\s*$Ident.*/) {
 ##
 ## 			# Remove any bracketed sections to ensure we do not
-## 			# falsly report the parameters of functions.
+## 			# falsely report the parameters of functions.
 ## 			my $ln = $line;
 ## 			while ($ln =~ s/\([^\(\)]*\)//g) {
 ## 			}
@@ -7109,7 +7109,7 @@ sub process {
 		exit(0);
 	}
 
-	# This is not a patch, and we are are in 'no-patch' mode so
+	# This is not a patch, and we are in 'no-patch' mode so
 	# just keep quiet.
 	if (!$chk_patch && !$is_patch) {
 		exit(0);
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
