Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B933176EE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 May 2026 04:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778818786; cv=none; b=m0WdjLavHl0Pvg30K4q2ZuJDyZ8jPrqw//NCWr4fVgyGfjCXXFxANmVpSzwZI2HcKUenGd2skuIbUTSUlWpkfVTN7hOsFhOSayqw2Yo5K4JErbOQp47gH0vo9WCAMneN5VfX+RPhNt5jWel3CJfGecLVyxvXk2gUi+jd3IaAX0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778818786; c=relaxed/simple;
	bh=cMt5CgqbxiHrSfqQXqB2bifZHhkoBFQVHyRgoGVxnZo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zd8aLihjltlMomHL5PsPIWKjasr7xliCxD045h6XfEXr1eO6myYmTT//fa9WJWK2bTNUZJv1lbn9SsNMhNEEtFniGdOK2JIh//UIEXnvldw5IHI1IK9/VqGa3p9hlSCGhdl9JtKo1fST8bOIn95PQ/T126mAXePxf5ApZgDRSp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fq4/hKdN; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fq4/hKdN"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C00D6126F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 May 2026 04:19:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u5XyEfQTJkpv for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 May 2026 04:19:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=jillravaliya@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B9F916126E
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9F916126E
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Fq4/hKdN
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B9F916126E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 May 2026 04:19:44 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-36643b96b99so6344275a91.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 14 May 2026 21:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778818783; x=1779423583; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ha4nC/ktJ1eVMIcSWk93O6F/MaOIIBowLO41TX8PWHA=;
        b=Fq4/hKdNlur4vHomiJqMQ/tnPxCestCzYPLvw4r2Do5Va96N7lS0x3l/xCvmGy/eLz
         BT2fSgPtkD+e76/O6C84VoW2lGGkotMU93Us8oYtRNSw0u2l1DxAWzsY5ZlFXhNwT8tv
         rkeMCAggEv1a/fpgNNOnfZRJ64N4JUYBYmR5JplO03s8eDS9VT3G0u2RrNagQTrG/1pS
         erhhBMyWDTop6da4LmXen+ZSQzXgMVbIEFk1LdUgMPHThXG0tj0ANwYSPBDStYFNii3E
         elvMUUmbbTAPVPYnPLkhyyW43Pv6xLg3S0rczn9YXjJA1cJLnVRjNUAWx7VBn4tp9jmx
         rY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778818783; x=1779423583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ha4nC/ktJ1eVMIcSWk93O6F/MaOIIBowLO41TX8PWHA=;
        b=SMxzacjo1xBo/d4tP8wlzbwYVRIHdFs/dP78KdulGB/5H5EDF0o726HWv4u6oQbrdQ
         rEq9kTrHpQjCbjXGGYo2Qie+D5yE3FEZ5BI5z//eiik31JCD+nooNPFd4SdcbAWkUzbr
         pq1RSJPGDG32lx4Bc2PpxBqoR2Ko/eUXInNwcntot+qvLc7ed8sL+HD1okB70JKa2dJC
         YjSLonfP6wSD2Axz6NZHunTiU/2zPhaDUryQl7RhsE1t0qht8mQ8e/NzRUt877S0Y+yW
         svNMET+QBoWVpkrriyREUiuOj98uIe6JfvJsjy/j2QM+j4FF/VK/8nkV5b2fS/tyULyf
         2WtQ==
X-Gm-Message-State: AOJu0YxabYM53KspDk48sgga6/p/MjKhlUZsPmnX0e3P+6lHnRdYTwL8
	j6Pb1a4W6aiwXn7P0ZJrjokNkKMFlnjELRZ1aS/VE4cdweYaGwS8hehg
X-Gm-Gg: Acq92OHehgtVE1BpDaagjpsFtvVRx3CLKuz1NHwSVeF9TdtOh34FiIPBB7UqoqqLbMh
	HTzbwNRdhlcC8RGo5506KvT+5+dRjF09gkW2HrDmpfscIvyuIAurLRGzJoetO8gLdJmpx64r4A7
	lVXD6fQkN+UY4owpDzCAFdy96qPiYcdisa8+WuUUpKmX76HXlySGd7wep9QmzSQh51Ni5kLr/iX
	ufdL77pl9uzRv/1lB2FaNKVaWRA5AcN8hPQPYx14+Zg8IGgwa+flS5YEYq/HY7Y+SxKNiH4ZIF7
	8fnC35ZXWLUqG/8MK5ZTR3y3qseb49IytbzJ9c28g78PcYo4Yzn91TBD9UcriQ+CJVkA2YD3qBR
	GonCuGiwpdRzU39isccNUUq/FLZX5ByW/noZGzwlvsGe++NuKsixoV/9gz61CJ+PLVo1h005U1C
	x4wLXCcBdzTRwIrY+F9ddCXeJq/PZCnHxjnhzlLidP3Ljx/l0XH86ymaDzNvniuy+0Cw==
X-Received: by 2002:a17:90b:1dc5:b0:35b:9b77:d7c with SMTP id 98e67ed59e1d1-36951b888d3mr2453217a91.14.1778818783270;
        Thu, 14 May 2026 21:19:43 -0700 (PDT)
Received: from localhost.localdomain ([2409:40c1:2158:c5be:20fb:ab66:dc6e:48f3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695155b3f8sm1243553a91.4.2026.05.14.21.19.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 14 May 2026 21:19:42 -0700 (PDT)
From: Jill Ravaliya <jillravaliya@gmail.com>
To: skhan@linuxfoundation.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	Jill Ravaliya <jillravaliya@gmail.com>
Subject: [PATCH] Makefile: add extra version identifier to EXTRAVERSION
Date: Fri, 15 May 2026 09:49:35 +0530
Message-ID: <20260515041935.10619-1-jillravaliya@gmail.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jill Ravaliya <jillravaliya@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index b7b80e84e1eb..667d7e1c88a0 100644
--- a/Makefile
+++ b/Makefile
@@ -2,7 +2,7 @@
 VERSION = 7
 PATCHLEVEL = 1
 SUBLEVEL = 0
-EXTRAVERSION = -rc3
+EXTRAVERSION = -rc3-jillravaliya
 NAME = Baby Opossum Posse
 
 # *DOCUMENTATION*
-- 
2.43.0

