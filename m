Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41CD2248BE
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 19 Jul 2025 08:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752913625; cv=none; b=GM5V4PBthjiWFeCwVgnATM1Ldp8k+hy0It8jvfiJFydVLbe9Tl9FAuLpqPvEAmBDhcegEcL9McY7t2M/Z8te6Zf2aNHG21EAVhnR+GdVzibERUV8dkfk+d9h6yDiPKOreTQN0/IQwGx5/VbBFK3qVG8BpL67MB9FNgLzCNGLApc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752913625; c=relaxed/simple;
	bh=P22GETLL8XCTAG82w5KLzdw5PA4pQl85CxmaEqGA3PE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KZuuciwXoJGMGuJv0IA4z+zoGtf7/TqyHV7Qw/3mAInyodWHw7vRTgizIIpLST+LvtVaowkcx3bp9Brdz83kznCXlpt9NwqShDKWrn62o5P2OqFozvmJmqL87fxGSPlbpucMR3V/+QbGBtUWEcuvRkygUCnADpdjKWEsz0wnn8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=nWlnuRXI; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="nWlnuRXI"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-74b54cead6cso1911239b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 19 Jul 2025 01:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1752913622; x=1753518422; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EPId7hlRtak29cJpHNdXMRMJJGzWtgzI1RuZFg9RVGU=;
        b=nWlnuRXIPZ/5D9H3QtzhegaIme1EsK20DMkUzf/HFXOdcqUUlFoonqDdRNQX8cv+9w
         0IBTPjC6vhg6HK+MGYGnNdTox0zUGN19rdEabp27t9UUfViSmXfX0qAXY3ngorBWt9pg
         zvLVbZU1E2Ip4T3doG4CEaxnrREbxbttsh5+hRoGxjGUQ6tWuWg07Z8HuBO1VGt1PkY9
         FU7OCjeLXT9nyOv+Wl40VeTF2JvsjVwoxsRBpQX/+xPGOkRHg3VRTnriVMAfJnXw2n28
         2W2Zm2sg+9AsVWqVnp9DUlz6X8UZqeij1/CksuvlGEo92Qoq9G66BGJxGsGDHMKTKHSl
         rocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752913622; x=1753518422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EPId7hlRtak29cJpHNdXMRMJJGzWtgzI1RuZFg9RVGU=;
        b=AiPIUmcoUgDn/y10rkEE+j8eWcoQnY6oe7GsqucwyCqsJzSrCZtbTzwuo+3tgEV+e7
         BBWAZ0aBqaN1ngo6r+xBvL+TWNlWQiuAueXszarul7+j2Bb9TKZZy9+b0u5NSSx/Tfbp
         VYdM538s6WvZKm4fPJLsK3BNrDxeCaCjwtKvToJajTG9ICUqD9BtmfzLihPqIsrxh2E4
         ATVptAzmPPxinxEGKLRVSpeUBQ7MLqvJkinaNXU8VOBTG7W4k0bL4CsWlhk93iYyL/cl
         rMKBB9Vzd1mx/vRHpH27lgqI87c1EVBzKysbWxI8A9xbibs/09TmdNhVJT59aNsXoHNb
         TyJg==
X-Forwarded-Encrypted: i=1; AJvYcCXIyz4yfcVzhYJXmvN0eiFNIXrbFOPFKgeDwf4WH2x3U5+3I4S7RtEiFGKpSLmjdySvuby/ASkgHnpHcSSW1bkJVhZXfA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzz1TxyiHF+ei5dMJATcSvIZH+M71+wKJ/fnt9DEHp9bpCdioqY
	VsHnRdfIicCYw+8pUoDmfgxtB+rKUpno4Nd98I6Bqrv8/DH94Q18GTGXra9RH/qxgZs=
X-Gm-Gg: ASbGncvbk0bD71oVzzEbmWr9YsFTs8YsCW71OnE3Gw0faqDUWrXUUAyDMgP7Gznw/4/
	vUeJjy0duge6RFce6vbd+z+mqEZYjzmeYT+0F6bnCr0jF+JJuuQwJ13au2kfKd8e7xJtQ5klY/Z
	lIkwmEeYAjLehhQX6pILQLJ0sQuK/lzOC9VwcYQ4ra73B75w4FlS+TH+qoNJtK6ymj5+24c+oz7
	ZIE4ENr0fdg/WdFN/W4mS++e80ud3Vrpl2ZY+1eKtn7VfF+NPPdBuj7m1MTWfUY7gfBLWgelT78
	NsttMAiB6R25DPOBR+9IyC7+os8LgMfz3Qap9ipb/sUSHn8LodbzsKZUSUScaoGcw9B/NtR849j
	r+QslQq87db6JqtMna+mqJtg6AFacLRvjBNdrzMr3rvHiAaF9RQ==
X-Google-Smtp-Source: AGHT+IEzBjqgE2BlaLz1oOWFjBrHioQyEDfCtdHE+F0FDfd8OvpCDexvgvzMEwrHYyRAhMYVJmlFCA==
X-Received: by 2002:a05:6a00:3a11:b0:736:51ab:7aed with SMTP id d2e1a72fcca58-75724180944mr17224932b3a.16.1752913621977;
        Sat, 19 Jul 2025 01:27:01 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb157635sm2475260b3a.83.2025.07.19.01.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 01:27:01 -0700 (PDT)
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
Subject: [PATCH v5 0/4] drm: Fix bug in panel driver, update MIPI support macros
Date: Sat, 19 Jul 2025 02:26:34 -0600
Message-ID: <20250719082639.307545-1-me@brighamcampbell.com>
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
 drivers/gpu/drm/drm_mipi_dsi.c                |  82 +++++---
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 196 ++++++------------
 include/drm/drm_mipi_dsi.h                    | 112 ++++++++--
 4 files changed, 210 insertions(+), 202 deletions(-)

v4: https://lore.kernel.org/all/20250717164053.284969-1-me@brighamcampbell.com/
v3: https://lore.kernel.org/all/20250717065757.246122-1-me@brighamcampbell.com/
v2: https://lore.kernel.org/all/20250708073901.90027-1-me@brighamcampbell.com/
v1: https://lore.kernel.org/all/20250707075659.75810-1-me@brighamcampbell.com/

base-commit: ca2a6abdaee43808034cdb218428d2ed85fd3db8

May you all have a wonderful weekend. I'll be riding my motorcycle up
Logan Canyon.
-- 
2.50.1

