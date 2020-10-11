Return-Path: <SRS0=Swos=DS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C06BC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 11 Oct 2020 06:44:12 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92EAB207F7
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 11 Oct 2020 06:44:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JxxfvQtX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92EAB207F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2A2D08777A;
	Sun, 11 Oct 2020 06:44:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mZlyY4CbalDU; Sun, 11 Oct 2020 06:44:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5DE2287775;
	Sun, 11 Oct 2020 06:44:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 41678C0052;
	Sun, 11 Oct 2020 06:44:10 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 29FC0C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 06:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 18E6785F4B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 06:44:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5pf0Nff9gyI7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 06:44:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0377485F46
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 06:44:08 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id w21so3957989plq.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 23:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZvIm7FuCWhJAATdG+o9Th6MxL4OUQCg/xKnZukcaw1U=;
 b=JxxfvQtXnTmGF4CoGXp6Tg2xp/yFfixIuL/4gKL8MChPgSPEx6CuIObyJr304v045N
 7Q2N41LdeNAJX/8NclBvqSz+U+WJCjr6eLWeAjhw1TU58DkXImOt3M93I6uS1fE0FroZ
 h6H9r1ggscK8dP940gtFMOaa/5/+2on5LW//i3S6ddFe3St8EHqSW57hsSJbmqO6hSOj
 pfsrA8xIu8rXO27CagETrzslfC+Mb+H4WFdaOkvAGtft4SIcJhKX4zRF6zRuHVYQTY3I
 56gPjsX67BGuJURMF1NeRAlmQlT0+qujo2g2/+J2GDGDEZyVvjqAVGQEI6+H95i+RbWJ
 /trA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZvIm7FuCWhJAATdG+o9Th6MxL4OUQCg/xKnZukcaw1U=;
 b=Nz2XF0fI+acklydD9tus8erS9QVGARVCdFc38XQeC5suuUnO9q99JeqwY/KDhXh2ui
 FFHSJykQUFgDudb3bUiOZdIB2T8O9RZ7PtVfA1dPwQoupho2EjtOmFIPdkZu8IuP23vN
 uHQV6GAny63U6K2qMwCQk/IDV5TKF71zFUzNJA6ROEcE2VNdk+tyXZowTyyUMQZ3w1so
 RPH4nuEH2xbFzIsF0g15TGfQd9y2Mq8Nnu8yI/C6Lv+9HEx42Z2oADWrP7Wa0bwWKhn1
 Cb8vD5Sb0l89aZYJ7n7ij7iZwuW5x/XjiIazXfiDguvZYi2LOrO56BeubVXPNH0LJLJ8
 9vrQ==
X-Gm-Message-State: AOAM5315I1UQexJUABXqBZq6bnxK7vLlwDApASVXj/m3vOdO9fNzZwAj
 fj3UHCC01+J+77B0Op/T46M=
X-Google-Smtp-Source: ABdhPJyP0M9gf7tqAcV6/FuSTfwOK7Oj4Fx8R+VT7kPWlU7+k2hyLvGN+0b6vtj6H1eseP9VP40Crw==
X-Received: by 2002:a17:902:aa44:b029:d3:8b4f:5083 with SMTP id
 c4-20020a170902aa44b02900d38b4f5083mr18213060plr.78.1602398647499; 
 Sat, 10 Oct 2020 23:44:07 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:9004:6939:4938:9d2d:e9c3:3996])
 by smtp.gmail.com with ESMTPSA id bf12sm17880262pjb.17.2020.10.10.23.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2020 23:44:06 -0700 (PDT)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Sun, 11 Oct 2020 12:13:48 +0530
Message-Id: <20201011064348.14015-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH RFC] checkpatch: add new exceptions
	to repeated word check
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

The repeated word check generated false positives for
the following pattern:

"git git://..."

This resulted in lots of warnings in the MAINTAINERS file
which shouldn't have been generated.

Fixed this issue by adding "git" to the exception list
for repeated word check.

In addition, modified $word_pattern to capture words which
may contain a single letter like "a".
This ensures that repeated word warning in cases like
"This is a a repetition" are also generated.

Link: https://lore.kernel.org/linux-kernel-mentees/b6cd81b936671a8868fe98536d7c80771bdfd61c.camel@perches.com/

Suggested-by: Joe Perches <joe@perches.com>
Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 124ff9432b51..0ef75d2fb5cf 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -588,7 +588,7 @@ our @mode_permission_funcs = (
 	["__ATTR", 2],
 );
 
-my $word_pattern = '\b[A-Z]?[a-z]{2,}\b';
+my $word_pattern = '\b[A-Z]?[a-z]{1,}\b';
 
 #Create a search pattern for all these functions to speed up a loop below
 our $mode_perms_search = "";
@@ -3364,7 +3364,7 @@ sub process {
 				}
 
 				next if ($first ne $second);
-				next if ($first eq 'long');
+				next if ($first =~ /(?:long|git)$/);
 
 				if (WARN("REPEATED_WORD",
 					 "Possible repeated word: '$first'\n" . $herecurr) &&
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
