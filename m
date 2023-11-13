Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3381722F11
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Nov 2023 18:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LL4nrpH0"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B60A8236D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Nov 2023 18:37:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B60A8236D
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LL4nrpH0
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4qVyQsVGdHj6
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Mon, 13 Nov 2023 18:37:52 +0000 (UTC)
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E4A318236C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Nov 2023 18:37:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4A318236C
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-5be09107145so310938a12.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Nov 2023 10:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699900671; x=1700505471; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2mtmd09hFYXnVdRkrFU6g3p7HtLLyzcUAB+w/A7AON4=;
        b=LL4nrpH0SrsYSHJx1VAvzzMEI1rpJnFNdCTiy1kV7RUM2PuuWujehYanXi6i6KeISd
         zCPQVpvtXkm+gWAwPQ1Js6zGWWvyADFhjN79lBwIIp39oUncxjBVq9WY/k4xLVssD1Je
         wcWJRlhCvIOznvm3a9uBUJqDeFQXI6BLVjmEiwq0Lp8VcxpHgdsppl5HLXw1vwY5wa5i
         1xCpF5M7oZOOziuXMpcVTjsr8C2wLZfAQUD4dd4jjP1VdGsTybifn6BkQroC17XVRQTr
         3rLa7mNhdPQ5Omc8+YkO7SkkYNO9ReyZRJre6ShldSplGP2r857RLjb51ia1zdDBdZ0E
         IomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699900671; x=1700505471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2mtmd09hFYXnVdRkrFU6g3p7HtLLyzcUAB+w/A7AON4=;
        b=sqL6Y7L5TGU7PW21p1TPEtO5DNxdslV8b2ZlrnkAmuOZcidJ2T6mirNQUqSu1Rmsr/
         GY3vnt58LPdr9ajchqWAAm9F20fbUxPCHAN9WBIIAHrOQzpcyzQH+nnM9ceoAFJt2GFL
         eBZYlbK/U8IPNK38iuG4hoCd9rYDsptsiv2udGeq9MBeDLxfRuxaEjFRP6+8zB9OiffZ
         RchfU/KfjAB8/QgF1jhKLp0Ry/LUz/fRmkbS+t477gUhe2XjlQPi9gq7BRt6BX64fUIK
         ITRuspC4FKr2TIAYZ/hdib6eYbj5CypifITyfM02HMzBKR4oT/p3KxZ6QDPfSlM6AtGQ
         HGEQ==
X-Gm-Message-State: AOJu0Yz5Ncgi8zaiKeOTwqSdTOzAdwQAQmlPuuE9kTV82e1QKXToIwrM
	0alc9dtlxF2aLQpVtAaQs40=
X-Google-Smtp-Source: AGHT+IF8WqLZR69KCm/civDjgFUbwk1ZPnhnTXEboXMHqRlLQMHKjR9oiG6PqIPphLBYkQjDkLbheg==
X-Received: by 2002:a05:6a21:9981:b0:17a:d292:25d1 with SMTP id ve1-20020a056a21998100b0017ad29225d1mr93125pzb.6.1699900671212;
        Mon, 13 Nov 2023 10:37:51 -0800 (PST)
Received: from abhinav.. ([103.75.161.208])
        by smtp.gmail.com with ESMTPSA id e13-20020a056a001a8d00b006b8ffc49ba5sm4058507pfv.38.2023.11.13.10.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 10:37:50 -0800 (PST)
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
Subject: [PATCH v2] drivers: gpu: Fixing warning directly dereferencing a rcu pointer v2
Date: Tue, 14 Nov 2023 00:07:37 +0530
Message-Id: <20231113183737.3276419-1-singhabhinav9051571833@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <d33fc41b-5a1f-4186-a0b2-3c82dcb8f00b@redhat.com>
References: <d33fc41b-5a1f-4186-a0b2-3c82dcb8f00b@redhat.com>
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
v1 -> v2 : Replaced the rcu_dereference(...) with unrcu_pointer(...) and
also removed the rcu locking and unlocking function call.

 drivers/gpu/drm/nouveau/nv04_fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nv04_fence.c b/drivers/gpu/drm/nouveau/nv04_fence.c
index 5b71a5a5cd85..cdbc75e3d1f6 100644
--- a/drivers/gpu/drm/nouveau/nv04_fence.c
+++ b/drivers/gpu/drm/nouveau/nv04_fence.c
@@ -39,7 +39,7 @@ struct nv04_fence_priv {
 static int
 nv04_fence_emit(struct nouveau_fence *fence)
 {
-	struct nvif_push *push = fence->channel->chan.push;
+	struct nvif_push *push = unrcu_pointer(fence->channel)->chan.push;
 	int ret = PUSH_WAIT(push, 2);
 	if (ret == 0) {
 		PUSH_NVSQ(push, NV_SW, 0x0150, fence->base.seqno);
-- 
2.39.2

