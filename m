Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEC12417E0
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 24 Jan 2026 10:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769251095; cv=none; b=ADDYDkF4Fqex98yammoK84FdYSPkS4oFJwHPFKXXd3vvjVub5vn1krf0l5Bq3AjEOnmhzUEx9vD2Ba4/Ktz2vqtracbe9YIrJ7VB6z8yZoCiAh4QReL5oFHaXNld10JNtmPTqIfXFWeDLB49zoQN3NxSN0ZNuZe7PkJhJ3r2VuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769251095; c=relaxed/simple;
	bh=3HEZ82/Cq4KNqJKArJGWmycryyNkhLw3AIEPokeMP5s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lYfIxKT+Uzuyq76ViHThlAhWtP4v+N4iay/d0HbJc18vCffo4q/wf0SfZJYwn7AnO0w8R0VCRJPGMzmWhCeKYDFGoKSP70a1yEVLHm1cO0j1LkapQVAQMzLDBk0TfFkFdYjOut3yX6PjGmf4xFCGOaGlFrWhCY0I9jGvbBlBLB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=khcPFQcI; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="khcPFQcI"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a79998d35aso19649225ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 24 Jan 2026 02:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769251094; x=1769855894; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kxtCW8Jq6U64tWc0q8bw5O/RNJ35zRNL6SE4nSNd5Xw=;
        b=khcPFQcITlxtD3TWWGQJVVPw0NadV8nL1q/fudvYvLcpMUPncabiCeqNIpM8ZWbBri
         pVZxoTJPkyCE3XsRYBFsw+Sk1yGWBbQL71grkvUuA2SWil3IqvBZtvGY+Ho0jIsKE1LW
         EbGaQSBJnz9JqsZlKXPG68zJ6F7fNlo8o+fuWgInBGlmp3SoK4e7G59OCfR202hb/9DA
         kAF0FKNvfBCilNEeJcTxCT6/m/NJkAFXX0uT/d1TvXJ7Up6C0yTQGJ0/qaWQ2Qoyxjkh
         aZ/Oa2N2A2JzJMkyRLKUuV41L1imw26XPX4cB1dtTQNVSEUosiPVlYzO4vfXaIyQbO9+
         eBvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769251094; x=1769855894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kxtCW8Jq6U64tWc0q8bw5O/RNJ35zRNL6SE4nSNd5Xw=;
        b=vH3tx3pA+gnSWllH6gq2o1ovBu1IJ0CbcrdYbeyCwG6wyS1u6PnDVvLq4QggTMcYDj
         kTH3wfZ2SazZuHzgxtiWIVbQnJUytly6WTo4nEwr15gb4xJaHa2zHGew8s6PXLivmd7/
         hVbqJHLRYe/6pdyt8O6ZNcmsoiOg6FbQizkuv6XCjSU9GY5PY5qJtTmvvoiIncI3wLxA
         sCyKA4tIOTILJRYYQVq66vgOEq3qwx2WqcqM6g+5nKYAHX5fGY1vPQRvAijPWWyBd3Fm
         vLk5Fgj8Z5IapHB8fUDtVA62zMpj8FriqkKFhb3AziDdYAn/l/p5zNMJwkdGrZPHi8br
         +3VA==
X-Gm-Message-State: AOJu0YwLkxDjcXkGC5E62rdO+pz1KH238KAha3zGQhr6dgTO4+ZRZ6hs
	Scn8AmG4tdzq7+sL53G1XJnEVeJGNxpOMwaHlr6f6xxvPB+q2HTu+QAX
X-Gm-Gg: AZuq6aKmyjOYLn7W3GH4mJzeDHFbytnCqRG1C0ojyF8jVFItm5zwe/qT/Wc5KRnrkpR
	Ljzo3D5GgOH/GqPuys4tDfEhnjnyeLCM8CF4BEShkLPtmFZUsb+wHVLR41pnc3rBWUqrC2EAkr5
	lgtNZh5F0WASThDr3W2gHozmYYBjzL+fwgCHQ2qVyKPvnXLSgzCb6Uy2W/6sYDyQkzdmxke9NQ2
	b3031YEHj+TiDatKaK1W71U8IyOA9a+TPbSY9/gdJxPAxdSqfnHFItvIpr4vUEiVQ3L/PQ9vmhB
	daF4Yz3KgmY/NohztyVIILu256Xjl7d6PmGDoJWJon5KAHUqKZL4bt9qt3Vgkje63SbKjRQYr0U
	Newom7krjXexWL8x2h6xH2AGPUXrwZBuLrVjoFWF85WcwsmqjXOLFGUD1St1TKDMznpVHCgjdp0
	i6EkRwwBoFsygnzeKAXN+jArlwuNfB2696TPY7rNjSRTe5UdMBew==
X-Received: by 2002:a17:903:b84:b0:2a7:9948:45a4 with SMTP id d9443c01a7336-2a80ebec856mr34287895ad.25.1769251093948;
        Sat, 24 Jan 2026 02:38:13 -0800 (PST)
Received: from tabrez-VivoBook-ASUSLaptop-X513UA-KM513UA.. ([27.4.56.3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802de5cf8sm42122845ad.42.2026.01.24.02.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 02:38:13 -0800 (PST)
From: Tabrez Ahmed <tabreztalks@gmail.com>
To: skhan@linuxfoundation.org
Cc: linux-kernel-mentees@lists.linux.dev,
	Tabrez Ahmed <tabreztalks@gmail.com>
Subject: [PATCH] Makefile: Add EXTRAVERSION for LKMP
Date: Sat, 24 Jan 2026 16:07:49 +0530
Message-ID: <20260124103749.10246-1-tabreztalks@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add EXTRAVERSION for LFX mentorship task.

Signed-off-by: Tabrez Ahmed <tabreztalks@gmail.com>
---
Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 1465f715786d..d34271dd9c96 100644
--- a/Makefile
+++ b/Makefile
@@ -2,7 +2,7 @@
 VERSION = 6
 PATCHLEVEL = 19
 SUBLEVEL = 0
-EXTRAVERSION = -rc6
+EXTRAVERSION = -rc6-tabrez-ahmed-LKMP
 NAME = Baby Opossum Posse
 
 # *DOCUMENTATION*
-- 
2.43.0

