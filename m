Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793738828;
	b=vTAugucU5CNVCaivg5XnS3mpHC/IkkaCxZyyspmKnluBCARuxFaZaxbTJtRgqZfQH8lu
	 KbEXayXo0VyRPwogQ4BihRZQAWtVYb42HAahZpiRo0/NBVkQwiIyXttvvWNHhbTDQdZBS
	 YKNXd8vgiRKD+3UPzkXt9GA2yU58R6MKxtU/GXvpJKkpaO0JKb8CA10NqQLJsmM9Neg7q
	 JVkFSWNBpGovto18h+pDAf1ujNnzQC2fhL9h0l7a42xdwvnBsRVSJ4rqDUtn6DxGdqla4
	 VUML3VWicV/vi0kBQUWiGRGe4+syWAdNiQrKSU4APzFUGRTL+z/Kx3K48b3gbLTFV+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738828;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=UNLZOB7RlMn7c8blD1Uiiei/dC7dkvXjaLxBgJvaSyg=;
	b=sTHG+5C1jD4MSTHtBFx3VUgntqFQmiZEmrJvi04jrBjGlYiPgoPmUdutAkATY9fQu5A3
	 VfrnQ9izH3weURsddyUX6nwVKHYS3FFzXgBldbwgaZMEZDyhfKSGZ+qOM8qJfSWTsJG+G
	 DZDA54Rub/OVRpYjYJ4fNUhSsslvNk0fSOqCilYs4cmV6ZrNCtJDb4K9H9BMP7lDpwJQE
	 0gXaqX/KgwBFsC00g2EvUiU1GAzLMDVkMZdDGhTXp8FI8ZBiTlIRc6jobnDNH/232xRGE
	 giT1zyRwTIAs24ejqHPyZVuR2WOAaIP7N3tTzGZQXbvNd/XkitdyCNAbC+6SApDKw1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="T1QRo6/j";
	arc=none smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4785F606A31B
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  3 Nov 2026 20:47:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4785F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T1QRo6/j
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5e9528732b4so3177227e0c.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 03 Nov 2026 12:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793738827; x=1794343627; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UNLZOB7RlMn7c8blD1Uiiei/dC7dkvXjaLxBgJvaSyg=;
        b=T1QRo6/jJDclT6BxrbBY8phFIEc2YIbrHfYUM/GN+EE47YzR/uSqDw9mbRNzKiaJ4u
         U9YKOx/qGWHAdz6a9uDOkgqggQsaw8hfDAYgpXHvgqbITUKPZhemHWsRxPUy2htSDD35
         8SdnBtMood55/xZxtjNintqvlHOIE/CCsc5LHegex999AzGAcKmtgHgdepva86rZabWx
         FR4FY2FNmn4+8yams06+nt0ktFcLKKdKNDA0l+k1YJmh+u2RjGYGrAKWvmIZXb1EqdOC
         n0XQi9TGNMpqfu6ytQ5LdGxWpc+pSPYmGrFAczlXvHj2O+n5dSYeSXD89KS/lO5dDaZh
         vArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793738827; x=1794343627;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UNLZOB7RlMn7c8blD1Uiiei/dC7dkvXjaLxBgJvaSyg=;
        b=xYQYCIhSXoLmgaJlACSWL6aK5koHaW2KJA2d/nq9ZIG/iXu4EtS4/Rpcjucx6jEIvB
         09AKwsE300lPRuhRr5zGS82dCn6ckEh23/8OCBI74f43zpHZLPtxH3dwa2wQMVvY/zFQ
         NBSJ6E9oyxZYKRPet8Uj4W51fzPXGVOtW3Rmv6URxLIEXc8tTKZ0uEizNOq/y6jtsrIK
         W+AQxLZ+ZaVpa9JEEe99IZ57A24SYrfFEJB5p1+Y2XP986341i/G4YUhE/ukxNxsWAXh
         YXW2Ze5QTcFy6OPP+Bx/aNPp3NfjzygrY/0T0s/iNzYP46fQ776/EAx0cs8SrK+120s3
         NlLA==
X-Forwarded-Encrypted: i=1; AKwUvBwo8E+JnTKe8Chtw7qTaLoCjnaVm48sEGIMEq8yqfds2xwOuAtX4JLBlimda6rZijlczU6SbYoG7Uvwow1x6RuBNWwguA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+kebWe3abOjuiW0KvNGFWCs62g5Zv7NSXDFYWjM17RIOPqKoG0
	OnzMgsx+VdNNQaksxSr7cx7FoVRimwY0WPWv6aGXlh5C3R3VNiKFgLg=
X-Gm-Gg: AYBFou3vjCqbxk5/I8Fo6rjNWZU7CQikewxJjb9SMEUrDa4JsZf5hJqccNcg/mJEyol
	Z8k6srDVYsa6aY+C1Xv53IajOgRiCBboSd2otuPXgXpUppxIA/GovfiHqBfQUgYFQBPoNJqKvIZ
	bLpK0lbcUnPqY5tYOBmHya4ZoMNE0fsjVzlzvbPMZBwXS/Ci6IL56CqeeeAy8UGFqVuGnGG6YSj
	9+touNnZXiyQt2L+xx54MS68QMddhds7Ov4uXrjl9zVgvdDjU09vGjLd1nyct0znqGaBwhElIU4
	znJlT7TXtrw1PIccARUetM4kjzJySHtz+MZpD5zUVegG1xud6rgEe9YgycelBHViA5DRiu0/QDO
	qOMasg2b1UfHg0QJ5UeMnoOtrk6Uf94A3QF0xqclblplI6t47ayI570S+uo8/+ALcahFeKURvT8
	/ROtj7yh0xsHW8ncwW+MfV1W3wLbprUulf4j/9XLm6zjvsk0LvL92GOv96SecdZIonrhnPxrwmw
	RYM7rHZr46dqy+dIMGVYHK8CQwwQWLP6B+l6LnHxB+uz7/PBJfuxMfkhs1DRATZyTdA09374mdk
	/w6Pfr9zpcoiA8NGueQHRB9zHW2t1fBmDzNTScEgPKJ/TY8U6zmJ7qrHeZUBNcMqhPZG0ZbZjtG
	axm90
X-Received: by 2002:a05:6122:328b:b0:5c7:fbb5:6ea0 with SMTP id 71dfb90a1353d-5ec68952670mr7610678e0c.4.1793738827265;
        Tue, 03 Nov 2026 12:47:07 -0800 (PST)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca89b81b3sm119618e0c.2.2026.11.03.12.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:47:06 -0800 (PST)
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
	Javier Martinez Canillas <javierm@redhat.com>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v6 0/3] Add support for CH1115 Controller
Date: Tue,  3 Nov 2026 17:46:50 -0300
Message-ID: <cover.1793735996.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Post: <mailto:linux-kernel-mentees@lists.linux.dev>
List-Help: <mailto:linux-kernel-mentees+help@lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-kernel-mentees+owner@lists.linux.dev>
Precedence: list
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

Tested with Raspberry Pi 3b+ on Linux 7.4-rc1.

Changelog:

v6:
General:
- Patch series based on 7.4-rc1
Driver:
- Fixed KConfig dependencies: added depends on MMU because of
  DRM_GEM_SHMEM_HELPER select
- Removed unused constant CH1115_MAX_PAGES.
- Removed unused ch1115 struct member pages.
- Fixed width and height checks error messages
- drm connector: use atomic_create_state and remove
  drm_atomic_helper_connector_reset: This change is because of [3]
- drm CRTC: use drm_atomic_helper_crtc_create_state and remove
  drm_atomic_helper_crtc_reset. This change is the because of [5] [6]
  [7] [8]
- Replaced devm_regmap_init(...) with devm_regmap_init_i2c(...). Deleted
  related unused code. In this driver `I2C_M_IGNORE_NAK` is not used.
  The way of communicating was carried from an old version of st7571
  driver (and me not understanding better). This change is because of
  [4].
- Early exit on failure in ch1115_encoder_atomic_enable
- Removed "CH1115_CMD_ALL_ON" in shutdown sequence. This was a
  misunderstanding of what this command did.
- Fixed Sashiko report from v5: "[High] core: uninitialized variable
  `bl` used in IS_ERR check". Apologies for this, my LSP did not
  highlight the problem and I overlooked it.
- Fixed Sashiko report from v5: "[High] drm: out-of-bounds heap read in
  ch1115_transform_xy()".
- Fixed Sashiko report from v5: "[Medium] sysfs: unprotected state
  modification on registered I2C device"
Dt-binding:
- Removed adding Chipwealth to vendor-prefixes.yml. This was added in
  commit 058ee00216a1 ("dt-bindings: vendor-prefixes: Add Chip Wealth
  Technology")
Link to v5: https://lore.kernel.org/all/cover.1790200427.git.nico.antinori.7@gmail.com/

Note: Sashiko keeps complaining that i2c transfers are called in
atomic_update callback stating that it is forbidden to call sleeping
functions there because we are in an atomic context. AFAIK this atomic
context is not that the kernel is in a non-sleepable state, but refers
to the DRM way of working by doing check -> commit. In fact, the driver
I based this driver (st7571 [9] -> [10]) and others (ssd103x) do i2c
transfer in an atomic plane update. Am I missing something?

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
Link to v4: https://lore.kernel.org/all/cover.1788711082.git.nico.antinori.7@gmail.com/

Note: The last two fixes listed were pointed out by Sashiko in some
occasions but when I checked them I dismissed them for false positives
because I misunderstood them.

v4:
General:
  - Patch series based in kernel v7.3-rc1
Driver:
  - Fixed nits found by Christophe JAILLET.
  - Fixed max_width and max_height in modeset to avoid having bigger
  framebuffers than resolution.
Link to v3:  https://lore.kernel.org/all/cover.1787973729.git.nico.antinori.7@gmail.com/

v3:
- General:
  - Patch series based in kernel v7.2
- In dt-bindings:
  - Removed "chipwealth,contrast" property (added backlight_device
    support in driver's code)
  - Renamed "chipwealth,invert" -> "chipwealth,inverted"
  - Added default value to "chipwealth,offset"
  - Removed 'status = "okay"' from example
  - Indented example with 4 spaces as stated in the documentation [2]
- In driver code:
  - Added support for backlight_device
  - Replaced drm_dev_unregister with drm_dev_unplug to cover the dt
    overlay unload case
  - Executing drm shutdown operations before turning off the display
  - Checking that the width (panel-timing.hactive) and height
    (panel-timing.vactive) parameters are greater than 0
Link to v2: https://lore.kernel.org/all/cover.1787321297.git.nico.antinori.7@gmail.com/

v2:
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
Link to v1: https://lore.kernel.org/all/cover.1786110720.git.nico.antinori.7@gmail.com/

[1] https://datasheet4u.com/download/1576606/CH1115.html
[2] https://docs.kernel.org/devicetree/bindings/writing-schema.html#annotated-example-schema
[3] https://lore.kernel.org/dri-devel/20261022-drm-no-more-connector-reset-v2-26-0b7e4e85b1e8@kernel.org/
[4] https://lore.kernel.org/dri-devel/87345ckt2n.fsf@ocarina.mail-host-address-is-not-set/
[5] https://lore.kernel.org/all/20260915-drm-no-more-crtc-reset-v5-0-bda007735748@kernel.org/
[6] https://lore.kernel.org/all/20260915-drm-no-more-crtc-reset-v5-9-bda007735748@kernel.org/
[7] https://lore.kernel.org/all/202609260122.KLDd6aW4-lkp@intel.com/
[8] https://lore.kernel.org/all/202609260545.eEm9FCKo-lkp@intel.com/
[9] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/sitronix/st7571.c#n371
[10] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/sitronix/st7571.c#n224

Nicolás Antinori (3):
  dt-bindings: display: add Chipwealth CH1115 OLED Controller
  drm/ch1115: add support for Chipwealth CH1115 OLED controller
  MAINTAINERS: add entry for Chipwealth CH1115 OLED Controller

 .../bindings/display/chipwealth,ch1115.yaml   |  81 ++
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/tiny/Kconfig                  |  17 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/ch1115-i2c.c             | 859 ++++++++++++++++++
 5 files changed, 964 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
 create mode 100644 drivers/gpu/drm/tiny/ch1115-i2c.c

--
2.47.3

