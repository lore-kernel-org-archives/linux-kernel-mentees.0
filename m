Return-Path: <SRS0=TCtx=DV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 144D0C43457
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 16:38:11 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 436B3214D8
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 16:38:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JlhJgRLO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 436B3214D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BF58787B0A;
	Wed, 14 Oct 2020 16:38:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EIYH6BzrlQlG; Wed, 14 Oct 2020 16:38:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5F46187AB0;
	Wed, 14 Oct 2020 16:38:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 50D77C0052;
	Wed, 14 Oct 2020 16:38:09 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8AEBC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 16:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C1F462E2AE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 16:38:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3V1yfgykhIVy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 16:38:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by silver.osuosl.org (Postfix) with ESMTPS id 0CF3B2E2AC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 16:38:07 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id g16so19120pjv.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 09:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VY0MvFGC3zETzD7GSybyFTiANMXXAizdMlP9FpHdDks=;
 b=JlhJgRLOiKuRBVyOzDvLQb1fUdCqWuEwAmzXPogFUfHdYzaGJKNpYmhrhIySnhY0jb
 /flNj2fUG+fMsUhdoQzTNgROvI2/2Uyj4iXCQCSw/37/+PWSl3M0fSZIzcSTCq6Cyprr
 uFsxGp1b/I1HONVODLHPgdKlgfIvMgrRhOBd+Gignq9ya7Rq6XgowwsZ4y6JThX/mm5x
 5Qnuwh+OddizWCRNDnE44cSOof+RNJoU0Ina+OEaG0JNrRWdyVLDtR6AL1Bi81zpq2bx
 DSpgPslKXtYi0eWn2dWse15DXTpDr7reIvdZB5LdExL/6TLpSvGRNyZDUKhZWzA+D20w
 uclg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VY0MvFGC3zETzD7GSybyFTiANMXXAizdMlP9FpHdDks=;
 b=p4HTlrpWuB++uTIxiaoKBH9WV3fnP9k1i0hq/rJU+JGMll/YeNkhIEHC1KHrMS58MJ
 TcMcaYZ8qKDX9nsc5tBv2a7qLirRlbWxRahoxmBeRWKdIPzzW81pIq4Rb28/6Y6ce0gz
 Ix8yCCak9NXs40GGZiRiufwcgfHmmg3VjbZBS1F0aupcRTTt2TLIMZv1KWN3NZ9bUMp7
 /4dQ4ufSNp8U8PDmR4LGSqjBXPc9oZsLzC+9Mp4VoS/gNeatUTUMq0mrWFwQEjn53eqB
 d1ybWeNmzUhmMjCROWWYtjtKiNYrx0hA4IheX7s+HN1TU3Hj8sfKbrsq3xY2BrJRRjiE
 Xh5A==
X-Gm-Message-State: AOAM531FZjvFDF9VLD6h11nUDL/kYq8qE0R1iMhIynagGHM0C+kCduKf
 +vvtbPgyUG5YLNTp6wB/yFY=
X-Google-Smtp-Source: ABdhPJwcYKvkBeJurfX7deEz1OcTacSj1Kgx3dK1DosE2Zg4V36UjONzj+d/gU/HmswMrazPm1PlFA==
X-Received: by 2002:a17:902:9695:b029:d3:8b4f:558c with SMTP id
 n21-20020a1709029695b02900d38b4f558cmr5110232plp.27.1602693486444; 
 Wed, 14 Oct 2020 09:38:06 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:9004:686c:a3bc:1846:e23f:17d])
 by smtp.gmail.com with ESMTPSA id
 m11sm102187pfa.69.2020.10.14.09.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2020 09:38:05 -0700 (PDT)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Wed, 14 Oct 2020 22:07:38 +0530
Message-Id: <20201014163738.117332-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v2] checkpatch: add new exception to
	repeated word check
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

Recently, commit 4f6ad8aa1eac ("checkpatch: move repeated word test")
moved the repeated word test to check for more file types. But after
this, if checkpatch.pl is run on MAINTAINERS, it generates several
new warnings of the type:

WARNING: Possible repeated word: 'git'

For example:
WARNING: Possible repeated word: 'git'
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rw/uml.git

So, the pattern "git git://..." is a false positive in this case.

Add 'git' to the exception list for repeated word check. This effectively
fixes all the newly generated false positives.

Fixes: 4f6ad8aa1eac ("checkpatch: move repeated word test")
Link: https://lore.kernel.org/linux-kernel-mentees/b6cd81b936671a8868fe98536d7c80771bdfd61c.camel@perches.com/

Suggested-by: Joe Perches <joe@perches.com>
Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index f1a4e61917eb..b55d83360366 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3063,7 +3063,7 @@ sub process {
 				}
 
 				next if ($first ne $second);
-				next if ($first eq 'long');
+				next if ($first =~ /^(?:long|git)$/);
 
 				if (WARN("REPEATED_WORD",
 					 "Possible repeated word: '$first'\n" . $herecurr) &&
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
