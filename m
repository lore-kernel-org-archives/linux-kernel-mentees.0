Return-Path: <SRS0=ojZq=NQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94307C4320E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 Aug 2021 10:27:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E146611EF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 Aug 2021 10:27:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4E146611EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2323A402B7;
	Wed, 25 Aug 2021 10:27:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j0NRuJyZumAT; Wed, 25 Aug 2021 10:27:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 2E0D5400E5;
	Wed, 25 Aug 2021 10:27:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0B5B5C0010;
	Wed, 25 Aug 2021 10:27:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 50A80C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Aug 2021 10:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30F034074C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Aug 2021 10:27:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q8Qe6G5Yp6PR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Aug 2021 10:27:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 50C9B406DC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Aug 2021 10:27:07 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id n18so22639093pgm.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Aug 2021 03:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZiZptxAG6LZlwjR95iOzUI6M5xQ+c4I+M1PZ5LikpHE=;
 b=hBK8jLnz+Qvhn9vJow4RjUvNtdb4EOIVfTN9Df0pqvZGRzhpFOHLBNw4tmkYhbXP0O
 i3vrPrX8jjED7W2mAwTWfMFP5b7/t2FRtMrR0FJSt/U864PEVKnvw/mdUciFtytnvkm2
 1l5QOWUEHAkfaK5MP7d9rEzDG7b4YQiT4Z5Cvh2ZeCvnFXVF1B6kGaeXbj01mPn4oFtn
 gCHjyg6d0MeG30CGzA/ue2z4P+bVseZblBqnXX57g2D7sc4DuEahkPuGRf9MgePRzusT
 lo55pmUHaBLL0JHGbN9FHNSYfBZu7+fWjP0aiJ0i3PCkjFF7P/w2CHrn5k/U/+cLQ1fi
 L3lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZiZptxAG6LZlwjR95iOzUI6M5xQ+c4I+M1PZ5LikpHE=;
 b=OKhejCgQ9WZQ4BujDEZ9a6N8nOnLyLxdpMIQutymL5zqp5H/G3uic0grl4cAoCXOCk
 DiKQOB1GmhdlU1LAQzSeykdrq38FIFxHbIpDjKt+Mug5OnRBv2hfOaQEYlbGDI+1/TN/
 0+zDy6G3KZoAbteSx55iOo6Ur3l6YPhmLFpRS3ygymzAxmiTRCM+wMfg0sTZ3Neyw+zh
 VyoGJ9b4SCnOImMpN6qysFjjeV1rOxmGEpZguzbofORdW/k7SNQvY+xmszsavBBSO3RY
 WK1ZO+2fPJB+vtaRgtsL4d1FE2ft5+tbkiJDeEImSU4DHzeTR1g9vVMslFjf0aLtFvnX
 u/8g==
X-Gm-Message-State: AOAM532M9KAoELwv4Ni7M66sJ2KpXDF3hVJa+vib5OWo/sA7nTwlh5zJ
 //aWRUcu17Qy5VzyZMrJVyM=
X-Google-Smtp-Source: ABdhPJwpGHyw/JNX8vQV+9CxZcjmMtcAfrqRTNZJ2G1s/7vSRd37Xu0JMq88+7TSzkG9QKgoG6Pv9A==
X-Received: by 2002:a05:6a00:2491:b0:3ef:5233:8f6 with SMTP id
 c17-20020a056a00249100b003ef523308f6mr3421378pfv.45.1629887226719; 
 Wed, 25 Aug 2021 03:27:06 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id t42sm10228377pfg.30.2021.08.25.03.26.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 03:27:06 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 chris@chris-wilson.co.uk, ville.syrjala@linux.intel.com,
 matthew.auld@intel.com, dan.carpenter@oracle.com, tvrtko.ursulin@intel.com,
 matthew.d.roper@intel.com, lucas.demarchi@intel.com, karthik.b.s@intel.com,
 jose.souza@intel.com, manasi.d.navare@intel.com, airlied@redhat.com,
 aditya.swarup@intel.com, andrescj@chromium.org,
 linux-graphics-maintainer@vmware.com, zackr@vmware.com
Subject: [PATCH v6 7/7] drm: remove drm_file.master_lookup_lock
Date: Wed, 25 Aug 2021 18:24:11 +0800
Message-Id: <20210825102411.1084220-8-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210825102411.1084220-1-desmondcheongzx@gmail.com>
References: <20210825102411.1084220-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Previously, master_lookup_lock was introduced in
commit 0b0860a3cf5e ("drm: serialize drm_file.master with a new
spinlock") to serialize accesses to drm_file.master. This then allowed
us to write drm_file_get_master in commit 56f0729a510f ("drm: protect
drm_master pointers in drm_lease.c").

The rationale behind introducing a new spinlock at the time was that
the other lock that could have been used (drm_device.master_mutex) was
the outermost lock, so embedding calls to drm_file_get_master and
drm_is_current_master in various functions easily caused us to invert
the lock hierarchy.

Following the conversion of master_mutex into a rwsem, and its use to
plug races with modesetting rights, we've untangled some lock
hierarchies and removed the need for using drm_file_get_master and the
unlocked version of drm_is_current_master in multiple places.

Hence, we can take this opportunity to clean up the locking design by
replacing master_lookup_lock with drm_device.master_rwsem.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_auth.c     | 19 +++++++------------
 drivers/gpu/drm/drm_file.c     |  1 -
 drivers/gpu/drm/drm_internal.h |  1 +
 drivers/gpu/drm/drm_ioctl.c    |  4 ++--
 drivers/gpu/drm/drm_lease.c    | 18 ++++++++----------
 include/drm/drm_file.h         |  9 +--------
 6 files changed, 19 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index f2b2f197052a..232416119407 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -61,10 +61,9 @@
  * trusted clients.
  */
 
-static bool drm_is_current_master_locked(struct drm_file *fpriv)
+bool drm_is_current_master_locked(struct drm_file *fpriv)
 {
-	lockdep_assert_once(lockdep_is_held(&fpriv->master_lookup_lock) ||
-			    lockdep_is_held(&fpriv->minor->dev->master_rwsem));
+	lockdep_assert_held_once(&fpriv->minor->dev->master_rwsem);
 
 	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
 }
@@ -83,9 +82,9 @@ bool drm_is_current_master(struct drm_file *fpriv)
 {
 	bool ret;
 
-	spin_lock(&fpriv->master_lookup_lock);
+	down_read(&fpriv->minor->dev->master_rwsem);
 	ret = drm_is_current_master_locked(fpriv);
-	spin_unlock(&fpriv->master_lookup_lock);
+	up_read(&fpriv->minor->dev->master_rwsem);
 
 	return ret;
 }
@@ -120,7 +119,7 @@ int drm_authmagic(struct drm_device *dev, void *data,
 	DRM_DEBUG("%u\n", auth->magic);
 
 	down_write(&dev->master_rwsem);
-	if (unlikely(!drm_is_current_master(file_priv))) {
+	if (unlikely(!drm_is_current_master_locked(file_priv))) {
 		up_write(&dev->master_rwsem);
 		return -EACCES;
 	}
@@ -178,9 +177,7 @@ static int drm_new_set_master(struct drm_device *dev, struct drm_file *fpriv)
 	new_master = drm_master_create(dev);
 	if (!new_master)
 		return -ENOMEM;
-	spin_lock(&fpriv->master_lookup_lock);
 	fpriv->master = new_master;
-	spin_unlock(&fpriv->master_lookup_lock);
 
 	fpriv->is_master = 1;
 	fpriv->authenticated = 1;
@@ -343,9 +340,7 @@ int drm_master_open(struct drm_file *file_priv)
 	if (!dev->master) {
 		ret = drm_new_set_master(dev, file_priv);
 	} else {
-		spin_lock(&file_priv->master_lookup_lock);
 		file_priv->master = drm_master_get(dev->master);
-		spin_unlock(&file_priv->master_lookup_lock);
 	}
 	up_write(&dev->master_rwsem);
 
@@ -413,13 +408,13 @@ struct drm_master *drm_file_get_master(struct drm_file *file_priv)
 	if (!file_priv)
 		return NULL;
 
-	spin_lock(&file_priv->master_lookup_lock);
+	down_read(&file_priv->minor->dev->master_rwsem);
 	if (!file_priv->master)
 		goto unlock;
 	master = drm_master_get(file_priv->master);
 
 unlock:
-	spin_unlock(&file_priv->master_lookup_lock);
+	up_read(&file_priv->minor->dev->master_rwsem);
 	return master;
 }
 EXPORT_SYMBOL(drm_file_get_master);
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 90b62f360da1..8c846e0179d7 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -176,7 +176,6 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
 	init_waitqueue_head(&file->event_wait);
 	file->event_space = 4096; /* set aside 4k for event buffer */
 
-	spin_lock_init(&file->master_lookup_lock);
 	mutex_init(&file->event_read_lock);
 
 	if (drm_core_check_feature(dev, DRIVER_GEM))
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 17f3548c8ed2..5d421f749a17 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -132,6 +132,7 @@ int drm_crtc_queue_sequence_ioctl(struct drm_device *dev, void *data,
 				  struct drm_file *filp);
 
 /* drm_auth.c */
+bool drm_is_current_master_locked(struct drm_file *fpriv);
 int drm_getmagic(struct drm_device *dev, void *data,
 		 struct drm_file *file_priv);
 int drm_authmagic(struct drm_device *dev, void *data,
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 8bea39ffc5c0..c728437466c3 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -386,7 +386,7 @@ static int drm_setversion(struct drm_device *dev, void *data, struct drm_file *f
 	int if_version, retcode = 0;
 
 	down_write(&dev->master_rwsem);
-	if (unlikely(!drm_is_current_master(file_priv))) {
+	if (unlikely(!drm_is_current_master_locked(file_priv))) {
 		retcode = -EACCES;
 		goto unlock;
 	}
@@ -540,7 +540,7 @@ static int drm_ioctl_permit(u32 flags, struct drm_file *file_priv)
 
 	/* MASTER is only for master or control clients */
 	if (unlikely((flags & DRM_MASTER) &&
-		     !drm_is_current_master(file_priv)))
+		     !drm_is_current_master_locked(file_priv)))
 		return -EACCES;
 
 	/* Render clients must be explicitly allowed */
diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
index 15bf3a3c76d1..0eecf320b1ab 100644
--- a/drivers/gpu/drm/drm_lease.c
+++ b/drivers/gpu/drm/drm_lease.c
@@ -498,12 +498,12 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
 		return PTR_ERR(lessee_file);
 
 	down_read(&dev->master_rwsem);
-	if (unlikely(!drm_is_current_master(lessor_priv))) {
+	if (unlikely(!drm_is_current_master_locked(lessor_priv))) {
 		ret = -EACCES;
 		goto out_file;
 	}
 
-	lessor = drm_file_get_master(lessor_priv);
+	lessor = lessor_priv->master;
 	/* Do not allow sub-leases */
 	if (lessor->lessor) {
 		DRM_DEBUG_LEASE("recursive leasing not allowed\n");
@@ -565,7 +565,6 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
 	/* Hook up the fd */
 	fd_install(fd, lessee_file);
 
-	drm_master_put(&lessor);
 	up_read(&dev->master_rwsem);
 	DRM_DEBUG_LEASE("drm_mode_create_lease_ioctl succeeded\n");
 	return 0;
@@ -600,7 +599,8 @@ int drm_mode_list_lessees_ioctl(struct drm_device *dev,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EOPNOTSUPP;
 
-	lessor = drm_file_get_master(lessor_priv);
+	lockdep_assert_held_once(&dev->master_rwsem);
+	lessor = lessor_priv->master;
 	DRM_DEBUG_LEASE("List lessees for %d\n", lessor->lessee_id);
 
 	mutex_lock(&dev->mode_config.idr_mutex);
@@ -624,7 +624,6 @@ int drm_mode_list_lessees_ioctl(struct drm_device *dev,
 		arg->count_lessees = count;
 
 	mutex_unlock(&dev->mode_config.idr_mutex);
-	drm_master_put(&lessor);
 
 	return ret;
 }
@@ -650,7 +649,8 @@ int drm_mode_get_lease_ioctl(struct drm_device *dev,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EOPNOTSUPP;
 
-	lessee = drm_file_get_master(lessee_priv);
+	lockdep_assert_held_once(&dev->master_rwsem);
+	lessee = lessee_priv->master;
 	DRM_DEBUG_LEASE("get lease for %d\n", lessee->lessee_id);
 
 	mutex_lock(&dev->mode_config.idr_mutex);
@@ -678,7 +678,6 @@ int drm_mode_get_lease_ioctl(struct drm_device *dev,
 		arg->count_objects = count;
 
 	mutex_unlock(&dev->mode_config.idr_mutex);
-	drm_master_put(&lessee);
 
 	return ret;
 }
@@ -703,11 +702,11 @@ int drm_mode_revoke_lease_ioctl(struct drm_device *dev,
 		return -EOPNOTSUPP;
 
 	down_write(&dev->master_rwsem);
-	if (unlikely(!drm_is_current_master(lessor_priv))) {
+	if (unlikely(!drm_is_current_master_locked(lessor_priv))) {
 		ret = -EACCES;
 		goto unlock;
 	}
-	lessor = drm_file_get_master(lessor_priv);
+	lessor = lessor_priv->master;
 	mutex_lock(&dev->mode_config.idr_mutex);
 
 	lessee = _drm_find_lessee(lessor, arg->lessee_id);
@@ -728,7 +727,6 @@ int drm_mode_revoke_lease_ioctl(struct drm_device *dev,
 
 fail:
 	mutex_unlock(&dev->mode_config.idr_mutex);
-	drm_master_put(&lessor);
 
 unlock:
 	up_write(&dev->master_rwsem);
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index d12bb2ba7814..e2d49fe3e32d 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -227,16 +227,12 @@ struct drm_file {
 	 * @master:
 	 *
 	 * Master this node is currently associated with. Protected by struct
-	 * &drm_device.master_rwsem, and serialized by @master_lookup_lock.
+	 * &drm_device.master_rwsem.
 	 *
 	 * Only relevant if drm_is_primary_client() returns true. Note that
 	 * this only matches &drm_device.master if the master is the currently
 	 * active one.
 	 *
-	 * To update @master, both &drm_device.master_rwsem and
-	 * @master_lookup_lock need to be held, therefore holding either of
-	 * them is safe and enough for the read side.
-	 *
 	 * When dereferencing this pointer, either hold struct
 	 * &drm_device.master_rwsem for the duration of the pointer's use, or
 	 * use drm_file_get_master() if struct &drm_device.master_rwsem is not
@@ -248,9 +244,6 @@ struct drm_file {
 	 */
 	struct drm_master *master;
 
-	/** @master_lock: Serializes @master. */
-	spinlock_t master_lookup_lock;
-
 	/** @pid: Process that opened this file. */
 	struct pid *pid;
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
