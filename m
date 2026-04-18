Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAA6339866
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 18 Apr 2026 05:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776490466; cv=none; b=XLhFYdz9sAZ3NP8AgFQ3UdClG0O2sjsJIaeKtFgKHTBl2uryJJ1R8YyyZQI57C8BUmV3BPMLFgegxIm4yli9FFoGlqiWfZlO5oLOq7tOJjVSwCUlhPX0pAVZQ4lvr53PTA9hJJElEsGY2d050xSersywenBKu89VSt/M8WTz2v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776490466; c=relaxed/simple;
	bh=C6Hn3L10r5uhLd2QzSnPaJi2BVQnAFECz4DQWvB6GuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dBabOm2wBc7GSdaGz7Okiuap4rUiOh8zF/au4VChxH2z0E7fj2RL89Ezv/vduXuwbTTVddpmI5jdZwzsTD987bCvQhxgXPJp+fggguhG0WrOCjZazxaY27SRet4jrZZRwrmT/7uKOODxX3aPs3FKUFUTEha/MrzV8dGAQh6x7ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qohQVjr5; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qohQVjr5"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ad9516a653so7195015ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 17 Apr 2026 22:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776490465; x=1777095265; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aTLB8mgGvaT9B2aXVBnKEZE3IH4dRJ493bKxw7Qh57M=;
        b=qohQVjr54jwdTQvEobrAHOru3RqDZWnieoimtwHw1nhGiLnZthHBKXaGS2Ftl38aiU
         EAXh1/EIONoGFW0+we7WRayKqQczzGxFcemJmLJMg3KW9XmCBmLSV9uEw6r/HIZZrihG
         AUtCMIImAp0tEwuLb6U4aZV2f6N/fvxP29GhxPfCssoyjhHEJPfvj/HkgckoqbN4x2x7
         NJ/Gzns0rbS0kd2ySjufGZ2mRqb0S0MCz6dtJkUNhfZia5mKXJaPh5Nadz8KSFjjDos4
         Cz3HPbU1/gtvOoO/eJZHP+OSids12V82qIuT8KdEWOtdfT9/MH926PzyfKiRyi30M7et
         hjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776490465; x=1777095265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aTLB8mgGvaT9B2aXVBnKEZE3IH4dRJ493bKxw7Qh57M=;
        b=H1cHGyHtsSla7WR5vE9OmecsF7je91Pw4fUCQO29BzHNt6Y/hppslsDiINxtI05beO
         IXIHl2i4uYlemV9scDosrLexmT+9Y44BqJ329sJtwlWz062ceDbV//J7WoDppqgr1XGt
         1CqmZix2/R8CJktZjf+Uz7IDmPLQwVYIBYDcgW+np0VSLBTFJ6KgoCkcwc1pNZcfVgoM
         OSHEkRT4ClxyE1Xw6SYslWxyWH7+8Mw/jOh8qQd46fNa+qWVfuEDW+bgZCGyWnRR13XD
         FbEhsswqImNOtiC7IzWi2bcTHCPByobDXxYDRdD0w4ovW4vKMnULeFeAmbXxSvy++OH0
         dN2g==
X-Forwarded-Encrypted: i=1; AFNElJ+n4ue6rgIV6YmWt2ejAG4O4DzFAdCxZwiYfbZU+5dMAYBI/fmXGL5rTfY2YHUQTemUU8Gv88I9rnRbZYk47ZXtv6He/Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyOb+4yskqD4wArKhxLRS1rglIaH8ew0zIC56DCeXPNChFxvx0B
	f0PBiiE/9ycZzoxCc89tmNwd6Ka9iB2hLzDegRKbKxKehy0Zod6PflR5
X-Gm-Gg: AeBDietLGI5pDlmXbhYvJc2TQfD25GHxvqA/TBJcCSDaLCrRd1SVhWzIx4gDTAHeoZC
	MrBFgp82Jy6PSWg3TW2FfjYYeNo7+MEUWTYlb+W12fMZk87gK4pCGgKesFZzNhxIj/TDrsgb77f
	yHLl/qWvzh7ynEcUdU2/1yEqhjnhSc6WAVJTlOnC72nS5iIjWjjAPN0lTq/iCz/K5iCsRmezo3s
	9/tVEHKZylePa+WOuFmwuyWBSrvLsV21lfCVO96xtYnf/Hrg9eHlUi8/rkTKc1yl2Y5AXSyihMG
	u7qhNvK1DOruPKXWmxhkUnSbAV0FtUmLTBoZpT1RocYooIGyw+rwactFiYWEpkjc6Up4ii2mg+/
	8ulhpq2hW/vVoKnkfmbbLKQ2LQjxbPbpmjKXAddwV8VovISAquXPUZGSUhelRRbBUiBHtvYiThu
	Do2dZvYykjpZAK8qsa/vaGC+8vrxe1JuvTC2h0SmC+rmijWSXWfNXO8vloFujlGwrmzQaM
X-Received: by 2002:a17:902:cf4a:b0:2b0:4b3a:9b4d with SMTP id d9443c01a7336-2b5f9f1c862mr62346035ad.20.1776490465079;
        Fri, 17 Apr 2026 22:34:25 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff3bfsm46251885ad.7.2026.04.17.22.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 22:34:24 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: luiz.dentz@gmail.com,
	marcel@holtmann.org
Cc: linux-bluetooth@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	me@brighamcampbell.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH 1/2] Bluetooth: ISO: Fix data-race on dst in iso_sock_connect()
Date: Sat, 18 Apr 2026 14:34:00 +0900
Message-ID: <20260418053401.128483-2-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260418053401.128483-1-suunj1331@gmail.com>
References: <20260418053401.128483-1-suunj1331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

iso_sock_connect() copies the destination address into
iso_pi(sk)->dst under lock_sock, then releases the lock and reads
it back with bacmp() to decide between the CIS and BIS connect
paths:

    lock_sock(sk);
    bacpy(&iso_pi(sk)->dst, &sa->iso_bdaddr);
    iso_pi(sk)->dst_type = sa->iso_bdaddr_type;
    release_sock(sk);

    if (bacmp(&iso_pi(sk)->dst, BDADDR_ANY))  // <- no lock held

This read after release_sock() races with any concurrent write to
iso_pi(sk)->dst on the same socket.

Fix by performing the bacmp() inside the lock_sock critical section
and caching the result in a local variable.

This patch addresses only the bacmp() race in iso_sock_connect();
other unprotected iso_pi(sk) accesses are fixed separately in the
next patch.

KCSAN report:

BUG: KCSAN: data-race in memcmp+0x39/0xb0

race at unknown origin, with read to 0xffff8f96ea66dde3 of 1 bytes by task 549 on cpu 1:
 memcmp+0x39/0xb0
 iso_sock_connect+0x275/0xb40
 __sys_connect_file+0xbd/0xe0
 __sys_connect+0xe0/0x110
 __x64_sys_connect+0x40/0x50
 x64_sys_call+0xcad/0x1c60
 do_syscall_64+0x133/0x590
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

value changed: 0x00 -> 0xee

Reported by Kernel Concurrency Sanitizer on:
CPU: 1 UID: 0 PID: 549 Comm: iso_race_combin Not tainted 7.0.0-08391-g1d51b370a0f8 #40 PREEMPT(lazy)

Fixes: ccf74f2390d6 ("Bluetooth: Add BTPROTO_ISO socket type")
Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
---
 net/bluetooth/iso.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/net/bluetooth/iso.c b/net/bluetooth/iso.c
index be145e2736b7..14963ba68597 100644
--- a/net/bluetooth/iso.c
+++ b/net/bluetooth/iso.c
@@ -1169,6 +1169,7 @@ static int iso_sock_connect(struct socket *sock, struct sockaddr_unsized *addr,
 	struct sockaddr_iso *sa = (struct sockaddr_iso *)addr;
 	struct sock *sk = sock->sk;
 	int err;
+	bool bcast;
 
 	BT_DBG("sk %p", sk);
 
@@ -1191,9 +1192,11 @@ static int iso_sock_connect(struct socket *sock, struct sockaddr_unsized *addr,
 	bacpy(&iso_pi(sk)->dst, &sa->iso_bdaddr);
 	iso_pi(sk)->dst_type = sa->iso_bdaddr_type;
 
+	bcast = !bacmp(&iso_pi(sk)->dst, BDADDR_ANY);
+
 	release_sock(sk);
 
-	if (bacmp(&iso_pi(sk)->dst, BDADDR_ANY))
+	if (!bcast)
 		err = iso_connect_cis(sk);
 	else
 		err = iso_connect_bis(sk);
-- 
2.52.0

