Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B5F215075
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  2 May 2026 15:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777735688; cv=none; b=kJ5HoSolf/FRQlzZScx/nPiJ3HeUq8DiCcNynKgwJjLD4/PiqSTUkDEu+JW835Lt3a0LF1rEFxRrGkKvkgDU+1Gyz0YiJt+PK3w8Jx+i1V1I5bA9BjipLP69n2jMqiqfHiig0wbYeGqT2wEEg1zSy/BITvLlPgMJhn/wUVn80xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777735688; c=relaxed/simple;
	bh=Ur7q02NeVtJSOy7orK58kqJ4WuABGh+N2Y2Mne3aKDk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XYcGV1zhSsbWOfCivuWeE2RtrBZx0ou62gZG7fR+aTS1QE1nWFIZvtU3lN3o+MX2k+k1B1RdqA5atfTHiFt+eVys2LqrgF6T2pTwK/B+LvOCf0h2pKiED8CJGKd2eTqS36hCmcs3IBhJarPtWfBzk4X1+BcTANpXvABe3sBHA2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vap8VaL9; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vap8VaL9"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6264083BC8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  2 May 2026 15:28:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4N8__pAsvaF9 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 May 2026 15:28:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=pavankumaryalagada@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A562583D60
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A562583D60
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Vap8VaL9
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A562583D60
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  2 May 2026 15:28:06 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-82f8bf96b46so1238422b3a.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 02 May 2026 08:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777735686; x=1778340486; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4lEXXuT8fkR0sExnwAQD96U0WZzRZr6E+8Jzs4vSM+Y=;
        b=Vap8VaL9flMVrCghJvHnGimG3VBFLlI92W2z7gEraPC3eefYRWR7zNbmbuKe5RQMwv
         vhHPb20yDYKmoX+Fh9BV0fBw6a1hb817TELgd1b6JWCFbxDRP3SMEkISxFmIvJujDIGX
         L2fXUC/Uq1e2XjijwSBOTszyhKe9lbYgtZpZVc/VnwWjLolr7mAl8HLH8M7qo+3WqSNm
         spV2NoZ4XfX1XOU7d9KdDic7C72ON+jyAo+LY1jpvprlAiRbVRgw/UqEoLt5R9nb/H2T
         ugD6CQ0Yqa1vi43KfD4ZoJxruGXIfv2mrhCDDrNrZ9b5M9pF9sHM7CaF/SCPbVRM7FgY
         CyfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777735686; x=1778340486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lEXXuT8fkR0sExnwAQD96U0WZzRZr6E+8Jzs4vSM+Y=;
        b=VMoU9UAjKc0ZEiIo2EebPkp5JCFLI7yw7g5ZRr4Wq/Gg1QrufMRr1gUNxQaFpamgRx
         zvRofFwACEI4YTSxWF2Q53NjarQzJyHfRMRGsnhXkF+GVCgVrENgwcxXIhvv2b2UEPxE
         39DUt78V6pR2XgE7hcA6um7Q/DxTqO6zQmE1UPb/zHHQakpchMSnEKr+ztipk6Ym3YAn
         sPXeJ7dZEtZx9RwoNoDPM0idlNfvW84OY7fUQwgRdLDx6BgvdsBuXNRPasSTh6UIPH+e
         tirBJdnAhhEqXAcVtAv5Q5J4LV+/9nSypSaQvMegDxtXkvugXS5+VK2jQZwEWH823bly
         tMnQ==
X-Gm-Message-State: AOJu0YwZtdy4Pe/+le/yVnwMS2rtyi3NnMWl8nVCwWnxkL6LGpJ/7pQN
	DR27HVqZ8iBVPmA/Z9T+RlL7LzlIzwJWKBlybGjGgDmDLZAcbu3uUOrT
X-Gm-Gg: AeBDievUOUL6qXW5m4em7c/DoXH+V04Uv4Cj80x0EtHyqazcExrpUJIWlaT9qOXzWf9
	gUL4ug/HR2VZYnyWLoKOMZFySRLJf44Fi8P8vUT+iHuvLBupzIw4i/jTBIsSkvPJcX8GHJKI1Qf
	l2YwsmfceYFUWuYlpi+OSjfeH/S2yaUCEfNRQFD06MYkWgkI/PDWyrj3s7x/4dTm13YJBIN1i3H
	hyGKaHrKVsvAe+0692Ct9DZb4EbDdgREoTs/2+zd8CXh9inZWGG442QGNyE4y/iIyFtk3BKrmY3
	z+LTZlQ6II459IMRAshxN/MlsU35Upyv8XLvpjdqj6k34FmIfKkqntVTzwVi47RP1oIUQF4GXOa
	/1PZ3cI/v495jsFUavLyBf38H8LNkj0xaJBaac32xjWMT2cA7LM3xmCUfIZvRg9FkpjXthYm+jl
	qI6z8BAPWD8PMHSMqL+eeZ6vUbSJYyCLs7WsQM1CpFlw72vtFacPRS
X-Received: by 2002:a05:6a00:2993:b0:827:28ba:ff00 with SMTP id d2e1a72fcca58-8352d160370mr3025657b3a.18.1777735685711;
        Sat, 02 May 2026 08:28:05 -0700 (PDT)
Received: from user.. ([2405:201:c052:b00b:c985:2bbf:bf0b:3786])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-835158bc863sm5646991b3a.26.2026.05.02.08.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 08:28:05 -0700 (PDT)
From: pavankumaryalagada@gmail.com
To: skhan@linuxfoundation.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	pavankumaryalagada@gmail.com
Subject: [PATCH] kbuild: add pavan-lfx suffix to EXTRAVERSION
Date: Sat,  2 May 2026 20:57:55 +0530
Message-ID: <20260502152755.95805-1-pavankumaryalagada@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>

Modify the EXTRAVERSION field in the top level Makefile to
include the "pavan-lfx" suffix.

This change is done as part of the LFX Mentorship application
task to demonstrate kernel build and version customization.

Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index e27c91ea56fc..16d1312686b7 100644
--- a/Makefile
+++ b/Makefile
@@ -2,7 +2,7 @@
 VERSION = 7
 PATCHLEVEL = 1
 SUBLEVEL = 0
-EXTRAVERSION = -rc1
+EXTRAVERSION = -rc1-Pavan-lfx
 NAME = Baby Opossum Posse
 
 # *DOCUMENTATION*
-- 
2.43.0

