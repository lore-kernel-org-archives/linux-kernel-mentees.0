Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F17532AAD8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 17 Nov 2025 11:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763377762; cv=none; b=FwbVFnh+atsaeOeRX0mcJieCycn1AwAWJwUJJdISsPmR0ih0XH6ScIlTHgx+UjXZFy5N6Wskfqmcd6NNnvlgCR7XPriUlnt9h94UZ4E9X4RZBKerlD7RBpXoIyNAsUl+JzmvnN/Hi5UC/Khqncqealo3uLsyykXLB0Mllin19uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763377762; c=relaxed/simple;
	bh=8kAqYrhnwJc7djMWVWH59rq4OKcZ9J4xOpx2+3RNXQk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GU3uoSBW/83pfsj8Gv4g0ifLqdy+pq9QrAlhRElAVCd504hxiW6nwIJxdGu8wOQxGYEdZN3Om7Ik42XBPnp66WCC7zIQ9X0KK/M54N1YW5z4SolWZaxa2kZMPNdD6yf8XXkS0qUy47KVmKCXNX/2ze0Sa/HVAbT2bCFCjiKVPV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TmUnC4kZ; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TmUnC4kZ"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A449C409E6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 17 Nov 2025 11:09:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ptrSe6hkmTpc for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Nov 2025 11:09:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=nirbhay.lkd@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F24A6409C2
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F24A6409C2
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TmUnC4kZ
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	by smtp4.osuosl.org (Postfix) with ESMTPS id F24A6409C2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 17 Nov 2025 11:09:19 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7aab061e7cbso4571572b3a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 17 Nov 2025 03:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763377759; x=1763982559; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rVb3qgwqhkzzV9bGO5gDmFq8cifzLPzDZg1sUntGPZE=;
        b=TmUnC4kZxMm1t4r4Rr5f4iUjMg8q7DJUSIwo+e0XNiMQychl4z991uurwIFzv6r1YI
         KQJDfOYetZflKL6BWD7NrX5+wARxmvwXGJbwFciUsKFGZJlyD98oAZyjwLYOhrPf+wtx
         YFFYX0Jmw0QR87x6gO7du3mzTr5WizOnNgHhZIKhxHekXrcCx74MMgeDKY2KXz2P25LG
         hPgmi6rwPjw5KaFlhKqNNTSs99uJvUEcHaQGj5up/08E2DuHkN20J2OYefJ3EUaO3m4B
         grDzKjvmvLrK7nJHoH1qnIxbS5/IyU/pNl87kdb156XKWPVmT0QaDMOrvGcxhBnjigQY
         l4pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763377759; x=1763982559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVb3qgwqhkzzV9bGO5gDmFq8cifzLPzDZg1sUntGPZE=;
        b=mmSmEnU1R/1fd5n65H/v6L4Eyu3Q6EIQFCTybACeCnFzF8ENqrE6JsRJLjztau/Rkt
         Dq6uVfIb/WiT4EsWTpYQ+zcCSYhb3NeaA2/zUa9FDzpN5yD3b2tbZqrp1K2cEdzOKJ3g
         hJ/gZ6q4giB66prTHYOWR3Wy0SrzkLMHSYiEdU56nsmLv+ovy4Yj3m/lc1VAXv8957x/
         AHNzp7vVZSyusBnR2xKLNY9rblNKuV8kvz9SEDBxDG9oZxFOw7RhoVn7M4RalcgO4xlP
         vEVmdNZGB5UUu1vliIS2rPbwuPjWbtECs9oD+azzwoglFnIwRj8f2IUnlOtO4ok3NEaV
         8AJw==
X-Forwarded-Encrypted: i=1; AJvYcCWtK2SrgRNhPX+6+WxFPGE5bwEg4RB8qtcKQQC0uNo7IZtpXzkYDUNSvSEQGBQ95bS0KzZtu4bHB1lcbDAOUFFkdsR75g==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzEdZ33lCNDwewd9aTmIAhUMp76TGKKUVliM0zjqRSSLcH6IDr/
	CbBfbtK9g5c/Sc6fgMaEnfzt91LrELZcaCd4sntDxxnUIUhIAHiZNfQG
X-Gm-Gg: ASbGncsZu5H7MNHBk8tTG5qXEwLCdEnIoAj0qPvkEoWQHPEsKkDPUA5KPlg5WkazFDT
	htx1judLclh6kEZTked498ZTLBvlMzcPRf4auUzXxB8L5glee0gxZrjomkNZFVvyHf5BgeADDXw
	8BZ7TBWSIf9Kk31RTUyUcuiP0Qe8/Qh9iaf5JTYh5blJeRuiN4ACGJa7IydZm1onXYNfgS7XlaO
	us+r6F1qsVRoYcLALuMv1m5n8EF94BD/XPZAOrXuQwJ6tcZnn92xmQPfGg5bbD65eWLi6JhHL7u
	9TEHRR7NHfMCslttH35KbZ/WAOW/y8zVD1U7s2iGSsTp2rw4c7olsGM+cnNGyJZGroUZAn28jo5
	1o/rNfQpiyR6vFnjs9DpgI3NvOfLoFqZYiDDMI6DoSseTN3zaI/ghOFhZ6xWlRvNdetvh+ff7a3
	ffrP9TQVMpUDs3taliXF3DwMM64r1NY5Gh6WIPgzu06/ort1Xqjj6m9QUJSvnvAY1UgVlnUclD2
	n4Cdxu5mFE8gHbE
X-Google-Smtp-Source: AGHT+IFNC8oRx8kyKtIo4TAJnCQb/oYWsg36DcsPoQSHwwGpNv7/UFCo8RzOVp6iDBFOliG1UAqC/Q==
X-Received: by 2002:a05:6a00:1311:b0:7b8:383d:870e with SMTP id d2e1a72fcca58-7ba39ce56d3mr14041556b3a.2.1763377759137;
        Mon, 17 Nov 2025 03:09:19 -0800 (PST)
Received: from prakrititz-UB.. ([119.161.98.68])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927c22c5fsm12920375b3a.67.2025.11.17.03.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 03:09:18 -0800 (PST)
From: Nirbhay Sharma <nirbhay.lkd@gmail.com>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Nirbhay Sharma <nirbhay.lkd@gmail.com>
Subject: [PATCH] firewire: Replace ENOSYS with appropriate error codes
Date: Mon, 17 Nov 2025 16:39:01 +0530
Message-ID: <20251117110901.686828-1-nirbhay.lkd@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ENOSYS is reserved for "invalid syscall number" and should not be used
for other error conditions. Replace incorrect usages with more
appropriate error codes:

- In sbp2.c: Use -EOPNOTSUPP for unsupported operation (re-adding
  logical units via SCSI stack).

- In ohci.c: Use -EINVAL for invalid ISO context types in switch
  statements, and -EOPNOTSUPP for unsupported Pinnacle MovieBoard
  hardware.

- In core-cdev.c: Use -EACCES for access policy violations when
  operations are restricted to local nodes' device files.

Signed-off-by: Nirbhay Sharma <nirbhay.lkd@gmail.com>
---
 drivers/firewire/core-cdev.c | 6 +++---
 drivers/firewire/ohci.c      | 8 ++++----
 drivers/firewire/sbp2.c      | 2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index 49dc1612c691..a62ac2f02c49 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -935,7 +935,7 @@ static int ioctl_add_descriptor(struct client *client, union ioctl_arg *arg)
 
 	/* Access policy: Allow this ioctl only on local nodes' device files. */
 	if (!client->device->is_local)
-		return -ENOSYS;
+		return -EACCES;
 
 	if (a->length > 256)
 		return -EINVAL;
@@ -1628,7 +1628,7 @@ static int ioctl_send_phy_packet(struct client *client, union ioctl_arg *arg)
 
 	/* Access policy: Allow this ioctl only on local nodes' device files. */
 	if (!client->device->is_local)
-		return -ENOSYS;
+		return -EACCES;
 
 	e = kzalloc(sizeof(*e) + sizeof(a->data), GFP_KERNEL);
 	if (e == NULL)
@@ -1676,7 +1676,7 @@ static int ioctl_receive_phy_packets(struct client *client, union ioctl_arg *arg
 
 	/* Access policy: Allow this ioctl only on local nodes' device files. */
 	if (!client->device->is_local)
-		return -ENOSYS;
+		return -EACCES;
 
 	// NOTE: This can be without irq when we can guarantee that __fw_send_request() for local
 	// destination never runs in any type of IRQ context.
diff --git a/drivers/firewire/ohci.c b/drivers/firewire/ohci.c
index 030aed5453a1..15aec93b42fb 100644
--- a/drivers/firewire/ohci.c
+++ b/drivers/firewire/ohci.c
@@ -2918,7 +2918,7 @@ static struct fw_iso_context *ohci_allocate_iso_context(struct fw_card *card,
 
 		default:
 			index = -1;
-			ret = -ENOSYS;
+			ret = -EINVAL;
 		}
 
 		if (index < 0)
@@ -3370,7 +3370,7 @@ static int ohci_queue_iso(struct fw_iso_context *base,
 	case FW_ISO_CONTEXT_RECEIVE_MULTICHANNEL:
 		return queue_iso_buffer_fill(ctx, packet, buffer, payload);
 	default:
-		return -ENOSYS;
+		return -EINVAL;
 	}
 }
 
@@ -3401,7 +3401,7 @@ static int ohci_flush_iso_completions(struct fw_iso_context *base)
 				flush_ir_buffer_fill(ctx);
 			break;
 		default:
-			ret = -ENOSYS;
+			ret = -EINVAL;
 		}
 
 		clear_bit_unlock(0, &ctx->flushing_completions);
@@ -3485,7 +3485,7 @@ static int pci_probe(struct pci_dev *dev,
 
 	if (dev->vendor == PCI_VENDOR_ID_PINNACLE_SYSTEMS) {
 		dev_err(&dev->dev, "Pinnacle MovieBoard is not yet supported\n");
-		return -ENOSYS;
+		return -EOPNOTSUPP;
 	}
 
 	ohci = devres_alloc(release_ohci, sizeof(*ohci), GFP_KERNEL);
diff --git a/drivers/firewire/sbp2.c b/drivers/firewire/sbp2.c
index 1a19828114cf..2e17402466e2 100644
--- a/drivers/firewire/sbp2.c
+++ b/drivers/firewire/sbp2.c
@@ -1496,7 +1496,7 @@ static int sbp2_scsi_sdev_init(struct scsi_device *sdev)
 
 	/* (Re-)Adding logical units via the SCSI stack is not supported. */
 	if (!lu)
-		return -ENOSYS;
+		return -EOPNOTSUPP;
 
 	sdev->allow_restart = 1;
 
-- 
2.48.1

