Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9276D2FFDF2
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 20 Sep 2025 18:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758392365; cv=none; b=a5Mt3T5Zt3ip98uzD/EtHWHvyrFO8M3Q0D5SATq5ukvZ3dnlTmpltqMkaX0zRExw+uc73gSgI923l7Twf7yL7GdsFEbHrInO/XSlmDasD7l0LxA4x/OqB4dSnhD5c+crdZDHZ5tOF+n9NFtbopV+Dnm9T8fUhEYpVYuvPTZP19w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758392365; c=relaxed/simple;
	bh=j0KscSpgDTh6p8uZuHcSUU4TuFDxi/q/TSOCxgtNYQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AfDW3OJwM2p0A0Jowu6JWCmYHxnZTI9deiqLLwChAlITx7Q/veANAdHdb2E1alhTDAqveH4iVLda5H/yvUZWfdxpnvU3pKaYkhV5miVFceC4YscPDWYlNca+zcCDROkR2CLPhv+ZNry5QBlp4w31yo5O1Zkl4VO4IOiioI2iZXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EHJJA2v8; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EHJJA2v8"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-32eb76b9039so3582375a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 20 Sep 2025 11:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758392362; x=1758997162; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MsB3ybCNAwm9k2yVhlgR9mb4hVI5Wt65HmznqvnReQI=;
        b=EHJJA2v8zxF1POF38l33H1lIj3GfH31a/cmwYd2IoltpfzjQu4nPuX4uNLC4orvris
         9e26gw9Q5Yo8CccmCq2O9iHEJF2Iq+P/cLhsWWIj2rFG6tp5fW7i2inx6swgEO46sXol
         SCS7pvBFXwea4ocBJo6e/OH/ydGs66pZhdPpkOxsi907seGSISyvPvOcsZCOodSixaPU
         OHxco04gff/ZkgyjKif4rIEnSf5rmoB+NlXi8VdhhlZHm9o48hMIJnD93PejfF+/a6Cy
         lFWB7O8VRlk7VaXQnTy6AMatEexHrplKOQNfaQhILEA8UPokMEU7Otl+IBkSjo/ubbzq
         ImWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758392362; x=1758997162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MsB3ybCNAwm9k2yVhlgR9mb4hVI5Wt65HmznqvnReQI=;
        b=CHg2Cb6s7xTM0pMFsx5pEls527o8PyWEiWg2VJAhw3i+OBeNj7qk4NK2F5GwOdMhzh
         cSr3/wNk1gFWsabqz1ydL3By0wGVnMMuKNcft4i56yWEFjblG1UEHnkJA0aW+Dn83XHm
         aseYm+fjyS9tASvnBdLPtDN8Cm1/veVtPK0pVuwFInjz+UVVIKYUjAwYPyAQgAj6vz1X
         n4lX/oI1GCgWSA9zfo0AIcRH2Kb4MJc7R1Fa3It8B1vqJI+tlaRqCQSbuKO9B9H752ld
         PJpJQYRFl8ChOZB7/wtloHVEZCiv460TkDT5gh/YPicwlvl8oupswBzdmIaR+tVntCrv
         w+yg==
X-Forwarded-Encrypted: i=1; AJvYcCXTOBJyfjQNLIkA/+LghNomF7qSBXZlGwA0Qt7TLxbzTtfG2kNKoM3iPePy/ZTWwHsjP+z5RxB/Cq0RdAOYhOLEM0f3ew==@lists.linux.dev
X-Gm-Message-State: AOJu0YyMCkko/hpIW0gYpJEjLFWE0CHBYFaD11ILqb5seGgCHkrEOKAZ
	vJciA1+Q2LBZttL5dEwh535x/AqPBY0+m2ibaKANmMS9oVIONQtvVXzY
X-Gm-Gg: ASbGncv10MgGso34ifLBn5+2cavtAcRvIH9yYEjIx1yVaJoK1/BYtm01hDBuhsqRDe+
	gKu+MSCQVdk5HEfCXX/xcmKZy2RkDrDQmx2MkUXi1gZorQbpBsSaV3B0SztlgF+nOAUXcVBM8Wj
	esO/NZReqKHil6ega6jxrHqiZRAol8bEh7nafWyWQh3vPfgphlkCh48iNxY/oEM/Yxi8dQejb6E
	imqbHMhsi4OKqkUyTTR0UCZ7X3Cj5rLIC1qjH/3Mf0HUGYbphIFlgIJLwVZ+F0D/kGAYBtrvjKD
	VOYHKkapUX1OZn3vGHy0bzpT79OclOAP0i7gVuwQ8Uyg9IifZQbKFnKLIKmxTHIjLwCXIgpLEms
	fSYnABghNXpyly+ATE3Kih8aiswP1t/wxenahV9XdVEm1uxwXiY/wMMEO1jv09WdKpGr992waHD
	SAWZsibHlv8t+b3izIKjweMGtB
X-Google-Smtp-Source: AGHT+IEaTWmiA3XTR7Y1Rj/vhL0ff7KTrbIcR7Uh/NeSNgRJpoApT9tUEOXDbbipmuTXwbyEfyPk2g==
X-Received: by 2002:a17:90b:48ce:b0:32e:d16c:a8c6 with SMTP id 98e67ed59e1d1-3309800002cmr9978667a91.16.1758392361524;
        Sat, 20 Sep 2025 11:19:21 -0700 (PDT)
Received: from debian.domain.name ([223.185.129.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-330607e9475sm8811270a91.19.2025.09.20.11.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 11:19:20 -0700 (PDT)
From: I Viswanath <viswanathiyyappan@gmail.com>
To: andrew@lunn.ch
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	david.hunter.linux@gmail.com,
	edumazet@google.com,
	kuba@kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	petkan@nucleusys.com,
	skhan@linuxfoundation.org,
	syzbot+78cae3f37c62ad092caa@syzkaller.appspotmail.com,
	viswanathiyyappan@gmail.com
Subject: [PATCH net v2] net: usb: Remove disruptive netif_wake_queue in rtl8150_set_multicast
Date: Sat, 20 Sep 2025 23:48:52 +0530
Message-ID: <20250920181852.18164-1-viswanathiyyappan@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <83171a57-cb40-4c97-b736-0e62930b9e5c@lunn.ch>
References: <83171a57-cb40-4c97-b736-0e62930b9e5c@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot reported WARNING in rtl8150_start_xmit/usb_submit_urb.
This is the sequence of events that leads to the Warning:

    CPU0 (in rtl8150_start_xmit)   CPU1 (in rtl8150_start_xmit)    CPU2 (in rtl8150_set_multicast)
    netif_stop_queue();
                                                                    netif_stop_queue();
    usb_submit_urb();
                                                                    netif_wake_queue();  <-- Wakes up TX queue before it's ready
                                    netif_stop_queue();
                                    usb_submit_urb();                                    <-- Warning
	freeing urb

rtl8150_set_multicast is rtl8150's implementation of ndo_set_rx_mode and
should not be calling netif_stop_queue and notif_start_queue as these handle 
TX queue synchronization.

The net core function dev_set_rx_mode handles the synchronization
for rtl8150_set_multicast making it safe to remove these locks.

Reported-and-tested-by: syzbot+78cae3f37c62ad092caa@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=78cae3f37c62ad092caa
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: I Viswanath <viswanathiyyappan@gmail.com>
---
v2:
- Add explanation why netif_stop_queue/netif_wake_queue can be safely removed
- Add the net prefix to the patch, designating it to the net tree

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

