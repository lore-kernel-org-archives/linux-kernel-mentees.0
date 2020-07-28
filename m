Return-Path: <SRS0=RTaY=BH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4044C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 01:45:34 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA8E220672
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 01:45:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qPuGtMvX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA8E220672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 78CC78841F;
	Tue, 28 Jul 2020 01:45:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aZUvQaMVWEl3; Tue, 28 Jul 2020 01:45:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 085D0881E9;
	Tue, 28 Jul 2020 01:45:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EFC48C0050;
	Tue, 28 Jul 2020 01:45:33 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6EC40C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 01:45:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5879322843
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 01:45:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F8nZ0KDuoV0H
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 01:45:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 5646A22782
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 01:45:32 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id d14so17261273qke.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 18:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YjnA1D1K7ElpFXMn7MlHX1aExmoTvW00G3z3st5LogM=;
 b=qPuGtMvXjFKTqPMP4hVzimuIwTZQ1FlTw4vqUKaNSKU99KqaO6Im988hL6y6XkP5V2
 qVOFVZeATU9MV0hSUENBapGZ7GLtyN/Zblmf/4fCo1UH9ehlDGFpi9aqTjRKGiQ6zRBU
 ZnBAzkC5VY3aa0sUUqOhdrf+7j42xFbvu//GIiSzF9TiQsOp/yfcYIX1oGvGIKFyxM9S
 k6HkJu8JFS6URc1k9uYTJoCOa4PJ5UY0inf+26gI6iMl69ihRgNzPEzBeVcRFFJQcV9I
 jbLBMpuzcqx06gqVV3mMyG3T5p5MGCTM/NG7cd9z8NytqeSC9Ht4zrrYiKX3jZsT64Y/
 p3Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YjnA1D1K7ElpFXMn7MlHX1aExmoTvW00G3z3st5LogM=;
 b=gBqblwikV260QfdJbboiIYzvZgRk3X9G0sQAYug/WMN9h8r3y0pTd4om+J8FZwwv6j
 5Z1K8YgZhGn8KrFAvBqnJxy4fTD9snIgZ/LzhU5LKEkZGKacedDZlmk1r9bmNmR4GahU
 lb/VrSRGRVERmvyUSCoyT52hoeuWoP1pCo+azC2GKMxgZrxJuQTLhEHuB55VzyuJhyW8
 u9I0eSEUBElj4fEIqotjerqQf88zfw2dZkQtqOffAeC5oSFGFRGOFwAHxb/4/i5vx6Ps
 g7sXOJ1Lzw+6ExGEm2RmVjaWahrZExaIuVjtmY+mD0vTnoEydNtpeqJsnIACY32sa7a9
 0G6A==
X-Gm-Message-State: AOAM532x7Frft2mNCBcZn5cMtAiX1/8KWBpl158aW7tGFXysUojvJBf9
 rK8K/wJp1DsFIpbaByI+aw==
X-Google-Smtp-Source: ABdhPJxbAIs557upvT1yY+aGvvScvjxCli+NZkmPpkJ7H5akQf1y/Q9yw/gGLnLoqu78WGuR11jD5A==
X-Received: by 2002:a05:620a:553:: with SMTP id
 o19mr24583291qko.46.1595900731268; 
 Mon, 27 Jul 2020 18:45:31 -0700 (PDT)
Received: from localhost.localdomain (c-76-119-149-155.hsd1.ma.comcast.net.
 [76.119.149.155])
 by smtp.gmail.com with ESMTPSA id d14sm16585473qti.41.2020.07.27.18.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 18:45:30 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Date: Mon, 27 Jul 2020 21:43:43 -0400
Message-Id: <20200728014343.341303-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: [Linux-kernel-mentees] [PATCH] drm/bufs: Prevent kernel-infoleak in
	copy_one_buf()
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

copy_one_buf() is copying uninitialized stack memory to userspace due to
the compiler not initializing holes in statically allocated structures.
Fix it by initializing `v` with memset().

Cc: stable@vger.kernel.org
Fixes: 5c7640ab6258 ("switch compat_drm_infobufs() to drm_ioctl_kernel()")
Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
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
