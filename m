Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F693F58C1
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 21 Aug 2026 14:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787323118; cv=none; b=QjFJwBXYfESS+MgmplY2ZOeR7t/OKPvcse7r4gJChmsqUyRIPWe8i/6Ph2Sp46QR3jUlDYQP2nTxXp188XeZYRontR5gFJlAFINtM5kFMucfjyWbLb6pIgXcCFWawGVni6Rfq2B8ONzmLEKBNwmfCPy1WLy62zm3EAYml0RfEJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787323118; c=relaxed/simple;
	bh=bXQElwg2kECULXg2Mxmkh+mTILQH0EePq+c9oQ529+k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XVpO/id4x93Us9wAF6kYCfzW+A1SSBLkcUQH5W+E8028/Sb+0odma1YZCe4LPyKlbB6x+fpYazC7ynMsvu5tRxsY/E0eby5G8HyE85TDaeZm6D8oXwQIHxmzmppRO6mp6ntR76K/Glh75DAqoM9yLAlLcQdB4Fh1pbWT8qze0mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QRbUUzaV; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QRbUUzaV"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-81ff017d420so31760227b3.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 21 Aug 2026 07:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787323107; x=1787927907; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AJ7GeXkvxDCAB3BMlDYkkSzT/Txb0FUDU70/A4GPBvY=;
        b=QRbUUzaVGNTWbu3/ya+CmLVqXopvWghDpcRvDR3vLMibm+eFJkr+F37saElN9K46uk
         DCsDbpizZtrk3hKBxvT+4r3pTfTkznvXyt1BEtf+Q0KvgylFTwJelan5S2gyHsMt/3Hx
         D4pwgDS3TgO/k6trjY5EwCw572FZnfdLrL/CXxYK2MG1sfh701ed3cPdZ1VNGHwADex/
         hL4BWQfz6zEDyzab1sgnr6tD1ZF4CODECRRPsIO08fPWiSlJn0Ejxi7j5Gly+IStW2PS
         5wjlYqTj5fg1D2qpAgggf2U2uIMaPAZb8W8wV8d9ZZDRjiiFS/S54lP+zXPhdexjTxUt
         KdpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787323107; x=1787927907;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AJ7GeXkvxDCAB3BMlDYkkSzT/Txb0FUDU70/A4GPBvY=;
        b=QQFNukbyf+1B6cc5RbK+cDCS4WREOkcz9/KRRbpY1/Den3KAFe5qwxWy/MAhZHfQyq
         Ofl6Psro4SIFurH7nW4yP8wpar677DM789pSXVY8VQ+Ur/cD/iFhbezlE0553/MaWDT1
         gm2zurSEEVfs1PiFEdRk4p8zY+Ng/BHF3JrQLDjyBEDBlLL8jgtJKGcVBYt+8gHqlTO3
         P6F79R/j8AgzjVDt2+0TSkNSMCiKsBt0TOrnvDH8iV6vo8SwnNGkYE99mhCe51qh103M
         plh062W4wk8D+UQEh1/Seb05XkJfP/0eCC2nUKaPJ9N73kF0XDN35gau5O6T8/mBAkqH
         Z0Sw==
X-Forwarded-Encrypted: i=1; AHgh+Rpj0u948FYT8Ke87WPWB43UfPKDXox5fFgh8/eDuYX5VkXHPeSrAH85GhbQqFfID8xcvUk1I/SiAOYpYlvLkwlXKuzQiw==@lists.linux.dev
X-Gm-Message-State: AFuF++m7pAU7eY1+bXdQhvDFsepnPk36x5lo7rlMgukNmjoLNKodvv6O
	1DVxxjcSkoq/31zlK7n1ayhMXG/GguwaFC8omvtLVQs4MHlpKX38UzI=
X-Gm-Gg: AR+sD11JhjjpwTnXQx+qDI5BTrgUbTD/dvZ7oXGLW0HkOBZ2WknPSZtw6JM0SQBI6kE
	jDdUfariiLzelLaaEAlI2vFWMKc0zvG4ESS62+GaqIxMD6XRmSIV2DMCcvfuv3BMKGKtks0aRDT
	R3lSoYqHMAnz8bDjqMMESMiQGHhJgsvUMxMtM6C12kfzjjzim4lBvplWBHgNK7ov3NCkBTYn7Q7
	QAqav+eCUSaNXmUwfnadzFXujD3rzvHOPpDNQZLtp9PYBFi8Z/hbYoHIOqYrvLnr/3Y1H7TGJYx
	RHiCUJkg9bek5uecxwuTq1zYEd3a1Mg36vqLeDdVNDchW6nn6r/xWdnwaQWUCZEQk1URJ+ySI+C
	fRDo1csg/kcDYMTVoogiSygCTk4bEwzIph6jCCilHUDiltBihVyDHLkXSYOCW/tASVkRZZb5geb
	u87zPoRV/yQ7jO1gEy3iaJuUFRHZdbYV4OowFzc6fNaCoX07uJTqhJ2c/aLbak9rQFWoB8Eh9lN
	pdGBRIYUnROKJOGk53giI0shqabBZg2zsYT224t
X-Received: by 2002:a05:690c:399:b0:81e:c500:c6d0 with SMTP id 00721157ae682-8470139a4a6mr60233797b3.0.1787323107244;
        Fri, 21 Aug 2026 07:38:27 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-845188b28f2sm41868277b3.38.2026.08.21.07.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 07:38:26 -0700 (PDT)
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
Subject: [PATCH v2 0/3] Add support for CH1115 Controller
Date: Fri, 21 Aug 2026 11:34:15 -0300
Message-ID: <cover.1787321297.git.nico.antinori.7@gmail.com>
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

v2:
- general:
  - patch series based in kernel v7.2
- in dt-bindings:
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

Nicolás Antinori (3):
  dt-bindings: display: add Chipwealth CH1115 OLED Controller
  drm/ch1115: add support for Chipwealth CH1115 OLED controller
  MAINTAINERS: add entry for Chipwealth CH1115 OLED Controller

 .../bindings/display/chipwealth,ch1115.yaml   |  89 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/Kconfig                       |   1 +
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/chipwealth/Kconfig            |  16 +
 drivers/gpu/drm/chipwealth/Makefile           |   3 +
 drivers/gpu/drm/chipwealth/ch1115-i2c.c       | 854 ++++++++++++++++++
 8 files changed, 972 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
 create mode 100644 drivers/gpu/drm/chipwealth/Kconfig
 create mode 100644 drivers/gpu/drm/chipwealth/Makefile
 create mode 100644 drivers/gpu/drm/chipwealth/ch1115-i2c.c

--
2.47.3

