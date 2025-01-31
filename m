Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE6818E25
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 31 Jan 2025 17:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738345637; cv=none; b=q4tetqCdI240tB+kquaw3VKuFgcrTir6KHr5oZzLapNe7JQsaM7GUeeh3UQoLiwmkICTXlQ+pSuacj+TQgOoOUAh6F5Ey2u+MlRYq4OyfiVpOXExIDOeJkj6hjBBdJJvRZTkHSith/YUQ9EOydN9FGYywmCvj1GPdm1ZEkuBedQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738345637; c=relaxed/simple;
	bh=aoyjvtNcT8MbEevAje0oGmQYgM7ADSBPecevEok87Fc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NEiTnUaGUh047tJLTXl84qPDe4PQsVQbC1ZNzfhM+UngeM8EXzu86xJm/oJ4V2ogYF1vUNqTbaA7+aHqI42/bYQG7BnlNDXUw1IL7RDoZqPWz2qQsCN33t3EqbvHY0FFUcIgWCojtqOMCbjjdy85Dy18HyZXxfEAW0/V/Gb5Xqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RRAXZJDp; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RRAXZJDp"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21c2f1b610dso52355385ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 31 Jan 2025 09:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738345633; x=1738950433; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W7YlXdN8EH6kD+0yxUGaKa6fqOZSgCi9IOU8Ql/cpYw=;
        b=RRAXZJDpMr/pT2jUlSPf8o5/LWsBho2GL91BltZd1e1Ch9b/6WatZdBzTLCddNnaHK
         rudfciG4DhyV2jx66g/ViO7GNtY+k161kNQjFIFHyKbmL68HMX3xztk94hTVIv1rSx0j
         01rWUJntBKhDkEPUDGEY27ZORFW3X2rdcvaU2lR7Rubjqna6bpGiDIuRFN4036+gYszc
         3Wc2o/MFE2w1kDIszKLl9U7yrHgEJP6El/YDSZYQH3DOOfL6lPaYokmC8ZzlFAqvPdr4
         9WUUFKb5IHwyGIX71VltfuDJ+jyChjtUm9Up3EBA77OPv8DB0ycRDgmgrAkJK40/GXVI
         42wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738345633; x=1738950433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W7YlXdN8EH6kD+0yxUGaKa6fqOZSgCi9IOU8Ql/cpYw=;
        b=sPASlJi8fpBBq2tuZdpLQQIyc0purAueEuBNlayG6Y+/TkFpEolIwMpdIb1UAHiRNB
         Xnttsz+O9RYDNA7hCqwZIaUsP0PS0+/B0ZpcfOnJ2LgnDhD2t+kvSPcxiVTLBoxoM2vg
         2WrQYs7NKYXho59HH9m0OjBaemw6M5r/pa4Y37EjNc6ikPdFMEgrROk2z6e+zEgY9kZU
         UwjBfy5fNe7d3R5k2lSRHkvI8L+cOhTXaKxH0n8k821wM28SUYFg2Glc5HdAC79pWGQa
         RGCIRB/RQ5LU1eA3+FgFcA5oM8zhwy0zjt0qIq6HQVFF7bQMV5pYgJmpbROssxzIACJQ
         ryRw==
X-Forwarded-Encrypted: i=1; AJvYcCXpU/vS/omNK1dAauj1WS4Gp9IiowCZyXKVNfeOZRnLt7SB40oRj1Rio1fiOaASNvlTf7mOUld8aYjE+jtvIzc93naxww==@lists.linux.dev
X-Gm-Message-State: AOJu0YwOfxOltXuP7hYfPIe/mSe4gWSWni5PKaEWxRcTWEbN//DIyJ/6
	riCRAqjAOovx5AOhzqt8xz4nfJFp/YuSeBLUUeP4ni5LhyspChbq
X-Gm-Gg: ASbGnctcagZ9f8+G6xdwqO/NOCpIaAUtAssyXn3n5q2j09VshsHXuJJxwzK7kNwhkUV
	nUqJRPTRlKb4k7tuprZN4ABw5uY1/kdJ2jP/18zZPgCws/22d8bPPQjuAiSqGAt+4fp8ysVrdLD
	OzxbgVJTG8n6GIQIdoFZQNGUx5nwuBIkZgG+h/7y76SnACieLS+QAAfz8Xm4AqaqwqXJD55EmvW
	n42FF7rFQ6k6ILBC5wRpRhL5tbzcQEfxhmz5Myt9kqe9AHA0uTXXK9oLvRyRpwhozNeZNWdK/Ek
	gAaOXbz7x39eJUX16iyet5GfiumbzKYe1PYOcw==
X-Google-Smtp-Source: AGHT+IEm5jy1kLtVHI3l7PHXPWmuU4lPhbHbDIuUMyizg7hcBnB4M12yIiy6xO+22RLDVTeT3CltkA==
X-Received: by 2002:a05:6a00:244b:b0:72a:8461:d172 with SMTP id d2e1a72fcca58-72fd0bcf0a3mr18874603b3a.3.1738345633163;
        Fri, 31 Jan 2025 09:47:13 -0800 (PST)
Received: from localhost.localdomain ([2405:201:5c08:585d:bc01:38de:cff8:1fb8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69bbb7esm3704010b3a.106.2025.01.31.09.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 09:47:12 -0800 (PST)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: linux-doc@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org
Cc: Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH] documentation grammer correction 
Date: Fri, 31 Jan 2025 23:17:04 +0530
Message-ID: <20250131174704.12501-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
---
 Documentation/gpu/vgaarbiter.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/gpu/vgaarbiter.rst b/Documentation/gpu/vgaarbiter.rst
index bde3c0afb059..d1e953712cc2 100644
--- a/Documentation/gpu/vgaarbiter.rst
+++ b/Documentation/gpu/vgaarbiter.rst
@@ -11,9 +11,9 @@ Section 7, Legacy Devices.
 
 The Resource Access Control (RAC) module inside the X server [0] existed for
 the legacy VGA arbitration task (besides other bus management tasks) when more
-than one legacy device co-exists on the same machine. But the problem happens
+than one legacy device co-exist on the same machine. But the problem happens
 when these devices are trying to be accessed by different userspace clients
-(e.g. two server in parallel). Their address assignments conflict. Moreover,
+(e.g. two servers in parallel). Their address assignments conflict. Moreover,
 ideally, being a userspace application, it is not the role of the X server to
 control bus resources. Therefore an arbitration scheme outside of the X server
 is needed to control the sharing of these resources. This document introduces
@@ -106,7 +106,7 @@ In-kernel interface
 libpciaccess
 ------------
 
-To use the vga arbiter char device it was implemented an API inside the
+To use the vga arbiter char device, an API was implemented inside the
 libpciaccess library. One field was added to struct pci_device (each device
 on the system)::
 
-- 
2.47.1

