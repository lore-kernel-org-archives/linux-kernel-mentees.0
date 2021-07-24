Return-Path: <SRS0=Q5UI=MQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79287C4320A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 24 Jul 2021 11:19:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED98560BD3
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 24 Jul 2021 11:19:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ED98560BD3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EE774063C;
	Sat, 24 Jul 2021 11:19:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XkdNPDjP429O; Sat, 24 Jul 2021 11:19:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 9D445403EB;
	Sat, 24 Jul 2021 11:19:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7A8ABC001A;
	Sat, 24 Jul 2021 11:19:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7D1AFC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Jul 2021 11:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68AF5828A9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Jul 2021 11:19:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g108_8NF3tKP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Jul 2021 11:19:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B151682849
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Jul 2021 11:19:00 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 u9-20020a17090a1f09b029017554809f35so12648297pja.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Jul 2021 04:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fu+EOl8MzFHnqJUqNfrpGZTo0/rhrJKaN+eR+XuGHMc=;
 b=O85DMHyeVRIuNVgeITMNvJFbLraGrRkBIWg4sV/aVqhdxkebXDwNJJLp+AUkqsDeEL
 Na7LsPIPk6TvdsnmYa2vHP35R21S4kl96KOk9HSz0FzBQ6wgclLdqQZs74HukQKS0ckC
 shl5r8IQqN4Esh1S1GLl8L4MppOhtJku495fCCLt1X6Zj601Rljo4zYNmKVItA6h8/St
 D/mC85zB75DvGX/fE3DM0VpUNJeagVUTRdXcN4jxdZOE+Nq6WlYcWdZqOEFZ5mU6BCY9
 2VniXcW1EHtTMG0eT76mpjoJcRkv6UMuoA0DWDS2+bmBoQrSfP6m8FFfTG3slhbMHdZo
 jEhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fu+EOl8MzFHnqJUqNfrpGZTo0/rhrJKaN+eR+XuGHMc=;
 b=POUtC8wxAKKanYS2zc1aNV2ABiXTu5MHVJmGoSlgIiXaiescr3Udr+4Lu0KsjS7LtD
 qIortNa03TM5YCisTnszqwX16QSMi4bdiT0NRakfiO51Bu45Qj0ITcearNHRoBkugGRd
 4emML2ZIas5FwrB4tfsqottw/RU3VVi/bi0jErr+fMXUW89MXSCD7l6CFp/Vju8KNDld
 zgVhDCEBOPAxRC3YRa+wwuJdC/ZjjT8K40g+JKPhJO0q8J8J6W7b5pT3TK1Gx/VvqD/H
 Ami69BIsqrNyLGfyoHgV16RfXqq14iMXBUx52Jyq8FK+RMnU08L25KwrfjvMc4rzgkxs
 AtxQ==
X-Gm-Message-State: AOAM531ML+h76YeLjUzvvFwpK7VucpsQ2TmEtVLs3B20SBPgM+4z28VF
 +GFgHOUMO+iUr5GY5RPmDJo=
X-Google-Smtp-Source: ABdhPJxbdpJ6RuIPKFdq0gqilzFZT9DQCDdNnN2S5MzYOUyd3XCuX/ms1akPJbumH/5igHmyD+GLbg==
X-Received: by 2002:a17:90b:b12:: with SMTP id
 bf18mr17739337pjb.74.1627125540031; 
 Sat, 24 Jul 2021 04:19:00 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id v15sm21310057pff.105.2021.07.24.04.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 04:18:59 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: linux-graphics-maintainer@vmware.com, zackr@vmware.com, airlied@linux.ie,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, corbet@lwn.net
Subject: [PATCH v2 0/3] drm,
 drm/vmwgfx: fixes and updates related to drm_master
Date: Sat, 24 Jul 2021 19:18:21 +0800
Message-Id: <20210724111824.59266-1-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
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

Hi,

Just a note that only patch 2 changed from v1 to v2 of this series.

This series contains some improvements that Daniel Vetter proposed following a discussion on a recent series:
https://lore.kernel.org/lkml/20210712043508.11584-1-desmondcheongzx@gmail.com/

While preparing these patches, I also noticed some unprotected uses of drm_master in the vmwgfx driver that can be addressed by new functions from the previous series.

This series is thus broken up into three patches:

1. Switch from the outer drm_device.master_mutex to the inner drm_file.master_lookup_lock in drm_is_current_master.

2. Update the kerneldoc for drm leases to clarify usage and lifetime/locking rules.

3. Prevent potential use-after-free bugs by replacing calls to drm_master_get with drm_file_get_master in vmwgfx_surface.c.

v1 -> v2:
Changes to patch 2:
- Clarified description of lease fields in drm_master with suggestions from Daniel Vetter.
- Added an overview DOC: section for drm leases in drm-uapi.rst.
- Cleaned up function documentation in drm_lease.c to use kernel-doc formatting.

Best wishes,
Desmond

Desmond Cheong Zhi Xi (3):
  drm: use the lookup lock in drm_is_current_master
  drm: clarify usage of drm leases
  drm/vmwgfx: fix potential UAF in vmwgfx_surface.c

 Documentation/gpu/drm-uapi.rst          |  15 ++
 drivers/gpu/drm/drm_auth.c              |   9 +-
 drivers/gpu/drm/drm_lease.c             | 182 ++++++++++++++----------
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c |   4 +-
 include/drm/drm_auth.h                  |  67 +++++++--
 5 files changed, 187 insertions(+), 90 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
