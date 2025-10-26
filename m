Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414AC26E173
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 26 Oct 2025 17:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761501321; cv=none; b=FqBFe7LbbbD8gB9nuPOpV4Qqm3aVlKvN25WnFlXZU6eixN2V2zCuVcW59x8F3Xuss8HIO2f4GsQhcm+kaSbDwIViwWg2MLcRldJGbp9PXapkBlyExFN7Q4t3HvF1h2XrfGrYBqZvQODSJYKy5634+2K0WH94eS1w9oe/0uAvuaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761501321; c=relaxed/simple;
	bh=TYqSgjtJTLH69TjVY4P5M4kBe3nBDzdkUzWmul55T9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uRhIG6FFFMUU7/b2rm5DJL6x3sZ55zB3S86nT7jdpiJwx0jWM4tNipNDwBcyV7SO5JaZDfsihjzUTgBJuwj/oSuDAuzN2PUxspAY/AtW8Nm1MYA2nJWSKK1LcK85+tIeyFozAMBl8YPYS+OUAVEJdgYXMVHvzHMLirjUWPKwR0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qh10enOi; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qh10enOi"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b6ceba7c97eso3629048a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 26 Oct 2025 10:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761501319; x=1762106119; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BU/OVZkhFNUOoFCHhkl2TNsQ4jyGlF9k1fRMPXpk2ak=;
        b=Qh10enOij5N9Q6t9eNCKdtmDmqJUvPtOFyfVbTuEbej++4va7FwFcwgmRaAX6FRRRu
         8+5nT5awtINvazEblcmyVAS+7Wrn/uYLPbBjZXecy/5QVujZ3KTYKOWBshc8LDhfHpWu
         emFTYDzpy5p10mgWDKIgdIWdgnJmrIWsGl4oQFyI636CGhYzB4KWGhbhW9RiLvajgs2V
         S05C8LfZCfg9yyElAS//jJILX4gJ8SsJgultRrJxpwI+nbeZVf9fWDnEW99fQjaPCsPW
         Gz/P/7ZeNBddCfllqy1zCWvXhe0pASZ97UeaTIvV0G5SV3I/q3mid9Z9fvmb4hfsVbhh
         uI/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761501319; x=1762106119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BU/OVZkhFNUOoFCHhkl2TNsQ4jyGlF9k1fRMPXpk2ak=;
        b=aEv66v8TYYQuyQScheco0KvUCarmRXR65uRio4AaPquYtKUKD7nZPkI85CU5pGdCDA
         k9qrw9qHL3hfNauhy+221E6W6xro1/8IQDAeKq9wCf2V2VboYmcU+EmYdv8N7bflD5c0
         AH3d7S9DN+18r+WRQ9MlOoQmNtIcHCkMk9iQ728FEjnHgvGEi4PmuUXXXEFVnyCc8Y1l
         e3B//KWnTjohKIY3z/QvKy4OLENMfkYjCwT44JnNIVy6c/sM03DycOm7ckYnJqjx9LVE
         uX1V9CKkG4j+/5nUrPkfoRd7dsRK7KGQJ0L+sA5yszSwQiiDnbn0TqRaG/nobO2XQ7ib
         MiFw==
X-Forwarded-Encrypted: i=1; AJvYcCWVTnhsc7U34e+JRkUTC3Jxs2EULk3Uhl8P8ds6sVsmUxCH0a6l07wRTM4QUnJEM5NyNbxtU4re28u7yxjuJW25aYq4UA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5ABOAuqCqrWGyosJ8L3A6gKYMgl8C4t/F/rVnePU6U3u7RYxg
	0v6Wa52CeNoGjqHPqWVADhBFEJ+bqqWgUH4uZJ4f+g41Ve3Zl9X0c21i
X-Gm-Gg: ASbGncvPiNz4xMT49DmfNdTQ2viilce5xadqlzmFZLZAVXYdHS1ePhc5ecaH37CieNQ
	iESa4jZQk3g9kJ2Y2cnE9IpifSXtzrsLy/eTYcFX4pZx33elj/rVtahVn+zxEU70ceDK2pM1j51
	z85H6JdZVsVSNp/9qRDPOqFzOmmU8Pk5mR7dtQiW/LKMmJ+Xpm4KkxMVGpqykowlOi9FpZA18yi
	anBUcJnV25F10I0cGeJ8sFUQCPxzRTrCu+HWSGYrxYNSwnzPHjGSC3JhfIT7s213/It1DrsfpOo
	2SLq8Qnz3W8H7YQiy5HMS+76DG0Te7uYtmAGaSM/z6saMwehmhrCPv3vtSMaMUgCV5GMeC3RN+8
	QKRwBU/j/awUharXIK2e5ADqAU3gfwazIXERm2zCJSdY20RUc1hPqSdE21VLe+tEGq3/vjPbQhk
	QaWZpntSnLzIjHNzmX7EvbIm/FzBn/MTBQgeILQ0EzAoJwvMoBllL7j6NWkx/5Kx353kki4VSGN
	I91OQ==
X-Google-Smtp-Source: AGHT+IHtoxrSHSNCI+CS585O+ZJjSo87+gdMzyAlT3jsfOF+kLbMUFYgGNOn1A7r8TyRNijf4nEX9g==
X-Received: by 2002:a17:902:cece:b0:292:fc65:3579 with SMTP id d9443c01a7336-292fc65380cmr248557725ad.17.1761501319468;
        Sun, 26 Oct 2025 10:55:19 -0700 (PDT)
Received: from debian.domain.name ([223.181.110.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e4349fsm54813845ad.107.2025.10.26.10.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 10:55:18 -0700 (PDT)
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
Subject: [RFC PATCH net-next v2 2/2] net: ethernet: Implement ndo_write_rx_config callback for the 8139cp driver
Date: Sun, 26 Oct 2025 23:24:45 +0530
Message-ID: <20251026175445.1519537-3-viswanathiyyappan@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251026175445.1519537-1-viswanathiyyappan@gmail.com>
References: <20251026175445.1519537-1-viswanathiyyappan@gmail.com>
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
index 5652da8a178c..3480079361f3 100644
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
+	read_snapshot((&snapshot), struct cp_private);
+
+	/* We can safely update without stopping the chip. */
+	cpw32_f(RxConfig, snapshot.rx_mode);
+
+	cpw32_f(MAR0 + 0, snapshot.mc_filter[0]);
+	cpw32_f(MAR0 + 4, snapshot.mc_filter[1]);
+}Firstly, think whether you have a bug fix or new "next-like" content.
Then once decided, assuming that you use git, use the prefix flag, i.e.
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
2.47.3

