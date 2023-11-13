Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F4E22F10
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Nov 2023 19:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KsvMkGGA"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B46641907
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Nov 2023 19:13:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B46641907
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KsvMkGGA
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R1zqUZe6qP2Q
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Mon, 13 Nov 2023 19:13:16 +0000 (UTC)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 6407E41904
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Nov 2023 19:13:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6407E41904
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6c48fad2f6dso763209b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Nov 2023 11:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699902796; x=1700507596; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RWzM5KKSUg5Npbg8tYin1ALDkNDOd2uQV93DTqS6tZE=;
        b=KsvMkGGAc5g8aEUtu5t1elrXy39txCRfkvT4keKFM2FXiOH4MWDEO5gEKmoIJ9yYUm
         DfkGXGePsFPTYnBiogqE/Bwf450vvn1g1O7Ug5KdX/yNJ5cXmMsi8gPKNGmXDtGns/+o
         45QEGqTk9e7UiuZConVc2huivwX2/WggU/IqJfW8/eVD14ChE2C0k+n9dlkC6BgYSNmF
         Fe1uJQgwd8ZxfyIqE1EdAqa5hBG6vzxCrSZ1MU73ZT1vxDgLV4njEWemUJ0DheFnI2/E
         BXpgJD9iPiEtdVpumlmNU35yzoVZda/oirdacf8bhVIqsB+wRBG7LzgPQ+xe2vnTO3qc
         r2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699902796; x=1700507596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RWzM5KKSUg5Npbg8tYin1ALDkNDOd2uQV93DTqS6tZE=;
        b=hYqVpllcofUlMdrsD4jff+3NdV7L4cZ/rwZ2IkO2dma312b5hHg97k1B8b2wqKouAq
         MQsjztGWw77xrRe6Y3MVsShPA4QJT2eRCJvC9DwxnPt6+aKt6/q9RJCaD+/YuEk48fJu
         +A3KV4HGCyFRrwaOx5CXhlfq2PM0qyiae5A35jAWWDWOHdP3L0qpQHT1We5Ek9+l9FeI
         +UC89pCE2I6GhrjqU1ohAVfaTZD4StyC4LMxoDcxEp7m42KhKyDmsWmfkgxcLettCijZ
         KGQ2q4dJqNezZKmL6IJdvUU61uLt2saKa9PcBwdzBxfuyJGG3hEhYNH1uW8miSbOvoF3
         LErg==
X-Gm-Message-State: AOJu0YyNKtS5Azf3FoFjJnm0fz5nwbCYvlqdkl9vK8RpSmzGNXD01yVE
	lXKocsCiiv7LabGTYUH26vs=
X-Google-Smtp-Source: AGHT+IEx1swZIOzZT6VBDGY9Puczke/bXdMZexkyE1GF8rGgfqO39gQjfSRzd05QzUXTWo6YurNhYA==
X-Received: by 2002:a05:6a00:6506:b0:68f:c8b3:3077 with SMTP id hc6-20020a056a00650600b0068fc8b33077mr8267101pfb.1.1699902795624;
        Mon, 13 Nov 2023 11:13:15 -0800 (PST)
Received: from abhinav.. ([103.75.161.208])
        by smtp.gmail.com with ESMTPSA id u25-20020aa78399000000b006bdb0f011e2sm4085071pfm.123.2023.11.13.11.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 11:13:15 -0800 (PST)
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
Subject: [PATCH v3] driver: gpu: Fixing warning directly dereferencing a rcu pointer
Date: Tue, 14 Nov 2023 00:43:03 +0530
Message-Id: <20231113191303.3277733-1-singhabhinav9051571833@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <8e9efe54-2799-4539-a8b0-aa199f8052f6@redhat.com>
References: <8e9efe54-2799-4539-a8b0-aa199f8052f6@redhat.com>
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
v1 -> v2 : Replaced the rcu_dereference(...) with unrcu_pointer(...) and
           also removed the rcu locking and unlocking function call.
v2 -> v3 : Changed the description of the patch to match it with the actual
	   implementation.

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

