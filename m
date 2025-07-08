Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B66298CDC
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  8 Jul 2025 07:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751960349; cv=none; b=VnQ4JWBrRzXsRYrmZ3n1otxQCpepfzMjcTayvRII2S34ROoikLWKAXhbPno6bdYZB2bLiXqcJaBSnqwSLnrRONSRC0d3OijGpLReoewx4G1qDnGodyHaKRADbt9IBApg29DzxxN/Gvrg+npMOq+PAjzP23aDCY4gUnKwEb1U1n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751960349; c=relaxed/simple;
	bh=wypA2EBmpHp+y/b2ODxhiTcNbDIFZEPcjrmQqxW5FIA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GD0rS/PD0w4Z1G579prTlQT7ELfhL98i5Pk3OzOWQrlpdPJvOB+tQ4NoxSQ+bWz8aPOD18dNGFrh+K4hgviMOYrNO6beY+Om8ttxrx1niDohbXWJXfEvmhLGhMZOXZIlVBkJMnTqQ8Hvfk/kHko5VDt8he4bp06taMkpufz86Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=dukyhvIa; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="dukyhvIa"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b3220c39cffso4010442a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 08 Jul 2025 00:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1751960347; x=1752565147; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZN7aSjUU2m/lgLen2skU4S+C9lHA5hU+Z1BWGyIcRGk=;
        b=dukyhvIaZ7Uzlm7nlz9FfjVrrAGL33caglEQFr/itVk3chx9mqW7Bye546GkMqc3/n
         WiCpmKHv19b/sWQr2cN1clvlnDAqJOGDzef1yqSrtzt6Xyc2gMWCMwoUba7fUHSvGXJI
         ikp5s4Vpv+pQ3Yl8EAUmJc24QyGRUSvNyal5PHGiMR+qBsA5JDb67Vj0YMEAf928xQ+p
         Ah8PmEnDjFb/rl71McQdoVAms+iXWZtUoQHtG+oI/mu96aeAYCHPXmaBcTnmjRAtbFmN
         v5eSspps2ZvpuENke0OCR9ymaSkLr+vanPiHzNXbrh0RW4jThMn0HjddC3ktMfwOUiMS
         zibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751960347; x=1752565147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZN7aSjUU2m/lgLen2skU4S+C9lHA5hU+Z1BWGyIcRGk=;
        b=rVXCxYR2cjmTTp1IvTcNtRYaeqFO8kAN8XL4ik9YXnghpY5uu1+5HBnEY8jW8zahBj
         bcL8nNKzKidOrWMpb7vAu7cUuPeiD8VV1Oh0wYMno6tzCBwBujhNm93dH+74dnNJr7f1
         zAu9zVeh2tyIcvDH+j2I65E0f72n/x4pL6vfz25CoBz1k64IG9XvG0bO8JshbsrQfMeD
         E3WYwlF0u3lPZ3fH69Mw+J8QmOGYMsAre+SJJdpwUjTXYYbG5gs8CAj5x4sEe4Jc8Yff
         +Ppuqwk5o2HlbwfNoo+oF0PpW6dhw9votypvNyZrQoDyW9hN6R6KQcdODFliuNIxgMy/
         Ol0Q==
X-Forwarded-Encrypted: i=1; AJvYcCU3THozsxkRkksd2Omm74l7CekFaaYBsmKxKwvRBwiAFU4QOy55+I7A6Q72Lj4JJQBECv226mbOat8eE8696UOmlW9/vQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwkTGfMElggF+3LJxBRVExIBzjEo4xHDLpXUinZ+0OGS3L5tWD4
	BI4ac5/NQH/oWVaeesy+nWaAsVCMXsnw4IqIwhBOD7x2n9+U2xjZIFsK2a3IqVtys5SROzTjsWw
	2Gi1SF+nHXg==
X-Gm-Gg: ASbGnctGtBg1TDaqOGC2Zhbfj+hog8HDkTVW8+Fqgrg7K5+PajmOjcfPUIYocOM8M22
	K4M3pc+o3ESdA1XlidbbnTIC4M4tBww7LF4bwiDoboUVh7nl4ULDdgb2pdVUPITSxNmD18cv7g6
	2gGcFI35mS3vqsATpiJF0I68DBWw3VnNS6rJOSwWfZfZRwmAKdaS2wqOzhoDy/s9lK9gIiNn/bJ
	RxLy6LF3HtsBPpN+WznG6ZqnaX4nNF83iIJ+fYsHfHPK2SwQ4S0bNfv4YypZjUaZ5hoSeyViDVz
	1I++tgTU1Qimy51lLR8fitD5TeGm7pcRYHqWBgCNC3PcHRanTQ8nbYIDGDVdDM95Ku4k4BUmoia
	/fqhKU26bKUGE1fWbIg==
X-Google-Smtp-Source: AGHT+IGcYNPUjs2kwjkvmFdGShMU4syGWz/FE+DbOGjtHhPQiV8ZsbgVj6QjspJrmZqOo3MkvanzoA==
X-Received: by 2002:a05:6a20:e687:b0:21f:cdfa:120e with SMTP id adf61e73a8af0-2260c839353mr26223435637.30.1751960347004;
        Tue, 08 Jul 2025 00:39:07 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce42a540bsm11633523b3a.140.2025.07.08.00.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 00:39:06 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: dianders@chromium.org,
	tejasvipin76@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v2 0/3] drm: docs: Remove deprecated MIPI DSI macro
Date: Tue,  8 Jul 2025 01:38:57 -0600
Message-ID: <20250708073901.90027-1-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
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

The first patch of the series removes the last remaining references to
mipi_dsi_generic_write_seq() in the jdi-lpm102a188a driver and updates
the driver to use the undeprecated _multi variants of MIPI functions.
Any behavioral modification to the jdi lpm102a188a panel driver by this
series is unintentional.

changes to v2:
 - Remove all usages of deprecated MIPI functions from jdi-lpm102a188a
   driver instead of just mipi_dsi_generic_write_seq().
 - Update TODO item in drm documentation instead of removing it
   entirely.

Brigham Campbell (3):
  drm/panel: jdi-lpm102a188a: Update deprecated MIPI function calls
  Remove unused MIPI write seq and chatty functions
  drm: docs: Update task from drm TODO list

 Documentation/gpu/todo.rst                    |  26 +--
 drivers/gpu/drm/drm_mipi_dsi.c                |  34 +---
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 150 +++++++-----------
 include/drm/drm_mipi_dsi.h                    |  23 ---
 4 files changed, 71 insertions(+), 162 deletions(-)


Link: https://lore.kernel.org/lkml/20250707075659.75810-1-me@brighamcampbell.com/
base-commit: e33f256dbc293a1a3a31f18d56f659e7a27a491a
-- 
2.49.0

