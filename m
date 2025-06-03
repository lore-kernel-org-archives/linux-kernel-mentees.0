Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67753221DBD
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  3 Jun 2025 22:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748989163; cv=none; b=uJ7seX54t6rncLcarIGt77Pj4Cri92/WHsXOaLjUm16yMUg9+XkrayiA2FdtSNS1ZmE1Nw5Sy6pbSC/t/ry3Uf2FhHrfmvYjMPCGolw1gCVLI5cfYn/hDhNasSVvwZ4AEnaYNWUUx+VS92gsy4r29p7VNqs8DcP4S4EHMDs4Zxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748989163; c=relaxed/simple;
	bh=JwN9ELcSUl3mBJxYBcBop1epVVw04UgyCIZK3jECD2E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rZGwSDAbJO+47ZxuOw4JdJypm4gXnc2fQgEQu7MwSoTyEe5XVRP5lKNAGDUZFSCcGeJ0qIQZh81Nm4OXru4De50vXwXZdEUyUskxVR6t7RKOdT79YAppMdfwdfl0nsWg13yt2yWayMhazfeH8YNx9YNTAd/NwfCdIO5OWRSldUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HP9vl2h4; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HP9vl2h4"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-451ef12bc81so441655e9.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 03 Jun 2025 15:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748989160; x=1749593960; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f2MuCnQmfuymAmGE1q3a3tLJgIKf+tdHvWlxHjuDCBQ=;
        b=HP9vl2h4Y5RuB1kD8zHDK18shH0/U/6WpZ89AA+RarpSfwK964mtqifgafRtd2dCXS
         I7pB5938SlpgAHVv3A239gT3DmE2Xdzh7H13x9fMOUT5Y0ICYvzwi6JIRnOFuLjc2EFS
         K3DOa3IbioeyDEkxaBO9xrV3NItNcHJwq4KKVKPiWEIa12/CSIOL8p/kpZTDIE7oMqW2
         pNm5gygH0QpngBF9DFBNJQZ0nnbE66NZz+DVhWNQ3opYSXYg3ChpZ4lamgzR8aPvlirz
         gRp5JKGJ4G9jYP1bx/1cv4XdLLbbva33fyEfDzShwoW82WCQDnlsp6PvFXohWOwGUTNT
         Vjew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748989160; x=1749593960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f2MuCnQmfuymAmGE1q3a3tLJgIKf+tdHvWlxHjuDCBQ=;
        b=OGZvOV6MQxLz+iGIjggF6kZrCd0LczUjEo9RZu2DCfskp0YMYlVvWmBKHtSK4gA/tT
         Sh/kLdNYaDUitRZk210EGkiFTmhV0FvFXeV8M0/nbLX9AABS51Q2cxdKppXLRprWP9AF
         uR8FKNHoszD9QSQdiMN0v4ht0KboT0gCawZ0p0jOxQV08/NT6Rcg/nvLtD0OEYeH/OHq
         ae/4+2D0L7iDE2/xC/EfEMroQbmQijlZmxZyr4vspEAI4LvweyuzYcL3GIYzQyGpWSV4
         7hLDCz88yyFmKSiwOTdwNBZO8exs9dEKxaBn9sGM9bRn6Fi4IJvvJeuKlCnjx+s/EHae
         ybgQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0XenwvPJXTsQvyjCENXO7xRG4ECoFo/1HlMOj30xA3CpgNEoqAjK9lLLA7e4vaPgmxfg0AUOUxPX3dx2zL3xfJmr0YA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyIhU4QX3Ho9pzoOnogQsz/giGuqUnVMJhsx0ErtcjAYVhys2Bi
	TNT8oO0GWawkuVDyYSFZ/Os+KI0tcSEHz4AqcPI30kZqSkPWcT2eUTUW
X-Gm-Gg: ASbGncuTjAInta40PW0s89IIAxk27AsesS6OEXkNSYesMVf4iPHZvsFm62ZbheJvsoZ
	snWYRnLBuL/EpGmXw3rt4b+LnRYpGzrLMz+dwRiIW0uPD4bQSGyz1OZjBzJWO1dL3TkCGHclDK2
	Rm8mKYKDN8frmsXh+FOgL4GuJ4Q+dU36uig5iPjG6OqdHz9hjYlwtDQ6hHjIF9e9IE/1BonRh8j
	mD/K6l8sQh1UcJ+2Ps5My23lBFVX/BM23DMVGLL3JhVTPatrNxjPzQ3tHT1whc9+S7cvE01H1fI
	9yqlfzkdowZz95MMQhwit3+e9V7tbXntGpU0Gc4dYW1C7/PJZlHsa7GFDK/xrc1adVQ+Me1QxUZ
	dsR9WE9uKql4=
X-Google-Smtp-Source: AGHT+IEIY12wMUTGy581egmFECqQyjd34dT25No79UiTOYop0jzYJJ+YqVBbCRVZR1wEJPb9MQQJ3g==
X-Received: by 2002:a05:600c:3b86:b0:439:9a1f:d73d with SMTP id 5b1f17b1804b1-451f0b40015mr969025e9.8.1748989159063;
        Tue, 03 Jun 2025 15:19:19 -0700 (PDT)
Received: from localhost.localdomain ([102.40.66.223])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7facf9dsm171215565e9.17.2025.06.03.15.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 15:19:18 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
To: shuah@kernel.org,
	skhan@linuxfoundation.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Subject: [PATCH v2] selftests: ir_decoder: Convert header comment to proper multi-line block
Date: Wed,  4 Jun 2025 01:19:14 +0300
Message-Id: <20250603221914.102888-1-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

well, i checked the script using checkpatch.pl and
it shows that the patch has no warnings or errors
and its ready to be sent

v2:
- fixed multiple trailing whitespace errors and
- the Signed-off-by mismatch

The test file for the IR decoder used single-line comments
at the top to document its purpose and licensing,
which is inconsistent with the style used throughout the
Linux kernel.

In this patch i converted the file header to
a proper multi-line comment block
(/*) that aligns with standard kernel practices.
This improves readability, consistency across selftests,
and ensures the license and documentation are
clearly visible in a familiar format.

No functional changes have been made.

Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
 tools/testing/selftests/ir/ir_loopback.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/ir/ir_loopback.c b/tools/testing/selftests/ir/ir_loopback.c
index f4a15cbdd5ea..c94faa975630 100644
--- a/tools/testing/selftests/ir/ir_loopback.c
+++ b/tools/testing/selftests/ir/ir_loopback.c
@@ -1,14 +1,17 @@
 // SPDX-License-Identifier: GPL-2.0
-// test ir decoder
-//
-// Copyright (C) 2018 Sean Young <sean@mess.org>
-
-// When sending LIRC_MODE_SCANCODE, the IR will be encoded. rc-loopback
-// will send this IR to the receiver side, where we try to read the decoded
-// IR. Decoding happens in a separate kernel thread, so we will need to
-// wait until that is scheduled, hence we use poll to check for read
-// readiness.
-
+/* Copyright (C) 2018 Sean Young <sean@mess.org>
+ *
+ * Selftest for IR decoder
+ *
+ *
+ * When sending LIRC_MODE_SCANCODE, the IR will be encoded.
+ * rc-loopback will send this IR to the receiver side,
+ * where we try to read the decoded IR.
+ * Decoding happens in a separate kernel thread,
+ * so we will need to wait until that is scheduled,
+ * hence we use poll to check for read
+ * readiness.
+ */
 #include <linux/lirc.h>
 #include <errno.h>
 #include <stdio.h>
-- 
2.25.1

