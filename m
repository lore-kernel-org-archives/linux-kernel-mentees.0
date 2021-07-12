Return-Path: <SRS0=bgCq=ME=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D31F1C07E9B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Jul 2021 04:35:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F0D9610D2
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Jul 2021 04:35:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F0D9610D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD18040455;
	Mon, 12 Jul 2021 04:35:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id izZMaNc9QBDP; Mon, 12 Jul 2021 04:35:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 835484045E;
	Mon, 12 Jul 2021 04:35:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 414D3C0010;
	Mon, 12 Jul 2021 04:35:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 90400C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Jul 2021 04:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 767A54026C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Jul 2021 04:35:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ay1oNUqVdXeU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Jul 2021 04:35:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 40C544011A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Jul 2021 04:35:49 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id h1so8495598plf.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Jul 2021 21:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4rLWxgvTxRO6/WnLGuPe5bx1yA3ZPfoXkYG4O0mj5Ag=;
 b=Geoi+0MWpfFz4FPkrYi/nx4PnAtxpDewQhIbIJJEpdvLJd+zqBYat7d/uOq4bOLVmd
 crQ/FoTUO9henHk0k11fQML6QMzkjWON0Bt18h+gJv2G/u9O9SDKTBmGaHB5IW53VE4S
 dROuzbLroxbfZ+hAfVRA1sBJwY8qb8JowpBI+TITbGDJyvK+HYjHCaIUdC1xAyu7xKp5
 IPR01Sq4YwLldIdNar4XcUj524b6nWeJauuyT1o61vKbGdw75fpaUfireHd2P6nG5SoU
 h4Fpq9tBo8yTM42PgkUERGI5dzs6z4lPbvLONb4iO7jVKoeo3VkpxgjE/ca8jJ+PZKkL
 41/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4rLWxgvTxRO6/WnLGuPe5bx1yA3ZPfoXkYG4O0mj5Ag=;
 b=O12XX4ZEAdCxPXn0/V45vwV35fJIDUlZ8nv7Ck6OwTiArbGFAwccbXkU+/8ossXJmy
 CEUg8t61FF0fmqgHiOdVPchwWv8yO8tROhK6T6CSg2p9j4nb/DlG5dqj0A8mPSz+tc/9
 KtDVVNIW4Ui+G/ZyJEyBIanOIHarN34MCyFHlBaB9E1hauJeyGo7MnlpEKKOFHPGo6yA
 kFWBlhgYJGC+ZetJpSKvTMfxAHFhMwGn+h/eiAI4bRCP6O+UYD/zbmMtX+QlVhoHF3Ap
 jXRvC+PCAWpl4Vp9hye8FNOenHJphE+6b+khNVhshw6TsSZeXKO0neUYO0EcIYF1Lu9W
 89Ew==
X-Gm-Message-State: AOAM533XB0jIctaQE/rjXf1MYQ4l63yvB0Y0VNH+9Uo2VHMQ1BKCOUCj
 T0zLdoPB13NKz8KuUZcBQes=
X-Google-Smtp-Source: ABdhPJwl+CRq9QTeLobKLyJ6aOiBlK052/w9C9BYiZxarzwfe1F9ZnaLlpMcaNfVay5lzr4CjUJ4tQ==
X-Received: by 2002:a17:90a:c484:: with SMTP id
 j4mr48282588pjt.218.1626064548647; 
 Sun, 11 Jul 2021 21:35:48 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id n3sm14242764pfn.216.2021.07.11.21.35.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 21:35:48 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Subject: [PATCH v8 0/5] drm: address potential UAF bugs with drm_master ptrs
Date: Mon, 12 Jul 2021 12:35:03 +0800
Message-Id: <20210712043508.11584-1-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: intel-gfx@lists.freedesktop.org, emil.l.velikov@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,
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

In the previous thread on this series we decided to remove a patch that was violating a lockdep requirement in drm_lease. In addition to this change, I took a closer look at the CI logs for the Basic Acceptance Tests and noticed that another regression was introduced. The new patch 2 is a response to this.

Overall, this series addresses potential use-after-free errors when dereferencing pointers to struct drm_master. These were identified after one such bug was caught by Syzbot in drm_getunique():
https://syzkaller.appspot.com/bug?id=148d2f1dfac64af52ffd27b661981a540724f803

The series is broken up into five patches:

1. Move a call to drm_is_current_master() out from a section locked by &dev->mode_config.mutex in drm_mode_getconnector(). This patch does not apply to stable.

2. Move a call to drm_is_current_master() out from the RCU read-side critical section in drm_clients_info().

3. Implement a locked version of drm_is_current_master() function that's used within drm_auth.c.

4. Serialize drm_file.master by introducing a new spinlock that's held whenever the value of drm_file.master changes.

5. Identify areas in drm_lease.c where pointers to struct drm_master are dereferenced, and ensure that the master pointers are not freed during use.

v7 -> v8:
- Remove the patch that moves the call to _drm_lease_held out from the section locked by &dev->mode_config.idr_mutex in __drm_mode_object_find. This patch violated an existing lockdep requirement as reported by the intel-gfx CI.
- Added a new patch that moves a call to drm_is_current_master out from the RCU critical section in drm_clients_info. This was reported by the intel-gfx CI.

v6 -> v7:
- Modify code alignment as suggested by the intel-gfx CI.
- Add a new patch to the series that adds a new lock to serialize drm_file.master, in response to the lockdep splat by the intel-gfx CI.
- Update drm_file_get_master to use the new drm_file.master_lock instead of drm_device.master_mutex, in response to the lockdep splat by the intel-gfx CI.

v5 -> v6:
- Add a new patch to the series that moves the call to _drm_lease_held out from the section locked by &dev->mode_config.idr_mutex in __drm_mode_object_find.
- Clarify the kerneldoc for dereferencing drm_file.master, as suggested by Daniel Vetter.
- Refactor error paths with goto labels so that each function only has a single drm_master_put(), as suggested by Emil Velikov.
- Modify comparisons to NULL into "!master", as suggested by the intel-gfx CI.

v4 -> v5:
- Add a new patch to the series that moves the call to drm_is_current_master in drm_mode_getconnector out from the section locked by &dev->mode_config.mutex.
- Additionally, added a missing semicolon to the patch, caught by the intel-gfx CI.

v3 -> v4:
- Move the call to drm_is_current_master in drm_mode_getconnector out from the section locked by &dev->mode_config.mutex. As suggested by Daniel Vetter. This avoids a circular lock lock dependency as reported here https://patchwork.freedesktop.org/patch/440406/
- Inside drm_is_current_master, instead of grabbing &fpriv->master->dev->master_mutex, we grab &fpriv->minor->dev->master_mutex to avoid dereferencing a null ptr if fpriv->master is not set.
- Modify kerneldoc formatting for drm_file.master, as suggested by Daniel Vetter.
- Additionally, add a file_priv->master NULL check inside drm_file_get_master, and handle the NULL result accordingly in drm_lease.c. As suggested by Daniel Vetter.

v2 -> v3:
- Move the definition of drm_is_current_master and the _locked version higher up in drm_auth.c to avoid needing a forward declaration of drm_is_current_master_locked. As suggested by Daniel Vetter.
- Instead of leaking drm_device.master_mutex into drm_lease.c to protect drm_master pointers, add a new drm_file_get_master() function that returns drm_file->master while increasing its reference count, to prevent drm_file->master from being freed. As suggested by Daniel Vetter.

v1 -> v2:
- Move the lock and assignment before the DRM_DEBUG_LEASE in drm_mode_get_lease_ioctl, as suggested by Emil Velikov.

Desmond Cheong Zhi Xi (5):
  drm: avoid circular locks in drm_mode_getconnector
  drm: avoid blocking in drm_clients_info's rcu section
  drm: add a locked version of drm_is_current_master
  drm: serialize drm_file.master with a new spinlock
  drm: protect drm_master pointers in drm_lease.c

 drivers/gpu/drm/drm_auth.c      | 93 ++++++++++++++++++++++++---------
 drivers/gpu/drm/drm_connector.c |  5 +-
 drivers/gpu/drm/drm_debugfs.c   |  3 +-
 drivers/gpu/drm/drm_file.c      |  1 +
 drivers/gpu/drm/drm_lease.c     | 81 +++++++++++++++++++++-------
 include/drm/drm_auth.h          |  1 +
 include/drm/drm_file.h          | 18 +++++--
 7 files changed, 152 insertions(+), 50 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
