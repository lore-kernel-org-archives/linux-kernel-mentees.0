Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E5427FB35
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 20 Jun 2025 10:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750415173; cv=none; b=if6HllbsZ7IPSMQmc6oGRp5SBNTifRAzoQ8uGqcKWZswS714I0PF9fQIz0XrXFpR/PNJiKxAsYQGvyIVam+JK/GB1Uiq6t7V/ugp2CGclStUa69YtXOT3GFbv6e1FOI+fZ87ZLLmIzkJMNBkWXAWQyVW++ylv+6GlWF3tthy7zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750415173; c=relaxed/simple;
	bh=xXWRBXu4b5C4VUTK6Ue37Es+r8G811Z7yW6dL+2y6C4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XR53dpDSeZLiMtt9FhIyRCzE292AmlewP8S6Gni5Mv80iEUJY18QmTWDahAlzFG7wEa7iWPEfe8f/FqJXMXymDE3uVNactsgxAW6Uq9OsHldOgcV0x1whUmA46MLpei/Evdl814KrCmuv/V+Aw86+YSqn2EYqB8d9dwBMmW20ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RRiaXjVD; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RRiaXjVD"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7426c44e014so1396078b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 20 Jun 2025 03:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750415171; x=1751019971; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GxSzhVSOTXRFHb0wGgV69/LHfIPtg9HZ4PaYVasZ7YU=;
        b=RRiaXjVD/mP8DCkWaBimVjlgmvCYTWaQRuKK52QxxZvDjfLr4ER6+glyFnngtbgn/O
         jstfgvG2fRTBliSVVkqrcpRyJyuf88CngWcruu12YB6I+dEvFC2zS5HJlTDmR76QyeO3
         AxD+PSBOcfMJaUOgXCqIiZqRehJOOwFknB5n9vkIOEG4RCDO7Yi6WBYEtWGLaqdZZhPG
         p5q/J/5PBsBzEQTKaIGczaGw6u8h1y6DJUhx8u+XTospGA5PKX3g/QufsE7JBp47HRBm
         gt2nIYGJmwLKMcymIrSrvhC8qwPEplR7FA7Fx/P3xMeYBkMn9Lzpw41hlMBLv0omX/09
         9A/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750415171; x=1751019971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GxSzhVSOTXRFHb0wGgV69/LHfIPtg9HZ4PaYVasZ7YU=;
        b=vrsNqgRdkCGSPLmRzL5YXOmZU03q4TYx9xO0SLv3N4x9WI/P0SQq+Hbw0R5UWR7P2R
         4cGTzOk9pOcLI4LyvkbydjYRxT/8iLnsRZDu9jThz6RfNlVb9liTvGVaSkIfzC7BRIV+
         wOfetVus8NqW5FwrkG40kkhMc7HJIpxC9QhRkyaRCmGXPnDEIN21/gI065R1hVxq5bI+
         5bL+UttZn96BknO547FdnOQmk7x0aqox1XY37Qm7nFIPR9VC1LAzIdaR5jMBLICvvTVl
         z1xcuq+JuuVywpTTART50XlJkmFQMCkoRoo5McNGTKfThObzPlTlbUL5eMAQllmKKqMV
         R5UQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFUQ4RxwedBPYDHfXP8AHVMHuuSJSvFbaZ/9bzzp2E08tkJkBKpO+d61T7lh7W/rN1dgISAXX5SePAYlE1MAelfNMBjw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwSCwrUbF05/QmuhECi84hhqPGeExzajGk8KT672PXR7t3EACyw
	LdgOxLN295apVHDpInKd2skqPBUuB+UbVK0EMSG5THLPMCeMILLKfoeU
X-Gm-Gg: ASbGnctTq/WuqTrS6Z/AW9bwUPcQf5FsApkmmoPmoKmqtvGKH1juJIyGSrKj5I818OW
	eNh7pcuAmq8O7A5CjlnW+wYWcme3hC9+RbiLN5mtGJBKMtLllBBP9w/OlBgj66W3Hu6R0lKGdEU
	GzPT5MN+Zicunz+mMRHj3itMrHrK+ryy8U1W41XiC/K4pJh71mcjcBM4Gk58TJ1/GNr4uMWQpAu
	WsW4soIIsDcKRWhObfDHZ0WKUp1B70Mvsa3oTXX6ACJeE8qV6vgITZhKxYwTc4NIpG5D0FG+vfQ
	Kx++WIlJfBUxuWORp6JKMuS0D3RQ/Y0gzCtsoD8+TSYz9GuwNl6ddOza+R4Mgy6Fn+G+WFhpuSo
	rrHV1Nw==
X-Google-Smtp-Source: AGHT+IGv/c6FWl5u2zYrF5GUTumfzJX/FvPvDDdMT9K2eWxzFdO5ord3yGnrQBN6yvzaQ7fDnvQZlA==
X-Received: by 2002:a05:6a00:3e17:b0:748:f1ba:9af8 with SMTP id d2e1a72fcca58-7490d6fb530mr3206147b3a.21.1750415171410;
        Fri, 20 Jun 2025 03:26:11 -0700 (PDT)
Received: from manjaro.domain.name ([2401:4900:1c66:adfa:3ba4:a43a:db76:7cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a629678sm1750022b3a.93.2025.06.20.03.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 03:26:10 -0700 (PDT)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: wenjia@linux.ibm.com,
	jaka@linux.ibm.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-rdma@vger.kernel.org,
	linux-s390@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: alibuda@linux.alibaba.com,
	tonylu@linux.alibaba.com,
	guwen@linux.alibaba.com,
	horms@kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH v2] net/smc: replace strncpy with strscpy
Date: Fri, 20 Jun 2025 15:55:59 +0530
Message-ID: <20250620102559.6365-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the deprecated strncpy() with two-argument version of
strscpy() as the destination is an array
and should be NUL-terminated.

Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
---
 net/smc/smc_pnet.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/smc/smc_pnet.c b/net/smc/smc_pnet.c
index b391c2ef463f..76ad29e31d60 100644
--- a/net/smc/smc_pnet.c
+++ b/net/smc/smc_pnet.c
@@ -370,7 +370,7 @@ static int smc_pnet_add_eth(struct smc_pnettable *pnettable, struct net *net,
 		goto out_put;
 	new_pe->type = SMC_PNET_ETH;
 	memcpy(new_pe->pnet_name, pnet_name, SMC_MAX_PNETID_LEN);
-	strncpy(new_pe->eth_name, eth_name, IFNAMSIZ);
+	strscpy(new_pe->eth_name, eth_name);
 	rc = -EEXIST;
 	new_netdev = true;
 	mutex_lock(&pnettable->lock);
-- 
2.49.0

