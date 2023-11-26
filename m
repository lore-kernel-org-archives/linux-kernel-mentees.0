Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E0315C0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 26 Nov 2023 14:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tq0YVpTn"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67951404BF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 26 Nov 2023 14:57:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67951404BF
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Tq0YVpTn
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lJyr0BkHNmKD
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sun, 26 Nov 2023 14:57:37 +0000 (UTC)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B9B3B4035D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 26 Nov 2023 14:57:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9B3B4035D
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1cfa7be5650so4568575ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 26 Nov 2023 06:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701010657; x=1701615457; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ds6jz8XiqF0ADftYJN+hp07WDKExgCoZRBZ98zeNhK8=;
        b=Tq0YVpTn9HRRXuBQbsIkxrsM0iBwGaZlXlHQUghbZQ5gEKK0oQ0povakVo4mtxGtlq
         6pTdhV40QP+78M+GF62EQ8K3WaE9KP0G+NTsNZ9Sg0XkULDuzThCPCn/oeo1fJ7+gPl7
         N+5mgEqVLyZQD6o+B4f6eRpZHuHsMW+vHsEuhvT11B7zysFg9qG8R9DsK9Hsq432afAn
         hF+vAyAN7FTMG5tK6g8KjtxaweYzX8/b2fu+3SIDFExEJcHHgNmTGMe1HyVI5ZFC7HDw
         UCF9MTr+Syu50ygP8N84FB1B6zJaCxm9UGSJC5J98MS2mYLDwUYAOWMW7njWBjjVLrll
         XfbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701010657; x=1701615457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ds6jz8XiqF0ADftYJN+hp07WDKExgCoZRBZ98zeNhK8=;
        b=aWCFTmvjjfyS6auusghB5kjzcc2JpTd61wvVTFsN5pFYl8hs53jx+qMiLgy5aep19s
         qB+Mr5b7yxcyCMJQoe+BeFMzoCX4ofQ9U/6eOD+Z+WHy3tP0HrwBNv1NJ/8NYzeyTRwM
         6KsewzvN9t0z3I1v+iE8pVM0JaM4milULc3014SY5IFxPTWpZhwhVKsJpATZtuanzShp
         wUAwhUq3ly0+Lo/MV7wm8VU74EkQXaWw0cHdC3hydhDM7+bq9onwG4tUhFMS3GUzkuR+
         WXO1FKBrRAWPWk7q/UodZ1rG7gH/8Xx2BDsYZJvXhMAyVvVupJ3Va/l3SxhUVtvOMlVQ
         A2Kw==
X-Gm-Message-State: AOJu0YzDX7Oc82l8+omfBSySwOmW7S7Nx8Pt+tDPyCPkjdwBZ58tSZcb
	27eORkHkAZEsa4Kad9+5dZc=
X-Google-Smtp-Source: AGHT+IHfTmf4escnImpLTzKE4gnb2lDqdXKrQ5LQmUVS/atAbTu2PTrA6K046ATTWXWsoyAbE4pjZQ==
X-Received: by 2002:a17:903:183:b0:1ce:5b6e:bae1 with SMTP id z3-20020a170903018300b001ce5b6ebae1mr10929057plg.3.1701010657137;
        Sun, 26 Nov 2023 06:57:37 -0800 (PST)
Received: from abhinav.. ([103.75.161.210])
        by smtp.gmail.com with ESMTPSA id t8-20020a170902bc4800b001cc131c65besm6470070plz.168.2023.11.26.06.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 06:57:36 -0800 (PST)
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
To: kherbst@redhat.com,
	lyude@redhat.com,
	dakr@redhat.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Abhinav Singh <singhabhinav9051571833@gmail.com>
Subject: [PATCH] driver: gpu: Fix warning directly dereferencing a rcu pointer
Date: Sun, 26 Nov 2023 20:27:23 +0530
Message-Id: <20231126145723.388162-1-singhabhinav9051571833@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a sparse warning with this message
"warning:dereference of noderef expression". In this context it means we
are dereferencing a __rcu tagged pointer directly.

We should not be directly dereferencing a rcu pointer. To get a normal
(non __rcu tagged pointer) from a __rcu tagged pointer we are using the
function unrcu_pointer(...). The non __rcu tagged pointer then can be
dereferenced just like a normal pointer.

I tested with qemu with this command 
qemu-system-x86_64 \
	-m 2G \
	-smp 2 \
	-kernel bzImage \
	-append "console=ttyS0 root=/dev/sda earlyprintk=serial net.ifnames=0" \
	-drive file=bullseye.img,format=raw \
	-net user,host=10.0.2.10,hostfwd=tcp:127.0.0.1:10021-:22 \
	-net nic,model=e1000 \
	-enable-kvm \
	-nographic \
	-pidfile vm.pid \
	2>&1 | tee vm.log
with lockdep enabled.

Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
---
 drivers/gpu/drm/nouveau/nv10_fence.c | 2 +-
 drivers/gpu/drm/nouveau/nv84_fence.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv10_fence.c b/drivers/gpu/drm/nouveau/nv10_fence.c
index c6a0db5b9e21..845b64c079ed 100644
--- a/drivers/gpu/drm/nouveau/nv10_fence.c
+++ b/drivers/gpu/drm/nouveau/nv10_fence.c
@@ -32,7 +32,7 @@
 int
 nv10_fence_emit(struct nouveau_fence *fence)
 {
-	struct nvif_push *push = fence->channel->chan.push;
+	struct nvif_push *push = unrcu_pointer(fence->channel)->chan.push;
 	int ret = PUSH_WAIT(push, 2);
 	if (ret == 0) {
 		PUSH_MTHD(push, NV06E, SET_REFERENCE, fence->base.seqno);
diff --git a/drivers/gpu/drm/nouveau/nv84_fence.c b/drivers/gpu/drm/nouveau/nv84_fence.c
index 812b8c62eeba..d42e72e23dec 100644
--- a/drivers/gpu/drm/nouveau/nv84_fence.c
+++ b/drivers/gpu/drm/nouveau/nv84_fence.c
@@ -85,7 +85,7 @@ nv84_fence_chid(struct nouveau_channel *chan)
 static int
 nv84_fence_emit(struct nouveau_fence *fence)
 {
-	struct nouveau_channel *chan = fence->channel;
+	struct nouveau_channel *chan = unrcu_pointer(fence->channel);
 	struct nv84_fence_chan *fctx = chan->fence;
 	u64 addr = fctx->vma->addr + nv84_fence_chid(chan) * 16;
 
-- 
2.39.2

