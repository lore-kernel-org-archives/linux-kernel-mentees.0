Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7497F15098A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Sep 2024 17:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726161763; cv=none; b=W9MnUvsraqM6Q8/+44ODPYgMWJzniwak4h/lRBxFbyKZq5fTyYYZQzxw8CqPzLna0u3spXmeBKe31ZyIdKQ5lk7XejjubYFfYEgNLIPZPms5DNK5SsBZdr1acWz2+I2bg4clwf/LUmWpwTcn4zr0rXFYHZncZwgPLUIOLAIHcNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726161763; c=relaxed/simple;
	bh=pxNvmEq5QlTet3+8Ka3sAa3aczDBESjV67G5PvmWMUg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=W5NmkOafRRICnkZP9COCDkYGGixaH8RtKh7uyuiIuSKRyITHpTYOtvZaz+n+X0mVRvtZ1Try4LlRHgLbDWgi7GWEbvcTpw6tqNELS+LhI4k52PZyFEyHnS2ZcJSPfWaOt7t4SY7PoqP5/feFbTjm2zAIhVMIleuxVwdMfJIO2oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BFnMnS9e; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BFnMnS9e"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E6C081374
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Sep 2024 17:22:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4jk1_KRsQ4SY for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Sep 2024 17:22:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 80FDA812FB
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80FDA812FB
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BFnMnS9e
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 80FDA812FB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Sep 2024 17:22:41 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2055136b612so16955815ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Sep 2024 10:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726161760; x=1726766560; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fDOX5j9BpxBbwPDKPBgnjgeJFyPPtDXmwFa02m5fEQk=;
        b=BFnMnS9e5AIIiLr6SVWyQxyP8TsNaE0JK3uFkvafbBNIyErTWc8Dq1gMScrj/XIryB
         kpjqCoWhgHLoB6kv4cyWkyLgGQnsN/FQZxz2Xh4/3cf2vThUpSuKhXV1ObkyJz8i8Q1M
         Jt0UjaLO/6WT6elKun9/8GM1Pr6Ipl41CzIzxAo7mIAB656ZDyiqqko2mxfAAzgGX4Ie
         DeB2vNAhqY2BYjJDvcH/i4nbwJkSK9OROvMF0V36skoyetBOBRxAl8VOoWMlH2Es6a7R
         gAj8uIMruUiio+P8fmDtt80bqtCcc3F16ZeeiJXWr0oS5ofMLQhVvTJ4ikZy/kamgdX/
         goAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726161760; x=1726766560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fDOX5j9BpxBbwPDKPBgnjgeJFyPPtDXmwFa02m5fEQk=;
        b=gr0Qu89cvBsw2v2SXIP07EsigP83TWNWz251snfPE7yMm4dl9p8sdt9F4SDtllciRw
         THYoazRZ88fA8e8oIV9gbU68hrVXE5zJONZkCRfJ+wnN6rSzCgUvVbvY/sIkLqltCulk
         x55D5dIbl9EFRps+LKRdkn2phHWyIUiU0rmhTefm1dK2CcouoMVxCx0Jl68A0MejRZcK
         Z7nkl2nud0MIRYsVI04BNsjPcx6MsXyxqcqOiaKdKjo8/9QVcYNUWvONN32pp+GYpmkq
         qj5NbzFMuIS5/U6CFlRbhL+EuZv4R3DH/EkZQ9ushkg+0XrAJGBz5iXU51smi34fXM5W
         xRDg==
X-Forwarded-Encrypted: i=1; AJvYcCUzUFADN+9bdgtD+StbifKrMmGsIC+l/KMIqL4IySXhHMjlaWpehK9nM6oefCueNH5uvvIqSctKB9DHwvn1Y1J5uuhy+w==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Ywc+/e5ejxmEv2kkQIUWNEEfgkmJpA1THQuaZurjkQ+mQcPu7pV
	OpD67KtYOXFq0dwpH0cT1o3IUoqw/OyIm1smWUISPdx93SiYzBfs
X-Google-Smtp-Source: AGHT+IHOONd5GoqrCv28UoIPTOzPATOJf1fEQXU3Q8j5mHBTE7M6ofoDdgrilpG5VHlsshxFm5tMKw==
X-Received: by 2002:a17:903:2b04:b0:203:a22f:6b09 with SMTP id d9443c01a7336-2076e334c05mr55343525ad.13.1726161760382;
        Thu, 12 Sep 2024 10:22:40 -0700 (PDT)
Received: from embed-PC.. ([106.222.232.184])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076af2745bsm16567035ad.60.2024.09.12.10.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 10:22:39 -0700 (PDT)
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: gregkh@linuxfoundation.org
Cc: skhan@linuxfoundation.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: octeon: Use new initialization api for tasklet
Date: Thu, 12 Sep 2024 22:52:31 +0530
Message-Id: <20240912172231.369566-1-abhishektamboli9@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the new api DECLARE_TASKLET instead of DECLARE_TASKLET_OLD
introduced in commit 12cc923f1ccc ("tasklet: Introduce new
initialization API").

Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
---
 drivers/staging/octeon/ethernet-tx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/octeon/ethernet-tx.c b/drivers/staging/octeon/ethernet-tx.c
index bbf33b88bb7c..ae1bac99b461 100644
--- a/drivers/staging/octeon/ethernet-tx.c
+++ b/drivers/staging/octeon/ethernet-tx.c
@@ -40,8 +40,8 @@
 #define GET_SKBUFF_QOS(skb) 0
 #endif
 
-static void cvm_oct_tx_do_cleanup(unsigned long arg);
-static DECLARE_TASKLET_OLD(cvm_oct_tx_cleanup_tasklet, cvm_oct_tx_do_cleanup);
+static void cvm_oct_tx_do_cleanup(struct tasklet_struct clean);
+static DECLARE_TASKLET(cvm_oct_tx_cleanup_tasklet, cvm_oct_tx_do_cleanup);
 
 /* Maximum number of SKBs to try to free per xmit packet. */
 #define MAX_SKB_TO_FREE (MAX_OUT_QUEUE_DEPTH * 2)
@@ -670,7 +670,7 @@ void cvm_oct_tx_shutdown_dev(struct net_device *dev)
 	}
 }
 
-static void cvm_oct_tx_do_cleanup(unsigned long arg)
+static void cvm_oct_tx_do_cleanup(struct tasklet_struct clean)
 {
 	int port;
 
-- 
2.34.1

