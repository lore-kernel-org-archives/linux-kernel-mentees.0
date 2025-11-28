Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB192D6E63
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 28 Nov 2025 07:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764314761; cv=none; b=EcyB4EPMGvz+2v7UZPlXWbDWwP6W1oSMrlKFKYPSrqksCRM13I40AQr8uuYmyqdDgrLFACPCYeA5zlD7pKKw6Rb7Dgj1BoQn7DP7eR/Lz1SxrYjrmaW0iGolkbBZMJdhvYBMM7NYkn+S6qqgt2vTw2isCwm3sPRGcSCM5ajIMlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764314761; c=relaxed/simple;
	bh=+SmCRWTrlc0r2OwCSIE8ha9a6EvaxxlPeScFrc4xL88=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l39xqoopGgaztgN2exye8fSO5Lemt9WpWapri4B6WVFRw2p7rBWYz7a8cqcobenaf/8zwdrxRmw6uOo9468z4/9gB4f8vv3hlWIBgLdOFeOLrmdpWXDbcE/6TVaG1Gq0jhG9zWvzHYudgIQFplHXBYly4JZkm9J5eNlsTBZadYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MugyTX3/; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MugyTX3/"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FB8840143
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 28 Nov 2025 07:26:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YnuUwr-bUhRk for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Nov 2025 07:25:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=zlatistiv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 10C844007C
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10C844007C
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MugyTX3/
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 10C844007C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 28 Nov 2025 07:25:58 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b76b5afdf04so274350966b.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 27 Nov 2025 23:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764314757; x=1764919557; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JPascdlztEnoaiHOFCNuou/ryBuA+8aO9E9qYmSrJSQ=;
        b=MugyTX3/oVzXjvCMJQsQ6ZJ3VpIV0rQczLxl46naDqqIEMLnsLx2rBBhWEb7BVby50
         436gWHfBx/TCK2q/SD/2WpwBCWB18e8KGOETqDETHsRdwE4TRtmUhUz3mItI49BImx8D
         N5xefDNuXv5BtW5GtWW6De9VcVmvmG5FFZXEn5uM5N4Dhk3rLlRvHQWCSsJm6e8mgNb3
         61l2aZqkOBlV2P/IgFCxvFhj7trZsVyMLVYu3A5ZBYjoPkULIf038f+lkNMcBMMmPjGP
         ExVp9TGRhuQ/C6t4AYj+F05gPhp7xDejEZH9QDR+JqPh6fiO7XUoK0sfiIAY2RGmGNb7
         Ekxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764314757; x=1764919557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JPascdlztEnoaiHOFCNuou/ryBuA+8aO9E9qYmSrJSQ=;
        b=YeUAJSVTIg8G3vyxHTqWbgpK2q1fmt728B/egw1EE5RvbLOIflRQl8DR79q5y+EFze
         w8GZtqANI1V840AIP87AA4M+UCET6ClUHqssGHtZ2saNiK8vitQDF7cTkUdfD8EDRZzA
         oRd22xuhJpF96otilHayXXDZDcX8H353Msp1OXb1Kn+R4nog/fvOtFDvzO1fx1A2ZX0A
         3aYabI06OBl9U45sf4G2wNwpGU9X8M8Q51V9kS6iCAct9DzWnryf1zzEyYVyOB++C0dr
         ZE63rCIY/VlBBWIYx9BXH+gQ/r7Do+S/qcvJLd5erWaFopScql1TqKO4KS0pgOj4DDlW
         hFgA==
X-Forwarded-Encrypted: i=1; AJvYcCX4XLItfo4tkVNBIAthHTEHcUOh0HZUIm4fjGk29dWdroVd0d2CTO+mSw01k6Z8z+cZVY2FxtHDgmH3TnZFsWE4UX4pIQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Ywuf6yemhwGKVfFtPI5y1WfjqJhqV4DENmtBdsDeDg0kD7YxnM7
	huL/GWRSj5yItKqUJefNUaL0BpEB6GQkir7NxssO0EoUFO/YIsrsJedw
X-Gm-Gg: ASbGncuIS6ghx/TnZETCDBF34xVlyTVAQPRhMs2McEDsknO5kGHI/UwXMgsMCRsUspB
	IcNnBEe6QMlqL5UB/lWtV/3dSi7e235NVO0XtTU8s0vIQFaFTtcmuEXDns9RYVjgIQ0pqwXTKrr
	BTIktMrckcNxkAwZOMQW05rhBUU06rjVKMuEVt/LlU4lAj56l0Z2ab6hw5TSW7o/OoxYCMC/LKP
	tr/T4JPW/C1go1m9JSL09SIv6GI5OHtWCdjTX0ROxylccO5/mqgLPY/ZVBWRmi18fWCyI5RdCIq
	81/vCcU2vWQd31xzfw0X524WPg0b5s+7n44xukT2GZTUGideR1ayd0oLxRNewXg/9tZQU53LcWw
	sIaML/3aKm/JMPAMqiuDaECR39lhvai9fnL/KN67+6fU1jT0XFbQlm4Yst+I5C2o70XJALW27Ws
	3S5CrqbnXxLcp/3SvGy4ypdg==
X-Google-Smtp-Source: AGHT+IH4lAPY8fQ+r4Wk44TmuRdi25uLpSvjBglMgf1DY7m+zdaalgYzcXk9fjkz1+w5Tljp1kYB5w==
X-Received: by 2002:a17:907:2da8:b0:b72:d8da:7aac with SMTP id a640c23a62f3a-b7671a2a2f4mr2992193166b.56.1764314756676;
        Thu, 27 Nov 2025 23:25:56 -0800 (PST)
Received: from localhost.localdomain ([46.10.223.24])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f59aece0sm363772466b.32.2025.11.27.23.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 23:25:56 -0800 (PST)
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
	"Nikola Z. Ivanov" <zlatistiv@gmail.com>
Subject: [PATCH net-next] team: Add matching error label for failed action
Date: Fri, 28 Nov 2025 09:25:44 +0200
Message-ID: <20251128072544.223645-1-zlatistiv@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Follow the "action" - "err_action" pairing of labels
found across the source code of team net device.

Currently in team_port_add the err_set_slave_promisc
label is reused for exiting on error when setting
allmulti level of the new slave.

Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
---
Related discussion:
https://lore.kernel.org/netdev/admyw5vnd3hup26xew7yxfwqo4ypr5sfb3esk7spv4jx3yqpxu@g47iffagagah/

 drivers/net/team/team_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/team/team_core.c b/drivers/net/team/team_core.c
index 0a41d2b45d8c..4d5c9ae8f221 100644
--- a/drivers/net/team/team_core.c
+++ b/drivers/net/team/team_core.c
@@ -1231,7 +1231,7 @@ static int team_port_add(struct team *team, struct net_device *port_dev,
 		if (err) {
 			if (dev->flags & IFF_PROMISC)
 				dev_set_promiscuity(port_dev, -1);
-			goto err_set_slave_promisc;
+			goto err_set_slave_allmulti;
 		}
 	}
 
@@ -1258,6 +1258,7 @@ static int team_port_add(struct team *team, struct net_device *port_dev,
 	return 0;
 
 err_set_dev_type:
+err_set_slave_allmulti:
 err_set_slave_promisc:
 	__team_option_inst_del_port(team, port);
 
-- 
2.51.0

