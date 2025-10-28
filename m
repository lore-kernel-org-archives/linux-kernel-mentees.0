Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6AD34AB12
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 28 Oct 2025 17:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761673382; cv=none; b=DdTZQIxsIdGXASokupOnHPfXQuQ1J28wWyGeVJG0JrRTMBNny5mkMJd1yyCkOMFlb1U8k7d1SFQOuogicE0FFMGh+yuYqafCDDvlUGPClO+DK35HbPTuDFai0odnzzNKmFN+Oi1qp+xpIUua3Rvzr+FVEf870DmFe+PB/FVb+cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761673382; c=relaxed/simple;
	bh=sMkDe6QuWZJg6QPZquqAd7/AomdUD6bzML0q+sBe7bg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dECIy/9f3Wmnnw2P7O7MeXhqGot89iWCGNoPYrBVd0mqa5S8PG4PAbHZQrbWbONhLSfXoGShum+zBNZ8a4K/w2ywtORaFtif4jjJMsygLkAtXCr8pccoZ1Mc75MjusquVxbyNkTmtAhizZHKcMyHite6gur24tcUxakUVBVJ6Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cFl/JON6; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cFl/JON6"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7a27bf4fbcbso5346506b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 28 Oct 2025 10:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761673378; x=1762278178; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2wUcQZk4DZbR7xSABHIWAnc7HQf0QktM3XmDK4PsaFA=;
        b=cFl/JON6gZeFgfLE1hBGkr5+YHmekIt1czIqtOFifBkhdHH4qz0PYR6tqe4LatfI0j
         65wune3ds8d9u5M528DG45EVDOw7TeP+8duubLJnHpswhn5lgugT67m0tr87jZ1Z4Zmb
         qKdDF6R9fpQcuoiK2yR9aGTIPsFsEAHr8IdGUDO9LUP4AeviTOQ6ce19aQDuUqK1dYaE
         yWLeQmFAD1BhnHMUEOkLswshKQsqAN3MHXbptZbkghME7kgBPx9+fQd83WhL5FUHiAmz
         yGL2JCizpxOYrB25M1OqJmNbkBKEZeCzZf3D/TnKsSr5zFCLfUhrodUlXfZWVw6TzHpS
         AAsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761673378; x=1762278178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2wUcQZk4DZbR7xSABHIWAnc7HQf0QktM3XmDK4PsaFA=;
        b=Pefd1lIgzhFWJZJDOjNaVUihWqGQuN9Lz2rpi2Unu+liI+aqjJZSMHAtugOjbIQCWH
         r9P1vzdcUNJ6aInbx2+REHd4g7EnMIbv5oCxc4+n/kZg1KHmCPk4irjjpep8kRXA9s54
         Ex/bBpq2OGOqZvMh1nsK8ieVqfIKpmEu6dCKfQptfSnDM+oeVgi9F4ieKdjcB3JW4YLE
         R4aBXapwyNXBxtxjb4jfG/o3DJM7dt8zw4XNZNVBqFuhWPTzeJQUnRw+MNvJyMxHynJY
         mdHOwvI0bNwHGb4N7AY36/B+wCetEviGViUtf+xcXEccIajUJduIdudh7GOGnsdkWPBR
         w7TQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdHBCTeJE/0Bh3aH2kIY5EOQEfCkXnWQLAI8eMJNyr3cPsESulgnoLz4L2iUWzxW57vKxSIUzeGK65iAFLiIDURHWEKQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxHi+yyQJnDhhL7O4zvgHpQ/dk4U89jIuwvBN+Ra77HBsJe7/cF
	rY38ms+PQ9F4GOMT9N3rQIV9SnV16ceSw7aP16xnaDhN6VOw5NFWXGgu
X-Gm-Gg: ASbGncsFFxyO2v7bY4O61QAJH2JunUN7QbB2CM4ptKEhk7qtC7I60skLYfQBz7h50Z/
	nbZrbVALjn0wiVAGpCmwUVqeytwC1jY/dgAwE4M8V+JmBsLDV7zmcRRK/98Bf6BqMkJjbDe1QBd
	FVgyUYpykAFHedpWpJW22nxQ3N2PanSQ0Y/0Nbfa1k3Jd8bspBKGxfanNUgd1iEVqJuE7xL32hi
	tnaFmJOtJ4qiXkfRAMlZhD+zmEov2uoi9JMkwamqjJGv8EFbLAS48aLZm4/fCXeGNSuBi59ke4D
	vl0lbQotxYSaZGHFENFQ4+1PW4Sty8tqg3OVR7hBfj6TtDF+nGsSKUtby1HTml1CFNmPwhGQJks
	xX2iTFLbeuqFXsJPNarFDa/+1xfUL0Lvj2XUFUR3d35V+bzqcSMmdO6oJz+0vjWbomOSiY5CBDj
	xNvDpsaCkHvVevtAxYu6Lp0sE+SuuZT8dYLO7utf4z2A0YgtsHIIHNzso4Js5Ml7jJXmU=
X-Google-Smtp-Source: AGHT+IFmoA4oUM0hYelxgK8TfKfROtqNw2wglYnqCeCLNgjKiJFLlA1p5RH5+ee4oIgzehf3QEOHoQ==
X-Received: by 2002:a05:6a20:9188:b0:2fd:a3b:933d with SMTP id adf61e73a8af0-3461ecf3596mr669372637.58.1761673378402;
        Tue, 28 Oct 2025 10:42:58 -0700 (PDT)
Received: from debian.domain.name ([223.181.113.110])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b71268bde68sm11086746a12.1.2025.10.28.10.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 10:42:57 -0700 (PDT)
From: I Viswanath <viswanathiyyappan@gmail.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	sdf@fomichev.me,
	kuniyu@google.com,
	ahmed.zaki@intel.com,
	aleksander.lobakin@intel.com,
	jacob.e.keller@intel.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	I Viswanath <viswanathiyyappan@gmail.com>
Subject: [RFC/RFT PATCH net-next v3 2/2] net: ethernet: Implement ndo_write_rx_config callback for the 8139cp driver
Date: Tue, 28 Oct 2025 23:12:22 +0530
Message-ID: <20251028174222.1739954-3-viswanathiyyappan@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251028174222.1739954-1-viswanathiyyappan@gmail.com>
References: <20251028174222.1739954-1-viswanathiyyappan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement ndo_write_rx_config for the 8139cp driver

Signed-off-by: I Viswanath <viswanathiyyappan@gmail.com>
---
 drivers/net/ethernet/realtek/8139cp.c | 78 ++++++++++++++++-----------
 1 file changed, 46 insertions(+), 32 deletions(-)

diff --git a/drivers/net/ethernet/realtek/8139cp.c b/drivers/net/ethernet/realtek/8139cp.c
index 5652da8a178c..ae3dca4f9b73 100644
--- a/drivers/net/ethernet/realtek/8139cp.c
+++ b/drivers/net/ethernet/realtek/8139cp.c
@@ -319,6 +319,11 @@ struct cp_extra_stats {
 	unsigned long		rx_frags;
 };
 
+struct cp_rx_config {
+	int rx_mode;
+	u32 mc_filter[2];	/* Multicast hash filter */
+};
+
 struct cp_private {
 	void			__iomem *regs;
 	struct net_device	*dev;
@@ -328,7 +333,7 @@ struct cp_private {
 	struct napi_struct	napi;
 
 	struct pci_dev		*pdev;
-	u32			rx_config;
+	struct cp_rx_config	*rx_config;
 	u16			cpcmd;
 
 	struct cp_extra_stats	cp_stats;
@@ -372,7 +377,6 @@ struct cp_private {
 	} while (0)
 
 
-static void __cp_set_rx_mode (struct net_device *dev);
 static void cp_tx (struct cp_private *cp);
 static void cp_clean_rings (struct cp_private *cp);
 #ifdef CONFIG_NET_POLL_CONTROLLER
@@ -882,55 +886,53 @@ static netdev_tx_t cp_start_xmit (struct sk_buff *skb,
 	goto out_unlock;
 }
 
+static void cp_write_rx_config(struct net_device *dev)
+{
+	struct cp_private *cp = netdev_priv(dev);
+	struct cp_rx_config snapshot;
+
+	read_snapshot(&snapshot, struct cp_private);
+
+	/* We can safely update without stopping the chip. */
+	cpw32_f(RxConfig, snapshot.rx_mode);
+
+	cpw32_f(MAR0 + 0, snapshot.mc_filter[0]);
+	cpw32_f(MAR0 + 4, snapshot.mc_filter[1]);
+}
+
 /* Set or clear the multicast filter for this adaptor.
    This routine is not state sensitive and need not be SMP locked. */
 
-static void __cp_set_rx_mode (struct net_device *dev)
+static void cp_set_rx_mode (struct net_device *dev)
 {
-	struct cp_private *cp = netdev_priv(dev);
-	u32 mc_filter[2];	/* Multicast hash filter */
-	int rx_mode;
+	struct cp_rx_config new_config;
 
 	/* Note: do not reorder, GCC is clever about common statements. */
 	if (dev->flags & IFF_PROMISC) {
 		/* Unconditionally log net taps. */
-		rx_mode =
+		new_config.rx_mode =
 		    AcceptBroadcast | AcceptMulticast | AcceptMyPhys |
 		    AcceptAllPhys;
-		mc_filter[1] = mc_filter[0] = 0xffffffff;
+		new_config.mc_filter[1] = new_config.mc_filter[0] = 0xffffffff;
 	} else if ((netdev_mc_count(dev) > multicast_filter_limit) ||
 		   (dev->flags & IFF_ALLMULTI)) {
 		/* Too many to filter perfectly -- accept all multicasts. */
-		rx_mode = AcceptBroadcast | AcceptMulticast | AcceptMyPhys;
-		mc_filter[1] = mc_filter[0] = 0xffffffff;
+		new_config.rx_mode = AcceptBroadcast | AcceptMulticast | AcceptMyPhys;
+		new_config.mc_filter[1] = new_config.mc_filter[0] = 0xffffffff;
 	} else {
 		struct netdev_hw_addr *ha;
-		rx_mode = AcceptBroadcast | AcceptMyPhys;
-		mc_filter[1] = mc_filter[0] = 0;
+		new_config.rx_mode = AcceptBroadcast | AcceptMyPhys;
+		new_config.mc_filter[1] = new_config.mc_filter[0] = 0;
 		netdev_for_each_mc_addr(ha, dev) {
 			int bit_nr = ether_crc(ETH_ALEN, ha->addr) >> 26;
 
-			mc_filter[bit_nr >> 5] |= 1 << (bit_nr & 31);
-			rx_mode |= AcceptMulticast;
+			new_config.mc_filter[bit_nr >> 5] |= 1 << (bit_nr & 31);
+			new_config.rx_mode |= AcceptMulticast;
 		}
 	}
 
-	/* We can safely update without stopping the chip. */
-	cp->rx_config = cp_rx_config | rx_mode;
-	cpw32_f(RxConfig, cp->rx_config);
-
-	cpw32_f (MAR0 + 0, mc_filter[0]);
-	cpw32_f (MAR0 + 4, mc_filter[1]);
-}
-
-static void cp_set_rx_mode (struct net_device *dev)
-{
-	unsigned long flags;
-	struct cp_private *cp = netdev_priv(dev);
-
-	spin_lock_irqsave (&cp->lock, flags);
-	__cp_set_rx_mode(dev);
-	spin_unlock_irqrestore (&cp->lock, flags);
+	new_config.rx_mode = cp_rx_config | new_config.rx_mode;
+	update_snapshot(&new_config, struct cp_private);
 }
 
 static void __cp_get_stats(struct cp_private *cp)
@@ -1040,7 +1042,7 @@ static void cp_init_hw (struct cp_private *cp)
 	cp_start_hw(cp);
 	cpw8(TxThresh, 0x06); /* XXX convert magic num to a constant */
 
-	__cp_set_rx_mode(dev);
+	set_and_schedule_rx_config(dev, true);
 	cpw32_f (TxConfig, IFG | (TX_DMA_BURST << TxDMAShift));
 
 	cpw8(Config1, cpr8(Config1) | DriverLoaded | PMEnable);
@@ -1188,6 +1190,12 @@ static int cp_open (struct net_device *dev)
 	if (rc)
 		return rc;
 
+	cp->rx_config = kmalloc(sizeof(*cp->rx_config), GFP_KERNEL);
+	if (!cp->rx_config) {
+		rc = -ENOMEM;
+		goto err_out_rx_config;
+	}
+
 	napi_enable(&cp->napi);
 
 	cp_init_hw(cp);
@@ -1207,6 +1215,9 @@ static int cp_open (struct net_device *dev)
 err_out_hw:
 	napi_disable(&cp->napi);
 	cp_stop_hw(cp);
+	kfree(cp->rx_config);
+
+err_out_rx_config:
 	cp_free_rings(cp);
 	return rc;
 }
@@ -1227,6 +1238,8 @@ static int cp_close (struct net_device *dev)
 
 	cp_stop_hw(cp);
 
+	kfree(cp->rx_config);
+
 	spin_unlock_irqrestore(&cp->lock, flags);
 
 	free_irq(cp->pdev->irq, dev);
@@ -1262,7 +1275,7 @@ static void cp_tx_timeout(struct net_device *dev, unsigned int txqueue)
 	cp_clean_rings(cp);
 	cp_init_rings(cp);
 	cp_start_hw(cp);
-	__cp_set_rx_mode(dev);
+	set_and_schedule_rx_config(dev, false);
 	cpw16_f(IntrMask, cp_norx_intr_mask);
 
 	netif_wake_queue(dev);
@@ -1870,6 +1883,7 @@ static const struct net_device_ops cp_netdev_ops = {
 	.ndo_validate_addr	= eth_validate_addr,
 	.ndo_set_mac_address 	= cp_set_mac_address,
 	.ndo_set_rx_mode	= cp_set_rx_mode,
+	.ndo_write_rx_config    = cp_write_rx_config,
 	.ndo_get_stats		= cp_get_stats,
 	.ndo_eth_ioctl		= cp_ioctl,
 	.ndo_start_xmit		= cp_start_xmit,
-- 
2.34.1

