Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230B1213244
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 20 Feb 2025 16:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740070215; cv=none; b=JhZC9mWgP8WrvhuKU3qjKv1FCFphwKd5x1BuT3czanMM32ijdzlPfEI+hdKQkQj3Rn5XWGpgkwf6QD0ZPuPEf4Brc/lJJj0JDvv0iYMh1xzf+B9/ihauA7+nEBQn+97htW9kuOAppggspgryT/N+euSgu3vrjUw3SE3otqbs9Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740070215; c=relaxed/simple;
	bh=efaP8RPJNTtPf2+MD0d2dGXodyx0d/UHarGAgn6cO44=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PAnPBn6hhTwPYGKHdl6KxZHB/uZVuh6mzUYS7eJRAsoF5BDqRCZ2iskWZ/zO18N2di1QNoegI9p6akja+n2d9Pby43Vyh7HXMyHNC1CRgCHFCKoqyJZ9I75XVUHWJXm1Qulf7QJAfK+cCbASeBHRfeDPYUP7qNl71KKwBGt/uA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tt+4oDJv; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tt+4oDJv"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-220bfdfb3f4so25616855ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 20 Feb 2025 08:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740070213; x=1740675013; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3DmhWr2QmVyeGuDS1oXG9gsaDbVa/o2rG7jKNkrjMRs=;
        b=Tt+4oDJvm9zSDiAdijqcmfVvG+BbomyzCQw/l6CdKsWmzk0EGB4T0h6Y2kvK34L06K
         NMW2ai/3/4lJjk3184RSykyMwDLBtRZSMcnlZUDbcZDmUWDP1uAtUrU5d7p5INX67kA2
         Yv0fcdKJn2QnosCoFkYFZqt4iUIZGDkPq6o50MPd18LTW3216HE2G8nLPyRnNf9+k1OO
         xZlfPdTpjmO3dcDlSj3NqsdT+sJykSCApaBa6mXDdCztJVTwdkUB8+M9CVu9U9kPAtC+
         nVPVelRpJ+TfqSjuAilYqHXHFPp2TQRxzpsFekZjzGuGeJRGzCuzaG3vOMtTz2KUWvhX
         ArmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740070213; x=1740675013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3DmhWr2QmVyeGuDS1oXG9gsaDbVa/o2rG7jKNkrjMRs=;
        b=TpaWVNJYz7A0jJzek0eWDgIyPNooUM036mK53f5+YD0UfwwwHdpkem8hZXeov15Jak
         nvfGagVlzOIDBGx8xA3wPQy7vmAEAZjvY1Uv056Rf2h6K+7ce28J1+naJTI3fSRJNYOD
         F6Pe7NbTuwq9aYRWf0oEfxiFrgAZ7WqZEGk+z1rV4GTsuuuWyHgEfmeCGVq2PjZFTIMj
         +7ymRFx3KWU/3ali32nnElLiOqSCLerzfqDWuDqAS1Uz5qWCISJ6BP+OFosULifQvFtc
         lN6zIqrFPwr89E7hpTWim/YgZ2KPtyM3fP4/zC85s5IfiktiSrTkdieqVIliIGXSbr6D
         rtzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSwoKj9xeBoTMqmvXHOMTH4kpzO9PWah/pbjTAuyUzaqxEwwYuDluvisSU7+nCuq6QnjTOMgdiHgcY5yKPCjd7sUysRQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwxCroW4TtmxoJI3xODeg9YOk0t6YuVhrf4pCEiktcIl+lecKJ+
	pCA4zKWWG/9Wt+f7qvJkWTViCfD7dBv9k06MxETA2nQYVQKSo3mJ
X-Gm-Gg: ASbGncsxUKJZJBmg+nP56HlGEm8KKzkpa5ac/as7I4BWwvzFtuKUPpSk9opycpYhWjW
	Eefa0NeTkCB5NhUEltqnMEC0cy2aV14QqFtwQKjDn0kHuufGSffDYYDr5ZGVCxxsXMNLX/2owGG
	GX8YAiR8gYTNSZPNeiKZWcsO/mEtfMOsPyWuUG+aZld04fQhF4i3qrg5xkMtih3oupaWYCESYJD
	msRhQjDvgV1lHdNE1GmSkmSp9TNkJ90+CMAf74ypGYjDAjMLgKNYw788v5gbC13ulUV+rrlgzSk
	3tEpggVzHTWHA3U4jZjtJIy2PG1FGbdNmOwK
X-Google-Smtp-Source: AGHT+IEZEJ5Vx0cDfop6Q20EF8DsuK+QyG7/1ZeIrNw7H+oUSeWhjSyHlDH+GyEOp57VhYxnE3uFtg==
X-Received: by 2002:a17:902:d2c2:b0:215:5625:885b with SMTP id d9443c01a7336-221711c2866mr129989005ad.52.1740070213205;
        Thu, 20 Feb 2025 08:50:13 -0800 (PST)
Received: from localhost.localdomain ([106.207.145.213])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73266fd6438sm10619451b3a.142.2025.02.20.08.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 08:50:12 -0800 (PST)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	corbet@lwn.net
Cc: dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	bagasdotme@gmail.com,
	skhan@linuxfoundation.org,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH] vgaarbiter: documentation grammar correction 
Date: Thu, 20 Feb 2025 22:19:46 +0530
Message-ID: <20250220164946.18007-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Corrects the following grammatical issues in the VGA Arbiter documentation:
- Fixes subject-verb agreement by changing "co-exists" to "co-exist"
- Corrects pluralization by changing "server" to "servers"
- Improves sentence structure for clarity

Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
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

