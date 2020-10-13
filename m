Return-Path: <SRS0=MU2n=DU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6544C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 13 Oct 2020 06:30:33 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0144820790
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 13 Oct 2020 06:30:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NhWGEi9C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0144820790
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7853D27404;
	Tue, 13 Oct 2020 06:30:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i3LSLqMNCgpL; Tue, 13 Oct 2020 06:30:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 56BED233B0;
	Tue, 13 Oct 2020 06:30:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 44734C0052;
	Tue, 13 Oct 2020 06:30:30 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8E51DC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 06:30:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7593485F4E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 06:30:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RDwXPAYRKWSM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 06:30:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0EA7385625
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 06:30:29 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id h4so1536738pjk.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 23:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IzJhHTSFV4aE1sSC7KkXjqi2ufY0RfaV89jrFKTw/jI=;
 b=NhWGEi9CF4lTkVIXepurBG31d6M+5DSrFwPeyGaSU6HrhhlD2AvOQfFIu223sjtLtj
 xs5kR3JJoDTANs5oJhAxUeeZayuo9f+hclDOrp3Ver0/xLv9G+v4K4CGljR1PpIrG6fA
 d9EGX0CmvxHAiNjuch5FuJin7RUcBkSEpwE54QNQo/TAkevYFHlqQq047HdO212MYjvf
 hJltumCE89wxP0/kNXrzJrz4l3ov6SZln5RGkFkyiNb7wJhpybwcIGbjAQwaBBpq6p/w
 +pXPCebipiM26EQ9LZHMUmCnrOng4NFnym5Y2yuawaNY2CzP+j0y5zGSpAjrCSRAf1Jx
 oa9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IzJhHTSFV4aE1sSC7KkXjqi2ufY0RfaV89jrFKTw/jI=;
 b=Blt8ERDrCHGI5ELjqhX1DIgMSJ62S6TsMZR8UxBEPe0SBPOrV2sJNXCGeZq7Hw+hKb
 p2yDzWInKuK6Gcs5sCYRf64jMQbdIK21MB3HgCs9IkIeeGwe2EDhnPhzeE6uVp5qMaq0
 eQ92XcRhuPFKttzepJytY4oRkKOdcuo11ML1SbDYvK6Z4ak0HUDRg/xypaHsEHxDzFJv
 xXH/8DjPR2+18A8BeLjXEt7My2Kq7mmwta5Kiwa0iNtKf5goZJA9ASXjbT+yIejwuTg+
 Y1jTXuhTvH3AgkrdjeSVrDwfg9GevdbbOXegx7L5YnPjMywDO63Nu/wrSk2k3iCTJEiM
 lPcA==
X-Gm-Message-State: AOAM5325CmAbnUsan8PQFyrtdoddfPUt0Hkx6yfgWoftfP2pr2Jg6SlZ
 pImGkF4UWp0d37pTkB+7UMY=
X-Google-Smtp-Source: ABdhPJzIL2wBteQ+nWrWYs1YL1/uKPqftyKneYQMsLNb5lLXZjMjvCKHjSTt3Eb3T3QgaODwiIKd1w==
X-Received: by 2002:a17:90b:e15:: with SMTP id
 ge21mr22503034pjb.188.1602570628408; 
 Mon, 12 Oct 2020 23:30:28 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:9004:6854:a1e4:e3df:76ee:38b8])
 by smtp.gmail.com with ESMTPSA id fy24sm25881253pjb.35.2020.10.12.23.30.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 23:30:27 -0700 (PDT)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Tue, 13 Oct 2020 12:00:09 +0530
Message-Id: <20201013063009.38445-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: add new exception to
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
+				next if ($first =~ /(?:long|git)$/);
 
 				if (WARN("REPEATED_WORD",
 					 "Possible repeated word: '$first'\n" . $herecurr) &&
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
