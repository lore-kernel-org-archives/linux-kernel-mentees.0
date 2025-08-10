Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D455F241C8C
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 10 Aug 2025 10:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754822839; cv=none; b=WamyuoAiu91qXD5mhWg5Gwkx6OiwfuMxpTRxgKUdOL6H2Tg9J68BhmQblU0lCSN3GA2QogCYVuN5lGDJ9wQCnXfNKziAu9RvmdX21aW7rAZzW/OsHX5+aDLApeEw1mZzUJhiOwpV+aQeIX0aMEVly93Eep/o7NNpHaRNyr6tqZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754822839; c=relaxed/simple;
	bh=nxaG1zwspR17PpSRctsHtA+r8+e7ahm88TtHx5G1y30=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tnP2sQFBQjIfnECTVY+vGW4qX8Kuq4LC4O3ydR1yH1V+RwAqYQ1mclvh0aRqKwqkIDFUidnB3xs4VfneO/o7/k32ZsIofhuSItll2XYNocxLwmWl4nIZwDNy00GV7VK4DlAS/HN9AE1/irVFXS/U+cIeIcBQZdHDCHTHFaseMjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YkOiBn30; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YkOiBn30"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b421b70f986so2470868a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 10 Aug 2025 03:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754822835; x=1755427635; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aE0rp9G6z0AX5t6srN3jmjast9AHcG827GIfR2iMskE=;
        b=YkOiBn30l9jIQcTqt4aph2L0dCIu6Xia0TtnyY0hrLSiXUQpQAB2Evper0TBU+7jcd
         lVjMa9Vki3MhVHUcjkdQ/8t+TpzT+GEN83y2mkPBuhHR4TaLjby151dLRopaw9zMrLxl
         pyD+vAsvWLM+KEBB6wD7snEbJN0d2ZIN8rnDaPiWDq4TkK/QIsSOJsHSKJ/+2Rm1yiq2
         oHVbFZmIzyE7zqrddGrKjIkCyR/dJst3eH0sqcz7rw3ETp90PeZXP+UxR7eOC9TJPmBb
         07uW80QujpVVKBtNY7Itj3Y+fvdiucuqy9n8SUSHxdHSKxGftzozVtjNkkiArvPgdc5m
         EnhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754822835; x=1755427635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aE0rp9G6z0AX5t6srN3jmjast9AHcG827GIfR2iMskE=;
        b=QqLzL819R0n5WiopAHLVl50BWCsrwKQp6/VDjOBZnDBBtufXIp2VjwzbTARPni+82g
         R1u3jF6rnHBLm0LGS5Xh/ZkRgmMUKKDZeZIf+77pH29ZgXV1lbgrSYRkaWmB3MYeDw3s
         /Pb2L85X20NSjb83pxc8z4GNphWJhFRdZS/NYuMBcKc0JHrmb1RFE76rLb3LmA99UHyT
         JUi6pJiLAjuKzWQ5qgobvg1WkrCXqvtug5FnMCMlI6C7/vVkrxrtNS+Q7CTORO7a12JE
         a/RkURrbv2GSMYxg6aur0pi+fAuYbhPPxokmKsya/fUOI/wZZacOHiOsjSLFTL0zlhMx
         rR4A==
X-Forwarded-Encrypted: i=1; AJvYcCVSgwtHfDfcC/QLpq6Rzq+igGZ9P83MUIrPHD3i7WPoyW3ufKfFepyj1MBf/wYavZZZdER7lB6tPQErcwmTGPdAA9xLBA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxCiV+1Dj7eGa6D7M5fmXCN1ETAsULaahrTHZCZGcdb4q+olSMb
	LIbBa/yS4ZiVB3j+be2tmyWFZCzOaMTTjCspLRgPv0GwdT6PS4k8T6VT
X-Gm-Gg: ASbGncvvdcZa8UOqhibuFCACOvQBuyezyRxkDhVXQLEDkX7taIK3vuCrh5Ks/8tn485
	UxVvnzLA8e303IYCV8LppsyPkoGuQp4OeS4p0TE+Ha2sEm1pfdiwzDkuVoG9TOsyPsErygmHW20
	aDSPiiNm7+CvFsS7IiYw2A8ohjM2tsOlbwMAVfOifyyi0jnA01ZttHOrxUYiwbFdt3H5o0fWTkK
	wkpbeGqLNjCTJhDH7ewafjiDxuBSmz5WX6KaKoziMxwJkqBd7PUtLIDrXmfDYxd3WLiLiYsMnE9
	48xg7Xzba1CuPjO76frSJUFkVcmj0eYCQsyrFKgYjU4qrvz6mvGPwjpSicWboFWQg9X0R/nYX0M
	BOSkSGV6Kbeoanex8B6ZDH0uUvlUP13/HKuOC3LWSKnY=
X-Google-Smtp-Source: AGHT+IFfsYKCBdRC4wXmrwKLs5mBjgjgoUUK4akPCOJx0/1nLz3fwTx+LtyvZYi92z7Ecb8151LDBg==
X-Received: by 2002:a17:902:ec88:b0:240:981d:a4f5 with SMTP id d9443c01a7336-242c221dcf7mr140890085ad.42.1754822835003;
        Sun, 10 Aug 2025 03:47:15 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2426dec66desm166431485ad.54.2025.08.10.03.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 03:47:14 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: kent.overstreet@linux.dev
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-bcachefs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] docs: filesystems: bcachefs: Fix spelling mistake in idle_work page
Date: Sun, 10 Aug 2025 16:16:48 +0530
Message-ID: <20250810104654.90962-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Specifically, fix spelling mistake of "hierarchy"

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
 Documentation/filesystems/bcachefs/future/idle_work.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/filesystems/bcachefs/future/idle_work.rst b/Documentation/filesystems/bcachefs/future/idle_work.rst
index 59a332509dcd..f1202113dde0 100644
--- a/Documentation/filesystems/bcachefs/future/idle_work.rst
+++ b/Documentation/filesystems/bcachefs/future/idle_work.rst
@@ -11,10 +11,10 @@ idle" so the system can go to sleep. We don't want to be dribbling out
 background work while the system should be idle.
 
 The complicating factor is that there are a number of background tasks, which
-form a heirarchy (or a digraph, depending on how you divide it up) - one
+form a hierarchy (or a digraph, depending on how you divide it up) - one
 background task may generate work for another.
 
-Thus proper idle detection needs to model this heirarchy.
+Thus proper idle detection needs to model this hierarchy.
 
 - Foreground writes
 - Page cache writeback
@@ -51,7 +51,7 @@ IDLE REGIME
 When the system becomes idle, we should start flushing our pending work
 quicker so the system can go to sleep.
 
-Note that the definition of "idle" depends on where in the heirarchy a task
+Note that the definition of "idle" depends on where in the hierarchy a task
 is - a task should start flushing work more quickly when the task above it has
 stopped generating new work.
 
-- 
2.43.0

