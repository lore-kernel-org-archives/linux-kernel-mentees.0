Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB641642B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  2 Oct 2024 03:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727840314; cv=none; b=mSasEvkTOFLfps0Y8TpW/YoFhbDhC2SWUtXHRhj8djuKvIJTR14LklXrkDevEZWq/A6gGZXhIETVLjEqVp21AKMxcMb58PDAIOA9WNhgbDn+nzmjUU4kB3xXN5tRFK/qdPBfWYh7O/terJJKrdjIrG4+ENjD+t6RmbbsGboAtbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727840314; c=relaxed/simple;
	bh=ubntFyn+U170UHY/EMBXcg7nDyc7ap8EztnP7A+f/oI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YCxowBHypxiZTPsQUYnwc72tNq++8oR/H5blkHkPk7wqkCfArA3Sd6ayfmHRKCyQ3cARaRLQWaMke498LfdTXsOJulX6EVZEM3w2X3SdWhfkMVgYUGu2e+DcnAqK3jvxA7BAoj4W6WSHaYZiEgByi456RWaEnG47KyhGFAl1JiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QYOSzB6E; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QYOSzB6E"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2A82405DD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  2 Oct 2024 03:38:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mLdVO0o9HK_l for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Oct 2024 03:38:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::f2a; helo=mail-qv1-xf2a.google.com; envelope-from=lanzano.alex@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7F866405DC
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F866405DC
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QYOSzB6E
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7F866405DC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  2 Oct 2024 03:38:30 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-6cb3cbc28deso53824106d6.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 01 Oct 2024 20:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727840310; x=1728445110; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iUOKiBUXnpsFTZ5jMqyjR0K9mCXZ+ssrPBDzZNi8o+w=;
        b=QYOSzB6EXuyeKq+aKg+F3fxAvgr69Vv8XTVacQEkzT7fvz9Z2LFy7LeFkfET0WwI8r
         /E2GqNptgt4H0ozXmxhWwMXd1Eu7sQTpYQQ5hfLI8XT7K67KO4cYFeDpXBfLDCmkiLqZ
         xcyUtPZqd46372wmDLvEQvy+0nGREL5hGdblcyASP2W5NiyUpXvSgN8k0/uV/0T3UjjF
         yAmjtUVA0/ZlzrwT1jGiuBUJujWGUoOKCAANttX59T5iZJuXqbqNXz9uhJISyf7BEteb
         b/CWt3/05anpLkb0YI0a3Jzdh9qxrlhTT7Izh39H59b/3HX+nxdQxezh0hdEUA/YQPFL
         UE2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727840310; x=1728445110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iUOKiBUXnpsFTZ5jMqyjR0K9mCXZ+ssrPBDzZNi8o+w=;
        b=oldXyK/YT6zyrePpaJqSVXPLrl62mrgS1X5TO1ZW1lfnfQ6uxStgdAM5ty0VrDQ3Pl
         QBILCk8YiW2iEIUUJzmiD6T6YxIAqmfZaTEaoqhMvUFIzGtxrR4iq/EVg4WgXFlGe5Bk
         pXeGqb/Yeli9YJyhvYzqz4+nzibG0gBdF63jqJoIxQCVZ0EnEm83v83bYgIecqAajgun
         ESB/GpijUZXQ5hInAMijOhUOr2+U5oBSR2yNpyXJLBmjvDxzAJWsudYb6bCJnlmmBHoX
         gfXYrVk9o/mycbbAj92hMCufBAZs6I6hz+TfX65uQNDuuAboBE2VkbRy6QIuWedRh66K
         jJbA==
X-Forwarded-Encrypted: i=1; AJvYcCWitzDk+nYm/CBq81NOq79M8KTl3T38zoYQDSuAp6UdFaWO2xbHatQf3AMmaj4zZ/MxVVa3h3WVoD6I+Z5adw06K7PLtA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwA3pnsxjuGmbyPP6Ii3/6wSi2s64LVP3oHxANKKZV6ai/5y1CN
	KiHjBBtZdYclEZtX03fA32uIvS9+oCUkyZTPTABjuYCWcLzfssyZitNozTIS
X-Google-Smtp-Source: AGHT+IFB3Rfsz3+Lfr4kTvzv/Vj1epWm/jyj0EIrItSKQRLruClkbfn6m+DM4X6WPN4Ew4cmQ35Y1A==
X-Received: by 2002:a05:6214:41a0:b0:6cb:3a7b:96b9 with SMTP id 6a1803df08f44-6cb81a05676mr22602866d6.15.1727840309742;
        Tue, 01 Oct 2024 20:38:29 -0700 (PDT)
Received: from localhost.localdomain (ool-1826d901.dyn.optonline.net. [24.38.217.1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b62d9e6sm55640446d6.69.2024.10.01.20.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 20:38:28 -0700 (PDT)
From: Alex Lanzano <lanzano.alex@gmail.com>
To: u.kleine-koenig@baylibre.com,
	Alex Lanzano <lanzano.alex@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: [PATCH v8 0/2] Add driver for Sharp Memory LCD
Date: Tue,  1 Oct 2024 23:37:35 -0400
Message-ID: <20241002033807.682177-1-lanzano.alex@gmail.com>
X-Mailer: git-send-email 2.46.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series add support for the monochrome Sharp Memory LCD
panels. This series is based off of the work done by Mehdi Djait.

References:
https://lore.kernel.org/dri-devel/71a9dbf4609dbba46026a31f60261830163a0b99.1701267411.git.mehdi.djait@bootlin.com/
https://www.sharpsde.com/fileadmin/products/Displays/2016_SDE_App_Note_for_Memory_LCD_programming_V1.3.pdf

Co-developed-by: Mehdi Djait <mehdi.djait@bootlin.com>
Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
Signed-off-by: Alex Lanzano <lanzano.alex@gmail.com>
---
Changes in v8:
- Addressed review comments from Uwe
    - Replace pwm_get_state with pwm_init_state
    - Use pwm_set_relative_duty_cycle instead of manually setting period and duty cycle

Changes in v7:
- Add Reviewed-by tag back to dt-binding patch

Changes in v6:
- Rebase off latest drm-misc-next
- Replace pwm_apply_state with pwm_apply_might_sleep

Changes in v5:
- Address minor style issues in sharp-memory.c

Changes in v4:
- Remove redundant dev_err

Changes in v3:
- Fix file path in MAINTAINERS file
- Address review comments
- Simplify mode selection based on match data instead of model

Changes in v2:
- Credited Mehdi Djait in commit messages
- Renamed sharp,sharp-memory.yaml to sharp,ls010b7dh04.yaml
- Using strings instead of int for vcom-mode in dt-binding
- Fixed indentation of binding example
- Removed binding header
- Removed extra whitespace in sharp-memory.c
- Fixed error handling in sharp-memory.c
- Added match data to of_device_id table to be in-sync with spi_device_id table
- Replaced redundant function with spi_get_device_match_data
- Sorted header files in sharp-memory.c
---

Alex Lanzano (2):
  dt-bindings: display: Add Sharp Memory LCD bindings
  drm/tiny: Add driver for Sharp Memory LCD

 .../bindings/display/sharp,ls010b7dh04.yaml   |  92 +++
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/tiny/Kconfig                  |  20 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/sharp-memory.c           | 681 ++++++++++++++++++
 5 files changed, 800 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sharp,ls010b7dh04.yaml
 create mode 100644 drivers/gpu/drm/tiny/sharp-memory.c

-- 
2.46.2

