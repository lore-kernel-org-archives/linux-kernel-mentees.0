Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B72521D58E
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  5 Feb 2025 05:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738733974; cv=none; b=UQjrU54GwCwn065Ji85mPcXgTgBHoN9P/M8wYt69ajliQ/MsYk867kPEykuhz/mwSiHc1KWVAn5kW8n27w2lfQmxzK5ixflsriHDRZLzx6kwIPHSNrmqgK2tGRaKGxbY+Re6/4kpGaMznKWGZYXVn7nGcZqlNpO0X8/GSs5TNFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738733974; c=relaxed/simple;
	bh=wRMSTlIHoaEU/DmkPcVfRBAGfm3mkOsFJgbtEQ6blDo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lObdFkYkwATmLAAw5wUonXwdQpR0LLabZ5Pn8ifTx3TX30qh56ctN1VUVXFNNYs48JOWKd8WzYaIUTNYr9F3rOFhnv4hrEL+tA0kzX5QutBzAql6361IliCRaqHETxOK7pF2hyomcPaOFtoiTmcQNG1qBh1P0Ls5uVyKw2oOJ6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GwdC/vfr; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GwdC/vfr"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2f9c97af32eso1884663a91.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 04 Feb 2025 21:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738733972; x=1739338772; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dsul7VtDFl3am4+HHPYwB3KbX5Pdkh87uLvEk51HcKE=;
        b=GwdC/vfrNz1t7UdkUgYirXrOj/nm09Y3fG6mU13GcVcWhTmjA98D3AWg/eC7BJi9QB
         lM4sdCHD6dn4BK0G0AJMwtSbdB1p18xv08jiaD8GQkMRgd9lm+YLkw92NrQFZoScKnEm
         AvFkg2eLXVNBdIpfd9xhnlPzGXHIBql5T/7wLMSOsqIX2YGzTHBKcd6nTjgN1JJJt3UT
         XjK/DYsAZAgWLgTWK3qhpcvJ+41YQGayQTj+Cu5R0eSH48VRgEWum50/3tz/L3y2pqmD
         i748hOIgYUTUHoCGaOw50mnaBEzC5DAiU6Slh7hKbMyY+EHRrAEj4/OCHrqFKKnmuFv8
         NbSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738733972; x=1739338772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dsul7VtDFl3am4+HHPYwB3KbX5Pdkh87uLvEk51HcKE=;
        b=u/U6OLrwq1BeqUYjVMOYcGOc/33DFnQo823D32uEfEws/4IFAPEKbl4t+lSlkcDzjH
         JA2EWuTOOH+5k5/2ZbtAW+bGr0p2NZen38IDeknHpRMYoeAhoHgQREPZ+0it0r/oaooQ
         h5iiYeMJdjylF1Q6bv/pgodAoaHIGrus6luZle/s+kJu9BjDWf23u296IAz2+SJpcima
         vgDUYVKbWLWhraDWFo2fIKpqrdrQcZORZahJ0gx8BrbjZtupk1llMSz0bZDimCpCv3jx
         XG57J3f/WXCLrvksa1czNnf0pdPwZvkcybsa9ZD+zMi20fpze0BM3AIo7o9idCDSvzGy
         WAqw==
X-Forwarded-Encrypted: i=1; AJvYcCVGItbW/Ach7Y4GgKpmszA7SCvOXR6bVk0yVr83xJV5lTMOsU99ry7VkH98i6FhPlJ811LWgXa2dEq+QhbhagF4XYlZ4Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzpzcejzcMdczVeV4kcfXJOI3AW71UurPhnFDDenS89j3QN2oDT
	7w9/dO39IJZYdP9cXYEXTcQIKM/qcLnwnow1YnH28rig6Vixm05L
X-Gm-Gg: ASbGncu6ESwrLuMIbwbRECCtnZ+XhNdWHVhYoJ1kZYGCuio0I2wxe6aZa0KKxzFd+UW
	8ia/SKkt5ucTfNHd8rb4i2nRR8vwZEprZJnGbr1uLbp+FI8fJOT0rfkcnZdrz6O1aRVso9CDUJh
	istVfm5SZG4j/QVacvOCWxyDhvbIaoUkt3QsozndlowwOIl84Bu5V3a6fc4T+vGhWRXVSYdne65
	oFM63MpL/tGRYAo6B0MMJe7Dhf/7pHFFvKCLqG+4ZCpBEbyB2zRF8RBNW98/SI9tyX1pE08/JAQ
	hZwj3t476kDBAWykS5+EXJ5HIS64Yv4lAvs=
X-Google-Smtp-Source: AGHT+IGxX/h10NXM0LIDTbYPxDYqVH+ZwKPX8fNuchz7fcwwLZmtRcoNtGkMiYJe6nYLWjdbFSvaxg==
X-Received: by 2002:a17:90b:4c4b:b0:2ef:33a4:ae6e with SMTP id 98e67ed59e1d1-2f9e076772cmr2939422a91.12.1738733972290;
        Tue, 04 Feb 2025 21:39:32 -0800 (PST)
Received: from vaxr-BM6660-BM6360.. ([2001:288:7001:2703:dc5d:87af:eca4:905a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f9e1c06393sm581025a91.0.2025.02.04.21.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 21:39:31 -0800 (PST)
From: I Hsin Cheng <richard120310@gmail.com>
To: shuah@kernel.org
Cc: brauner@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [PATCH] selftests: pidfd: Fix compiling errors and warning
Date: Wed,  5 Feb 2025 13:39:26 +0800
Message-ID: <20250205053926.257732-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When compiling selftests files under tools/testing/selftests/pidfd/ ,
some compiling errors and warnings will pop out as the following.

  CC       pidfd_fdinfo_test
pidfd_fdinfo_test.c: In function ‘child_fdinfo_nspid_test’:
pidfd_fdinfo_test.c:231:13: warning: implicit declaration of function \
‘mount’ [-Wimplicit-function-declaration]
  231 |         r = mount(NULL, "/", NULL, MS_REC | MS_PRIVATE, 0);
      |             ^~~~~
pidfd_fdinfo_test.c:231:36: error: ‘MS_REC’ undeclared \
(first use in this function)
  231 |         r = mount(NULL, "/", NULL, MS_REC | MS_PRIVATE, 0);
      |                                    ^~~~~~
pidfd_fdinfo_test.c:231:36: note: each undeclared identifier is \
reported only once for each function it appears in
pidfd_fdinfo_test.c:231:45: error: ‘MS_PRIVATE’ undeclared \
(first use in this function); did you mean ‘MAP_PRIVATE’?
  231 |         r = mount(NULL, "/", NULL, MS_REC | MS_PRIVATE, 0);
      |                                             ^~~~~~~~~~
      |                                             MAP_PRIVATE
pidfd_fdinfo_test.c:237:15: warning: implicit declaration of function \
‘umount2’; did you mean ‘SYS_umount2’? \
[-Wimplicit-function-declaration]
  237 |         (void)umount2("/proc", MNT_DETACH);
      |               ^~~~~~~
      |               SYS_umount2
pidfd_fdinfo_test.c:237:32: error: ‘MNT_DETACH’ undeclared \
(first use in this function)
  237 |         (void)umount2("/proc", MNT_DETACH);
      |                                ^~~~~~~~~~
make: *** [../lib.mk:222: \
~/linux/tools/testing/selftests/pidfd/pidfd_fdinfo_test] Error 1

Solve these errors and warnings by including header file <sys/mount.h>.

Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
 tools/testing/selftests/pidfd/pidfd_fdinfo_test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/pidfd/pidfd_fdinfo_test.c b/tools/testing/selftests/pidfd/pidfd_fdinfo_test.c
index f062a986e..f718aac75 100644
--- a/tools/testing/selftests/pidfd/pidfd_fdinfo_test.c
+++ b/tools/testing/selftests/pidfd/pidfd_fdinfo_test.c
@@ -13,6 +13,7 @@
 #include <syscall.h>
 #include <sys/wait.h>
 #include <sys/mman.h>
+#include <sys/mount.h>
 
 #include "pidfd.h"
 #include "../kselftest.h"
-- 
2.43.0

