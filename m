Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F306388880
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 29 May 2026 17:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780076062; cv=none; b=SCrU5PHq2ADQ7Ws7EYzOIHad8Q+rY6oUHcwLJ3DxqyGT1Dqvv8bA/ENH1Vttk402KLZ4n5ucruQkx05GzIxMFBO8dyxtlGzwxuPK1JHJhs+HABhAi4cBmgZ+y+kK2vVGfIx0k7uZ/3roq8vgdxRlzM3GW5x5+bc56TnDfx2M1Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780076062; c=relaxed/simple;
	bh=RdQD4wue90+v4yUM2xCSZUvp66yPWE/ku+bI86gv7wU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N/AibWSdqzMYFXF9rCL8WCB2tV6NIFhaQBgJEM9nCX759tPhH7vldj69981kA6Gu7HMBSjN9VcC7SzqSS35yMuqugD+WacHwDvmHhsiVw5z6cJfhRkw8ruMa0BcyV8f2+de7+NX+nxr5lXL0A1V9oS/f/AAvixn8YFCTKaHLpoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sB5VbUyz; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sB5VbUyz"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-36ba285e98bso1668829a91.2
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 29 May 2026 10:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780076059; x=1780680859; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VSsUh1Q1AG0bKmm3IulRp5n1yyJwXsFuTPbDToRe2u0=;
        b=sB5VbUyzEkpJHUmT8sH9M6WDdqIZ4I7rk1qpnKx3YlFqKSrq1CQJFnEdHLa9oYgo8X
         i9jQQwcgYNDNI9d649WSSUkh+3zE9h6PRk55KpbG0aXbSgBy7zU+OrKKpuYRWK6pYcD2
         8K0cCd8Ezn4QddSJ1rgWf4bQ/GQxFR70k9Lm5JYBdcD2ZoowA9aWg4USMLtd+4mmzl26
         7snz60K6GWOd635+U87JdVFp1gw5K7CofYAaQzMru7C0t96scoat4bWp+xK04mWqVaKp
         BTBIsdc+c7oB32XrLDncitJL+M87hc4JodMNArhdpJwnrC/TowWpCJzdrGlu9v+r6vFX
         ABlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780076059; x=1780680859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VSsUh1Q1AG0bKmm3IulRp5n1yyJwXsFuTPbDToRe2u0=;
        b=V9Lamqqdb7gl1hL6onLco0ToRjokZJ1turNtT/UmGh1dUoDvVgXZ4iO1xy8WqccdAj
         bevKR+lzpW6OZttxewPiO1DDCX8yHdF1YUBKC1e/RWgU7u6MjwjpPuYQRgGGsV+Kr0h4
         cWAMprpm891z9lMBkqloOn4PVH3DxWQicEUWWdmjoBMruXeNe+dMlNBH73mPSUbTlAEV
         BrDyXoIuLl6Tfb4HPTOgQHuq7cnYrBuWYI9VVmq+vnSwDncyYebP/N8E++tsy3rjnEOo
         NuAzeQ++qdXZumuHhUFdFbYkhvh6qVjgGAG1KyZo3BMXL7dEET5e6sdux75JvYp6N2o2
         rhtQ==
X-Forwarded-Encrypted: i=1; AFNElJ97p7vgd3kPR7bGzO5JWuMAQrCPgbWQIbdOIiF2q+nEUsYBzpprSS+YPJ5CLCF6JXMm4FfND/8Cx/PG/g3low2vnKIXKQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxj6PQ7NjfEs3nfCA0ytRWb2IbwDXkvQy16ejkgzJZCG677/jss
	EdYw1rYJmaHipENK7MEkKUnRgzJdJ/3HxiOyd6l249cm8kBwXA8cCW2I
X-Gm-Gg: Acq92OGeJhlZNytCko0nO6j819tBL23/fdKzQb5hR417/sh7j9aInJA4WE92XPRuofr
	aiFFJk/NUiP1PfYPlqkHRL+bCU11maWwqdixonWAaERZ3PR7Gv0ADVZ4AsntNUWhUT+qPONQ10/
	aolZfhlzXjAlUpjpkbKm8/C6csDHWvpUHTzlHRx0r1D9Dg64ZCF6k0JdSqhirhwjZ/9czUbCxfk
	u3kzswk5wgPlB1ZzwAH2mxdK24IvOMcNEnGAgImk3z11lvodUwwO2d1iacPVskRB3nYyqF1IyE2
	qHX++ptFjJ8fuQE2i6SLWNJkvQMbIGJ+kqz1/UrzYnIIupjNbhhE96ixg40hk60gG3L24wlPrGJ
	AilGEzozmGGVcKlJJzD3wmMTujYHCZelH7gW/ONTXYsrcX3SH4Ai0QZN05EwwmIB+c/ucxzcEvn
	HQ4lrRaGSqnDEdAnjm+/JGX+zTKALN3qo8RZ30foTh6adzqQwfDhZ8CN15eA==
X-Received: by 2002:a17:90b:590e:b0:36b:211f:fa75 with SMTP id 98e67ed59e1d1-36c4ff4cfd4mr188994a91.8.1780076059232;
        Fri, 29 May 2026 10:34:19 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85772ba4adsm2361027a12.23.2026.05.29.10.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 10:34:18 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	me@brighamcampbell.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH v1 2/2] Bluetooth: SCO: Fix data-race on dst in sco_connect
Date: Sat, 30 May 2026 02:33:47 +0900
Message-ID: <20260529173347.43967-3-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260529173347.43967-1-suunj1331@gmail.com>
References: <20260529173347.43967-1-suunj1331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sco_sock_connect() copies the destination address into
sco_pi(sk)->dst under lock_sock, then releases the lock and calls
sco_connect(), which reads dst back without holding any lock in
hci_get_route() and hci_connect_sco().

If two threads call connect() on the same socket concurrently with
different addresses, one thread can overwrite dst before the other
thread's sco_connect() reads it.

Fix by snapshotting dst into a local variable under lock_sock at
the start of sco_connect(), matching the approach used for ISO in
the previous patch.

BUG: KCSAN: data-race in memcmp+0x45/0xb0

race at unknown origin, with read to 0xffff88800e6b0dd0 of 1 bytes by task 315 on cpu 0:
 memcmp+0x45/0xb0
 hci_connect_acl+0x1b7/0x6b0
 hci_connect_sco+0x4d/0xb30
 sco_sock_connect+0x27b/0xd60
 __sys_connect_file+0xbd/0xe0
 __sys_connect+0xe0/0x110
 __x64_sys_connect+0x40/0x50
 x64_sys_call+0xcad/0x1c60
 do_syscall_64+0x133/0x590
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Fixes: 9a8ec9e8ebb5 ("Bluetooth: Fix three socket race condition bugs in sco.c")
Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
---
 net/bluetooth/sco.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/net/bluetooth/sco.c b/net/bluetooth/sco.c
index f1799c6a6f87..c9f6a8aaee57 100644
--- a/net/bluetooth/sco.c
+++ b/net/bluetooth/sco.c
@@ -312,11 +312,16 @@ static int sco_connect(struct sock *sk)
 	struct sco_conn *conn;
 	struct hci_conn *hcon;
 	struct hci_dev  *hdev;
+	bdaddr_t dst;
 	int err, type;
 
-	BT_DBG("%pMR -> %pMR", &sco_pi(sk)->src, &sco_pi(sk)->dst);
+	lock_sock(sk);
+	bacpy(&dst, &sco_pi(sk)->dst);
+	release_sock(sk);
+
+	BT_DBG("%pMR -> %pMR", &sco_pi(sk)->src, &dst);
 
-	hdev = hci_get_route(&sco_pi(sk)->dst, &sco_pi(sk)->src, BDADDR_BREDR);
+	hdev = hci_get_route(&dst, &sco_pi(sk)->src, BDADDR_BREDR);
 	if (!hdev)
 		return -EHOSTUNREACH;
 
@@ -336,7 +341,7 @@ static int sco_connect(struct sock *sk)
 		break;
 	}
 
-	hcon = hci_connect_sco(hdev, type, &sco_pi(sk)->dst,
+	hcon = hci_connect_sco(hdev, type, &dst,
 			       sco_pi(sk)->setting, &sco_pi(sk)->codec,
 			       READ_ONCE(sk->sk_sndtimeo));
 	if (IS_ERR(hcon)) {
-- 
2.52.0

