Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B41B282F02
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 21 Apr 2026 02:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776739894; cv=none; b=pYTDUo7eVncXVFqYb6FIdonGxcdLgaZ/2icZaZ7PDPEropd+cypQDZ+yNn5hqYKlFxSQo/OYglBbMx2iBstu2SksT7WVkRQ9r5BDSPygcCcd56Ub0J8Fe2np91z3htWGRnChyuMaqx9iGBITcKXOfFPuuU/DC+Z3R7Br3O+CdzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776739894; c=relaxed/simple;
	bh=2GmeUgsVld79fKl1iNI45/UB/0MUWB93JcGKPSGrmas=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uY4MGVdAxJMFvOwS5HLpi51+2YqcoRXxOcevBorKPBsO0L9wG6/dZq2s9oU8o/bJtTwIFGnWUQyXTDdqQhsg5BP/zdpcSOipWcPQDICph8AHtxXNcHqanSUiuAjhWLi48aeHCOZFm7uE04YEMJRXOZA4yr85W3H3xgl/HbB5DhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HMP6gj2R; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HMP6gj2R"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82418b0178cso2287617b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 20 Apr 2026 19:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776739893; x=1777344693; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uJ95cJBTtwe/Q3ftFYdsD7Mm/4M8Wg0mB6kbaOeJjWI=;
        b=HMP6gj2R4ppg+i53pTCz59HGIQend1dG4GYjYy3KKfP6uA8EbFkGdIT3sf1jXrXcGj
         4WZbg+TkI3nlpKNF2aDpUD3Cj2K9bt9sXAptr3Yhc419lw+aPSo5pvXz3a4jNUDQc1EL
         4lTIgC8ILaWMnZPB0zYdUXpQpSMDYapApFoRlhcTSLSJsyRzQlEE7gwA0pWVINf6RbPg
         +CCAQJJe3e66Pi9GF1OU95RM3CEL81sF7AZvW6Gjsuh0uj7gdl40dLPe6DDUvT4betCj
         JaNtlSsz54oP9Ay9qWq90vwlUANV9IyA5e/geqObU6LfOBJuyT20Ksd5t0A2kSCgaYgQ
         Eh3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776739893; x=1777344693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uJ95cJBTtwe/Q3ftFYdsD7Mm/4M8Wg0mB6kbaOeJjWI=;
        b=jamIQ1/Q78mnDElZ+m3vjDeKT1snwugSmbXroMUwuTFqTuA52Zc8JjXyDYl2zpn65w
         ILmSPHx307Jk8d+phk4Jj/IR9iW7uQWGrUPZ+IZdZohu8bJhDJtBgF7DicKoWHaNEX2F
         JBJkyBaqa6tjyeBoPtWFes1MTDUzZB27/2MvKnyUnxqnWo5SiEfV7pxj/y3U5uTCbFUK
         CQvFs97d7Pz9YrajRrK4Qyx3aECIiUBWI5PNsWyvgiO6E+1fjSYKzbOOiG8a+Skj/Fk8
         pSNjGD6eWzPcfgUDB35ng+T4pvkLjriOGilbLxpga3nyc+iXTliNE9SKNbhWXwUAD0IT
         swMg==
X-Forwarded-Encrypted: i=1; AFNElJ/94d3bW8vzNVh+ztOSmJKI/x+ssCfDDc31yfvwPAZukcGXWB1Q2vjP72doD3G4DZmcSG9wXOl7DxPa6VNXpUlSUV2EEw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1RwuXTC/kan64hGN6iIGybffkT/1ksxk3gwTlNhl1zEXeLo+P
	7YcgasRH3O9y64hcfmaW1DfjNOnq/TxQpYffx6kbQT65bbZeUH0lzOw1
X-Gm-Gg: AeBDiesPRqcjQ2VO0tL9/qLjp3eHRNgYokAhZBADK5wsAzpgQv2l9UdIdxpFqsW8F5l
	Y63Py4/E0k9L74nvPVmkcBSWfAbvQyB80MYBXoETUPNwIrgn22vu9tEplgy14nYYQbIzBl/Yhln
	u15hkOb8RRNO/IUl1kUTCGdJS2hQafpKwaj4sxW18DYHJ3AtXaInDr4GrqCzcBVYAdohb5zAVP8
	ufEYxS55UlnER3IU6WI9IzFCu4APap6qq8Z9QlM3Iet5mYcLRM7wlCruiabNuhQOPxotLMHOplC
	0OCL6Em2wIlTZdIhOhx9YcoofzSdjVzbMdjhFNjCaBuOfjocU70UwrU42gm8ajeSptcOviyLmkr
	Q+fIyh0QnHMidnFtnE0KwQ+HF8rIVaaiNbrao8QH4RA7YYGZ1H2CygZebuEzEkcKrX3rWHWgnlv
	IuOza2AQi7Mf5Kobzd6XWol0ZiVdc4RD0ZQd1/pXHac2k3iJIDe77DDMWg2g==
X-Received: by 2002:a05:6a00:aa08:b0:82c:66f2:1226 with SMTP id d2e1a72fcca58-82f8c8e4febmr15916913b3a.38.1776739892565;
        Mon, 20 Apr 2026 19:51:32 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9d9a1csm12823502b3a.20.2026.04.20.19.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 19:51:32 -0700 (PDT)
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
Subject: [PATCH v2 1/2] Bluetooth: ISO: Fix data-race on dst in iso_sock_connect()
Date: Tue, 21 Apr 2026 11:51:21 +0900
Message-ID: <20260421025122.55781-2-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260421025122.55781-1-suunj1331@gmail.com>
References: <20260421025122.55781-1-suunj1331@gmail.com>
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

Fix by reading the destination address directly from the local
sockaddr argument (sa->iso_bdaddr) instead of iso_pi(sk)->dst.
Since sa is a function-local argument, reading it requires no
locking and avoids the race.

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
 net/bluetooth/iso.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/bluetooth/iso.c b/net/bluetooth/iso.c
index be145e2736b7..290a1b9a9daa 100644
--- a/net/bluetooth/iso.c
+++ b/net/bluetooth/iso.c
@@ -1193,7 +1193,7 @@ static int iso_sock_connect(struct socket *sock, struct sockaddr_unsized *addr,
 
 	release_sock(sk);
 
-	if (bacmp(&iso_pi(sk)->dst, BDADDR_ANY))
+	if (bacmp(&sa->iso_bdaddr, BDADDR_ANY))
 		err = iso_connect_cis(sk);
 	else
 		err = iso_connect_bis(sk);
-- 
2.52.0

