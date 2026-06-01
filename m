Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C543A2E2E
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  1 Jun 2026 11:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780312772; cv=none; b=c+Zx2nfwIv1Jjm4N4BOpAUoyjiytbhy/QOx/WcwiL4P0yHPTKrlLxeanXyhRF+LelLqhyAPsrM/yMu4PtGted5y3WIyrLYLfnbArfMsdtynkj12EuyHupBZPDLG8Yza944n4Iujumv7poRJWNZw7B0XJ5fUlINB9egSWeMK2/FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780312772; c=relaxed/simple;
	bh=nLlwcEjDLyC35i9VEjYSXKxZ0ADnNQQjIajXHU0cpAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HVYCLsWWo/J3Jq7qs+YgZV8ii0WFAO4jL8HE47zhpVMv/UtjzkUtcDVX+01ChatzgOlkDcGDkNvuPux2nVW0Dv1HFSenKpuJXKTWTUJ8W6mSe5fxL1OXI3WYV1dSJlG1An65CPD6jcqFz/reBCurUdltp0rpcyttisdhBoPvd/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N2ZPcBbD; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N2ZPcBbD"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2bf18c30bb2so24327765ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 01 Jun 2026 04:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780312771; x=1780917571; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ikdg5vb/DoCVKkC8Joypvv5J8aYetWNjGyB7PGOMDRs=;
        b=N2ZPcBbDThnol0oxMvxaQtWs4FCN295bf4XxrJ7v9Zru+Vx9ntUvPWTUvcdz1hwbbP
         bQ2EHiC1n41bPdL9hugozX0dhxFIpSp6oXyu9rb73VXpiTmNi7DpVO/dwAnCVFfyRIR3
         EEBcpBx0xj/ixZTXHK6WdXEe4fEinJFPf/JYRzYXJaszD3A7CDh6BDue7QvWuLzR5DiE
         R4XUrR6ZgQfZRqWtoNgajSgERcLhN0Ylo3plEnke016hzLdps0rdxJKBxb31vhWqqhiz
         3Ph3kqIfuCvPjIryHdQeXPfN8WuP09YaNrYjjqnKEujUypLVBePUSZkGbTzMlT4iiKN7
         ppBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780312771; x=1780917571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ikdg5vb/DoCVKkC8Joypvv5J8aYetWNjGyB7PGOMDRs=;
        b=FIKpIXNFvMlMdpNwsIv1+k/fsY5Wx1D4zAirJ1DOb/iN3FhYIuR2TIrHCfLa9xVEPU
         CvK0O3dd7Wz0kchR7OANBWGuDP2R0PIPTDiZqREthkLDDgnA9zCJOghYztD//yiNGAk5
         9ll6TeFpF/ucjsq4IhZeurxnCy+RaREQVhrjKWCdzuN+46c+J8j65bdMxa4P4/vkZPvT
         sLggXHR1hN8EqjEAGs/krZOvGhjootnjcdUlujtwgqc2XYqUN4bioP2ko05bCDrB+VVf
         2LnxLcGD95CrR4cXsez1OKuciah63NMR8AzWR1Rx2JYTYm5l9SoIUwDL7Uua25PqQQFk
         /eVA==
X-Forwarded-Encrypted: i=1; AFNElJ8CBXuSZMRgzrItUsCckkO2vNuHOA5d4LrO1r4/bXbnLSgD3QV0bfDFyAAkHk6d7YL+8gDjF28Hsa76cJRfs8OFahvsfA==@lists.linux.dev
X-Gm-Message-State: AOJu0YymIb+v+2KtB651hZzMgMAmV1/E6NjFDo7sRkc91pf5Dg7jy6Wq
	e8ZAW3JwXeLq+JJQcOyoC78cefNno50MHz+AV8FSUT0rTMUp+RioQaLc
X-Gm-Gg: Acq92OFHW4p3Iz2vrPGpmqGTyIgGq0REJzw9jY5FQlzF5UGNcfsYdYuDYfAv0IfJoy+
	bizXCkJm4D+zpBvyuykTrC7W/VlnWLKlWPrgbjdoeuxAnPRtYkdLuttmU4LCBstdjHv7nbaHiIq
	EGaG/aBY8I5Fn6Koa+7tulDivrLNrk5KgtID9E5rJnpYKigDF5RUoKb1Yjs2BNmLwsn3p4AacYO
	zhPvoxV14dk+zBe4hsQaXutsthAhrmGrqO0Nt7yVHOIO7EOsMtm9S1wBeYJMIiYujABp1Ya3Ekg
	gRfsUsHsJknY8SGAnaTpl/FGaOuZVfWiAq2M2qYyMn3zBkzmpkfT1tYihzCsN3kfCAz+NrPYgJj
	9gIEYmeyZDclp97ywtBfa9BxztDjhjziAnhJaRsJRZd6Q6oEt47ldIJSMzr5IRWtF4PIHoPf625
	2xEvXbSIm3OMoBwtI2yJOzHBklGMsMJFO6CRQ63Wx/jtc3iP9wHZipQ7+pACz0K3A6DmGL
X-Received: by 2002:a17:903:46cf:b0:2c0:c625:400d with SMTP id d9443c01a7336-2c0c6254383mr63119995ad.37.1780312770646;
        Mon, 01 Jun 2026 04:19:30 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e702fsm104225475ad.4.2026.06.01.04.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 04:19:30 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	me@brighamcampbell.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH v2 2/2] Bluetooth: SCO: Fix data-race on sco_pi fields in sco_connect
Date: Mon,  1 Jun 2026 20:19:08 +0900
Message-ID: <20260601111908.232707-3-suunj1331@gmail.com>
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

sco_sock_connect() copies the destination address into sco_pi(sk)->dst
under lock_sock(), then releases the lock and calls sco_connect(),
which reads dst, src, setting, and codec without holding lock_sock() in
hci_get_route() and hci_connect_sco().

These fields may be modified concurrently by connect(), bind(), or
setsockopt() on the same socket, resulting in data-races reported by
KCSAN.

Fix this by snapshotting dst, src, setting, and codec under lock_sock()
at the start of sco_connect() before passing them to hci_get_route()
and hci_connect_sco().

BUG: KCSAN: data-race in memcmp+0x45/0xb0

race at unknown origin, with read to 0xffff88800e6b0dd0 of 1 bytes
by task 315 on cpu 0:
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

Fixes: 9a8ec9e8ebb5 ("Bluetooth: SCO: Fix possible circular locking dependency on sco_connect_cfm")
Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
---
 net/bluetooth/sco.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/net/bluetooth/sco.c b/net/bluetooth/sco.c
index f1799c6a6f87..140869e5b2df 100644
--- a/net/bluetooth/sco.c
+++ b/net/bluetooth/sco.c
@@ -312,11 +312,21 @@ static int sco_connect(struct sock *sk)
 	struct sco_conn *conn;
 	struct hci_conn *hcon;
 	struct hci_dev  *hdev;
+	bdaddr_t src, dst;
+	struct bt_codec codec;
+	__u16 setting;
 	int err, type;
 
-	BT_DBG("%pMR -> %pMR", &sco_pi(sk)->src, &sco_pi(sk)->dst);
+	lock_sock(sk);
+	bacpy(&src, &sco_pi(sk)->src);
+	bacpy(&dst, &sco_pi(sk)->dst);
+	setting = sco_pi(sk)->setting;
+	codec = sco_pi(sk)->codec;
+	release_sock(sk);
+
+	BT_DBG("%pMR -> %pMR", &src, &dst);
 
-	hdev = hci_get_route(&sco_pi(sk)->dst, &sco_pi(sk)->src, BDADDR_BREDR);
+	hdev = hci_get_route(&dst, &src, BDADDR_BREDR);
 	if (!hdev)
 		return -EHOSTUNREACH;
 
@@ -327,7 +337,7 @@ static int sco_connect(struct sock *sk)
 	else
 		type = SCO_LINK;
 
-	switch (sco_pi(sk)->setting & SCO_AIRMODE_MASK) {
+	switch (setting & SCO_AIRMODE_MASK) {
 	case SCO_AIRMODE_TRANSP:
 		if (!lmp_transp_capable(hdev) || !lmp_esco_capable(hdev)) {
 			err = -EOPNOTSUPP;
@@ -336,8 +346,8 @@ static int sco_connect(struct sock *sk)
 		break;
 	}
 
-	hcon = hci_connect_sco(hdev, type, &sco_pi(sk)->dst,
-			       sco_pi(sk)->setting, &sco_pi(sk)->codec,
+	hcon = hci_connect_sco(hdev, type, &dst,
+			       setting, &codec,
 			       READ_ONCE(sk->sk_sndtimeo));
 	if (IS_ERR(hcon)) {
 		err = PTR_ERR(hcon);
-- 
2.52.0

