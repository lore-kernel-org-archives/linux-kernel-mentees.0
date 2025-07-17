Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51C6145348
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 17 Jul 2025 16:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752770500; cv=none; b=lt8UG0bv8r/hC+plVcrB7sapNBvB0VdWXdrxfxFAC58KfcJ8oevhEheOCDVstRBhXfn5ZuBuIqwJxxiclSAAjzz7gt9Swxj2HMLRtrAyacGLTbw+802TtPJWIfFLrUEQOfolTVXqIMvA+es68E3HirPzXEEBGPp9RYco1U7SOU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752770500; c=relaxed/simple;
	bh=pPXx5Kxdptb3GobS6onHLMsPrJKy1RvezPijhN9+wfs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AnBDYla6y/oMSbySwRGkUoaaEJGNcPvX6lGn6PH/738mTf0/EZkUgGbMEdcpZR2nntQZ8GyQ14DHzOUxn4ysCVRRSgN6qE9aMgQ++05jJi9YJ/tY645vQCGOZDnbq/XYVWf4crkBxYkWnDT58nj7gLuAbZ5Ry8G5IQbH0xMswRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=FiLby5zC; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="FiLby5zC"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b31c84b8052so1224038a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 17 Jul 2025 09:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1752770497; x=1753375297; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8zaVonVNWKr3b0dyGZR9LCJexaagL6PKA2t2eXcHfTo=;
        b=FiLby5zChmZU7E3H87jjjZzyZdKOKMfWvXAmueP4vuZ0a7GdU2XlTgjhikKyZVKlEN
         KC5yyBIUqcOlxwHlp4PzJbhWk65MvvNKygM+A5mcLq2EWTjFTK9/iikoJPvdi/QVaO1S
         NdrD8mPiRjSMT+fDSNJGvHSMDJeWvsj5LXzwgyJnlYG0/EuTes4/wAA6utUM//DrD6k4
         iVRrsO7+3gja7/qyRnOdo1q8Z75+QWDv19G06KKud1GA0pelP1/+289LU5UwPkP8AM/M
         8NuEvKwstCnuXLz428EwWiDHayNy36fz21c/rw/J2mQ6cekjHvm2/tzG0a+2ntHCCpnx
         UThA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752770497; x=1753375297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8zaVonVNWKr3b0dyGZR9LCJexaagL6PKA2t2eXcHfTo=;
        b=Nb5R3sXE0JC/KfNm9GCjzcEEfI2iJOMGnZxFjs1rwbYbEUNowohEB5mzNf7ctqyHIK
         5GwwQ3gNDJzXztJ48EtVOFWT+KGjbM7bAr7pL+BPB/x1Uukmw6WDGUmp4NVkffUkeGjA
         zY5S4IYthHdqJAfwM5qL+vWutJbNGrpoQ5p1J8RjdADl0z8OJEjSB1DhbYHhoHizgrTZ
         wZGlDL0PM1LJYB71/c7bIAqK6krS/cPLFbcjACqQ7ARI3ByZ1e44TN6j8mT60NaF+Gyj
         ZaT6/CF7mZuM6c89IZMgEcHYQXA5i3fuMLFyeyemOjaL5ZKbpP1tIDbasaqdny+uQ8NX
         Vdtw==
X-Forwarded-Encrypted: i=1; AJvYcCWwE0G9KJe02tisJwlvfI5vyxxFrZACeBaNG6LkgDK1M2aly0DY7MWaFGhQEsT1Cl9GLs9UQn5EktR116ChUCpz1l1qMw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwXhE4P49vMQNNqnmSTPioT6yIa0Gqan1erk0eMzM/Q0QPMz03M
	7QgSIgzaiytV7QuD23CKAgSHCiYmx5XCne3waVjoNL8UkbQi8IPJ10r3eIsV/oXqxGE=
X-Gm-Gg: ASbGnctjQTraeUMffDssx8enisnhYQswwUTPLVVYdpbbVyarpj743cQwNxO92XRflwL
	Tk3bT2OaIt0uY8PrkObCacFdS9Cy/xteajI8GekR+0iF79b8wJrHhUECI11a2zahdlne+bh3QPs
	VGyHJt0+LsVsHpRpm0kSaUqkKBADxHIVRE6ssDHOG/PjbMQWlJLpeODJlO0E/blRJMuKa8Wn/Nh
	SZgLTIxPzjbvjyjtHx2AJXqpu/EhJQBossglz2ekZ9sf+BJ0qsvxLsB3GxKE3WNPOa+8Ur1C7UU
	Ke8v+8v1nfW9gREfkYogk50hW2QT278X3v2hIxCukEzwapVtdaKhNsMhJBpfIFotw9LESMtJFWc
	DlQAJNVz04PfF5b9UZCGMN3BkhX+fs1W4HrwNA66jIu1jvzR5XA==
X-Google-Smtp-Source: AGHT+IHnWxMFl+xdFfhd6iN1u48GSI5UYMmS7BfoELEh5F4oPsMjJBqSiWUBF1GSB6ivy5k7UULcDQ==
X-Received: by 2002:a17:90b:390f:b0:313:1e60:584d with SMTP id 98e67ed59e1d1-31caf844db3mr5977675a91.11.1752770497172;
        Thu, 17 Jul 2025 09:41:37 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31caf7e8ae4sm1821750a91.24.2025.07.17.09.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 09:41:36 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: dianders@chromium.org,
	tejasvipin76@gmail.com,
	diogo.ivo@tecnico.ulisboa.pt,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v3 0/4] drm: Fix bug in panel driver, update MIPI support macros
Date: Thu, 17 Jul 2025 10:40:48 -0600
Message-ID: <20250717164053.284969-1-me@brighamcampbell.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes the unintuitive mipi_dsi_generic_write_seq() macro
and related mipi_dsi_generic_write_chatty() method from the drm
subsystem. This is in accordance with a TODO item from Douglas Anderson
in the drm subsystem documentation. Tejas Vipin (among others) has
largely spearheaded this effort up until now, converting MIPI panel
drivers one at a time.

The second patch of the series removes the last remaining references to
mipi_dsi_generic_write_seq() in the jdi-lpm102a188a driver and updates
the driver to use the undeprecated _multi variants of MIPI functions. It
fixes a bug in the driver's unprepare function and cleans up duplicated
code using the new mipi_dsi_dual macro introduced in the first patch.

changes to v4:
 - Fix whitespace (I forgot to run checkpatch. Thanks for your patience
   as I familiarize myself with the kernel development process)
 - Initialize mipi_dsi_multi_context struct

changes to v3:
 - Define new mipi_dsi_dual macro in drm_mipi_dsi.h to reduce code
   duplication.
 - Fix bug in lpm102a188a panel driver's unprepare function which causes
   it to return a nonsensical value.
 - Make lpm102a188a panel driver's unprepare function send "display off"
   and "enter sleep mode" commands to both serial interfaces regardless
   of whether an error occurred when sending the last command.

changes to v2:
 - Remove all usages of deprecated MIPI functions from jdi-lpm102a188a
   driver instead of just mipi_dsi_generic_write_seq().
 - Update TODO item in drm documentation instead of removing it
   entirely.

Brigham Campbell (4):
  drm: Create mipi_dsi_dual macro
  drm/panel: jdi-lpm102a188a: Fix bug and clean up driver
  drm: Remove unused MIPI write seq and chatty functions
  drm: docs: Update task from drm TODO list

 Documentation/gpu/todo.rst                    |  22 +-
 drivers/gpu/drm/drm_mipi_dsi.c                |  34 +--
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 197 ++++++------------
 include/drm/drm_mipi_dsi.h                    |  47 +++--
 4 files changed, 98 insertions(+), 202 deletions(-)

v3: https://lore.kernel.org/all/20250717065757.246122-1-me@brighamcampbell.com/
v2: https://lore.kernel.org/all/20250708073901.90027-1-me@brighamcampbell.com/
v1: https://lore.kernel.org/all/20250707075659.75810-1-me@brighamcampbell.com/

base-commit: 667efb341917bde19f5d7517b65defcdaed67c9e
-- 
2.50.1

