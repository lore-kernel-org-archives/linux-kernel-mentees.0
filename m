Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32D23218BA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 13 Nov 2025 21:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763068333; cv=none; b=m1JPXjgE2xkZMy1HEEKgn36iLJnstSluS9J5E6gcxmWXidyNLc3O1wj9bc6Vo0yQJUeH2KO9RZvczrZN7+3EgO8UcqbU3T3nWJhJOgDB/esWzLCS+FUKedZ4sVUEOqE/+7A2VNLaiUDWN1nncb2kLvtKOdP/wd538JFpOHnVFx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763068333; c=relaxed/simple;
	bh=VZz8VeGMD34/0SPFsGJY9Zec9mHyRzTy7RjCb0SFz3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aONV01RYZfzuUw0QYjLBGSUH/dko42NDoXZ3GPaTCgeTdZMXtySIBJm5ckdewNVHNi2zJ9YUkmW3E//4cuiU536YXpBhRRmofFLJQe5YYfRKucLiULWFfPc0/bnJI29YSxKLltUN+G0NaA8CW16Kuk9M/UknbxzfBDT4tj6r/Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G09NNGS8; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G09NNGS8"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C19E40801
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 13 Nov 2025 21:12:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BVSOVcrq_55G for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Nov 2025 21:12:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=zlatistiv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 56B14407E8
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56B14407E8
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=G09NNGS8
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 56B14407E8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 13 Nov 2025 21:12:10 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b72bf7e703fso215795866b.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 13 Nov 2025 13:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763068328; x=1763673128; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wyeY2XNsdqhfXocUSjoPZjzq+oQsyNbMvmr9wItdoUQ=;
        b=G09NNGS8qR6oNENKeTixesvJK57WEHicRx9QbCc8agVPBkq8WqKg2gIvNauFV6a2Dm
         pXmY6PnTTHXOVANmpaEO7H3+YVA+nVUWPUe/1rDbHnWaE/TWH4yJKFPgmuh394/2opVZ
         EcOMkA4Fg1tQPriRG+JzX7HoItFeuSLNU8j+fAq3zS1XlZZgYEYFuG8bc92leTrtdnfl
         V8rO2dkCmLEh6cqFs6tQNXI7vSAChIJwUKwG4s6x0L7PmlJnGRFL3E9+WXJjP4TyZN57
         Tf/lwi9KJH0e+URhaBJo+mzG16ASBobnRKf/2hYdSUBtj/B4trZhkSDO34bLCRxXkzqn
         6ykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763068328; x=1763673128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wyeY2XNsdqhfXocUSjoPZjzq+oQsyNbMvmr9wItdoUQ=;
        b=XOIGga8XljeZot/yGp9J0vLnR5x5rjLjlPrfyr7WMDcinFGM/Tcd9jZ1EBh1XoQHXc
         1zSW+ZmurqSGK7FvY8cqH37WwvjYJsQ0F+w1m7AclHkoM3uM+77Zq10aZaPNHUDSZrve
         ALRCG9/g2VgrWNYAoZTYBPl8MqSqGx8hbuKQyy4V2eUKQd69cEsm4mNpaAPr7cIDUrwv
         BErD3zdA1FKAQ5BRZXIkrhGCIzRMrgAOfd3HHA9RvZ4Ch/PiYATtCO07EQC/PI45Fc3H
         B+wKp3T8TyVA5HTfh5SB1Iqt/qAUOPMOc+q3H0KG+hh6vxPyrUP/aDwq7UPFt5Qp5vUz
         9vBg==
X-Forwarded-Encrypted: i=1; AJvYcCWlFUP7lJt4fGZU/hrNn6Lae6bRwyq/aTzSYFlXBRfifvlpGzFvfXTAV2TW4tVZQQfnA4boQEvbjmFFffnVYZHDWONBpg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyIOizqAol/70S8DT0kGXG51/+IH8o9VZ4wVEGYItn9p3n3hOCM
	H8Mz2AGXItHA3WRYTH7Cob5lijYLJbL4FU88u3p7HYDFpuMS0/TNGvZ/
X-Gm-Gg: ASbGncvPaebx+w+kypF3mjdZp2PIukw4aE/IGzMa7v4MUcahuZePsXtQqVLqRYRsErg
	NJfJzO+CvdzeLBqr5/thKbXcgg/cBE//rus1aBEjlhHcSj9RQlxOl6+2X1OXhGKe/ychoaS4/mn
	nTTLffrmdy1mFis0SUqih4NQnLE9BZL12y5kmcPbvNaGsuhE++Abp7VT3WROu1erc9ozchotvZc
	XDnruO3ffjeFAPkct1aSoyIi5/1D0aSHlRxjqEl4Pcp5EzSQ4DLxCR0VaBo70zY3R44dKr6HdWk
	1RvlJkFTICa0xPA73vkXzCX6a3W/7UFbwBN7iUi+ZQ0lYTVtmdqR0ek9saTJJAj5joftV5IuaHK
	nEZkaK8lYWdema2GJBQI/7uPcfG9f7MjdaTBJ5c+vV8+GNNQmTKevGIsS+8ePvwkj968rVAv0bY
	IKH120h6xaZX4=
X-Google-Smtp-Source: AGHT+IHiDc/7hf9TqjsuwSPQ+FK0WK3MXANc1n+4UzxCZWDV8N5JWcs8yaQjBqEdwkwAyS0qmrlBJg==
X-Received: by 2002:a17:907:60d4:b0:b6d:5914:30c with SMTP id a640c23a62f3a-b73679841a7mr52617866b.34.1763068327739;
        Thu, 13 Nov 2025 13:12:07 -0800 (PST)
Received: from localhost.localdomain ([46.10.223.24])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fda8d69sm237324266b.50.2025.11.13.13.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 13:12:07 -0800 (PST)
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
Subject: [PATCH net v2] team: Move team device type change at the end of team_port_add
Date: Thu, 13 Nov 2025 23:11:42 +0200
Message-ID: <20251113211142.245216-1-zlatistiv@gmail.com>
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

Example sequence of iproute commands to reproduce the hang/BUG():
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

