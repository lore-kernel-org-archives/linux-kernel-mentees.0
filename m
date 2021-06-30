Return-Path: <SRS0=IXLA=LY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CAFFC11F68
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Jun 2021 14:55:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D37646142C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Jun 2021 14:55:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D37646142C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D65E404F7;
	Wed, 30 Jun 2021 14:55:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OhML__gxERUr; Wed, 30 Jun 2021 14:55:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 05E35415A7;
	Wed, 30 Jun 2021 14:55:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BD23CC001A;
	Wed, 30 Jun 2021 14:55:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CE62CC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Jun 2021 14:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB840415A7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Jun 2021 14:55:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u1o1zHonSPYc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Jun 2021 14:55:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 67805404F7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Jun 2021 14:55:22 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id d12so2692984pfj.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Jun 2021 07:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DbLagrqX9GyFiYDlx5GodYpslzbdCAvx8G0gowIUudY=;
 b=rnIF81Edc3BhqlLAhT7hsmv4IGJ2tTSllDOEblCmt2DkJCoHAiTvkhLTKVabX/zEIp
 jVmFNxGLpzqMD79Pwcu+S7EkwFEuzn0yfiy5i1M1TxQD6Io14xq7f1hVfw7ORpo24yXs
 u9Zx3dPG0dOmI5ovMmchBx9LUXfwLVeiJOTMUsPvr5ax+VfBqaff4BH4Aj35xcqN0pYW
 dTjvfELHQYsZiJbc+veYEh1PNrZMzYfNa4PqAkJZuJSjGDD1yHsp6ce8uQKoJZG7hVQf
 Gee2BSaK/VndKuhsqjo+Bh6H+wSDaFmkKZHpePJ+kJdIVhrEIPjzplsJDx3aj6d2DJcR
 4JpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DbLagrqX9GyFiYDlx5GodYpslzbdCAvx8G0gowIUudY=;
 b=j425/ieru3JMuSnkimexdAk1L1aulqHrKPmqfUoMA0Nz/IFRm1AI6KdGj6qGldkFLF
 YWj+10SVZFr9iRK5X2usm5EUmDqfPhbORjH8mZr2cM1+1jkGC1ZABKSc7XL+w/00txko
 ZyOnvqM6MGKqAXgYqs9s+B8girrjsbWNRM6bL83vbEG9VkIn39PU43uDsW0d0by+cGLK
 9XkaWUW7Fjvj9+muJExKh7ivATmsd11U5ddKlT4iT3iP5soPNH0AIPhqsBzD3BzQJYxD
 IjGoN0rvXj8Ri/w455zV9lZ2z5r6Fj0NAWI7fWEHDy0VDtkwWhMFlj6aSPehO87MzSfM
 iCVg==
X-Gm-Message-State: AOAM5328UPa4gf6WQcw5YrteYHpcamtfwInLnDS11/dnNH4OvGdeuMHU
 vqcBgURE4jvw9M6J2igDbuM=
X-Google-Smtp-Source: ABdhPJy20ySZ9X53g3XT2CVgt7VxxhHPKHPP85Vof/2Cvj1fsukFMR41XOIOAlZsTMRR6qDi5I1c+A==
X-Received: by 2002:a65:608a:: with SMTP id t10mr8423416pgu.311.1625064921816; 
 Wed, 30 Jun 2021 07:55:21 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id d13sm7157234pjr.49.2021.06.30.07.55.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 07:55:21 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Subject: [PATCH v6 0/4] drm: address potential UAF bugs with drm_master ptrs
Date: Wed, 30 Jun 2021 22:54:00 +0800
Message-Id: <20210630145404.5958-1-desmondcheongzx@gmail.com>
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

This patch series addresses potential use-after-free errors when dereferencing pointers to struct drm_master. These were identified after one such bug was caught by Syzbot in drm_getunique():
https://syzkaller.appspot.com/bug?id=148d2f1dfac64af52ffd27b661981a540724f803

The series is broken up into four patches:

1. Move a call to drm_is_current_master() out from a section locked by &dev->mode_config.mutex in drm_mode_getconnector(). This patch does not apply to stable.

2. Move a call to _drm_lease_held() out from the section locked by &dev->mode_config.idr_mutex in __drm_mode_object_find().

3. Implement a locked version of drm_is_current_master() function that's used within drm_auth.c.

4. Identify areas in drm_lease.c where pointers to struct drm_master are dereferenced, and ensure that the master pointers are not freed during use.

Changes in v5 -> v6:
- Patch 2:
Add patch 2 to the series. This patch moves the call to _drm_lease_held out from the section locked by &dev->mode_config.idr_mutex in __drm_mode_object_find.

- Patch 4:
Clarify the kerneldoc for dereferencing drm_file.master, as suggested by Daniel Vetter.

Refactor error paths with goto labels so that each function only has a single drm_master_put(), as suggested by Emil Velikov.

Modify comparison to NULL into "!master", as suggested by the intel-gfx CI.

Changes in v4 -> v5:
- Patch 1:
Add patch 1 to the series. The changes in patch 1 do not apply to stable because they apply to new changes in the drm-misc-next branch. This patch moves the call to drm_is_current_master in drm_mode_getconnector out from the section locked by &dev->mode_config.mutex.

Additionally, added a missing semicolon to the patch, caught by the intel-gfx CI.

- Patch 3:
Move changes to drm_connector.c into patch 1.

Changes in v3 -> v4:
- Patch 3:
Move the call to drm_is_current_master in drm_mode_getconnector out from the section locked by &dev->mode_config.mutex. As suggested by Daniel Vetter. This avoids a circular lock lock dependency as reported here https://patchwork.freedesktop.org/patch/440406/

Additionally, inside drm_is_current_master, instead of grabbing &fpriv->master->dev->master_mutex, we grab &fpriv->minor->dev->master_mutex to avoid dereferencing a null ptr if fpriv->master is not set.

- Patch 4:
Modify kerneldoc formatting.

Additionally, add a file_priv->master NULL check inside drm_file_get_master, and handle the NULL result accordingly in drm_lease.c. As suggested by Daniel Vetter.

Changes in v2 -> v3:
- Patch 3:
Move the definition of drm_is_current_master and the _locked version higher up in drm_auth.c to avoid needing a forward declaration of drm_is_current_master_locked. As suggested by Daniel Vetter.

- Patch 4:
Instead of leaking drm_device.master_mutex into drm_lease.c to protect drm_master pointers, add a new drm_file_get_master() function that returns drm_file->master while increasing its reference count, to prevent drm_file->master from being freed. As suggested by Daniel Vetter.

Changes in v1 -> v2:
- Patch 4:
Move the lock and assignment before the DRM_DEBUG_LEASE in drm_mode_get_lease_ioctl, as suggested by Emil Velikov.

Desmond Cheong Zhi Xi (4):
  drm: avoid circular locks in drm_mode_getconnector
  drm: avoid circular locks in __drm_mode_object_find
  drm: add a locked version of drm_is_current_master
  drm: protect drm_master pointers in drm_lease.c

 drivers/gpu/drm/drm_auth.c        | 76 +++++++++++++++++++++--------
 drivers/gpu/drm/drm_connector.c   |  5 +-
 drivers/gpu/drm/drm_lease.c       | 81 +++++++++++++++++++++++--------
 drivers/gpu/drm/drm_mode_object.c | 10 ++--
 include/drm/drm_auth.h            |  1 +
 include/drm/drm_file.h            | 15 ++++--
 6 files changed, 141 insertions(+), 47 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
