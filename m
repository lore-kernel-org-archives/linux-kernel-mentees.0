Return-Path: <SRS0=WoZ7=NO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72D00C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Aug 2021 17:15:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2034F613BD
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Aug 2021 17:15:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2034F613BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1EE46070A;
	Mon, 23 Aug 2021 17:15:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zCGggXWl560R; Mon, 23 Aug 2021 17:15:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 07801600C6;
	Mon, 23 Aug 2021 17:15:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D2974C001A;
	Mon, 23 Aug 2021 17:15:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EF324C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Aug 2021 17:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF8C18001C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Aug 2021 17:15:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YL3eQeLBdtxX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Aug 2021 17:15:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0AC0C80DBE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Aug 2021 17:15:05 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id n5so12392429pjt.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Aug 2021 10:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fG8NNf17FBZn+wJbjBPwz4tCgByeKPl/oOGmuCamRZg=;
 b=qy03Myz+IJo3XI2Pa/OjLNRQVcFA9XwYXtgRK5gisKBMmbuz2yibe6UT9WHuswtyJR
 nNwK2qHCYX+NCPxlsqyWdt+9f3pUq9DGpeRNVwWglb/RtPk8TBtetgQ4PQiMQOdziAyX
 k8ISZXwFuRoGWI3eHgr/s4rC9gCy8J6At6eViigBk0XIJkuq8NHLNtb/rNGW0/yoaPqr
 xpD4LdeBUFkWPNHZOheFfYfpZhf4II00YbIC8ggdQnyPLVxlJFAtpbq0QUiB2erXeZmA
 sMQ5X0SmNBoDFWFtT2fdW+qt4Yplxd8KjsxPkvbdGJECBAklq+/e7Pm/b9pOY+HpCiEJ
 u3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fG8NNf17FBZn+wJbjBPwz4tCgByeKPl/oOGmuCamRZg=;
 b=d1XnwehfxFCBQREJFf3kJ614lENq7mQ3Z5edp6sFUBttJUhk+pA4wxemta0NKoii/C
 TG0tQqNiXAxtz4sWbg6+ozmrFJbW8OfVu6/7//lk9YBQl/GLfw/UMRARYDdp8Do/xIU+
 8iJFfYrI+UbAkdkt/b1UfQgNn3VeOTUGj4FfGtt2mYYpDbymzdJ4KMOEQTCS96of/q3I
 DH+NTWObPfU7MyDDy6x/TVwRTfS/LJudSzDWCi3Ivk2PNhAydqWZFG5ruBYMIeIQE4rB
 g8BHcVWSRkvM+Cc+Xezs7MdX/WS6XJe9rQSkjy9QYBfUtXZve6oiqlKE1VBW6gEGXZ4P
 BIvA==
X-Gm-Message-State: AOAM530r6TVfhuMmBPJn+djgnaLCBMngcC0nUHbgc9OnBFnZk2YA2jJO
 0Gv+0982RUHOu6GmmaSj4eY=
X-Google-Smtp-Source: ABdhPJwaSxPqYlsApUTHXQKlyVHVNw2D+LT4RVtxvURlnrOCQd9tMJT/xzN3FNc9RODVpb5i7bDn5w==
X-Received: by 2002:a17:90a:f285:: with SMTP id
 fs5mr2379999pjb.148.1629738905421; 
 Mon, 23 Aug 2021 10:15:05 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id q4sm14290830pjd.52.2021.08.23.10.15.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 10:15:04 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Subject: [PATCH v5 0/6] drm: update locking for modesetting
Date: Tue, 24 Aug 2021 01:14:31 +0800
Message-Id: <20210823171437.829404-1-desmondcheongzx@gmail.com>
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

I updated the series to untangle more lock inversions caught by the
Intel-gfx CI, but again there might be more that I missed.

This series now converts drm_device.master_mutex into master_rwsem, and
also removes drm_file.master_lookup_lock.

Overall, this series makes the following changes:

- Patch 1: Fix a potential null ptr dereference in drm_master_release

- Patch 2: Convert master_mutex into rwsem (avoids creating a new lock)

- Patch 3: Update global mutex locking in the ioctl handler (avoids
deadlock when grabbing read lock on master_rwsem in drm_ioctl_kernel)

- Patch 4: Plug races with drm modesetting rights

- Patch 5: Untagle remaining lock hierarchy inversions between
modeset_mutex and master_rwsem

- Patch 6: Replace master_lookup_lock with master_rwsem

v4 -> v5:
- Avoid calling drm_file_get_master while holding on to the modeset
mutex, caught by the Intel-gfx CI (split previous patch 5 into the new
patch 5 & 6)

v3 -> v4 (suggested by Daniel Vetter):
- Drop a patch that added an unnecessary master_lookup_lock in
drm_master_release (previously patch 2)
- Drop a patch that addressed a non-existent race in
drm_is_current_master_locked (previously patch 3)
- Remove fixes for non-existent null ptr dereferences (previous patch 4)
- Protect drm_master.magic_map,unique{_len} with master_rwsem instead of
master_lookup_lock (dropped previous patch 5)
- Drop the patch that moved master_lookup_lock into struct drm_device
(previously patch 1)
- Drop a patch to export task_work_add (previously patch 8)
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

Desmond Cheong Zhi Xi (6):
  drm: fix null ptr dereference in drm_master_release
  drm: convert drm_device.master_mutex into a rwsem
  drm: lock drm_global_mutex earlier in the ioctl handler
  drm: avoid races with modesetting rights
  drm: avoid circular locks with modeset_mutex and master_rwsem
  drm: remove drm_file.master_lookup_lock

 drivers/gpu/drm/drm_atomic_uapi.c |  4 +-
 drivers/gpu/drm/drm_auth.c        | 57 +++++++++++----------
 drivers/gpu/drm/drm_debugfs.c     |  4 +-
 drivers/gpu/drm/drm_drv.c         |  3 +-
 drivers/gpu/drm/drm_encoder.c     |  7 ++-
 drivers/gpu/drm/drm_file.c        |  7 ++-
 drivers/gpu/drm/drm_framebuffer.c |  2 +-
 drivers/gpu/drm/drm_internal.h    |  1 +
 drivers/gpu/drm/drm_ioctl.c       | 48 +++++++++++-------
 drivers/gpu/drm/drm_lease.c       | 83 ++++++++++++++-----------------
 drivers/gpu/drm/drm_mode_object.c | 16 ++++--
 drivers/gpu/drm/drm_plane.c       | 17 +++++--
 drivers/gpu/drm/drm_property.c    |  6 +--
 include/drm/drm_auth.h            |  6 +--
 include/drm/drm_device.h          | 15 ++++--
 include/drm/drm_file.h            | 17 ++-----
 include/drm/drm_lease.h           |  4 +-
 17 files changed, 165 insertions(+), 132 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
