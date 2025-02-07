Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA74B189520
	for <linux-kernel-mentees@lists.linux.dev>; Fri,  7 Feb 2025 17:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738947684; cv=none; b=Fg+UKT2075/+cLiVeLqfyMJxKH0JrrozDsxXeIfuwP0oz1uS+GWgH3+1P+PDYYXMUczMlWDTe7or2JvxlrbSNfXLZCevbSMlpAsksH+Jizuv8vTJ1b3BkyvTRV6BljM4A37/0usq4IKL3NHh5FPz1JXNUKamLeJD9G6NTwt1rfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738947684; c=relaxed/simple;
	bh=KUxFX+4f0Aizw7Mg85WPdNi8c0DEahMb6LLBmtuIvak=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LQJ0I64grtrwQeAR6Bu7COv4moFdu5QsGR8qF37s9Y3KLvGI1IZx/aZAv3RpgxSiW6BgistwVLwhK/SKD2gINGkCLmxZ/Yn3fgp2YzkinHGe4pkh00VHm2WmCcbHWovx+KZMMcBHH3RUw+dV+8guEe0C8tIQR4Lye1iAaK7LCwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JX0hvq5H; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JX0hvq5H"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21f53ad05a0so15160135ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 07 Feb 2025 09:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738947682; x=1739552482; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K89iMvYVIaxnJ+fqwfSq5htV0qyp5rhqJml9Bv4LRmc=;
        b=JX0hvq5Hi3wyQV6kJgZFDu7ebiWprUQkpSwz+IPloPdHAF6wGAenfaPApTfM0VrY18
         Xm3cn1kx26H+l/o9LqThGW4isKE1E75tj8N/F38+wKJPQlRxtfzNmDxSTWBkMTi0kc1f
         PydE6v1rFIPyUpnsGm6SKwIPHoRubfmuHdtGLvMYxSvk7dzacmrkoTg1//nMbN1D2jXI
         c93h51jIQ7pVpcqFTl1CMzOdRA0ugmtcJmwbaTj3RbvrzNORj/qWaYOr/eziT8no8cUQ
         nKat99Fph7qBJHEU1Mm4+aFqt03/G8aMO4zrxiwXgzDDIcrSZzzlJry6O9ylJqcTaxJI
         xM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738947682; x=1739552482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K89iMvYVIaxnJ+fqwfSq5htV0qyp5rhqJml9Bv4LRmc=;
        b=MVuU6WDQOQbM45FbChb7J6EJAfhszUfqteLdlqjvC+STOhAK4wTf5z5mtGvbeJ/x7p
         wsaxxHZtmZo+vQWDQkgAna8G4OPJHU1WGCh3v3qXxbkApRHSCAao+LowP8CGDcPkvDZi
         5aGz/brDOIkSgPFdupZEUy9MFot+qHtAj90TGz9UX2IXXrUYZRDmUZHqA9mWX0347B54
         NG32HOMALOQ1Yksz1RWLG6kYvStG1GvMIl4KKJwFU+wr2kmEOoaW9zTmG33eUdFnRO/D
         Ql4hmYtFxcWGo4p/HqJB+HA06/Oph9LsHRj8Cw0JHaUE6WgluHlimSVsD7wvrdS89hkZ
         SsNg==
X-Gm-Message-State: AOJu0YxX+T40nbHMyeExJU/zOJtM2h59kID3lCVk6pqjfGW90ah7WB/Q
	YeGyd7z14H0zzUe91uXmtaTDcs4k2NWUS2C0G81GiknPflPGBxFe
X-Gm-Gg: ASbGncsFc0Nj4QCiLMTrIj4wOTjv23lgnZkCKI6lAwB8RXe6UIaHwCsRoc50asHU3e2
	8QXrvNAitbM32U8eupFpcbBU04NCbohXt2tfnxjk8Dk1bvUsS8fxT2SXdfMqiCS1FAx7QaMn22M
	L4J5s0DMdlmbSLAcV5QCqLiSFhN60wjvPQuPWlZ/whn0v2+UDDtQVcWpw1OFCzyUnScSbdH4Btb
	DhGqjRZSJ1KzJWq8Am1M4hqKUdNyNldqU4UcevYWxF2ZkVqKAmqhMF6IknIRTuKGvRylBV9HdNc
	QveAUKJE8kvCd88pB1KN08++FVO4oo1tHuHOYQ==
X-Google-Smtp-Source: AGHT+IF5BRP8ZVTaSdgfXjvwOrWRHy+c662VE4SYxICsiTGZQdfE+n3uVs6MwHFvkcvnnfpnrCmSYg==
X-Received: by 2002:a05:6a20:ce4c:b0:1e1:aa10:5491 with SMTP id adf61e73a8af0-1ee03a8f4b6mr8433182637.24.1738947681913;
        Fri, 07 Feb 2025 09:01:21 -0800 (PST)
Received: from localhost.localdomain ([2405:201:5c08:585d:6eb6:f5fb:b572:c7c7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048ae7c24sm3243338b3a.78.2025.02.07.09.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 09:01:21 -0800 (PST)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: linux-kselftest@vger.kernel.org
Cc: linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH] selftests: net: fix grammar in reuseaddr_ports_exhausted.c log message
Date: Fri,  7 Feb 2025 22:31:14 +0530
Message-ID: <20250207170114.4585-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes a grammatical error in a test log message in
reuseaddr_ports_exhausted.c for better clarity as a part of lfx
application tasks

Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
---
 tools/testing/selftests/net/reuseaddr_ports_exhausted.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/reuseaddr_ports_exhausted.c b/tools/testing/selftests/net/reuseaddr_ports_exhausted.c
index 066efd30e294..7b9bf8a7bbe1 100644
--- a/tools/testing/selftests/net/reuseaddr_ports_exhausted.c
+++ b/tools/testing/selftests/net/reuseaddr_ports_exhausted.c
@@ -112,7 +112,7 @@ TEST(reuseaddr_ports_exhausted_reusable_same_euid)
 		ASSERT_NE(-1, fd[0]) TH_LOG("failed to bind.");
 
 		if (opts->reuseport[0] && opts->reuseport[1]) {
-			EXPECT_EQ(-1, fd[1]) TH_LOG("should fail to bind because both sockets succeed to be listened.");
+			EXPECT_EQ(-1, fd[1]) TH_LOG("should fail to bind because both sockets successfully listened.");
 		} else {
 			EXPECT_NE(-1, fd[1]) TH_LOG("should succeed to bind to connect to different destinations.");
 		}
-- 
2.47.1

