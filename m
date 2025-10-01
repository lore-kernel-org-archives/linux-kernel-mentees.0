Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F7824DD11
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  1 Oct 2025 06:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759300880; cv=none; b=sN31vZTTJaLMSO03On9iBRlMtU+w45gItdxXiN6Sl5HxS31kOJQawGcvcRLq501nfReOyt/r/5C38+xVhUwBqz/i7iz2j6nYgY/mr1DaFPwCz8etQm/u2TP4x1ZWGcUPizdd5oG6u1z0+P07+Yu8/3u2XXhr5onR+wOx2bufspM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759300880; c=relaxed/simple;
	bh=733alPMo5xFF1kelhQ3Sbdb4fpf2EA/GpXViQ8Pcwmw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JiUrOCVBXnsNIiq2fYuI3rCb8IjT6OohSuGaNyZL+7LpSPRMHlIOZ0LSxvSXDSWOksdN84d+Fz9O/HldwV1DHaJD9Vo/lZWMBG06n5XusN0BQdmHYA6mDVvjWEJhmidHlZIdvwE7TES0G9AN9vDb6hFKma4TlDAKzS1fcet2rJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O5w2don+; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O5w2don+"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E876340FB5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  1 Oct 2025 06:41:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H7tj0aUA9end for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Oct 2025 06:41:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=bhanuseshukumar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 45F3E40ECD
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45F3E40ECD
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=O5w2don+
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 45F3E40ECD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  1 Oct 2025 06:41:17 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-77f605f22easo6266528b3a.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Sep 2025 23:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759300877; x=1759905677; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TEMQeJoNXQ2TFdkyWQlMH+1Sa/KHapB9H0jMKRUjLZ4=;
        b=O5w2don+Oz7FyKBMsCD9WBe6Eb+Ojp9/efX+SE5apQ7HoEi1OQuVJEzaPdc6bIiw+T
         hXtq5fnMSF6zvqb2rPv143x4/pNJVokpRy9yytZo/gO0kRVVdyAGHYR1vFCVE2xtBdEa
         sDpE8lLZ5RXPhPuy4CiflDaFwExWPLgAevlvPrJ6Yx7Y8FbZOCa3L/stQTTwPHiIM3ZO
         cLdeUx0oad/HNHLeAuwPoFHC3QYFLE3a7lVd0pD24OhmM0JdBcs3M7nOHpcwa73zBvvm
         fUm8S/yYpJ54K86ryHWXa/J1MAGoFzhsct6Fim3cRYuO+lOcr0kw+1kAE+htGmrp+bEh
         OTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759300877; x=1759905677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TEMQeJoNXQ2TFdkyWQlMH+1Sa/KHapB9H0jMKRUjLZ4=;
        b=JumjuWg2T8JRUoXuvPcZ0dtj82FN7DURoa8SazR3llshPqCRomjVo8zniRWlXYUtUJ
         kypVd3qyhx6vw0KSIAI0GoQkJVicuZINDlfXh37sSUW2tpo/JiDoeit0r83QxoOIdrCg
         QN+K5pdalOjdczDK/y/l70dxMhr1APQD+J0OGWAPSp4V1WyBghvHZCyZ7+zKycXGa2nJ
         3dnPCaplLI+e5QPjgslQj/46e+Ygs2KuDiq2j6WHqvBwosGTsC69kj+5p5ni1yiT0CCA
         Cm39DmVNbnONGGuZ1w2p6+cfCRBcpjPznmT4lqdMfd60KK58XH72BMSt6cNbnS7CMciV
         d9nw==
X-Forwarded-Encrypted: i=1; AJvYcCVNof0853Dm3dyq78xpYcFeiFHotIClA4c67r5qesbYj6MrtW9jtZblc+SKMg1JxI9p2V0RZFDLC8jV2FjKviCS+lz1eA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yyg/5IDExrMxZarwKs/zrJDJQKa6Hokr49y7wcIQ3ITRRr1Wxkl
	5mreD5wdRxq/E4s/c7MMHghJBQPTWzVo5JDvEX3nPAhbDWgFQBbO+vB3
X-Gm-Gg: ASbGncsRVgAkLyIoTEWWunAFOLY3/7Zq2FftxSKrxpe2DB4ODMCVcPkb/9IhYC+0I8s
	c2Y1fS5uhzS5MPDcvqzeAlJ0xijchnaO5x2vnTIA8ilcvwOvqdKG0jKZeq5KZQXsohuMZKGJeLR
	Yx2q6pXwdDdXoBXfeZeKCzHmYQgkIiFyX/6FJcl7fgjo0klZBT+bUeU+oJumTxqptaUAN8dnrN6
	RtlJMH2VLJVO6K2Z8SocEAaGSEPHYL/NV+5o8H6FVcR07eVtWo2bJPk5GEe3dfPyAiFjxCLwDv1
	9FC/DLee9qwPA53L1YaM6XqM5q/vz6Sabs4uciBpwUOba8YXL4DZdwwFLB/P4yvL78rKmG14dU+
	v04HfRVddD6vCxuzzw7V2ujk1i9dL9bGb3L2HKlHD/jxKmAy+Lj6eUxKPx1D9j7qayIanj+HRkR
	U=
X-Google-Smtp-Source: AGHT+IGO+/qpAj+fCORSmpzdGC/N4PpiP9VbFEiETHa8mmm7lLl7X7Do145SUj6rnWisCtK+VJZf/g==
X-Received: by 2002:a05:6a21:2703:b0:324:6e84:d16e with SMTP id adf61e73a8af0-3246e850bb7mr1305773637.43.1759300877200;
        Tue, 30 Sep 2025 23:41:17 -0700 (PDT)
Received: from ti-am64x-sdk.. ([157.50.94.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78126ae02dasm10351914b3a.21.2025.09.30.23.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 23:41:16 -0700 (PDT)
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Jon Maloy <jmaloy@redhat.com>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	bhanuseshukumar@gmail.com
Subject: [PATCH] net: doc: Fix typos in docs
Date: Wed,  1 Oct 2025 12:11:02 +0530
Message-Id: <20251001064102.42296-1-bhanuseshukumar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in doc comments.

Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
---
 include/linux/phy.h | 4 ++--
 net/tipc/crypto.c   | 2 +-
 net/tipc/topsrv.c   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/phy.h b/include/linux/phy.h
index bb45787d8684..de786fc2169b 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -292,7 +292,7 @@ static inline const char *phy_modes(phy_interface_t interface)
  *
  * Description: maps RGMII supported link speeds into the clock rates.
  * This can also be used for MII, GMII, and RMII interface modes as the
- * clock rates are indentical, but the caller must be aware that errors
+ * clock rates are identical, but the caller must be aware that errors
  * for unsupported clock rates will not be signalled.
  *
  * Returns: clock rate or negative errno
@@ -514,7 +514,7 @@ enum phy_state {
  * struct phy_c45_device_ids - 802.3-c45 Device Identifiers
  * @devices_in_package: IEEE 802.3 devices in package register value.
  * @mmds_present: bit vector of MMDs present.
- * @device_ids: The device identifer for each present device.
+ * @device_ids: The device identifier for each present device.
  */
 struct phy_c45_device_ids {
 	u32 devices_in_package;
diff --git a/net/tipc/crypto.c b/net/tipc/crypto.c
index ea5bb131ebd0..751904f10aab 100644
--- a/net/tipc/crypto.c
+++ b/net/tipc/crypto.c
@@ -1797,7 +1797,7 @@ int tipc_crypto_xmit(struct net *net, struct sk_buff **skb,
  * @b: bearer where the message has been received
  *
  * If the decryption is successful, the decrypted skb is returned directly or
- * as the callback, the encryption header and auth tag will be trimed out
+ * as the callback, the encryption header and auth tag will be trimmed out
  * before forwarding to tipc_rcv() via the tipc_crypto_rcv_complete().
  * Otherwise, the skb will be freed!
  * Note: RX key(s) can be re-aligned, or in case of no key suitable, TX
diff --git a/net/tipc/topsrv.c b/net/tipc/topsrv.c
index ffe577bf6b51..ebe993ebcd48 100644
--- a/net/tipc/topsrv.c
+++ b/net/tipc/topsrv.c
@@ -57,7 +57,7 @@
  * @conn_idr: identifier set of connection
  * @idr_lock: protect the connection identifier set
  * @idr_in_use: amount of allocated identifier entry
- * @net: network namspace instance
+ * @net: network namespace instance
  * @awork: accept work item
  * @rcv_wq: receive workqueue
  * @send_wq: send workqueue
@@ -83,7 +83,7 @@ struct tipc_topsrv {
  * @sock: socket handler associated with connection
  * @flags: indicates connection state
  * @server: pointer to connected server
- * @sub_list: lsit to all pertaing subscriptions
+ * @sub_list: list to all pertaing subscriptions
  * @sub_lock: lock protecting the subscription list
  * @rwork: receive work item
  * @outqueue: pointer to first outbound message in queue
-- 
2.34.1

