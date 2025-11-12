Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4B44502A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 12 Nov 2025 00:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762907710; cv=none; b=Fv4ISQ2CjTCE28XcNWFLhBw+ZPlYmcBxzC3BoOy9if3jSjQQuEqR+YZRzU4qZUJEpME2LBuotKkKhbrRwF8Ntz6Ey+IQIv1zWJLn8d7bIX8lRI1Z5A60Zvj07zIDq6VTpe1P2kaUcSBYREtOTeMV7SJA1LGdh2wD9HQyHQlE5ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762907710; c=relaxed/simple;
	bh=/uddJhBBzzW8L+E3X13d+vydY17/3a+z2ohQB6rVS6M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dn3wgaS/NK4LnXwFU/aK/Kn8ZZbDvXQjhhSgrIpPnnJGC6oUSXWExSDoPHeut+666VkznEV0+6nhLTuln+DJc7vVmlIruwf2n6bxQTeva/ogPpvo7zIdKlCXw09avTv/AIwVYHmMWOCSyG67p6HLiaPt+uHeUVqFFnxiawBb9FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bsgRfSXb; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bsgRfSXb"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9609B40346
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 12 Nov 2025 00:35:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bmBT67EHizT0 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Nov 2025 00:35:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com; envelope-from=zlatistiv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 62DFD4032A
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62DFD4032A
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bsgRfSXb
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 62DFD4032A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 12 Nov 2025 00:35:06 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b7277324054so49820666b.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 11 Nov 2025 16:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762907704; x=1763512504; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q8bA5fyqCC+W6u0vk7OwR/d5lvOlTqdfez3AJaemrP4=;
        b=bsgRfSXbDg7lNlvW+X1z0S7WlYZUnwqYpNSbi9WddmSvZj6GdiPLZ7v+thxkcQ68Mz
         kiDslKOdSp4m9C1moSBlKBwJoZ70LMYe01qnDHeiMP/7DqtXC/vdcj2e3bGioL3lAy+2
         EmyN+NGR1awUwo0WzS1MWSFlwKLPe11hka4lJiJBffP+Dr4VrGrqTZv21TJL6sxGQNi7
         Mm68Di99R6JkVtq1wQrn4iYI+JeaxBw9CqzxMRfHerL31fIwhqX5f7dsODweW6KVwUt4
         iJEIIRkfNYQU6UzJNi2Ue+etB8okJIk2ndax6f0BDT7SbyX+Dxqu/mQdL7qmKZ8cHz+o
         QV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762907704; x=1763512504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q8bA5fyqCC+W6u0vk7OwR/d5lvOlTqdfez3AJaemrP4=;
        b=ekilLzEdoJehadx8faG/qpzOY8vZ5j7/NMV6iq460MLSCpuh7mTAcfgfVgNy12ntbj
         thA5Mzt3DrN1GjOTGn+M2MfBa7vuHkRAhg3bQRYFEjlcsFpwiCNKvSUqq4vNdvZ0lz6Z
         fNLCbp/jSL+iV5jUFCZrpgaiApDLMurvNR5QITMsn8DvYXJd19CkaqCDc3HVDXq1puAf
         bufdJJIx6eVbJHph1uI/HNc5ai7yGcYJzq9NVTXuXwbzRD9P0f4hdkXXdwAiVlJWPrq7
         NpDTbrDrrUoFerR29LbDo79c+GldZsoG0qlpadYX9Z2iy/TZPYAs68Or+uVNqpdRZ8qQ
         6zlg==
X-Forwarded-Encrypted: i=1; AJvYcCUXz3XlU5OWrxEa0sjrCojuzqPttmXvGhJH5/XEBjxKb/rPCKdwwXJYeyBxqeTHGaq1WGBMEJwqV+dTrXN0PtZ4Bnztog==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yxeq2RFovxmLzNPuX7ty8Y8gvR7s1/C5swuWsrMRs5WEyx+bavU
	3BhKAKsDYeBWi+z0oB3swOfq9Bn8EPEsJPzdhbde9C02V1I77o+REFrj
X-Gm-Gg: ASbGncvihX+Yy4TABH8r5ChwTtdohCbx0jwe2OhU7MpxZHQoP5BeThFv0Yl51qZX7mW
	LlFLVeBPMi+KA4EAmxJU5MP19ZVNfsQhv9FddWxpAxUq3wrmvNIOSV03qyNCfoxa/dVjpOM/FCo
	FS9CiGmzgNijIFR4CUt5U23zg/BXZpSzfl7lMfjF9UbS6S5kBWdwX8FJz6ukfOKtD39Qzc2jAnV
	Li/27ABWJCwwgQEl7Ov85hs1c2rrMa0c6OdBtwMZBVw3MNsByV/86tXONQ5EZ9hoid3MfHVILBd
	0m4J3QVN+zGmFx0HDEn3RGXkNR7jiNNZ5xg8i+wmKh/M+OqslHDBMxN6REzLwAO29muVn9k9cfW
	QJ5RrWyxktdYKBT/9dywL/phMUOC8323+4qB0IQGF5CY9u3U1lQzywMVpYhUkzLMfEKOMkXFV6r
	QyBtKPsCOqC1Q=
X-Google-Smtp-Source: AGHT+IGqrNbW7Y2frs0SjkA276j6v0NPZI9klOiEtgkLEjlg+yLRP1GOA3gr1+LqrmTZn0GT7QZWpQ==
X-Received: by 2002:a17:907:3e1e:b0:b6f:9da9:4b46 with SMTP id a640c23a62f3a-b7331bb64cdmr106614966b.43.1762907704029;
        Tue, 11 Nov 2025 16:35:04 -0800 (PST)
Received: from localhost.localdomain ([46.10.223.24])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bdbcb0aasm1434568666b.11.2025.11.11.16.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 16:35:03 -0800 (PST)
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: jiri@resnulli.us,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	"Nikola Z. Ivanov" <zlatistiv@gmail.com>,
	syzbot+a2a3b519de727b0f7903@syzkaller.appspotmail.com
Subject: [PATCH net] team: Move team device type change at the end of team_port_add
Date: Wed, 12 Nov 2025 02:34:44 +0200
Message-ID: <20251112003444.2465-1-zlatistiv@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Attempting to add a port device that is already up will expectedly fail,
but not before modifying the team device header_ops.

In the case of the syzbot reproducer the gre0 device is
already in state UP when it attempts to add it as a
port device of team0, this fails but before that
header_ops->create of team0 is changed from eth_header to ipgre_header
in the call to team_dev_type_check_change.

Later when we end up in ipgre_header() struct *ip_tunnel points to nonsense
as the private data of the device still holds a struct team.

Move team_dev_type_check_change down where all other checks have passed
as it changes the dev type with no way to restore it in case
one of the checks that follow it fail.

Also make sure to preserve the origial mtu assignment:
  - If port_dev is not the same type as dev, dev takes mtu from port_dev
  - If port_dev is the same type as dev, port_dev takes mtu from dev

Testing:
  - team device driver in-tree selftests
  - Add/remove various devices as slaves of team device
  - syzbot

Reported-by: syzbot+a2a3b519de727b0f7903@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=a2a3b519de727b0f7903
Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
---
 drivers/net/team/team_core.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/net/team/team_core.c b/drivers/net/team/team_core.c
index 29dc04c299a3..94c149e89231 100644
--- a/drivers/net/team/team_core.c
+++ b/drivers/net/team/team_core.c
@@ -1134,10 +1134,6 @@ static int team_port_add(struct team *team, struct net_device *port_dev,
 		return -EPERM;
 	}
 
-	err = team_dev_type_check_change(dev, port_dev);
-	if (err)
-		return err;
-
 	if (port_dev->flags & IFF_UP) {
 		NL_SET_ERR_MSG(extack, "Device is up. Set it down before adding it as a team port");
 		netdev_err(dev, "Device %s is up. Set it down before adding it as a team port\n",
@@ -1155,10 +1151,12 @@ static int team_port_add(struct team *team, struct net_device *port_dev,
 	INIT_LIST_HEAD(&port->qom_list);
 
 	port->orig.mtu = port_dev->mtu;
-	err = dev_set_mtu(port_dev, dev->mtu);
-	if (err) {
-		netdev_dbg(dev, "Error %d calling dev_set_mtu\n", err);
-		goto err_set_mtu;
+	if (dev->type == port_dev->type) {
+		err = dev_set_mtu(port_dev, dev->mtu);
+		if (err) {
+			netdev_dbg(dev, "Error %d calling dev_set_mtu\n", err);
+			goto err_set_mtu;
+		}
 	}
 
 	memcpy(port->orig.dev_addr, port_dev->dev_addr, port_dev->addr_len);
@@ -1233,6 +1231,10 @@ static int team_port_add(struct team *team, struct net_device *port_dev,
 		}
 	}
 
+	err = team_dev_type_check_change(dev, port_dev);
+	if (err)
+		goto err_set_dev_type;
+
 	if (dev->flags & IFF_UP) {
 		netif_addr_lock_bh(dev);
 		dev_uc_sync_multiple(port_dev, dev);
@@ -1251,6 +1253,7 @@ static int team_port_add(struct team *team, struct net_device *port_dev,
 
 	return 0;
 
+err_set_dev_type:
 err_set_slave_promisc:
 	__team_option_inst_del_port(team, port);
 
-- 
2.51.0

