Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA81343D96
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 18 Aug 2025 17:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755537770; cv=none; b=E31VdHY54XuS4GZc4SNpajIN0On2iK6z5xw02L6jI68xz25NHahqzslbzsYysnzWOUt9eJYxTg180c2HDF9L6IrtAEwOUv3DNfRUvbyWFH1ZddKzW7jUz5haqosw7EBxJfoUt1EPa1A2DQla0G90aSvoGpEVng7CiRfS+y3ySzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755537770; c=relaxed/simple;
	bh=uHAOJ797snaDrkcy+tcW05va71LSdkDm6EybUIj4G2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nTl+Nm7FAgDNq35HEdIdJH6bGSjX81fyaR3LB6HjFrYl3KijpM3tlDhZMRbf3ewobKcpR53ac9sQV7Qy9gKC/7DQr8RLcQdzVCPgXRY3s3/X3DqiCiFNm1fFf4SoaE7OB+VRo6sNoO6c+77laSWfedg2GYA2JIVubju5Drt+CfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OHZmSMrR; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OHZmSMrR"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b47174b3429so2817755a12.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 18 Aug 2025 10:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755537768; x=1756142568; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wUa68E1nteoaGSXTMTcC9sqWgdV9aURqk+eyEEJTUS4=;
        b=OHZmSMrR6BrSUf1pDEsZXS1PdZswsM1SFapefYVR3KI+9Q8S/UV1Lli712I3d+hBbx
         hgBEwbWodVIM99mp6WgGbisw8cCAYgSNfeoJcCt4zn+/gUMt8iHX2RDSuK78YNvFP8jM
         0e1OzZ65HhVTESNHdRtrQYv5gA1D8gxZGS4AeII698Mt1o8eytFGU3sNyDxBE0cFPoQq
         Zcc42g4HJ+Xb6BQLQHjr51RzM2HgZ9VjSx6krsVq3laYfKKOGs9TkFxyp2p2mDWKdrFE
         6pnMUdxBKVqaJ+LtCZ6Is+cKkFNspKujlConPiQcxOsldTzDHmoNMCLS7zKNPxJOt+y+
         IhxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755537768; x=1756142568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wUa68E1nteoaGSXTMTcC9sqWgdV9aURqk+eyEEJTUS4=;
        b=sx0krXpqXZ13jH0E+vMJd5/Llg3Se3W5OuKvqGx530bytiB5Ef8K3tmlMCs/tRVPJa
         WSdT7Z4+Az4FbFg6Kw/KT1xZZGRKG/oA81MaU5gRRCB88LokQyrXt6HPu65rVMAiBdoY
         78EE4NnPE1LxkK1Na94DQehcGwEKEyTJewocYTaoK2faaW1WttVmC0lNv0MU7SRoPooP
         eD8FzcM/3B/f+CGeW6TzoQAUS+VgDS1INl4JLUbDKVyByePjlFmwpzHxSgBBswT2QijW
         BeccH/69HVzfuqyvqDSxkAEFu4c7BvCS4HGEPY5WaXd7IeFoboGKWdVC7+MWzjAWEx2+
         /f5g==
X-Forwarded-Encrypted: i=1; AJvYcCVfCn6wE9bAyOz85NWD4Q/1gMYXesMnkPBJqB4sogsbC3vhrH3TJapzpbSK5cWiKHE2EDrSNCay2OCmev5spNwD2gWUdg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzLnHTO4u9nUmQX/IoDWT/+dr6O8PfTibtf+cohCYU9U/TpIWkA
	IL31hkubJKhRjmBbOhILGxhUqyxzczMU9ytESQAglvkVeGbbvW2XwqMW
X-Gm-Gg: ASbGncsV1FhoVwZ6K01NKHSV6oWJVLoIF8gAC7KwvNuXlTIo+8dF6mB/jKb9QqC+COI
	3aG8AgU2O9j3/Mx5sHAYKIGlOZFOJ1NI6jjLVQrLtw5mRANn6f+yjX2h5VhUe3LynJ2QVsEBbWh
	AtmwV6YpLgLN2BmgdYtEAFbq88Vy+wOQHr/6CLCF8nuInDQ+lsLgFug3CevI1BEdlMcbcBthozR
	fgaG4Uz2f7QimnCsH4A7UuLg+Xqmc2Pzo56YqntTL4sAsoprU5t5j3hNJZSsBIKmmYYxclkPvix
	aU++gqQUYBjY0QFnng1NsBbY7LsA/OkBL/tFe+hTk/SWxjF7PkOjoP5RUArECZQjPlAk984nIwR
	KCTMRvCZaPvxDbLb8pD2d/lwP
X-Google-Smtp-Source: AGHT+IFpIFoFxxk/K0di9Ho4RhhPZWQ934ntdvj1PbqjitsJusNWV5Esu4Fkoi7xUxfhnpPn0P+4AA==
X-Received: by 2002:a17:902:e550:b0:242:fb7d:1d57 with SMTP id d9443c01a7336-24478f9e7famr120733685ad.42.1755537768429;
        Mon, 18 Aug 2025 10:22:48 -0700 (PDT)
Received: from localhost.localdomain ([2406:5900:2:f21::2a1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d5769a9sm85242985ad.151.2025.08.18.10.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 10:22:48 -0700 (PDT)
From: Ryan Chung <seokwoo.chung130@gmail.com>
To: viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Ryan Chung <seokwoo.chung130@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] fs/namespace.c: fix mountpath handling in do_lock_mount()
Date: Tue, 19 Aug 2025 02:22:35 +0900
Message-ID: <20250818172235.178899-1-seokwoo.chung130@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updates documentation for do_lock_mount() in fs/namespace.c
to clarify its parameters and return description to fix
warning reported by syzbot.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202506301911.uysRaP8b-lkp@intel.com/
Signed-off-by: Ryan Chung <seokwoo.chung130@gmail.com>
---
 fs/namespace.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/namespace.c b/fs/namespace.c
index ddfd4457d338..577fdff9f1a8 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -2741,6 +2741,7 @@ static int attach_recursive_mnt(struct mount *source_mnt,
 /**
  * do_lock_mount - lock mount and mountpoint
  * @path:    target path
+ * @pinned: on success, holds a pin guarding the mountpoint
  * @beneath: whether the intention is to mount beneath @path
  *
  * Follow the mount stack on @path until the top mount @mnt is found. If
@@ -2769,8 +2770,7 @@ static int attach_recursive_mnt(struct mount *source_mnt,
  * to @mnt->mnt_mp->m_dentry. But if @mnt has been unmounted it will
  * point to @mnt->mnt_root and @mnt->mnt_mp will be NULL.
  *
- * Return: Either the target mountpoint on the top mount or the top
- *         mount's mountpoint.
+ * Return: On success, 0 is returned. On failure, err is returned.
  */
 static int do_lock_mount(struct path *path, struct pinned_mountpoint *pinned, bool beneath)
 {
-- 
2.43.0

