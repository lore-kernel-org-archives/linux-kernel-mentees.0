Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0B0FC0E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  7 Oct 2024 01:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728264648; cv=none; b=dToUvL7JN4DLj1Mm1jIv+kspFCeIVzwy/G5Eu1DjtIrcy5RtZ48hO5mJcI9QsZX+L3zCpJlDJyDNq88Rgtb1Qy/ABG9paFnECcmoALnuUrXdvbvmtaKKf7u3V7vDOFjBudkO6H1qL+mOPl4FhdysBQ+3vOyObzFTai02Sy76fXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728264648; c=relaxed/simple;
	bh=CnJ6EhrzDENcvUxAwCmy0yyNq4GGx+eeT/Ap9yxdkJI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IBbZ+Lgwyj819MJd1+HUN1iRfvzGQlX9zDA5Kx0oAjq7DV2seXaYsSC573IsScBr6JwOUGdv5zo2Xf8Wqgx+5/cphN8fIUckD6koGPqJ4ZSEOcmob+pYlT+KPWEjD5qDzuwdMBg2Bgl0MB9uC3sRxWmF8rLUpOkIDSrCjLYvvIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RDUnGbTj; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RDUnGbTj"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B811581116
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  7 Oct 2024 01:30:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7H4L_OihfP90 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Oct 2024 01:30:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::72a; helo=mail-qk1-x72a.google.com; envelope-from=lanzano.alex@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 99C848110C
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99C848110C
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RDUnGbTj
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 99C848110C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  7 Oct 2024 01:30:45 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-7a9a30a045cso346892785a.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 06 Oct 2024 18:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728264644; x=1728869444; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M4BL7q8zanMLPZgq1AZ71CIoIOsuiwDVh+BCfFx3B8I=;
        b=RDUnGbTjSXMNmZqnSwHBKIGvx3i6imMA5IXTjTrVSYHoXUfY94X9v+EiqA3x94Mg6G
         2x/h4MwE1qgf/tQi5bV5gExVZz0J+TTkSX/vw49UCIphTMfTR5LStzVO+4tkS7N9dG8q
         0zzaehkQz7LnVZJFdxejQ7kgvlNRR3SOGgylUlkR+y4lTwGFe7N2M76JylVkjLkD326U
         sIgqSsSmxsO3AWDAR8wX2kTO6j1G23HEg5HwfGa2P2IUA45WUNw1Vc19tUf4bDNw1Qxz
         tAIFejVuQo/PDwUJYZoMDIzi3uoCjNCD8hk7wsouYzmncoJr8ZcdisR//WsbBWdRLHRP
         X/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728264644; x=1728869444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M4BL7q8zanMLPZgq1AZ71CIoIOsuiwDVh+BCfFx3B8I=;
        b=c+s0/5XzDN2//KH9Jfbpb8Ol++5q0aicgqhZNCkPLvojY+8vka3WU1OnJiCP79Gbdl
         9ceZSahx/wrFhfrmaBScon2E+t9mb/xFKcjSw7D6H60WNk5t+WuKfHAMIE8dcB+PJNbc
         fJslRfpF2vpBL9uxL2nZR09vEbxiT5Lulkix9S/92hIuXsVlE9fGRR2Yk5cR0EpomuDx
         EJKP/Ud8QcYu7mdFuDrnwd4k8JKIRD049fZn1JjkgaprQi/0RrtH/KjTehU13wxmxHjO
         RTweae3sK+rWofF+L3oPVhXWHqH4A4ezhdH0mVZzMrQijw/mMzen1UUxKe+7onXC2AOD
         TmYg==
X-Forwarded-Encrypted: i=1; AJvYcCXeVzfp5nuhViiSuSs0HFLUFdnylWWNtcQYFEK6YOhCClCuzlQrO7IF6F6eZv3WFpzF9unZiSUXg4CF/VNz39fJNwK5fA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yzntype5VopBh9/e/MpEkaYfm5DJl09ZDJLeMTETrJWKq57UiT3
	ci3gtAc7yr0OWpXnSUfYeq23E6gEAciW8TFqfTxes7zlvbrp/VBq
X-Google-Smtp-Source: AGHT+IEUwTDUTwHQPPMnXkL2oBBF20EQpAtzbYg+OHDr2onQw1DYJTSZ7x3HJKuUZql/yUpw2OUU6A==
X-Received: by 2002:a05:620a:31a5:b0:7a9:c610:99fd with SMTP id af79cd13be357-7ae6f4a696cmr1503155585a.56.1728264644003;
        Sun, 06 Oct 2024 18:30:44 -0700 (PDT)
Received: from localhost.localdomain (ool-1826d901.dyn.optonline.net. [24.38.217.1])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ae757627fdsm207326985a.100.2024.10.06.18.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 18:30:43 -0700 (PDT)
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
Subject: [PATCH v9 0/2] Add driver for Sharp Memory LCD
Date: Sun,  6 Oct 2024 21:30:04 -0400
Message-ID: <20241007013036.3104877-1-lanzano.alex@gmail.com>
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
 drivers/gpu/drm/tiny/Kconfig                  |  20 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/sharp-memory.c           | 666 ++++++++++++++++++
 5 files changed, 785 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sharp,ls010b7dh04.yaml
 create mode 100644 drivers/gpu/drm/tiny/sharp-memory.c

-- 
2.46.2

