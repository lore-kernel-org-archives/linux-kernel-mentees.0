Return-Path: <SRS0=qmss=MO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 170F9C63799
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Jul 2021 09:30:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6D8F6120C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Jul 2021 09:30:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6D8F6120C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95ACC82CCA;
	Thu, 22 Jul 2021 09:30:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r4rbgTVHOch4; Thu, 22 Jul 2021 09:30:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C3780828EF;
	Thu, 22 Jul 2021 09:30:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AED17C0010;
	Thu, 22 Jul 2021 09:30:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0F3E0C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 09:30:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5E0682C3C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 09:30:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1QL52mAMj5YV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 09:30:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5CA78828EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 09:30:17 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 p5-20020a17090a8685b029015d1a9a6f1aso3113080pjn.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 02:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bWqoW1zaypI6FiOc+rFvxYhfwSyGe+LXhfGXUAMjokM=;
 b=q3mxk07wkguCFJ+lpuERPHN7UiaEpdxTgOavixSsHfPNPXKFiLSITtuEeLIwPZRjU7
 s42Q87ZjcaNTrLRJw+tOZoIdFlCwLflimzejiOKT9gyMkMLpthTiHeFKzQnJDsELOScM
 PtdXIj1ZZXVu3ZM9M3OBzrwO6lugRjWibip1gEsqKagfac6tObLaddc0jIOPyn0rQ/2Q
 SqIn/SBaRCLr760Fo23EQiVBqg1WabAQZKzLW5+nyHPy0emWxNaaJxxmEC5IAWoOYBMb
 2w3ZGx0JEfCUFSrEa95ldc/WJZLAJYcicWU1cZ6niVobKKGPIESb53bReRPgOoJoRBug
 if1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bWqoW1zaypI6FiOc+rFvxYhfwSyGe+LXhfGXUAMjokM=;
 b=oLa4SEJuDhPhZHCEQhF9ZGOqdcY+7OUQ8GScOaBv1E0ZLYMNRtjgkTpZrtgXdxPIW/
 KGuQgM5HXosYva50OXUlUcipp+1FRjPIv9cSRKravevs0jagikrAaekEN4r4/j8dl2fn
 mnqdO3ACd8LtxBAeXdd6JxSuXYpZzg9NvKnClmUqB7aWdj3Ck3D1hDv6p/Mbfl3/1V/y
 68Q3lpAuLgz6ATr6ttEdUQULmBcftk0OlbXxBVg2a5NRtJ5zbSq203ANobXswyGsA4dp
 z+5WFMlBviT4a5XW8tws6sDXGD4k3erhee+CwrLxeAdmeFX+6bNLQJTtqnkiOTCaDBsM
 +o4w==
X-Gm-Message-State: AOAM5336sZfDlH0Y3kQ9Q2PfXTsTRDbcopRBjZ6ITvz7QGwSkgByX0xv
 V8fUtoMlLDdmij75kiiSXnE=
X-Google-Smtp-Source: ABdhPJzLwTR8vmDcr35rGyIbAv/nAj71D9TVKb48nTd5YFXyi6D7zffA6NSixOLxJopmOo9LLz5PwA==
X-Received: by 2002:a63:cd4b:: with SMTP id a11mr21260014pgj.273.1626946216859; 
 Thu, 22 Jul 2021 02:30:16 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id q5sm1069592pjo.7.2021.07.22.02.30.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 02:30:16 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: linux-graphics-maintainer@vmware.com, zackr@vmware.com, airlied@linux.ie,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de
Subject: [PATCH 2/3] drm: clarify lifetime/locking for drm_master's lease
 fields
Date: Thu, 22 Jul 2021 17:29:28 +0800
Message-Id: <20210722092929.244629-3-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722092929.244629-1-desmondcheongzx@gmail.com>
References: <20210722092929.244629-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
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

In particular, we make it clear that &drm_device.mode_config.idr_mutex
protects the lease idr and list structures for drm_master. The lessor
field itself doesn't need to be protected as it doesn't change after
it's set in drm_lease_create.

Additionally, we add descriptions for the lifetime of lessors and
leases to make it easier to reason about them.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 include/drm/drm_auth.h | 62 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 51 insertions(+), 11 deletions(-)

diff --git a/include/drm/drm_auth.h b/include/drm/drm_auth.h
index f99d3417f304..c978c85464fa 100644
--- a/include/drm/drm_auth.h
+++ b/include/drm/drm_auth.h
@@ -58,12 +58,6 @@ struct drm_lock_data {
  * @refcount: Refcount for this master object.
  * @dev: Link back to the DRM device
  * @driver_priv: Pointer to driver-private information.
- * @lessor: Lease holder
- * @lessee_id: id for lessees. Owners always have id 0
- * @lessee_list: other lessees of the same master
- * @lessees: drm_masters leasing from this one
- * @leases: Objects leased to this drm_master.
- * @lessee_idr: All lessees under this owner (only used where lessor == NULL)
  *
  * Note that master structures are only relevant for the legacy/primary device
  * nodes, hence there can only be one per device, not one per drm_minor.
@@ -88,17 +82,63 @@ struct drm_master {
 	struct idr magic_map;
 	void *driver_priv;
 
-	/* Tree of display resource leases, each of which is a drm_master struct
-	 * All of these get activated simultaneously, so drm_device master points
-	 * at the top of the tree (for which lessor is NULL). Protected by
-	 * &drm_device.mode_config.idr_mutex.
+	/**
+	 * @lessor:
+	 *
+	 * Lease holder. The lessor does not change once it's set in
+	 * drm_lease_create(). Each lessee holds a reference to its lessor that
+	 * it releases upon being destroyed in drm_lease_destroy().
+	 *
+	 * Display resource leases form a tree of &struct drm_master. All of
+	 * these get activated simultaneously, so &drm_device.master
+	 * points at the top of the tree (for which lessor is NULL).
 	 */
-
 	struct drm_master *lessor;
+
+	/**
+	 * @lessee_id:
+	 *
+	 * ID for lessees. Owners always have ID 0. Protected by
+	 * &drm_device.mode_config's &drm_mode_config.idr_mutex.
+	 */
 	int	lessee_id;
+
+	/**
+	 * @lessee_list:
+	 *
+	 * List of lessees of the same master. Protected by
+	 * &drm_device.mode_config's &drm_mode_config.idr_mutex.
+	 */
 	struct list_head lessee_list;
+
+	/**
+	 * @lessees:
+	 *
+	 * List of drm_masters leasing from this one. Protected by
+	 * &drm_device.mode_config's &drm_mode_config.idr_mutex.
+	 *
+	 * This master cannot be destroyed unless this list is empty as lessors
+	 * are referenced by all their lessees.
+	 */
 	struct list_head lessees;
+
+	/**
+	 * @leases:
+	 *
+	 * Objects leased to this drm_master. Protected by
+	 * &drm_device.mode_config's &drm_mode_config.idr_mutex.
+	 *
+	 * Objects are leased all together in drm_lease_create(), and are
+	 * removed all together when the lease is revoked.
+	 */
 	struct idr leases;
+
+	/**
+	 * @lessee_idr:
+	 *
+	 * All lessees under this owner (only used where lessor is NULL).
+	 * Protected by &drm_device.mode_config's &drm_mode_config.idr_mutex.
+	 */
 	struct idr lessee_idr;
 	/* private: */
 #if IS_ENABLED(CONFIG_DRM_LEGACY)
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
