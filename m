Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C2D24B29
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  8 Oct 2024 03:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728356694; cv=none; b=Zo9aD9aZ7K5+qkH24qep9hlEwaoCwAlFjxuUTXdiE+rD3fsjrlRSwhOcDawBvH4PPTcptdotOA/yEANZeEuwQd6bqCIu2rcUdct1QgRcmzwYttT2fQef/5WHcUyFXOM6zoMuxy0bzM+JTNnqgUYWPuu5b23R6GLIubCIhEtKwi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728356694; c=relaxed/simple;
	bh=+aBbq3flXoKbzSexegYMj70l1IJBXlrUtdKER/ZxnbM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ToAAaKgagUWoFme6AIVrilWiBJMy9IltnUakm6OD7DExIxR9IJrBEctRXbArn2s3b1QX32BKbi0rt7ZrXVe+51KcD3tZ5BzKrxIxr7tL0loY7448DOlEykUDUBvoe9wgSTUclbq4Kxewe6mevb9kk/FzTlFWuN5X3+ZQj16S/c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j0lxhLHg; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j0lxhLHg"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 656414013B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  8 Oct 2024 03:04:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mwebNur4Uv0G for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Oct 2024 03:04:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::733; helo=mail-qk1-x733.google.com; envelope-from=lanzano.alex@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 129A740096
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 129A740096
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=j0lxhLHg
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 129A740096
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  8 Oct 2024 03:04:50 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-7a99fd5beb6so509378785a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 07 Oct 2024 20:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728356689; x=1728961489; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QGhZ9VuDoP4GsoTXaMvOaT1WODV/aEdRH+9/FcI3aps=;
        b=j0lxhLHgmVYAcnxlcnmHm7hZ1zAEnToQ4pBYC8axtIteSgnBscdaY3krhIPHtK2PQz
         EahOZ8W7/KAPMNKqnvue6zjT0fbmJawzP/SuwJXE6xd6TZh/xnprlZ+Y68MeAl6o2y4g
         ydGahOcKXmMdzTRegCzWTPN0eOz+YVNKKE+0d6CK8gKR5e9UI0tnq4z/ygKrSQ8lHtvE
         VLVxndv/09bJtv3BnFzWYy4HX4WBJ0nWyIgic+ACL992XFBOKZ1scBmgedIVQ51g8BGX
         7JW7BQOGx8efPmGKREPswSTjD+knOUSoTqC4sh86O8sDaHyKD3HepQyLebo7FDy6Y/C+
         NOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728356689; x=1728961489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QGhZ9VuDoP4GsoTXaMvOaT1WODV/aEdRH+9/FcI3aps=;
        b=okZGurDAV3IWa6j8WL8RuYiZOS42qv+YRMZGe3zOjK9o6gpEYuH7eg9+PZBBAp8PHV
         a9H/72kaJe7axI3vCAl2FkbDB7ynwA2pLWkZciMBfZvGso9f6yfK8Dc2N6S2AIvx3mPm
         D9W+GUGVtOBSHCiYnnqSwyc6yaK3/XJsSPa4nf+8EImNlQBgeDI0rx3h/yS/EqF05/6I
         BfhkZhVc4lTss3+ExlHkW/DS4o2QLmspTnQYGQVlMiq0MtagjfUnGbK7lDgLl6jXQmFj
         ZBPgiWH21o9jQ1l1jvPnpVUL/jJVuBSm6pjAclCHlbrDM3Tl31IxA2IRjsrbVnneS2je
         aJrg==
X-Gm-Message-State: AOJu0Yxa2zsxdpFQSg8/8iYBEAKyOSNwdnHl/akQGUAnsscsLp3iGCux
	Xq9j/paBVn/pVSV4A9mjioh5KDVN/uDuigNoTPunkAaPlMWGNXbP
X-Google-Smtp-Source: AGHT+IEogcPxh7rtiPjTL7FYbzz/R9JCFjhQzfI0u9Q655Yju+TjjSDcnvCTZAxwaHKGj7/ldWfmCQ==
X-Received: by 2002:a05:6214:4291:b0:6cb:4835:b1bc with SMTP id 6a1803df08f44-6cbba921706mr41803976d6.4.1728356689370;
        Mon, 07 Oct 2024 20:04:49 -0700 (PDT)
Received: from localhost.localdomain (ool-1826d901.dyn.optonline.net. [24.38.217.1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cba46f1912sm31107156d6.61.2024.10.07.20.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 20:04:48 -0700 (PDT)
From: Alex Lanzano <lanzano.alex@gmail.com>
To: u.kleine-koenig@baylibre.com,
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
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: [PATCH v10 0/2] Add driver for Sharp Memory LCD
Date: Mon,  7 Oct 2024 23:03:09 -0400
Message-ID: <20241008030341.329241-1-lanzano.alex@gmail.com>
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
 drivers/gpu/drm/tiny/Kconfig                  |  20 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/sharp-memory.c           | 669 ++++++++++++++++++
 5 files changed, 788 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sharp,ls010b7dh04.yaml
 create mode 100644 drivers/gpu/drm/tiny/sharp-memory.c

-- 
2.46.2

