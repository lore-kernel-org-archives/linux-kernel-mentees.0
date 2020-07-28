Return-Path: <SRS0=RTaY=BH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC016C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 11:53:43 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBAE4206D7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 11:53:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tebaVCGF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBAE4206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8F4AC87C57;
	Tue, 28 Jul 2020 11:53:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lQMgkB8NZ+Uy; Tue, 28 Jul 2020 11:53:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 85D178770B;
	Tue, 28 Jul 2020 11:53:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7CA1DC004F;
	Tue, 28 Jul 2020 11:53:42 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AC437C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 11:53:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9BB3385633
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 11:53:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5DhycVxl-cly
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 11:53:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
 [209.85.219.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C967A85618
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 11:53:38 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id j10so2272003qvo.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 04:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9b0/x+SNOsArF0QozJjz6aJQuh2KJ70gscVHnalujy4=;
 b=tebaVCGFtEwcxHEM2mSMLHj+/y/YIqY5F9PfjQr+R28mNZgbYk25oEbZZId/XZ0s3P
 tyGFy7H5tAKQH/KcvFG7RcKLdtt/qqcX2osS0vTQJ/3rUpnTnbtfiDJ18KDKt9nZIzGb
 jioEWFF54X/RJ4UBRAI9O+jT36f7HD+T/xOTD9lKZ+UDK636bylzcmIRkD7DOA9185ON
 jJG7VOHFIS3KDo49DOPfTt8B8gh1BvSt7q/oevhavy3mNdL7jkhDMD98eP3cCfzNmA6a
 4JHhj/cTKGPEzg0ULWSgB+t3qfMc0wvywvSPhcRbk49lv6ar4UEgPv6Ss42pOY9LvMo+
 N4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9b0/x+SNOsArF0QozJjz6aJQuh2KJ70gscVHnalujy4=;
 b=JRjGj0Ke5NyDU1Y3l9rhPHpf80eZZcsGKQepEmO8lek8xBlUgNl0uIEgwo3ZBdsyrm
 UmHamN+UBmcdkj8yvxCphLLWfxiUAZgBzzXy0vdAcBJ+i5m436rtmNk8VskxXmCl3kgm
 5v5h/lycxfA+2ygI7TxKIL2o1XNzzHJNJmKZAtRAS1DDszVarkPUEp2PS/VjFCfR1uPH
 V4Y5x6GFXtz3Oc/duC1gXZtQKu5wh2Oufhac26hCb0eHvBmvZdKvDm/rpE2vCCdVdRgf
 Cdby6HhUrbi7E8tIMU6lqkVFOsr2blDXDfOpbyHhijr8CqQoF6AORpvH3rF4domSj3cG
 Pn6A==
X-Gm-Message-State: AOAM5310NJgKY6lLNzYm1vaxlrAlGoAP7Z2Px6Hd9cvEI5bm1Bn+lv+Z
 4WmS/KgCVLXcMvebJUsT/Q==
X-Google-Smtp-Source: ABdhPJytWHbSuKSgdqrZHnoY6Cfo5vrUorIiwqfDq+wpVnip+5M/a1iy0umq4my1/dRXaNveQev4oQ==
X-Received: by 2002:ad4:4152:: with SMTP id z18mr154690qvp.42.1595937217951;
 Tue, 28 Jul 2020 04:53:37 -0700 (PDT)
Received: from localhost.localdomain (c-76-119-149-155.hsd1.ma.comcast.net.
 [76.119.149.155])
 by smtp.gmail.com with ESMTPSA id t65sm21273750qkf.119.2020.07.28.04.53.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 04:53:37 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Date: Tue, 28 Jul 2020 07:52:10 -0400
Message-Id: <20200728115210.408486-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200728014343.341303-1-yepeilin.cs@gmail.com>
References: <20200728014343.341303-1-yepeilin.cs@gmail.com>
MIME-Version: 1.0
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: [Linux-kernel-mentees] [PATCH v2] drm/bufs: Prevent kernel-infoleak
	in copy_one_buf()
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

Currently `struct drm_buf_desc` is defined as follows:

struct drm_buf_desc {
	int count;
	int size;
	int low_mark;
	int high_mark;
	enum {
		_DRM_PAGE_ALIGN = 0x01,
		_DRM_AGP_BUFFER = 0x02,
		_DRM_SG_BUFFER = 0x04,
		_DRM_FB_BUFFER = 0x08,
		_DRM_PCI_BUFFER_RO = 0x10
	} flags;
	unsigned long agp_start;
};

copy_one_buf() is potentially copying uninitialized kernel stack memory
to userspace, since the compiler may leave such "holes" (around `.flags`
and `.agp_start` fields) in this statically allocated structure. Prevent
it by initializing `v` with memset().

Cc: stable@vger.kernel.org
Fixes: 5c7640ab6258 ("switch compat_drm_infobufs() to drm_ioctl_kernel()")
Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
Change in v2:
    - Improve commit description. (Suggested by Arnd Bergmann
      <arnd@arndb.de>)

 drivers/gpu/drm/drm_bufs.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
index a0735fbc144b..f99cd4a3f951 100644
--- a/drivers/gpu/drm/drm_bufs.c
+++ b/drivers/gpu/drm/drm_bufs.c
@@ -1349,10 +1349,14 @@ static int copy_one_buf(void *data, int count, struct drm_buf_entry *from)
 {
 	struct drm_buf_info *request = data;
 	struct drm_buf_desc __user *to = &request->list[count];
-	struct drm_buf_desc v = {.count = from->buf_count,
-				 .size = from->buf_size,
-				 .low_mark = from->low_mark,
-				 .high_mark = from->high_mark};
+	struct drm_buf_desc v;
+
+	memset(&v, 0, sizeof(v));
+
+	v.count = from->buf_count;
+	v.size = from->buf_size;
+	v.low_mark = from->low_mark;
+	v.high_mark = from->high_mark;
 
 	if (copy_to_user(to, &v, offsetof(struct drm_buf_desc, flags)))
 		return -EFAULT;
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
