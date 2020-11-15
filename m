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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09A40C2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 15 Nov 2020 17:17:01 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63A7B216C4
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 15 Nov 2020 17:17:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oqCcRpNG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63A7B216C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EE451860E6;
	Sun, 15 Nov 2020 17:16:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id awI8HcftFgoh; Sun, 15 Nov 2020 17:16:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7B4E2860D2;
	Sun, 15 Nov 2020 17:16:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 64DBAC0800;
	Sun, 15 Nov 2020 17:16:59 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E81E4C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 17:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D67C787228
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 17:16:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ask8kuQlhCtY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 17:16:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6664587227
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 17:16:57 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id w4so10606478pgg.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 09:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/CQKBZ36y4QUdQWAM0OgBG/wFoBTUexF90TWDffxg1E=;
 b=oqCcRpNGrkv170ciKcbAPWISrr2vyshdamaKoIxLS7itEqL5y/eRN0+u3uCI9ZiHlS
 yIm3p77f+atSwk20tiVpja1ou+gArUwNi6O4GOArbwB4FsYpl3H72D81UoifSphpZ73C
 Moc2+7o5oWrNf7Vvw0zkaQIGM8NV+WJznUt+TG/KH7ZljL7rs2Ut59Hp8pliSS7LN6w8
 H1ZMlyL8UdWbPbifgEMWSDlw1NAH7mXzz16AGDndL8iOe80rodymV7Tu8aqN4iche+mi
 xhQZ+rF8Vea2KgRfPDU0mpRDZL9z9YSAVPbbm60mNB10KT0fRXxbB1Im0HUN/DJDlXGf
 ypNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/CQKBZ36y4QUdQWAM0OgBG/wFoBTUexF90TWDffxg1E=;
 b=JPmhP0ppTK/s13DgzRWDe0gDOQNmU5Tr8ixNqGhkOnJ4K/R88BWs8Rv2+PsHl8qLKd
 rnhLQYAFHMBJHQtlBNhc6vDamF3cdIrNTeu/FO16x3SwryhlKr7ds5N+7qqKLCCqwQAy
 DgjvjjS2CYHaOtXcGKgmfQiUOO/ye9VBgC996+kkJLzD29ebhkMFLDB/hDfRshRf9qcO
 SrM149xLD+CT1Zr7E5LMwe95UKWf6bDcbGlMU981miS8D7/EzR0HFekEjI0TX6W7PO8e
 pSVnkZXh5GvLdhvHWNNzOBqQF2drF/c7gezj/tWf1nvMzFMeNRTsoArzi3z2Hs3me94H
 Sd+Q==
X-Gm-Message-State: AOAM530NGmIq412VxbwmEk9yedgYqGzP6pwNzk5MlyWIgWyamWceEfmS
 QcElnegHRsEStfDkNfs200A=
X-Google-Smtp-Source: ABdhPJwOqgd7Jn9oClQ8+8rv+8fSeA3//BQ9mA7RrHOs5woSIppQuRs9utzVCJn/ZxtBOqkf2ktMvQ==
X-Received: by 2002:a63:4450:: with SMTP id t16mr9679779pgk.312.1605460616756; 
 Sun, 15 Nov 2020 09:16:56 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:6810:256a:6eb7:36cf:abda])
 by smtp.gmail.com with ESMTPSA id b17sm13905660pgb.94.2020.11.15.09.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 09:16:55 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Sun, 15 Nov 2020 22:46:26 +0530
Message-Id: <20201115171626.38478-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
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
