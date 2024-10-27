Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9ADC79C2
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 27 Oct 2024 19:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730057755; cv=none; b=rwNkPtn90I7gBWKev1BaWHw7U/KYrGAHhywGhIrKTJ5Mub2v7CsqtzPo+dKtPEWoUh4zOADyiBWG1oj/1kTfBlbs1YTidqfAJ0tfRMuf24v6rQF5fIPzw/XrFrk3+BdGDDlNeyxmoZ47zRx2kCspGpnbkgDkXiicqClf1jXsHrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730057755; c=relaxed/simple;
	bh=EmSWh3xSmAM5RDES6zjzSSlBGnygje4dYfMLKmhvKv8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=koR8XU2j4kYSiMpzBKpaR3JACJ1oaXerg4mp19IQ0Oho4FrGCiROVSOQ07VbNPBH6rbYSog7s54qhbFjHNII+4H3vaxBTAdeTrKjoJT0HgOsbNEx7CS/XXKj9xtMDCI0CDCPotFm+3phydXOuzyVArZCl0ncUHy2I5D/SIHxBzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eYLFnY1g; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eYLFnY1g"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2e2b71fd16fso558456a91.3
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 27 Oct 2024 12:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730057753; x=1730662553; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HwqSxNHwODb6IvlEFxHFvLCBRbv93BzZ32A8QUXgGBQ=;
        b=eYLFnY1gehyCwYXoI63Xp6uiSAoGBJrTXMhMiDOv93Ls5cmNBWCwkeZj+luKD9Hyx5
         X5DzkMR9zXY1A9NrgLCdvvloACYvl7d/E3Gx+M/qdH+ezRiH8SNMwyNIzWUhj7vWXNUA
         UoZgRTqEcAcjqOMym4sOEN79pMfFMvZpI95mgl2Dh05t9oqnKSEM5HnF9ObkYNpgTLEs
         dlymPZ6nGkeDEJS9Z3EGp6bnfE8nFQMVGefGfWGMyvklvvJifWGuMYacL2BQVaFtnkBO
         5302XA0tNPTLYmxkf4E0st0ERdSGBqBnyA+40QGT9/JJ7EnzgJcSIsKWX2X4TxkO2+q3
         8NiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730057753; x=1730662553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HwqSxNHwODb6IvlEFxHFvLCBRbv93BzZ32A8QUXgGBQ=;
        b=qTep7xyu7OJ+VDnxrjUb/42g8jNU8osV1VsAxJaFtbNnixzQYFqOWYWAFMae4GhBg2
         CiTh0+A55meiY+CfNg9Os9DUbpq4TbQu2ka1rZtVhPjGkawSWG63R3IPzjwTQkvLoIiU
         9fLl9Z7hmeSi+YP8C1PeEyVfZuKswdjOiPT3AzOmJpjt+bdcXiJ4c+PIjThXOkzqqspm
         daNkyM9tfh/5Ets7kkDzbADcnAB7OkB2jcL2LtjWcjnhKS7iikW6SjSklIxsJqnlKTg/
         dt8P9MrJ3ziqs77oojG292atsJMCvC8F0NU6WXXd64uDlsm7S65/jeFic4g9FH60ELVo
         hD8g==
X-Gm-Message-State: AOJu0Ywx+flhBRYlYrompdeh5KrlQ6W3EFTm+7neP6kIpIEVTbZG4ERT
	BDySDbkN+cmr8kw7zyKA9V0U2FZNCCSblvyiF1vAB0rr5+r3w6oa
X-Google-Smtp-Source: AGHT+IFnpox8/7BeIDqsmu1QYNjIHDlNfclJIiHXqMfENK7pNaSGbRDvq+/+Hfvz/omYQRE/LqyaUQ==
X-Received: by 2002:a17:90b:1c8e:b0:2e2:c1e5:2df3 with SMTP id 98e67ed59e1d1-2e8f12e5b6cmr2789942a91.8.1730057753028;
        Sun, 27 Oct 2024 12:35:53 -0700 (PDT)
Received: from motti-test.. ([2409:40f4:300a:9618:92ca:3f55:718b:1cab])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e77e48ed34sm8371290a91.9.2024.10.27.12.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 12:35:52 -0700 (PDT)
From: MottiKumar Babu <mottikumarbabu@gmail.com>
To: cem@kernel.org,
	djwong@kernel.org,
	chandanbabu@kernel.org,
	dchinner@redhat.com,
	zhangjiachen.jaycee@bytedance.com,
	linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linux.dev,
	anupnewsmail@gmail.com,
	skhan@linuxfoundation.org
Subject: [PATCH] Fix out-of-bounds access in xfs_bmapi_allocate by validating whichfork
Date: Mon, 28 Oct 2024 01:05:27 +0530
Message-ID: <20241027193541.14212-1-mottikumarbabu@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This issue was reported by Coverity Scan.

Report:
CID 1633175 Out-of-bounds access - Access of memory not owned by this buffer may cause crashes or incorrect computations.
In xfs_bmapi_allocate: Out-of-bounds access to a buffer (CWE-119)

Signed-off-by: MottiKumar Babu <mottikumarbabu@gmail.com>
---
 fs/xfs/libxfs/xfs_bmap.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/xfs/libxfs/xfs_bmap.c b/fs/xfs/libxfs/xfs_bmap.c
index 36dd08d13293..6ff378d2d3d9 100644
--- a/fs/xfs/libxfs/xfs_bmap.c
+++ b/fs/xfs/libxfs/xfs_bmap.c
@@ -4169,6 +4169,10 @@ xfs_bmapi_allocate(
 		 * is not on the busy list.
 		 */
 		bma->datatype = XFS_ALLOC_NOBUSY;
+		// Ensure whichfork is valid (0 or 1) before further checks
+		if (whichfork < 0 || whichfork > 1) {
+			return -EINVAL; // Invalid fork
+		}
 		if (whichfork == XFS_DATA_FORK || whichfork == XFS_COW_FORK) {
 			bma->datatype |= XFS_ALLOC_USERDATA;
 			if (bma->offset == 0)
-- 
2.43.0

