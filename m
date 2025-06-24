Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B9D2222B2
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 24 Jun 2025 06:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750746456; cv=none; b=UfH6JkOfXsGFkjAy1RTsI9FzM3kIsAMhiYf91eALkPCrCtBovOGLUeDBCC9TrNBmUOMSlFNN2qI4fBYJ64a+Qo4zredVU/XrS6rvJ392yIMONsUQFQb+nG7XSBoIV/k2hEZ6nLkz1XG/+N8DVr4JNMT/H6NxUryLKlu2qUFiJSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750746456; c=relaxed/simple;
	bh=xkTiZpv/ASXY9zvmJWSVodQL9KYOVQ0OTX1/kMLhvsU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UpobmCeT3/GVTVgdKvO+RDiZlueX6SdpHDGq/L8I4qBb4yXrDjvJODcJnUXeXlPXFw2mMvNpSttUigAEvo2PFESw6E1eLxdE1WBk6LROWR4pUsViyaatD9FGSgaqSlrA/nJA3lv3p071o2e2UdjjzJgR5sLAVkJFxRIly/Vf83I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=Fk7Luo33; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="Fk7Luo33"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-2ea6dd628a7so51217fac.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 23 Jun 2025 23:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1750746453; x=1751351253; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jtWuSUmqyfHOpJX4FSI5IleGdX0aakm+epSuzbOI/jM=;
        b=Fk7Luo332rJC7KJ94cPp/L38t20m7MtmcBo1eo2WPipL74aV+Yia/5Dk12T6RjB2UT
         rVAcyC8YbyYcVtI9JbOcdZ64uvS/8HOLAUZDfbNCf+Vt253kS/fd+xxBigENOdi3u9Sb
         Mo3tepBAIsgAPz99dhQSI4KgOzJuEx8oOydS9AhHKoPl5uYLhzG7Ei89YlS9LTaJ1nyJ
         VlyuncnXcaPZeSP3sVkRdEw+IstoSeq8FtdH2G98zt9XbKMj1a0ixabbfKQnvi86zLAc
         GLQ2r92TnO5+JUeJZYdgWTKbO6sfwP28AgxDXIwTaHjIRrr4kGaDNfTpG1dG4hsAqysv
         gQjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750746453; x=1751351253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jtWuSUmqyfHOpJX4FSI5IleGdX0aakm+epSuzbOI/jM=;
        b=Ey6hFeTC3mz7HuHHXtHgdwFK56QCVQJ72m0tLy2gwzliNB8/zCw/l809e9NwO+apgF
         z2Cw0lYWiCqcIPI9b+GjBlHvxK5d1rNMyXsAj7Qwwq5Bg80Ou9uDFgaeSTzSR3kFoMYL
         cCQqkfeNB5YuFaAucN1RGbri0zJfdEmh8x44U+nzSqgb3A+bbmVgza4hSgxiA/kbNx3V
         sAAyFWKM57AbDvowhatbJpkUIJAs6bhHqM7BCfElS8j8VTqQhXBuwjNWIjfElfcLTh23
         bU5CG/VpEtDLN5vglnaL/uAvz7+PwzlP/uulBLlVknRzDLcevB5oEAUv0LeSJ/HW9O68
         bMBw==
X-Forwarded-Encrypted: i=1; AJvYcCXagCFDxya+3s/PoQppRf9tp/TNkeDkrliXBkESibzhNN9RMa8sztvKDGbx/6Bj4iG9Ssg9RLTm68cPLWhsd/b7Yt3NKw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxLLZrDUpzP1yI6HpAnYZYs4J0nCfPm83Ckpb63ATWpg4JQQXge
	CN9CgJviBWbYu2zI73ed/4QIGPHbdD8P+Sft2KwiYxzx/8puHMMS2uxW/TGTs4JfB5U=
X-Gm-Gg: ASbGnct2ht6oEzqx5KjjXLtKS9wL7M7mzd+6WXhHIuLbltCiGbXDfGptr08hC3SMIj0
	omOGuVI16rFJA4NX0dMfYCjW9+hv9TDk5NNvSrhqhdTQ8yIlloSailUqK6a+RLPf47+XeQ44HYa
	x553DE/mRwwzeJdwAD0B9iOwJ5u3VMu8dGVseVNsxap3ODbN1FFgdLzySim+ypnnEq/EKibvgFt
	LhmzHHn/ha6XV6LrFQcc3JpdVtvuoSiP9on+Hze0lNmYphCkjlTFrqxI8X+mXPjJWOTAtTTWTE6
	0X8iCk1AxqDxwyRzJjmUav7cWwcJMlct20tYU2Z2zVxgqNmJJJVYFH3bO7P/erd/4Qy0s2NXUCN
	r3bNpfbZUVmYfyu5y0wnoYACVuTw=
X-Google-Smtp-Source: AGHT+IGXzXncSuwViLxhLF7LjICBNjU3M6FzetwciG96U6KAFP9MbxjiOEvJ2Uymt/tfqzWTPe1Bbg==
X-Received: by 2002:a05:6870:f699:b0:2d4:e8fd:7ffb with SMTP id 586e51a60fabf-2eeda4d3058mr10282116fac.1.1750746452932;
        Mon, 23 Jun 2025 23:27:32 -0700 (PDT)
Received: from acerlaptop.tail542cf.ts.net ([2600:100e:b0c5:b996:8d65:22dd:1f32:69ca])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ee665ae530sm1957728fac.20.2025.06.23.23.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 23:27:32 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH] gpu: drm: Replace scnprintf() with sysfs_emit_at()
Date: Tue, 24 Jun 2025 00:27:27 -0600
Message-ID: <20250624062728.4424-1-me@brighamcampbell.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace scnprintf() with sysfs_emit_at() in drivers/gpu/drm/drm_sysfs.c.
Per kernel documentation, show() should only use sysfs_emit() or
sysfs_emit_at() when formatting the value to be returned to user space.

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---

I tested this patch with a device that outputs one specific resolution,
or "mode" and with a dummy device which has no output modes. I'd
appreciate Tested-by tags from anyone who can confirm that multi-mode
graphics adapters work as expected too.

 drivers/gpu/drm/drm_sysfs.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index 60c1f26edb6f..66d1fc804c84 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -283,8 +283,7 @@ static ssize_t modes_show(struct device *device,
 
 	mutex_lock(&connector->dev->mode_config.mutex);
 	list_for_each_entry(mode, &connector->modes, head) {
-		written += scnprintf(buf + written, PAGE_SIZE - written, "%s\n",
-				    mode->name);
+		written += sysfs_emit_at(buf, written, "%s\n", mode->name);
 	}
 	mutex_unlock(&connector->dev->mode_config.mutex);
 
-- 
2.50.0

