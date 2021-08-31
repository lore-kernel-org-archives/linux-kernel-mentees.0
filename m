Return-Path: <SRS0=gq+t=NW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68ADBC4320E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Aug 2021 06:15:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25D4C6103E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Aug 2021 06:15:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 25D4C6103E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC1474044E;
	Tue, 31 Aug 2021 06:15:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YS2NgceGsgxO; Tue, 31 Aug 2021 06:15:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 097824044F;
	Tue, 31 Aug 2021 06:15:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D9E87C0010;
	Tue, 31 Aug 2021 06:15:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6315CC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Aug 2021 06:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 527E260B53
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Aug 2021 06:15:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3o9OVEar9SLi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Aug 2021 06:15:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CCE566062D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Aug 2021 06:15:00 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id c6so822577pjv.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Aug 2021 23:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8hkPxmWIahwpRPq8B7GtGqA3EkMAolIN63S2SawwkKE=;
 b=u3DHwM2oboAS0ZS+3mC5Troi4b9j425hyQBxoON5rcNg7gbRyz6bFb/HNVYcYgRjXe
 QRCLG33ItY/zhpfIEpoNB9usWhaAB9rV9XlRBp4eJEaP7mJFFlhLdOXbBKpl9kJ0vnxO
 9kpd9npyh9Qx6NhldeMLDO9kbZPERm5mel5aOlz46kOBFdM9PHtorvsCM+z9T+RF+mja
 zZd6FZTx2fo/nIzc4JovO0h9I4idoA45weme2RTDeEPL0Bcu1vXKWUhP1VZ84DJa77vu
 baujx/5CZlH+qX/QxlKFAyAOOgOhgXFy4BAcKCgFOtugIkWMKLGx6CgJ4VVwKwnI2OmV
 OJlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8hkPxmWIahwpRPq8B7GtGqA3EkMAolIN63S2SawwkKE=;
 b=Cd2rdRyJdkIXhMcGN4qiradrHE0QHpNAkvOo+El+cR2flxM6WBwg6XvNSGQdzihFb/
 AIdkpfwDSO244Q3uvPbA76lBvUC6F8+60imxHScypoJbwmUmq3DRcqO1HwrhpDXJvbSW
 WgdcWH+lLAQD0Eron3iA/X8WeR3zWz+ZvquvdkHdiVzYRBW7n/xBRKX7xPThflRx8kV3
 OWpBCJVaSYUupTwoumv0yfkWwRsSnJ/PgqOJTDNSBPDD8wSlMhNiaYq3odplZjODs3GE
 ak7dnIdsoyuysY48h4ha32hwC+fALzmMM2mTvoEMIoDvYNcTL+vDAkjavpyiTv1419sV
 Bjwg==
X-Gm-Message-State: AOAM533kt0vyUa5HSfkd60YXmj1+UOFZFK8217MdtL5wtvcUyj5elni/
 0UNbT9v1P5S66P5U8AN+CMI=
X-Google-Smtp-Source: ABdhPJxNS3Mwi+vwp6emNlPWYdac3Ef7YicUK0bPsOF/2GZ0ApJ2i4XbFY8HEZTR5UKZBZz2OdQrRA==
X-Received: by 2002:a17:90a:4a8a:: with SMTP id
 f10mr3424851pjh.195.1630390500318; 
 Mon, 30 Aug 2021 23:15:00 -0700 (PDT)
Received: from sanitydock.wifi-cloud.jp ([210.160.217.69])
 by smtp.gmail.com with ESMTPSA id z7sm1405724pjr.42.2021.08.30.23.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 23:14:59 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Subject: [PATCH v9 3/4] drm: lock drm_global_mutex earlier in the ioctl handler
Date: Tue, 31 Aug 2021 14:13:47 +0800
Message-Id: <20210831061348.97696-4-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210831061348.97696-1-desmondcheongzx@gmail.com>
References: <20210831061348.97696-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,
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

In a future patch, a read lock on drm_device.master_rwsem is
held in the ioctl handler before the check for ioctl
permissions. However, this inverts the lock hierarchy of
drm_global_mutex --> master_rwsem.

To avoid this, we do some prep work to grab the drm_global_mutex
before checking for ioctl permissions.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_ioctl.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index d25713b09b80..59c5aa850dd5 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -767,24 +767,27 @@ long drm_ioctl_kernel(struct file *file, drm_ioctl_t *func, void *kdata,
 {
 	struct drm_file *file_priv = file->private_data;
 	struct drm_device *dev = file_priv->minor->dev;
+	bool locked_ioctl;
 	int retcode;
 
 	if (drm_dev_is_unplugged(dev))
 		return -ENODEV;
 
+	/* Enforce sane locking for modern driver ioctls. */
+	locked_ioctl = (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)) &&
+			!(flags & DRM_UNLOCKED));
+	if (locked_ioctl)
+		mutex_lock(&drm_global_mutex);
+
 	retcode = drm_ioctl_permit(flags, file_priv);
 	if (unlikely(retcode))
-		return retcode;
+		goto out;
 
-	/* Enforce sane locking for modern driver ioctls. */
-	if (likely(!drm_core_check_feature(dev, DRIVER_LEGACY)) ||
-	    (flags & DRM_UNLOCKED))
-		retcode = func(dev, kdata, file_priv);
-	else {
-		mutex_lock(&drm_global_mutex);
-		retcode = func(dev, kdata, file_priv);
+	retcode = func(dev, kdata, file_priv);
+
+out:
+	if (locked_ioctl)
 		mutex_unlock(&drm_global_mutex);
-	}
 	return retcode;
 }
 EXPORT_SYMBOL(drm_ioctl_kernel);
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
