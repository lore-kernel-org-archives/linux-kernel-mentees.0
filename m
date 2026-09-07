Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159AA494814
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  7 Sep 2026 12:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788784158; cv=none; b=FHtTbUlQhc8nLZzXKUXFLczfqIQ5WRvHtFzjyzRK6bSOGHZz4f0pjt8lpS5jFnpVEmPzWbLMLGKuOKDE/nqc2EvDyJCRs6mPn8RBKgf91plwCwwggO6HBvMXeAeTlHS1zq8M3nfZlzvznl3jYHfTdXRYMA51QHbh0V84JwZ2dZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788784158; c=relaxed/simple;
	bh=9BFM3aJZwwSAMWa894hh/FwIZhRlBHiI7TetRzJ6tNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ck03P4eOmym25BkK4S6lWXmrXDCGgOAPm9STyi+ZSg/hqAfWxee8wOVYF8206tq1MuUYzwwBT5cJNUGEY3UfNqk1TAsnDNgKgw52O0PSaSV1cj4VgBIAeU0xJ1eGA7NPhhXi8S2YSDu3RAURZjLAfXmru0X7gwIDcSzAMO957Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z9zccm5G; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z9zccm5G"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-86fbd1a23ebso24718877b3.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 07 Sep 2026 05:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788784152; x=1789388952; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7BAuZNiA5/uluN+xTnwX3MbZRNEexczkRLqDb6knuzk=;
        b=Z9zccm5GblJ9MsnqGASxMqKO1SjREpKwSA3WkK+lEdY0+3w3uyxhBxJvMdb7QqrCVo
         UqIzZFtK8JjSO0/j6s3yKYsKJTLZUhI3nVfFSnkbfVI6JjY1V+5frelz8dEwe1z/x13K
         uFSm/L4KanDYtxMxsmIpoOygQSDsJlnuokr3EoFfIKMpbuZxGLfnw2QBiklf19Vqziqd
         +jLk+1Tn6O4rtOx4ZWonx9uuEjHifIUPxIXLiAXrcOUB3u4XOccWs6VX7loAfSPCh3gG
         sywMtLx8c/M2DjFqX1nCkUYaGA0mycvabfnJTIPOojlnYJ2M+D/iDvOB/rlFsHCKY4vj
         gA4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788784152; x=1789388952;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7BAuZNiA5/uluN+xTnwX3MbZRNEexczkRLqDb6knuzk=;
        b=U4nXhjDijEp/IihC/ZxNzdB+BFCsO2MigY9C9Gi5sIrFG3FX3bYD6gUYAeveanzJN1
         ftvz/4bi9s7kpW/zrhVqxrvnELSpCRdR6stySHvyZJekd4gUS3MRghKMEKVlZmLvWaIe
         eav2CFhPARfZVPnoNzBSC7Rr5RxjIj6K8Lb5y8yYJ76r5j2rIefOsjKHZwn/K/0h7Rwk
         yEckwaC0pVt6lOMievaBMQI6JYBcyKw9iSCljbeq40byzi6486pFR3DZfcVrf1woN96N
         JZmW5mK2j4bigeFeO7CWneFWPsAceLYHKJ7sJSUZM7dsIBA6h6LMtb5xS28Z2wBkmter
         pfYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFtjm2yEM4ckmhaFAIIXeGx1PA5o1qYQf9XN2R8tJ/zk19V4gpsDzkqcfCafC2Mmj9C+z/Rl2AbpG0wcOtNtft4Tq6Eg==@lists.linux.dev
X-Gm-Message-State: AFuF++n22D4MdPQ6RHsAc4N0ncXUIxClvQ2qvSkiPuOTg9S0shK7fSJC
	LNp4CJQsq8J7DMxpK2lYZxb/rqyJXoX3kf1/yk0cYInQfgUgoo9+ZLZlBjtr+JY=
X-Gm-Gg: AYBFou2kGbKL9bbM/+aH+R3F8F6QvHSEW/D5a4yWunwyRa7c8M9YsK83eGJCzYjSnjO
	sGrNNnNhKVBDC/eAtKyvhzh7SUIAN2D7qjWwX0REsr5/BQgHPkyvfP3KYnrlTlu5krHf00P/5g2
	RKEeLwvwx6EEDBaZ5vsrVaen4X0rvx847YY1wHQujcXiS2xw1Wmaq6YLPOOMYoktRvV35ix8h1i
	L7vKoBbOuW3BuTcAlIkiVsW9nEDzEAFXzj3sAGe4nbwl/TI+6NFWP7gkhQMrLKg/kZeFF6dkYAB
	Uk208jCgR9OTYWi0u5F2fMwPpGVuXezbaihSrYCKoNP0lXdvfLVhUj7gHJFDXKlv5MihFt5PLQ5
	8pVVixxV10FN/2S3WBKHQn6OvPr6fpFuNtwGXLUoRvluLvz4CS7H80AM26nqZN+ITknb1P5cbI5
	2RYx1ITilGCb7TczNHkK4sRgk9GXp5/4CnswlTgPTll0Hiamu10xe6koMxYklZ95ZyYey1r4Ni6
	qfehoxSFvvaHB8DKNyD1yRmL9us2gV4U/bfNqOFkgQke9y2Lw==
X-Received: by 2002:a05:690e:b4a:b0:668:9fa5:b9cc with SMTP id 956f58d0204a3-66fc19c3cbcmr5343158d50.0.1788784151674;
        Mon, 07 Sep 2026 05:29:11 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8714bb0efc1sm70511967b3.45.2026.09.07.05.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:29:10 -0700 (PDT)
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
Subject: [PATCH v4 0/3] Add support for CH1115 Controller
Date: Mon,  7 Sep 2026 09:23:28 -0300
Message-ID: <cover.1788711082.git.nico.antinori.7@gmail.com>
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

v4:
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
 drivers/gpu/drm/chipwealth/ch1115-i2c.c       | 885 ++++++++++++++++++
 8 files changed, 995 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
 create mode 100644 drivers/gpu/drm/chipwealth/Kconfig
 create mode 100644 drivers/gpu/drm/chipwealth/Makefile
 create mode 100644 drivers/gpu/drm/chipwealth/ch1115-i2c.c

--
2.47.3

