Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED75246783
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 10:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760957898; cv=none; b=g1LhhqKTxG55CnpOD+9z9wpdCFK/WW81FFXzp1YdEJAE7K2nh80hswJo7lIvkhQ7CfRfaEvmuOZEZaG6FWUazYBhKntYc71Is8Od5G0HNoSthdvpypgNceLNxhP8I6MPWLG9V5B5exAS5IQKi0feIyK7s4k5JA8Oie47QKSsTJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760957898; c=relaxed/simple;
	bh=Iu/q4CpFhSAJM0jEkgFHmScAOFtrgsT2qvatKDMc2d8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dW3cUXNMzU+zyJ6/Yvk3zyo9XUlJ1Z1NnTCzl7ejf8pQCD+CSwdKcV/e9Qxq438V7kgGRU5ipM8A+GtBvSoDbqcbCPrY40ntQ+BPtIOK/Is56SVkpa4rY/vJ/dhK5akjFG/07JbBShbdcgpOIpIIu4/td6LuvsNBZOd+nSiJZh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gUXlOFSR; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gUXlOFSR"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDCC96144B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 10:58:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZVcHjZHtn3na for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Oct 2025 10:58:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F018561448
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F018561448
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gUXlOFSR
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	by smtp3.osuosl.org (Postfix) with ESMTPS id F018561448
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 10:58:15 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b3c76f3703cso72350366b.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 03:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760957894; x=1761562694; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GkFaQ1bopt/VkRBUzrDCpvzpaSMPfW8Xt+ULvEdICqg=;
        b=gUXlOFSRy6oiK5dctzZwQG+UlCjrpu7+YOE2AyHoPeMJQhhO3t0OX3Q9JywqddWHTp
         mu5LeEz4l5i0xAIOx5+/O3W+sXZK3BEabTm0ytxeAQkDCWikwY+zo9HiMjQIrZf1jGq0
         jk+hSkI4uEITAVdgSK+9XPEmnCHTRUEg4w+MGYQa9kRoZM1ZS4VI0rK+mXdFz+M9KQXc
         3HVpaoQ95ObcxGhLYr/GJj0lY3GHfJwNSiD3MdW3+TojBvzwzUKvdqazGMjzwdMFkxSN
         YsBfuyn0yqCgpAf0m26TNw+65vFi4JJPjQqpM1YGD2s6DisAtwmpT+boTO21SCjbiPbO
         dUKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760957894; x=1761562694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GkFaQ1bopt/VkRBUzrDCpvzpaSMPfW8Xt+ULvEdICqg=;
        b=v4Nk3GYxyM0B/OfJsTq5GBzIkPGLCC9rIjjlG3cnxAo0SXQHUQEAi3eGBWa84LWBzC
         5nAIlQDKdQadqKW8aPew0NqJOc5FpZuxaGllQj+cV5ek9zA1dCrfuY5WT+uNfH4fdoXV
         fglWMxCGvqCLiTErJsa1Lltl1YGAR+P00bvZ9SP3Y7lrcq7xm76AH2kas6fwYwU6P064
         FI+tgrDZcsc/KnkxyfH7nu50CqrPvUi42DXueY/Hw5SNVV/SuHYnyoIHld0MIDG4INkN
         6k6mv8T3MuSvoBA0wIxSibQt0Yprddr6Y7vx7vyBUVYBH3RjMHUGE4ZOd/KXAY1VPtxD
         u7Hg==
X-Forwarded-Encrypted: i=1; AJvYcCVzDV2ZwEneNC/UmtLfvkJzx7iLKmH4s8S9ke918+YsQkNO4zxN5a/78nWjR/S9pn8ka0BaItB7/u4mmI4/WV8to91fQA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyAHA5Zfm7+9HzDRGaZX1ibq16Q4cmqmrwrvEf9K9lJPrY6CrIr
	s+6GkB8C9qFQZwed+QGdL4PeahWIlgc5hbDxOhVl+ATSmWE9B3UJd/3m
X-Gm-Gg: ASbGncsLp282Ldom11EmHrzJGUvZgb8EwLeZVmrqj1ttUoC/fYSCX340iUTc0vW8nam
	qMcm6Jfzwa75E7K+F1mn4jf3S5QCr7Beo0/Q7CUSv+rZisZwTzC7nLIvbXC4v4+atP+gNDMrL4r
	Y0qxmW+v5d4KPRYRijGhwXXpOZJIu9uBC2/HrY2IO88m8mGk9JS4KHhjBSOcdV/jtChxMh0pgCJ
	1fp6klXByGOMvNXBTct4eYlk3nDnGf97zjR0assdQcwyNotYZYe3obHMVzFik+E42qFlZNFbCLQ
	nfQYWNw1Jjg04TwAycmOZKGMjoeByZOeqmVeuadtJeZ9wH4ALpvJ03NOsG57gm3nqaBVT+3NkqP
	m1lsEw7yWzUTPUlGJ0eyr05wVXWNdJDsLvzTSS0tvs9JpRjZH7HGE4cfuVA+fmx6Ls6iI3Izwam
	I3m2c=
X-Google-Smtp-Source: AGHT+IFonlP9IIaHnKYJ1FGKly6VFGVY9U/JNDCz4I3ar5aMmaJr0RPUUSGZ9EBntxqPtU8gcUrFxg==
X-Received: by 2002:a17:906:9f86:b0:b3d:5088:2140 with SMTP id a640c23a62f3a-b6472353d0emr769387166b.3.1760957893588;
        Mon, 20 Oct 2025 03:58:13 -0700 (PDT)
Received: from bhk ([165.50.81.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e8971897sm751474166b.37.2025.10.20.03.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 03:58:13 -0700 (PDT)
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
To: lanzano.alex@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
Subject: [PATCH] drm/tiny: Refactor framebuffer's size calculation
Date: Mon, 20 Oct 2025 12:57:23 +0100
Message-ID: <20251020115803.192572-1-mehdi.benhadjkhelifa@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use drm_format_info_min_pitch() to calculate the framebuffer line pitch
instead of directly multiplying width and height. This aligns with DRM
helpers for determining per-line byte size and avoids manual assumptions
about bytes per pixel.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
---
 drivers/gpu/drm/tiny/repaper.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
index 4824f863fdba..aeff49bc6ba7 100644
--- a/drivers/gpu/drm/tiny/repaper.c
+++ b/drivers/gpu/drm/tiny/repaper.c
@@ -517,6 +517,8 @@ static int repaper_fb_dirty(struct drm_framebuffer *fb, const struct iosys_map *
 	unsigned int dst_pitch = 0;
 	struct iosys_map dst;
 	struct drm_rect clip;
+	const struct drm_format_info *info = fb->format;
+	size_t pitch;
 	int idx, ret = 0;
 	u8 *buf = NULL;
 
@@ -534,7 +536,9 @@ static int repaper_fb_dirty(struct drm_framebuffer *fb, const struct iosys_map *
 	DRM_DEBUG("Flushing [FB:%d] st=%ums\n", fb->base.id,
 		  epd->factored_stage_time);
 
-	buf = kmalloc(fb->width * fb->height / 8, GFP_KERNEL);
+	pitch = drm_format_info_min_pitch(info, 0, fb->width);
+
+	buf = kmalloc_array(fb->height, pitch, GFP_KERNEL);
 	if (!buf) {
 		ret = -ENOMEM;
 		goto out_exit;
-- 
2.51.1.dirty

