Return-Path: <SRS0=TljZ=NE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A733C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Aug 2021 09:02:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF5996024A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Aug 2021 09:02:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DF5996024A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A14E34015F;
	Fri, 13 Aug 2021 09:02:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Q38um_x7shp; Fri, 13 Aug 2021 09:02:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id BBACE400BB;
	Fri, 13 Aug 2021 09:02:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 764C2C0010;
	Fri, 13 Aug 2021 09:02:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6D025C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 09:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C97C607D4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 09:02:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MBHgZafQ6Xm5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 09:02:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B18A560770
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 09:02:26 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 hv22-20020a17090ae416b0290178c579e424so15068376pjb.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 02:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QyadB7FpuNKWDpEAZ8pIq2q37loKngbMavtVP6UOn6M=;
 b=otuX9qtW7oO7slcAr8Qx9A7t9+t16sjcuBTl0Nz1CiCb/f+XIczvOF3wPAf72bjlA0
 eh9bVUdU+CbC57B3GtKBbNP5C3gC9FbLyiunBYxysyO+TmTxoXWr+pR8FqLuKMqy7ndv
 X42dGivelzNOJPCYdAKl5b9GYZGUPQJhA9z3g5boJaeMcB+MJCqDza6JXTKzu5V+i4Je
 pDYKKtsBFnyJ+68KHYwtwFf8z774UFQYQu8cPjX3Iuzcbas3mGrsFkhyzJ/dcN2WwrT+
 aDca6bW8UBPIF0QqZXCnPVSh4gJB4cThZ/dK+FzKoXsr7HOu+vRrnKGK3IKk8sQVZS0s
 lLXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QyadB7FpuNKWDpEAZ8pIq2q37loKngbMavtVP6UOn6M=;
 b=ouDWIUBqBj7deVHUoJD4NW9X5vAsdDfWIGeWOqhgrCSTqE2hZ9bwKJphvzr+bcSwvJ
 iezy78/V3TS4M965QSG2iMHorrMU7AJgZBnZQqH+joWeh6+ZFTnXRy7OkHZvto5cx/6L
 hmiOVIkGF2heIXLBt+yALQhSPWeIo1zPIZ7ZB9qKJgeSkGtTZH9kgAcBGvhHp2MNOggF
 drrA+xtF/hXVkuINcE61Y/d4dATBjAKOfn/09gpV0UOXd6nXfqEBDnr19GFA5QDewpqM
 mTOth+U0DwzFxafbNwhuNp5HwgUzmJ+VPVuV2l3mUZZegj4SSER8uL/nu8eNATYwFJuz
 F9sw==
X-Gm-Message-State: AOAM533BnGBAzrODmtE7yTGXVTb08XgautGJ2QWri2z3aJf246iDY5w0
 jwyHZD9qIdZZJMI4R2i19Yw=
X-Google-Smtp-Source: ABdhPJzwOPIahHcMzCFDYaA2ZSWs+PyhnrGetdTzb2NAmo63L/38ue6X0HTkv/G8tJ/ZUe0l9S34hA==
X-Received: by 2002:a65:468c:: with SMTP id h12mr1473806pgr.423.1628845346151; 
 Fri, 13 Aug 2021 02:02:26 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id 31sm1818428pgy.26.2021.08.13.02.02.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 02:02:25 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Subject: [PATCH 0/2] drm: update the ioctl handler
Date: Fri, 13 Aug 2021 16:54:48 +0800
Message-Id: <20210813085450.32494-1-desmondcheongzx@gmail.com>
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

Finally got around to it. This patchset implements some updates to the
drm ioctl handler that were first raised by Daniel Vetter in [1].
Namely:

- Flush concurrent processes that can change the modeset when
DRM masters are set/dropped or a lease is revoked
- Unexport drm_ioctl_permit()

Thoughts and comments would be very appreciated.

Link: https://lore.kernel.org/lkml/YN9kAFcfGoB13x7f@phenom.ffwll.local/ [1]

Best wishes,
Desmond

Desmond Cheong Zhi Xi (2):
  drm: avoid races with modesetting rights
  drm: unexport drm_ioctl_permit

 drivers/gpu/drm/drm_auth.c           | 17 +++++++++---
 drivers/gpu/drm/drm_client_modeset.c | 10 ++++---
 drivers/gpu/drm/drm_drv.c            |  2 ++
 drivers/gpu/drm/drm_fb_helper.c      | 20 ++++++++------
 drivers/gpu/drm/drm_internal.h       |  5 ++--
 drivers/gpu/drm/drm_ioctl.c          | 40 +++++++++++++++-------------
 include/drm/drm_device.h             | 11 ++++++++
 include/drm/drm_ioctl.h              |  8 +++++-
 8 files changed, 77 insertions(+), 36 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
