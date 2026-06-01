Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B2B3A2E27
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  1 Jun 2026 11:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780312769; cv=none; b=dFiTX7QqoFlw2wgNyq5aZP3CZtIjf1RKLDrtF+1H3dVeIDKbruUwqWkd6EknS+seH+TbJKya870yx5Otvzb0Su18myetrdRrWOOrK5FwkpaQgEsAGdS0BU/dotsPT/wNGb5kw8OqonHh5Sm/lWUzMbjiL5Zaipk+YH4nGy8qe3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780312769; c=relaxed/simple;
	bh=r1b7vn+lGatrknXbAvVwotu7fWbwwO872DxkoS8HYHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dtn4W1MFS3bzC9F/wLISinfjPkx0QY9yhwrVjPglW1MZEacWI33+YWlXsQrMJFRrh2pTUnxfC6CI11tdIjUZRibj1NKxAUIbtza1yeOH/myTXNh/2qtQNIhjsRuS3TIxO+O13zq48yl9i5ex0lPK480WtdBGy3Cq+0Wpya3G0kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l6lu1RjJ; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l6lu1RjJ"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c0c2d8b95bso7983385ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 01 Jun 2026 04:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780312767; x=1780917567; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=trLwXz/lpaWzxovhRJBB3Gy3OOIDVqjW6QaVX3Vvw88=;
        b=l6lu1RjJUkhOhDfILDRnOUC/iAnKcs6txWUUO0PFqOHm1WzbLEXphaVg84K/6HdJdP
         ejwGMnbhzcjHD59mSFsaMV24zFUcwRpXD1VqcpQsOckDmpDdJvOfJdJsidYkTBMG1Cs/
         AqNXvH98wufjvpK0l6Jc1ReQmndM2fsJCB9vf2ck8mNxNMLdGmxgQjvfmc721P2Kt6hq
         rd441NOf3cS6sXUgAntejhpsS5xBXCxDwioMxugzDkn7mlolT/xHfzmyenceoIumyNor
         YItzcrIvldsvksJfi4Rdx7jeuER9uzoy3m9YF20JvVn07iTlf/MaJY6zFFoqACd6px9W
         zJkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780312767; x=1780917567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=trLwXz/lpaWzxovhRJBB3Gy3OOIDVqjW6QaVX3Vvw88=;
        b=FEFc/sVlbsbNs5qps6srk96/z2htMZH+KG0U8bpPiD80IeNBpoTQkYT9l9t7obyKZg
         eylzba9IoNLm1PDslGTqTetxTOUk2yCWbVRcgR5g6kKT5B5DBol1FaJK3pVDTwLGdX2J
         /sX7IWhOY/DtaTtlsRo+VxmJ2fqvSJ9RjgNue2wSaSeLEvifSsySrBT/aJMspTBhz0qN
         zOEkJcb2cX7R7lWbNN5h4YkQb1FQL51i4759pLvu/Dpw1x6A8pEfdtnwWmELyk5s/t2s
         RbyIf08Sppn/qvtBbmv/KK686MsmOgiDVEdqQbvauZv9BpobPrT5tNpg2plCoE4uV8vt
         8yzQ==
X-Forwarded-Encrypted: i=1; AFNElJ9jo1pfqKpqvCeRQDRk+0G8sh/hOUChsbK8l0Zp/exb9Lh8HDLVFCgAyM1hO+Dvne+rg5BZM4u/EBXuBNbxk2C3iYqUAw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwO/B85BeKAdyq+d+Vktdv1XdMrodItZuzu94/Z9rJ3t3GWm+d7
	I2jdfToneexR5Z3fzmMfxECTV5qaLRBYsDaN+oNTw8VvMiLmTjNCVRPk
X-Gm-Gg: Acq92OFTtnyZ6grQ9Okk3Ub2MGbEV4r3b0itRBxaZaQbcwVYCFCaXlrn5m4FHbRAWeC
	NAB0yZgbw+0SHSryRcBkMXrtNFwZP3pP2DpMYS+J3sVxZTyuQCInbgTCfO5rbnG3JQ5lWcFZLBa
	+aw50E1pX23vKy+WajEdXtauHX2eFLiZpPREjJysn6+BB757pZeJVDr4MGjf3Rn0XjNO5OhJKOH
	3xsYb5R40TOA3rjZO8SPs8BhD4rY2rSELIdspEVuoyMv9YGbcpXKW/WVy6IWXxV+k0EjWqfXDuq
	vWrwkCEmD3xHmRehnPW0p4JcrfViwtgFg2FkCLkRp73tMq0YLYOmzQXQXtbErNPrW+wf8JWwb4E
	NGytGUmm+abL65Oz5diQOKUNeoU8aFoMlCGutwwWMgRqbiyd2VQ2as4eHZ/ANRnGuNWtZJgwZCx
	FDJ+H5IPbRqaPeN7qMdpTs3jIlYhLMvoWkDsnZbe0kRD7NHPM2h/U5PsMDRw==
X-Received: by 2002:a17:903:28d:b0:2c0:a555:80d6 with SMTP id d9443c01a7336-2c0a5559517mr100032355ad.2.1780312767090;
        Mon, 01 Jun 2026 04:19:27 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e702fsm104225475ad.4.2026.06.01.04.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 04:19:26 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	me@brighamcampbell.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH v2 1/2] Bluetooth: ISO: Fix data-race on iso_pi fields in hci_get_route calls
Date: Mon,  1 Jun 2026 20:19:07 +0900
Message-ID: <20260601111908.232707-2-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260601111908.232707-1-suunj1331@gmail.com>
References: <20260601111908.232707-1-suunj1331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

iso_connect_bis(), iso_connect_cis(), iso_listen_bis(), and
iso_conn_big_sync() call hci_get_route() using iso_pi(sk)->dst,
iso_pi(sk)->src, and iso_pi(sk)->src_type without holding lock_sock().

These fields may be modified concurrently by connect() or setsockopt()
on the same socket, resulting in data-races reported by KCSAN.

Fix this by snapshotting the required fields under lock_sock() before
calling hci_get_route().

BUG: KCSAN: data-race in memcmp+0x45/0xb0

race at unknown origin, with read to 0xffff8880122135cf of 1 bytes
by task 333 on cpu 1:
 memcmp+0x45/0xb0
 hci_get_route+0x27e/0x490
 iso_connect_cis+0x4c/0xa10
 iso_sock_connect+0x60e/0xb30
 __sys_connect_file+0xbd/0xe0
 __sys_connect+0xe0/0x110
 __x64_sys_connect+0x40/0x50
 x64_sys_call+0xcad/0x1c60
 do_syscall_64+0x133/0x590
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Fixes: 241f51931c35 ("Bluetooth: ISO: Avoid circular locking dependency")
Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
---
 net/bluetooth/iso.c | 60 +++++++++++++++++++++++++++++++++------------
 1 file changed, 44 insertions(+), 16 deletions(-)

diff --git a/net/bluetooth/iso.c b/net/bluetooth/iso.c
index d7af617cda45..b4196ccaf766 100644
--- a/net/bluetooth/iso.c
+++ b/net/bluetooth/iso.c
@@ -337,12 +337,20 @@ static int iso_connect_bis(struct sock *sk)
 	struct iso_conn *conn;
 	struct hci_conn *hcon;
 	struct hci_dev  *hdev;
+	bdaddr_t src, dst;
+	u8 src_type, bc_sid;
 	int err;
 
-	BT_DBG("%pMR (SID 0x%2.2x)", &iso_pi(sk)->src, iso_pi(sk)->bc_sid);
+	lock_sock(sk);
+	bacpy(&src, &iso_pi(sk)->src);
+	bacpy(&dst, &iso_pi(sk)->dst);
+	src_type = iso_pi(sk)->src_type;
+	bc_sid = iso_pi(sk)->bc_sid;
+	release_sock(sk);
 
-	hdev = hci_get_route(&iso_pi(sk)->dst, &iso_pi(sk)->src,
-			     iso_pi(sk)->src_type);
+	BT_DBG("%pMR (SID 0x%2.2x)", &src, bc_sid);
+
+	hdev = hci_get_route(&dst, &src, src_type);
 	if (!hdev)
 		return -EHOSTUNREACH;
 
@@ -430,12 +438,19 @@ static int iso_connect_cis(struct sock *sk)
 	struct iso_conn *conn;
 	struct hci_conn *hcon;
 	struct hci_dev  *hdev;
+	bdaddr_t src, dst;
+	u8 src_type;
 	int err;
 
-	BT_DBG("%pMR -> %pMR", &iso_pi(sk)->src, &iso_pi(sk)->dst);
+	lock_sock(sk);
+	bacpy(&src, &iso_pi(sk)->src);
+	bacpy(&dst, &iso_pi(sk)->dst);
+	src_type = iso_pi(sk)->src_type;
+	release_sock(sk);
+
+	BT_DBG("%pMR -> %pMR", &src, &dst);
 
-	hdev = hci_get_route(&iso_pi(sk)->dst, &iso_pi(sk)->src,
-			     iso_pi(sk)->src_type);
+	hdev = hci_get_route(&dst, &src, src_type);
 	if (!hdev)
 		return -EHOSTUNREACH;
 
@@ -1208,18 +1223,25 @@ static int iso_sock_connect(struct socket *sock, struct sockaddr_unsized *addr,
 
 static int iso_listen_bis(struct sock *sk)
 {
-	struct hci_dev *hdev;
-	int err = 0;
 	struct iso_conn *conn;
 	struct hci_conn *hcon;
+	struct hci_dev *hdev;
+	bdaddr_t src, dst;
+	u8 src_type, bc_sid;
+	int err = 0;
+
+	lock_sock(sk);
+	bacpy(&src, &iso_pi(sk)->src);
+	bacpy(&dst, &iso_pi(sk)->dst);
+	src_type = iso_pi(sk)->src_type;
+	bc_sid = iso_pi(sk)->bc_sid;
+	release_sock(sk);
 
-	BT_DBG("%pMR -> %pMR (SID 0x%2.2x)", &iso_pi(sk)->src,
-	       &iso_pi(sk)->dst, iso_pi(sk)->bc_sid);
+	BT_DBG("%pMR -> %pMR (SID 0x%2.2x)", &src, &dst, bc_sid);
 
 	write_lock(&iso_sk_list.lock);
 
-	if (__iso_get_sock_listen_by_sid(&iso_pi(sk)->src, &iso_pi(sk)->dst,
-					 iso_pi(sk)->bc_sid))
+	if (__iso_get_sock_listen_by_sid(&src, &dst, bc_sid))
 		err = -EADDRINUSE;
 
 	write_unlock(&iso_sk_list.lock);
@@ -1227,8 +1249,7 @@ static int iso_listen_bis(struct sock *sk)
 	if (err)
 		return err;
 
-	hdev = hci_get_route(&iso_pi(sk)->dst, &iso_pi(sk)->src,
-			     iso_pi(sk)->src_type);
+	hdev = hci_get_route(&dst, &src, src_type);
 	if (!hdev)
 		return -EHOSTUNREACH;
 
@@ -1564,9 +1585,16 @@ static void iso_conn_big_sync(struct sock *sk)
 {
 	int err;
 	struct hci_dev *hdev;
+	bdaddr_t src, dst;
+	u8 src_type;
+
+	lock_sock(sk);
+	bacpy(&src, &iso_pi(sk)->src);
+	bacpy(&dst, &iso_pi(sk)->dst);
+	src_type = iso_pi(sk)->src_type;
+	release_sock(sk);
 
-	hdev = hci_get_route(&iso_pi(sk)->dst, &iso_pi(sk)->src,
-			     iso_pi(sk)->src_type);
+	hdev = hci_get_route(&dst, &src, src_type);
 
 	if (!hdev)
 		return;
-- 
2.52.0

