Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3688F1A08D7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 29 Nov 2024 18:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732906615; cv=none; b=kUAcS+QJX1GDfa2GoJG/TVTiXyr63tFlLy01L2SCtAeVipC5zS+oc3i3atSL8z5pFJlHcoQKG/Juif7QBjajtjxlxxdC/UL1Lkf5fU+ZFLwbgY4cOr+/iJw4vpY+ZaPTzwr61j52IMqQV3NRFqFhpPi5nF68Perh9FZVfX6mK8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732906615; c=relaxed/simple;
	bh=l7WvbTtMYsH+NsX4psnONR+tA3CJuYPZU/C/SZ2q9e0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=toGybSmktAwW9o0fpgERm1RpL4Zkv6SrhI+7nXT1h72a9z/4AhDp3VAuuKUjySaB29JiZaLQwR173+NY3xvWL32F9cmOM+GPohlhXJUDvtInLVpuy8+yJuFcKedQZVODNzigrG+Urn8WED/pp72RyIZ6r2fARul37v6Xsei+6fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A2M07S15; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A2M07S15"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF0E640179
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 29 Nov 2024 18:56:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H4Rok7-RxJ89 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Nov 2024 18:56:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=leocstone@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A87094015E
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A87094015E
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=A2M07S15
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	by smtp2.osuosl.org (Postfix) with ESMTPS id A87094015E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 29 Nov 2024 18:56:52 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2ea39638194so1779320a91.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 29 Nov 2024 10:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732906612; x=1733511412; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qzPuQk3ZQ6E9JagPssZlS/uY8SuiQz+WhShMT3H3dhg=;
        b=A2M07S15u6XPV3XCL0zMylh159XkZcP3vwvVGHIzbi9kN2ywUxCqpnH/VjVzytG5Pr
         JBrrSsf6nqpbWwArTDnra5lmnm59PzByMhCtzoXqBrhxtwzE56uOypUF8jTFzujTlVme
         bV/q08feofGXK5roK42EmoOk7YeRlDfxT6EAqm8krtg6qy+DGpHxvx+J7AkLAIGK5O+0
         vO0VWcjtwobUrwoDKpTs9sDEGJsQmbOUt5AkaIOgUkngQob+AEAXqDRQElrmR8LOZEyL
         3pvLvjLC1RpD0Rfldf2rOpp+xZetbCCOLaUt0uqddBNtBSzyvW2Pd80BVK9pFdmJPoZ2
         IUvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732906612; x=1733511412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qzPuQk3ZQ6E9JagPssZlS/uY8SuiQz+WhShMT3H3dhg=;
        b=NEahdKS5kRstY2D7fbyfgDjkaZMTXmLkLFBvCIONv9gZcsNV5qDkNa9SWuivsEOROC
         pSCqz2LeNtOXSQf+FrprfuacAJZeUl0hzTQITSM+8ZqytfEjq5NdMLc1tZfkSNyoVosc
         HR6jQu4bg31sYKMxB4g/CeHBShtoZmGqHdOZvR08sCYfgQHyMdFSuMIhOwviucMNGsux
         5pbuBDiCyUzUcUyC2BUUAF6wis0tJWlO0XfJirQRqiDBgm8baRMmUOAlMhzFcTZO3WAX
         gWwQZvjj01Kl37AeZQt2qElFce6y+imilw7hBxeH7gYVuHBD05nsh8w+YqvE4XQtWF+S
         oVag==
X-Forwarded-Encrypted: i=1; AJvYcCVxZ3HqyezuawZc3/FCTsJ3cmO3VCZv85fVGmfF4ZexJJvJDk6MzqmvQTY4VoNMVY8NeRwlpHSugxM4aDjPQelS5cWrjg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzKXXcxOrt2CN6c1rRMtlTIK1BkQRGDd5eaPBhELaVC3NPl3KRV
	XcXPymXEuCwifOZ+Y8FX6KJCBHcgGHpGi77h1793Khv7IvPbBi23
X-Gm-Gg: ASbGnctl72pss6NSDCbHqh5hCQbJ3M7eU1LwvU7zlQ7pvkHb35tyFOz9LHpjLYmApb6
	rK51nK1yu/GQaIcrJYivRXHh6oDTYdK4OdIuiy1LwMgT83JiIV0o7BEqG/VT5/7Iv2mHxiR8Qoc
	xSbMrVseKIBxFZ75xxwawRd4ZapDALW6iUIa6hAuBOLaLuAmwGpUhg+ul+cJdPRhnHfHfmQp3gz
	OzQpuT7OgTsGW2IP1HbdPT1O6oTHttScziOI2T9LPGGTDgMdhYkfZUmSAHCg5wA0Q==
X-Google-Smtp-Source: AGHT+IEQ5B46R7s78o1UFrbgGbgPRQC2H4C26jFLulnenm8fn3q9cgoa3G+RaMIFtl7McLRHfZGKcA==
X-Received: by 2002:a17:90b:3845:b0:2ea:97b6:c461 with SMTP id 98e67ed59e1d1-2ee08eb30d4mr17333769a91.16.1732906611724;
        Fri, 29 Nov 2024 10:56:51 -0800 (PST)
Received: from tc.hsd1.or.comcast.net ([2601:1c2:c104:170:21cb:a5d2:92cc:4587])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725417612f3sm3960330b3a.22.2024.11.29.10.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 10:56:51 -0800 (PST)
From: Leo Stone <leocstone@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: Leo Stone <leocstone@gmail.com>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	anupnewsmail@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	syzbot+b01a36acd7007e273a83@syzkaller.appspotmail.com
Subject: [PATCH v2] f2fs: Add check for deleted inode
Date: Fri, 29 Nov 2024 10:56:41 -0800
Message-ID: <20241129185642.6483-1-leocstone@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The syzbot reproducer mounts a f2fs image, then tries to unlink an
existing file. However, the unlinked file already has a link count of 0
when it is read for the first time in do_read_inode().

Add a check to sanity_check_inode() for i_nlink == 0.

Reported-by: syzbot+b01a36acd7007e273a83@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b01a36acd7007e273a83
Fixes: 5d64600d4f33 ("f2fs: avoid bug_on on corrupted inode")
Signed-off-by: Leo Stone <leocstone@gmail.com>
---
v2: Correct "Fixes" line
v1: https://lore.kernel.org/all/20241124010459.23283-1-leocstone@gmail.com/T/
---
 fs/f2fs/inode.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 1ed86df343a5..65f1dc32f173 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -372,6 +372,12 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 		return false;
 	}
 
+	if (inode->i_nlink == 0) {
+		f2fs_warn(sbi, "%s: inode (ino=%lx) has a link count of 0",
+			  __func__, inode->i_ino);
+		return false;
+	}
+
 	return true;
 }
 
-- 
2.43.0

