Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45F1349B18
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 20 Nov 2025 14:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763648181; cv=none; b=PoUd5TmhLdeB5vkJ2rAolQGaAihkeBT+Z8Wqs0A+iT+SYfbP8tIL/zCRLokVDkB5sCfYFZe+pB/NgYEGEAJn2ooNhDQ5zZU2BoH86udXBXYQ3SedZKrLSht3Jsg/5MdljTBSw180UWVwyggZ//IaVkwRwCJLYI9aoctnm93fM9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763648181; c=relaxed/simple;
	bh=4lUxBl35hiX+aOQNkVxqqufLHrFNbtmDbn1ycs8l5GQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UaUAtrG9Lg5akw3B8y4TcabGoO0XWu97rThiQHMS/v2nLORV7RcB1U+TM/0VyQMbq5OpU4DrJzbP3wIrwGB2Pl+1CXPQ9WMHSaDBDeYkIlXKGMMznC4xnTI7l5UedabzcJ1ETk3zBS0MG/hrnU2dJgZebdbJID1zYUYr/96q9sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=amlf6fcB; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="amlf6fcB"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2956d816c10so11228365ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 20 Nov 2025 06:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763648179; x=1764252979; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OAGq5XcXm/Y4JxXSxKOtW3K0P9eaNPEoSVdhsih2P6s=;
        b=amlf6fcBmwnz24eegMlxQgofqiUjOznKWCxTGI8srBWK3h7fXgVGhXOszhpOy95hix
         bNl9hw0l1EV7gYFXcuCn9oDGiMmPpS5pzrJ5wSBQrbfKhX20PYWGLbEeawm25J101bJX
         fYpCXl261nSWlpZk85FZyNEPkw2tiGfVtdQID+NKnTN4TWX1KmZu3wu/vXKSzbgr1/gE
         m/zUZ7JnIIchIi+2QZrgSi+c+Ut+l9c38fYvtohbOHtCEr7rVCxBAPFJFP8IxsHEInA3
         uybzvYgRlcQ187QYPnFwSpVnFyhN/s+AhJIeXq5mVDce58wAVj9eU54/gkusKORE0xTn
         Kn7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763648179; x=1764252979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OAGq5XcXm/Y4JxXSxKOtW3K0P9eaNPEoSVdhsih2P6s=;
        b=Y7T6fLpiSkCxrQBNjHgbMR5IglYbkHy8aXrPIZYv8Ztw7BgU3bF6xMuR/mWRfSkeGr
         wmmd7OXpDE1Ux5KqbLwX7TTGPfXbZiyrKm+TrGpuRXPHg4TldBMP8FfGAvJLfD/Hxas2
         Jg6cxMnk0YOor74WakZmuHHo5TdQxZaIfGITKbx54GqYEWw8fCh5n4HD2yUilPmf6F1k
         C1qg0PVwe22n+xBhFqpk0f6HUx4VUVe4UI+S42KxNw6ByQQSFOByhT6sL167sQJIibtq
         /oOa2N79UMstvInIIBDWKCVM3H+yQJkiW0/8fXWzLfeFZmEVy+tre9Zyc9SPaduQkltr
         QhyA==
X-Forwarded-Encrypted: i=1; AJvYcCWBdtITlEzUSnpPauHwBcFEwiQGO/0gDgBpHc6LFj4T/67FucNx0GS5v3NXTTykMKbe4vvLJ8139xO982PB1vXlWtLp9w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwfcRsIgq5dodT56PsZBMfZMb51GzcHHapTfhbVwCCtDPouQ0Eq
	0kDQP3YxdgU6/5u/hqjagF0nX0FxPTpHV9FgJTLE1aFmerqRTJ6VbRXs
X-Gm-Gg: ASbGncskgVrMc9ZPyFsC2aZXow+51c+SMrZTXmg4FFnV/Yho4HI4LrAIZRSFc2mi1Po
	fJQIS2lxrFM2617or/zrg0wbhQWMZk32FxNqkKe4FlNfBmDGvEuJMfwJjuABtzL+yJv6QGNeJbw
	m1OyW9R9zSgq8UG8F/SN26fIKfygbcxNUvIEBCAvoNwBacXdcCcavOqMKOe4KWZfiiDBkgngv8B
	5rbN4aB7ueRwIN0QSNferIwyTmB96iTGuG+04gZ3fKL52dSwsDGnOnp76u3gRiYkkbnUf/3TaKO
	3aGS57HDKvMy2iX/AIhWXofsF8Vvie6tIOxTyockY01He+YDQMm5ke5r/S1woip979cVnJHDrsc
	wfoK4q2+c8vjVqb+l0VU5YDFiv/siiYUZYhsTblG2ux6F54dVypGIUW5FeOexo6dCisu01VGhFy
	sk6V29SAG0XTHHLxqtsR9G8uPrNMInMk8=
X-Google-Smtp-Source: AGHT+IFSkh83U/i2V3nJDK19i9ZiBFZsM67zxW6fP6ALH6yW1nwB7efOT9W49MC+dLNf/XtfEJOJTQ==
X-Received: by 2002:a17:902:e787:b0:298:6a79:397b with SMTP id d9443c01a7336-29b5cdcf0a5mr36923155ad.56.1763648178714;
        Thu, 20 Nov 2025 06:16:18 -0800 (PST)
Received: from COB-LTR7HP24-497.. ([223.185.131.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b138bcbsm28442915ad.29.2025.11.20.06.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 06:16:18 -0800 (PST)
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
Subject: [PATCH net-next v5 2/2] virtio-net: Implement ndo_write_rx_mode callback
Date: Thu, 20 Nov 2025 19:43:54 +0530
Message-Id: <20251120141354.355059-3-viswanathiyyappan@gmail.com>
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

Implement ndo_write_rx_mode callback for virtio-net

Signed-off-by: I Viswanath <viswanathiyyappan@gmail.com>
---
 drivers/net/virtio_net.c | 58 +++++++++++++++++-----------------------
 1 file changed, 25 insertions(+), 33 deletions(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index cfa006b88688..02bf9bc970a0 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -460,9 +460,6 @@ struct virtnet_info {
 	/* Work struct for config space updates */
 	struct work_struct config_work;
 
-	/* Work struct for setting rx mode */
-	struct work_struct rx_mode_work;
-
 	/* OK to queue work setting RX mode? */
 	bool rx_mode_work_enabled;
 
@@ -3857,33 +3854,31 @@ static int virtnet_close(struct net_device *dev)
 	return 0;
 }
 
-static void virtnet_rx_mode_work(struct work_struct *work)
+static void virtnet_write_rx_mode(struct net_device *dev)
 {
-	struct virtnet_info *vi =
-		container_of(work, struct virtnet_info, rx_mode_work);
+	struct virtnet_info *vi = netif_rx_mode_get_priv_ptr(dev);
 	u8 *promisc_allmulti  __free(kfree) = NULL;
-	struct net_device *dev = vi->dev;
 	struct scatterlist sg[2];
 	struct virtio_net_ctrl_mac *mac_data;
-	struct netdev_hw_addr *ha;
+	char *ha_addr;
 	int uc_count;
 	int mc_count;
 	void *buf;
+	int idx;
 	int i;
 
 	/* We can't dynamically set ndo_set_rx_mode, so return gracefully */
 	if (!virtio_has_feature(vi->vdev, VIRTIO_NET_F_CTRL_RX))
 		return;
 
-	promisc_allmulti = kzalloc(sizeof(*promisc_allmulti), GFP_KERNEL);
+	promisc_allmulti = kzalloc(sizeof(*promisc_allmulti), GFP_ATOMIC);
 	if (!promisc_allmulti) {
 		dev_warn(&dev->dev, "Failed to set RX mode, no memory.\n");
 		return;
 	}
 
-	rtnl_lock();
-
-	*promisc_allmulti = !!(dev->flags & IFF_PROMISC);
+	*promisc_allmulti = netif_rx_mode_get_bit(dev,
+						  NETIF_RX_MODE_PROM_EN);
 	sg_init_one(sg, promisc_allmulti, sizeof(*promisc_allmulti));
 
 	if (!virtnet_send_command(vi, VIRTIO_NET_CTRL_RX,
@@ -3891,7 +3886,8 @@ static void virtnet_rx_mode_work(struct work_struct *work)
 		dev_warn(&dev->dev, "Failed to %sable promisc mode.\n",
 			 *promisc_allmulti ? "en" : "dis");
 
-	*promisc_allmulti = !!(dev->flags & IFF_ALLMULTI);
+	*promisc_allmulti = netif_rx_mode_get_bit(dev,
+						  NETIF_RX_MODE_ALLMULTI_EN);
 	sg_init_one(sg, promisc_allmulti, sizeof(*promisc_allmulti));
 
 	if (!virtnet_send_command(vi, VIRTIO_NET_CTRL_RX,
@@ -3899,27 +3895,24 @@ static void virtnet_rx_mode_work(struct work_struct *work)
 		dev_warn(&dev->dev, "Failed to %sable allmulti mode.\n",
 			 *promisc_allmulti ? "en" : "dis");
 
-	netif_addr_lock_bh(dev);
+	uc_count = netif_rx_mode_get_uc_count(dev);
+	mc_count = netif_rx_mode_get_mc_count(dev);
 
-	uc_count = netdev_uc_count(dev);
-	mc_count = netdev_mc_count(dev);
 	/* MAC filter - use one buffer for both lists */
 	buf = kzalloc(((uc_count + mc_count) * ETH_ALEN) +
 		      (2 * sizeof(mac_data->entries)), GFP_ATOMIC);
 	mac_data = buf;
-	if (!buf) {
-		netif_addr_unlock_bh(dev);
-		rtnl_unlock();
+	if (!buf)
 		return;
-	}
 
 	sg_init_table(sg, 2);
 
 	/* Store the unicast list and count in the front of the buffer */
 	mac_data->entries = cpu_to_virtio32(vi->vdev, uc_count);
 	i = 0;
-	netdev_for_each_uc_addr(ha, dev)
-		memcpy(&mac_data->macs[i++][0], ha->addr, ETH_ALEN);
+
+	netif_rx_mode_for_each_uc_addr(dev, ha_addr, idx)
+		memcpy(&mac_data->macs[i++][0], ha_addr, ETH_ALEN);
 
 	sg_set_buf(&sg[0], mac_data,
 		   sizeof(mac_data->entries) + (uc_count * ETH_ALEN));
@@ -3929,10 +3922,8 @@ static void virtnet_rx_mode_work(struct work_struct *work)
 
 	mac_data->entries = cpu_to_virtio32(vi->vdev, mc_count);
 	i = 0;
-	netdev_for_each_mc_addr(ha, dev)
-		memcpy(&mac_data->macs[i++][0], ha->addr, ETH_ALEN);
-
-	netif_addr_unlock_bh(dev);
+	netif_rx_mode_for_each_mc_addr(dev, ha_addr, idx)
+		memcpy(&mac_data->macs[i++][0], ha_addr, ETH_ALEN);
 
 	sg_set_buf(&sg[1], mac_data,
 		   sizeof(mac_data->entries) + (mc_count * ETH_ALEN));
@@ -3941,17 +3932,18 @@ static void virtnet_rx_mode_work(struct work_struct *work)
 				  VIRTIO_NET_CTRL_MAC_TABLE_SET, sg))
 		dev_warn(&dev->dev, "Failed to set MAC filter table.\n");
 
-	rtnl_unlock();
-
 	kfree(buf);
 }
 
 static void virtnet_set_rx_mode(struct net_device *dev)
 {
 	struct virtnet_info *vi = netdev_priv(dev);
+	char cfg_disabled;
+
+	cfg_disabled = !vi->rx_mode_work_enabled;
+	netif_rx_mode_set_bit(dev, NETIF_RX_MODE_SET_DIS, cfg_disabled);
 
-	if (vi->rx_mode_work_enabled)
-		schedule_work(&vi->rx_mode_work);
+	netif_rx_mode_set_priv_ptr(dev, vi);
 }
 
 static int virtnet_vlan_rx_add_vid(struct net_device *dev,
@@ -5767,7 +5759,7 @@ static void virtnet_freeze_down(struct virtio_device *vdev)
 	/* Make sure no work handler is accessing the device */
 	flush_work(&vi->config_work);
 	disable_rx_mode_work(vi);
-	flush_work(&vi->rx_mode_work);
+	netif_rx_mode_flush_work(vi->dev);
 
 	if (netif_running(vi->dev)) {
 		rtnl_lock();
@@ -6270,6 +6262,7 @@ static const struct net_device_ops virtnet_netdev = {
 	.ndo_validate_addr   = eth_validate_addr,
 	.ndo_set_mac_address = virtnet_set_mac_address,
 	.ndo_set_rx_mode     = virtnet_set_rx_mode,
+	.ndo_write_rx_mode   = virtnet_write_rx_mode,
 	.ndo_get_stats64     = virtnet_stats,
 	.ndo_vlan_rx_add_vid = virtnet_vlan_rx_add_vid,
 	.ndo_vlan_rx_kill_vid = virtnet_vlan_rx_kill_vid,
@@ -6891,7 +6884,6 @@ static int virtnet_probe(struct virtio_device *vdev)
 	vdev->priv = vi;
 
 	INIT_WORK(&vi->config_work, virtnet_config_changed_work);
-	INIT_WORK(&vi->rx_mode_work, virtnet_rx_mode_work);
 	spin_lock_init(&vi->refill_lock);
 
 	if (virtio_has_feature(vdev, VIRTIO_NET_F_MRG_RXBUF)) {
@@ -7196,7 +7188,7 @@ static void virtnet_remove(struct virtio_device *vdev)
 	/* Make sure no work handler is accessing the device. */
 	flush_work(&vi->config_work);
 	disable_rx_mode_work(vi);
-	flush_work(&vi->rx_mode_work);
+	netif_rx_mode_flush_work(vi->dev);
 
 	virtnet_free_irq_moder(vi);
 
-- 
2.34.1

