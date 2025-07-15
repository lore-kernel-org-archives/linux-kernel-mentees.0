Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B1A26D4F2
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 15 Jul 2025 08:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752567132; cv=none; b=KlyTAJECZ9UzVsr4tnuyhNz3l6bqDXpjEyx8kHppoxHJjav902dCV3RZAGLWEEd72YtaE9fj0Hj63DgXFQYReNshvVTaXfj1PhcA5P1K1phWEFP/zTnVsqD3Ejrl1IeABnp0joPx7qrx4sMQsTybKz+GgqBvFf6dT4QJkwIKLaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752567132; c=relaxed/simple;
	bh=A42hZ1CXXzEmtAuN3Oh4U+HhEO00ifH9+iMTus1OfLM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IUxfrtm2TGGH1LovzJ+CrtgoXZMuh75tZa+uH3V5daiLALSha8cWlGzNWQawCZaDgxZ/3BiidVvuZr++DsTcOiPpvYo8KAZbcphARk3drjr8xIdHa1J95GZuPtRm4owz/sgTK8Pg4LtD/ZWCYHkIu4T8YQ0g6V4ceq0E7WveZPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LL7ma92J; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LL7ma92J"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3135f3511bcso4289562a91.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 15 Jul 2025 01:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752567131; x=1753171931; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J9cZzIxfvxK1Q11zfJm7mjrfAiqzGoJPBeFUMFwlPyY=;
        b=LL7ma92JuXILfU+H/LIc0VTGRrdxj2iGCn4X8toaOJ5PwDT96QiqerKeOjZBg6y8q/
         Xb1lPGo/tsJEjmz5NYrEWndtZN1n4Utfi/OXZH3dxWVJTWWuQSk0oDnGi5yBR1bJIUHa
         KAya4AYO1Otj1xgOzCAgW+u2SCHubOLssQHeDclnGvM4qFg6pIN/ZHdNonRjTPSkrvXk
         VNS487XtVx7zjLACS1OMNUyKyJXBOoBADiBNQ+qL2kr80K4gOzSVwb56iB42DPL476d7
         hlS7mL67BNE5ydyXrGfUOp0a9vQeCu8IDVllodbVrpWmdWb+H5jGqKNa5/FKppk24gWy
         aTXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752567131; x=1753171931;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J9cZzIxfvxK1Q11zfJm7mjrfAiqzGoJPBeFUMFwlPyY=;
        b=mn6xsV5tSL86E9mcQCchlz7sl3bU2bW/dd+nMMsnt4s3yX0g3bz+IzvWfQ6vlzjZgA
         uZ6zDepxDYYWXBqIzL9u0t4jdYClAvAYnaSDbHFT7F3+EKs66tZiZi79Z2Iqw5T9IZl/
         /pBSWcwHUpnrZrivu8SrxXICs1HmDXCKQHDHc+5+YLZ5eBy9qURlzTbz+saS184WO3ty
         43zu2fDhBwFJdHfAiTn+fT1JD0RpikpFXja069kpzXeJWh7J/rEwBn0St5fC1P7bK86K
         F8QCHkzN7EfxwF7G5z/1KP32rFc8Y87t4jVknG5ZSkdAX85AMSnzB8yLs7FHWQDin7km
         JGpA==
X-Forwarded-Encrypted: i=1; AJvYcCXvd6f7MoXyHOeGf3w3g6z3YjkvzJ1KR4m19U2VkfiaOocMR0+dxA5klL2Efcbx6suJ+1L9mR98jHCr1/4TaemLb2WPIA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzEggKf/rcGybVoWhqzybMsQHhpxfwm4LBlnEd1imqzgmCaX9m2
	OkSx4QSptZkUVXlXclouDMq5u/uON9QqDVc8buxAIKAyVU4eklshH5Ca
X-Gm-Gg: ASbGnctpuFw0s0fYoKTt04CpPxDPfFy08T9Sa9wafN6lzsfPwSV24qHeJ8EmpvZgTqV
	aB6dZmu1Pe/J03fyFDCGhfPy5ZgEFkV1d1lLC3h7b95zLmxYM/kbY847088mIsF2OgGMmG+c3gb
	0dHJSwR6v803miysdoAnCcEe5PwBpBaU+1xFIbdmP1zyuXAm6wV/e4mVa1iQTgqxJKSxxQmkl6I
	7JMw/J4pVB5PZpzP0Sqf1Vy3356fr4+asVsAsWEZJT67Gig2z4vm4Gioj1ZiNCrXJs46cb5ii1h
	M3hTLQjbAyRWbx6CL98jTp8wgQIbVYDWzPUgRmLLXknwmSOQh/4a+iZhONBkLLEjlR2pJ8ISVY/
	UBGUEPakvI4Hf/qV932vtes5ZmqCsOK4s8MdNMJFU/Gk=
X-Google-Smtp-Source: AGHT+IFs5trgbTAyKft18DYDReY5ltyl88fzCm7ptR0K9hii4EwznJNonE1VzgHtlmmcLfwXRMVL9g==
X-Received: by 2002:a17:90b:3b90:b0:312:25dd:1c99 with SMTP id 98e67ed59e1d1-31c4ccd99d8mr25949761a91.19.1752567130634;
        Tue, 15 Jul 2025 01:12:10 -0700 (PDT)
Received: from manjaro.domain.name ([2401:4900:1c68:e0ce:6703:6e3f:3a79:d2e6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c3017ca4csm14236712a91.31.2025.07.15.01.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 01:12:10 -0700 (PDT)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: john.fastabend@gmail.com,
	jakub@cloudflare.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	ast@kernel.org,
	cong.wang@bytedance.com,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Pranav Tyagi <pranav.tyagi03@gmail.com>,
	syzbot+b18872ea9631b5dcef3b@syzkaller.appspotmail.com
Subject: [PATCH] net: skmsg: fix NULL pointer dereference in sk_msg_recvmsg()
Date: Tue, 15 Jul 2025 13:41:58 +0530
Message-ID: <20250715081158.7651-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A NULL page from sg_page() in sk_msg_recvmsg() can reach
__kmap_local_page_prot() and crash the kernel. Add a check for the page
before calling copy_page_to_iter() and fail early with -EFAULT to
prevent the crash.

Reported-by: syzbot+b18872ea9631b5dcef3b@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b18872ea9631b5dcef3b
Fixes: 2bc793e3272a ("skmsg: Extract __tcp_bpf_recvmsg() and tcp_bpf_wait_data()")
Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
---
 net/core/skmsg.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/core/skmsg.c b/net/core/skmsg.c
index 4d75ef9d24bf..f5367356a483 100644
--- a/net/core/skmsg.c
+++ b/net/core/skmsg.c
@@ -432,6 +432,10 @@ int sk_msg_recvmsg(struct sock *sk, struct sk_psock *psock, struct msghdr *msg,
 			sge = sk_msg_elem(msg_rx, i);
 			copy = sge->length;
 			page = sg_page(sge);
+			if (!page) {
+				copied = copied ? copied : -EFAULT;
+				goto out;
+			}
 			if (copied + copy > len)
 				copy = len - copied;
 			copy = copy_page_to_iter(page, sge->offset, copy, iter);
-- 
2.49.0

