Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99EB2C11CC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  1 Oct 2025 11:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759316604; cv=none; b=eTNv3wQqhoPxrtxGXbtfaT9YCukCG+pA1UEMp+/B29fMeD4sa4Xj0vwkdpHJGxqJVR/HazdEnRkOAcqDp4sVPJs1Sa1TE7SZsU+5Anpy+RTjD5SOmze8GVRcu/Q3pulcPVpT7qGaevJce90/hDduPC4V4F8UOAQjD3/4G2MOyEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759316604; c=relaxed/simple;
	bh=ayH6eU74HGK2Uw8pBU8RG4fsbY2PSfyyn49rkqPJ7Vc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SdiPN6srLBcCC5QG1NOYsHMNFsrtvPhpChoTiwBz3HXIxCoiQWnOZkaF9W5nM25b3WHHHIn2Yikk3SEnam4f0uCzjG4NTjWiRbX5183NwQaINU4A77nb21fIAsbBH47kY9tJgGAxtHSlGEM5GW12/ICT3w9nOJDANilwhTHZ4sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PQTk4uKP; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PQTk4uKP"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77F6B410E1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  1 Oct 2025 11:03:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W7-8MoEgKrgO for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Oct 2025 11:03:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=bhanuseshukumar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8BC8C410E0
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BC8C410E0
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PQTk4uKP
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8BC8C410E0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  1 Oct 2025 11:03:21 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-33082c95fd0so7228802a91.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 01 Oct 2025 04:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759316601; x=1759921401; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9V28geYs6+fybVTeARjUscAK9N0tpW7+cMdGRd5q3Us=;
        b=PQTk4uKPvEF2fKX79ksvB6LzoQE0X357Wq2yb2N9HcCkV4Lxvvxj209Hycur+z5Fod
         iT96Hg5qmTiAcDGA/9HhnNOHvvkuOgCIPOD9bfpZt4m3bpG05/45O6XsEkOV8Nf/EmHB
         +WfuQavXOi77+evnFWFuFrGBluzHQvCDDoVOqjY9hMVebGfCpOJshanz6+1qxaBV5jJJ
         oi5P1oqcc9nIW4TSVn6hSRO8SHu3yDvpX7uQwXAEVwUOa8ZwXSv5fSe07M9FH3GyllWt
         U4XD4oZQY0nivHAms5PvMtl3JrVf/7HZxBE/gTge7TusO3ERgS0uub2uu0BB7ItM/YK7
         u21A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759316601; x=1759921401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9V28geYs6+fybVTeARjUscAK9N0tpW7+cMdGRd5q3Us=;
        b=xQByfZewYLdcmkgGArOpIApg8AfnX7d/yqDzPfhtOxjqdPKqBKF8DE539oPSrxny5I
         Zi2AP5vuA0gW+1/AW7K7NgqI1A0y/F74EM1VsVD9xq+XhoOaga/4a6kY98eOU/uUdxXB
         dveg2cTXstcLi8QXp5ZHZRrVqSVlkZOVP3mcg1cSoKh1lZOkmiQHrpejDXdfk1XcGGnp
         ylUXFRXK1F2A/taJiKblQpUpvGi9s7VLhqY6fV+aareM/t9GJgEnSkpOt5qgCpUjPz8D
         sa5YIgMGo5TyBGDHsF3r2tuyMp4ULDbHburYl5oqK5k55/Y15OwjcyaJ0dSihHQUo7zt
         k9rg==
X-Forwarded-Encrypted: i=1; AJvYcCUO902w9U/+T4moTZCwoGQFq09q+7vob6IM4+tiF1IkQHQT42+FxN3UgHuyUamFusu8Yi/7gIUvk9VlOjGu9ybx68At+w==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YydWYUIjJ1vAlr4OYE9lAbxFbKq/xMicjjhujwq2Y67PsnmTwfy
	rqIBwHYLPIVbLu/6QVyDpyFOLBoHyZSQ6kD9/SdMiRxLciRe12hCq5pm
X-Gm-Gg: ASbGncunrH6FUbgI5PeHyUSUbPnHG+ZqRbeHmK4A9Zg0BJ456e4octBcx51xx+04oa+
	UBR1iqI+VievyLZfVR/Ijq7NtS27c23SQmUYkLKU8zJ2HldW6dpjRZU8a8OgD8Ddq/Ta240CBKS
	W5Z33FmrBk3bSDkKuHEZfpsrYGeajb33JY6vcPdXyHIVjTv9NgbJhvJAJ8zwdH8ubHzKjORzTBt
	/KxsXgkpwilMoeF3giElneNFHzP0RUkx798x0pPiRKFkLZr+k98q0xrblXgPaF3C3bS8q+KLU38
	3YmhP9us7q9ksxCfiFABH4rzGSgtcJCqYBX/n1ig6D0tJzI4NdL9Hc/HbQtFehI2Oy2Mlg5XJuN
	xFm62yMzsr0dpSiq5m7kPE3QsfBcINcKlLWTfbFqMsMzSeoQ/D/+1FDlo9O6TEnWmnpt/NUdNLQ
	==
X-Google-Smtp-Source: AGHT+IF6egVDTn5Ywg4HO8cRrcaXb7fIR+VPczMNX7N1WKOEThRzIZRtsgAxQPHJcsd40gZ+gXw7rQ==
X-Received: by 2002:a17:90b:314e:b0:335:228c:6f1f with SMTP id 98e67ed59e1d1-339a6e95d23mr3939304a91.12.1759316600367;
        Wed, 01 Oct 2025 04:03:20 -0700 (PDT)
Received: from ti-am64x-sdk.. ([157.50.93.46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a6f15fbfsm2073476a91.21.2025.10.01.04.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 04:03:19 -0700 (PDT)
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Jon Maloy <jmaloy@redhat.com>,
	"David S . Miller" <davem@davemloft.net>,
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
Subject: [PATCH v2] net: doc: Fix typos in docs
Date: Wed,  1 Oct 2025 16:27:15 +0530
Message-Id: <20251001105715.50462-1-bhanuseshukumar@gmail.com>
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
 Note: No functionality change intended.

 Change log:
 v1->v2 changes:
  fixed pertaing to pertaining.
  Link to v1: https://lore.kernel.org/all/20251001064102.42296-1-bhanuseshukumar@gmail.com/
 
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
index ffe577bf6b51..aad7f96b6009 100644
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
+ * @sub_list: list to all pertaining subscriptions
  * @sub_lock: lock protecting the subscription list
  * @rwork: receive work item
  * @outqueue: pointer to first outbound message in queue
-- 
2.34.1

