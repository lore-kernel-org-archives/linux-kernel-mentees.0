Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746111E5209
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Apr 2025 05:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745301429; cv=none; b=ly873Yug1VgGup9T4NPZFuBsNNkItK4HQdiQBsU7I1Zg4LrEBjfS93p/0J+7XdqXsFVbGcJnAYyvmUgoDexR3uzswvyAV5spbc8COGwE3QB78s2GNfFAjXN+Kc8xzJVMaqr2Zhd3GrLnzUfGmSOgP617frMXyZSvXR8v8JLdOSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745301429; c=relaxed/simple;
	bh=AdLmc+wiCdwXinG9IPvx9ZOAcJ3bRqNTo08Kbb78oAc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r49R3rxVwxAH+Ii9x68kcVBCSRkEJ1VqYZGOCGZjTAfi5QwBrkzXQCKXJGIBOvWOvyKCE5RYLQssHKBnHC2tLG0o1uyJVk+B/6CLBBvVv5wlYggMKvB1zTnrJFRU/e7Brg5gPhN6+lOEgULMFlJP9DSwi3E0oF055lGlMouN9fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H2rJjTQo; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H2rJjTQo"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-30572effb26so4269155a91.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 21 Apr 2025 22:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745301427; x=1745906227; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=efd+S9Jz6y3DhI5mJO14MniAuJQjBl1kfKZRBddD7pA=;
        b=H2rJjTQoWhKSUBpCLT1DvTPH2EVuaF6gDlhuGK5UyTZod6ShcD9pOwkXW01dqOiord
         e1CV1Hy9UcSzrdcryIuta6wgYnV9gRX4Sco1Ey4eVWN7geq+2HCrT5+OHnLMZqyi7AAG
         TC1TejBEGeOWR/wTQOGwxxoQIJENbiFgVuq3+Ypds17aSSYo410ziCngdEDlkrs3CHBi
         U20u4V4qRwhQe+GTB6rQ/Nn+W3ZR1+1zlD1yzGIqrBMt35gzST/c/Y2CpxYdHLio6M4G
         QfUYAwmJq7lyoVDNs9mfzSe6gLy70PO9al9Q173o2S7VS6f85erIetKcxQM/SzlWf+W0
         SFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745301427; x=1745906227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=efd+S9Jz6y3DhI5mJO14MniAuJQjBl1kfKZRBddD7pA=;
        b=okyCTx4qq1PHzuXIgPjOhEjrd8e04Hhluv0NBERTfy2BfR6+acILJqvPPS/p8qzczp
         y7C8tMzk4f/Ma9D9v3Vc2/sEaF2XWpggLvfUPtBCsyix85YVl/Wpx/Cw58DmmJ78OfZy
         z2klvlCre3z2YR01XHEwPxMdRcZhQNOdThInJ36ZMzZcjpItYEumd4BkCiuhHTVCAjD0
         x1got5qZV5elHkKut0fIEWy9zOoigRagVhmP2zXb6c9m4kO0sBF7F9T/Z1kLl+usb1uq
         g8N9YUSIX04MJoh9ftDLCyzE1550zyDOqrMkHzNZUiuggVMXC2Pmw+Y3KqeIZa34j8H9
         HHgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCyCCzUEh5oQwTrHxkaDafaZeA8Cz+BcN5pLyRee/HayuB7uQhl4X293lA1gCJ9S5bfIDiRcNmIe+CyqdyBYFokhnZhg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxXI1M6dCrUFvk6LbRWsTzXX7+L3MaC6kRVi0NT/Lsp/ONnO/Mk
	cwidEhkvrr4YQSRAWGLbApfuhaEv4k4/95qEyHtA2q4ZdKOOuSsW
X-Gm-Gg: ASbGnctcvOe0E2UyzO5A0D5TdoW+kbAWxTlc1yUmjgAkwYBV7lGVI8cNSx9L3QDmR/w
	kT1hL0r7dZYWHJQnWDNseWUhVTKjlrWnv07WEm3FDDf4oDS+kQuP5RJZBv32OAulEc2+X18dHwD
	ylCzQWnwTuAiN/BY5Xn264oxLmukcDXtGctnOZU11lpfU8ndMHoctzMxOg9A8HIjftpuvh/R14H
	qkizFyCDQcTjTVhX1Wox3//29pJDTRx2mTuUvUhhhklX5jOoMY5JWzFk7W3kioCyzNQ6oEKEo+N
	ffXeOrnv0AcQIsY6h8PUCYpePptYI+BbNZfsJpX9reOtcC/4x6seLv/X8tQ7GeLR9NjySvk=
X-Google-Smtp-Source: AGHT+IH0F3vBa92QDVMDa4RhrEeLNM/G1NMQXluqfI0wOlvs1wBOm7PMh3/msz+ClY/E04uMK8ENcA==
X-Received: by 2002:a17:90a:fc46:b0:2fe:b907:3b05 with SMTP id 98e67ed59e1d1-3087bbb6abcmr20030866a91.29.1745301427548;
        Mon, 21 Apr 2025 22:57:07 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:12a8:650b:2dd2:b977])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087df26445sm7688959a91.29.2025.04.21.22.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 22:57:06 -0700 (PDT)
From: I Hsin Cheng <richard120310@gmail.com>
To: tytso@mit.edu
Cc: adilger.kernel@dilger.ca,
	corbet@lwn.net,
	linux-ext4@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [PATCH] docs: ext4: Ammend white space
Date: Tue, 22 Apr 2025 13:57:02 +0800
Message-ID: <20250422055702.451729-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There should be a white space between the words "block" and "size",
instead of writing them together as "blocksize". Ammend a white space
between them.

Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
 Documentation/filesystems/ext4/blockgroup.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/ext4/blockgroup.rst b/Documentation/filesystems/ext4/blockgroup.rst
index ed5a5cac6d40..32a66a956f31 100644
--- a/Documentation/filesystems/ext4/blockgroup.rst
+++ b/Documentation/filesystems/ext4/blockgroup.rst
@@ -108,7 +108,7 @@ block groups which can be described by a single block group descriptor
 block. Since the size of the block group descriptor structure is 64
 bytes, a meta-block group contains 16 block groups for filesystems with
 a 1KB block size, and 64 block groups for filesystems with a 4KB
-blocksize. Filesystems can either be created using this new block group
+block size. Filesystems can either be created using this new block group
 descriptor layout, or existing filesystems can be resized on-line, and
 the field s_first_meta_bg in the superblock will indicate the first
 block group using this new layout.
-- 
2.43.0

