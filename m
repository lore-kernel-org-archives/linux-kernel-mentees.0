Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D974C1E32A2
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 20 Sep 2025 04:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758343924; cv=none; b=cuSEGGtorkNcmRq5C4JTT26cpmTP2hofJoQ1cvJ9ude6NZosCqw+OT5smMKAK5nrYRY86X9vEIMlPFw9zwo0hy7RzStW+8o/7XMKJZdCwKNFh3bZMo3+nSJHjIT/2WEyBvCal632oebkPMcE+pRQL8b/XKf4k+CPqI9f3WWZSg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758343924; c=relaxed/simple;
	bh=WN7syAcJjhlULwaP/4Xo2Ytf7vzgMmwSdXXWwuslg+0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RbmMkbazRSRum5y0/2hmskS7c7e2N4a2tqzWkZRN8Roj0f0Z3qrHRdAZMTCYEopXPzjEmC9oP3z2JN6imVeh+Z+gYSFy5p4d3YxvtqvG0GedvmPMFE1jr0XuscYG8SamG4dJzUV5vRJHp9ZLPyx5FH6Xto9+gfbrBcaOZTR9SWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QW8o8Zt3; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QW8o8Zt3"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2681660d604so26037525ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 19 Sep 2025 21:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758343922; x=1758948722; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Scl7/ytKRP3iThro/p3ZtlDfxCKkscpWY86iDRO/ZlI=;
        b=QW8o8Zt3EWYcVEI53+BvQS2eGu5e6W1kvOjijG7IyJ+W1a9TQNpXDZC1Tv5V+YLyHA
         +yKj31wQZmaKDcUJa3QSVkqKiexgdQ8YrO8U4rdnhAIjXdvJ2bX7DAv7KpQHrvb5yAIe
         TEAv5ciX3+BUXVXyblXBoLFfF5JGWiAGqUq4UeyP9w/I5x7CMpI6zcF86OPSEteoQPwd
         YjdV67QzFb4QjZbrmt2IHT6zklkGi0AvKeNOy4A2i+IbXed9gWkhcVd/LCBBifuLk8y+
         X/8jfwy1aOymrq7unFL/lyY03oarYF1o4rfLO8uBUeY7xSeLqEW2Y3p2bxvPWLeRDrhZ
         toUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758343922; x=1758948722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Scl7/ytKRP3iThro/p3ZtlDfxCKkscpWY86iDRO/ZlI=;
        b=Wp2crOwY4/1vu1vGRJFwZo7F5XcLo40ZoIYlpezUg12/R0siuLK+RANzTgCvyDi5QC
         HM+y3FCq58zPm7+YG+t7rxNbLDuy8/PfrSTQx2gux8aDGM9dfnAT44/hL9/rGHqSe5E8
         dtEhHvjXkWf1WkojVAFg/PX6wS6EX/0qRk6eikNW1LXahyTOUuA3tMInAIQlJh9VG9EF
         PsLnN76VUjilfHKSeVHAr2jfqJJYZauzicOL7AvEl611LxIQCu+leIp/RDKcSBnOf0ai
         6bRhO0b5qhpnElMtqpQIGgk/CCrxHDX/3sucRowT0Dz1kFqdu4ealQJ/OkqnKZvbklSB
         PJhA==
X-Forwarded-Encrypted: i=1; AJvYcCXeh99Ly/gq+hVKKssmiD7WYonhkoJ13AWIi63z4Q8VJD4cviVn95mubXD5z8fd5MgSWUs5ye4dUSJtW363D9yHsOMIXw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3sVr1tTHwMRf2YoZo2q7Aib7xYKndLFbDhrwuzH/BLbt+WrP6
	4525e3pPShECRBkxaM7N9NbmLK+fzMgcKz2OFR+nXz4Ew0WagDu9U81O
X-Gm-Gg: ASbGnctaLN9mBn3RT/TCmiCB2zqoNj5Ox/povwrG5fQPllMdrmHzCh/kyCn4b1HcxMc
	2lx+v+Iy5UsA+MsVVzxBfbBvs9OpNsJqE/v3cTAuiyThQfq6Z+R8atUP3lAz2WcQF2Uo3WCgbsf
	VfmCnN03u4jAQNcfz2yzyPCsPRulQBupFHLvQSuD0ME/fnzntOtELKRhO9e3Vfh0IGC9k27/Lri
	swBxTiTuoP4YTKrf/CCgxKAyvlAK1W/HP5JGsGhWSBc+sXa+AkyG2YXO3SRpK6I2JJsp87k0aEZ
	WXlB2YVthYrpadXG46pdF3ysUQHK709Yq3m5V1ZSAy/VbsZKf4mraIpT6GIDveOGYPxlTnrL+g5
	y4GnwNdRXSXMzVTiFm38R140tnCG9MMiBxtXPEYRnruitTVKU0FKbr4SbJQBISXU6IHUoioYuWH
	93MbJr89Bujn9M7A==
X-Google-Smtp-Source: AGHT+IGlDL3meUrjWPh8XY00Z7lI+5NCXfWA95NkUgQ/36jV2EnYS75qSm19Zq3LWRDvSpHOtmoG2A==
X-Received: by 2002:a17:902:ec8b:b0:266:3813:27c3 with SMTP id d9443c01a7336-269ba441c40mr84447675ad.13.1758343921975;
        Fri, 19 Sep 2025 21:52:01 -0700 (PDT)
Received: from debian.domain.name ([223.185.130.103])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26980368fe3sm69258125ad.151.2025.09.19.21.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 21:52:01 -0700 (PDT)
From: I Viswanath <viswanathiyyappan@gmail.com>
To: petkan@nucleusys.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	david.hunter.linux@gmail.com,
	I Viswanath <viswanathiyyappan@gmail.com>,
	syzbot+78cae3f37c62ad092caa@syzkaller.appspotmail.com
Subject: [PATCH] net: usb: Remove disruptive netif_wake_queue in rtl8150_set_multicast
Date: Sat, 20 Sep 2025 10:20:59 +0530
Message-ID: <20250920045059.48400-1-viswanathiyyappan@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot reported WARNING in rtl8150_start_xmit/usb_submit_urb.
This is a possible sequence of events:

    CPU0 (in rtl8150_start_xmit)   CPU1 (in rtl8150_start_xmit)    CPU2 (in rtl8150_set_multicast)
    netif_stop_queue();
                                                                    netif_stop_queue();
    usb_submit_urb();
                                                                    netif_wake_queue();  <-- Wakes up TX queue before it's ready
                                    netif_stop_queue();
                                    usb_submit_urb();                                    <-- Warning
	freeing urb
	
Remove netif_wake_queue and corresponding netif_stop_queue in rtl8150_set_multicast to
prevent this sequence of events

Reported-and-tested-by: syzbot+78cae3f37c62ad092caa@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=78cae3f37c62ad092caa
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: I Viswanath <viswanathiyyappan@gmail.com>
---
Relevant logs:
[   65.779651][ T5648] About to enter stop queue ffff88805061e000, eth4
[   65.779664][ T5648] After stop queue ffff88805061e000, eth4
[   65.780296][ T5648] net eth4: eth name:eth4 SUBMIT: tx_urb=ffff888023219000, status=0, transfer_buffer_length=60, dev=ffff88805061ed80, netdev=ffff88805061e000, skb=ffff88804f907b80
[   65.790962][  T760] About to enter stop queue ffff88805061e000, eth4
[   65.790978][  T760] After stop queue ffff88805061e000, eth4
[   65.791874][  T760] net eth4: We are inside Multicast dev:ffff88805061ed80, netdev:ffff88805061e000
[   65.793259][  T760] About to enter netif_wake_queue ffff88805061e000, eth4
[   65.793264][  T760] After netif_wake_queue ffff88805061e000, eth4
[   65.822319][ T5829] About to enter stop queue ffff88805061e000, eth4
[   65.823135][ T5829] After stop queue ffff88805061e000, eth4
[   65.823739][ T5829] net eth4: eth name:eth4 SUBMIT: tx_urb=ffff888023219000, status=-115, transfer_buffer_length=90, dev=ffff88805061ed80, netdev=ffff88805061e000, skb=ffff88804b5363c0

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

