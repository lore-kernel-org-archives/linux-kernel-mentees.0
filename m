Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D545F21E3C3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 15 Oct 2024 23:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729033601; cv=none; b=KiCrznChjbXOnlHEONcRZtguxKcH76l8tONbGgKay30b9Zth7mXEdVY5vwAYRD5BB62QLFeD/uYRvt/Ewz42nJ5bZF6t0k2xVLlhDTI+H+JoOkOeG8zhRJpCwTfjz52xACJdZ0eLr8xDVcvL5qUh9LyGWRwlYwHcqRrHSs3slc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729033601; c=relaxed/simple;
	bh=c1cFwrRSKEj8jKOSk9WgJ/l04JHjabgqH6wMKYWXjGg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=shPRxsB37IEhUvlRnFD05dzdf/Fpkb+UM5r0/Q9Zhe/ii0oiv3eWgQH7BFiON3iqX+d4sWq5XV/IfvF+YK8CZwsUG/xdAg0PkruahVCUlf4c9joRZ24HvD7oY4pz7N/WxNWzbTUUNJ7c06TnTBlooZFhWjsuqMMPeeI8F2J/aDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f2V2Epou; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f2V2Epou"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69B0B40399
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 15 Oct 2024 23:06:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QM32YApklb5c for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Oct 2024 23:06:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::829; helo=mail-qt1-x829.google.com; envelope-from=lanzano.alex@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5E25140144
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E25140144
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=f2V2Epou
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5E25140144
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 15 Oct 2024 23:06:33 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-460634ac984so25759411cf.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 15 Oct 2024 16:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729033592; x=1729638392; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BfFZUPp0XV4kx5ltz6qNvKwXCzwJIgOrmeDZF/8jtLo=;
        b=f2V2Epou53XrgKkDk7cKB2JwgjIVT3Jk92sUoC0LE64V4Bt8sa47VjZcB31wyVwV22
         5JvGab8uo4PJPsM9OJ09cPWUKZrQpLVH098twJYk2hGhrat8rhdgH4pp0YKV+LjMYnsQ
         uUhJJssk/PwKkyjd+/DeG0nh/5aCIzCUeN9446zWat6fGyWwHGzye5uULt5YVtNgrvTE
         aAWrLar0ZzV+fVMeAw+X5+A7hf6julxTbcm9fnY2Ah65qG+h2QtreWqkkIOEq/w9y1V2
         6FcpJVgZlPiLsL0c+YhA69IRIftq50pAIZISHxZszOxfB7L+A9VKJIbaxMxhCULxbGi3
         u7XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729033592; x=1729638392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BfFZUPp0XV4kx5ltz6qNvKwXCzwJIgOrmeDZF/8jtLo=;
        b=RIrvSnJPEU87jTeZPF20HAXuoSE/PnBgyatXLFArWc4rp7ZJZZQ3ssCSR6MXq3qVPr
         +GqiwepTkntYiFQpsVZBTxYUdqKiUrM46FSNK4hs6ibTxe8fk3PFgLtqoeO3xFVqL0E2
         tLjcUcX1T5hNGmddj2iQvcoXcUFpA5V72j/RX8nHxOZ8JrpD8EjP5OD5M1Kf3ZbOD7xf
         1X36FPtRTNHut6HRwA4Eb5faVOp8xYQlq0Kjrc5scov3G/aJoZc+8qrvKAAZ2zP9fujX
         5MqxU6mEuCTPtNlrtlOkr1g0qSPZpUY1099gVeUaQhobwE2s2e3dXvKYi/wVeiPeDEVu
         yYYQ==
X-Gm-Message-State: AOJu0YxudRHWR8Kx/asknmhgzkSOWzCqVVcKM3pHS6/YFTmfI2vJxPFL
	56JpyHP4GV7l5DK8F5rbnD3tN0WXmyq9k0NB/Wb9nM6ijqU50xOT
X-Google-Smtp-Source: AGHT+IHQmnfERjVbgde4xoS7Xg3Nee7eeqn8iqFraPmTdAJTJEW9Gmg9baMjNSv4pjmJ+IhQhYfR1A==
X-Received: by 2002:a05:622a:1aa6:b0:458:34df:1e6a with SMTP id d75a77b69052e-4608a515378mr29032821cf.48.1729033591775;
        Tue, 15 Oct 2024 16:06:31 -0700 (PDT)
Received: from localhost.localdomain (ool-1826d901.dyn.optonline.net. [24.38.217.1])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4607b0e407esm11224641cf.27.2024.10.15.16.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 16:06:30 -0700 (PDT)
From: Alex Lanzano <lanzano.alex@gmail.com>
To: u.kleine-koenig@baylibre.com,
	Alex Lanzano <lanzano.alex@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Javier Martinez Canillas <javierm@redhat.com>,
	=?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
	David Lechner <david@lechnology.com>,
	Mehdi Djait <mehdi.djait@bootlin.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: [PATCH v11 0/2] Add driver for Sharp Memory LCD
Date: Tue, 15 Oct 2024 19:05:42 -0400
Message-ID: <20241015230617.3020230-1-lanzano.alex@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Changes in v11:
- Replace drm_fbdev_dma_setup with new drm_client_setup interface

Changes in v10:
- Address comments from from Uwe
    - Replaced -EINVAL with PTR_ERR
    - Error check pwm_apply_might_sleep function
    - Remove redundant error message

Changes in v9:
- Move pwm and software VCOM generation to probe/remove functions instead of crtc enable/disable functions.
  pwd_disable will suffice on driver removal.
- Change comment format to match Linux Kernel style.

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
 drivers/gpu/drm/tiny/Kconfig                  |  21 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/sharp-memory.c           | 671 ++++++++++++++++++
 5 files changed, 791 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sharp,ls010b7dh04.yaml
 create mode 100644 drivers/gpu/drm/tiny/sharp-memory.c

-- 
2.47.0

