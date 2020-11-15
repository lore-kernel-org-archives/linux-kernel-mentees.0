Return-Path: <SRS0=uYLy=EV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21B90C2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 15 Nov 2020 20:30:10 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9696422370
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 15 Nov 2020 20:30:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eTaiHgE1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9696422370
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1DFB78720D;
	Sun, 15 Nov 2020 20:30:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X22+zjQFIVHt; Sun, 15 Nov 2020 20:30:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0565487205;
	Sun, 15 Nov 2020 20:30:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E3D5FC0891;
	Sun, 15 Nov 2020 20:30:07 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 49F70C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 20:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2B4E92035B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 20:30:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yB-XbpxeVJv8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 20:30:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 5415B2033B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 20:30:05 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id w14so11414431pfd.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 12:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uchtDpHIzTRX4R0TzTTXvMsifqvBDrgCOU4Whu1bLBA=;
 b=eTaiHgE1kP9MxX8kHMxyC4jz5qjt8kweGXoui7jzCeB5Jnjgp9fGzRSXo5s+QsIBsZ
 c2h7WIE9l6Ve8zgSIXUYzlztkGJRv31L0KzbbSg5CnrYhZdIsQnLCS+Q5I+cdGNbDDMH
 6UxX59mwvi6BikxcSZYqlGMOKnJHGa544c5JT/NwE3F6SDiaq+Fioan8oWmvYbXx6WOT
 bHsXuv81CiK3jke/03AjBYggFX3kkp1vXCKFj5j0lkV28htQ+HZ4whPf5ZCtEF/DeBRy
 2UKMkemEgQjUDe+13XBCgk3qLsORcepMljx217wh4P+JINId7ESWfdroAnjpfuBlKIGZ
 Ku3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uchtDpHIzTRX4R0TzTTXvMsifqvBDrgCOU4Whu1bLBA=;
 b=WQrMm4OE/iRpVOKDaWMx8ifzyXV/il3xRdgXSSrvf3+WcYasaOhau4I60yMV50lysa
 1tWokgHJEZLyCALOlYMK4qLhnBID9xs/UZI/HQGNEqAnt1NEJgs9XRBtMNyx9+J5Vuey
 WbQc2OywWoNLvzlC8DczsCEag5KYtdnINpzp4+h8D0RiYt4F4r6m+xOGzkB0fdOe/dzc
 wPoze7OroKI1aQ8mUe3Qh62YomQ+2hToQUfvP2hAa4aORBn9sjOCJTCTcVTPVCQoIy95
 i+1g7N15jjLQZTP2BGHh6Bm4bBklK7Yi658GYPiEDuoMnjaHBguBFrTQ7uQPiIzj6H2u
 HUDg==
X-Gm-Message-State: AOAM533GaSoSeWUmYymbuVtniuTwdKTKpqx8yd6T4h8e9+2pzy3mNDn5
 iNbFLQtpK6VqeZBljNT9ju0=
X-Google-Smtp-Source: ABdhPJxgJCZQBqHb4PFvyN+HU+G4OGLVSvsKzfA4M/r2PDUR2nGQFefU0pcFc0uKnIWhqL9/VuDmxg==
X-Received: by 2002:a62:1901:0:b029:18c:659c:e55f with SMTP id
 1-20020a6219010000b029018c659ce55fmr11561621pfz.51.1605472204549; 
 Sun, 15 Nov 2020 12:30:04 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:6810:256a:6eb7:36cf:abda])
 by smtp.gmail.com with ESMTPSA id l9sm8127573pjy.10.2020.11.15.12.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 12:30:03 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Mon, 16 Nov 2020 01:59:28 +0530
Message-Id: <20201115202928.81955-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: Fix unescaped left brace
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

There is an unescaped left brace in a regex in OPEN_BRACE
check. This throws a runtime error when checkpatch is run
with --fix flag and the OPEN_BRACE check is executed.

Fix it by escaping the left brace.

Fixes: 8d1824780f2f ("checkpatch: add --fix option for a couple OPEN_BRACE misuses")
Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 2749f32dffe9..0da6422cd0fd 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -4505,7 +4505,7 @@ sub process {
 			    $fix) {
 				fix_delete_line($fixlinenr, $rawline);
 				my $fixed_line = $rawline;
-				$fixed_line =~ /(^..*$Type\s*$Ident\(.*\)\s*){(.*)$/;
+				$fixed_line =~ /(^..*$Type\s*$Ident\(.*\)\s*)\{(.*)$/;
 				my $line1 = $1;
 				my $line2 = $2;
 				fix_insert_line($fixlinenr, ltrim($line1));
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
