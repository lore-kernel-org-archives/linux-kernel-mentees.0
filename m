Return-Path: <SRS0=qmss=MO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56713C6377D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Jul 2021 09:30:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFC556120C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Jul 2021 09:30:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFC556120C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9788940360;
	Thu, 22 Jul 2021 09:30:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I6L0RwZx_PX8; Thu, 22 Jul 2021 09:30:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8C7DD40317;
	Thu, 22 Jul 2021 09:30:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 68A79C0010;
	Thu, 22 Jul 2021 09:30:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8237EC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 09:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67BB2402BA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 09:30:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a4cJrqKjhN7a
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 09:30:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 73B1A402BF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 09:30:05 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id q13so2858471plx.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 02:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hdUv+GXySeA885YGpZmLXS+2jizmvcJ4lSDniuXWHI4=;
 b=EhYdQIseNy6lMDk8YjKQ1veyCiTbOgIoJ/VBVn2vLDHGjdPFhTNSRUWUK0bPWotrpJ
 XSI48OOBzprocJPN7b707Qc5XV1f9dLIpRoM7q+PNMy9LwG20xJmvNbKcGSK6p/43ngv
 jDxmxG5TXCq5VK530lsn/vAQrKCaKcQpM7lW3d1Fq/JexqDaA+V87C8Xhqbqp1A/6NrL
 WmSWXzObWM7UDCKqx7X0RGvebf9a9LFGYQcEiQtpFff0ndaFx1/emvMQExqEB3bVyCHs
 Z5PVVvZNWxv6xwAeBz0zwPyunJkYBvTruohXRBUZOy/c20hg9bs5aXsGxSpOS4Gj/5oz
 L9OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hdUv+GXySeA885YGpZmLXS+2jizmvcJ4lSDniuXWHI4=;
 b=M42PsuDtbASXKNfhAGPXxDgvvPaIYscgzGXZrEOZDBbkmfU4AG69+4/9s7aU20HGkm
 bzF6GKYqHAUVbUH2ogmIo9Eq+7R+ExtUCDcwbL3vL9n30RCz2vMhCK8EGrCQaPJiGg0f
 FVz0laq77ZPHT/SvXaA6IWwZLuNxDMkg1MunYUAgwY8vjWIdvLgtTWj50oOGrDTZ/ysA
 KM7bkbFXaxdfkY1A79+fIfNqgG7PRXKVBrHG0UZcpYlZickD2AP5aMK1r3X5LpBHpwWl
 jCmYCHpXuTrh9W2M4irdeQpRGNh9ZYykEUvgE2dddh2QxlcBQxZegTM8yhf0zPZIuw6m
 WApw==
X-Gm-Message-State: AOAM532Cw/M1lXcjHl9pSv+4OqAjnFAWzwDz8nuh2WSYh/WiOzQagwbo
 euyOxI3GoVaq+L79g5CnwlM=
X-Google-Smtp-Source: ABdhPJzNOnM2Xiyy747iVpPkppzdexY5XMa3HjOqEYwbnOjXK0DTZlH0ZcQCcNQf3tlBT+6SeQX2yA==
X-Received: by 2002:a63:e250:: with SMTP id y16mr40565172pgj.247.1626946204761; 
 Thu, 22 Jul 2021 02:30:04 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id q5sm1069592pjo.7.2021.07.22.02.30.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 02:30:04 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: linux-graphics-maintainer@vmware.com, zackr@vmware.com, airlied@linux.ie,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de
Subject: [PATCH 0/3] drm, drm/vmwgfx: fixes and updates related to drm_master
Date: Thu, 22 Jul 2021 17:29:26 +0800
Message-Id: <20210722092929.244629-1-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
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

Hi,

This series contains some improvements that Daniel Vetter proposed following a discussion on a recent series:
https://lore.kernel.org/lkml/20210712043508.11584-1-desmondcheongzx@gmail.com/

While preparing these patches, I also noticed some unprotected uses of drm_master in the vmwgfx driver that can be addressed by new functions from the previous series.

This series is thus broken up into three patches:

1. Switch from the outer drm_device.master_mutex to the inner drm_file.master_lookup_lock in drm_is_current_master.

2. Update the kerneldoc for lease fields in drm_master to clarify lifetime/locking rules.

3. Prevent potential use-after-free bugs by replacing calls to drm_master_get with drm_file_get_master in vmwgfx_surface.c.

Best wishes,
Desmond

Desmond Cheong Zhi Xi (3):
  drm: use the lookup lock in drm_is_current_master
  drm: clarify lifetime/locking for drm_master's lease fields
  drm/vmwgfx: fix potential UAF in vmwgfx_surface.c

 drivers/gpu/drm/drm_auth.c              |  9 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c |  4 +-
 include/drm/drm_auth.h                  | 62 ++++++++++++++++++++-----
 3 files changed, 58 insertions(+), 17 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
