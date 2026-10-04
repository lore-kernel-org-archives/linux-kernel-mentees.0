Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E40322C88
	for <linux-kernel-mentees@lists.linux.dev>; Sun,  4 Oct 2026 11:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791113179; cv=none; b=j01LtGUaa8pHhgzqUfUkJn5OlayA24aY9Pk5J1rKTT6OvBF/P8TjSbR3m3VCO6J2ne67ER88gGC1v6OT9vt13ZZtQ8FhjncbwFRV9d+AMiqvR9OZXMTecWpnOOeMwIBk7yznluq3I9y3CB6ktN98sAtM/sTs1Y3YI3KPbXUq99A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791113179; c=relaxed/simple;
	bh=VTbymmEjpOCQuBqxJS7p1ucb7WAhHa+umEskl+i05JU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sZ9F1GRLOyCxulzWY2RsDe56QijS552ftoB9TLIkaQtcF9hRFWtWi+8ZfhpMv5D1Zc6vJE2mn3wMYQQFlQFzK2wuEahMtx0YmSZ7QxJ03XHTOFvWoE3qF5PSejjq5mgANigmbrBxMZeY/0smKBz1UCIkpQjwYZPelZcbut+Huyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X26Lpa/m; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X26Lpa/m"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so5749565e9.1
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 04 Oct 2026 04:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791113176; x=1791717976; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uaP/Sg1mAHupYqT3+SwRzFofHSCYAQCOIKhJz2Ezv8E=;
        b=X26Lpa/mPru8ilag+VVmAamK0Mq3sk3N5yHKPXgV3c1nfFXnoE3Ojg0HPdN4kwnBj4
         xjQETZEWp5vz9gup2IRm8172uojRSDdcDmpd1xlLIyHrcMURzqbTxbqwhTf0gN7Mnzkw
         WkMxW6EhZWDfdj3B8D+WL+hCyfWiuSl6yENU1WZGXe9pB6ji7o4TwzJuCdNyHXgmEIEu
         MjRMzdPgk5miFClw3iveQEJJYb3neQzz8CJYiXFJ7ObZE28BF4FTH0lFasZ2flLgb/pd
         OSQSx9kNlFmDh/TG1jNR0qqLotXuZmtz0s9Rswnzj0TyBOedGOTk/JIc+1chFSNou/Pv
         ApOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791113176; x=1791717976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uaP/Sg1mAHupYqT3+SwRzFofHSCYAQCOIKhJz2Ezv8E=;
        b=PyO3B2ie5sEJ6k63cpv+OprSNCivbrjbFT5FWvgJRDiV/l1oPvWWpuqMqMU093CaDp
         GWriLScuHtxT7GRegnFYB0O+Zpk3eiNPZK1p3ctO/LYFl8vpY3bojGodKbxAS1zzRPJl
         8RkOoJCg6hDPK7TYbAWpF4M1kep3HtNx8Ws/BOhnFUu02xfHonBUVCU0/1hYwKYAqlNO
         bF3Ab46Ue108hmbbxt3ROdYtea9O7tANrw5SJV4kagNNR/pxjHw6ZwcymyrrEzeNl4T0
         qs5/Un/3oTQCAfoo/HJsaHB5K8kx0r6L8Y0AKuoJ/EpylTvflgADUv67+Z+VvOFYSrTo
         CZBA==
X-Forwarded-Encrypted: i=1; AKwUvBz3Z6DbQfQG7h2yloxu6qp+7MqT5BROczyOLqIKAE7U0uYuN8Gt6Vhh1beWWYXkd1EcWjlcI3llCgeeHNdgi273ryp/NQ==@lists.linux.dev
X-Gm-Message-State: AFuF++nFL/3ZzpMGpAXjXK0xPAQ/zi7Dto8pfSMXTkBdj0AV6LZjMrV9
	OCeHgCFxXj/SSphwA4Q7fymBxCUbqLplQLb9HPvmkckBM7kdJJ1/oW25
X-Gm-Gg: AYBFou2NwkZz0roePDZQjk64EDBDWTIgQHTgqbdLIoG67gLTH/2C+IIvGmqtd/q6cpl
	J/P75Q5YVlEAy5tgTqqY3lSwLCWQg31yN4sVfdnRn23Di7N3JCXtFnpXb1bhyTBl28OQyv/Cq+R
	NEXmxmMhrha5C1DQ1qUAajnPSlzKim/0CCAZvVPX/tHviEfh8CEMzx+d+fxnadcY39WFhShArwz
	09e+AVHpN9Cbwt572Q2kd1A+rcuBikswe2HFxt7zk5IDWv2UTCe6nghaxAFgPg+CbtDFsTZ1JUi
	wpACobkPThQBJLD8zLzdpaIcEOrTruuCbMxFCqidkU8BMxMeZSWY5KqKmo1Qt3jUmXVdAyOPKY0
	nbLDdcNAQYY8VcYqI28secde9WP3icZpxareujgvxW1FLAM9HGuIqGqk3tE2w5CidBAzOEip9Hn
	vgzxFTPTR4vgrJ6ErmCksjPC0deFdusfJCRi9Rd97hMiTlcIEUClrSQSj7ohoxbKBlXPnBq0m3l
	xz2WJE174WXg4VvHhGo18/pDVRyY8B7bvC78UzeFlZCb0NHqXV02FBXbkqswV89Kck=
X-Received: by 2002:a05:600c:3510:b0:49f:ff32:803c with SMTP id 5b1f17b1804b1-4a02758653cmr126337265e9.16.1791113175399;
        Sun, 04 Oct 2026 04:26:15 -0700 (PDT)
Received: from Raghu007.. (sgyl-44-b2-v4wan-174108-cust110.vm6.cable.virginm.net. [80.1.81.111])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027727cecsm257088855e9.9.2026.10.04.04.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 04:26:14 -0700 (PDT)
From: Palla Raghunath <raghunathpalla.0209@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	raghunathpalla.0209@gmail.com,
	syzbot+ae549381b4daac2895b1@syzkaller.appspotmail.com
Subject: [PATCH] RDMA/cma: wait for addr_handler() to finish in rdma_destroy_id()
Date: Sun,  4 Oct 2026 12:26:13 +0100
Message-Id: <20261004112613.18171-1-raghunathpalla.0209@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot hit a use-after-free of id_priv in addr_handler(). The bad read
is in debug_mutex_unlock(), from the last mutex_unlock() of
handler_mutex, and the memory was freed by ucma_close() ->
rdma_destroy_id().

addr_handler() moves the state from RDMA_CM_ADDR_QUERY to
RDMA_CM_ADDR_RESOLVED (or RDMA_CM_ADDR_BOUND on error) under
handler_mutex. If rdma_destroy_id() runs at that point, it waits on
handler_mutex. When addr_handler() unlocks, the destroying task can take
the mutex before mutex_unlock() has returned. It then sees a state other
than RDMA_CM_ADDR_QUERY, so cma_cancel_operation() skips
rdma_addr_cancel(), and _destroy_id() frees id_priv. mutex_unlock() in
the work then touches the freed lock:

  ib_addr work                         close()
  addr_handler()
    mutex_lock(handler_mutex)
    ADDR_QUERY -> ADDR_RESOLVED
    ...                                rdma_destroy_id()
                                         mutex_lock(handler_mutex)
    mutex_unlock(handler_mutex)
      owner cleared                      gets the mutex
                                         state != ADDR_QUERY, no cancel
                                         kfree(id_priv)
      debug_mutex_unlock(lock)  <- use-after-free

Documentation/locking/mutex-design.rst says mutex_unlock() may still
touch the mutex after another task has acquired it, so handler_mutex
can't be what keeps id_priv alive here. The comment in
cma_cancel_operation() assumes it can. Before commit 722c7b2bfead
("RDMA/{cma, core}: Avoid callback on rdma_addr_cancel()"),
addr_handler() held a reference on id_priv until after mutex_unlock(),
which covered this.

So in rdma_destroy_id(), call rdma_addr_cancel() before taking
handler_mutex if a resolve was ever started on this id. The req stays on
req_list until the callback returns, so rdma_addr_cancel() finds it and
cancel_delayed_work_sync() waits until addr_handler() is really done.
This doesn't deadlock with the work itself. When addr_handler() destroys
the id because the event handler returned non-zero, it uses
destroy_id_handler_unlock(), not rdma_destroy_id(). Event handlers also
run with handler_mutex held, so they can't call rdma_destroy_id() on
their own id anyway.

There's no reproducer from syzbot, so I made the window bigger with a
debug-only mdelay(1000) after the mutex_unlock() in addr_handler(),
followed by a read of handler_mutex.magic. A small test program creates
an id, resolves an address on an rxe device and closes the fd while the
work sits in that delay. Without this patch KASAN reports the same
slab-use-after-free as syzbot (1048 bytes into a kmalloc-2k object,
freed by ucma_close()). With it the test runs clean, and close() just
waits for the work to finish.

Fixes: 722c7b2bfead ("RDMA/{cma, core}: Avoid callback on rdma_addr_cancel()")
Reported-by: syzbot+ae549381b4daac2895b1@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ae549381b4daac2895b1
Signed-off-by: Palla Raghunath <raghunathpalla.0209@gmail.com>
---
 drivers/infiniband/core/cma.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/infiniband/core/cma.c b/drivers/infiniband/core/cma.c
index 337a49d1acf7..24235eb0c49b 100644
--- a/drivers/infiniband/core/cma.c
+++ b/drivers/infiniband/core/cma.c
@@ -1968,10 +1968,10 @@ static void cma_cancel_operation(struct rdma_id_private *id_priv,
 		/*
 		 * We can avoid doing the rdma_addr_cancel() based on state,
 		 * only RDMA_CM_ADDR_QUERY has a work that could still execute.
-		 * Notice that the addr_handler work could still be exiting
-		 * outside this state, however due to the interaction with the
-		 * handler_mutex the work is guaranteed not to touch id_priv
-		 * during exit.
+		 * The addr_handler work can still be finishing its
+		 * mutex_unlock() after it has left this state.
+		 * rdma_destroy_id() waits for that before it takes
+		 * handler_mutex.
 		 */
 		rdma_addr_cancel(&id_priv->id.route.addr.dev_addr);
 		break;
@@ -2121,6 +2121,17 @@ void rdma_destroy_id(struct rdma_cm_id *id)
 	struct rdma_id_private *id_priv =
 		container_of(id, struct rdma_id_private, id);
 
+	/*
+	 * addr_handler() can still be in mutex_unlock(&handler_mutex) after
+	 * it has moved the state on from RDMA_CM_ADDR_QUERY, and
+	 * mutex_unlock() may touch the mutex even after we have taken it.
+	 * Wait for the work to finish before we free id_priv. The req stays
+	 * on req_list until the callback returns, so rdma_addr_cancel() will
+	 * find it.
+	 */
+	if (id_priv->used_resolve_ip)
+		rdma_addr_cancel(&id->route.addr.dev_addr);
+
 	mutex_lock(&id_priv->handler_mutex);
 	destroy_id_handler_unlock(id_priv);
 }
-- 
2.34.1

