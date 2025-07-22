Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9488A19F115
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Jul 2025 01:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753149201; cv=none; b=nRaGNDYS0dX68+3bWftG/qmMIpgPUTuFV6bLWpsdP7SwWbIy32FjfdjWZANPoWW3M9IKT0DChvaUYCMRDEwgm2qtDOOu2zaE3ntphRp/KXXBhjvDDuTfmjPYmp4sig4JF95B/+W6svjbmnaFaOA/DDXrizhP7eJfLwYN09dALlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753149201; c=relaxed/simple;
	bh=PIlerTwii7wKspt/l05RAiot54ciwnajfn64bgA8Nkc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H76gKZ5EmRETm/odA4S7GuwzEyETpJv6Q/q5c7TNd7/JxCk9K1N+3j5WRuk+yhuXNy3aKsinCcthay2+8HWHYe/nUSCyugLKyPHB0gPPeJdbc51oqEFKAejlmP0A11pkPZQG5Ua8rwjTIVn3GoVSbSw3dzuOUqBAlu7OnT4gGyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=Z21gCa52; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="Z21gCa52"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-236377f00a1so40762205ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 21 Jul 2025 18:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1753149199; x=1753753999; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=02hyzrs3C6jwWph1NhtzQUl897VWViCvH01In3YsMDc=;
        b=Z21gCa521GWnCqR/J7wblljtMc5s0oBhlXPXaCzzMviMo6oejamnUVgbVZADcqHYaJ
         TclXTwg3FG4VRUXg1u+4Thbz0y0ECljdaj9tBkVGSmEdmwAJc+we6syr2X+fZXcG2CCy
         /8aOitCzkqfSoQCoBKKjst0IAE+LUV1mEeEsOxRwgqKZrXVO1gQlSQrSjKVFPpmSy2CR
         V4ULoAaJPFSus9B+nGiFKe9DXA2oiguZLOXSHY5WZEPM5JQBRpJ6m13lvYHo6pPRF746
         EvPNMYYu4pE3cY35eXgbyJiYVOUwBM+A24yTBRLocvfQ+505bFhBQ07u1Ct+q+EWiUl5
         RQkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753149199; x=1753753999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=02hyzrs3C6jwWph1NhtzQUl897VWViCvH01In3YsMDc=;
        b=xH4BotMX29TlvXl7SsYJs9IvQfrmhDLkrykVnzX3XgqQErb059PvmJVoevRc1mE/NQ
         VWjYi64TThiAQ3fKci41F2REEwbpOD4AML05BUpMyBBBFyKJQYTEP6Qq6U6HC3BZ7FZS
         XMn56dPRMPj065DSd8HcSYj5AqA5B/lTZ7IgdWHN5edKl0Tz9Cg/7VdJVO7oPpLocoQo
         uPSUzhDCFQwmwHv/kvUh3g5WpJeNaSeJMExfk6bRGdHFBm1VAbYcHmUAArD49kx4VZdc
         3sezm3ZNlcWTIxsJVhli0HB4p2VS30d4pU4tFPUcdnEaibimNqcbd/8DDTlYqhKTwEiL
         B+rQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNuTjaAGvtMpObKRBKk+TFfb54WDajFEh9eg1LUftMQ614no6xjXZucFhdFuPoot/0X6QJJU8VYn/8oua3oZ0S0cvTgQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxD8bVu7xBAmEZ1IppMFyLcenc5bDc9aQ6C1g9BRG3+34JMmO8y
	caLNdXBpbz01daZPNcNCQFiyIzX0iJTtVecucUB2lAeoeBQoY3o8Z6r7lOgeIvjeEaw=
X-Gm-Gg: ASbGncvBStOCpcohkzqIiCOHh3cgKIzQKJ4NK9YRDu7Djk6sZA3hCPW0kZIsN3VNw0t
	ctpHGky2nEDId6DrtgFITHEukengPkelsSE0TOdQKlv0DMNAsj+JTNiN+Y2YzqzSk1Fdn6m0ykb
	synZw2GCLN/St/MZA70pESptI9V7Ekn375u/8RhqzkOXNb92/xZNNkxLZCzFZUViX1e2sJAikr0
	bLS4TkMMxyqLDzeHI5Rt72VJLkJqIyLKHz9thev5cJRuhTYw1Y3aYGQiLVaOWxawDUjDPYshDo7
	utFy+z01QfJqYVxAENRBzTJ4fCSLTGNX3GSIVecCL1wHGH9wEaPAVB7ywd2cOKiOgx3mSX4zNlj
	MwDoVjqkzK6E/SKqyl4Swn+kPnDIdDHTsDT3JLh5fMs3IGwE/aQ==
X-Google-Smtp-Source: AGHT+IG+irLWOD78xwoAvbuOvZHdyLGDUiKL9Lg3uosSOKZjL28JHUt4/xMQ/877nSZppjATq3CYSA==
X-Received: by 2002:a17:902:f78a:b0:234:c549:da13 with SMTP id d9443c01a7336-23e24edaf41mr361519995ad.17.1753149198840;
        Mon, 21 Jul 2025 18:53:18 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2fe62d9fsm6017441a12.1.2025.07.21.18.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 18:53:18 -0700 (PDT)
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
Subject: [PATCH v6 0/4] drm: Fix bug in panel driver, update MIPI support macros
Date: Mon, 21 Jul 2025 19:53:07 -0600
Message-ID: <20250722015313.561966-1-me@brighamcampbell.com>
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
code using the new mipi_dsi_dual* macros introduced in the first patch.

changes to v6:
 - Fix various style and kerneldoc issues in patch 1/4
 - Fix typo mpi_dsi_dual... -> mipi_dsi_dual...
 - Fix incorrectly named "data" and "len" variables
 - Make _seq argument of mipi_dsi_dual_dcs_write_seq_multi macro
   variadic
 - Remove duplicate definition of mipi_dsi_dual_dcs_write_seq_multi
   macro from novatek display driver

changes to v5:
 - Rework mipi_dsi_dual to explicitly not support passing macros into
   _func and add "dual" variants of the generic and dcs write macros.
 - Make jdi-lpm102a188a use the new
   mipi_dsi_dual_generic_write_seq_multi macro.
 - Make local struct variable in jdi-lpm102a188a conform to reverse
   christmas tree order.

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
  drm: Create mipi_dsi_dual* macros
  drm/panel: jdi-lpm102a188a: Fix bug and clean up driver
  drm: Remove unused MIPI write seq and chatty functions
  drm: docs: Update task from drm TODO list

 Documentation/gpu/todo.rst                    |  22 +-
 drivers/gpu/drm/drm_mipi_dsi.c                |  82 +-
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 196 ++---
 drivers/gpu/drm/panel/panel-novatek-nt36523.c | 804 +++++++++---------
 include/drm/drm_mipi_dsi.h                    | 118 ++-
 5 files changed, 614 insertions(+), 608 deletions(-)


base-commit: ca2a6abdaee43808034cdb218428d2ed85fd3db8
-- 
2.50.1

