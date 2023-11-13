Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EDE15ACF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Nov 2023 08:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kGHxxPsD"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B6D14159D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Nov 2023 08:10:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B6D14159D
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kGHxxPsD
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0avXycXlF0gq
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Mon, 13 Nov 2023 08:10:55 +0000 (UTC)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D88164159C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Nov 2023 08:10:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D88164159C
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6bb744262caso923210b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Nov 2023 00:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699863054; x=1700467854; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DDB5Cfhe2/Np2buAc13fG3d5R3/QsQEtB/l9Kg+8Kto=;
        b=kGHxxPsDsIAjHlDTgyuIEEU4KrWNteRa6YmvvAa9mQ35hYwMQ+CZ2LPYtKDp4J2i+C
         pBDEuFYDvLks5+nSauPhbTfC/EdqVxdnMScAQFf+WDBcoFs/S37hn/sTQTo9QRdyoB70
         0SiSoIOwJ6Pj/aJLzYzlqnBwkfEt7ADzuKsvpHBurPS4ZS3I7b3VV0pA9XHonqUqq7gp
         Mj6T4UxNDYkE+w+azVaofM+GkOTy2m72Pu1JSATk2gQEH6xRF6jrzwNVUf8lq0hFrwWQ
         Ji2QgpF6SUiE1VwTdBsj07MY+Fz9jUBVbUAqRVF83xeUBoao38IUdxgRPAUntysiFCqb
         v3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699863054; x=1700467854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DDB5Cfhe2/Np2buAc13fG3d5R3/QsQEtB/l9Kg+8Kto=;
        b=kSILsdBil09e1K24BCi3KgOhrcMTMtAN1/fkr6RITumD+jU8RaOM2PtKxNARN2D4Tp
         xlrrk95mvXMvObAhXHTyoHVjQDyqco1sDbcGEwRQGvRpCO6k9hWwMMjHWjIkc7EHA3B2
         anYf3quivVaGW/s7+ne9ywcHv6KHjfX4wxC8qDZ2Aw6D/LD451pgOHugdSKxYO3Wyhil
         fEfoS5spt0EIzyqZQvRk+pliWjowaxba4C77BrWjbGMMiBaxDV+VHO7q/9rzXGUhT8J2
         7y+OPn2COLk8C6NAQRSSkLvJM9VuKfGauCP+HxHiVQm7QyADI7HQhStEOz2KoK1ad28A
         JT9Q==
X-Gm-Message-State: AOJu0YxM1sQnMmL/lsR4Y72lkLR1PTojERCinQLj2paGNS3XRz5CsSdd
	SpwjZRiWDQoJ+mhOpo2hnRg=
X-Google-Smtp-Source: AGHT+IErgwyh6IU6A+XEPWZwt7rqHwWnNiCEmJoA9K52qeb/PCG71hHkTbQiGJ2i3IckahwFnygwlw==
X-Received: by 2002:a05:6a21:9995:b0:186:10ae:152a with SMTP id ve21-20020a056a21999500b0018610ae152amr7949073pzb.4.1699863054195;
        Mon, 13 Nov 2023 00:10:54 -0800 (PST)
Received: from abhinav.. ([103.75.161.210])
        by smtp.gmail.com with ESMTPSA id 22-20020a17090a01d600b0027d0a60b9c9sm5793629pjd.28.2023.11.13.00.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 00:10:53 -0800 (PST)
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
To: kherbst@redhat.com,
	lyude@redhat.com,
	dakr@redhat.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Abhinav Singh <singhabhinav9051571833@gmail.com>
Subject: [PATCH] driver: gpu: Fixing warning directly dereferencing a rcu pointer
Date: Mon, 13 Nov 2023 13:40:40 +0530
Message-Id: <20231113081040.2947143-1-singhabhinav9051571833@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes a sparse warning with this message 
"warning:dereference of noderef expression". In this context it means we
are dereferencing a __rcu tagged pointer directly.

We should not be directly dereferencing a rcu pointer, rather we should
be using rcu helper function rcu_dereferece() inside rcu read critical
section to get a normal pointer which can be dereferenced.

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
 drivers/gpu/drm/nouveau/nv04_fence.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nv04_fence.c b/drivers/gpu/drm/nouveau/nv04_fence.c
index 5b71a5a5cd85..e62bad1ac720 100644
--- a/drivers/gpu/drm/nouveau/nv04_fence.c
+++ b/drivers/gpu/drm/nouveau/nv04_fence.c
@@ -39,7 +39,9 @@ struct nv04_fence_priv {
 static int
 nv04_fence_emit(struct nouveau_fence *fence)
 {
-	struct nvif_push *push = fence->channel->chan.push;
+	rcu_read_lock();
+	struct nvif_push *push = rcu_dereference(fence->channel)->chan.push;
+	rcu_read_unlock();
 	int ret = PUSH_WAIT(push, 2);
 	if (ret == 0) {
 		PUSH_NVSQ(push, NV_SW, 0x0150, fence->base.seqno);
-- 
2.39.2

