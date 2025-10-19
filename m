Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1AA2E7BDF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 19 Oct 2025 14:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760883184; cv=none; b=kR/i94aujNc3sldiQsZ0sZsfTgytamoRJyQhs7bJE4P3HUhSTLJet/TH3Yef90yPyy/avtTTtPEzuKL3F8DMiQH/DvwXCcBFU+xvkFuuMYt9QLPWDYCteOfOX/QixTE8dzvMeJHax97X+56ocp7CI8S/51bdb0NY/McaUA90DoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760883184; c=relaxed/simple;
	bh=OZvVTykIlBRbaETtgtNoTHwKA/K3IweojPWLke2286k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PdygpgG2KPjrlSQ89S8CV/5JREwhl0a8Bya65QLwsu0JPy98gD0CGFaJJm2IgSuYQu3hVk7gOnrEFUSW/xa5RLtMx1CDPv807/ThvDpZQcigJQMhfG1LXi1ubPKYPgXVAt8z2moK53Qbx07tKNggnhCREzxMtabaXw4SGAPRVIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ukm6mSbU; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ukm6mSbU"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE07561108
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 19 Oct 2025 14:13:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CzPi4X2T0pfD for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 19 Oct 2025 14:13:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A7A72610F6
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7A72610F6
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ukm6mSbU
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A7A72610F6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 19 Oct 2025 14:13:01 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b404a8be3f1so77968166b.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 19 Oct 2025 07:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760883179; x=1761487979; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OLOKqWlJM+Qls3gDoxvAM4+OyQdsVVtIrTMnLe6+7Bg=;
        b=Ukm6mSbUIdqI2TfAaw0FM7ZsZvCeoK6Ugfyeu1m7fohJXj6Kd4acbQL4au1kZOBDgA
         HZEgjJnCXmhdRnlrTZZZvrF3jZ/73ZRcziAwXltZCV8lN7S+3vsVge95fwk+oYtypuKt
         I5N7hjJcHHyt8rJzqzK87SXG85LFN3cjNbVf1NIGDmbCHx+oA45Ot3pT3NhrasfwuI6e
         L6N1yyxTlcZdtdEqZmcAFarEn2QYivsnDdfyiACa8QCmi3pBppSbACf13IlJMRaGuh17
         6O4DA682Abz6MofJwCr8aD5yq9XzdNUi3RvtG/4PCGVuQV7rS23qn1LW/5s31o6t+xAg
         X1Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760883179; x=1761487979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OLOKqWlJM+Qls3gDoxvAM4+OyQdsVVtIrTMnLe6+7Bg=;
        b=t7WTJoDXYuB/cGXCvguaKZKlKemErNw9VyzvX9Ye3ScJGZQ8d2+67fYVejv8VrK2pc
         owYzewJLosyfTVeRhhWmUsK8dp883St7cCwFwlpKlcWzfjHrxtXJpswhAREV+TKPoEq8
         HR+g2ktNkNyD3tY9DCIiQgHfMaVFA4ovWr1ijBVozUGxSQMnCbi5+anwfykN/PhKrJa3
         SfDTZ/TnOzT0AbthKbZ8C/xdLQHLCmIfYHVElfAZzJT04GeCjL96af770qKUwVWosXGa
         T9tV/6bthKUZt6NFRR0LuPyAkcjl+XJG+IHrv/oeVLkLUlpSCpSqdUw2dek9RTyZs09c
         BVdA==
X-Forwarded-Encrypted: i=1; AJvYcCWgHykItIm3qon89ky0YS18qC132R23nf+6CjhtPA5BmPQMaDuYFV27PSZ9q0c7jn620QFfb4nl2JNSs36YKWyXPKC7bw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwxQKARE9KtOf13XF9eCi7HYoCM/1lzI+uk9QmOzlqlh+8a+zM+
	snbCvNxnKWKBR/8Z84KvycRrTqcGjV/zrnAvBowrUl5jpQz2m+ZwuPi6
X-Gm-Gg: ASbGncuyWcowpPOY/KI+m8cWR1At/fa5sRlCMrGrGP6dEoS4TqdFgQFr/e5gNaS8Yca
	uJFxmFlssGfbQuz+aAos4ntrOphgum+9uZB443KyD7wh7UWwAGYZpHYHTwhEcjN10lNsmoWtLvJ
	zOd4vARibaxfpH0ItJsSHHp18DNTgXMd2g19PaPsa0B/cJLKsGkAHGHzLVSbW76Iy2dj2VpbWpo
	bfduHCF2OEjFeZSdCCh4YoaKuKaa1+igzQ2fwb33DXhHzj5tDl2dvWb5jnb7wxuL5+cHOABEELq
	kAyUDZJfBmxxWD44cR05YPYH/pnYGWGGnquA7jpii+bdW9Mz8WTlbpRBIZON/hQ9Y+gHWJ4x0Z9
	VEcasj5r86bgCgCXiHAEiE+SgcKCzqEf+v7Z1fnjSiH2uYSk7nwe9tVUymojRJcEcyfk4Uag4UX
	QCL8PE
X-Google-Smtp-Source: AGHT+IF6kFqxZjmdvkiQmumLp5yXtfBfsGWcBoAvxoX6/vIZKFSk3vlT0KQXPw3Y30vQ7ooRKt1BnA==
X-Received: by 2002:a05:6402:2681:b0:634:52c3:20f5 with SMTP id 4fb4d7f45d1cf-63c1f5738aamr5377085a12.0.1760883178967;
        Sun, 19 Oct 2025 07:12:58 -0700 (PDT)
Received: from bhk ([165.50.121.102])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c4949bfd3sm4212111a12.41.2025.10.19.07.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 07:12:58 -0700 (PDT)
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
Subject: [PATCH] drm/tiny: Use kmalloc_array() instead of kmalloc()
Date: Sun, 19 Oct 2025 16:12:28 +0100
Message-ID: <20251019151247.171558-1-mehdi.benhadjkhelifa@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace kmalloc() with kmalloc_array() to correctly
handle array allocations and benefit from built-in overflow checking[1].

[1]:https://docs.kernel.org/process/deprecated.html

Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
---
 drivers/gpu/drm/tiny/repaper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
index 4824f863fdba..290132c24ff9 100644
--- a/drivers/gpu/drm/tiny/repaper.c
+++ b/drivers/gpu/drm/tiny/repaper.c
@@ -534,7 +534,7 @@ static int repaper_fb_dirty(struct drm_framebuffer *fb, const struct iosys_map *
 	DRM_DEBUG("Flushing [FB:%d] st=%ums\n", fb->base.id,
 		  epd->factored_stage_time);
 
-	buf = kmalloc(fb->width * fb->height / 8, GFP_KERNEL);
+	buf = kmalloc_array(fb->height / 8, fb->width, GFP_KERNEL);
 	if (!buf) {
 		ret = -ENOMEM;
 		goto out_exit;
-- 
2.51.1.dirty

