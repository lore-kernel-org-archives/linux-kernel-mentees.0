Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AAD1E5B70
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 21 Sep 2025 02:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758421660; cv=none; b=EZX2hcaco3VvtK8u42YGaB/g6wsZLYH2KMsj2y6NOCjr/gNN7DY+vzVtAeYOLwmGm3cPK46/k54Y39DgLChZZSbOH4+ONscaj+Xje6lzv7vVq1RnpFuUpkerEfsGy/cM/na4jpa3m9AkMtQpMm3pAFwVRqrD+XZ5dLCFqjLY9/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758421660; c=relaxed/simple;
	bh=bKqbRm7uliKj0cw6LivI1hJQpLFbhELQ9JH5kKq/xwo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t8bwqPjNDaTvs4N7FF6ijMbFQLp14N8/IQ9VMsrv3i8RK46vE0Oo+SjqgEzlvv5gZGr1KjfnaQbo6GCQVkqBtbBIVpaz2/HLhNvhwRlEmVJMMasaTJBc0cwko0AHjWqV7hl97zXHrAWGl3Fr0Ilb9LsCFWwsuX21i+ouQosLdfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YyvGCPkm; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YyvGCPkm"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b0787fa12e2so476618966b.2
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 20 Sep 2025 19:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758421656; x=1759026456; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rP56KXKGrYKQHSd4lR6UJmMGSUbVk/cXV4sww30Y9W4=;
        b=YyvGCPkmgY1/Pya+iVXPQvCB7p411QFrxd7cEE/lpluqtEz6KzQjaaDfwOYccvW5aR
         ma1Au1aKEB8aL1xcXEJ0GWmHDODkUFOaRXdVFD3V4DxD0e43zI9+f1W7coHZq0Q+C/wc
         1w/AjILVdeq3Wp92tv2ZwGRqsMGfrUuqaKGZcyDIrNYDYJTQhaeYTZOfICdsHQYDTQI3
         LQs1LB5cdBespAw15ZWn8Y+cmp7KhQcnRWDk5nuxOJreBIQBQKjhHH6v08PM9b1wVgBb
         0MDbSqKnay/ZnxmgF+0rwIpgcceo/YFLCqbOObTl0hHKkyNBULj3VvIFpc0zdyNo1Lhx
         EZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758421656; x=1759026456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rP56KXKGrYKQHSd4lR6UJmMGSUbVk/cXV4sww30Y9W4=;
        b=P2FQH4YnCTV5rNtKuXSyJ02Yho8lonM/AyXyVL8utn3bqdD1A4IkThqBVX7IGx7IrI
         w0xuEV+hwVGu4WwCTe1V91VwN19BgHTPyFtPrDNoZdiNj7s62bcoHJZ0R9Bi7oK4EQnx
         o+dGlZlvdguoVKvjUFUSxCaVVgylh7c6Rvoz42O24oRHEBhnoQFGl8P5Gj+Tu/ngRxU5
         sSqrTOQjGNduzZWZHgi5K9ZgvbdeGitzIoWkHtJ5ybyjbNSKRPgXL5IbP9IdHQLUgEFM
         Ipjr372HPeqI+rYgetQYiieLDaGNWVgk/24njMt9Amkh4awULfEqgxQFzrVK5kTXsJZn
         eHqw==
X-Forwarded-Encrypted: i=1; AJvYcCUWaN1Bdy6RLvVZtN5dnnNL9GIu4dke8/J66jY8iNM+MjDGWoqOoJzhzk2hS98yQeIov3rY4cRSVEapkhC4w78MclD3wQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwbDaq9Rx7bqBnLQnAHyZ8enNsMCzRhV0IJsHzOw2mnF0v75Ql8
	HNbWjIbEdw5kHUm8EK4bIKETpOJQeqCreir6HqsU9HJL2ovbAYQMjqt8
X-Gm-Gg: ASbGncsRhiDpvn6gj3JXazNEtXLCkDYCTmYlmcvi00tbaTXQXoC+O5W2nzZ9Iwsa2lO
	inilVxrbr5MRYUQlbJpf4K3kD/2NzQSpKPgDMHa47Ct/wuWE2eMliYQBfx84wt387fNFVFerGAD
	s8aMCo26qDf0dbZ6kFEEl2J5ETKj1x6mWxzpnT2Mh9EV4bUYlss+CS9nmmtTEcK3UtXCYkJwiA/
	2zKMbR531lWj+LDnUp5jfb9vn1h+wLVDqS3bE6lzhl1ljPoHBYrkRcVkUznJagdsAGx+GT4ntH0
	REUtuiZTt4Av3bAzMSgRD8h31xWjCLAabDoXc3hCnI0fBzuKWvZ6z1ATCprLyJB3h/napw8JaDg
	OXmfWXFwS4ZZHAytLiGF1RaQ/JrgbnkAc9BglmIsRt3Y+dnuPhuY1HEPlzCodkcmREA==
X-Google-Smtp-Source: AGHT+IHiXmiw3L7eWOCC4ObaGkYcVv5rY+RDNbXFTwGxaS2TznMkzaolvLUgRBq0kXBjPI6DHDvPAw==
X-Received: by 2002:a17:907:7211:b0:b04:b981:8823 with SMTP id a640c23a62f3a-b24ee317eb3mr972788266b.4.1758421656279;
        Sat, 20 Sep 2025 19:27:36 -0700 (PDT)
Received: from localhost.localdomain ([46.10.223.24])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b2636394e32sm448658866b.16.2025.09.20.19.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 19:27:35 -0700 (PDT)
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: steffen.klassert@secunet.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	saakashkumar@marvell.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	"Nikola Z. Ivanov" <zlatistiv@gmail.com>
Subject: [PATCH net] net/xfrm: Refuse to allocate xfrm_state with SPI value 0
Date: Sun, 21 Sep 2025 05:27:01 +0300
Message-ID: <20250921022701.530305-1-zlatistiv@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported by syzkaller: "KASAN: slab-use-after-free Read in xfrm_alloc_spi"

Before commit 94f39804d891 ("xfrm: Duplicate SPI Handling")
xfrm_alloc_spi would report spi=0 as unavailable.
Add this behaviour back by adding 1 to the "low" value when it is passed as 0.
Allocating xfrm_state with spi=0 leads to UAF or CPU stall.

Fixes: 94f39804d891 ("xfrm: Duplicate SPI Handling")
Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
---
This should probably be sanitized in verify_spi_info
but doing so will change the interface.

The bug is easily reploducible by issuing some iproute commands:

root@syzkaller:~# ip xfrm state allocspi mode tunnel proto esp src 192.168.1.100 dst 192.168.1.200 min 0 max 3
src 192.168.1.100 dst 192.168.1.200
        proto esp spi 0x00000001 reqid 0 mode tunnel
        replay-window 0
        anti-replay context: seq 0x0, oseq 0x0, bitmap 0x00000000
        sel src 192.168.1.100/32 dst 192.168.1.200/32
root@syzkaller:~# ip xfrm state allocspi mode tunnel proto esp src 192.168.1.100 dst 192.168.1.200 min 0 max 3
src 192.168.1.100 dst 192.168.1.200
        proto esp spi 0x00000000 reqid 0 mode tunnel
        replay-window 0
        anti-replay context: seq 0x0, oseq 0x0, bitmap 0x00000000
        sel src 192.168.1.100/32 dst 192.168.1.200/32
root@syzkaller:~# ip xfrm state allocspi mode tunnel proto esp src 192.168.1.100 dst 192.168.1.200 min 0 max 3
src 192.168.1.100 dst 192.168.1.200
        proto esp spi 0x00000003 reqid 0 mode tunnel
        replay-window 0
        anti-replay context: seq 0x0, oseq 0x0, bitmap 0x00000000
        sel src 192.168.1.100/32 dst 192.168.1.200/32
root@syzkaller:~# ip xfrm state allocspi mode tunnel proto esp src 192.168.1.100 dst 192.168.1.200 min 0 max 3
[   34.267077] rcu: INFO: rcu_preempt self-detected stall on CPU
[   34.267107] rcu:     1-....: (1 GPs behind) idle=8b84/1/0x4000000000000000 softirq=9934/9935 fqs=5250
[   34.269110] rcu:     (t=21004 jiffies g=5953 q=571 ncpus=2)
[   34.271123] CPU: 1 UID: 0 PID: 296 Comm: ip Not tainted 6.17.0-rc6-00004-ge6f19f124217-dirty #55 PREEMPT(voluntary)
[   34.271123] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.17.0-5.fc42 04/01/2014
[   34.271123] RIP: 0010:xfrm_alloc_spi+0x2d5/0xe60

 net/xfrm/xfrm_state.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/xfrm/xfrm_state.c b/net/xfrm/xfrm_state.c
index 78fcbb89cf32..4414346a24d7 100644
--- a/net/xfrm/xfrm_state.c
+++ b/net/xfrm/xfrm_state.c
@@ -2566,7 +2566,9 @@ int xfrm_alloc_spi(struct xfrm_state *x, u32 low, u32 high,
 	unsigned int h;
 	struct xfrm_state *x0;
 	int err = -ENOENT;
-	u32 range = high - low + 1;
+	if (low == 0)
+		low = 1;
+	u32 range = high + 1 - low;
 	__be32 newspi = 0;
 
 	spin_lock_bh(&x->lock);
-- 
2.51.0

