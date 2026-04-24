Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2951F2BEC5E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Apr 2026 15:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777045414; cv=none; b=u4uTPhty0fqDsv7OUhSTi3NbiYy/lBD1JRWFQUsNmRd22fjctk53G4DiMXwsuVreU3SaHPCMEmoKipDU6Vf+WrVr3hUuD62nsfB6wZO0pz81WHTA+93KknWJYyZ2wQF6AuzcJJyspNgGcYc2hP+x2fJTTvpoDRz28nDnYbxAXDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777045414; c=relaxed/simple;
	bh=YW0/RKuW7VWXIMDjTSpW6NyYty4VDl5lMgaa0I42uEo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EvGQnMHH0GjzfZurida0uC8xNujIRcGHLUrcwUyznIXFqejAf1P1QPelZRKMSRsdjUmcM9mL2sdwBA/4w2ij+KIBHH2ZDzQhZEwv/FTWZ5rTbeLKgeUrZp4oWYL4Dgfbe6LzWpmT/WFFORHxKUYUfR0f/fnrA9Xzl1AHeiaBI7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I+2dyREd; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I+2dyREd"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9BEA84CC6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Apr 2026 15:43:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j99DV5c1f1Vn for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2026 15:43:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=abdououhbi1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F11F284CC2
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F11F284CC2
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I+2dyREd
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	by smtp1.osuosl.org (Postfix) with ESMTPS id F11F284CC2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Apr 2026 15:43:31 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4891cd41959so61361915e9.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Apr 2026 08:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777045410; x=1777650210; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8wUdieFdZi5XDyPTiCxzwYVa2/zVVbZ+K+hznFHM+5c=;
        b=I+2dyREdzYvwdkW0Baq1pvBTO7moEu1amw5vC7BT180AgsgPcGVG1sQ3pTNvHp0Jr3
         czfZIzktNFDX5UyPxbe6WQDNbQcB3N1+/6cgBmphQp5cjTU82N+aIz5U5vSP5txocUxN
         nCts+WpheYKE6JKRdgv45otolEKL6bDCrdW43brDGEMlJf0zbmknO4otFGHzDb5xsyxY
         wqfApUzqj07FDlW9Z5VXPEh1qP7TGh/a3EM9+JWdq1Jre4w71PEbcb57nl9nGsmVupR1
         wdqEL0KFLBKR2D48yfA8wv97HDtD6OAg4a0VkAf1OQ+o01Op5p0E8IDU6Os/uFDKfa1L
         h9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777045410; x=1777650210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wUdieFdZi5XDyPTiCxzwYVa2/zVVbZ+K+hznFHM+5c=;
        b=VEdoKhsl6kQS5jJAsBgA32PMTMTKZ1KksQm5sk6n4eJ0WCr/p+2NF++QhMSU0Pref0
         wDf/uqhbvWAys5YwHkV4p14eKgNjQG2XGim3duk9/7e8loDAh+zbPoDAQd6bpwr7bdMi
         RPr+OxcBgtGjlEMOSBmgY8U3IpN1ZfXnzqBaDddL4UiowEYYxdqWWz/0ChQ42cThF0Lv
         8KLmQK2TdkiepK1qoVzWIN7528VvkoF47QtAJm7BPw9A3YUJuksjE92gywTpIueaYRas
         7kNF2veFB6RWa08PnY+qiVX1WW9CxWUs/DoJqSACUEPRMMXu7lc5tWhaxxfrilOXUE+r
         ROvQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Jr8nTbnKxZqaQKx6wTPoE6qlKDQjtC/0uoEtxkjTz0sE/CK4/woujbFx6r6v4/yp/F6mnHYpA3+uhkGaAgMH0neLmGA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yy4az/V7BttvY4he7TJYNMf/YnAq/ff+cz2YpW3rktXpqiNnsaA
	9J2yqr8+rcY4UkGLm7aXq9HcPW5CQkre7PFbJa1SQBzF3X0eT7c5eKIo
X-Gm-Gg: AeBDieuUKYT0MHeMELZAXL6Q8FOHpVG8VGviYcU621mJafKprKYD9i7Cb0f38mAKHwO
	YcsURgnKLTg6VYFOfqX9NRG4JLtuGu2zHBPTPV/sMnT18Zhud5AL4qI8dU40IR2PDP3oW9VB8en
	ZSDvggmEZDbWbCXu1j+hac/ANrp5nMvm3wG2/3+92azS84jnE/J6bC7oPc9HvEb3WgAiWt2ll1c
	Uw6sDRPJMR3KPGh3nYrQMW4m0zkZnACkku/wuwpd8cUz4vFNJCz+FeoINNAKWyrvw1q+0tkHXs6
	eGFDEq2XesXNMPvEwNkjVZUzi/iRARG7UFVTVPDYDpJjNc0u7cdVLWkY7cbpFHqXSmphfzLfAMS
	28YYaDKWy0ePPAg9EuAEBQlI+Zp/IoRLXSofMLGaEtGSJCfSKgCaD0L+51CMMPUiRqictsxNsZ3
	SvZQ2Nf+zMGIvgFFLjisijj+wRlQ==
X-Received: by 2002:a05:600c:4e4f:b0:488:d6eb:e63c with SMTP id 5b1f17b1804b1-488fb778703mr461070845e9.15.1777045409744;
        Fri, 24 Apr 2026 08:43:29 -0700 (PDT)
Received: from kali ([41.142.67.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a5c4b9e8dsm55702905e9.7.2026.04.24.08.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 08:43:29 -0700 (PDT)
From: Abdellah Ouhbi <abdououhbi1@gmail.com>
To: tytso@mit.edu
Cc: linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Abdellah Ouhbi <abdououhbi1@gmail.com>
Subject: [PATCH] ext4: Use %pe to print PTR_ERR() in extents.c
Date: Fri, 24 Apr 2026 16:43:07 +0100
Message-ID: <20260424154307.169881-1-abdououhbi1@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix coccicheck warning
./extents.c:3272:12-19: WARNING: Consider using %pe to print PTR_ERR()

Replace %ld with %pe and PTR_ERR(path) with path pointer.
The %pe specifier automatically converts error pointers to
human-readable error names instead of raw error codes.

Signed-off-by: Abdellah Ouhbi <abdououhbi1@gmail.com>
---
 fs/ext4/extents.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ext4/extents.c b/fs/ext4/extents.c
index 125f628e738a..91c97af64b31 100644
--- a/fs/ext4/extents.c
+++ b/fs/ext4/extents.c
@@ -3268,8 +3268,8 @@ static struct ext4_ext_path *ext4_split_extent_at(handle_t *handle,
 	 */
 	path = ext4_find_extent(inode, ee_block, NULL, flags | EXT4_EX_NOFAIL);
 	if (IS_ERR(path)) {
-		EXT4_ERROR_INODE(inode, "Failed split extent on %u, err %ld",
-				 split, PTR_ERR(path));
+		EXT4_ERROR_INODE(inode, "Failed split extent on %u, err %pe",
+				 split, path);
 		goto out_path;
 	}
 
-- 
2.51.0

