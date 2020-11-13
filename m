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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 867DBC388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Nov 2020 15:24:10 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B9F822263
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Nov 2020 15:23:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UiGMlYnf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B9F822263
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1D15B2E245;
	Fri, 13 Nov 2020 15:23:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VmprAmiyCqDw; Fri, 13 Nov 2020 15:23:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 92727204A1;
	Fri, 13 Nov 2020 15:23:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7D3B3C088E;
	Fri, 13 Nov 2020 15:23:58 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BE066C0800
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 15:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A9635878D8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 15:23:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MtGuDEnTHFmY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 15:23:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 40856878D7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 15:23:56 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 10so7886643pfp.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 07:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/WeHfKsKBskJF//nV0gHHSqUsCVNd9uwrdvRUtYIsCQ=;
 b=UiGMlYnf46lTNVE2g7F/8bxf+FZ4CYFKFxahm7UkJvKVQOlJ3uurv0goMXp5a+dzOL
 9mExWR637tkf/ZSZWPTzU7CZ6ulwsQa2yhfgZczAeanP3tgZov5w16XSTV0EDpEMZJCZ
 2lQ8oPHduXeGnYdlZcb4JHdWJFRwxoePaPueQPKTZj35q1q0SCBii0idpJQDGZtiXj9F
 SF92pFRVlfI2aaCGcKRAx2Dg/JcMsBdFcBsHzkfSG/jsDzQxvxpiIexDrY7+3Xhvs7Yy
 5+pG6dHXvXPOPC3D84p0bpNqRcGpvjH5BDMP4hiIywErjIaV0uJDIW8G0Th5WDCwGfH1
 uFLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/WeHfKsKBskJF//nV0gHHSqUsCVNd9uwrdvRUtYIsCQ=;
 b=Yy49HgyN22pCAx0w5Fmbwyuk5aw2c9gaFQ7P0O+EBRD10DBZ4Mk5wv3F/dsGDrjwvw
 OL5CRuIEIP6lQtw6XnBh11xxUl92nco60EmL7UnoWxUCJABNPK709M3c7lnFBN2DhXO2
 xX4FBMVJd7pztSqCpFWdgQNwFr9GzKqgTXZTYrCiQQ0tT6J5qEgWMbzybTTJF6+D2d0d
 uc0vVBepDXoYBkWX+uRVNKzHcByXBatvCSylC5UJ6+ivXoHwpodZIIMzuLjU0Ww0UL0F
 p+bykeIIdsr/H8ENa0c/ZElrI2OcNQsFv+Z73q75UEjjzudsIAma2B1v7B0TCnMchLEh
 uGNw==
X-Gm-Message-State: AOAM530NqpDCP6NsAyh8anPrSDLBcVQ+z7C2SWug2O8C1DD2/DAhmegF
 V8ZKfCTQFr+XSm4iZRX4xU0=
X-Google-Smtp-Source: ABdhPJyuYXKPkYLe0VYEYJ5+xB/uMeGHM5J3tb1rSBKR0Y7i8gDSbmSLndBvONsZ/MFhs4DkODNgYQ==
X-Received: by 2002:a63:c945:: with SMTP id y5mr2490173pgg.118.1605281030623; 
 Fri, 13 Nov 2020 07:23:50 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:6819:f451:9e0a:873f:ed68])
 by smtp.gmail.com with ESMTPSA id a17sm9391408pga.56.2020.11.13.07.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 07:23:49 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Fri, 13 Nov 2020 20:53:16 +0530
Message-Id: <20201113152316.62975-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH V3] checkpatch: Fix spelling errors
	and remove repeated word
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
Changes in V3:
- Change subject line
Changes in V2:
- Add correction for falsly

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
