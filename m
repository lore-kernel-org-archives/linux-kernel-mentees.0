Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E817533E4
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 24 May 2025 14:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748097217; cv=none; b=c3DL1tljmBNU3Jw0KxAoMebmLrh1+jcCvlWI8/Gp55/ji7V+mIUkWFmMK5G9Z4QS5pF+q9Qa59hdcZ7lv1j1BUDdQ8eSPYl/x+VOu+4IhLWvgtO8oeEH/GzhmsIGdUAVc8+2K74umPPZpyvisJJboEBoX1c6ThewcA/AVGsG9YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748097217; c=relaxed/simple;
	bh=9Y2Cy2Z684iV3WCV0FZgOy54ODTJIJFTPgB2qEiELMY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=W5VFrXcqnKio9r34pKG4ny+VPF+22wCwoaIO1PF//fCqNbLgagmpWFA+ZYSMzznkpT1HtfvdVtA//5Ze0FiOhAl4A+ZnAeX33oHVugzkqf90vgwIdjLtrsVkuziXQ2Gd5GJ1Hor5EZbKzdtQ4Ri1pzKoYIw6x7F/tD7lJU/MHj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz; spf=pass smtp.mailfrom=listout.xyz; dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b=hyD0oJ5u; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=listout.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b="hyD0oJ5u"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4b4Pdy0FpBz9sFC;
	Sat, 24 May 2025 16:33:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listout.xyz; s=MBO0001;
	t=1748097206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GPjhRmUlvUDlyGASnR0b4c9p06n+6EXVDrA4lsSApk4=;
	b=hyD0oJ5ueUot8fDEE1pFDPYK1uG4ua/fXc2Areeu9TrvzjiFwi+vt2MswGFU2+SQ5CIVcp
	osFXnvcMn0ocG2C1TfsZYt0guWMxcPlEZGjqslFhoTRxtT8wTGiaH9rEAzNpgd1echVLb6
	OiZLopTFjZTRslEh3mRrOfu/fVptoUgbTCPaaihGuoQIKJA8On+PZPNltiYy6+XalbZThb
	Fh03TuagYMi/0QSfS3t79g15JTs7mc8b3MD3dLN01YWPSkRMzF0xL6CV4FdsBs7ajdufq3
	OCVMJ+BBdBM4ZWPHzrfmJELERCLM+EER2zD34A4U5JVEtliDOoSjOgg9thBWFA==
From: Brahmajit Das <listout@listout.xyz>
To: linux-kernel-mentees@lists.linux.dev
Cc: linux-kselftest@vger.kernel.org,
	brauner@kernel.org,
	skhan@linuxfoundation.org
Subject: [PATCH 1/1] tests/pid_namespace: fix pid_max test building
Date: Sat, 24 May 2025 20:03:18 +0530
Message-ID: <20250524143318.6528-1-listout@listout.xyz>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With newer compilers the pid_max test is failing to build with the
following build error:

...
pid_max.c: In function ‘pid_max_cb’:
pid_max.c:42:15: error: implicit declaration of function ‘mount’ [-Wimplicit-function-declaration]
   42 |         ret = mount("", "/", NULL, MS_PRIVATE | MS_REC, 0);
      |               ^~~~~
pid_max.c:42:36: error: ‘MS_PRIVATE’ undeclared (first use in this function); did you mean ‘MAP_PRIVATE’?
   42 |         ret = mount("", "/", NULL, MS_PRIVATE | MS_REC, 0);
      |                                    ^~~~~~~~~~
      |                                    MAP_PRIVATE
pid_max.c:42:36: note: each undeclared identifier is reported only once for each function it appears in
...

The fix seems to be including sys/mount.h which brings in the missing
defines and missing definition mount function.

Signed-off-by: Brahmajit Das <listout@listout.xyz>
---
 tools/testing/selftests/pid_namespace/pid_max.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/pid_namespace/pid_max.c b/tools/testing/selftests/pid_namespace/pid_max.c
index 51c414faabb0..96f274f0582b 100644
--- a/tools/testing/selftests/pid_namespace/pid_max.c
+++ b/tools/testing/selftests/pid_namespace/pid_max.c
@@ -10,6 +10,7 @@
 #include <stdlib.h>
 #include <string.h>
 #include <syscall.h>
+#include <sys/mount.h>
 #include <sys/wait.h>
 
 #include "../kselftest_harness.h"
-- 
2.49.0

