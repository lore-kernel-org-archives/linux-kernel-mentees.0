Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60416381B13
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 10 Apr 2026 10:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775817766; cv=none; b=N7VMl+E0Z3zefTD0pbktaoBqQrXUAOGr5XshDH1PJ8PMm+CHYP8MfQOKDH1GHun0t1FTXdMkmlz8tkQj0MUdvOPg4WJhDCr+xUkJ51i5yTic3QMy6PIQuGZQhUc0XUP93XwbVg378RymM/MF5M6M9fuBm3x2Got78LoP+Lq0zDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775817766; c=relaxed/simple;
	bh=x3vbm8dzITfs2TJ7MgGNykoYMSBX/YyGWE+qZBJOPho=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aXL5Gu6/MjyMbUERd86Ijy8pDCzPA2bEAlz4JmIyLQfV0BnyTz+/oS4QKqaLiLAxKPpZzaH2NuAUjmG3QS7hFYrqeEHXX6zs8HhU3ni2G3fldPUJVOmiUPcb/4KsiJUEfRfwAB1AdKZDMvgq8Rd8u1BB4pfucEnp1ML7VuZYci4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WnlwDQ8n; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WnlwDQ8n"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35dac556bb2so1280408a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 10 Apr 2026 03:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775817765; x=1776422565; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HeexHBGM6m9iUjQldRYMFqUMdoXfHrQClpu5bKv1pA4=;
        b=WnlwDQ8nKH7qhjlKrmkLoRU1LDvklergvjeyFgl+TmaBOPvYM9DBE5qSXreezVJAtU
         EwH+JmPOAfbEu1eM90l34WXADxukba0ouo3J0ETAIImf9FnjYl2WBx+IwO2oE799bR3s
         WO6eIDR2Vsm2jj6yqI3NJNOHCKEhRxQPVaacM0HcbyS+CtRLxGJSP/slgezyemj2F91S
         TGSe5u8wwH8CuE/ViNwJN/6GKpLaDkRh8XBwWYSj7yjO1Evk9JpFejO8n5vonczCCmWs
         eM585jolhtW/CmMHHiu+YOl3R7i4X48TOixInlEukkKw/hibquEBv/CB7D/CeZMx7DWk
         YPZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775817765; x=1776422565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HeexHBGM6m9iUjQldRYMFqUMdoXfHrQClpu5bKv1pA4=;
        b=ZEaoaojdipouaDZY0EYKnSNmKao6/nCgza7i/JlxAM0ctj4fPyCHbyAHKTif8Werw5
         URC+NCM3VBecp2aZb5tW+Huqzdqtab6Rmo+3S7zPI7ErRfpVPmvlUivEnIvKlgjHp+tq
         NnaJCFb3m66yn7heH0/1Q2cJTD49ZcXJQLkvYmsh/NsRYInvELj//u8PTGvnLoSYqMCh
         Iv/E//M3n5bvmIKRdAl+d+tRV9PcPtIY9wBDyGDE8G3Ol+pnnfzPJzDo6+TCNG0WJfK+
         XhqFm+STMAPBrFNgx5ugr3g8sG6OfA18/2DdLbkIJB9MqRGSeXPUnZJzxn3R0JIJbD7L
         Ch5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVv2HiylK8ek4GKD+L7Va1GUmZqn7mYCExW5lwPNcFlDHb02zQ7X82voBd6KoMtzl4OdMmu/+dSbLWB2GKTg6lH+avXKA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxCRBruDoyqe5a7vYKNQGXdFT/3KwwaAPxP/hBbyWtRn2r+LKZD
	Ly0c4U24MKw9ptG4s7Z/sIUMmsrJA7kxRaMSpDjrQ9F+iw3Pd1UpebBH
X-Gm-Gg: AeBDiev2JRZF13B1ogmOqcwirHKLMVLKg20F9SeweWmYCAyc9j81IKYxiThUC4tcYZN
	fZK9Hxr+GluhIDZyk4n9F6Mh9Djjvlgz1CtadCCLtVlXG91DgbmAs/ajDUVk8RTUzsgJlNNaf3I
	i9Ln9Zdoqd/sDQbj7PIzEFlZ0k0lqsYV65S9Q8tIFK7GHj79IscvWXPt9q8mlvxl/VNMhqyEwyC
	ahZWm9hj9E+I40R5d0G8c7yrGMSO0jWj2psqmugdndaaNPWzx29HqHcIP53D6tLHRIGPtBaliut
	7k1o8KLYpheY6vp0R/+k0+LGJrhkoje3GLJCghmE5YkSMZUp7pZKbFj1oACL7aPyc25nuTVLYQR
	fQ0k4I0DeXZCzdddKqRkt6DEJyzCrRbQJXDwWNmNlCn5/yXKNdaq224RMfDCECz5K/TrBUPCYqf
	e+A6IzaxsEfT9BbYREI58tameTiCKiIuBebD++su7ay1vDDLw=
X-Received: by 2002:a17:90b:4c8e:b0:35b:9ab6:1d4a with SMTP id 98e67ed59e1d1-35e4280ebc7mr2927325a91.18.1775817764639;
        Fri, 10 Apr 2026 03:42:44 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e412233ddsm2904247a91.5.2026.04.10.03.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 03:42:44 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	johan.hedberg@intel.com,
	linux-kernel@vger.kernel.org,
	me@brighamcampbell.com,
	shuah@kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH] Bluetooth: hci_event: reject incoming conn request when MASTER conn exists
Date: Fri, 10 Apr 2026 19:42:22 +0900
Message-ID: <20260410104222.537901-1-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hci_conn_request_evt() reuses an existing connection without checking
its role. When the existing connection has the MASTER role (outgoing
connection in progress), conn->state is incorrectly overwritten from
BT_CONNECTED or BT_OPEN to BT_CONNECT, causing state machine corruption.

This can lead to use-after-free or state confusion when the connection
is later disconnected.

The issue was observed during VHCI testing:

  Thread 1: Local connect() -> conn created (role=MASTER, state=BT_OPEN)
  Thread 2: Remote Connection Request received
         -> hci_conn_hash_lookup_ba() finds existing MASTER conn
         -> conn->state overwritten to BT_CONNECT (no role check!)

Fix by rejecting incoming connection requests when a MASTER connection
to the same address already exists.

Fixes: 70c464256310 ("Bluetooth: Refactor connection request handling")
Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
---
 net/bluetooth/hci_event.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index 286529d2e554..3d34cf2e5067 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -3327,6 +3327,12 @@ static void hci_conn_request_evt(struct hci_dev *hdev, void *data,
 			bt_dev_err(hdev, "connection err: %ld", PTR_ERR(conn));
 			goto unlock;
 		}
+	} else if (conn->role == HCI_ROLE_MASTER) {
+		/* Reject incoming request when outgoing connection to
+		 * the same device is already in progress.
+		 */
+		hci_reject_conn(hdev, &ev->bdaddr);
+		goto unlock;
 	}
 
 	memcpy(conn->dev_class, ev->dev_class, 3);
-- 
2.52.0

