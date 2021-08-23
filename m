Return-Path: <SRS0=WoZ7=NO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A23C4320A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Aug 2021 17:15:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93B4A613D5
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Aug 2021 17:15:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 93B4A613D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6356D4027A;
	Mon, 23 Aug 2021 17:15:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 122YMbr2hdWY; Mon, 23 Aug 2021 17:15:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 72C0A4016C;
	Mon, 23 Aug 2021 17:15:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5F409C001A;
	Mon, 23 Aug 2021 17:15:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B4BB7C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Aug 2021 17:15:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A326B600C6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Aug 2021 17:15:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8jT0p-mwTXWL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Aug 2021 17:15:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE52B6070A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Aug 2021 17:15:29 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id v123so1236380pfb.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Aug 2021 10:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P/HLeCdm1ln+WDWlHx3gbH2c2TGPxEmJ7R7sNcfLOXw=;
 b=c0f4kiiXc4IkYgZ7SwV50fvg9X1ZxF8YmeWTnH1aY4zr7f7CxUhhKSV/ZxhYEciPsx
 R4qVFbmzrhrtFLWu5p5Y0++tTcd6CaIj04UjTLFpXvsk9ker44OElUT1FAhJ1Rt0VW+L
 kJjfeN5Gn7i6bWpucmWiFYyQ16P3Jy332p1OBTQKhgyhWGok75i5BFP08s/R0+IH7OWo
 NtrYk744ZrR0r4l/25XjPCpwbOubap2eD0VpfKj1KT4MhXwPEorZId01Rru6W+3wAJk1
 h5BxeL35p/7pwLyuFfPvEvQyytrwmRi+vPiLjPoshVtby2FB5ccCGeT+9IpVO3fPjaEI
 IBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P/HLeCdm1ln+WDWlHx3gbH2c2TGPxEmJ7R7sNcfLOXw=;
 b=Y9wm15iFoBG6e9Hf90V1u4eD74Z4dD4ZRALV21PFq9Uv40RdlT3bRSsKglXC41L/zq
 eDO0A9GiLcc6afvBbGdNSN1ecanYiV76Ar3cqNbaeL6U02vhyvodHrBHoTQRABNWzXRG
 cqcGn2d038XB8nf0msLUr+nw9p61qy78KLyUVFx3h4vK50/KsAe3J/9QafxKR5yROoA/
 cbWCA12ZZIx6LBFelRL97yTtEGj9d2Z4tsu9D29MMGbxK5aNYMiPlYntbKtkwf5rwZvT
 vi/vr8Im3m9B1Fpyu84R6ab0tHn9MB57ezGrDBJzgR6938+Fd19tZtGiH+J4ZC45xxYD
 ahDA==
X-Gm-Message-State: AOAM533bCdIcSBkS41LaNYXCwtGO/kAZ3aIJ94qRAuk3nrxv6tQhf4Lf
 ezwEfKC7hwD8fKACxBpwSpM=
X-Google-Smtp-Source: ABdhPJxHInaVZCTCItEa4Eu561qYx8GvC70vOUyW+CghTAjRug2jVLVxRcc+W6Xrpc1RMGrYbv9O9A==
X-Received: by 2002:aa7:94ac:0:b0:3e0:f21a:e6ff with SMTP id
 a12-20020aa794ac000000b003e0f21ae6ffmr33941216pfl.76.1629738929457; 
 Mon, 23 Aug 2021 10:15:29 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id q4sm14290830pjd.52.2021.08.23.10.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 10:15:29 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Subject: [PATCH v5 3/6] drm: lock drm_global_mutex earlier in the ioctl handler
Date: Tue, 24 Aug 2021 01:14:34 +0800
Message-Id: <20210823171437.829404-4-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823171437.829404-1-desmondcheongzx@gmail.com>
References: <20210823171437.829404-1-desmondcheongzx@gmail.com>
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

In a future patch, a read lock on drm_device.master_rwsem is
held in the ioctl handler before the check for ioctl
permissions. However, this inverts the lock hierarchy of
drm_global_mutex --> master_rwsem.

To avoid this, we do some prep work to grab the drm_global_mutex
before checking for ioctl permissions.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_ioctl.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index d25713b09b80..158629d88319 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -772,19 +772,19 @@ long drm_ioctl_kernel(struct file *file, drm_ioctl_t *func, void *kdata,
 	if (drm_dev_is_unplugged(dev))
 		return -ENODEV;
 
+	/* Enforce sane locking for modern driver ioctls. */
+	if (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)) && !(flags & DRM_UNLOCKED))
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
+	if (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)) && !(flags & DRM_UNLOCKED))
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
