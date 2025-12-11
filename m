Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC042E2665
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 11 Dec 2025 18:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765476676; cv=none; b=obXlxw4P2/ZB19sC9iXTPehFZHUcRrKJ1DiksBRlqLhtgEZgDEIL2QhWI3QeUqKztpDIOla1fgi3zEI1Bo9SKSv0hdbJpzdCc0IUAfDj0kumcxcYWLKTHmFzmgLXdzwgkpMD7AoBi124eTitxx631mo9d9jN+J0J+4iAyFUceqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765476676; c=relaxed/simple;
	bh=DZV1pBUBFyRmC5kjaFqSAxVxhJafuZs9wSJun8rf5Nw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EaOBbXJzBliULn2A1YrUhdiwcq2V7ZBK6BQ6BhLRETAc4utP4Um1hNuGMAYyv0stdhHaoDygT5HCPXGJjBovYOtMe28+F2s1dL52TNFlfBexEB25vBQej0Kw7iB2o4xDjEuW0J2va2BzpqNyjclFbPOVGF5Ci6mLP9U0WvQ+E9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fs+ERp/R; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fs+ERp/R"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b725ead5800so56150066b.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 11 Dec 2025 10:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765476673; x=1766081473; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I0kfe94o6bfYSwLIbCY/05bsAoo/TxMAqJX9Kt5vqfg=;
        b=Fs+ERp/RsHFL06D4FK5Vn79et88y4XqC+Z6B1dylUVFYjUsua8X8aoA4aoti/5m+tJ
         uIObgZQk8xqNvURXa4l1gPLR7eIO31sZG+hz698J+/mjdlcdLbsOYf0cG6OxeJNQBUJq
         JF9zBNToGfnzbC6YeW0vlyOpT/b3NUBAVqMhxMqij2PXmIIMorsol6alNythjgg4JY3+
         IESbvgDg6S2xUPIqjf5q44OcjYYuB+pzoDXYNktYPCbHHxLz5d3x+SHoqwlAgLdzGZtv
         SbNG+7QkLpnIYxxkx2vkxVjpLGY9Vsw+y3LdjClsZagfxzTAioAwLM0UNZAYUWufau3Y
         lOOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765476673; x=1766081473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I0kfe94o6bfYSwLIbCY/05bsAoo/TxMAqJX9Kt5vqfg=;
        b=n3GBUM5GSkMLCDsZ8p/Crzz3x84CJdfUU7Eua3oTnoKrZghp2D8XzRankksv/6Ibta
         sh12LXQNTakHyhuLwJnS0mLyAQmJwRu3mY3OhVGWNapojg/JZPGUpqgwvj4BtEJv/7fN
         t9yZ3FFJ+0bACisVkbjg5p/qahYY39Cjn9BPlxRWhBV2A/rCT+naw5YaN6Hl+Zoh6XWp
         VAnAFdRLZjn1W4XyCaOQgk4r8uHNRMv/qxA8v0HjKOwBBS6wJ+Yqo+KqIj3+NiDgtcTn
         sLKsho0HvEtye3qTV5YouHc9REP7BSRrH6ZXNnfAun4PzUI2l+Aqqk3zdOaU6bDR+yzC
         sygw==
X-Forwarded-Encrypted: i=1; AJvYcCUt8rMcVhre5rQRR1rLZjBNN5scdCsbPkDbaujDtwzE8LYmXE1uij8HA5f4p/imrHkWhWbzYw1e/XsiCmwlP9jFpSoEmw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7pXC/R2gOtnusY3wv0riGb/gb9LmFOG4asOKYkmB69QhGSLip
	jHwoC4dUJLlPm6IcypsjG3RcAk/vX87swYkDMsNUOeIem90xOiZb9p2r
X-Gm-Gg: AY/fxX4XLmZ52Xd5WtwJ2tvrfFJpOel9IL3E5k7Ux6Xoi70Pf3hcjp9csk8gERpDxUH
	UtZUx1+PEOoKswM99PSGQKyDCG0o+wjhajzFSXvhOF27B1NkSLolO+bOxfWnDh0UZonoE7zUxVB
	06rmIsTdYvjlPiyDazX2M1rIJo8CtB8EzP1B33u7FYZWbBqRPEEbSDHnLXJjq2aGkgXdWlRMINo
	Jov/XvZT3EuboWaBevUDtfhBUrM663AySCx59x00avXfLZY58J4N4WgI36VE+x58SjMy/LbBHxP
	UQhp8bedJdPhmT8CLWGK6mIuoDUs0a3LaVbdx+IKqyuoPFG8mQU2PQ0jwogApVgF5Ikl3Zi+qTJ
	/M87q3kawE9a8KmfN0xoEsYQgxftImBah+1xYV/viiZIqHwY1kBLKwvV0qKj4TSy1GPSdYh1mez
	sk3yu/IjENYG64kNzEJZ/EY5wi0gS7xhwoxRZFefU1+6IZjy3gMTHXwMHdzc5OecStt2hNrdS1+
	vQtLeohobKiwFv9ZEoO6aPKi6I6E0MlZXCajF8wkg==
X-Google-Smtp-Source: AGHT+IHHsqhhTL9gS1gTnSlcNNIXMgogTFs1G5FT7mIU7zY0WhRrywOf5Z7p94b6SgJWVcKCORCxxA==
X-Received: by 2002:a17:907:9602:b0:b77:1b05:a081 with SMTP id a640c23a62f3a-b7ce83f09ebmr735650766b.27.1765476672736;
        Thu, 11 Dec 2025 10:11:12 -0800 (PST)
Received: from localhost.localdomain (host194.safe-lock.net. [195.20.212.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa5718dfsm329542766b.54.2025.12.11.10.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 10:11:12 -0800 (PST)
From: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
To: zack.rusin@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	david.hunter.linux@gmail.com,
	skhan@linuxfoundation.org,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Bartlomiej Kubik <kubik.bartlomiej@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/vmwgfx: Fix kernel-doc warnings for vmwgfx_fence
Date: Thu, 11 Dec 2025 19:10:44 +0100
Message-Id: <20251211181044.4098689-1-kubik.bartlomiej@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing descriptions for vmw_event_fence_action_seq_passed.

This fixes the following warnings:
drivers/gpu/drm/vmwgfx/vmwgfx_fence.c:526 function parameter 'f'
	not described in 'vmw_event_fence_action_seq_passed'
drivers/gpu/drm/vmwgfx/vmwgfx_fence.c:526 function parameter 'cb'
	not described in 'vmw_event_fence_action_seq_passed'

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202507040807.jKTxWGVQ-lkp@intel.com/

Signed-off-by: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
index 00be92da5509..85795082fef9 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
@@ -515,12 +515,12 @@ int vmw_fence_obj_unref_ioctl(struct drm_device *dev, void *data,
 /**
  * vmw_event_fence_action_seq_passed
  *
- * @action: The struct vmw_fence_action embedded in a struct
- * vmw_event_fence_action.
+ * @f: The struct dma_fence which provides timestamp for the action event
+ * @cb: The struct dma_fence_cb callback for the action event.
  *
- * This function is called when the seqno of the fence where @action is
- * attached has passed. It queues the event on the submitter's event list.
- * This function is always called from atomic context.
+ * This function is called when the seqno of the fence has passed
+ * and it is always called from atomic context.
+ * It queues the event on the submitter's event list.
  */
 static void vmw_event_fence_action_seq_passed(struct dma_fence *f,
 					      struct dma_fence_cb *cb)
--
2.39.5

