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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B64C432BE
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Aug 2021 07:25:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 985E460FE8
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Aug 2021 07:25:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 985E460FE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7536480F79;
	Tue, 31 Aug 2021 07:25:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZL1lXQzjW0Dq; Tue, 31 Aug 2021 07:25:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 907B480DBA;
	Tue, 31 Aug 2021 07:25:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 70D7EC0010;
	Tue, 31 Aug 2021 07:25:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C00D1C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Aug 2021 07:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FA3E4044D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Aug 2021 07:25:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xQXimTnWzDOJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Aug 2021 07:25:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D56A5400E4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Aug 2021 07:25:48 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id m4so10113630pll.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Aug 2021 00:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FzExCBQE7rwMYVKetJ9aGi6+oVAsZBZjfgGFXxeHd5E=;
 b=LXe0f4nPVCe1oh3x5+e3cE7j/bEYgV/8zc80PbZ6LXQLG2n57Lx1fHt9akzFhqF06M
 vTvHuTvzUYHRxqmg69BlMsboB6VGAAGly8qOMokYCtmYecsc/TOUv+8JqRokhbx5GxOf
 7AygM2bgBVxhQiCJ+s58MVLwLzRG/hbTFKHxlKIBKZrVwYd8An/rad3jdSNesX1cumJH
 kim90j9snnZU2/XgbD1BGQHgdYI+34sJTM6Na8n8uyhqGf+YOlaw6x6qj5shKYDbrYDE
 /gEJcfnkwnbfBUfokZXQMndj6Ux36lZJFc0ABmo8rh6Fp59spcjw6h7Gh/LyKq5bjNxX
 cypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FzExCBQE7rwMYVKetJ9aGi6+oVAsZBZjfgGFXxeHd5E=;
 b=UcVRzcomRF1MmcXkdqMswePGUS0l27hryL0lRxFNuqtAZinki4/sDahOPu08fMng/H
 UBE0p62W+xjRNVaKMh0jxXN6t2Jh/QU16YstNE5oVXlPfz7Q5IXAynNOKf1bQbDDRtKW
 GyIh6+ywB5t9Mv2pIuNqPHh7uoZ+DSU9ChnNcGijbFmihTuvfvrTMtt1wXBrimIzHYkp
 qeHsIqE9Tm2M92h072Lw3eDrOeR/XndhhzAOKiFFDUhLGMDxlyGL+XmO+N6gLXvy+jrS
 rlqXr1ZoBA6NxDh0gLmY008jr/OIixs/lSWg04AYrsAzw11yjVDNMfEdy5fEydMyVbWv
 WEog==
X-Gm-Message-State: AOAM532NRU8ucYefl1e9yE4JWZox+g3Y3PwrMBLNpT2ISTkyk7MPPP5j
 UIjVblTiK7alKpi590erTBQ=
X-Google-Smtp-Source: ABdhPJysGpkZ0cAY6VQlN8tnvez7JJZxx3OJmr6/KKxgL/wi48F5mbtV0mBFI6qvB9e1Z3DLUIq34w==
X-Received: by 2002:a17:90a:e64a:: with SMTP id
 ep10mr3657825pjb.167.1630394748361; 
 Tue, 31 Aug 2021 00:25:48 -0700 (PDT)
Received: from sanitydock.wifi-cloud.jp ([210.160.217.69])
 by smtp.gmail.com with ESMTPSA id m11sm1720724pjn.2.2021.08.31.00.25.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 00:25:47 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Subject: [PATCH v10 3/4] drm: lock drm_global_mutex earlier in the ioctl
 handler
Date: Tue, 31 Aug 2021 15:25:00 +0800
Message-Id: <20210831072501.184211-4-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210831072501.184211-1-desmondcheongzx@gmail.com>
References: <20210831072501.184211-1-desmondcheongzx@gmail.com>
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
index 9fc00e36c5d6..fe9c4c0264a9 100644
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
