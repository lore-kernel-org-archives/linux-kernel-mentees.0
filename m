Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14011E3DED
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 22 Nov 2025 00:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763770836; cv=none; b=h4tY3n9I63yaEkhkI0eT9uH3d4rgZ8HmWmWbQOJXLcb0zhvZ+5E2DSrSu87hG0Xk9d4uh4qa/PeHmM5d4Fo3LkUvYynhxLRCupLKdyGjuf9aM+BmCgXPMwyclL/g7u0ybVv1qFFGvxG08t087/o52A/Bs5FYH2SlTLOwCS8CXaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763770836; c=relaxed/simple;
	bh=rJoQQQVl3A5OBD0qoQTUH/HKulcN+Tm1hu8kr4bTSys=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qX2+EAg4cAWJL5m08qqb64S2dg6dcdbQOi6M7p6XsiqbNrgGVFJw/MoR3wsDY75RgFpW/hG7OiqlcpVLfyFKX/XWxXoCzAMSoYYRONTWnpXb7W0fVMHvEMObAj6Any30vjTZxdu/hMa/azMgffJXbtrvTZpnRXKo94n1+dbbZ4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=empBqd0h; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="empBqd0h"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57FEF84F62
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 22 Nov 2025 00:20:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1r6bwzsOKWGF for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Nov 2025 00:20:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com; envelope-from=zlatistiv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1752684F61
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1752684F61
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=empBqd0h
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1752684F61
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 22 Nov 2025 00:20:32 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-640b0639dabso4423937a12.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 21 Nov 2025 16:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763770831; x=1764375631; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zAp9aZ+uW/j52RhXFBcyoCAsa70B/Y4OxqM/BiEieGk=;
        b=empBqd0h266o8mXkQskvd7uQgyX9jRaZxr65JulZ1Ylacf3V9Z0KonSejWEAjjJncg
         7Txrev4s2k4EIe+rpGtpTWrrKT4X1ue/7lRi1YyBiN0lMmUS4VeqoKtFMoMVN425LglM
         9WBtE8oiS76052pU1/7HWBDSr8wPGs9bWEQemG9Y/W6TmBFlXtv9DmBGHXOIGR2tpVJO
         ugvM2/ccZ+hPNNcfw0Sb231gaQEw/eTF0HdxGi1zxh0QE1zopbTeZpeyzPxkms7vAt8l
         Qk0qFg2LzA93Ne/0+XwthS1bjoG/cjYM5Z62fXWM7YzNnIlxKe+muf0Le1KTdLwi1sS2
         bLEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763770831; x=1764375631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zAp9aZ+uW/j52RhXFBcyoCAsa70B/Y4OxqM/BiEieGk=;
        b=ZGgTbHRK6BgcWGbXEKirQxCsY6AuLvthc032sVzBlFi8fJ3Mxiq5vmiSrv1gHtZcqu
         03U4FvrO5h/l2yx0Yy2h2CvoKufgKcfV4EysfgbNZT8na7fKDDGOZDpjFa78uKhNK4Gh
         0j/Dsicab5bHY0aC1s2z4Ytcoqw9t0AGeRA6HfKvYhVncQBwkNhhIWWHyh1WTrtO/WLt
         6DGV7/C2Gp27mGYQPOiCFCqBDVAAjUBAV4hjMQmc9toQvscxtp2cMKu7B6vLTzUmw4xb
         Ur202qwP2bXZEkOoDk/Xpp67AmXP20IVpjF4qwoLBG5QxFtOIy9+BwRLEFXJzwL5VNnm
         YeDw==
X-Forwarded-Encrypted: i=1; AJvYcCXe4hAOpciUoxU3NDG8OEWY9dDXszzYqbDaYzXd4ChaN6gUs/TTdlCQ/vPbExwj2UNZRcUDUSG8lIJSFWwvK/kAirJtTQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yw6B7D0QdMmDsluwHQIyaUiou7pp6yQJyupv4YqQ35OJwue0b5I
	oHbh/5XQLgkYYqZ/07dnyd7+wNLme164YndgVc7Y0xD7Jw6JED72skOf
X-Gm-Gg: ASbGncuOWPHkeZEG3KatbQvEvHFj/ZVXHMlY/0Emjm+C+WBT3Tz1KHdxnYAfm6I1ZrR
	oipLdW5KuZ3y+TEW6ulYXVRHQ3X0ilWwDyXMh8KYdhipcEcxGdVbldQNNgs45deh8pRPR1OD88o
	8mJV6Of5hQIS64SX612gbh6GySQa8m/cV3eTquzJrJuC9yfJ/IZWtDsy8nmgiILMRY69CVqS1E9
	LJI6Diz6jXXATH/B6+5XCWLwSiv4Pk3LSN0VWB6jqbN8FmelGmC1CEyY85EdPTo10cjuu5NUorO
	WPL0Nx/4F4hMirZq2iRN0s3eeh+WXP6Gz0CV2Ssgtf2c2xZdX/pz3mqJELN98v7CnILyIwtLPTY
	z/Wuwa/6trgyQqAw2BxmU7A1ppjl7SIW17lgKmfhSvRKzV//KYtwpH2OZhzZwt2cDne0VOhjl/k
	ufXXjri9X3DGzobMRnqOniLw==
X-Google-Smtp-Source: AGHT+IHwH08qVkgII6zjFUUDK4LO3V9/FMSKTA0oD9d0P7wNSGNESnDtmGP1YSKgkzGu1UoXEaV5TQ==
X-Received: by 2002:a17:907:3f1e:b0:b73:5acd:465e with SMTP id a640c23a62f3a-b767153ee39mr438247666b.11.1763770830585;
        Fri, 21 Nov 2025 16:20:30 -0800 (PST)
Received: from localhost.localdomain ([46.10.223.24])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654fd6087sm587410466b.44.2025.11.21.16.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 16:20:29 -0800 (PST)
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
Subject: [PATCH net v4] team: Move team device type change at the end of  team_port_add
Date: Sat, 22 Nov 2025 02:20:27 +0200
Message-ID: <20251122002027.695151-1-zlatistiv@gmail.com>
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

This is done by adding a conditional before the call to dev_set_mtu
to prevent it from assigning port_dev->mtu = dev->mtu and instead
letting team_dev_type_check_change assign dev->mtu = port_dev->mtu.
The conditional is needed because the patch moves the call to
team_dev_type_check_change past dev_set_mtu.

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

Changes since v3:
  - Revert the change in v3 related to reusing exit label.
  - Add a brief comment before the conditional call to dev_set_mtu.
  - Add more descriptive commit message related to the conditional.
  https://lore.kernel.org/netdev/20251119160850.378824-1-zlatistiv@gmail.com/

 drivers/net/team/team_core.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/net/team/team_core.c b/drivers/net/team/team_core.c
index 17f07eb0ee52..25562b17debe 100644
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
@@ -1212,10 +1208,16 @@ static int team_port_add(struct team *team, struct net_device *port_dev,
 	INIT_LIST_HEAD(&port->qom_list);
 
 	port->orig.mtu = port_dev->mtu;
-	err = dev_set_mtu(port_dev, dev->mtu);
-	if (err) {
-		netdev_dbg(dev, "Error %d calling dev_set_mtu\n", err);
-		goto err_set_mtu;
+	/*
+	 * MTU assignment will be handled in team_dev_type_check_change
+	 * if dev and port_dev are of different types
+	 */
+	if (dev->type == port_dev->type) {
+		err = dev_set_mtu(port_dev, dev->mtu);
+		if (err) {
+			netdev_dbg(dev, "Error %d calling dev_set_mtu\n", err);
+			goto err_set_mtu;
+		}
 	}
 
 	memcpy(port->orig.dev_addr, port_dev->dev_addr, port_dev->addr_len);
@@ -1290,6 +1292,10 @@ static int team_port_add(struct team *team, struct net_device *port_dev,
 		}
 	}
 
+	err = team_dev_type_check_change(dev, port_dev);
+	if (err)
+		goto err_set_dev_type;
+
 	if (dev->flags & IFF_UP) {
 		netif_addr_lock_bh(dev);
 		dev_uc_sync_multiple(port_dev, dev);
@@ -1308,6 +1314,7 @@ static int team_port_add(struct team *team, struct net_device *port_dev,
 
 	return 0;
 
+err_set_dev_type:
 err_set_slave_promisc:
 	__team_option_inst_del_port(team, port);
 
-- 
2.51.0

