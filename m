Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E071173E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Nov 2023 18:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KSnwogi+"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB42A81F6F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Nov 2023 18:42:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB42A81F6F
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KSnwogi+
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7ziKYy2QCmjD
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Mon, 13 Nov 2023 18:42:57 +0000 (UTC)
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2C22281F6E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Nov 2023 18:42:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C22281F6E
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-6d2f002862cso181175a34.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Nov 2023 10:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699900976; x=1700505776; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2mtmd09hFYXnVdRkrFU6g3p7HtLLyzcUAB+w/A7AON4=;
        b=KSnwogi+FfasDe5tSdfq25pUuCkNcpUSXNbFZ9nYt8H7NVRGubEy8+QDWHRc42y76A
         tqUQn3sNRtIoogWpeBOetjT2+0ucc/BHeqHAA4RTURRpaAg1GXuk9fbzpMLZzlRB2wd4
         QCvCaoErn7RjoutRoLTJNHa617pqpACt4uTdmV9/tpIoOLRX7PCkjJdo0+AClLtPViqb
         1H7RLpuWEO4N3V+NtqfOnasBpCtDs5PJkAu90vbErHMjNZ6Pc8q7hI38K2GudUGvJzKw
         iBCcavZj0Ef6ejKvMbK6GDrh/OfGTDFI6OouvULgrPWNt9+PYv1W/oAJOD+GQEnEJ2gy
         MLMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699900976; x=1700505776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2mtmd09hFYXnVdRkrFU6g3p7HtLLyzcUAB+w/A7AON4=;
        b=qgZnJDBZgSYvvPwOo5FlXtcbsoA04DWgTrZaoPw92lz5UImA9dyK86NquBWln7hBFM
         g6n2AmVrmn6lKctNNWPpRigk5c3Dm9P3Ta8VMlMrDxQN6jHPLQN2cefEaaxLuXo3yTDY
         KHbR7peuwYTVwjM6TmS1MgU2+QoyJ7dQS1JdUexhU4h3EVD46GxnKGlDDkGuJKQd5tqN
         X3+OjR8ujQTOCrD9WKj+2bXHRPokRtaiFlt0vLYHHnVqlfszvEEzBWPj9LArtl99W0hM
         cpYokz3piGP8Uzlf98Qg3aGQKUlTOcEcVgnG7AqiuDz9rD1aN0zFOW/TjRJkzZ/b/Ucd
         fCCw==
X-Gm-Message-State: AOJu0Ywh7R80Dfk6uJz48FzS/gGrHz+7ih/5JBhlbb2Xy3bSFMdwtolj
	8sETSzyymb4lY07obEOI/Ps=
X-Google-Smtp-Source: AGHT+IEA1BUXt8w/1R9eTTYLZmyMjGnY+Z6vq6aMaSD2YdSx84htQATbTZVVwb3NbeXa3fdeWUhkBg==
X-Received: by 2002:a05:6830:462a:b0:6b9:d3bd:3985 with SMTP id ba42-20020a056830462a00b006b9d3bd3985mr6976344otb.1.1699900975849;
        Mon, 13 Nov 2023 10:42:55 -0800 (PST)
Received: from abhinav.. ([103.75.161.208])
        by smtp.gmail.com with ESMTPSA id 16-20020a630b10000000b005bd627c05c3sm4256693pgl.19.2023.11.13.10.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 10:42:55 -0800 (PST)
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
Subject: [PATCH v2] driver: gpu: Fixing warning directly dereferencing a rcu pointer
Date: Tue, 14 Nov 2023 00:12:38 +0530
Message-Id: <20231113184238.3276835-1-singhabhinav9051571833@gmail.com>
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

