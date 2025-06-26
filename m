Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B88F28983D
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 26 Jun 2025 14:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750947779; cv=none; b=l/ASPDLoJJ1hbtQXgF+sIgW3keP46xLNIDeyRTW15BX5eK2BwVY25+IKj0Ks5xBDfXWwAWlKIGHvHvzRSIT5ymb8Vvh9FGN/Qk0r80QKzfQuh1n4kvfzD+s2frn86Y8YE++XzRl0p1APL87PabD9XwUsmW4HmNMLmXcBdaEz9ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750947779; c=relaxed/simple;
	bh=VnAzg56f+hysQJZPOLXhBXL0My2caz2gxoa80MYeNr8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=W93bWyFM66UA7ItKT6bqrPSbiTec0ndK1rHDA1Rr5LpWleQI2+NoeqaJPVrIRgS0WUt3keD7G/JCVEm9jxzUQb+Nlt6Ic+WbZKWB8CilNXZVas2ij94bfIs2xIzjEk8fXcQLZjWnMLAoQmab6OspmYDOIf3xYmU3ryBk0hp4trM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fRXQroMh; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fRXQroMh"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7490acf57b9so855874b3a.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 26 Jun 2025 07:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750947777; x=1751552577; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FMM3xSjjvtkN9sNymINSQ4aTR9MjXM5qmSlYZv1dEyw=;
        b=fRXQroMhzo7HlMEPCewJIiwoUgyV6pMzaKnesD/krQBvMFxtu2ImFAf4oUWSrktLOD
         bHsACMz2q7KOyabulYX0BpcqXhw9N3/jJ650kXAQbNsjlmri87WihrCEecmfYJChHNOR
         mLfY0r5QB1dqJhInkuLCb0y4tqOD1IqBmHfVTzzyaotOQa5uKGiuh5uSwZLS+tlQCn3D
         g2zw/QAD4ng33AXogj27gmV0UXrf2it8B20HNK0roAKqyYn8dixI0wGUkQXmlBwssH0i
         RSdyVZPzbB6QZ9f10UKGgDmUUuKJZoZrDP9kntcbLI9nl1NCxSyxOx5PwPx5Npu940/X
         QAoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750947777; x=1751552577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FMM3xSjjvtkN9sNymINSQ4aTR9MjXM5qmSlYZv1dEyw=;
        b=r/Ah6fRH7eUTtQRgniNeZZvZLle4alMWa3zSIxQ0ZkiTF3TS0NEm4k0BUgRPZpqCal
         BkQFQ+GSxwdyfwVIqPv916Pk7AV5RYvZfMjxCmE0AXF+2yiKzZbQEtP9Li9J7ht8jh+l
         b4n+wAtLRStKw31dzmAXEIOTGBGZh6Bu9B6is0ExsRS2fvCGSyhVJPDJPXgM+aH+S+Gk
         BzRpekjG/sodF9fHQljWg9RQ8N5suLeme5rjjl8DWMn0JFceus87h2bCSzA8j/5/Pgfg
         12oldXj5sbt6Ilf2OTnGNXLm37F6tG1mfkPvVxAUXXikM8sBuHjqcgVuP0gG4TEM3xPy
         dvjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTg7NQBJ+94HhJOeaI/RZFcYL941+MIU8LpR9LGVOm0vW2Kc2PiqXPJiU+JZXrT1+2aalh+FBsxApFkA1MDr1Klas4zQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzNPpHi4KB/NrNgWG66nF/iW0XVSHNnVX0W9pPUMeFVumc/eJ/0
	Pk9sf56CGsthC2y3N1dRIs27CfS7bplgOANtjT/4QPrUGPKpaE1TNm2J
X-Gm-Gg: ASbGncuk6PcJclOWNEvkvxq+yv3+mtNFW4sx7rB+q4C6CdCSpBELemolZJ42+iHrelk
	16TaMNP6nsK5dGQmfuI8vkW7A8vlyq0rzjPiq9krzdz0YtXL0kAaGBly2s9++pXQGSlOoW1Gps2
	r9VNCcPcGettT7p403tbFyRhl3IEcArDJvyVlwjQJBqgGUF+uPGQ2cyj5KL+Ej27GKaDMO5rKO0
	AliG9yAjO9PE+TfiXPB/Fg+rWRrU6V8i7J921xwzm+Fmz3UygZsCyL1rKEMnps2AoH5AHdlOHY3
	XEQeI4/g49V3bRZoERF0QauHEId9dadPz3YmhoN4oBI3wUw0jfEYSy3chKjVcoVoEypsinWkqXO
	+CrKzBlw/XFNW1abdxw==
X-Google-Smtp-Source: AGHT+IHvPgEXqKwWC3H8FLqec238NOxqpv7452gpGXmtMjCrr6s266Ccdd9P8x3NxP0Pg4hK8zFHVA==
X-Received: by 2002:a05:6a21:3298:b0:1f5:591b:4f7a with SMTP id adf61e73a8af0-2207f31ac43mr11593474637.38.1750947777297;
        Thu, 26 Jun 2025 07:22:57 -0700 (PDT)
Received: from manjaro.domain.name ([2401:4900:1c67:6116:afb5:b6ab:2dc8:4a21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749c8872629sm7129288b3a.164.2025.06.26.07.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 07:22:56 -0700 (PDT)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: rodrigosiqueiramelo@gmail.com,
	melissa.srw@gmail.com,
	hamohammed.sa@gmail.com,
	daniel@ffwll.ch,
	airlied@linux.ie,
	mcanal@igalia.com,
	arthurgrillo@riseup.net,
	mairacanal@riseup.net,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	stable@vger.kernel.org,
	gregkh@linuxfoundation.org,
	sashal@kernel.org,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH] drm/vkms: Fix race-condition between the hrtimer and the atomic commit
Date: Thu, 26 Jun 2025 19:52:43 +0530
Message-ID: <20250626142243.19071-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Maíra Canal <mcanal@igalia.com>

[ Upstream commit a0e6a017ab56936c0405fe914a793b241ed25ee0 ]

Currently, it is possible for the composer to be set as enabled and then
as disabled without a proper call for the vkms_vblank_simulate(). This
is problematic, because the driver would skip one CRC output, causing CRC
tests to fail. Therefore, we need to make sure that, for each time the
composer is set as enabled, a composer job is added to the queue.

In order to provide this guarantee, add a mutex that will lock before
the composer is set as enabled and will unlock only after the composer
job is added to the queue. This way, we can have a guarantee that the
driver won't skip a CRC entry.

This race-condition is affecting the IGT test "writeback-check-output",
making the test fail and also, leaking writeback framebuffers, as the
writeback job is queued, but it is not signaled. This patch avoids both
problems.

[v2]:
    * Create a new mutex and keep the spinlock across the atomic commit in
      order to avoid interrupts that could result in deadlocks.

[ Backport to 5.15: context cleanly applied with no semantic changes.
Build-tested. ]

Signed-off-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Arthur Grillo <arthurgrillo@riseup.net>
Signed-off-by: Maíra Canal <mairacanal@riseup.net>
Link: https://patchwork.freedesktop.org/patch/msgid/20230523123207.173976-1-mcanal@igalia.com
Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 9 +++++++--
 drivers/gpu/drm/vkms/vkms_crtc.c     | 9 +++++----
 drivers/gpu/drm/vkms/vkms_drv.h      | 4 +++-
 3 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 9e8204be9a14..77fced36af55 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -332,10 +332,15 @@ void vkms_set_composer(struct vkms_output *out, bool enabled)
 	if (enabled)
 		drm_crtc_vblank_get(&out->crtc);
 
-	spin_lock_irq(&out->lock);
+	mutex_lock(&out->enabled_lock);
 	old_enabled = out->composer_enabled;
 	out->composer_enabled = enabled;
-	spin_unlock_irq(&out->lock);
+
+	/* the composition wasn't enabled, so unlock the lock to make sure the lock
+	 * will be balanced even if we have a failed commit
+	 */
+	if (!out->composer_enabled)
+		mutex_unlock(&out->enabled_lock);
 
 	if (old_enabled)
 		drm_crtc_vblank_put(&out->crtc);
diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 57bbd32e9beb..1b02dee8587a 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -16,7 +16,7 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
 	struct drm_crtc *crtc = &output->crtc;
 	struct vkms_crtc_state *state;
 	u64 ret_overrun;
-	bool ret, fence_cookie;
+	bool ret, fence_cookie, composer_enabled;
 
 	fence_cookie = dma_fence_begin_signalling();
 
@@ -25,15 +25,15 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
 	if (ret_overrun != 1)
 		pr_warn("%s: vblank timer overrun\n", __func__);
 
-	spin_lock(&output->lock);
 	ret = drm_crtc_handle_vblank(crtc);
 	if (!ret)
 		DRM_ERROR("vkms failure on handling vblank");
 
 	state = output->composer_state;
-	spin_unlock(&output->lock);
+	composer_enabled = output->composer_enabled;
+	mutex_unlock(&output->enabled_lock);
 
-	if (state && output->composer_enabled) {
+	if (state && composer_enabled) {
 		u64 frame = drm_crtc_accurate_vblank_count(crtc);
 
 		/* update frame_start only if a queued vkms_composer_worker()
@@ -293,6 +293,7 @@ int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
 
 	spin_lock_init(&vkms_out->lock);
 	spin_lock_init(&vkms_out->composer_lock);
+	mutex_init(&vkms_out->enabled_lock);
 
 	vkms_out->composer_workq = alloc_ordered_workqueue("vkms_composer", 0);
 	if (!vkms_out->composer_workq)
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index d48c23d40ce5..666997e2bcab 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -83,8 +83,10 @@ struct vkms_output {
 	struct workqueue_struct *composer_workq;
 	/* protects concurrent access to composer */
 	spinlock_t lock;
+	/* guarantees that if the composer is enabled, a job will be queued */
+	struct mutex enabled_lock;
 
-	/* protected by @lock */
+	/* protected by @enabled_lock */
 	bool composer_enabled;
 	struct vkms_crtc_state *composer_state;
 
-- 
2.49.0

