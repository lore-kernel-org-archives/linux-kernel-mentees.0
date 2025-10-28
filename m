Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB46734C155
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 28 Oct 2025 17:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761673373; cv=none; b=S4IQ47pJuM6Nbpe/XYALPJAjfUVc7yIDop2EMeGUf6o3GbiU1m2zKIb9H53gdumrOYKwvuRysvtbD76Wj3o4kTzHqdH1CpaLItLt9VTiYxXetzN7s5sWkc4KUSFm2ABW7t8snTeOkOfjI/7l43CslgyLI7yjW1zoJP0j+BAUqt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761673373; c=relaxed/simple;
	bh=6v4wjgebPozLKUgfPJH5/qazZjK7CJHOf35355Wnrh8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZiqhAe81Pv27Y6ZBSgr1Zgyx13r3VL7K773P5FvpirBz5HNYXipwQz9P/ImBMD6bKTWBeyRiDcEs5CoaOB/8orGbOsAdXqyLdHx8o6jNnPtC/k4/bC6gD4OMl5MIAM/17wBJaFiGaaZe6n6GQybMhnbpn56MJXKyNWdvNQJ3OMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QTSO3O8+; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QTSO3O8+"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-781206cce18so161521b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 28 Oct 2025 10:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761673371; x=1762278171; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3CmgKRjxqZ78TC/moM+aLGRRq1ZpH43SB88rhbo0/Vo=;
        b=QTSO3O8+tXFzlnmnM1lSKyXaGzwhqPkIucXvigQP8nhYUSopq3C52yHRLzL3n5DCIm
         pU4pnBFp+hBWp2227SIfbHnRREXA3IDfqxid48cBavP7beFQySAgIViyrGJyPGiesLkr
         x8MSJBBbqFj7gsNmtn8Lcsl9dTThXrTYg19A5aNi5mTwW1drFftxKGXpPt9RkShejBnH
         6eG3NDCEy4XFi5XRNDIlg4ntHGM+9juEAEC733ZTj6jS029NAlKJ4bWIbLXyzYqwmegy
         n0QxFwUHkFofKABh/sNsVDC1AsZXnlPjoJooy7nU8WBlrLLNGzFwHse5ObAVOJ/haNiz
         cUcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761673371; x=1762278171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3CmgKRjxqZ78TC/moM+aLGRRq1ZpH43SB88rhbo0/Vo=;
        b=sDreUMkCcgdb2phlBdU1wiCpbJLLqHnUkVWlkJB2bRYeeYnuoBDj5laez4JI5J0uFE
         qJM1PGkWKm3Yp8iGDGfw3eUmGZ6VBi3uN4Cp52iZExPq2Gh4bNkZUGTzRnNNwcU4YDew
         Ks6t3ushKBNsAVRYaV5CsZnRicTlyA2nR6FLLujTunxPNbffTlch3WT3gs0op1SGacvr
         sbO6Ls39uRV1Y6eGCM7fRBXvKoptLeg1c+vM43UtesNMmlu6Er3Lou0848k2zVzGJXsm
         MHmhjFuQufJBS9BeO9+nxOAoNu8xWy7lv+yCesgNOqzKVCdR0JCrhzclUg7J1vflcYfj
         1Apw==
X-Forwarded-Encrypted: i=1; AJvYcCUGKQPn3Y5iyynKqxqkXM3p/X4RnaHmCZ1InhZHrUmcV2UTB3euoZ21pPRn2z7nw34hu3MUcVeSHTntXVtyvDp2fuaJwA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxy3s80/jq7fLSalYvF8s1qRQ9sn51FjwndxPVEsOgV4oks8G51
	92s6EgBpKm52utFbZekmT5fH3Jyce1sMOEYWrQyTeOY5l1dcqRI6OYTE
X-Gm-Gg: ASbGnct942zUrM9n6lrsMqQB/Dfl0/Y50mHfPsQTNTTxNiAKvsrKUjCXBijIzpJafzf
	pkyUASx95tEngCB/VB7sZi0sTfTWRS0U/U7+skbVXWHK9knQ+HPtBPknnec23asCP7tFQNq4q1n
	SGqGbs5wJnzdCpGi2REydf1ckVEB56Jb7F12TtvVrGcN18P6ejAoE7Q2oeYACJwAppjRhg9R/4x
	UNO8N92rWtZbrGYOVLuYDA8Z8u7jDln46zG+LdbQp2eYDUHDgwMxbNqMR+pn4BdXtvq9wfBIYpd
	yRJ3D0aD97JiC3IkQC028q3VMuU90IpcDMJ6BDo55XOUfl38eptqej2Cx8mcg4ZnaVmFUqKH97O
	8aNWS4x9VPv0+v2ZY15Om78p0YU3svkdTypOSkBRNNVrxlhYps0zJa1sQXz20ENv7djiALZ9hE4
	CHQzHxz/+hgfxaU+5PNRZRbYT9SLVCWqsXP0goVKY2UUaPV7sYRz80MU4x78JhG0IvPC25pDO5O
	t9TrQ==
X-Google-Smtp-Source: AGHT+IF7n2P9v4I116Y5WIJSgeGFxuUTJM6UJ4Tic/BqkwkkiA9qVF8XSZ650kwCzK0xRThK/PyTsQ==
X-Received: by 2002:a05:6a21:ad16:b0:345:483a:48ae with SMTP id adf61e73a8af0-345483a4a8amr3360888637.12.1761673370932;
        Tue, 28 Oct 2025 10:42:50 -0700 (PDT)
Received: from debian.domain.name ([223.181.113.110])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b71268bde68sm11086746a12.1.2025.10.28.10.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 10:42:50 -0700 (PDT)
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
Subject: [RFC/RFT PATCH net-next v3 1/2] net: Add ndo_write_rx_config and helper structs and functions:
Date: Tue, 28 Oct 2025 23:12:21 +0530
Message-ID: <20251028174222.1739954-2-viswanathiyyappan@gmail.com>
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

Add ndo_write_rx_config callback and helper structs/functions:

	rx_config_work - To schedule the callback and handle synchronization

	read_snapshot/update_snapshot - Helper functions to read/update the
		 rx_config snapshot

	set_and_schedule_rx_config - Helper function to call ndo_set_rx_mode
		 and schedule ndo_write_rx_config

	execute_write_rx_config - Helper function that will be scheduled
		 by rx_work->config_write

Signed-off-by: I Viswanath <viswanathiyyappan@gmail.com>
---
 include/linux/netdevice.h | 38 +++++++++++++++++++++++++++-
 net/core/dev.c            | 53 +++++++++++++++++++++++++++++++++++----
 2 files changed, 85 insertions(+), 6 deletions(-)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 7f5aad5cc9a1..9f188229443c 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -1100,7 +1100,12 @@ struct netdev_net_notifier {
  * void (*ndo_set_rx_mode)(struct net_device *dev);
  *	This function is called device changes address list filtering.
  *	If driver handles unicast address filtering, it should set
- *	IFF_UNICAST_FLT in its priv_flags.
+ *	IFF_UNICAST_FLT in its priv_flags. This sets up the snapshot of
+ *	rx_config that will be written to the device.
+ *
+ * void (*ndo_write_rx_config)(struct net_device *dev);
+ *	This function is scheduled immediately after ndo_set_rx_mode to
+ *	write rx_config to the device.
  *
  * int (*ndo_set_mac_address)(struct net_device *dev, void *addr);
  *	This function  is called when the Media Access Control address
@@ -1421,6 +1426,7 @@ struct net_device_ops {
 	void			(*ndo_change_rx_flags)(struct net_device *dev,
 						       int flags);
 	void			(*ndo_set_rx_mode)(struct net_device *dev);
+	void			(*ndo_write_rx_config)(struct net_device *dev);
 	int			(*ndo_set_mac_address)(struct net_device *dev,
 						       void *addr);
 	int			(*ndo_validate_addr)(struct net_device *dev);
@@ -1767,6 +1773,12 @@ enum netdev_reg_state {
 	NETREG_DUMMY,		/* dummy device for NAPI poll */
 };
 
+struct rx_config_work {
+	struct work_struct config_write;
+	struct net_device *dev;
+	spinlock_t config_lock;
+};
+
 /**
  *	struct net_device - The DEVICE structure.
  *
@@ -2082,6 +2094,8 @@ enum netdev_reg_state {
  *			dev_list, one per address-family.
  *	@hwprov: Tracks which PTP performs hardware packet time stamping.
  *
+ *	@rx_work: helper struct to schedule rx config write to the hardware.
+ *
  *	FIXME: cleanup struct net_device such that network protocol info
  *	moves out.
  */
@@ -2559,6 +2573,8 @@ struct net_device {
 
 	struct hwtstamp_provider __rcu	*hwprov;
 
+	struct rx_config_work *rx_work;
+
 	u8			priv[] ____cacheline_aligned
 				       __counted_by(priv_len);
 } ____cacheline_aligned;
@@ -2734,6 +2750,26 @@ void dev_net_set(struct net_device *dev, struct net *net)
 	write_pnet(&dev->nd_net, net);
 }
 
+#define update_snapshot(config_ptr, type)						\
+	do {										\
+		typeof((config_ptr)) rx_config = ((type *)(dev->priv))->rx_config;	\
+		unsigned long flags;							\
+		spin_lock_irqsave(&((dev)->rx_work->config_lock), flags);		\
+		*rx_config = *(config_ptr);						\
+		spin_unlock_irqrestore(&((dev)->rx_work->config_lock), flags);		\
+	} while (0)
+
+#define read_snapshot(config_ptr, type)						\
+	do {										\
+		typeof((config_ptr)) rx_config = ((type *)(dev->priv))->rx_config;	\
+		unsigned long flags;							\
+		spin_lock_irqsave(&((dev)->rx_work->config_lock), flags);		\
+		*(config_ptr) = *rx_config;						\
+		spin_unlock_irqrestore(&((dev)->rx_work->config_lock), flags);		\
+	} while (0)
+
+void set_and_schedule_rx_config(struct net_device *dev, bool flush);
+
 /**
  *	netdev_priv - access network device private data
  *	@dev: network device
diff --git a/net/core/dev.c b/net/core/dev.c
index 378c2d010faf..69b8bfc0edeb 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -9571,6 +9571,37 @@ int netif_set_allmulti(struct net_device *dev, int inc, bool notify)
 	return 0;
 }
 
+static void execute_write_rx_config(struct work_struct *param)
+{
+	struct rx_config_work *rx_work = container_of(param,
+					 struct rx_config_work,
+					 config_write);
+	struct net_device *dev = rx_work->dev;
+
+	// This path should not be hit outside the work item
+	WARN_ON(!dev->netdev_ops->ndo_write_rx_config);
+	dev->netdev_ops->ndo_write_rx_config(dev);
+}
+
+/*	Sets up the rx_config snapshot and schedules write_rx_config. If
+ *	it's necessary to wait for completion of write_rx_config, set
+ *	flush to true.
+ */
+void set_and_schedule_rx_config(struct net_device *dev, bool flush)
+{
+	const struct net_device_ops *ops = dev->netdev_ops;
+
+	if (ops->ndo_set_rx_mode)
+		ops->ndo_set_rx_mode(dev);
+
+	if (ops->ndo_write_rx_config) {
+		schedule_work(&dev->rx_work->config_write);
+		if (flush)
+			flush_work(&dev->rx_work->config_write);
+	}
+}
+EXPORT_SYMBOL(set_and_schedule_rx_config);
+
 /*
  *	Upload unicast and multicast address lists to device and
  *	configure RX filtering. When the device doesn't support unicast
@@ -9579,8 +9610,6 @@ int netif_set_allmulti(struct net_device *dev, int inc, bool notify)
  */
 void __dev_set_rx_mode(struct net_device *dev)
 {
-	const struct net_device_ops *ops = dev->netdev_ops;
-
 	/* dev_open will call this function so the list will stay sane. */
 	if (!(dev->flags&IFF_UP))
 		return;
@@ -9601,8 +9630,7 @@ void __dev_set_rx_mode(struct net_device *dev)
 		}
 	}
 
-	if (ops->ndo_set_rx_mode)
-		ops->ndo_set_rx_mode(dev);
+	set_and_schedule_rx_config(dev, false);
 }
 
 void dev_set_rx_mode(struct net_device *dev)
@@ -11961,9 +11989,17 @@ struct net_device *alloc_netdev_mqs(int sizeof_priv, const char *name,
 	refcount_set(&dev->dev_refcnt, 1);
 #endif
 
-	if (dev_addr_init(dev))
+	dev->rx_work = kmalloc(sizeof(*dev->rx_work), GFP_KERNEL);
+	if (!dev->rx_work)
 		goto free_pcpu;
 
+	dev->rx_work->dev = dev;
+	spin_lock_init(&dev->rx_work->config_lock);
+	INIT_WORK(&dev->rx_work->config_write, execute_write_rx_config);
+
+	if (dev_addr_init(dev))
+		goto free_rx_work;
+
 	dev_mc_init(dev);
 	dev_uc_init(dev);
 
@@ -12045,6 +12081,10 @@ struct net_device *alloc_netdev_mqs(int sizeof_priv, const char *name,
 	free_netdev(dev);
 	return NULL;
 
+free_rx_work:
+	cancel_work_sync(&dev->rx_work->config_write);
+	kfree(dev->rx_work);
+
 free_pcpu:
 #ifdef CONFIG_PCPU_DEV_REFCNT
 	free_percpu(dev->pcpu_refcnt);
@@ -12130,6 +12170,9 @@ void free_netdev(struct net_device *dev)
 		return;
 	}
 
+	cancel_work_sync(&dev->rx_work->config_write);
+	kfree(dev->rx_work);
+
 	BUG_ON(dev->reg_state != NETREG_UNREGISTERED);
 	WRITE_ONCE(dev->reg_state, NETREG_RELEASED);
 
-- 
2.34.1

