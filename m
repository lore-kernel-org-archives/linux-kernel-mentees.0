Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13C421519D
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  4 Feb 2025 16:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738686266; cv=none; b=l48b/A3DIGT2Zuou+BmFC5VUER+hwUwL7YHImeDpVgLKamhDr1GSc7S/1fcsL4wzH9yq+8weDMEMC0V1G6K4vOQLp83dPzlA6KuHcQ4Q1PuzTJPUZQk+IddE3pVHl+6UJqJQ8GS/eh6OtBwT9TqtVxhJAQ397Ohi7sihMwo1Vow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738686266; c=relaxed/simple;
	bh=KUxFX+4f0Aizw7Mg85WPdNi8c0DEahMb6LLBmtuIvak=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r/deK8PmCT9ymmPHHsWbN94bHYs+eRk8mzPi9Badn3rHw27QVyaDUhokymhSl47I84KPvQ9ewU9Qi3VO3XQG0s8XeB370xHFqssnDSFutPpJ6erUDNth/8iQgAeIvb0Tut5ZaGgaxxBg7XYf3X3iit6ZHOl5fwnIfMF5gEOpbRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HANEb0kY; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HANEb0kY"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2f9d74037a7so647304a91.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 04 Feb 2025 08:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738686264; x=1739291064; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K89iMvYVIaxnJ+fqwfSq5htV0qyp5rhqJml9Bv4LRmc=;
        b=HANEb0kYOydUiZvRUH1xGYFsoHoo4/SHsAvIbLfRmnxKjtHAnvrbB5xamk4ShzwQcx
         07xqtGzWJmm1cRpQF56Xh1gt/mJQ5V3dHR8U3DkO1PZ3hxDbVOgnQSKqo+DaABDtyej1
         UspaT+SSCQ9SPTyTkxrIfrF6PDRo0TIiFLuIPewyYzpDW+D+gHm+vG5/HstAuTYQVBhU
         ScmZl+tr+GWz2aXoSZVZPHk+yE/X63/b0lf2GoIURZTtjme3tskVRD2mTBRjIfgVxFtO
         ma/vrweVwZfncVuOt5DRikGXg0HscAl8BT6WoDLY2oyCLJw+OpElfvvQcloYZyUQTNHA
         /0gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738686264; x=1739291064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K89iMvYVIaxnJ+fqwfSq5htV0qyp5rhqJml9Bv4LRmc=;
        b=bReReKIFkAR31FAYvK33/pNCm1xQy0tqiGMX/6nGsFkX8+4RA4xSgHOA7l5lNoH/iE
         oscHTOnYQGFpwyqpMQ8etSBgg43rrrz85YYvHVL3Ire4szFOGvvXuwgwzNVyT/45RKz5
         pqF8dUQoEAdab3tdyCvc/AvLErt9dcQWai1ew9TZDOHDN1kJrCSCUwurerLN2kt0+MDn
         BOliQSjGmA6vjeAP0jZMDzOVKJPQcsQGCEwyFrKhjYN4dFHdkNJW8br1HJRjJ9s4MCyf
         Dl1P9IcbpfHhW4nSFTIe/YUbAeA478Gdwn9Mj3DT1tOBzarobA2PXk+6z+ffpsNiNI5i
         7rvw==
X-Gm-Message-State: AOJu0Yz68/jVjO86B7jBpves1H1ZRijZLm7tlaQYMnRdQUYQpV8FQfJ1
	xhXA+h6CMOPf/s6gJlYFV6nE3AUmmG+KuxiFDdF7QvVS+tLj+Gqa
X-Gm-Gg: ASbGncuS9zArlYTgcDOZKDZfWjc7sA482qy/BcNrqYgSUIK8s1jxirq6Tql6irUVipw
	4n5lew3USLhy0oWBgSDfRq/SjyGXtOLlEUhCL5DaU/yCVgrtjRZ/V9DjrYaDspfqUzjWzL1bOo/
	PZJLxqGF2N548Mv9yEo9vajsRjHFLa0fJoh+Lx1oMprDh1kfWaR+rRhd/02UNJrwWjD6TW49jYi
	hnTKUWbI54wwl0lDf08dNGpGH46C/mJ36jndcd3DHSi172xG9CZPhr8NODsEGKNgS5A0wdTiulm
	d+HIjeHkasdiIvHpUkmHcqdzJUhobeUfBVwZCw==
X-Google-Smtp-Source: AGHT+IE+t9Q0e0NTv5Lqu9aYMx1Bpc7GcxHoh0GazGwA8Lf1cfTs4FCqTeCL17FslcTvdiqqyyq8iw==
X-Received: by 2002:a17:90b:2c8c:b0:2ea:712d:9a82 with SMTP id 98e67ed59e1d1-2f83ac81fbamr38733712a91.29.1738686263628;
        Tue, 04 Feb 2025 08:24:23 -0800 (PST)
Received: from localhost.localdomain ([2405:201:5c08:585d:6eb6:f5fb:b572:c7c7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bc97d3dsm13797897a91.7.2025.02.04.08.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 08:24:23 -0800 (PST)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH] selftests: net: fix grammar in reuseaddr_ports_exhausted.c log message
Date: Tue,  4 Feb 2025 21:54:00 +0530
Message-ID: <20250204162400.2295-1-pranav.tyagi03@gmail.com>
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

