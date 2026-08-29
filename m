Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0953F1059
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 29 Aug 2026 06:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787985492; cv=none; b=rGelknmPXio1oIBckwXGM8AiuuAQaYPoiHyxcAnfqsnONms/kAzlO7vdv6gRdrl52aogAr4lQNTPnj3D9XSEqy4H/31ML0bR+qplwH0io4YnFCB1HBTcJtMKLaoGFDsnsIkeVkIKy2bBYtucCbtvGEZVnthOESesqrTNGKZEwQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787985492; c=relaxed/simple;
	bh=r8bYo07SpGbBBI7dnVtYCZIooDNABB+5RG6MHH6OO1s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=E/aDFlKlCsGhorEbM1Gh/eIyP/6FauSKK5oKApywSNg5WddygPFvzlRnVVYbNvYDFNZCYT/wPjastVh7AjK9Wf+VEForO7u6fL3Z6FCbroAcbalCQV0gLg2qCsQfhEuNaPf9TX+WlJmww4BolIHmxLqHejLMpbjqDN7TpvUSD1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hiApGyh9; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hiApGyh9"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so1805658a91.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 28 Aug 2026 23:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787985489; x=1788590289; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9gUDHNOKmIoQbqe9mzJt0j0l2zbHlvksIrYcKhCoTP4=;
        b=hiApGyh9RuDA3zcm6rKS5kOMuV+gHzTdfJ9+8e40TNCbEoco20cC/GQwcHCi6Ao6JS
         CgHXugKnQBpezkzDMBcGOVHejPdi4YkOHecSYH/yxV2ih38RWaE13hbRPnc6aW+h0PTP
         QkSqhQuAekTpKnTUpOqwCNfiSjVVItaSagSUE0gix5wD176Jy9hEuiLN83sfhTsUyXx9
         pbcUvcw4ejnzQALuAfCknW4pB3pzTXmm4XbaOcbvLPfc7WMK8mMdYkpx4cQ3YkPBTprP
         WzDP2pb8OOnV+kr9R/yvmPJzci5qsf5xy6AOkzpB2BRwHkziSaeTZZ9OKNkKpWE+Zn6V
         9Zkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787985489; x=1788590289;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9gUDHNOKmIoQbqe9mzJt0j0l2zbHlvksIrYcKhCoTP4=;
        b=IA4i2tPWV6JqIMkUdWt4tewjQ6N9V/iunvWKrr39niEjJpSPJ2FNlcpfTF7Tgeic2k
         k0vJ/WRy4YcGhkdoqWMzcXyFjadATh2+f8cDMR9Hyu3ELQt//PMjOzy8dCuyQFI3NXPe
         hptOHmaPpajGoPvmZYWIwOPC72YmXUl65jHwhyMd2wTvrUoY168giqbJ6MCkoapzp49v
         M6kKhQF7U49KEFPQjIhuxUNj5I8jZUFcLJcFWsUBOvCEmRavSGqnAWS3gBRqswYszpNM
         ktN/dmsDwsRpxvofn3jlGMIqV3becPzhj+JkGMK2IS4jJS5SkxRWSw7/BCdUJoLa1+mu
         nUyQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUQqbxhUEbV4tKxStkBklI0bydWwySQBGCbc34EDYX1BAT7wIeP7PLhu1duDESwBc06CT57xj2Z4c55qTKQs8XYFORAQ==@lists.linux.dev
X-Gm-Message-State: AFuF++lfPCm5QOQCaHVWEt84ZJwFdbCCIkcMv7o4Ti/2pEgWioW8RcK8
	dfqHi9t/gbTxYvOaGQZhC7uCJGwQhcMNM2ZjzpmStjHQc204xDhHzlo=
X-Gm-Gg: AYBFou34pmDMUFBfRNj5OczVvnz1ZhqhblpkuQNANrt+v6rwlhwLO1nT/CHlZssAHPQ
	eityISJRKCXLfIzh6/fHzGS894t6EXfZJflgwhVfzlX37PKBGp2FyuK8BlDLtd4xukmS9IBDJ96
	FCe07gOuvKkugjBBqB8LzqfUDLhmxvg2qPUrxMr/0hFZ8ibLXCeAG+wObcs/C8ZnFLgEaSBf3BG
	kM+uJGwjbdsiDi6qEs06SlhDDkkUq/E8DzfpohD/GhiRkSn5Pr1Zj1J9gDroKy4oSlIsQu2KVGd
	Q5hio0TJqCfb2VUY5Ti9MVy15xTIvTPzAEd4Wfb2z1Vp+xrYQw3p+esxH6VaL5z8y9mmWrvELol
	8WPYKbnLD8+tCv6sOMkwkXqoE+WhbbgaCY+CKeWSU5STPeBNEIoy4VYrzUbnN3CbR58Ho1xC9cx
	Alsp3tiXIos++7inJ2SghMMQJX3ECJgd+X1bcNrUWNBRd7F8YpAukbU4vZgApE9onqsalB/bhLj
	GGPA3Cbe76aaMwZUARlyqRrVfZJBV7pRbhDlRM=
X-Received: by 2002:a17:90b:1644:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-3969ba3c851mr22712524a91.4.1787985488496;
        Fri, 28 Aug 2026 23:38:08 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d1abbdsm10957539c88.2.2026.08.28.23.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 23:38:08 -0700 (PDT)
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
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v3 0/3] Add support for CH1115 Controller
Date: Sat, 29 Aug 2026 03:32:12 -0300
Message-ID: <cover.1787973729.git.nico.antinori.7@gmail.com>
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

v3:
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

Nicolás Antinori (3):
  dt-bindings: display: add Chipwealth CH1115 OLED Controller
  drm/ch1115: add support for Chipwealth CH1115 OLED controller
  MAINTAINERS: add entry for Chipwealth CH1115 OLED Controller

 .../bindings/display/chipwealth,ch1115.yaml   |  81 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/Kconfig                       |   1 +
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/chipwealth/Kconfig            |  16 +
 drivers/gpu/drm/chipwealth/Makefile           |   3 +
 drivers/gpu/drm/chipwealth/ch1115-i2c.c       | 887 ++++++++++++++++++
 8 files changed, 997 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
 create mode 100644 drivers/gpu/drm/chipwealth/Kconfig
 create mode 100644 drivers/gpu/drm/chipwealth/Makefile
 create mode 100644 drivers/gpu/drm/chipwealth/ch1115-i2c.c

--
2.47.3

