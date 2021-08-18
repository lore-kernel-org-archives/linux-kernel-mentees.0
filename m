Return-Path: <SRS0=1Ivo=NJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C1D4C4320E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Aug 2021 07:40:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3E86606A5
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Aug 2021 07:40:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C3E86606A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DADD4031E;
	Wed, 18 Aug 2021 07:40:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LGrGFa82KNAF; Wed, 18 Aug 2021 07:40:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C700C4023F;
	Wed, 18 Aug 2021 07:40:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B20F6C001A;
	Wed, 18 Aug 2021 07:40:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2B3FCC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 07:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C3CD401CD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 07:40:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PY1Y5nu4EzAn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 07:40:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3671840019
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 07:40:47 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id a21so1273121pfh.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 00:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mFOgIpjzv+0bmcGv4vm2OOJINfqELHBLGwipgYh0veE=;
 b=o+x1KZlkVTKqKNyo5p3TLMCoT0qWpyoPnNTtq+ITkI4Pzgmqcny9JnnM6+BU32Ic++
 NIHLgw53T6dLUv4xSKK8r51aNniDvQ256JSzhIFWVVBCxd8yiYCtzftljjsKNkgI5T9a
 uVuTiOrkTpn378RVUD7dUnndTDVWNJOnjwXaJrR5wihPkrhlaezlgg83nqDCMXWOY1Ww
 C+8x5Ub+11oRbFZInkBkF8WSnGMY9Yui8rSGNBlTPjq5y4kkvfCGzvD5Y9Dn0cG8nEL9
 3Bm8bUE/ETlXNItyff701RIdDHlHTrmfLXV2HgwhJy2IE1LVstkrXOJwBlc2/60be+zB
 SLrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mFOgIpjzv+0bmcGv4vm2OOJINfqELHBLGwipgYh0veE=;
 b=chMsw29QgixhGFuxzwX6TX44lWbKFP67T32Rd6kNXN7AcowhTi8sMtw0pOecqvpooF
 Q4QtM0RQB7OP9YL5RO18YcKeB+XzKxIsqU5Zy/S3Lo5noBFyEdXxGQf8zdKXD1uQq+3M
 dpquNFMTi72lWWG70gbx6ZdJawNCH1egdxemGvBK3tGeX4kz0PWnHL5S0EyJmzer4Vo1
 2yklbgIroihR2hsbSdNtt0IT/essBzUTxpL0t7VOyQJ4JRVPVkaVz8maHj4QWmVJBzDi
 0dgoUsCVGbt1l9Y1wqv4+zq41uSzKG7F8ieFFepLk834lojPIg2kbQoAenDruOuw27rD
 t+kQ==
X-Gm-Message-State: AOAM530QZD/55CKXvLmf9LXQhFm52c+3ueWWXFgnC3TzvB9p2g45QtJB
 q7EsF596Ig1wusUQCDMZXy8=
X-Google-Smtp-Source: ABdhPJxBMmWazD9VqaTxeOw102ORy+uNq4+YO72IPobEWWxoH8LISt1jcYAt8BMciaPRg1MZYxt1pA==
X-Received: by 2002:a63:b1a:: with SMTP id 26mr7471369pgl.12.1629272446700;
 Wed, 18 Aug 2021 00:40:46 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id u3sm3886729pjr.2.2021.08.18.00.40.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 00:40:46 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com, axboe@kernel.dk, oleg@redhat.com,
 tglx@linutronix.de, dvyukov@google.com, walter-zh.wu@mediatek.com
Subject: [PATCH v3 4/9] drm: fix potential null ptr dereferences in drm_{auth,
 ioctl}
Date: Wed, 18 Aug 2021 15:38:19 +0800
Message-Id: <20210818073824.1560124-5-desmondcheongzx@gmail.com>
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

There are three areas where we dereference struct drm_master without
checking if the pointer is non-NULL.

1. drm_getmagic is called from the ioctl_handler. Since
DRM_IOCTL_GET_MAGIC has no ioctl flags, drm_getmagic is run without
any check that drm_file.master has been set.

2. Similarly, drm_getunique is called from the ioctl_handler, but
DRM_IOCTL_GET_UNIQUE has no ioctl flags. So there is no guarantee that
drm_file.master has been set.

3. drm_master_release can also be called without having a
drm_file.master set. Here is one error path:
  drm_open():
    drm_open_helper():
      drm_master_open():
        drm_new_set_master(); <--- returns -ENOMEM,
                                   drm_file.master not set
      drm_file_free():
        drm_master_release(); <--- NULL ptr dereference
                                   (file_priv->master->magic_map)

Fix these by checking if the master pointers are NULL before use.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_auth.c  | 16 ++++++++++++++--
 drivers/gpu/drm/drm_ioctl.c |  5 +++++
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index f9267b21556e..b7230604496b 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -95,11 +95,18 @@ EXPORT_SYMBOL(drm_is_current_master);
 int drm_getmagic(struct drm_device *dev, void *data, struct drm_file *file_priv)
 {
 	struct drm_auth *auth = data;
+	struct drm_master *master;
 	int ret = 0;
 
 	mutex_lock(&dev->master_mutex);
+	master = file_priv->master;
+	if (!master) {
+		mutex_unlock(&dev->master_mutex);
+		return -EINVAL;
+	}
+
 	if (!file_priv->magic) {
-		ret = idr_alloc(&file_priv->master->magic_map, file_priv,
+		ret = idr_alloc(&master->magic_map, file_priv,
 				1, 0, GFP_KERNEL);
 		if (ret >= 0)
 			file_priv->magic = ret;
@@ -355,8 +362,12 @@ void drm_master_release(struct drm_file *file_priv)
 
 	mutex_lock(&dev->master_mutex);
 	master = file_priv->master;
+
+	if (!master)
+		goto unlock;
+
 	if (file_priv->magic)
-		idr_remove(&file_priv->master->magic_map, file_priv->magic);
+		idr_remove(&master->magic_map, file_priv->magic);
 
 	if (!drm_is_current_master_locked(file_priv))
 		goto out;
@@ -379,6 +390,7 @@ void drm_master_release(struct drm_file *file_priv)
 		drm_master_put(&file_priv->master);
 		spin_unlock(&dev->master_lookup_lock);
 	}
+unlock:
 	mutex_unlock(&dev->master_mutex);
 }
 
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 26f3a9ede8fe..4d029d3061d9 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -121,6 +121,11 @@ int drm_getunique(struct drm_device *dev, void *data,
 
 	mutex_lock(&dev->master_mutex);
 	master = file_priv->master;
+	if (!master) {
+		mutex_unlock(&dev->master_mutex);
+		return -EINVAL;
+	}
+
 	if (u->unique_len >= master->unique_len) {
 		if (copy_to_user(u->unique, master->unique, master->unique_len)) {
 			mutex_unlock(&dev->master_mutex);
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
