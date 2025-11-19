Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724F02F6929
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Nov 2025 16:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763568542; cv=none; b=OCRWNo9J+z8K9R9SPwkWgI2JPpk9AO6t6p+hFjG0OMCFBt85+oiUrTnu4k1SH/IP3je3PtY1loQ5upmoiOl46EdP1S2X6x2McJANauzEC34E7XJkFUTKcVAPktwQX12tmLRCtITuSMKtT3ZJ0nzs3hnlWtQi2ChPV2xDGFFH3g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763568542; c=relaxed/simple;
	bh=Z3cJOQ2ccJsQ0oWrL1rpG5fsyyBggDRUQgteyGwCcbM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uFHbJ/I9GB1Zk/uyFZC+rFEoAJGnBOWgReKELa2Q1Qx9hwJe/cirJX7jTO6hDkLHxAbBWVgCKs+ljGbNpcFw27c5mpxAFSN4ERubJYTQiCvdzB1jbw0RPqCFB/rWyigPpyVJG5/OoDahX/e1E/Cq03vKXapzMDSo3iaioRIPuMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L6eB9pAn; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L6eB9pAn"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BB698224F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Nov 2025 16:08:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 66wwP9gNxlAx for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Nov 2025 16:08:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=zlatistiv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 03B9E8224E
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03B9E8224E
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=L6eB9pAn
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 03B9E8224E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Nov 2025 16:08:55 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b736ffc531fso937514766b.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Nov 2025 08:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763568534; x=1764173334; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SizZzBPjLKOoZAzPRbyBM42MsY16LLyvAwLNC6fcHOw=;
        b=L6eB9pAnDrerBNPqbx0tLrOHXL4a7PJBXmZ/+PqDV8b66fQMHhrgI4+98x3XmZDp9X
         ZdZtnobmWzfqxoUxMnwa4F7yqx6xBbhkdHWQgzvo7fq7T5TNsKQWqkPLXRSP3+5qvZSW
         N2308TdBNLqmK2SFq2nRCsRyAKZNHJ6DcHB8VgvvyeD+8MqyPVzEtYptvvl434Im1LXP
         o7ubDqWsoFwEtuW2VRwnxoySAaWi/dHUPQvI7Z1sQ1xtVMG3o9gl1laP4LhrakjoAGlN
         ywWsbycNdd6KE0PGWbj1wFWwVCgLxL8f2b21ChRqcRCpv9mMWrzhkgoeBCSMp4snnLi4
         JnKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763568534; x=1764173334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SizZzBPjLKOoZAzPRbyBM42MsY16LLyvAwLNC6fcHOw=;
        b=KvehTHJ+j6FAE7jLLdAhop1tAqG9ejmeSH+/FWSf329KieNagyvchaPjtKa/53mIuY
         9ICLMVJ8g6v44t9s2gdQYl8cXDW3wdJgftO0ZsXZ8a9woZBN7V8c4LVeu9H9K/A3trky
         PSVYpgx2YHXcTBB/n5iQ1ep8NlTaZoBLjrXwwFdyq8K6StQRbzl+qm8ThsIuy8dx0NGv
         5QSUNF/PX87Wn+/0o0r6fvekdE3sRQPlDycKNWtWzCKD6kzs5nVhFKqw/JGxtNFk1eRG
         aDZ5RhNqPWX0wubt/DQ8GM3K5kqqgTDx+c3zA0hajGKMzuhst195z/1BFIXmRKUrXRNE
         6M5g==
X-Forwarded-Encrypted: i=1; AJvYcCW15dmd5fhUlWjZKJuLN/Vw/dZ5siHet57zPOjf6t7ImUqGpgbxz3OKTrIuoccMS9RvsyHHFyITaBBpdv1+DCL3/IhJkQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxhBUbFZ0b5p/DhMrIGp04ssDJbtlb7CfIch01Q8xz2XVe91D9U
	kCI3/oRoRQHUnII1ZsmgBHGPPK/fqsTDvlZ/i+IwMrrgpk9vUFP0VIPU
X-Gm-Gg: ASbGnctJ/1nS8prrh5YeToOQ/9hDpJyiDkdZUWA849faLBdmqnzxuK3rJ8Q90FRLHXg
	yPMOJb3bhoPXUZF62hDGvhDToUFtj1UaAzrtGFltqf6Sx00A2DJRWu+aXcrGxKyTrewRN367i3p
	6os3xE3TExuFoayDYNNBgjhJO9waNa6ya7v8ebYIVwgWZsjgOoeHUsDn+Tnv2WdyUyCKRrB0fx6
	bFFPbM/JVrpY4cavcaUZrm61dxUwuoBURT2dhCy1uMwgrk9zaCV17+e2Xc0C6QLbUnoJIt/MXUo
	Z1Y+ze13rCj0bJ6i/7/2YSFbb8LFnidvKOtBDcSg1l2DLpPPmijMNDs1getbVehhGTn2fNo7Q/Y
	rzPnKFvPKsbmVaQSXaL+IAbWucnEryIrcvgIRy4qPiN1KJyojsBJsFwOrgw+yHaJn0I85jMWOiR
	bjoyNcqLlx0Q7cLOUE/im21Q==
X-Google-Smtp-Source: AGHT+IH2cx6mffoyjgk5HxK/FEYr6BIhhOy7D3Vvb4brj04ZDUMSv4/MBmhJNb8U2haI1icmHHq8Iw==
X-Received: by 2002:a17:906:794d:b0:b73:1905:bba0 with SMTP id a640c23a62f3a-b7637869c14mr374006666b.17.1763568533551;
        Wed, 19 Nov 2025 08:08:53 -0800 (PST)
Received: from localhost.localdomain ([46.10.223.24])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fad45afsm1657863166b.24.2025.11.19.08.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 08:08:53 -0800 (PST)
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
Subject: [PATCH net v3] team: Move team device type change at the end of team_port_add
Date: Wed, 19 Nov 2025 18:08:50 +0200
Message-ID: <20251119160850.378824-1-zlatistiv@gmail.com>
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

Later when we end up in ipgre_header() struct ip_tunnel* points to nonsense
as the private data of the device still holds a struct team.

Example sequence of iproute2 commands to reproduce the hang/BUG():
ip link add dev team0 type team
ip link add dev gre0 type gre
ip link set dev gre0 up
ip link set dev gre0 master team0
ip link set dev team0 up
ping -I team0 1.1.1.1

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
Fixes: 1d76efe1577b ("team: add support for non-ethernet devices")
Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
---
Changes since v1:
  - Add a "Fixes" tag
  - Add a simple reproducer in the commit log
  https://lore.kernel.org/netdev/20251111171341.4c6d69be@kernel.org/T/#u

Changes since v2:
  - Use already present exit label "err_set_slave_promisc"
    for returning on failure of team_dev_type_check_change.
    This was suggested in the initial patch thread (v1).
  https://lore.kernel.org/netdev/20251113211142.245216-1-zlatistiv@gmail.com/

 drivers/net/team/team_core.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/net/team/team_core.c b/drivers/net/team/team_core.c
index 17f07eb0ee52..d7625a390e94 100644
--- a/drivers/net/team/team_core.c
+++ b/drivers/net/team/team_core.c
@@ -1191,10 +1191,6 @@ static int team_port_add(struct team *team, struct net_device *port_dev,
 		return -EPERM;
 	}
 
-	err = team_dev_type_check_change(dev, port_dev);
-	if (err)
-		return err;
-
 	if (port_dev->flags & IFF_UP) {
 		NL_SET_ERR_MSG(extack, "Device is up. Set it down before adding it as a team port");
 		netdev_err(dev, "Device %s is up. Set it down before adding it as a team port\n",
@@ -1212,10 +1208,12 @@ static int team_port_add(struct team *team, struct net_device *port_dev,
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
@@ -1290,6 +1288,10 @@ static int team_port_add(struct team *team, struct net_device *port_dev,
 		}
 	}
 
+	err = team_dev_type_check_change(dev, port_dev);
+	if (err)
+		goto err_set_slave_promisc;
+
 	if (dev->flags & IFF_UP) {
 		netif_addr_lock_bh(dev);
 		dev_uc_sync_multiple(port_dev, dev);
-- 
2.51.0

