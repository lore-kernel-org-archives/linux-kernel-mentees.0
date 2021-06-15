Return-Path: <SRS0=6pMY=LJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20BA8C48BE6
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Jun 2021 02:38:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADD31613F1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Jun 2021 02:38:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADD31613F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FE88401D5;
	Tue, 15 Jun 2021 02:38:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PFpAN5emtNww; Tue, 15 Jun 2021 02:38:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 82ECE40164;
	Tue, 15 Jun 2021 02:38:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6159FC000E;
	Tue, 15 Jun 2021 02:38:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0F517C000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Jun 2021 02:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E43406081A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Jun 2021 02:38:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yzcrlz_T0I4x
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Jun 2021 02:38:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 58BD3607B9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Jun 2021 02:38:55 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id e22so10215814pgv.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Jun 2021 19:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XQEEdyk0NzKb35RO0y38pkKvyWvf0lxEsS58qIRhZcM=;
 b=csiw/WfS29jheZnkm94OQ4yhoiGR2OjIoj9LZItuvnR7+r8BRa7Ul3+TLW56kaMygX
 pOTKKfLS1c5qtDgvrsbVTmryY4Jcks4EjSi5v2hgSsjEgUr81669Cd/yuwq4w/BOeb9+
 zEdmD2PQpRm/AVcOcUfV6d79spsn1qjxAxzg7LL2fct2AmOP/MAtWX1SM8APsjujmZ79
 nEHylOmlxpiL0GTvWjUtKqGm82ITAy6vfyy9m2fjNf2JsZos5V7NHiSVKdZeX56ZAlrb
 AZMvIS9/F2NxPKPR2uRsrzO5rgVT2bkon0isYdGBgnftSo/6OcGU30CjgCEW2BLbJHiL
 di8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XQEEdyk0NzKb35RO0y38pkKvyWvf0lxEsS58qIRhZcM=;
 b=XMOALFi7RA8jaPYKTpMTJNifHh2Zi/CUf+aQ1eo4WWpOKi9iLeJbGVD3tjrbitDF9M
 rteYBpsCe0WQ3WVkzX804P2Z9vIvy1asr1qYBz7w6IXo8zt2/+dZrEcFJ3HB5/DDAR+5
 ZPqcJtmDwHYL+R2p8oZ9Xfj0ScEHHpnWFRyMQetqq0XXYjyfLPoCX7AKBzB90kbc4ypc
 3wp+EuHEfqQL18uhQf2L3l0v3Qx67NHD6DGcxm34e5idUX7+UzWgsKcK+lYQxX70tY3P
 vKgONQB+hzMcgKDBQD3uosRDSYqH7gAhdUCrQuX3AgfFG4Z8Q7YalxTxMUla/4lPxZbQ
 hJMw==
X-Gm-Message-State: AOAM532EhQvbL3jh6ZZMChwyD0tIZzS27tTf2U+k2X39HV2TCaTfPJQ/
 uZ0G2mSzbFlyalpWngtQaQ8=
X-Google-Smtp-Source: ABdhPJyaiilAsFiEUsynNx2CFjcrxs+pNl9qDqxB9K/57S4yFR9jE9Y0VjAxz+Gwf/y4biQTQ3nhfQ==
X-Received: by 2002:a65:5b0d:: with SMTP id y13mr19853174pgq.165.1623724734847; 
 Mon, 14 Jun 2021 19:38:54 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id b133sm14102623pfb.36.2021.06.14.19.38.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 19:38:54 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2 1/2] drm: Add a locked version of drm_is_current_master
Date: Tue, 15 Jun 2021 10:36:44 +0800
Message-Id: <20210615023645.6535-2-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210615023645.6535-1-desmondcheongzx@gmail.com>
References: <20210615023645.6535-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Cc: emil.l.velikov@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

While checking the master status of the DRM file in
drm_is_current_master(), the device's master mutex should be
held. Without the mutex, the pointer fpriv->master may be freed
concurrently by another process calling drm_setmaster_ioctl(). This
could lead to use-after-free errors when the pointer is subsequently
dereferenced in drm_lease_owner().

The callers of drm_is_current_master() from drm_auth.c hold the
device's master mutex, but external callers do not. Hence, we implement
drm_is_current_master_locked() to be used within drm_auth.c, and
modify drm_is_current_master() to grab the device's master mutex
before checking the master status.

Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 drivers/gpu/drm/drm_auth.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index 232abbba3686..c6bf52c310a9 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -61,6 +61,8 @@
  * trusted clients.
  */
 
+static bool drm_is_current_master_locked(struct drm_file *fpriv);
+
 int drm_getmagic(struct drm_device *dev, void *data, struct drm_file *file_priv)
 {
 	struct drm_auth *auth = data;
@@ -223,7 +225,7 @@ int drm_setmaster_ioctl(struct drm_device *dev, void *data,
 	if (ret)
 		goto out_unlock;
 
-	if (drm_is_current_master(file_priv))
+	if (drm_is_current_master_locked(file_priv))
 		goto out_unlock;
 
 	if (dev->master) {
@@ -272,7 +274,7 @@ int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
 	if (ret)
 		goto out_unlock;
 
-	if (!drm_is_current_master(file_priv)) {
+	if (!drm_is_current_master_locked(file_priv)) {
 		ret = -EINVAL;
 		goto out_unlock;
 	}
@@ -321,7 +323,7 @@ void drm_master_release(struct drm_file *file_priv)
 	if (file_priv->magic)
 		idr_remove(&file_priv->master->magic_map, file_priv->magic);
 
-	if (!drm_is_current_master(file_priv))
+	if (!drm_is_current_master_locked(file_priv))
 		goto out;
 
 	drm_legacy_lock_master_cleanup(dev, master);
@@ -342,6 +344,13 @@ void drm_master_release(struct drm_file *file_priv)
 	mutex_unlock(&dev->master_mutex);
 }
 
+static bool drm_is_current_master_locked(struct drm_file *fpriv)
+{
+	lockdep_assert_held_once(&fpriv->master->dev->master_mutex);
+
+	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
+}
+
 /**
  * drm_is_current_master - checks whether @priv is the current master
  * @fpriv: DRM file private
@@ -354,7 +363,13 @@ void drm_master_release(struct drm_file *file_priv)
  */
 bool drm_is_current_master(struct drm_file *fpriv)
 {
-	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
+	bool ret;
+
+	mutex_lock(&fpriv->master->dev->master_mutex);
+	ret = drm_is_current_master_locked(fpriv);
+	mutex_unlock(&fpriv->master->dev->master_mutex);
+
+	return ret;
 }
 EXPORT_SYMBOL(drm_is_current_master);
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
