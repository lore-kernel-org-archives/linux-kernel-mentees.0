Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADBC322A2E
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 20 Oct 2025 13:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760968174; cv=none; b=lRQ1zKHXxtMVXxIitoB2q7jaTq9fJg9pDXDObPZSZU1DmliU+Bn16Pe7rAuGBMUNPX2PVH3nUX149QWoSQ7XZQ8HUNTPOulcGZplb3ZG1BJhOxdCH57ZEKUuWez+N9AfQCHcuPQwBuwgCsK4rz4BJj+kXwCsfkI5xRyD7SjY66U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760968174; c=relaxed/simple;
	bh=OdAkGFsVBeypNY8bG/+x2bxmidQpWkTH+22jXc8Cjk0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sr8o4oL+xQ5VXAoDpxAjw1poXATMCte+Zm4Na0z42wr8937tx68SUCz7p9rhJwDqa10WSoIAZ6XZWKYZTieBGgrr9gVKFdhdcQZxpbLNbFYeferkJiBfzBr/GC6GfICLlcufojpt+1c6LrMz+BXJBmJWW/3zev7L9AXsuItcwrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nkeAtidV; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nkeAtidV"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-78af3fe5b17so3527807b3a.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 20 Oct 2025 06:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760968172; x=1761572972; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eODQs0ub6BtCBcbm30jQFNEO4Utk4CtbjZek/rCcark=;
        b=nkeAtidVqHkHZq4c6rQa//6WRxwdJl42BnGwCZmHa3MpGn+AJIVaAE301xN2apbl9x
         Gmz/ITLDUutIxxulcwAbfa+qVmR4KLHU7X1Qp3YiM8CeZf8lb7NPBzC8WnzquYzteXW0
         1vacp+0IAVdstbu9sJoMAtCPwFTZ8DPwQVh1Ticg8UZiAajJ4RoSBr4VOXqe6I29gX3T
         mae447Tq5lXpit/V2l9FBBESGb0/KVNmZ6/8vOgdXhIPOeXdqAvSfK5c/m9byPC7B9zJ
         axrhXSQFsKhew9EjIGhESuDgK/fgej5o2ekKg8tS4AOrw+RFK203gdLBCGU9RtLW7+kr
         GcLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760968172; x=1761572972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eODQs0ub6BtCBcbm30jQFNEO4Utk4CtbjZek/rCcark=;
        b=LtBFIJwsKpwO76FzWd5VxogGPKHRXAEXvOMa0B5RRYr6tSdAKDk4UyuWgpaIZ04HbB
         kQCJlF7avgBv8HcLBMdlhCw5zHiXHIkooZqO2kKBQiEKFYVE6Z/ggmcPp/Tp09yWy+eN
         /UxO9D84yJ6lpaSnlgZwqQchjgs9DtmxBrqv14gOSkqYl9jA7Y8IVwtnL9XPWDeClMSk
         q01a3gDigl0C/pNVO07Tyk2r51QI+7paSPAXJI7MuWdSmO05hjPjus+KQSpSyabsSs4y
         qx5CsTnGQj/JDZOmGHx6GY/NrjpIByvB7LdMl6GrDxxF9XN3X5VWo+WK4fPAmOLEorY1
         Htog==
X-Forwarded-Encrypted: i=1; AJvYcCVwORnr0XAHR+0KU40zJI4hhslP6Sv6ekF4hr3WGNbw9YQP5zqzVJYdWOH34Yx6eyAD/RYovkqDejn/3QPFGt3S3v8XFQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyNSLdfYGn7OKjYlGdY0E8WAFnMPv8otiVSTQX6JqqRmgorWPV6
	CxkSexw7Z6C5nIVkLNViJ2CWEG28XCAql+qKJqv3xhEUfT1RvRB4GOJdk6Fq6ctq
X-Gm-Gg: ASbGncv+rfd5EWpbn14WDyqyqacXmsaAOJDbISU3bNqZbcBqFtoBvabnAX5eO4OZJNo
	FqP61V2xG8kIt7/ADK/9LmG4l7wcKTqGj41iDshIpPhlaqluAoq4SKFJ6HmGeS/fTzSbXHQcWf9
	luz6gmT9vVGiSsQ/ZNEUy83isKqDzzBtrsEhUxKTCzE12FmvqvNI9oXNHK3yNDG9drcNQkcGtrF
	LiH2y6toczztGegA61KgIWtiRMK1akTAWO+0EQewzWWeIPhFZzSDO33FxZzu/zi45iUXKeQDR+H
	/jfMob2JpnKIk3hK3k4LSZJmxgow/X71segsTgU8LDhHNjrCkslEuu3wrinT3qDmTS9KWbVsYuw
	dJe7dPkJlH8uaMFUmEs2Jkt8ZLDdgcSFPZ3TrMza/oy+snHaxegByXS2FrergGE2VS4sFm0srT9
	neuSlhOC8CUS6mJh+heVrS2kRddfknz0cH36Vzeg2pVA7Fg6vFXzKzOl6yvWckJq1zZUIprKZ/+
	g==
X-Google-Smtp-Source: AGHT+IFiKRAll9tcnFwi3rMLldMi2VlZJ+m3l4+IxH5yr0qxsRT3jhyqtjhnAiXqR5sBVn7aaUjVHg==
X-Received: by 2002:a17:903:2309:b0:262:79a:93fb with SMTP id d9443c01a7336-290ca121803mr178719455ad.32.1760968172002;
        Mon, 20 Oct 2025 06:49:32 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1cc9:d444:c07a:121f:22da:3f7b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33bdd02793dsm4507349a91.3.2025.10.20.06.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 06:49:31 -0700 (PDT)
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
	andrew+netdev@lunn.ch
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	I Viswanath <viswanathiyyappan@gmail.com>
Subject: [RFC net-next PATCH 2/2] net: ethernet: Implement ndo_write_rx_config callback for the 8139cp driver
Date: Mon, 20 Oct 2025 19:18:57 +0530
Message-ID: <20251020134857.5820-3-viswanathiyyappan@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020134857.5820-1-viswanathiyyappan@gmail.com>
References: <20251020134857.5820-1-viswanathiyyappan@gmail.com>
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
 I modified and set ndo_set_rx_mode to be __cp_set_rx_mode as using
 cp_set_rx_mode as ndo_set_rx_mode callback would have led to a deadlock
 in cp_init_hw() 
 
 drivers/net/ethernet/realtek/8139cp.c | 67 ++++++++++++++++++---------
 1 file changed, 46 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/realtek/8139cp.c b/drivers/net/ethernet/realtek/8139cp.c
index 5652da8a178c..ff6195c7f3b6 100644
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
@@ -882,45 +887,53 @@ static netdev_tx_t cp_start_xmit (struct sk_buff *skb,
 	goto out_unlock;
 }
 
+static void cp_write_rx_config(struct net_device *dev)
+{
+	struct cp_private *cp = netdev_priv(dev);
+	struct cp_rx_config snapshot;
+
+	read_snapshot((&snapshot), struct cp_private);
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
 
 static void __cp_set_rx_mode (struct net_device *dev)
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
+	new_config.rx_mode = cp_rx_config | new_config.rx_mode;
+	update_snapshot(&new_config, struct cp_private);
 }
 
 static void cp_set_rx_mode (struct net_device *dev)
@@ -1040,7 +1053,7 @@ static void cp_init_hw (struct cp_private *cp)
 	cp_start_hw(cp);
 	cpw8(TxThresh, 0x06); /* XXX convert magic num to a constant */
 
-	__cp_set_rx_mode(dev);
+	set_and_schedule_rx_config(dev, true);
 	cpw32_f (TxConfig, IFG | (TX_DMA_BURST << TxDMAShift));
 
 	cpw8(Config1, cpr8(Config1) | DriverLoaded | PMEnable);
@@ -1188,6 +1201,12 @@ static int cp_open (struct net_device *dev)
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
@@ -1207,6 +1226,9 @@ static int cp_open (struct net_device *dev)
 err_out_hw:
 	napi_disable(&cp->napi);
 	cp_stop_hw(cp);
+	kfree(cp->rx_config);
+
+err_out_rx_config:
 	cp_free_rings(cp);
 	return rc;
 }
@@ -1227,6 +1249,8 @@ static int cp_close (struct net_device *dev)
 
 	cp_stop_hw(cp);
 
+	kfree(cp->rx_config);
+
 	spin_unlock_irqrestore(&cp->lock, flags);
 
 	free_irq(cp->pdev->irq, dev);
@@ -1262,7 +1286,7 @@ static void cp_tx_timeout(struct net_device *dev, unsigned int txqueue)
 	cp_clean_rings(cp);
 	cp_init_rings(cp);
 	cp_start_hw(cp);
-	__cp_set_rx_mode(dev);
+	set_and_schedule_rx_config(dev, false);
 	cpw16_f(IntrMask, cp_norx_intr_mask);
 
 	netif_wake_queue(dev);
@@ -1869,7 +1893,8 @@ static const struct net_device_ops cp_netdev_ops = {
 	.ndo_stop		= cp_close,
 	.ndo_validate_addr	= eth_validate_addr,
 	.ndo_set_mac_address 	= cp_set_mac_address,
-	.ndo_set_rx_mode	= cp_set_rx_mode,
+	.ndo_set_rx_mode	= __cp_set_rx_mode,
+	.ndo_write_rx_config    = cp_write_rx_config,
 	.ndo_get_stats		= cp_get_stats,
 	.ndo_eth_ioctl		= cp_ioctl,
 	.ndo_start_xmit		= cp_start_xmit,
-- 
2.47.3

