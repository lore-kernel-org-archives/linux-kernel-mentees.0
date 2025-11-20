Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B2A337105
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 20 Nov 2025 14:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763648162; cv=none; b=ftIRqqGqdU6b/O2QevkflfH7cRlirz0hEA79X7fvMNEK7XExkEkc0851GlGvqIuQ2NUiSQfHShNkqeUiSVh1mmVwpYZ3Znuevq2Q2g2O2Y/87Jtv87nxVawSqnilmF2/ARrwdzuk5+uP72w1cVDmNSj/jKIXNjdjqrlPtAt45Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763648162; c=relaxed/simple;
	bh=fdofOYSx30kxze7ZMeejuTjOfFbcUuyiRQtQxtHJmHM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M/kbV4cYmMboJSxdf1DbK5GFZPvMApUEC5uMlRkKpCKyEJNaZk3KM0lZixy0zHuGPmoGVz+V/aAAndcBIOLR0XH/wmZbFRBqFrBjuM9HgQVLsvjPQoXZtDNH9lrgFTfq4cyEpf6RD7ELk6IcWIY/1QEx+u8FjzTUqoexFU3yS+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HhPgsWS7; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HhPgsWS7"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2981f9ce15cso10784625ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 20 Nov 2025 06:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763648160; x=1764252960; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ajidgd+5FB7avT3KG2su9bYCh9pzkFLcEde9nhVLLg=;
        b=HhPgsWS78rIGmR8S4B68RNQz4VJunnxMFjUVTra/tcLwzX1MCm4PBQAsRjxiYCzpK9
         qf7ruNjVieAUtqHKXsllOylUl2Hvi+GtBFQC6iAPjNG1EF7PAc0lNJ3ODtq8+En/68ZK
         mfY39+H2U4nrCwyRcgMgsCx6dOP5dqxXNR1s5n+X82GhMzuJMvLteSPoTFjxWjDqqhMU
         WTEu0CuBGrmYCLjc4zKiRfLTGGKN5KPJF3aow3mzzASf4jz3PfS1jDTGhPa1Fu48Es7o
         UB3ken/e3B/++gpRJK94uu0Ehw11ehTZCQyLK3zZigLODGzPH7/ikHEflrL+pmOWrzn9
         WvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763648160; x=1764252960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3ajidgd+5FB7avT3KG2su9bYCh9pzkFLcEde9nhVLLg=;
        b=BV6/hse3J/5JW70G76GyCfO1wfQq6PX2O1MCI4p+pvV8iXUNpsxGhfWvwJn+U2VvM7
         Qr+dhsFuVIhOLQqN7m+wCdUPL2/3XvpZpukluGpYG37J4Bu7h7xOBkcqNMwxPOIxCoHK
         Vv5dtG0ZCJrnA60mhqL2i501kxby/aNRoRpmIVKIIkoXObBFQIZ4w7ym4oemAk9n1j3D
         9dQdhv13MCROV1S4zk6Al4Smk6nfrBqj17JSmL6MKWu7i3gLrmy7oTphyBpuosmsbxpU
         vTek7oJNsyLKuAwka2WwsXxAZdD7oYrFk/wd0l8aGP4KUxksUoECZ9VoVGCv4wlwYUHH
         I1eA==
X-Forwarded-Encrypted: i=1; AJvYcCXep3XFj3TCJxjRCDHbL2mhcR/hctRNbvU31KeCy4CSuinkokjtu+GnL4ltm0ek9GzFBquTvh53NLHUuALqr3/05EpNWQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzIs4Zmi1dQmTp6nmxLaoIaMuTcsFReohLLW1LiXQHKCo+U8O4H
	ym37Ay+yVjvKdrfRwWC7XBD5uin3qreASwvOCsQ3hn0GbJIFdz6YTboL
X-Gm-Gg: ASbGncs+OTbjOEKBRkNssm7k2IddILWgi51PizMBOVNEUT9ycl4gx7dBsDwieLqv/Jm
	3LWsL7LR08ahU3udLng20wNKLvbxrQqprwZRfkx55VO/2V6VPmvgm6dKx6jJ43afE1D2TQ9Lsgl
	u9SD3IScjzCK0Gsu1IRGoOUVAXptrVJ5HI8Qe7V2NraqPOsTENTM9PMQZxioAyPc7wCiHeMLV7K
	LSyHkog7e8l4I6IXNrlCYQ0Lm/FjSEmrYlwMzED7eYzeH3clNRgvV82b1vqgEsVScKkpb/Fp7t7
	QwiIghJJoPHfiCecwbWYLUKONce4Cx5FmysvkRZJlE1RaeFNk2yTwbQP2zuDlfrSF8OEb9YLS0S
	Vy8zh4PUdRDI2B5wDg6vGWX0IkhBtZ3RtGB6yfRPo90yDe1MhH2I/kGqtC0avpOLN2j/e5/7TuT
	FQNz9n9MotALMlPaHIPZ/CxH3zY8r37VrbfWTYCk9neQ==
X-Google-Smtp-Source: AGHT+IHmQT0EhWZieWnM8D+8CZXX5h86PIdEOLv9K/NZZDLWTZWGHTQD+Xa/os8v0JbueFnnTUbEOA==
X-Received: by 2002:a17:903:28e:b0:295:9d7f:9296 with SMTP id d9443c01a7336-29b5ec7bad8mr31892945ad.45.1763648159251;
        Thu, 20 Nov 2025 06:15:59 -0800 (PST)
Received: from COB-LTR7HP24-497.. ([223.185.131.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b138bcbsm28442915ad.29.2025.11.20.06.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 06:15:58 -0800 (PST)
From: I Viswanath <viswanathiyyappan@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	sdf@fomichev.me,
	kuniyu@google.com,
	skhawaja@google.com,
	aleksander.lobakin@intel.com,
	mst@redhat.com,
	jasowang@redhat.com,
	xuanzhuo@linux.alibaba.com,
	eperezma@redhat.com
Cc: virtualization@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	I Viswanath <viswanathiyyappan@gmail.com>
Subject: [PATCH net-next v5 1/2] net: refactor set_rx_mode into snapshot and deferred I/O
Date: Thu, 20 Nov 2025 19:43:53 +0530
Message-Id: <20251120141354.355059-2-viswanathiyyappan@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251120141354.355059-1-viswanathiyyappan@gmail.com>
References: <20251120141354.355059-1-viswanathiyyappan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ndo_set_rx_mode is problematic as it cannot sleep.

There are drivers that circumvent this by doing the rx_mode work
in a work item. This requires extra work that can be avoided if
core provided a mechanism to do that. This patch proposes such a
mechanism.

Refactor set_rx_mode into 2 stages: A snapshot stage and the
actual I/O. In this new model, when _dev_set_rx_mode is called,
we take a snapshot of the current rx_config and then commit it
to the hardware later via a work item

To accomplish this, reinterpret set_rx_mode as the ndo for
customizing the snapshot and enabling/disabling rx_mode set
and add a new ndo write_rx_mode for the deferred I/O

Signed-off-by: I Viswanath <viswanathiyyappan@gmail.com>
Suggested-by: Jakub Kicinski <kuba@kernel.org>
---
 include/linux/netdevice.h | 104 ++++++++++++++++++-
 net/core/dev.c            | 208 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 305 insertions(+), 7 deletions(-)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index e808071dbb7d..e819426bb7cb 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -1049,6 +1049,40 @@ struct netdev_net_notifier {
 	struct notifier_block *nb;
 };
 
+enum netif_rx_mode_flags {
+	/* enable flags */
+	NETIF_RX_MODE_ALLMULTI_EN,
+	NETIF_RX_MODE_PROM_EN,
+	NETIF_RX_MODE_VLAN_EN,
+
+	/* control flags */
+	/* pending config state */
+	NETIF_RX_MODE_CFG_READY,
+
+	/* if set, rx_mode config work will not be executed */
+	NETIF_RX_MODE_SET_DIS,
+
+	/* if set, uc/mc lists will not be part of rx_mode config */
+	NETIF_RX_MODE_UC_SKIP,
+	NETIF_RX_MODE_MC_SKIP
+};
+
+struct netif_rx_mode_config {
+	char	*uc_addrs;
+	char	*mc_addrs;
+	int	uc_count;
+	int	mc_count;
+	int	ctrl_flags;
+	void	*priv_ptr;
+};
+
+struct netif_rx_mode_ctx {
+	struct work_struct		rx_mode_work;
+	struct net_device		*dev;
+	struct netif_rx_mode_config	*ready;
+	struct netif_rx_mode_config	*pending;
+};
+
 /*
  * This structure defines the management hooks for network devices.
  * The following hooks can be defined; unless noted otherwise, they are
@@ -1101,9 +1135,14 @@ struct netdev_net_notifier {
  *	changes to configuration when multicast or promiscuous is enabled.
  *
  * void (*ndo_set_rx_mode)(struct net_device *dev);
- *	This function is called device changes address list filtering.
+ *	This function is called when device changes address list filtering.
  *	If driver handles unicast address filtering, it should set
- *	IFF_UNICAST_FLT in its priv_flags.
+ *	IFF_UNICAST_FLT in its priv_flags. This is used to configure
+ *	the rx_mode snapshot that will be written to the hardware.
+ *
+ * void (*ndo_write_rx_mode)(struct net_device *dev);
+ *	This function is scheduled after set_rx_mode and is responsible for
+ *	writing the rx_mode snapshot to the hardware.
  *
  * int (*ndo_set_mac_address)(struct net_device *dev, void *addr);
  *	This function  is called when the Media Access Control address
@@ -1424,6 +1463,7 @@ struct net_device_ops {
 	void			(*ndo_change_rx_flags)(struct net_device *dev,
 						       int flags);
 	void			(*ndo_set_rx_mode)(struct net_device *dev);
+	void			(*ndo_write_rx_mode)(struct net_device *dev);
 	int			(*ndo_set_mac_address)(struct net_device *dev,
 						       void *addr);
 	int			(*ndo_validate_addr)(struct net_device *dev);
@@ -1926,7 +1966,7 @@ enum netdev_reg_state {
  *	@ingress_queue:		XXX: need comments on this one
  *	@nf_hooks_ingress:	netfilter hooks executed for ingress packets
  *	@broadcast:		hw bcast address
- *
+ *	@rx_mode_ctx:		context required for rx_mode config work
  *	@rx_cpu_rmap:	CPU reverse-mapping for RX completion interrupts,
  *			indexed by RX queue number. Assigned by driver.
  *			This must only be set if the ndo_rx_flow_steer
@@ -2337,6 +2377,7 @@ struct net_device {
 #endif
 
 	unsigned char		broadcast[MAX_ADDR_LEN];
+	struct netif_rx_mode_ctx *rx_mode_ctx;
 #ifdef CONFIG_RFS_ACCEL
 	struct cpu_rmap		*rx_cpu_rmap;
 #endif
@@ -3360,6 +3401,63 @@ int dev_loopback_xmit(struct net *net, struct sock *sk, struct sk_buff *newskb);
 u16 dev_pick_tx_zero(struct net_device *dev, struct sk_buff *skb,
 		     struct net_device *sb_dev);
 
+void netif_rx_mode_schedule_work(struct net_device *dev, bool flush);
+
+/* Drivers that implement rx mode as work flush the work item when closing
+ * or suspending. This is the substitute for those calls.
+ */
+static inline void netif_rx_mode_flush_work(struct net_device *dev)
+{
+	flush_work(&dev->rx_mode_ctx->rx_mode_work);
+}
+
+/* Helpers to be used in the set_rx_mode implementation */
+static inline void netif_rx_mode_set_bit(struct net_device *dev, int b,
+					 bool val)
+{
+	if (val)
+		dev->rx_mode_ctx->pending->ctrl_flags |= BIT(b);
+	else
+		dev->rx_mode_ctx->pending->ctrl_flags &= ~BIT(b);
+}
+
+static inline void netif_rx_mode_set_priv_ptr(struct net_device *dev,
+					      void *priv)
+{
+	dev->rx_mode_ctx->pending->priv_ptr = priv;
+}
+
+/* Helpers to be used in the write_rx_mode implementation */
+static inline bool netif_rx_mode_get_bit(struct net_device *dev, int b)
+{
+	return !!(dev->rx_mode_ctx->ready->ctrl_flags & BIT(b));
+}
+
+static inline void *netif_rx_mode_get_priv_ptr(struct net_device *dev)
+{
+	return dev->rx_mode_ctx->ready->priv_ptr;
+}
+
+static inline int netif_rx_mode_get_mc_count(struct net_device *dev)
+{
+	return dev->rx_mode_ctx->ready->mc_count;
+}
+
+static inline int netif_rx_mode_get_uc_count(struct net_device *dev)
+{
+	return dev->rx_mode_ctx->ready->uc_count;
+}
+
+#define netif_rx_mode_for_each_uc_addr(dev, ha_addr, idx) \
+	for (ha_addr = (dev)->rx_mode_ctx->ready->uc_addrs, idx = 0; \
+		idx < (dev)->rx_mode_ctx->ready->uc_count; \
+		ha_addr += (dev)->addr_len, idx++)
+
+#define netif_rx_mode_for_each_mc_addr(dev, ha_addr, idx) \
+	for (ha_addr = (dev)->rx_mode_ctx->ready->mc_addrs, idx = 0; \
+		idx < (dev)->rx_mode_ctx->ready->mc_count; \
+		ha_addr += (dev)->addr_len, idx++)
+
 int __dev_queue_xmit(struct sk_buff *skb, struct net_device *sb_dev);
 int __dev_direct_xmit(struct sk_buff *skb, u16 queue_id);
 
diff --git a/net/core/dev.c b/net/core/dev.c
index 69515edd17bc..2be3ff8512b1 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -1645,6 +1645,160 @@ static int napi_kthread_create(struct napi_struct *n)
 	return err;
 }
 
+/* The existence of pending/ready config is an implementation detail. The
+ * caller shouldn't be aware of them. This is a bit hacky. We read
+ * bits from pending because control bits need to be read before pending
+ * is prepared.
+ */
+static bool __netif_rx_mode_pending_get_bit(struct net_device *dev, int b)
+{
+	return !!(dev->rx_mode_ctx->pending->ctrl_flags & BIT(b));
+}
+
+/* This function attempts to copy the current state of the
+ * net device into pending (reallocating if necessary). If it fails,
+ * pending is guaranteed to be unmodified.
+ */
+static int netif_rx_mode_alloc_and_fill_pending(struct net_device *dev)
+{
+	struct netif_rx_mode_config *pending = dev->rx_mode_ctx->pending;
+	int uc_count = 0, mc_count = 0;
+	struct netdev_hw_addr *ha;
+	char *tmp;
+	int i;
+
+	/* The allocations need to be atomic since this will be called under
+	 * netif_addr_lock_bh()
+	 */
+	if (!__netif_rx_mode_pending_get_bit(dev, NETIF_RX_MODE_UC_SKIP)) {
+		uc_count = netdev_uc_count(dev);
+		tmp = krealloc(pending->uc_addrs,
+			       uc_count * dev->addr_len,
+			       GFP_ATOMIC);
+		if (!tmp)
+			return -ENOMEM;
+		pending->uc_addrs = tmp;
+	}
+
+	if (!__netif_rx_mode_pending_get_bit(dev, NETIF_RX_MODE_MC_SKIP)) {
+		mc_count = netdev_mc_count(dev);
+		tmp = krealloc(pending->mc_addrs,
+			       mc_count * dev->addr_len,
+			       GFP_ATOMIC);
+		if (!tmp)
+			return -ENOMEM;
+		pending->mc_addrs = tmp;
+	}
+
+	/* This function cannot fail after this point */
+
+	/* This is going to be the same for every single driver. Better to
+	 * do it here than in the set_rx_mode impl
+	 */
+	netif_rx_mode_set_bit(dev, NETIF_RX_MODE_ALLMULTI_EN,
+			      !!(dev->flags & IFF_ALLMULTI));
+
+	netif_rx_mode_set_bit(dev, NETIF_RX_MODE_PROM_EN,
+			      !!(dev->flags & IFF_PROMISC));
+
+	i = 0;
+	if (!__netif_rx_mode_pending_get_bit(dev, NETIF_RX_MODE_UC_SKIP)) {
+		pending->uc_count = uc_count;
+		netdev_for_each_uc_addr(ha, dev)
+			memcpy(pending->uc_addrs + (i++) * dev->addr_len,
+			       ha->addr,
+			       dev->addr_len);
+	}
+
+	i = 0;
+	if (!__netif_rx_mode_pending_get_bit(dev, NETIF_RX_MODE_MC_SKIP)) {
+		pending->mc_count = mc_count;
+		netdev_for_each_mc_addr(ha, dev)
+			memcpy(pending->mc_addrs + (i++) * dev->addr_len,
+			       ha->addr,
+			       dev->addr_len);
+	}
+	return 0;
+}
+
+static void netif_rx_mode_prepare_pending(struct net_device *dev)
+{
+	lockdep_assert_held(&dev->addr_list_lock);
+	int rc;
+
+	rc = netif_rx_mode_alloc_and_fill_pending(dev);
+	if (rc)
+		return;
+
+	netif_rx_mode_set_bit(dev, NETIF_RX_MODE_CFG_READY, true);
+}
+
+static void netif_rx_mode_write_active(struct work_struct *param)
+{
+	struct netif_rx_mode_ctx *rx_mode_ctx = container_of(param,
+			struct netif_rx_mode_ctx, rx_mode_work);
+
+	struct net_device *dev = rx_mode_ctx->dev;
+
+	/* Paranoia. */
+	WARN_ON(!dev->netdev_ops->ndo_write_rx_mode);
+
+	/* We could introduce a new lock for this but reusing the addr
+	 * lock works well enough
+	 */
+	netif_addr_lock_bh(dev);
+
+	/* There's no point continuing if the pending config is not ready */
+	if (!__netif_rx_mode_pending_get_bit(dev, NETIF_RX_MODE_CFG_READY)) {
+		netif_addr_unlock_bh(dev);
+		return;
+	}
+
+	/* We use the prepared pending config as the new ready config and
+	 * reuse old ready config's memory for the next pending config
+	 */
+	swap(rx_mode_ctx->ready, rx_mode_ctx->pending);
+	netif_rx_mode_set_bit(dev, NETIF_RX_MODE_CFG_READY, false);
+
+	netif_addr_unlock_bh(dev);
+
+	rtnl_lock();
+	dev->netdev_ops->ndo_write_rx_mode(dev);
+	rtnl_unlock();
+}
+
+static int alloc_rx_mode_ctx(struct net_device *dev)
+{
+	dev->rx_mode_ctx = kzalloc(sizeof(*dev->rx_mode_ctx), GFP_KERNEL);
+
+	if (!dev->rx_mode_ctx)
+		goto fail;
+
+	dev->rx_mode_ctx->ready = kzalloc(sizeof(*dev->rx_mode_ctx->ready),
+					  GFP_KERNEL);
+
+	if (!dev->rx_mode_ctx->ready)
+		goto fail_ready;
+
+	dev->rx_mode_ctx->pending = kzalloc(sizeof(*dev->rx_mode_ctx->pending),
+					    GFP_KERNEL);
+
+	if (!dev->rx_mode_ctx->pending)
+		goto fail_pending;
+
+	INIT_WORK(&dev->rx_mode_ctx->rx_mode_work, netif_rx_mode_write_active);
+	dev->rx_mode_ctx->dev = dev;
+
+	return 0;
+
+fail_pending:
+	kfree(dev->rx_mode_ctx->ready);
+fail_ready:
+	kfree(dev->rx_mode_ctx);
+fail:
+	return -ENOMEM;
+}
+
 static int __dev_open(struct net_device *dev, struct netlink_ext_ack *extack)
 {
 	const struct net_device_ops *ops = dev->netdev_ops;
@@ -1679,6 +1833,9 @@ static int __dev_open(struct net_device *dev, struct netlink_ext_ack *extack)
 	if (ops->ndo_validate_addr)
 		ret = ops->ndo_validate_addr(dev);
 
+	if (!ret && ops->ndo_write_rx_mode)
+		ret = alloc_rx_mode_ctx(dev);
+
 	if (!ret && ops->ndo_open)
 		ret = ops->ndo_open(dev);
 
@@ -1713,6 +1870,22 @@ int netif_open(struct net_device *dev, struct netlink_ext_ack *extack)
 	return ret;
 }
 
+static void cleanup_rx_mode_ctx(struct net_device *dev)
+{
+	/* cancel and wait for execution to complete */
+	cancel_work_sync(&dev->rx_mode_ctx->rx_mode_work);
+
+	kfree(dev->rx_mode_ctx->pending->uc_addrs);
+	kfree(dev->rx_mode_ctx->pending->mc_addrs);
+	kfree(dev->rx_mode_ctx->pending);
+
+	kfree(dev->rx_mode_ctx->ready->uc_addrs);
+	kfree(dev->rx_mode_ctx->ready->mc_addrs);
+	kfree(dev->rx_mode_ctx->ready);
+
+	kfree(dev->rx_mode_ctx);
+}
+
 static void __dev_close_many(struct list_head *head)
 {
 	struct net_device *dev;
@@ -1755,6 +1928,9 @@ static void __dev_close_many(struct list_head *head)
 		if (ops->ndo_stop)
 			ops->ndo_stop(dev);
 
+		if (ops->ndo_write_rx_mode)
+			cleanup_rx_mode_ctx(dev);
+
 		netif_set_up(dev, false);
 		netpoll_poll_enable(dev);
 	}
@@ -9613,6 +9789,33 @@ int netif_set_allmulti(struct net_device *dev, int inc, bool notify)
 	return 0;
 }
 
+/* netif_rx_mode_schedule_work - Sets up the rx_config snapshot and
+ * schedules the deferred I/O. If it's necessary to wait for completion
+ * of I/O, set flush to true.
+ */
+void netif_rx_mode_schedule_work(struct net_device *dev, bool flush)
+{
+	const struct net_device_ops *ops = dev->netdev_ops;
+
+	if (ops->ndo_set_rx_mode)
+		ops->ndo_set_rx_mode(dev);
+
+	/* Return early if ndo_write_rx_mode is not implemented */
+	if (!ops->ndo_write_rx_mode)
+		return;
+
+	/* If rx_mode config is disabled, we don't schedule the work */
+	if (__netif_rx_mode_pending_get_bit(dev, NETIF_RX_MODE_SET_DIS))
+		return;
+
+	netif_rx_mode_prepare_pending(dev);
+
+	schedule_work(&dev->rx_mode_ctx->rx_mode_work);
+	if (flush)
+		flush_work(&dev->rx_mode_ctx->rx_mode_work);
+}
+EXPORT_SYMBOL(netif_rx_mode_schedule_work);
+
 /*
  *	Upload unicast and multicast address lists to device and
  *	configure RX filtering. When the device doesn't support unicast
@@ -9621,8 +9824,6 @@ int netif_set_allmulti(struct net_device *dev, int inc, bool notify)
  */
 void __dev_set_rx_mode(struct net_device *dev)
 {
-	const struct net_device_ops *ops = dev->netdev_ops;
-
 	/* dev_open will call this function so the list will stay sane. */
 	if (!(dev->flags&IFF_UP))
 		return;
@@ -9643,8 +9844,7 @@ void __dev_set_rx_mode(struct net_device *dev)
 		}
 	}
 
-	if (ops->ndo_set_rx_mode)
-		ops->ndo_set_rx_mode(dev);
+	netif_rx_mode_schedule_work(dev, false);
 }
 
 void dev_set_rx_mode(struct net_device *dev)
-- 
2.34.1

