Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6771B58F09F
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 23 Sep 2026 22:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790202954; cv=none; b=bjp6StorAWVX19OEP05DuhaezHhvhMAAsa8GOX3W95zPAeMwh6165fmsZVQx7KTxh5dblyfYYmLEVyUqmj2miJeWUsAGoeeBUH6NB7wsfHqtpp0UvaEEaSZJuMfeezJ05x0r5cZpONRwJr3Vn/h1KPww26G4kUQ34sv8Cj/iUSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790202954; c=relaxed/simple;
	bh=jbncQFO8THehAlFqBfjAmwdcyvpJzFigEmUeUp4MnbE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oE/IQEqOXL7wLFcB7xIRXKjTH9WB4nrN0/zwSSleF49AzC1DGdFU8+YLbiM7xwlKGTbu4aW0JD3jt6VchTDyOX553LbwWs68gtLrG5UsJME6bEWivViBOtdNKx49W6EMOJds+3D2glijhndLzMOxKGCAAa2U8EcgREnJl+Lg8Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AZEDKjVp; arc=none smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AZEDKjVp"
Received: by mail-vs2-f43.google.com with SMTP id 71dfb90a1353d-5c7f7cc52efso613431e0c.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 23 Sep 2026 15:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790202948; x=1790807748; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bClm3tufwH8Z04BuQiDaCFYe0ZcBB/1uq3G9UCOaFoQ=;
        b=AZEDKjVpXgBBdnyZ/J0M7MkXfVdpaUzzE72BcwCgl1C1ASPd95NSjW1qcd13dZ3taK
         uBp/govlWq93G3YUFKYe9QwchdD+ZNma2q3BN9WknrjX0mUI5eF1zLSxidupqN/d54c+
         r+WCBAVqnyfmjolgFHjdNwlENzYrGrsU6f7qG0LQMG1d3srP3WrqwjDV3WNXZhplbQnS
         +Cz2axVtgzP/mwbRWH7JV+I13rs8ASVt4wuKB1B+p9/VBXcjnCjns/XzfG7BUn7b2gWE
         dYcb0Ej0CeRht/N/FgySw9I81DPis6Kczbzpy8HqhE3xQ07AaclxDoRS/8C9YUioV7FC
         ekdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790202948; x=1790807748;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bClm3tufwH8Z04BuQiDaCFYe0ZcBB/1uq3G9UCOaFoQ=;
        b=vMamZlkRjTypwbA9M0BbBRRYtAkreUmThJJwfc39xUQayTIKKkyzusdf0RZ9oNSzPa
         e86m2JjDLqTiVbOFoiZUu/uYAvd+i2c0fIdtF9q4YBJ0z2lSH21HOfJ/R8uooB0R1hhg
         i8SsUiLz1+5M0AcVw/xjsMq5q4zqG58gLu+nd6QNFuB5lOU/kPEaHxPX+SA7vDEuKfF+
         5vlCX9kAIRAzrQIgjDUTGbY+/KijuuLofe+BmmCubxwBKVYiYUpoDS2oH1zhbhAmzptL
         KWa14p9wAYgjH+rPGkmEnx+kKEblghOUyNo+7IUQKY+1d5xR10xiMTdxOEEqxVd03d4N
         REbA==
X-Forwarded-Encrypted: i=1; AKwUvByxHpaqqmE1Q1g9XLtCEbFqxnjlCo4clOiPE3Zec7TK7+eLq75aFyTYeHaffluF7PEFnVnDMWm36F43X/eG3LGo/QOZKQ==@lists.linux.dev
X-Gm-Message-State: AFuF++kkJXoa/hjGXoRx4nZSnCfM9/zMhVHL7l+DWRY45HS5BV8uCRsJ
	VYYNtZYMD8YTu8nGL1ucLnvXDb40DCIxoS6CTASpWCWd8iyF2FvHWxI=
X-Gm-Gg: AYBFou2tW+Bc8/zqe/XndcoWpeU2RpOjEH+QtfJFGy2S87s2+458py+u4tk0UehuFmG
	wn/igXESpH0X0NyMOOapDxXgphoJ5OPiWP6ycC8WT+Yl15loHIb3VTnWaQPX+vJYpwoj0h4mC4C
	4YvA8Z7+t4msVH8WbbGxZenYPFkjLSt6hf+jyGHojtQGRrl+b7DQLDAKgHQCjWLcDx7kjNf8KhR
	xZAkJ169SG0c5364C67IncJFue6vJruhqYKZXMzzSRjSsBpeTeE33UoH5ie1ND0mFbXQeTgwT5I
	OehV2AVAu63kEPG8NO4CS4z5Imv/IehORc/h8bBzPNE27CdeFWBODIMCUPAB/sqWpPyvRnMjzgY
	mBl7E9cLGV0Qj5hwiNIN9MgEgLaYjUkljHe393N5UVOXaYAfcBZ84XgUNZZwhmnpiP/P2FozCSQ
	uDuPJwZ1IoVvYl165hNZGAjJe4bVAOwh5UwC3IR25WYeOCcN9m6C6mMNh1WX+NKw1faxtU3ObrP
	JI0XgUBl2ge33pzGRNnvTA2rzMQkNhYamGdgfF2NRLEcvxQFQ==
X-Received: by 2002:a05:6122:29cb:b0:5c8:3870:ff73 with SMTP id 71dfb90a1353d-5cb09217726mr543120e0c.4.1790202948179;
        Wed, 23 Sep 2026 15:35:48 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f04fb621sm5162983e0c.9.2026.09.23.15.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 15:35:31 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Brigham Campbell <me@brighamcampbell.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v5 0/3] Add support for CH1115 Controller
Date: Wed, 23 Sep 2026 19:35:12 -0300
Message-ID: <cover.1790200427.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series add support for the CH1115 Controller [1].
It is a monochrome dot matrix OLED controller that supports several
interfaces such as SPI and I2C.

This driver only supports the I2C interface, but all common parts could
easily be put into a common file to be used with other interfaces.
I only have I2C to test with.

This is the first driver I write. The work is based on the driver
located at:
- drivers/gpu/drm/sitronix/st7571-i2c.c
- drivers/gpu/drm/sitronix/st7571.c

Tested with Raspberry Pi 3b+.

Changelog:

v5:
General:
 - Patch series based on 7.3-rc1
Driver:
 - Fixed KConfig dependencies (OF and BACKLIGHT_CLASS_DEVICE)
 - Initializing baclight with backlight_properties struct
 - Moved driver from drivers/gpu/drm/chipwealth to drivers/gpu/drm/tiny
 - Fixed allocation for hwbuf if width or height are not multiple of 8.
   I was allocating less memory than needed in those cases.
 - Fixed damage rect horizontal alignment.

Note: The last two fixes listed were pointed out by Sashiko in some
occasions but when I checked them I dismissed them for false positives
because I misunderstood them.

Note 2: Sashiko keeps complaining that i2c transfers are called in
atomic_update callback stating that it is forbidden to call sleeping
functions there because we are in an atomic context. AFAIK this atomic
context is not that the kernel is in a non-sleepable state, but refers
to the DRM way of working by doing check -> commit. In fact, the driver
I based this driver (st7571) and others (ssd103x) do i2c transfer in an
atomic plane update. Am I missing something?

v4: [6]
General:
  - Patch series based in kernel v7.3-rc1
Driver:
  - Fixed nits found by Christophe JAILLET.
  - Fixed max_width and max_height in modeset to avoid having bigger
  framebuffers than resolution.

v3: [5]
- General:
  - Patch series based in kernel v7.2
- In dt-bindings:
  - Removed "chipwealth,contrast" property (added backlight_device
    support in driver's code)
  - Renamed "chipwealth,invert" -> "chipwealth,inverted"
  - Added default value to "chipwealth,offset"
  - Removed 'status = "okay"' from example
  - Indented example with 4 spaces as stated in the documentation [4]
- In driver code:
  - Added support for backlight_device
  - Replaced drm_dev_unregister with drm_dev_unplug to cover the dt
    overlay unload case
  - Executing drm shutdown operations before turning off the display
  - Checking that the width (panel-timing.hactive) and height
    (panel-timing.vactive) parameters are greater than 0

v2: [3]
- General:
  - Patch series based in kernel v7.2
- In dt-bindings:
  - Fixed linter problems
  - Replaced first_page property with offset
- In driver code:
  - Fixed dst_pitch calculation
  - Renamed file from ch1115.c to ch1115-i2c.c
  - Support flip-vertical and flip-horizontal dt properties
  - Fixed several things found by sashiko-ai

v1: [2]

[1] https://datasheet4u.com/download/1576606/CH1115.html
[2] https://lore.kernel.org/all/cover.1786110720.git.nico.antinori.7@gmail.com/
[3] https://lore.kernel.org/all/cover.1787321297.git.nico.antinori.7@gmail.com/
[4] https://docs.kernel.org/devicetree/bindings/writing-schema.html#annotated-example-schema
[5] https://lore.kernel.org/all/cover.1787973729.git.nico.antinori.7@gmail.com/
[6] https://lore.kernel.org/all/cover.1788711082.git.nico.antinori.7@gmail.com/

Nicolás Antinori (3):
  dt-bindings: display: add Chipwealth CH1115 OLED Controller
  drm/ch1115: add support for Chipwealth CH1115 OLED controller
  MAINTAINERS: add entry for Chipwealth CH1115 OLED Controller

 .../bindings/display/chipwealth,ch1115.yaml   |  81 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/tiny/Kconfig                  |  17 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/ch1115-i2c.c             | 895 ++++++++++++++++++
 6 files changed, 1002 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
 create mode 100644 drivers/gpu/drm/tiny/ch1115-i2c.c

--
2.47.3

