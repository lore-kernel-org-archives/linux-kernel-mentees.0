Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00A93054F8
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 24 Sep 2025 13:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758721451; cv=none; b=s9M85ZLKFY3tEdom6ZVcGdEfOOGCiXzxahCo9OcdX4GJvrYm24WBPEvsWkBQNMr/1cG6dZ19/RzARyDD4TY7P+cGXroHxxYNfGwawEsycV2salmXk1ZTwpU0Rn54wxtzeBemg2UoW2lHE3b1+lMvfgCDoCVZ2M7DsZ3qb29F/aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758721451; c=relaxed/simple;
	bh=4wLHZd33H8ehWtqgfz/soUMTx6YkXPchLkux0RhTQvY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j6b5akoehW1alCmKw4Hiqa4y5oLsssRz1HkyG3ww9vOsK1iGeOSA1xUdD7d4Nqy92GeM7yhioQGH4oHdO/sFITeyeoW08eqqLvuhzXLTYz0lhxfnnRFCFjCfmMta++EtrBLmL/eQHgSuA4NGZXJEXyPg5Lad6ZJtJD9i2U9VOdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FQgmey0K; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FQgmey0K"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-32ee4817c43so802411a91.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 24 Sep 2025 06:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758721448; x=1759326248; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4ERu7wVLsz3ac7e7KRVwhrDHIHWN9PyFzkY9Sy5iLE=;
        b=FQgmey0KQtQXSBESrU/df/aOg0pkEboqaZSxMNm/KnDMHt7DTcEVr9CYigFsaT7TxN
         qSnuDoQ9wrusQPmnFExqAjzIxpTu9FIjj1b5Uy74W6KQHwfI3JBwLOgM/RbKCbNu+PN8
         INfTkp/Y9hLW02XodTkX9Fp1Vx2J5OYjLuvSapCpTwblVp6Ruq0I/m6xHJODNmcdOieG
         mDI9LSYkJZR6QWWWAQxxllA2WOthiv8wVoOeRrKYhiutSAKR4+YhwsG9SPePMUpec4zu
         QrcFXePewGZ9NSaq6M7chvEdjsZkVX/FNQQkw4GHTuOMbVAxjvWZ6lbYJclCGIMCLf8e
         h+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758721448; x=1759326248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y4ERu7wVLsz3ac7e7KRVwhrDHIHWN9PyFzkY9Sy5iLE=;
        b=Q8C9Y2KfB0G3w2GLEjIISBp7er07HP1JI3xSoRsYUi7pnKqdSMEyTnA8cmYk243nYB
         B72OVEAjYPVjUSMkZjsk1B+fED1IIVSm0BBZYW9V/Zo+jBRfOw4p6BmqvUhfIHBhX9Tg
         3OCtfykzq7UDnHnyLXzWPMbiwBohWXda9SpmORf5KyrZRO48LRB8WFWbXPY/aThmzke7
         o/vFkPpiGxpZ9TWRHoKfD6TQuM3ozyXRsRUq1epvGktMLN4sVAK3278LnCkxo9aEdurK
         Yd9ukIbKtx1xJ3Y4E8SVmtgD98YeaMbx9VJNZgvgyQ+1QneaX3wtYUH/albMeZsTI0MN
         /pVw==
X-Forwarded-Encrypted: i=1; AJvYcCVk9ho+VqY0p+UbbJzdJR0gFDpWQc/GWXiQZsTP8th3rk1C/0yOb0lado3UeEwnMy8BJvHZDCqFGDKEWCjqlEi5kfBj6Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyupfdnrTgYZSDfpbbBhDMw0dKo1Z4d4D0teuHaNja1uMfIMZ80
	z+Eja37K7aWLWg1CrC3HzH1LNHSAHrO2kw/sGPALJfdrd8dSCIwGtq5u
X-Gm-Gg: ASbGnctRHUkJ/xwGzEPz8MrNvk3G3uQp3D7ChsmxoFu3OizKX4s3OTPSX5TurElq2Rz
	/I7nANlJ1d2fBdnjjRveYJLNx6NuZ+UI92YexvZxrf6ebfx/8oCNQBwnxO1iKZapQ3tv6pGaIvn
	7idqkCAVcd+Vtw7ertiRgLihQquYjCXLI67VdkQUA1lIpoGoUlOBi5qK/5iS05chXhBwXmhfiOO
	tb94maKVSfECvVrjkobmGTe/+Zp+m0dlsCMh44x8t9W+ZFYU+viVuAfnc6rFMbc2bdATeW9zL80
	905EXbNRIp4YFZxN8PMJ0OtoSMUVb4oIHc8U3m7ghCVpgOOyOIYLtdXjTU35rDJ4EnzUIuUmPKr
	RnHWHN+elkF1RnQ2/mDta18Su/eCPOoyNgNJYXHkXWthxpIa63RXepm9+1lIOUsTa2bSRM/0ADU
	j5xUrWEvwP57WC
X-Google-Smtp-Source: AGHT+IE/4+SM58UU/wqTR/yIT31R0oJ4u37QZEN5c3JMJpyuvVeiCRq+ypyCOhvw3JyqJDdBS271KQ==
X-Received: by 2002:a17:90b:3fce:b0:32e:dcc6:cd3f with SMTP id 98e67ed59e1d1-3341bfeffbdmr2681721a91.14.1758721447987;
        Wed, 24 Sep 2025 06:44:07 -0700 (PDT)
Received: from debian.domain.name ([223.181.105.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341be45620sm2486219a91.29.2025.09.24.06.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 06:44:06 -0700 (PDT)
From: I Viswanath <viswanathiyyappan@gmail.com>
To: kuba@kernel.org,
	michal.pecio@gmail.com,
	edumazet@google.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	petkan@nucleusys.com,
	pabeni@redhat.com
Cc: linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	david.hunter.linux@gmail.com,
	I Viswanath <viswanathiyyappan@gmail.com>,
	syzbot+78cae3f37c62ad092caa@syzkaller.appspotmail.com
Subject: [PATCH net v3] net: usb: Remove disruptive netif_wake_queue in rtl8150_set_multicast
Date: Wed, 24 Sep 2025 19:13:50 +0530
Message-ID: <20250924134350.264597-1-viswanathiyyappan@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot reported WARNING in rtl8150_start_xmit/usb_submit_urb.
This is the sequence of events that leads to the warning:

rtl8150_start_xmit() {
	netif_stop_queue();
	usb_submit_urb(dev->tx_urb);
}

rtl8150_set_multicast() {
	netif_stop_queue();
	netif_wake_queue();		<-- wakes up TX queue before URB is done
}

rtl8150_start_xmit() {
	netif_stop_queue();
	usb_submit_urb(dev->tx_urb);	<-- double submission
}

rtl8150_set_multicast being the ndo_set_rx_mode callback should not be 
calling netif_stop_queue and notif_start_queue as these handle 
TX queue synchronization.

The net core function dev_set_rx_mode handles the synchronization
for rtl8150_set_multicast making it safe to remove these locks.

Reported-and-tested-by: syzbot+78cae3f37c62ad092caa@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=78cae3f37c62ad092caa
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Tested-by: Michal Pecio <michal.pecio@gmail.com>
Signed-off-by: I Viswanath <viswanathiyyappan@gmail.com>
---
v1: 
Link: https://lore.kernel.org/netdev/20250920045059.48400-1-viswanathiyyappan@gmail.com/
 
v2:
- Add explanation why netif_stop_queue/netif_wake_queue can be safely removed
- Add the net prefix to the patch, designating it to the net tree
Link: https://lore.kernel.org/netdev/20250920181852.18164-1-viswanathiyyappan@gmail.com/
 
v3:
- Simplified the event sequence that lead to the warning
- Added Tested-by tag

 drivers/net/usb/rtl8150.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
index ddff6f19ff98..92add3daadbb 100644
--- a/drivers/net/usb/rtl8150.c
+++ b/drivers/net/usb/rtl8150.c
@@ -664,7 +664,6 @@ static void rtl8150_set_multicast(struct net_device *netdev)
 	rtl8150_t *dev = netdev_priv(netdev);
 	u16 rx_creg = 0x9e;
 
-	netif_stop_queue(netdev);
 	if (netdev->flags & IFF_PROMISC) {
 		rx_creg |= 0x0001;
 		dev_info(&netdev->dev, "%s: promiscuous mode\n", netdev->name);
@@ -678,7 +677,6 @@ static void rtl8150_set_multicast(struct net_device *netdev)
 		rx_creg &= 0x00fc;
 	}
 	async_set_registers(dev, RCR, sizeof(rx_creg), rx_creg);
-	netif_wake_queue(netdev);
 }
 
 static netdev_tx_t rtl8150_start_xmit(struct sk_buff *skb,
-- 
2.47.3

