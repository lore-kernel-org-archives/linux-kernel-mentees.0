Return-Path: <SRS0=59bo=NL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E17AC4320A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Aug 2021 10:03:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF0BC610D2
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Aug 2021 10:03:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AF0BC610D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EBCD80D75;
	Fri, 20 Aug 2021 10:03:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q0KDfJWJXcvX; Fri, 20 Aug 2021 10:03:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 709AB80D63;
	Fri, 20 Aug 2021 10:03:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3FE3DC001A;
	Fri, 20 Aug 2021 10:03:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CA24DC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 10:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A32126125A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 10:03:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FHGBmeGof7AH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 10:03:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 743AE60B53
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 10:03:29 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id j1so6963517pjv.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 03:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bUKxomWQZ5QxIYFDsb+klHkUJT56TTMlo6NJBPgwDTw=;
 b=XQIzz6ucLOTQp2DzVHYZkL6sgdA78JVrYg5osuKw9srS4VYeK+4UG5Ocu2rjdGl72K
 hozy0pXafCIL3DzoAGv1/Ynts0t1R95UT4eRGw8efB1QbFsTMQZcZzNzVsRTrIG8Jjsx
 T8XGwXtDc6W1lq8IAGR67sSlxVxx5EVaKUDjyTWi9PWFB78PE35CBfisPfwjL5ZGOqIz
 I3jWnfUS86KLf9vU9Kc1KZ2TAw1LjhjPGp1branPwgmPnlTWP17YOW4FMxOb6Une8Jga
 qPm9GimVgYFG94rKXQtAimPIneqpt2CG69j+fuCneS+OnoCnAwijNwLS1/8pxSTsjEtr
 pP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bUKxomWQZ5QxIYFDsb+klHkUJT56TTMlo6NJBPgwDTw=;
 b=gj9GzJO/qrdnR5hDmMmdCYrFLBZNHJWubvdkpmT4nJKZP3cYxflY6ZYonXR/YIaZK+
 oKXrieiVWqr4C9MF7vdcZfZTs6/dhHwU2+KJN9824mX9F3Z12amZ8OPkUCP7lPjKR+Jq
 mUEgIXnbopJHsa2iZilj6pRfsszWPDk+5P5o2V6Cwf0widPcF3oONAgXqG2d2JFA0Mb7
 PTUVSZbALxepzhGsqBhvzdAaye7A5W6QXE+C6qtiNUaLo/KDJUlD6HeCzIQkmW7LWyF1
 TmiUYY8UMZIsifyVfpgRXJUxLYil3JjEFPRCNweynX05vNoP2MNwmdZ4o8W34UN5ZEii
 yGVQ==
X-Gm-Message-State: AOAM532hsXAtMLYRWo+Uo6XlqKDcC9zD6VICHMEKVHp+N+XgcNmM8NIS
 3ujOm/sKtC/XC4NhrkG2rWE=
X-Google-Smtp-Source: ABdhPJyVUBpUuyiz1RaVzTh1c7byc8ylmZizw2oW+a4dWyMXQewAPos+qDRZ0N0on3UDesmH/00SKQ==
X-Received: by 2002:a17:90a:d791:: with SMTP id
 z17mr3743696pju.203.1629453808880; 
 Fri, 20 Aug 2021 03:03:28 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id i8sm6503876pfo.117.2021.08.20.03.03.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 03:03:28 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Subject: [PATCH v4 0/5] drm: update locking for modesetting
Date: Fri, 20 Aug 2021 18:02:46 +0800
Message-Id: <20210820100251.448346-1-desmondcheongzx@gmail.com>
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

Thanks for all the helpful feedback on the previous version.

Taking all the suggestions together, this series now converts
drm_device.master_mutex into master_rwsem, and also attempts to remove
drm_file.master_lookup_lock. There might still be lock inversions
lurking, so the output from Intel-gfx CI should be interesting to see.

Overall, this series makes the following changes:

- Patch 1: Fix a potential null ptr dereference in drm_master_release

- Patch 2: Convert master_mutex into rwsem (avoids creating a new lock)

- Patch 3: Update global mutex locking in the ioctl handler (avoids
deadlock when grabbing read lock on master_rwsem in drm_ioctl_kernel)

- Patch 4: Plug races with drm modesetting rights

- Patch 5: Replace master_lookup_lock with master_rwsem by untangling
remaining lock hierarchy inversions

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

Desmond Cheong Zhi Xi (5):
  drm: fix null ptr dereference in drm_master_release
  drm: convert drm_device.master_mutex into a rwsem
  drm: lock drm_global_mutex earlier in the ioctl handler
  drm: avoid races with modesetting rights
  drm: remove drm_file.master_lookup_lock

 drivers/gpu/drm/drm_auth.c        | 54 ++++++++++++------------
 drivers/gpu/drm/drm_debugfs.c     |  4 +-
 drivers/gpu/drm/drm_drv.c         |  3 +-
 drivers/gpu/drm/drm_file.c        |  7 ++--
 drivers/gpu/drm/drm_internal.h    |  1 +
 drivers/gpu/drm/drm_ioctl.c       | 48 ++++++++++++---------
 drivers/gpu/drm/drm_lease.c       | 69 ++++++++++++++-----------------
 drivers/gpu/drm/drm_mode_object.c | 14 +++++--
 include/drm/drm_auth.h            |  6 +--
 include/drm/drm_device.h          | 15 +++++--
 include/drm/drm_file.h            | 17 +++-----
 include/drm/drm_lease.h           |  2 +-
 12 files changed, 125 insertions(+), 115 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
