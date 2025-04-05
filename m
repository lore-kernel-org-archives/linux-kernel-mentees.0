Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE41634
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  5 Apr 2025 09:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743844760; cv=none; b=VCngH1gscEg1rjhEmIBqkabeVSY7C+rhvRz4reKQvhxbIG5bgNOinwwhdYP8tGzVKdFW9E0qEpcF1LjAD9ddBLNXatRpiaNbWoHS0dL3yqY1O77sUsha5449yRg1mjBbwTXUnwmnZPphwKulpFV37dKHUD22wWQ9ou9Rdjtscfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743844760; c=relaxed/simple;
	bh=H9WDufCkKvv1yyD00jKAJKAOHScBQ80qVwCNVNT5D84=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V4yNRMfSwoKTTFqmv7ngvU0WnYz8VMBu9lQbsIqbzY7iaOZO80FepAM/UPkY8WUR0MZ7XmyqsLlYPu94i5unhFeB66k95XVPoShFE6WykRBysYuARBYCCZmE+YnWIXGwvfEjeWz+kSoR5lbTQ3LH5JVLEISY9AQLeUiBtlHjjJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X1GfNA8V; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X1GfNA8V"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-af6b02d9e5eso1927369a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 05 Apr 2025 02:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743844758; x=1744449558; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mzjWMcByQzCFfTzUirTtuGeFU5cuYUdBA9J+kXb3PX0=;
        b=X1GfNA8VVwIHd6vIPRK8MC6cF81ubuiqWtRcBjZEp8KuIIuZaXXW31/VXpIdh4e2hS
         vBefskJ3vo/zRWzHcbRp21ipMCquwzzabvQ8XjaBv90nabrvXFpe/jHD48fELK5D8ONh
         tWJ/4k9SS0XQ6/TY4uOVWmx1YmXBReTrOIF5QTQujr6RZ1ohwZXIhuWJ5chNDaEZLlvl
         FOeK+tYHTGrE3PuviR+M9JLyHbmvQ1BsE5YVCPr5vNGKPazbJWjeIJlgceoQnQOGr+Sv
         gyWSrZ7ZYPY/q0IpN5wJkbQDwAyZhkbNbkTlmbXjvgh1caDsm7mJSvLCwicLQaYBNT3w
         2PhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743844758; x=1744449558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mzjWMcByQzCFfTzUirTtuGeFU5cuYUdBA9J+kXb3PX0=;
        b=M8OwavC1KeIqcqFkgD+wjWYZAcy1yjslleamm2J3lt8dVkpZuCT5g4J2DVt/1T14Iy
         4T+ZUdZTvHZ5mVWWpC26p7tJ5UJjLwIx2AEHXQ8Wpu19hONgfMyPp/sz9jMjnHmh6+4v
         xIaKaK8UqSCq7IJrwGniOmSJPTARX4z1PbLe6BlRbYOYPXB4NJ1Qqpk3lZubRW6zfic1
         bPWuYiN77wzh9Z5ti6G3wlJ7ipVwmAv593SpscGw9QAi6EICXoweh29XYlWEvOdCXFdg
         0lKt2qkY13yikmlTyUQ1xyxsxt7rQyqbwx6aHnvIyDqPR4g203Qs64YwZHcmLWQN8EqO
         0iBw==
X-Forwarded-Encrypted: i=1; AJvYcCVOK9IltF00Au/0/OJ5l4L1q8FJVK+N8kmv2BgB1qmSmluLoEdjCwweoTcAhtzcQXcvara8K+3HQf/cGjaWmE5/REs/1w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwEIK8QBA1hEndCb1NoHPPheUBaqpZ9te/cBeR1cjBa0c78q4IX
	bl/KIV8Tsb3uET+B6ESzc+9rVm79Pl4rrXt5L1aMb21rX6Qh/hGg
X-Gm-Gg: ASbGnctIp5wbjwy+a62xasq/mw6YrpbvrJLP0HfufU6FuwPXXefU32gkV9Y+JtakmCd
	Dw08arSY7e+Esu/LcliV4vsT1xSigz0bcDm4FEB+I0XxdgiBa/IkMda+gtkT1nSwo3o213C3f4B
	p5zb2D+8ajYROeAULLRH28/Ru90F1E21VP17rypAGDdrTYyYlKKe6OTMHPD1rK0WkByQQkuTGh8
	1MXVXFEemHTzJv7nHPDZ03BjGazlNeRfQg13E5T4jCFGnExDoeIKf+VoHUCU5ZMprAv844nyzJI
	OYhI8XHFIj0n80QbIYdWdCycAIxGOtXBj0gIlb5ClE4EkuAV9RPFk9/9/kFzaYLylbr8YbxkxCw
	=
X-Google-Smtp-Source: AGHT+IH17D2a2ZK/K/Wp3XUSIp0F/QFxG9KvTsV0bCesZDJ28V7J0x++vHHbGclvEnu/zom73oy1Qw==
X-Received: by 2002:a17:903:1b6d:b0:21f:68ae:56e3 with SMTP id d9443c01a7336-22a8a1b8c79mr79312175ad.39.1743844758295;
        Sat, 05 Apr 2025 02:19:18 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:309d:74e8:7ab1:1579])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866e1ccsm45815275ad.174.2025.04.05.02.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 02:19:17 -0700 (PDT)
From: I Hsin Cheng <richard120310@gmail.com>
To: akpm@linux-foundation.org
Cc: shuah@kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [PATCH] selftests/mm: Add missing gitignore file
Date: Sat,  5 Apr 2025 17:19:13 +0800
Message-ID: <20250405091913.520889-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add "guard-pages" binary file into .gitignore.

Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
 tools/testing/selftests/mm/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/mm/.gitignore b/tools/testing/selftests/mm/.gitignore
index c5241b193db8..c9fd69ece95c 100644
--- a/tools/testing/selftests/mm/.gitignore
+++ b/tools/testing/selftests/mm/.gitignore
@@ -58,3 +58,4 @@ hugetlb_dio
 pkey_sighandler_tests_32
 pkey_sighandler_tests_64
 guard-regions
+guard-pages
-- 
2.43.0

