Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DD41F4295
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 11 Feb 2025 10:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739269395; cv=none; b=qRoDXLO1vnIQOVCXnrSPvaYYgqBEnDCHYs9bxha8PCrzxmJH7hu5x4aob/roLtzpUTmwCyX8+sEeLrgoScxcQNvQPZuyUFU7u3pzF+uG9AbVkgjN7lZJ9RmZtoEqF3FaHewd41igYxbbajIbKHq2gBbobrp+HwTb9gYjG+1nALQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739269395; c=relaxed/simple;
	bh=7gkiFUdcb0gYKQOEYScuWQUf2plqI1v9qKLm0MkxY1c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UKbs2T0JJCDwk2OtSnfcQpGGaiiZpPdZhGdy1Xqu7pFjJr3NKo8XR3znkksOz13715ssJYfJzeo8RkN/0UgjOGX891Yuuz8xsYMlkQgbEjX+ZN1BrCAdCOhmBBcbQ1EyIRrk1t8MuRq0rSXV4pnxKwwnw+IsNVw6rw9bk3V9qQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SjBxyGdU; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SjBxyGdU"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D929F825BF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 11 Feb 2025 10:23:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zdun6eQfsqza for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2025 10:23:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=duttaditya18@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1A5DF824DD
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A5DF824DD
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SjBxyGdU
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1A5DF824DD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 11 Feb 2025 10:23:12 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2fa0f222530so9806114a91.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 11 Feb 2025 02:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739269392; x=1739874192; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yNUSfX7eO+cmTPTl6G2d4kERHxGcLvqZO8iyv33AFPY=;
        b=SjBxyGdU1XmO/UDt412cu+bTWPB0j3oWNSvi3f7C4C350JsGD4/c5xKPNENwSWF4Pc
         VuOrBzz0xuKMG3vWO4/pQgFMRbolW4EW2Y+mXyQ4uEx6DYKhSzq76MZe6yYimzySlafn
         LRd9CIoD+6FsEj0yKTYrKWE2xg3edkvrrp/IDdgqOaBdQvaEA5zEsB/AtDgUAa6p9+sK
         CyLtlriiwEgmnzbypgQftbXJHK88ykrJFzPJ4QguaOkV8ceKw+qQ8PdHyWGukOMX0UWC
         qAOQB024yKTVF73rne518gxIdWiwaCzUqkwT1kM965gCofo87t4BclDVqrVxdIP9QP2r
         JPRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739269392; x=1739874192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yNUSfX7eO+cmTPTl6G2d4kERHxGcLvqZO8iyv33AFPY=;
        b=MsAk0PDGSajMDSDFFbfDB0FCgcb+g2hARc7XY8CdiLOQO66aSuwez6BeJuEzJiWYAF
         227xuSeuNPBCwAwtOylZtjhOrOzcUgwklqWo+zkiwWP5zxBQ2CkFq3tMWJEzdYcPYqko
         ymKf+NGH+5I0yjBo7mTJzvj+9QTwAw3s8Mt+yqk9uWBun3RYJbkJpz0HrKQka0pR7MM+
         mfYH7eMlCW6wZP/9mcKSBov/aCGNVfrT4aemXdK3mBz+hLlXzSzwnlxQHuOXOLmj/VoB
         oW+nAhtIE3a1Ydi+7O6CeL4sDU8prbn2LMVo0drYpRPGiV9VqRcEKu/08FJLqR4SJNC3
         StVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXHdHKV123IqsHxV6CMXMBjPeDTiJKCaoIZnYvYxF5/Kxvp+ZzXpx+KYWUFAmuZGjloXJqzP7RWuv8OL8smE6fAvVGbQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yx7fAcK8kxKxSdVefeThpXb6qoWxJcLKOVPaO+rcS3XCsTB4ZG5
	zIazbjXXqbESoTFRfxc1DkTgybupXMGdQwZSTqGEUQWp4pnNwcZw
X-Gm-Gg: ASbGnctG48LxIK3JOJcg/2dSTaVkSErt6Bmg3xM75mbKTSRWGUyWA7A0DN3VMxXYHNc
	RKM3h7M0ol4Z1aQgACbWMCUqZZLbnTNfK8lrO1jc4HGWj19cNINOiGl2YCTq7FGxYJKPfU2wlv5
	1CGMgYB8WSL0ol94qLFnG6dtb7FmPHu3wcAucdAIlICAR+bvL+cMkDRytf0F3wzv5LYry8z5JQa
	jk1sIcJgJpKX6tdrO4ASX33YldpwasK2nBthO5iPeK+pexltyKOQNyDYS6r0VexwKgtcElaSeJ3
	ZpBqvaV6irLMGsHuvCY=
X-Google-Smtp-Source: AGHT+IGTWse2dOartYTkk3C2PWo6EDO3+yLZq21aVlgmvJwCW1e/Vx5WpWj7JQ1Tn8qEgiNu/YLRng==
X-Received: by 2002:a17:90b:3dc3:b0:2ee:edae:75e with SMTP id 98e67ed59e1d1-2fa24067d7amr25467131a91.13.1739269392236;
        Tue, 11 Feb 2025 02:23:12 -0800 (PST)
Received: from pop-os.. ([2401:4900:4e6e:cd6d:2732:b5a2:e46f:2ac5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa44aa6657sm7300372a91.38.2025.02.11.02.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 02:23:11 -0800 (PST)
From: Aditya Dutt <duttaditya18@gmail.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Aditya Dutt <duttaditya18@gmail.com>
Subject: [PATCH] Documentation/driver-api: fixed spelling mistakes
Date: Tue, 11 Feb 2025 15:53:03 +0530
Message-Id: <20250211102303.197763-1-duttaditya18@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed some spelling mistakes identified by misspell tool.
The example code in Documentation/driver-api/nvdimm/nvdimm.rst contained a
misspelled identifier (paramaters instead of parameters).
This typo would have caused a compilation error if copied as-is.

Signed-off-by: Aditya Dutt <duttaditya18@gmail.com>
---

This is my first patch. I was sure to make patch against the docs-next
tree.

 Documentation/driver-api/media/drivers/zoran.rst            | 2 +-
 Documentation/driver-api/media/maintainer-entry-profile.rst | 2 +-
 Documentation/driver-api/nvdimm/nvdimm.rst                  | 6 +++---
 Documentation/driver-api/pm/devices.rst                     | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/driver-api/media/drivers/zoran.rst b/Documentation/driver-api/media/drivers/zoran.rst
index b205e10c3154..3e05b7f0442a 100644
--- a/Documentation/driver-api/media/drivers/zoran.rst
+++ b/Documentation/driver-api/media/drivers/zoran.rst
@@ -222,7 +222,7 @@ The CCIR - I uses the PAL colorsystem, and is used in Great Britain, Hong Kong,
 Ireland, Nigeria, South Africa.
 
 The CCIR - N uses the PAL colorsystem and PAL frame size but the NTSC framerate,
-and is used in Argentinia, Uruguay, an a few others
+and is used in Argentina, Uruguay, an a few others
 
 We do not talk about how the audio is broadcast !
 
diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst b/Documentation/driver-api/media/maintainer-entry-profile.rst
index ffc712a5f632..ad96a89ee916 100644
--- a/Documentation/driver-api/media/maintainer-entry-profile.rst
+++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
@@ -116,7 +116,7 @@ CEC drivers		``cec-compliance``
 .. [3] The ``v4l2-compliance`` also covers the media controller usage inside
        V4L2 drivers.
 
-Other compilance tools are under development to check other parts of the
+Other compliance tools are under development to check other parts of the
 subsystem.
 
 Those tests need to pass before the patches go upstream.
diff --git a/Documentation/driver-api/nvdimm/nvdimm.rst b/Documentation/driver-api/nvdimm/nvdimm.rst
index ca16b5acbf30..c205efa4d45b 100644
--- a/Documentation/driver-api/nvdimm/nvdimm.rst
+++ b/Documentation/driver-api/nvdimm/nvdimm.rst
@@ -535,12 +535,12 @@ internally with a static identifier::
           char devname[50];
 
           snprintf(devname, sizeof(devname), "namespace%d.%d",
-                          ndctl_region_get_id(region), paramaters->id);
+                          ndctl_region_get_id(region), parameters->id);
 
           ndctl_namespace_set_alt_name(ndns, devname);
           /* 'uuid' must be set prior to setting size! */
-          ndctl_namespace_set_uuid(ndns, paramaters->uuid);
-          ndctl_namespace_set_size(ndns, paramaters->size);
+          ndctl_namespace_set_uuid(ndns, parameters->uuid);
+          ndctl_namespace_set_size(ndns, parameters->size);
           /* unlike pmem namespaces, blk namespaces have a sector size */
           if (parameters->lbasize)
                   ndctl_namespace_set_sector_size(ndns, parameters->lbasize);
diff --git a/Documentation/driver-api/pm/devices.rst b/Documentation/driver-api/pm/devices.rst
index d448cb57df86..8d86d5da4023 100644
--- a/Documentation/driver-api/pm/devices.rst
+++ b/Documentation/driver-api/pm/devices.rst
@@ -358,7 +358,7 @@ the phases are: ``prepare``, ``suspend``, ``suspend_late``, ``suspend_noirq``.
 	is probed against the device in question by passing them to the
 	:c:func:`dev_pm_set_driver_flags` helper function.]  If the first of
 	these flags is set, the PM core will not apply the direct-complete
-	procedure described above to the given device and, consequenty, to any
+	procedure described above to the given device and, consequently, to any
 	of its ancestors.  The second flag, when set, informs the middle layer
 	code (bus types, device types, PM domains, classes) that it should take
 	the return value of the ``->prepare`` callback provided by the driver
-- 
2.34.1

