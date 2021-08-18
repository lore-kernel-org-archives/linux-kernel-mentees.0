Return-Path: <SRS0=1Ivo=NJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E82DC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Aug 2021 07:39:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B216606A5
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Aug 2021 07:39:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B216606A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAB2A80B8E;
	Wed, 18 Aug 2021 07:39:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KdzX9vz8_Tel; Wed, 18 Aug 2021 07:39:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0602880B5D;
	Wed, 18 Aug 2021 07:39:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D72D1C001A;
	Wed, 18 Aug 2021 07:39:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5CE34C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 07:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A7D74039F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 07:39:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ke7ozBcDJf0n
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 07:39:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C7954048F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 07:39:27 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id e15so1251630plh.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 00:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e6vxkGEC/5cBQ7RDSXvwNkc+jNWhSIL2gt3cyXjlMy0=;
 b=i4L99wf64dEZ9LMIjZCdq5HBsL7YO+w6mPeYaGb3CXwuW15cjMopamJ7i+UtFSaN25
 z4rZKcLO5w15cg7+P4rlboKjkGbHm2INjwHBCSyIBdvOIIHKMs8iq36Uc2t2HpR4U6DS
 PeVX7wc1SgqOfwrOtaOMAAAbWfhKZOxgQEPpTAD2DwGmKJuxv9SRbs1jI4DjEfvYP16W
 GdHdUTB0UPtvFtAUhhcXY6s7AuE8PdIXUBbgVw/jQ8o6Dek7vaaLJH/PPPw6v2VcG07L
 knSCx6Bi7AAG29YttwsWCAtn2JIenaQ0ncOp7C6cEebcrLUcHzclF2lQeLIn61qhRq9F
 j7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e6vxkGEC/5cBQ7RDSXvwNkc+jNWhSIL2gt3cyXjlMy0=;
 b=ciQ/QM1SMjN8MaYRZ7rY+jZjBHQicbyBc6AGHgqdrGEgTOj2uB4p9+I0K0dSAsUjiW
 kMoTIqF2mQBgC4uLMZI1jHjnhdCHIDhOTrYk1ZMd4qGZN9XtC2XPo0MRqTqOCqM+6BdQ
 PjKPsGKUlOjPJtkyyWZG5HdUa0vRhYU1fBO1e5e6W3V0Fq5DjygCf6TZhVXquX0bgO89
 UNdProRi4PtcUA3ZFUAwcv+wA3jDd3FWdn1DCKb6qffjBcO3Tgua34jQSMzP92lpl1wp
 /bkd1vRYg3hQEGcgM1sosQcUICriwuklwhaYYTG63gR5VAsUx2SCHyRyP2qDJNKfZZs0
 exoQ==
X-Gm-Message-State: AOAM533IF/RXGVDWyXt0cP2s+DeP3k/qHg8aHOXJawzTxPsON/uJA8Vu
 jawsDUHCZQhJ5s4aE/3dTlw=
X-Google-Smtp-Source: ABdhPJwsjLetmmkwthytXHRAjBgzfi7amhs4Th7JIiNaKTNGuKsh8scjwN6S/Fd61RcIgh641geZBg==
X-Received: by 2002:a17:90a:8b12:: with SMTP id
 y18mr8016646pjn.72.1629272366618; 
 Wed, 18 Aug 2021 00:39:26 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id u3sm3886729pjr.2.2021.08.18.00.39.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 00:39:26 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com, axboe@kernel.dk, oleg@redhat.com,
 tglx@linutronix.de, dvyukov@google.com, walter-zh.wu@mediatek.com
Subject: [PATCH v3 0/9] drm, kernel: update locking for DRM
Date: Wed, 18 Aug 2021 15:38:15 +0800
Message-Id: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
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

The patches in this series are largely fixes and prepwork leading up to
the final patch which plugs races with modesetting rights. Most of the
fixes don't have bug reports, so comments would be very appreciated.

The biggest change from the previous version is that we convert
drm_device.master_mutex into master_rwsem, instead of introducing
master_rwsem as a third lock.

Overall, this series makes the following changes:

- Patch 1: Move master_lookup_lock into struct drm_device (enables us to
use it to protect attributes accessed by different drm_files)

- Patch 2: Add a missing master_lookup_lock in drm_master_release

- Patch 3: Fix a potential race in drm_is_current_master_locked

- Patch 4: Fix potential null ptr dereferences in drm_{auth, ioctl}

- Patch 5: Move magic_map,unique{_len} out from master_mutex's
protection into master_lookup_lock's protection (allows us to avoid
read_lock -> write_lock deadlocks)

- Patch 6: Convert master_mutex into rwsem (avoids creating a new lock)

- Patch 7: Update global mutex locking in the ioctl handler (avoids
deadlock when grabbing read lock on master_rwsem in drm_ioctl_kernel)

- Patch 8: Export task_work_add (enables us to write drm_master_flush)

- Patch 9: Plug races with drm modesetting rights

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

Desmond Cheong Zhi Xi (9):
  drm: move master_lookup_lock into drm_device
  drm: hold master_lookup_lock when releasing a drm_file's master
  drm: check for null master in drm_is_current_master_locked
  drm: fix potential null ptr dereferences in drm_{auth,ioctl}
  drm: protect magic_map,unique{_len} with master_lookup_lock
  drm: convert drm_device.master_mutex into a rwsem
  drm: update global mutex lock in the ioctl handler
  kernel: export task_work_add
  drm: avoid races with modesetting rights

 drivers/gpu/drm/drm_auth.c     | 108 ++++++++++++++++++++++++---------
 drivers/gpu/drm/drm_debugfs.c  |   4 +-
 drivers/gpu/drm/drm_drv.c      |   4 +-
 drivers/gpu/drm/drm_file.c     |   1 -
 drivers/gpu/drm/drm_internal.h |   1 +
 drivers/gpu/drm/drm_ioctl.c    |  39 +++++++-----
 drivers/gpu/drm/drm_lease.c    |   1 +
 include/drm/drm_auth.h         |   6 +-
 include/drm/drm_device.h       |  27 +++++++--
 include/drm/drm_file.h         |  20 +++---
 kernel/task_work.c             |   1 +
 11 files changed, 145 insertions(+), 67 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
