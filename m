Return-Path: <SRS0=ojZq=NQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F66AC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 Aug 2021 10:26:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0378360FE6
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 Aug 2021 10:26:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0378360FE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C90EE60B51;
	Wed, 25 Aug 2021 10:26:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rRo8NYtM-OwT; Wed, 25 Aug 2021 10:25:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C5F5360835;
	Wed, 25 Aug 2021 10:25:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9D71DC0010;
	Wed, 25 Aug 2021 10:25:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6E8E8C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Aug 2021 10:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E74840178
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Aug 2021 10:25:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YoPXZUW-z68d
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Aug 2021 10:25:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 078A6400E5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Aug 2021 10:25:56 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id mq3so16198566pjb.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Aug 2021 03:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ba/aDvD1tkluhQ4EKS9mJop10MbwBdBq8p8q4FF7hME=;
 b=ERW9eAq0Yrphg27JkPRPoE9hi5ScahnBoNwNuz7HulCP62HFkrhXWI0nyJcIddIFn7
 x9v/kxVidsNMcf+nTHom40evTH/p8ND8jqD3OS/vQtRzDdVvNsMuKCG9sUqIQL4To3EM
 hyNb7khUoqPlL/5qNG61XXHvm2smKgPyXj9NR5qFeSi1SnMGy9MQRa1ZpfuctgFw9rIP
 1Jsx2sSz2YPUYO45juwlfJo3Q15Etj0c7enDb+styb1YpHQBOE2wQWJRUVQDwp4vNLDq
 6yfvMoboiwSdcOp4nBSoEYBiUtH5IxObynxBbd5Nc6qiWjduuECQxYvcb2PLgL7buvOL
 BZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ba/aDvD1tkluhQ4EKS9mJop10MbwBdBq8p8q4FF7hME=;
 b=cFMMCJR+j6RltPCiEX9keMgGgPMsx399jYdHi/1vngr1HRClmfCUg5XY2bkYG5rap1
 +mF+o5opLHOlSUGZYrE2KKIoNiqWPgPfXEjgHMvyZLIa4G/uVwYx1oOUWdIS7jnLkHge
 oBXII6S1LFZWRDHmcaJnzN9ZuK4xhopwUcHn1yPJXxvAvwEXJc6SIK/8e9zyEcJoHy6R
 ckRcK5RwTatNKbeUHQJ+H9Cs6e34epNC0/LPPmjBJKW6cSGuwIMgZZrni8gdbwbLWV9G
 ZhjZlFL6X8E7K3AcPMTOEi+TW5Wf4cPYkeBviZeDiojgrBc0rNd4Lmh/x+8kUJ+4uqag
 3NPQ==
X-Gm-Message-State: AOAM530hzZeccBr2d462/wtE2riz2Uwb2XpLzrDqZmY2NyBzvrviEde9
 VoW2HaYjAsajeSiSeMz6b/I=
X-Google-Smtp-Source: ABdhPJxh+Vt9oDZRXNiLgQBph5qkOp3i9zD+1yOu+rnkCFbGG36RMeKJz2sTzFwpPEwsICDPT2HhbQ==
X-Received: by 2002:a17:90a:f696:: with SMTP id
 cl22mr4536225pjb.216.1629887156307; 
 Wed, 25 Aug 2021 03:25:56 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id t42sm10228377pfg.30.2021.08.25.03.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 03:25:55 -0700 (PDT)
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
Subject: [PATCH v6 0/7] drm: update locking for modesetting
Date: Wed, 25 Aug 2021 18:24:04 +0800
Message-Id: <20210825102411.1084220-1-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
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

Hi,

Updated the series again to avoid recursive locking caught by the
Intel-gfx CI. Patch 5 touches a number of files, including the Intel and
VMware drivers, but most changes are simply switching a function call to
the appropriate locked/unlocked version.

Overall, this series fixes races with modesetting rights, converts
drm_device.master_mutex into master_rwsem, and removes
drm_file.master_lookup_lock.

- Patch 1: Fix a potential null ptr dereference in drm_master_release

- Patch 2: Convert master_mutex into rwsem (avoids creating a new lock)

- Patch 3: Update global mutex locking in the ioctl handler (avoids
deadlock when grabbing read lock on master_rwsem in drm_ioctl_kernel)

- Patch 4: Plug races with drm modesetting rights

- Patch 5: Modify drm_mode_object_find to fix potential recursive
locking of master_rwsem and lock inversions between modeset_mutex and
master_rwsem

- Patch 6: Remove remaining potential lock inversions between
modeset_mutex and master_rwsem

- Patch 7: Replace master_lookup_lock with master_rwsem

v5 -> v6:
- Fix recursive locking on master_rwsem, caught by the Intel-gfx CI
(only current patch 5 & 6 changed)

v4 -> v5:
- Avoid calling drm_file_get_master while holding on to the modeset
mutex, caught by the Intel-gfx CI

v3 -> v4 (suggested by Daniel Vetter):
- Drop a patch that added an unnecessary master_lookup_lock in
drm_master_release
- Drop a patch that addressed a non-existent race in
drm_is_current_master_locked
- Remove fixes for non-existent null ptr dereferences
- Protect drm_master.magic_map,unique{_len} with master_rwsem instead of
master_lookup_lock
- Drop the patch that moved master_lookup_lock into struct drm_device
- Drop a patch to export task_work_add
- Revert the check for the global mutex in the ioctl handler to use
drm_core_check_feature instead of drm_dev_needs_global_mutex
- Push down master_rwsem locking for selected ioctls to avoid lock
hierarchy inversions, and to allow us to hold write locks on
master_rwsem instead of flushing readers
- Remove master_lookup_lock by replacing it with master_rwsem

v2 -> v3:
- Unexport drm_master_flush, as suggested by Daniel Vetter.
- Merge master_mutex and master_rwsem, as suggested by Daniel Vetter.
- Export task_work_add, reported by kernel test robot.
- Make master_flush static, reported by kernel test robot.
- Move master_lookup_lock into struct drm_device.
- Add a missing lock on master_lookup_lock in drm_master_release.
- Fix a potential race in drm_is_current_master_locked.
- Fix potential null ptr dereferences in drm_{auth, ioctl}.
- Protect magic_map,unique{_len} with  master_lookup_lock.
- Convert master_mutex into a rwsem.
- Update global mutex locking in the ioctl handler.

v1 -> v2 (suggested by Daniel Vetter):
- Address an additional race when drm_open runs.
- Switch from SRCU to rwsem to synchronise readers and writers.
- Implement drm_master_flush with task_work so that flushes can be
queued to run before returning to userspace without creating a new
DRM_MASTER_FLUSH ioctl flag.

Best wishes,
Desmond

Desmond Cheong Zhi Xi (7):
  drm: fix null ptr dereference in drm_master_release
  drm: convert drm_device.master_mutex into a rwsem
  drm: lock drm_global_mutex earlier in the ioctl handler
  drm: avoid races with modesetting rights
  drm: avoid circular locks in drm_mode_object_find
  drm: avoid circular locks with modeset_mutex and master_rwsem
  drm: remove drm_file.master_lookup_lock

 drivers/gpu/drm/drm_atomic_uapi.c            |  7 +-
 drivers/gpu/drm/drm_auth.c                   | 57 ++++++------
 drivers/gpu/drm/drm_color_mgmt.c             |  2 +-
 drivers/gpu/drm/drm_crtc.c                   |  5 +-
 drivers/gpu/drm/drm_debugfs.c                |  4 +-
 drivers/gpu/drm/drm_drv.c                    |  3 +-
 drivers/gpu/drm/drm_encoder.c                |  7 +-
 drivers/gpu/drm/drm_file.c                   |  7 +-
 drivers/gpu/drm/drm_framebuffer.c            |  2 +-
 drivers/gpu/drm/drm_internal.h               |  1 +
 drivers/gpu/drm/drm_ioctl.c                  | 48 ++++++----
 drivers/gpu/drm/drm_lease.c                  | 94 ++++++++++----------
 drivers/gpu/drm/drm_mode_object.c            | 13 ++-
 drivers/gpu/drm/drm_plane.c                  | 22 +++--
 drivers/gpu/drm/drm_property.c               |  6 +-
 drivers/gpu/drm/i915/display/intel_overlay.c |  2 +-
 drivers/gpu/drm/i915/display/intel_sprite.c  |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c          |  2 +-
 include/drm/drm_auth.h                       |  6 +-
 include/drm/drm_connector.h                  | 23 +++++
 include/drm/drm_crtc.h                       | 22 +++++
 include/drm/drm_device.h                     | 15 +++-
 include/drm/drm_file.h                       | 17 ++--
 include/drm/drm_lease.h                      |  2 +
 include/drm/drm_mode_object.h                |  3 +
 include/drm/drm_plane.h                      | 20 +++++
 26 files changed, 249 insertions(+), 143 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
