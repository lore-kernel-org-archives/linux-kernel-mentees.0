Return-Path: <SRS0=b7VJ=MU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A88D9C4320E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Jul 2021 10:29:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C44460F93
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Jul 2021 10:29:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4C44460F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F17A583133;
	Wed, 28 Jul 2021 10:29:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4MplK9fLalVb; Wed, 28 Jul 2021 10:29:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id CA9F6830AB;
	Wed, 28 Jul 2021 10:29:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9DE22C0010;
	Wed, 28 Jul 2021 10:29:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 141F9C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Jul 2021 10:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9AE0405AB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Jul 2021 10:29:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SPZZRL5jzm5w
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Jul 2021 10:29:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0E77440315
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Jul 2021 10:29:14 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 ds11-20020a17090b08cbb0290172f971883bso9294769pjb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Jul 2021 03:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ajh3nG10UjXvJlzVI6uC9cucgvEZGkFC9GLNm2+GjJM=;
 b=oR02hxAgZVEp6RRR9SoRCwnUrjRcCwzmApLQF5HLBT9UnYDgJC7FW5dMnvPBbAN7vD
 aa4IJ+1vUIJxUHFOzzLfYGufaFJXUDKMFfqww5XyegcB/JMLmY3Gjq+toHQNiPK0xGFo
 Jaq6QrMBveQDszMhsHtxDUdOf/DTsBhPzujFAMI92HVtlOIRGanauj5xPOvECg2G7kHz
 +U1WCtTnpmWjxaL/UolX6t5bheor3o4D6eplVYSC/IfDICEOU0PyKBxCuCArmXsYwrBi
 yjQaDYKZAiO+Ox0lZFMPPUn2RDoEpLYvtE9X6Pu0FAPrrPZj+5LEa5EmG42CE9kOOeH4
 b0fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ajh3nG10UjXvJlzVI6uC9cucgvEZGkFC9GLNm2+GjJM=;
 b=REK1P3pKpH0QmW+u4JfJscpQZIy1CEABzq9k+AQjS2+5G6WhG+eFnVMmiazYqSIEG+
 kzVlbirF9+yUoPRHEJZmU4QY0Glg8YvUba2ji/uI+PG/OfHhNJmWu59vfg6uLf7/8Aix
 0niop7P/phhXAf95ilU0EGNSRaUfw9LOia/f5S4xOK1hd0vhCH8fSbifwHlFcck+fpXZ
 hAEntgDqSYydnJsqnp0UjfvoJx7GJMh690vL5hMqYa3ruaiyVb6+JAepWQKnysXiCn58
 7AyQBYrmIrRkpucXr64e/+XnvLpwDq0d+X6t3Bsr68bBDCzbVgqsl+egm7/d6tJZubsT
 /0LA==
X-Gm-Message-State: AOAM530To976+HPOlXrUpDaRH2HCYrdgWvFi65ahYh9Nphu4pAGE5IMz
 9p+kzJEbTGKLbSxdyrP28LE=
X-Google-Smtp-Source: ABdhPJzL3Mp5PPoomFs352O0RNKZvd0RT07l7cvWlcuPgneRfZsAFhiwS9yuNemvNdxe7zlC7mW0UQ==
X-Received: by 2002:a17:90a:4d49:: with SMTP id
 l9mr9265069pjh.179.1627468154432; 
 Wed, 28 Jul 2021 03:29:14 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id t19sm7550510pfg.216.2021.07.28.03.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 03:29:13 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, corbet@lwn.net
Subject: [PATCH v3] drm: clarify usage of drm leases
Date: Wed, 28 Jul 2021 18:27:39 +0800
Message-Id: <20210728102739.441543-1-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
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

We make the following changes to the documentation of drm leases to
make it easier to reason about their usage. In particular, we clarify
the lifetime and locking rules of lease fields in drm_master:

1. Make it clear that &drm_device.mode_config.idr_mutex protects the
lease idr and list structures for drm_master. The lessor field itself
doesn't need to be protected as it doesn't change after it's set in
drm_lease_create.

2. Add descriptions for the lifetime of lessors and leases.

3. Add an overview DOC: section in drm-uapi.rst that defines the
terminology for drm leasing, and explains how leases work and why
they're used.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---

v2 -> v3 (suggestions from Daniel Vetter):
- Clarified that device owners are changed through SETMASTER or
DROPMASTER IOCTL.
- Removed unneccessary includes for drm_lease.[hc] and kerneldoc
formatting changes.

v1 -> v2 (suggestions from Daniel Vetter):
- Clarified description of lease fields in drm_master.
- Added an overview DOC: section for drm leases in drm-uapi.rst.
- Cleaned up function documentation in drm_lease.c to use kernel-doc formatting.

 Documentation/gpu/drm-uapi.rst |  9 +++++
 drivers/gpu/drm/drm_lease.c    | 51 ++++++++++++++++++++++++++
 include/drm/drm_auth.h         | 67 ++++++++++++++++++++++++++++------
 3 files changed, 116 insertions(+), 11 deletions(-)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 7e51dd40bf6e..199afb503ab1 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -37,6 +37,15 @@ Primary Nodes, DRM Master and Authentication
 .. kernel-doc:: include/drm/drm_auth.h
    :internal:
 
+
+.. _drm_leasing:
+
+DRM Display Resource Leasing
+============================
+
+.. kernel-doc:: drivers/gpu/drm/drm_lease.c
+   :doc: drm leasing
+
 Open-Source Userspace Requirements
 ==================================
 
diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
index 92eac73d9001..79be797e8689 100644
--- a/drivers/gpu/drm/drm_lease.c
+++ b/drivers/gpu/drm/drm_lease.c
@@ -15,6 +15,57 @@
 #include "drm_crtc_internal.h"
 #include "drm_internal.h"
 
+/**
+ * DOC: drm leasing
+ *
+ * DRM leases provide information about whether a DRM master may control a DRM
+ * mode setting object. This enables the creation of multiple DRM masters that
+ * manage subsets of display resources.
+ *
+ * The original DRM master of a device 'owns' the available drm resources. It
+ * may create additional DRM masters and 'lease' resources which it controls
+ * to the new DRM master. This gives the new DRM master control over the
+ * leased resources until the owner revokes the lease, or the new DRM master
+ * is closed. Some helpful terminology:
+ *
+ * - An 'owner' is a &struct drm_master that is not leasing objects from
+ *   another &struct drm_master, and hence 'owns' the objects. The owner can be
+ *   identified as the &struct drm_master for which &drm_master.lessor is NULL.
+ *
+ * - A 'lessor' is a &struct drm_master which is leasing objects to one or more
+ *   other &struct drm_master. Currently, lessees are not allowed to
+ *   create sub-leases, hence the lessor is the same as the owner.
+ *
+ * - A 'lessee' is a &struct drm_master which is leasing objects from some
+ *   other &struct drm_master. Each lessee only leases resources from a single
+ *   lessor recorded in &drm_master.lessor, and holds the set of objects that
+ *   it is leasing in &drm_master.leases.
+ *
+ * - A 'lease' is a contract between the lessor and lessee that identifies
+ *   which resources may be controlled by the lessee. All of the resources
+ *   that are leased must be owned by or leased to the lessor, and lessors are
+ *   not permitted to lease the same object to multiple lessees.
+ *
+ * The set of objects any &struct drm_master 'controls' is limited to the set
+ * of objects it leases (for lessees) or all objects (for owners).
+ *
+ * Objects not controlled by a &struct drm_master cannot be modified through
+ * the various state manipulating ioctls, and any state reported back to user
+ * space will be edited to make them appear idle and/or unusable. For
+ * instance, connectors always report 'disconnected', while encoders
+ * report no possible crtcs or clones.
+ *
+ * Since each lessee may lease objects from a single lessor, display resource
+ * leases form a tree of &struct drm_master. As lessees are currently not
+ * allowed to create sub-leases, the tree depth is limited to 1. All of
+ * these get activated simultaneously when the top level device owner changes
+ * through the SETMASTER or DROPMASTER IOCTL, so &drm_device.master points to
+ * the owner at the top of the lease tree (i.e. the &struct drm_master for which
+ * &drm_master.lessor is NULL). The full list of lessees that are leasing
+ * objects from the owner can be searched via the owner's
+ * &drm_master.lessee_idr.
+ */
+
 #define drm_for_each_lessee(lessee, lessor) \
 	list_for_each_entry((lessee), &(lessor)->lessees, lessee_list)
 
diff --git a/include/drm/drm_auth.h b/include/drm/drm_auth.h
index f99d3417f304..ba248ca8866f 100644
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
@@ -88,17 +82,68 @@ struct drm_master {
 	struct idr magic_map;
 	void *driver_priv;
 
-	/* Tree of display resource leases, each of which is a drm_master struct
-	 * All of these get activated simultaneously, so drm_device master points
-	 * at the top of the tree (for which lessor is NULL). Protected by
-	 * &drm_device.mode_config.idr_mutex.
+	/**
+	 * @lessor:
+	 *
+	 * Lease grantor, only set if this &struct drm_master represents a
+	 * lessee holding a lease of objects from @lessor. Full owners of the
+	 * device have this set to NULL.
+	 *
+	 * The lessor does not change once it's set in drm_lease_create(), and
+	 * each lessee holds a reference to its lessor that it releases upon
+	 * being destroyed in drm_lease_destroy().
+	 *
+	 * See also the :ref:`section on display resource leasing
+	 * <drm_leasing>`.
 	 */
-
 	struct drm_master *lessor;
+
+	/**
+	 * @lessee_id:
+	 *
+	 * ID for lessees. Owners (i.e. @lessor is NULL) always have ID 0.
+	 * Protected by &drm_device.mode_config's &drm_mode_config.idr_mutex.
+	 */
 	int	lessee_id;
+
+	/**
+	 * @lessee_list:
+	 *
+	 * List entry of lessees of @lessor, where they are linked to @lessees.
+	 * Not used for owners. Protected by &drm_device.mode_config's
+	 * &drm_mode_config.idr_mutex.
+	 */
 	struct list_head lessee_list;
+
+	/**
+	 * @lessees:
+	 *
+	 * List of drm_masters leasing from this one. Protected by
+	 * &drm_device.mode_config's &drm_mode_config.idr_mutex.
+	 *
+	 * This list is empty if no leases have been granted, or if all lessees
+	 * have been destroyed. Since lessors are referenced by all their
+	 * lessees, this master cannot be destroyed unless the list is empty.
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
+	 * All lessees under this owner (only used where @lessor is NULL).
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
