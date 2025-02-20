Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DDD20C00D
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 20 Feb 2025 17:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740071951; cv=none; b=SVnad77z7IaYP51a8NvafUTAbpQmh0/vp4oGYCDmQtW2lc0/fLSDetEPsK55hU8gakFiyJ5w6qP/YoONndHOFQy4OpSblA85X5JVhHD5V1nKkFnbtHBIT977v32CUtgCIdOQq5a+r9C1/H6PPq9AxPCQk769Udwfwswd8lRH7fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740071951; c=relaxed/simple;
	bh=lbxp0U7nS6050w/dyFPx4V8itxpoYCb27lxROY6sU+E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OG1cOq7aLnU2Lc2ekFlfFk2CaJc2ngzU5zN5rdZdIwDpQmfIQmPqy3zxc6SyGT8EPkAedO0nYyfjTDPq0U+cNLJKoWXCwhMwkcuVl9rhFz285xilVRXR8oLvHJXIDQ3fi4JSaUygpgfNbKDTCYAaQRFwGeNvN716eM8RbIQIoRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P7ZY7MPQ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P7ZY7MPQ"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-220c665ef4cso19937215ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 20 Feb 2025 09:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740071949; x=1740676749; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nomDZP7UgjJM6LiqPmJ9pxSMIsyz19CUu75QblVwQ2E=;
        b=P7ZY7MPQX2k7g68PGjsZc+Sc+CnZELFNbyFx/eDUdM32uoExjgRU0HMLBsnUj4CGKA
         z4p/+J+8dtrR0Kus8L6X4HuFAasVTXU/1toI59dYrMA3iKoL+46MhTa89r6LW9yrPWAK
         G+LjBhTGAOR6MnNLYBPbP5jCMgRgd3omtPV9hVwjvYmgX+dtEfGHnIhdKD5Q64Xitt+Y
         pwOho5KU+QXr5La25/BgGX8TyC7YzQZpobKa+qg2w5KbKReYw86qvx7SF5XmjwSD394b
         nvqtuN0N6LZ0NSAE2p+zUfsaFIkvYg9HQNjL6JwujjasJmKZ4CBvlSUyrPrRgjwRUqXj
         09Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740071949; x=1740676749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nomDZP7UgjJM6LiqPmJ9pxSMIsyz19CUu75QblVwQ2E=;
        b=VofWjX+ID8IlR4jRABm0t0yANuFX6Nzlld2h1twKUWw+rgv31qhrADfwOyVPJYXqAC
         f1mRmm6PmF21WDZzPqjQ2vjfyMFYT8XWFE2n0qtUpzbNoHUW9TiLMjGOi98fM+MWe27Y
         /a0a/kWXDp+fo9UZDBU3iP9UKjxz9VlbDgr2u2nm/5XuzrPib/QMEawTGyS2QlN5mIqO
         xhsjSmyVNExIMKnxpZgiuJGdyUJywqkuFBA7N0LRR6jySmivQmdkpqWlr4HWxcmPhrj1
         k3l3EAXpzkuBIsRg4Lwbn33UNpKUVrbStNSsYWQIgoOYBykEyuKa+DOfphBa+4rJ9+8j
         6XLA==
X-Forwarded-Encrypted: i=1; AJvYcCXOSlIxKSpqBGLhSusVA4h/qTbvavp52wuHNHmoBYVCIGmAj9rEKaVB1NWGIICXkaGDsyKMV//i8M1m0JgSILXkj2xNqQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyiEubpw3pRHQ0yVkU+B403NV4CMDAqEYOpMqew22UJSN7C/mV+
	lEAky5oxWkn1Z9VLVknZuVprUN3XrPLKHU7GujmY7ISqBnf9CfSH
X-Gm-Gg: ASbGncvLTJq/f7i2SI+mV3RNYul/Mr4XgKrWVoHOF4iIk46Eo7/5688GEPrqNQcL6+G
	Re3m8u3h5OvU9/9laF0hGFEsgNo4UaEx/vVnbnmAk2eWzYGF2xxLvG2Wuu2TV7Km2pfAAm+G+n4
	dbS0V+N9I35lNZIe9GC3gVlynz0bqQpAgm9G1HFO7SR1SVcT6v1gouHqQYn0U/QnBODAtqTLh+z
	RtlkXyZs1PfULDIpXRPfaKfhAdRo43yMpDPOhF3RAm4sVu7+P/KS6oSXUuzSxQHAixqF7TRJAcY
	0WcTBjmKSUyp1E2yPdicGIJu
X-Google-Smtp-Source: AGHT+IGeGn7sAE0oh/LEmZ0Q9vohZZx4LORYi7li2Q40VP3JZ4WbLcXqVZcaR3HNoxG0ukBcPdb44w==
X-Received: by 2002:a05:6a00:2e16:b0:730:927c:d451 with SMTP id d2e1a72fcca58-73417382ba1mr4907029b3a.20.1740071949258;
        Thu, 20 Feb 2025 09:19:09 -0800 (PST)
Received: from archlinux.nitk.ac.in ([2400:4f20:11:c00::101:920a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7324273e324sm14101963b3a.88.2025.02.20.09.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 09:19:08 -0800 (PST)
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
To: corbet@lwn.net,
	linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: [PATCH] docs: debugfs: fix spelling of "failure"
Date: Thu, 20 Feb 2025 22:49:03 +0530
Message-ID: <20250220171903.11321-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a typo in debugfs documentation where "failure" was misspelled 
as "failuer".

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
---
 Documentation/filesystems/debugfs.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/debugfs.rst b/Documentation/filesystems/debugfs.rst
index f7f977ffbf8d..610f718ef8b5 100644
--- a/Documentation/filesystems/debugfs.rst
+++ b/Documentation/filesystems/debugfs.rst
@@ -220,7 +220,7 @@ There are a couple of other directory-oriented helper functions::
 
 A call to debugfs_change_name() will give a new name to an existing debugfs
 file, always in the same directory.  The new_name must not exist prior
-to the call; the return value is 0 on success and -E... on failuer.
+to the call; the return value is 0 on success and -E... on failure.
 Symbolic links can be created with debugfs_create_symlink().
 
 There is one important thing that all debugfs users must take into account:
-- 
2.48.1

