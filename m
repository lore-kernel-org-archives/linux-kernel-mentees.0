Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3A0386C25
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 29 May 2026 17:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780076057; cv=none; b=u2LVp5UXhdSFfGRjjnXUaginAvYggxHsT0Q3LBVO7NRdDHgeaF0bW9gXdXm1Yo9LNuT7EkWApZDXPYQ+E611QTL6Q3I8Y2eeim/01GSCxUOkUmdaDrsSc5ZgORlIPcg99cq0poCMOyPHIGDvEHd7MtNGiCaGCqy6V+UxsCVZtFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780076057; c=relaxed/simple;
	bh=azSALTPQ56sMNNtKHXYrGxYYobQm99m8pEWlJiJK9HM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aSMEGBfTZIEVPp8nIMj2Gm1y4Q0yroR9zjg9u7+TbfiJBcNPkMZYrdCyRZe5D+uhKlhXFFLMi4nacp2qnE4hb5WS3XTUmQFUrkd/e2XtvGH4nKtdRjtNugcNwpNfsuYKgtKLg8tGCC/j0MIwd0FaBFD32AfHgLC3/46qEymMgLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dGsk2U1R; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dGsk2U1R"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c8573e75425so394592a12.2
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 29 May 2026 10:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780076055; x=1780680855; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=inVdfYyaHrC2ebCMrnnMifw7kxLNFvRNmB5wGenE+qI=;
        b=dGsk2U1R9ywT1NOno2DEwDJOeVYSGPCYEluug6mHUSaQN7YL0hfC04t+l1UXqMRq7F
         kugS8xFCCYnujJ/DY9HzAgoyPWmBlMz/JV4gdJBRVdzaZcpVK5wJ1rKpQYOY2GzM9NpF
         jmFVE0S5pYpfzWw1JUPggMp2aPEk9yCxQDmvc8OhjPuYDMpl6XwwDReDlWLWUEg5/Yuj
         xnPmx+wsucnNvfWfVdpmTU3RThZX+EyEJC1p4Haes2Yc10Qi8aDjY57V0LzzFqJNhMqw
         FBPcInn3Hx0dbetGfQ/vhqCPf4sYftz5vNQZ9tJAmW3ahjGZFiUyN4Atu3dUkrFiVLER
         ZGmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780076055; x=1780680855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=inVdfYyaHrC2ebCMrnnMifw7kxLNFvRNmB5wGenE+qI=;
        b=ZHotsarTSj59ZEUJdRyOJUdxVhHe8zLKOB3L4xtJWSRWnIZbqI8OIF7UoO3z/E04NL
         WASHeQJbhwR6wvwAbIOJ3OlPPNDuH3U+WMA+MhxyOUm3fPukDgzpLDk3ZNfw6LiONsqI
         3EbD9CiyjBIryaH9MyDvfwQa3s3tHoObd4dBHpgF4rosTRY4kFr1QEt7pHVwQ1lJoJiv
         0Krc9+92Uz0dG1eoFRA1qhZmU85fdgFxKJe1WL1kca9DRxo9+7s/xsdHHmDD+feHpYse
         aFhmCTvx9oqsr1pPjCuNBewoxlOQrdV58Dhn6BSA0ZDIcmD3XllQSBr2bbIgU8PSCCMX
         3qhw==
X-Forwarded-Encrypted: i=1; AFNElJ+Y16XvgyZFw2tb/PiBiU+RAHmfcyFL9LZPMalYm1WCzfoUH5qrHS5L0kJqsOMNX+bYX3RmQOiEo8vtiFUo0i4nYBw/jQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwCaeINw5G1MEV+npiYt7AnHbEdrKa642ZdniHxf2mxYfSv6xNu
	+IhltKZ+dXaeHh73VPqF1kzSYNedZ0D0z1V1RbNhOT2oAgVuGJJFg6Pd
X-Gm-Gg: Acq92OFjkgcj+axGSXxtcsfF5YiTg9iPRf3snF7Zxgb4m95z0j1MON/kUSuXyl03UnH
	ttz1TPpFr65HR9eAEq6YkljV49fWMBCSvaep4dd+ex4+v7PpTupzeMvIEXl/2seeTxtaJG6RUH5
	Ue2Dpioer9LiCmTJRGVYeQsUdmhFRuM0iD4r+Rdy7AAUyPSlm6xFeVlCl/wHNyeH4i097G5EE7Y
	D+kcstBm+Xyr+cSHNoeN1vp/BDO8bdxnZBqAfCnI49vMfZ6L0X/YfFHAaXnhnbuPrZ2M+Bjzx4Q
	GjRZ3T1bmglz35gDPAbKYbPpn7W6Ylgwd6rEycmzF4KoZzYcMbiHJ7yqsb1FG+yBWh6JG+2tSki
	Sih3RW67PphbhAdpGIV1K8OH/dNWvNqBU1vDFWmVtrODwh+8WrCrWXvJQYQh51MTcWB76t9Gh6z
	tdOmTHZwQKq99CwSTIxhHe2pu8SE7W4xzQ94mEGRI78Z1e7gMmi2MUysIvlw==
X-Received: by 2002:a05:6a21:4e01:b0:398:840d:39aa with SMTP id adf61e73a8af0-3b427f7611dmr225863637.29.1780076055124;
        Fri, 29 May 2026 10:34:15 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85772ba4adsm2361027a12.23.2026.05.29.10.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 10:34:14 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	me@brighamcampbell.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH v1 1/2] Bluetooth: ISO: Fix data-race on iso_pi fields in hci_get_route calls
Date: Sat, 30 May 2026 02:33:46 +0900
Message-ID: <20260529173347.43967-2-suunj1331@gmail.com>
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

iso_connect_bis(), iso_connect_cis(), iso_listen_bis(), and
iso_conn_big_sync() all call hci_get_route() reading iso_pi(sk)->dst,
iso_pi(sk)->src, and iso_pi(sk)->src_type without holding lock_sock.

These fields can be concurrently written by another thread calling
connect() or setsockopt() on the same socket, leading to torn reads
or TOCTOU mismatches.

Fix by snapshotting dst, src, and src_type into local variables under
lock_sock before calling hci_get_route() in all four functions.

BUG: KCSAN: data-race in memcmp+0x45/0xb0

race at unknown origin, with read to 0xffff8880122135cf of 1 bytes by task 333 on cpu 1:
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
 net/bluetooth/iso.c | 51 ++++++++++++++++++++++++++++++++++-----------
 1 file changed, 39 insertions(+), 12 deletions(-)

diff --git a/net/bluetooth/iso.c b/net/bluetooth/iso.c
index d7af617cda45..58bb3a10d49f 100644
--- a/net/bluetooth/iso.c
+++ b/net/bluetooth/iso.c
@@ -337,12 +337,19 @@ static int iso_connect_bis(struct sock *sk)
 	struct iso_conn *conn;
 	struct hci_conn *hcon;
 	struct hci_dev  *hdev;
+	bdaddr_t src, dst;
+	u8 src_type;
 	int err;
 
-	BT_DBG("%pMR (SID 0x%2.2x)", &iso_pi(sk)->src, iso_pi(sk)->bc_sid);
+	lock_sock(sk);
+	bacpy(&dst, &iso_pi(sk)->dst);
+	bacpy(&src, &iso_pi(sk)->src);
+	src_type = iso_pi(sk)->src_type;
+	release_sock(sk);
+
+	BT_DBG("%pMR (SID 0x%2.2x)", &src, iso_pi(sk)->bc_sid);
 
-	hdev = hci_get_route(&iso_pi(sk)->dst, &iso_pi(sk)->src,
-			     iso_pi(sk)->src_type);
+	hdev = hci_get_route(&dst, &src, src_type);
 	if (!hdev)
 		return -EHOSTUNREACH;
 
@@ -430,12 +437,19 @@ static int iso_connect_cis(struct sock *sk)
 	struct iso_conn *conn;
 	struct hci_conn *hcon;
 	struct hci_dev  *hdev;
+	bdaddr_t src, dst;
+	u8 src_type;
 	int err;
 
-	BT_DBG("%pMR -> %pMR", &iso_pi(sk)->src, &iso_pi(sk)->dst);
+	lock_sock(sk);
+	bacpy(&dst, &iso_pi(sk)->dst);
+	bacpy(&src, &iso_pi(sk)->src);
+	src_type = iso_pi(sk)->src_type;
+	release_sock(sk);
+
+	BT_DBG("%pMR -> %pMR", &src, &dst);
 
-	hdev = hci_get_route(&iso_pi(sk)->dst, &iso_pi(sk)->src,
-			     iso_pi(sk)->src_type);
+	hdev = hci_get_route(&dst, &src, src_type);
 	if (!hdev)
 		return -EHOSTUNREACH;
 
@@ -1210,11 +1224,18 @@ static int iso_listen_bis(struct sock *sk)
 {
 	struct hci_dev *hdev;
 	int err = 0;
+	bdaddr_t src, dst;
+	u8 src_type;
 	struct iso_conn *conn;
 	struct hci_conn *hcon;
 
-	BT_DBG("%pMR -> %pMR (SID 0x%2.2x)", &iso_pi(sk)->src,
-	       &iso_pi(sk)->dst, iso_pi(sk)->bc_sid);
+	lock_sock(sk);
+	bacpy(&dst, &iso_pi(sk)->dst);
+	bacpy(&src, &iso_pi(sk)->src);
+	src_type = iso_pi(sk)->src_type;
+	release_sock(sk);
+
+	BT_DBG("%pMR -> %pMR (SID 0x%2.2x)", &src, &dst, iso_pi(sk)->bc_sid);
 
 	write_lock(&iso_sk_list.lock);
 
@@ -1227,8 +1248,7 @@ static int iso_listen_bis(struct sock *sk)
 	if (err)
 		return err;
 
-	hdev = hci_get_route(&iso_pi(sk)->dst, &iso_pi(sk)->src,
-			     iso_pi(sk)->src_type);
+	hdev = hci_get_route(&dst, &src, src_type);
 	if (!hdev)
 		return -EHOSTUNREACH;
 
@@ -1564,9 +1584,16 @@ static void iso_conn_big_sync(struct sock *sk)
 {
 	int err;
 	struct hci_dev *hdev;
+	bdaddr_t src, dst;
+	u8 src_type;
+
+	lock_sock(sk);
+	bacpy(&dst, &iso_pi(sk)->dst);
+	bacpy(&src, &iso_pi(sk)->src);
+	src_type = iso_pi(sk)->src_type;
+	release_sock(sk);
 
-	hdev = hci_get_route(&iso_pi(sk)->dst, &iso_pi(sk)->src,
-			     iso_pi(sk)->src_type);
+	hdev = hci_get_route(&dst, &src, src_type);
 
 	if (!hdev)
 		return;
-- 
2.52.0

