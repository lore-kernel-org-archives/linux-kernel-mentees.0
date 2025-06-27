Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90A2292B5C
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 27 Jun 2025 09:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751015049; cv=none; b=sAWlEPtzycyLQFIAokGWxz0Pq0c0nwJs1EkX1M2qhOz3dgW0DwYs0xT02TQX9NxaRqlYSqiTpiPCSZghg+yUH5Y093p1PHmKVbUMZQABqrjMNPreVraXg0J+gAhHoyzF6PyMJ5iDlWCrfAPj/SBIZ6SMmr8p7vGmeKYyDRMFaj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751015049; c=relaxed/simple;
	bh=26Z1MwHnjk2h7wspYJq72P8Nt3nRYsPC+dd6E2tbHiA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rqzs3OdzEm4mKYb1VkgZpPgKv62tkpIgMdV80GzgH+fBLNfFJGOaTybjn6ehtL+hWoR9bjIgbDZDONiwpe2TUo0lYELKG95wVoy4x82XMpjWSVZovbwMMBZtgRPy7hKrXsPkcPTTx6FEDtbS01aTmpEnBbEykG63mB1m79H6tlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZOH15c/1; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZOH15c/1"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so1803846b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 27 Jun 2025 02:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751015047; x=1751619847; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+OPOjWi2p5Z5MHfvR9PBiYVVI5F5wJufIgUU5dhlzxE=;
        b=ZOH15c/1mVWU4ioeDRwUdVjUU7tHzlRzv5y7C6vWEm5uIV1c/3reeep0oBWkX6W8bg
         TnQYf1e4abAX8Lxf+UEcTYlxGzjGXMLMZTqLKUK7gPpH/zQ/55pjqgqmCrXJsI6wiNBO
         bFjroRi4JrWhS1fKGnE8dzPL/5kEmqqfYfY6xHJwAJ+yyebau5hqFoNXKhv18FSWFGev
         6qZtCfXDBxB1wmsPWQw6+enK1ty+YtJZmnNjNOeKWba7Ujyhc5nuh1B3Hx62G5wrinJN
         tE/JnkBMtjC5gXguUhc8UCt913Vgw70itAcg5m7CT98vshA3CwMEbaNe9HO4JlHuhLBs
         OHDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751015047; x=1751619847;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+OPOjWi2p5Z5MHfvR9PBiYVVI5F5wJufIgUU5dhlzxE=;
        b=j2+4UEEG+Mwtl2eYS7chtUwN4fcv+XvaK1F9hcAmVpB1kwHPU1MTamUMATz8uuvJ7p
         A3zNJlYvLfC/6Bv0i8bH3IyQTgdAwp9ghHaVOxfEbIFFuAXLcAu4WjXrwz0WDSSWbuqJ
         Za+y3FkSlcPlX56JcuHriYzyUxhN9QriZpUD94ZvG7xfYvem2JLASx7d7X1YX7BZFBEa
         VHb0tPolQCM4xdlliocYfwozdfpNmG2bBUwbADQut46Y41BoxLV9f1Co9YOk2TYNV/G2
         tWixbRaIH6fHgx2t1Ej4a2UGA29RD8lcGbCeQji3J1l+lSPqo/F6mc4cJB9AmmQceYgh
         m35g==
X-Forwarded-Encrypted: i=1; AJvYcCUiTYgIC3uMpZzK4uu4ovALwtH0XwHb0B/gRvUnH72N6r8TPmFroJ8QbSp0x0FJ/CbHHOizVjWixXMfiXwvpkm3yh2+xg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/rn3Z+1OGCsnYHnC9sp1Xo3Gt6B299U69WafGwMB94Bub3Bw7
	/V6FDqNWVmGd3SU24/Od0oSDYIdT4SD5mMcLxKjqTd4UeWDWbLWMiBcF
X-Gm-Gg: ASbGncvByN5yVxyp7YR6iSHnPyV6lZQgPaxZhkmnCQ0ttwYMB9Au7nrBJnu7EiivKOk
	1k81eVvYrCWDsEutypXGLz9KqNfK4IH47iA20ZCaCoctfMBLj5g17MsnYD0jSk6TPShyYvy4YDZ
	pne4LVjMkCNLmwyPptXWhleluZLs+ilSucci9s9uHNMBwhvir6+w2nc9sa1IxxQnCS5VBiegkW7
	E2LU5dp7CzqUG3d/nbq+mhMBr/6Aibo49GD6KlqqAwT+hR3FjBPGnioGU3/NkQihcGxmqCYAvKK
	7bVNfs9sSUFIo2z70K/sPEvPLGBIStdfX0tjp89GYr4KvWsinXb5dR0HexqIWnR0dGkKWU3eLg6
	gWb7z+/A=
X-Google-Smtp-Source: AGHT+IFi7uSNU0NXFWo1RpPm1TGTKsqRNAglzlIgdaPSrhHfNLCIMhftBcZcOffl8C56MCw/UDFE6w==
X-Received: by 2002:a05:6a00:8ca:b0:749:1e60:bdd with SMTP id d2e1a72fcca58-74af7893218mr3329499b3a.2.1751015046910;
        Fri, 27 Jun 2025 02:04:06 -0700 (PDT)
Received: from manjaro.domain.name ([2401:4900:1c67:6116:afb5:b6ab:2dc8:4a21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af540b389sm1846158b3a.35.2025.06.27.02.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 02:04:06 -0700 (PDT)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: john.fastabend@gmail.com,
	daniel@iogearbox.net,
	jakub@cloudflare.com,
	lmb@cloudflare.com,
	davem@davemloft.net,
	kuba@kernel.org,
	ast@kernel.org,
	andrii@kernel.org,
	kafai@fb.com,
	songliubraving@fb.com,
	yhs@fb.com,
	kpsingh@kernel.org,
	cong.wang@bytedance.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	stable@vger.kernel.org,
	Jiri Olsa <jolsa@kernel.org>,
	Xu Kuohai <xukuohai@huawei.com>,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH 5.15] bpf, sockmap: Fix skb refcnt race after locking changes
Date: Fri, 27 Jun 2025 14:33:54 +0530
Message-ID: <20250627090354.10491-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: John Fastabend <john.fastabend@gmail.com>

[ Upstream commit a454d84ee20baf7bd7be90721b9821f73c7d23d9 ]

There is a race where skb's from the sk_psock_backlog can be referenced
after userspace side has already skb_consumed() the sk_buff and its refcnt
dropped to zer0 causing use after free.

The flow is the following:

  while ((skb = skb_peek(&psock->ingress_skb))
    sk_psock_handle_Skb(psock, skb, ..., ingress)
    if (!ingress) ...
    sk_psock_skb_ingress
       sk_psock_skb_ingress_enqueue(skb)
          msg->skb = skb
          sk_psock_queue_msg(psock, msg)
    skb_dequeue(&psock->ingress_skb)

The sk_psock_queue_msg() puts the msg on the ingress_msg queue. This is
what the application reads when recvmsg() is called. An application can
read this anytime after the msg is placed on the queue. The recvmsg hook
will also read msg->skb and then after user space reads the msg will call
consume_skb(skb) on it effectively free'ing it.

But, the race is in above where backlog queue still has a reference to
the skb and calls skb_dequeue(). If the skb_dequeue happens after the
user reads and free's the skb we have a use after free.

The !ingress case does not suffer from this problem because it uses
sendmsg_*(sk, msg) which does not pass the sk_buff further down the
stack.

The following splat was observed with 'test_progs -t sockmap_listen':

  [ 1022.710250][ T2556] general protection fault, ...
  [...]
  [ 1022.712830][ T2556] Workqueue: events sk_psock_backlog
  [ 1022.713262][ T2556] RIP: 0010:skb_dequeue+0x4c/0x80
  [ 1022.713653][ T2556] Code: ...
  [...]
  [ 1022.720699][ T2556] Call Trace:
  [ 1022.720984][ T2556]  <TASK>
  [ 1022.721254][ T2556]  ? die_addr+0x32/0x80^M
  [ 1022.721589][ T2556]  ? exc_general_protection+0x25a/0x4b0
  [ 1022.722026][ T2556]  ? asm_exc_general_protection+0x22/0x30
  [ 1022.722489][ T2556]  ? skb_dequeue+0x4c/0x80
  [ 1022.722854][ T2556]  sk_psock_backlog+0x27a/0x300
  [ 1022.723243][ T2556]  process_one_work+0x2a7/0x5b0
  [ 1022.723633][ T2556]  worker_thread+0x4f/0x3a0
  [ 1022.723998][ T2556]  ? __pfx_worker_thread+0x10/0x10
  [ 1022.724386][ T2556]  kthread+0xfd/0x130
  [ 1022.724709][ T2556]  ? __pfx_kthread+0x10/0x10
  [ 1022.725066][ T2556]  ret_from_fork+0x2d/0x50
  [ 1022.725409][ T2556]  ? __pfx_kthread+0x10/0x10
  [ 1022.725799][ T2556]  ret_from_fork_asm+0x1b/0x30
  [ 1022.726201][ T2556]  </TASK>

To fix we add an skb_get() before passing the skb to be enqueued in the
engress queue. This bumps the skb->users refcnt so that consume_skb()
and kfree_skb will not immediately free the sk_buff. With this we can
be sure the skb is still around when we do the dequeue. Then we just
need to decrement the refcnt or free the skb in the backlog case which
we do by calling kfree_skb() on the ingress case as well as the sendmsg
case.

Before locking change from fixes tag we had the sock locked so we
couldn't race with user and there was no issue here.

[ Backport to 5.15: context cleanly applied with no semantic changes.
Build-tested. ]

Fixes: 799aa7f98d53e ("skmsg: Avoid lock_sock() in sk_psock_backlog()")
Reported-by: Jiri Olsa  <jolsa@kernel.org>
Signed-off-by: John Fastabend <john.fastabend@gmail.com>
Signed-off-by: Daniel Borkmann <daniel@iogearbox.net>
Tested-by: Xu Kuohai <xukuohai@huawei.com>
Tested-by: Jiri Olsa <jolsa@kernel.org>
Link: https://lore.kernel.org/bpf/20230901202137.214666-1-john.fastabend@gmail.com
Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
---
 net/core/skmsg.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/net/core/skmsg.c b/net/core/skmsg.c
index a5947aa55983..a13ddb9976ad 100644
--- a/net/core/skmsg.c
+++ b/net/core/skmsg.c
@@ -608,12 +608,18 @@ static int sk_psock_skb_ingress_self(struct sk_psock *psock, struct sk_buff *skb
 static int sk_psock_handle_skb(struct sk_psock *psock, struct sk_buff *skb,
 			       u32 off, u32 len, bool ingress)
 {
+	int err = 0;
+
 	if (!ingress) {
 		if (!sock_writeable(psock->sk))
 			return -EAGAIN;
 		return skb_send_sock(psock->sk, skb, off, len);
 	}
-	return sk_psock_skb_ingress(psock, skb, off, len);
+	skb_get(skb);
+	err = sk_psock_skb_ingress(psock, skb, off, len);
+	if (err < 0)
+		kfree_skb(skb);
+	return err;
 }
 
 static void sk_psock_skb_state(struct sk_psock *psock,
@@ -681,9 +687,7 @@ static void sk_psock_backlog(struct work_struct *work)
 		} while (len);
 
 		skb = skb_dequeue(&psock->ingress_skb);
-		if (!ingress) {
-			kfree_skb(skb);
-		}
+		kfree_skb(skb);
 	}
 end:
 	mutex_unlock(&psock->work_mutex);
-- 
2.49.0

