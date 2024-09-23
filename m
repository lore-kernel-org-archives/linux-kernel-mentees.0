Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C069319F104
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 23 Sep 2024 16:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727108559; cv=none; b=TC5EWQ+7mEubCerZQbSOfrPZSF0We6jqPH8xVleIq0NfvZuFS5QyAAsR6QZpdxiWHETYPtf7Kul0Te+1Fd2w8BdNzzl6BTroe743gASlNuvXKidYDyonMw+XUSyl3t7K7UeQwIe2+krKnLr1elrunYz8LNvBLWAYEqRTNc6TQ90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727108559; c=relaxed/simple;
	bh=VdkM75IQkxU7Lpd/F13lYAcYe/ObislY5V39DVe3lPo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rm3PCZ7P/DmpXvq9e1U0N2z9x0OIgU7pGFSJ6/0PfFX8RfkcXyIY6VvU+I3pLOCtyXjyqF4ZQ+RNi0VatkJkgdF47iWr6qTeplrCbFUSw5G+YuNvS4mQT82zNQC80rkHmRZj4SNw4+z3Tmmm245RaUMQWW7CrIhUpAyHzQYVHgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YRUbxd9a; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YRUbxd9a"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C88E40228
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 23 Sep 2024 16:22:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EPqGJYNvmGUa for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Sep 2024 16:22:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::82f; helo=mail-qt1-x82f.google.com; envelope-from=lanzano.alex@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1EE6F40214
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EE6F40214
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YRUbxd9a
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1EE6F40214
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 23 Sep 2024 16:22:36 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4583083d05eso35663151cf.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 23 Sep 2024 09:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727108556; x=1727713356; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xMAjUDxOyknWcICNvHoeRR5xLaaisNjKFQiCg/h7w/8=;
        b=YRUbxd9a4SP3pqKD3gL20kW0S9s14nwAuroxFkfKKpV6bps/CJjfOZlR47jyagw9um
         RxVoVCEXWscQG9p8Z+oqfgEJN3X7aoZzzDS48MvH++FzjDwoteIt8bKVHGRuFzIzTdUa
         djfmyOwg88/cONF16XD3rEI1P4dPEYUnRPhkz/iKoXZF/vYSz9VUqw5/lhQ/Y5t5SMJE
         /Pb+CqRGjeX0D6TSgxBqjZUEYJw7R9HMF6Od6e3L7CkkKvw5exssYIFUgL9DsNfUFHP6
         wThQNvrp+pVfe/eMqaFDByyfaAN/qESg04iOUlA24/gQKYexwjPc4RxnmXrD1uKoPmQg
         x+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727108556; x=1727713356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xMAjUDxOyknWcICNvHoeRR5xLaaisNjKFQiCg/h7w/8=;
        b=otS3RK4q3+9RvfaGux/Ebb/vdlVTtPnpPabk8iYXVaqy9kzhu8RH3rpfRPYwCqKZ0L
         8qcGtQz7BHtJgLZBcU+hrHk/bfLKayqV5iPF9CT37ONkxIdvAgLZ9iaA20qZWAehvby9
         PRYXJtFasHehkYzFQUsspEflTNWDBq1CUmQ8hMHqNZ+M7TsrRp0DaC+3Gd3OBzzlfYvR
         fyBnIzOMzht5FaEIniAJrTSOnoZmDykbY3IFdoT0CgIv3TjagoMimYwJkxqspR7kP4PI
         3W2cJvopIu83C4hdTQoVWr0TLjvw8C3lTTafFKTzN+8gQjIFAz+DlDjO7IhHj5Kqre4R
         s+KQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0B2dyDV2GCt5OpjR6H83Qd35JpqCLk32q0/gCBwqHDnJGehfJSu4vWFRRq5nf/GlDYeqgjazaxDaOqTvXATmJeCaloA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yy0YRiQqaO/oiW2etA5PgdX1ic0DTSx8YrBRToOt+a2TftRGCKP
	VZOc0xum+G4rY2ltiYH1+gkkXi6lmT0wJvy3a4NTwrLqC1LokQMT
X-Google-Smtp-Source: AGHT+IFCJxsI00ZrQnDdvugyIqeqvv9DQpGecgLpiot6gq0UD9k6CQSR8jxNdqQlbuJjiZbrcWW3uQ==
X-Received: by 2002:ac8:5d4a:0:b0:456:61f0:810d with SMTP id d75a77b69052e-45b226d1230mr220772381cf.10.1727108555440;
        Mon, 23 Sep 2024 09:22:35 -0700 (PDT)
Received: from VM-Arch.gst.l3harris.com ([208.127.73.102])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45b17867fb0sm48587901cf.1.2024.09.23.09.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 09:22:34 -0700 (PDT)
From: Alex Lanzano <lanzano.alex@gmail.com>
To: dmitry.baryshkov@linaro.org,
	Alex Lanzano <lanzano.alex@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	christophe.jaillet@wanadoo.fr,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: [PATCH v7 0/2] Add driver for Sharp Memory LCD
Date: Mon, 23 Sep 2024 12:21:33 -0400
Message-ID: <20240923162205.55658-1-lanzano.alex@gmail.com>
X-Mailer: git-send-email 2.46.0
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
 drivers/gpu/drm/tiny/sharp-memory.c           | 682 ++++++++++++++++++
 5 files changed, 801 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sharp,ls010b7dh04.yaml
 create mode 100644 drivers/gpu/drm/tiny/sharp-memory.c

-- 
2.46.0

