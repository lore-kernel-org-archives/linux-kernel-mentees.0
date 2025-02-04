Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4AC204680
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  4 Feb 2025 19:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738697448; cv=none; b=LsWULrU10D7eV1U/w4DBmFt6w/ZYi24DlqcYS3fJyWzqBgl5dNmPcxs36IwLLHx911u8R3A9o/U5/sHvKWTMGrc26iMuwKSGcG6jJRNGcuwDRfFQ4zSu80xzbJ/7mO3UrUTFOsMQP1mdTF9chjzJntFTcG5q92KhbfR52ycQ7VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738697448; c=relaxed/simple;
	bh=QRi/T5xfMEOZk3oIGOMAugQt4TWXy+5skoF80xv/d+g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r1pOHSfjREJe+W65TKXCh6aOgpNH3sCTU4oQgkpH+VzTp8swti4YOzfiRYelZuUgEI11X9WuvcdijVFn5NQ36zgC4GYtJUHD/vKmKq//m+NwK2iTaJx7qvTqfVpYtqXzXTIESUYJhtm+C8IKeMgDCJ8JklWt2gTBhgkrXX7VukY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FQgoII6a; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FQgoII6a"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2165cb60719so109758635ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 04 Feb 2025 11:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738697446; x=1739302246; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9p7f/7S8Mq/vOCUyI7c0pQCu7LoiHChjA9JxK06JEGU=;
        b=FQgoII6amejCWATNeLzGtkGoa3G3wihEMwFAip+hdlgleItw6QZSC33lLsfCGLX+s2
         a1C/m71HcgTfoicoP7j2OtWDlOBfwO9PISxIj9+GwTwoOZgp/L8N8Wa1d8WPVLJ00Q5U
         jfSAgjnInqzo0avvb1AMbgqfj3G69FtNTznvi+K4c0ja9ERnIjqiNO36Ne1WL++4CRqn
         CrQiTtCYxu1eF3wYrXB9R/QYytdHlPly+vjjhZKy7X8193w4FuHWV0EQW0apq5BjmJ+c
         VbHT6ZeGzAWKlx6ivafbcjR2UXVHvl6clo6csKNbulasFY4Jey3iI4QBvBwNhNpxP/Pj
         dGhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738697446; x=1739302246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9p7f/7S8Mq/vOCUyI7c0pQCu7LoiHChjA9JxK06JEGU=;
        b=LpgoxA07h7vB5ufti0fQMgZY5CFSdeE2of+k4hbeszWYp1L0a3vm/iRojdxW4rv/jR
         Shz8OyW/zvYg7BStkn3hFuHes5vidyFc2OSZrV9yUlbHLzjEEY6PG0X/LEWcNhhIX3yr
         lUUQkRgkcqWrLm60KumzozXK7pi+xIb9qiksYxFolThGtdZBsJJ6i3pTAVA+4II1vSAP
         yA29bap/jMEP7WuS42WnudooOUJ/5OKeiwhSRBm9Rkt9Vxnnfc0j0YGu8Zf9Z/Enz6F5
         FRiCSy09YstBJ4RdeDB0ZmrgTe2VoyPZNoZX4O04jD3Yjc1aJOD1PL8sJpgKmtXykgYW
         MwyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYgaerOgDneUnwq0ydF5LJWGVeDBHI+WXv8L0DSz7cZ1T0Y4HDAtGjL50WKVcT3APHHpv/CNCaP/vAvw+HkIImd0aUYA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzIWBxo3XUQyHIHppiaLHWQSCfyRwz9/6Ave0dfcyi7YMKB016v
	07fwrEN+U+8ZlKgBEsycdQzeJasGq9L2VS+VZ2dc655XbjGfpgZMPUj74LKq/mo=
X-Gm-Gg: ASbGncuwCyqsFrfcxX2u1y06a+RprUHMa583g8FnqyLaEaOJxYk4TlA8rBtmeW9T1+b
	z3sLfxNDiVq3kXSk/sRJo9d4V5v78m8GZoe3XswdRhUbWUuts/yGumI+WvPrA5cWUvWsKPJ2Vx9
	gZIhxtBH/Uvj4UgS7mPbzjc+5107Wonke55ucFq2Fx8iwergwGZ/b/gKpeZsVxh5nVBRmseuloj
	Zwiaeb6MriUISlWjT3wPljDTSp7kpJajkXxofnRj0efCZZomdzRJ0ZYexuZscN1iUVH45dn6dFl
	6DD23QkxLzzvdDbKosSF3vM=
X-Google-Smtp-Source: AGHT+IFss3YQDvyBHuUGLZCmsbSK26AFc7G2J2uzLww7fhdhbsF/F7HDhh5qLRL5YNkla4HR2XlTTQ==
X-Received: by 2002:a17:902:f78b:b0:215:a97a:c6bb with SMTP id d9443c01a7336-21f17e27225mr737675ad.12.1738697446330;
        Tue, 04 Feb 2025 11:30:46 -0800 (PST)
Received: from linuxmint.. ([14.139.69.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31f5c72sm100994395ad.66.2025.02.04.11.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 11:30:45 -0800 (PST)
From: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
To: tj@kernel.org
Cc: Bharadwaj Raju <bharadwaj.raju777@gmail.com>,
	hannes@cmpxchg.org,
	mkoutny@suse.com,
	shuah@kernel.org,
	skhan@linuxfoundation.org,
	cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] selftests/cgroup: use bash in test_cpuset_v1_hp.sh
Date: Wed,  5 Feb 2025 00:59:53 +0530
Message-ID: <20250204192956.50589-1-bharadwaj.raju777@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The script uses non-POSIX features like `[[` for conditionals and hence
does not work when run with a POSIX /bin/sh.

Change the shebang to /bin/bash instead, like the other tests in cgroup.

Signed-off-by: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
---
 tools/testing/selftests/cgroup/test_cpuset_v1_hp.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/cgroup/test_cpuset_v1_hp.sh b/tools/testing/selftests/cgroup/test_cpuset_v1_hp.sh
index 3f45512fb512..7406c24be1ac 100755
--- a/tools/testing/selftests/cgroup/test_cpuset_v1_hp.sh
+++ b/tools/testing/selftests/cgroup/test_cpuset_v1_hp.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 # SPDX-License-Identifier: GPL-2.0
 #
 # Test the special cpuset v1 hotplug case where a cpuset become empty of
-- 
2.43.0

