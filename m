Return-Path: <SRS0=1Ivo=NJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60CFDC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Aug 2021 07:41:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BF9D60FDA
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Aug 2021 07:41:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2BF9D60FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06A9A80CF8;
	Wed, 18 Aug 2021 07:41:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mNAah4oo6XvH; Wed, 18 Aug 2021 07:41:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1FD5C80CC0;
	Wed, 18 Aug 2021 07:41:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E2509C001A;
	Wed, 18 Aug 2021 07:41:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 88082C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 07:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 772824031E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 07:41:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uGRSm4pGS3aT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 07:40:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C2F21402C6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 07:40:59 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id c4so1257030plh.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 00:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QEHuccOxvqNtSxSgci59cP9jo3dJUSb2vZvhFR8kmBM=;
 b=kyrTRnECEHbET1U8ahqUBcDC2k+PuuaNd2ZFISYrMAgnQWFXBkgRULnxtJd3D4A0Qk
 sv6Dy6gL1tZXoZf95+l5ZqMuBedFp7tD2JJ9vpU9tJZmG80Ru6fRUUErQa00tQF7JXal
 q4nkcdIu7vZAVlo48jb1ep26SNhQpD49gwhKdP9DhDK71KDMigl0pXVj+xgph1iYTpCV
 GEdyfy7nD9jCd6cWDxnfHI1Pl3E996Z52giWcXylPXYNY8AzLtKn/qEwWl6u46KGiJ2f
 tXSdXtqI2+YMaHhJ9XwkIBJrMaTN/Tr85hDUyG0oe6NBmufq+MqHUnY8beTAAQ7dkVvb
 zMZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QEHuccOxvqNtSxSgci59cP9jo3dJUSb2vZvhFR8kmBM=;
 b=IFuzPDweozII5C3m5yGQ9R/guyIvVlFnjR5+f8UZTHxrOKVpggXtrZRWnzNx//jGFE
 mo1j0PBQwjnx5ZOgu60i6uZi4OaLYyr1ISwwaoBt6+nv4FafN1FNbsqwirT+DOafq1At
 Bmn/S6/xQMY1/4PbimcV9BO/gYU3ZY1h3jAn3+ekmFfWN1vgyddD5+LwXrIdqpS1WNFD
 1xsmjiNwCFc91sW0IpN3iN+S1JkGp6YrVfkDOo8VdKTEhgOqL7C6MFyr/sMw4yhElpxK
 gqjB0iDu0XuPp/UEKW/9Bz4Uj7OanjnWAaxsiUAwT/9UF082FfsZyKw595fIahQxOGjx
 Jf2Q==
X-Gm-Message-State: AOAM532uQMyffkM+0FEky8ZSNUWjoaImG80EvYwWXrB/UXHu/Q/x77Fr
 aNzF3sZXTc0yU2CFrzakiWY=
X-Google-Smtp-Source: ABdhPJxoBfNvfFHKP3I6P1QO1863L8cr1aqR7zIgRwfSUR+ThNMh9rENh0OPTK/qPRiwQJIg/iQTmg==
X-Received: by 2002:a17:90a:bf85:: with SMTP id
 d5mr8198209pjs.210.1629272459270; 
 Wed, 18 Aug 2021 00:40:59 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id u3sm3886729pjr.2.2021.08.18.00.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 00:40:58 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com, axboe@kernel.dk, oleg@redhat.com,
 tglx@linutronix.de, dvyukov@google.com, walter-zh.wu@mediatek.com
Subject: [PATCH v3 5/9] drm: protect magic_map,
 unique{_len} with master_lookup_lock
Date: Wed, 18 Aug 2021 15:38:20 +0800
Message-Id: <20210818073824.1560124-6-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
References: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
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

Currently, drm_device.master_mutex is used to serialize writes to the
drm_master.magic_map idr and to protect drm_master.unique{_len}.

In preparation for converting drm_device.master_mutex into an outer
rwsem that might be read locked before entering some of these
functions, we can instead serialize access to drm_master.magic_map and
drm_master.unique{_len} using drm_device.master_lookup_lock which is
an inner lock.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_auth.c  | 12 +++++++-----
 drivers/gpu/drm/drm_ioctl.c | 10 ++++++----
 include/drm/drm_auth.h      |  6 +++---
 include/drm/drm_device.h    |  7 ++++++-
 4 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index b7230604496b..0acb444fbbac 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -98,10 +98,10 @@ int drm_getmagic(struct drm_device *dev, void *data, struct drm_file *file_priv)
 	struct drm_master *master;
 	int ret = 0;
 
-	mutex_lock(&dev->master_mutex);
+	spin_lock(&dev->master_lookup_lock);
 	master = file_priv->master;
 	if (!master) {
-		mutex_unlock(&dev->master_mutex);
+		spin_unlock(&dev->master_lookup_lock);
 		return -EINVAL;
 	}
 
@@ -112,7 +112,7 @@ int drm_getmagic(struct drm_device *dev, void *data, struct drm_file *file_priv)
 			file_priv->magic = ret;
 	}
 	auth->magic = file_priv->magic;
-	mutex_unlock(&dev->master_mutex);
+	spin_unlock(&dev->master_lookup_lock);
 
 	DRM_DEBUG("%u\n", auth->magic);
 
@@ -127,13 +127,13 @@ int drm_authmagic(struct drm_device *dev, void *data,
 
 	DRM_DEBUG("%u\n", auth->magic);
 
-	mutex_lock(&dev->master_mutex);
+	spin_lock(&dev->master_lookup_lock);
 	file = idr_find(&file_priv->master->magic_map, auth->magic);
 	if (file) {
 		file->authenticated = 1;
 		idr_replace(&file_priv->master->magic_map, NULL, auth->magic);
 	}
-	mutex_unlock(&dev->master_mutex);
+	spin_unlock(&dev->master_lookup_lock);
 
 	return file ? 0 : -EINVAL;
 }
@@ -366,8 +366,10 @@ void drm_master_release(struct drm_file *file_priv)
 	if (!master)
 		goto unlock;
 
+	spin_lock(&dev->master_lookup_lock);
 	if (file_priv->magic)
 		idr_remove(&master->magic_map, file_priv->magic);
+	spin_unlock(&dev->master_lookup_lock);
 
 	if (!drm_is_current_master_locked(file_priv))
 		goto out;
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 4d029d3061d9..e5c3845b6e62 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -119,21 +119,21 @@ int drm_getunique(struct drm_device *dev, void *data,
 	struct drm_unique *u = data;
 	struct drm_master *master;
 
-	mutex_lock(&dev->master_mutex);
+	spin_lock(&dev->master_lookup_lock);
 	master = file_priv->master;
 	if (!master) {
-		mutex_unlock(&dev->master_mutex);
+		spin_unlock(&dev->master_lookup_lock);
 		return -EINVAL;
 	}
 
 	if (u->unique_len >= master->unique_len) {
 		if (copy_to_user(u->unique, master->unique, master->unique_len)) {
-			mutex_unlock(&dev->master_mutex);
+			spin_unlock(&dev->master_lookup_lock);
 			return -EFAULT;
 		}
 	}
 	u->unique_len = master->unique_len;
-	mutex_unlock(&dev->master_mutex);
+	spin_unlock(&dev->master_lookup_lock);
 
 	return 0;
 }
@@ -405,7 +405,9 @@ static int drm_setversion(struct drm_device *dev, void *data, struct drm_file *f
 			 * Version 1.1 includes tying of DRM to specific device
 			 * Version 1.4 has proper PCI domain support
 			 */
+			spin_lock(&dev->master_lookup_lock);
 			retcode = drm_set_busid(dev, file_priv);
+			spin_unlock(&dev->master_lookup_lock);
 			if (retcode)
 				goto done;
 		}
diff --git a/include/drm/drm_auth.h b/include/drm/drm_auth.h
index ba248ca8866f..f5be73153798 100644
--- a/include/drm/drm_auth.h
+++ b/include/drm/drm_auth.h
@@ -67,17 +67,17 @@ struct drm_master {
 	struct drm_device *dev;
 	/**
 	 * @unique: Unique identifier: e.g. busid. Protected by
-	 * &drm_device.master_mutex.
+	 * &drm_device.master_lookup_lock.
 	 */
 	char *unique;
 	/**
 	 * @unique_len: Length of unique field. Protected by
-	 * &drm_device.master_mutex.
+	 * &drm_device.master_lookup_lock.
 	 */
 	int unique_len;
 	/**
 	 * @magic_map: Map of used authentication tokens. Protected by
-	 * &drm_device.master_mutex.
+	 * &drm_device.master_lookup_lock.
 	 */
 	struct idr magic_map;
 	void *driver_priv;
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index 506eb2784819..cf5d15aeb25f 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -152,7 +152,12 @@ struct drm_device {
 	 */
 	struct mutex master_mutex;
 
-	/** @master_lookup_lock: Serializes &drm_file.master. */
+	/**
+	 * @master_lookup_lock:
+	 *
+	 * Serializes &drm_file.master, &drm_master.magic_map,
+	 * &drm_master.unique, and &drm_master.unique_len.
+	 */
 	spinlock_t master_lookup_lock;
 
 	/**
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
