Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07384221739
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  6 May 2025 21:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746567360; cv=none; b=k2MbVghLe8f0/wk8v5hP/3M2Ohsh6UGbq4cXxBKQQ49HBHHZ2kJz6dalBbF5WQyzNS5apVY+3R8jNRbnUR1n0kLNe7eyR/FnagxlAspAHPDXB1FRWtGGfehnNg8ZVgNwOljv3R2X4FEMN4eEeDRaKdzj+fofQ3+tbce+VOOf198=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746567360; c=relaxed/simple;
	bh=I+Fx8q3goyJx2Gxb/9/UOHkYu+kY2IGAKZZIg6IZzSM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FD6Xx0LDOd14DQkDVbaZ0Qn1KaZ6uqzBkEMd6ZlGzBpw0eyiWFYFmSBr+ZFFLw3/L/4Ai05nxmL+5pUVCNX0/rDqJ218ZtbjNlBCmDze2nJE47aG+oJ3NT3QLBNlhCYUTffP0AU2RKQvWTIE36ymBEruDF6DRP1biXUIW0sFU0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PAay4HHt; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PAay4HHt"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22c33e4fdb8so63016895ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 06 May 2025 14:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746567358; x=1747172158; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eIsa1bhwZTWpZl9eNabO08QufObEhVlhwC0HW+Z0IKg=;
        b=PAay4HHtxsIZdYavV4hgd2ymaT+OECVbJSWR6j4G8Pja5ubXmHEwjUoT5o4ZRLACMR
         sxjggTLJt3edCVG2gU2m2CvcxaKnTanyqkczOVdRV9yQVhbvFNL9BPPNtMeqyhb/aQ/B
         nnsSCXO1BIOsbwfuLcEDriVKeEtUbiPJyzkGQDX7Oiw1jbwvq3VV28SIedq0SdjdCZko
         Bbcl2XrQHK0kwo+0OhLbTO0NQH0HZkpoOSKha4RHEqtP0oXSuaNSJ9O+fzWvVrpApOZ3
         selvb+5QOr3gH5kXSPymHX/i+2XgH5tN8qsm+YC/c4MWiiuPfvp+wHTlESbkP+2edv6r
         kCdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746567358; x=1747172158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eIsa1bhwZTWpZl9eNabO08QufObEhVlhwC0HW+Z0IKg=;
        b=UIsi947FEyyqN3BWKy7m7iwpvRk39c157LyxTKP3Pm0+lGE8ZCdRjnXtxcbu/rW4fQ
         zwlhrZiG6RWZLlaZvOzaDObG6rd9Ux1FWmMJ0MT81NOTDCDSzWvJBS8EuljaHDWA0BWh
         ylsiwWx6W44PokwF2hDt+S3fl8bX6vkqQW6NgSL2kB9c1DYR9uGXpMamNDIDSPBhB51Q
         g/ZRalbfimVHYzMKytCBWmCOcILFTmzq+jzNbuOJHu/I2KNsvpOl/wiCNrDredwbWL0j
         Aj5Gw0Im3nx2Fv0JXyGcP+3KHwwRn2O6lwKs3AzUX9Vjsfvd+Hb9JDXOUMe3d5BjRteg
         RDVw==
X-Forwarded-Encrypted: i=1; AJvYcCXzVRi7Fj+rpVZ0ehxj8N1Qm9A7/3Ae9awVP3c1OpljTpud+yvD7v5XLTK0KK4SRP4vPNUZWwRt0t9CRtDfm8UaMwTZ+g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzoWFU4kMYOg14GrwvfvZqn/mVkN+9ct0RZVvjNQB1TDarR3phc
	kk7lnv7+Dr9uDdeTdeJ+IZWOdt01wG+7v4oeEEu2QU81j1346GY+
X-Gm-Gg: ASbGncvnHdtn8EVfB4vzg2luPJHyMmy3NUy+9FfiArwiLarDBYhNs9EdVxOD+/ZP6il
	cIpVdY7e266U55NYojf/ipTl572yL8Kkqr3yLA350fod7LPm2lxMmr9qAGUVyd1zIxESLaip7r9
	v/geuGnvFbQYIkceUvKjLG4wH1lojYS0xOldT66zhaqUHv0wC/mTka9VNj1B7SaIZ8L8nOqb6z4
	oVUn4/3uRAzwL5oQ8uMnCtklbNBMcVO4cAwnLyVRhiaaGv5N+4SpJJgbf9jvb6wlmJh+8XjfQrU
	+kQqjVY7/SOuCbIgu9fzMeNDCroNcjCiS+ODzSxfrPO9mBuvavq7jpqIkkWIvOy6awyzKDD9+iU
	2U+lxS5gmmQDKxA0m7MKyrusitpYYnCdRq5k=
X-Google-Smtp-Source: AGHT+IE0dnaFFX5Qnoy2VbjG0XY7suKj3R2ErvmlpliCrYY2tLb235jAN3MLyeBZ63WibuaxM+zj6w==
X-Received: by 2002:a17:902:e849:b0:22e:5389:67fb with SMTP id d9443c01a7336-22e5ea2dc51mr9571055ad.7.1746567358092;
        Tue, 06 May 2025 14:35:58 -0700 (PDT)
Received: from server-kernel.moonheelee.internal (d173-180-147-14.bchsia.telus.net. [173.180.147.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e150eaf91sm78933155ad.1.2025.05.06.14.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 14:35:57 -0700 (PDT)
From: Moon Hee Lee <moonhee.lee.ca@gmail.com>
To: brauner@kernel.org,
	shuah@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Moon Hee Lee <moonhee.lee.ca@gmail.com>
Subject: [PATCH v2] selftests: pid_namespace: Fix missing mount headers in pid_max.c
Date: Tue,  6 May 2025 14:35:35 -0700
Message-ID: <20250506213535.5235-1-moonhee.lee.ca@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix compilation errors in pid_max.c by including <sys/mount.h>, which
provides definitions for mount(), umount2(), MS_PRIVATE, MS_REC, and
MNT_DETACH.

Without this header, the build fails with implicit declarations and
undefined constants during selftest compilation.

Changes since v1:
- Included example build errors below for clarity

Compile error:
pid_max.c: In function ‘pid_max_cb’:
pid_max.c:42:15: warning: implicit declaration of function ‘mount’ [-Wimplicit-function-declaration]
   42 |         ret = mount("", "/", NULL, MS_PRIVATE | MS_REC, 0);
      |               ^~~~~
pid_max.c:42:36: error: ‘MS_PRIVATE’ undeclared; did you mean ‘MAP_PRIVATE’?
pid_max.c:42:49: error: ‘MS_REC’ undeclared
pid_max.c:48:9: warning: implicit declaration of function ‘umount2’
pid_max.c:48:26: error: ‘MNT_DETACH’ undeclared

[...output trimmed for brevity...]

make: *** [../lib.mk:222: /linux_mainline/tools/testing/selftests/pid_namespace/pid_max] Error 1

Signed-off-by: Moon Hee Lee <moonhee.lee.ca@gmail.com>
---
 tools/testing/selftests/pid_namespace/pid_max.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/pid_namespace/pid_max.c b/tools/testing/selftests/pid_namespace/pid_max.c
index 51c414faabb0..972bedc475f1 100644
--- a/tools/testing/selftests/pid_namespace/pid_max.c
+++ b/tools/testing/selftests/pid_namespace/pid_max.c
@@ -11,6 +11,7 @@
 #include <string.h>
 #include <syscall.h>
 #include <sys/wait.h>
+#include <sys/mount.h>
 
 #include "../kselftest_harness.h"
 #include "../pidfd/pidfd.h"
-- 
2.43.0

