Return-Path: <SRS0=Q5UI=MQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C59BC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 24 Jul 2021 11:19:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B57A60BD3
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 24 Jul 2021 11:19:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B57A60BD3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE1E9401F1;
	Sat, 24 Jul 2021 11:19:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AHGrznPwN9cw; Sat, 24 Jul 2021 11:19:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 264F4401B2;
	Sat, 24 Jul 2021 11:19:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 02D9BC001A;
	Sat, 24 Jul 2021 11:19:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 54A44C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Jul 2021 11:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3646E60768
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Jul 2021 11:19:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 838BKzvUNeBX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Jul 2021 11:19:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B55BD6071F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Jul 2021 11:19:29 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id e10so6255442pls.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Jul 2021 04:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JtMk+ANh4DuxEoD3swFwLh1zqoMdf700cXOW5hW9VCs=;
 b=pjZCOOSFL9/1Jw3Kg+6QQe9VtN1niEfY89EHxMu2RoDJIEEM3GeExXQpN+6n0Xdh0n
 u3HHiSB0Pr2kaUCJAsdbnVgBec3Tj7lKVUqCJMkU4HmsiR/xQTTeTO7yt/NmDhREyB5E
 kBMMPhhuOaypHSgt3N7xROk3xAjJpTJK+cFdAi3zC4zBWsYEsmCrdr3nl4cTOTJpeA8D
 upOLTZFpnhjkCD/J+HNokKPkQVsLXM3wOnL+SoAZlEFXN4yMtc9mDrIUTkKqLOpvRUJ+
 Wb5ne6DvJONJAgV6jIQFjgvoPUE8R3VbBrGBu4zmY9D/gI68zp8/6ufehAu953/2wlNq
 6oCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JtMk+ANh4DuxEoD3swFwLh1zqoMdf700cXOW5hW9VCs=;
 b=XBvuDusTwZqmWEgrB/rbuYdZxTytGamtZ8zWn1XX2GE+J7qZD6am6udw5qSJ20/+OA
 1rGj3gJukhSFhjyBoXrLLKRy0rz3TK/axBSlp7CwVcJKKDd+agQgCF1LlraNIHe+3uEM
 ruVlp7pQQM4DD69VDZZlm9J5zOAa9NDetTtMxycKNA9QHTH1NP5Lv25YDajsjSM4E98+
 6i474Wg3gJ09rKji2SqgnVkI/64vrasP6d+qEH50V6wLHA/c+ADb8+JyMTPMKClHepNS
 oG9ulovLsIvf00LsvSVXJL0cOfLw8RbtSpmCSnt3+eZ0m8l6xhRxT6O2UXapdMPAtlKc
 GRGQ==
X-Gm-Message-State: AOAM532ehVR3UdyL4uEqXtYeN3q6M7dfAhZvbOlLZwCJe3q0Wxrdgopa
 5H1ZNRo0l4qOTUcngrhJJR4=
X-Google-Smtp-Source: ABdhPJwjecatOou2FojjS4Q5ivhQZzJu9dQ5hERPjw61bfMZF5fKRgk86NeYWnsy8MHcwdqY3PoxRg==
X-Received: by 2002:a63:4d61:: with SMTP id n33mr9008079pgl.219.1627125569239; 
 Sat, 24 Jul 2021 04:19:29 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id v15sm21310057pff.105.2021.07.24.04.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 04:19:28 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: linux-graphics-maintainer@vmware.com, zackr@vmware.com, airlied@linux.ie,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, corbet@lwn.net
Subject: [PATCH v2 3/3] drm/vmwgfx: fix potential UAF in vmwgfx_surface.c
Date: Sat, 24 Jul 2021 19:18:24 +0800
Message-Id: <20210724111824.59266-4-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210724111824.59266-1-desmondcheongzx@gmail.com>
References: <20210724111824.59266-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
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

drm_file.master should be protected by either drm_device.master_mutex
or drm_file.master_lookup_lock when being dereferenced. However,
drm_master_get is called on unprotected file_priv->master pointers in
vmw_surface_define_ioctl and vmw_gb_surface_define_internal.

This is fixed by replacing drm_master_get with drm_file_get_master.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
index 0eba47762bed..5d53a5f9d123 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -865,7 +865,7 @@ int vmw_surface_define_ioctl(struct drm_device *dev, void *data,
 	user_srf->prime.base.shareable = false;
 	user_srf->prime.base.tfile = NULL;
 	if (drm_is_primary_client(file_priv))
-		user_srf->master = drm_master_get(file_priv->master);
+		user_srf->master = drm_file_get_master(file_priv);
 
 	/**
 	 * From this point, the generic resource management functions
@@ -1534,7 +1534,7 @@ vmw_gb_surface_define_internal(struct drm_device *dev,
 
 	user_srf = container_of(srf, struct vmw_user_surface, srf);
 	if (drm_is_primary_client(file_priv))
-		user_srf->master = drm_master_get(file_priv->master);
+		user_srf->master = drm_file_get_master(file_priv);
 
 	res = &user_srf->srf.res;
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
