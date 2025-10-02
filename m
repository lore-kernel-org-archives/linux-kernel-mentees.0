Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567F4243954
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  2 Oct 2025 17:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759427190; cv=none; b=DF7fvHMBx6Q/enpMYDe4h6T5kFzoQNO67yKf2ZUSQubNtjTFmuXG4FfeNd4Ea0EDIp8Bk8yYIV1/uzToPVVzq3XEP5MfINnsrt8eqDHqNWbRRdg5Ux8GcayuUdCuUVj+L/u0RneK/YDIDe0bHFChPr7abp/I0t+6pI83XRO6jKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759427190; c=relaxed/simple;
	bh=d8JhIBf9djcZXIfnCciHGMpxUiYp6eLd6xES6V8e5b4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fdjX3GgPmQIXyfz6cvkUdVf1DAQerxdZVLNFJ5vWqlV0MPH/c5MW0bCvAzILfwm4OvarcW8wOLH09qy84ae5fLp38YnMppr5JkDsuYQ40lo3KwzinqITH/t1Mo79CDfBtXCAOHn6YInujcAvOc0n9Y/uR2zP5jOjrGAX6vW0ERE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RxxQ03As; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RxxQ03As"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF5DB61C98
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  2 Oct 2025 17:46:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.236
X-Spam-Level: *
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kT7IDoSb2tBK for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Oct 2025 17:46:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=karanja99erick@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0BB3861C96
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BB3861C96
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RxxQ03As
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 0BB3861C96
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  2 Oct 2025 17:46:27 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-46e6a6a5e42so5879115e9.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 02 Oct 2025 10:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759427186; x=1760031986; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U9sNcmKDNcl/Dt3ZzxXXGUrNG+YQTuMkF7kiQoXtwf4=;
        b=RxxQ03As2wuinOKyNkZA9TlEajLMt5ZM2jVGCOtwQh4mR46DEqPagvn7jMA2dh2cFP
         3OZH9wigE41xjXtC6VMj2v3TxGrOLOs9DEMPYg6O2PsmITHkWhplN7c7EAiqBAjSUMjX
         MBBsfAzUXQw+0b2wGpikootijozaI4KCJnVVNgi64p+FjWY4K1RwAdTLKSDMQ05fTsmn
         nAN4rc+S8GTJik5OgAiBHjBLt724MLVAHzyg+F2MXzQO5aQb+ggAfMwfelK8ifk6zEgI
         lJR0qFJeUY5MegaoOlGigpA0E1M4+ZbsAZFizyFDTk5dTrXvpfgFgxxpqvWyDQ8yAhkX
         39CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759427186; x=1760031986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U9sNcmKDNcl/Dt3ZzxXXGUrNG+YQTuMkF7kiQoXtwf4=;
        b=QrMQnu01HgBtpi8cNddBwbeqyRDKUpskpP6Q8tucBfMm+ESBGeuUb2E40E0aBMwulh
         LdhAj9ajIzYibZL0CL/w/ZzfpLaLyLKzqGrboC05RJ/joY/pynafZZGBeP9JTF9sXKR+
         8r1IUzb5IeqoEZXd9AqUexureuMHTo43HDADJ6zSkWPEvtrhVEqMyj9cg92KVjQ2uhNU
         t5glBJIvD/UKVPDwUIk4LC1Xzb5yMkpVSSr6auB9/bBoOGCpRQROy4c+kHcTKNwBm1o8
         5GF1UDTIYAyRU+If/rKq1moSaO4bH5bLtVI4XZaqHOOxRO3OFTnzSoFCe+lkNLtT7BRi
         MiEA==
X-Forwarded-Encrypted: i=1; AJvYcCUBpOMy/BLxL3IpXcXRYtySorXK+WRcJwNNkPY8tROk4MloSwExhl+qPhPDrXMu57XV2HkXKmop/Xmpu2v2TtUEmKMY4Q==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yz14Ca8rNlaDLwHxz/YSs/Vt29nC2Sfd7KXvSsoOelUFK7AFhYx
	+fzpg/DOWIbe87TT38LzXbNMMsNbwj+Yvo/3q9XciA+vPmsLth/zB4dZ
X-Gm-Gg: ASbGnct3RNi9FVtbPxveq9vZseF2xbDwCJeMTKD6RLCehNuVEkpLvVug+etpkDRF2B5
	AMagC7Mnxnc3vMky8tnrXur0JNBx0EZyTf8aXmxkAWN6/+/jvx8LHk3Af4AXXl1+413M68TugwJ
	/nOsuSb5g9LYya6XHgqq5lMgKDCPTM/4noH8rgZKyy9I9sidY8ZPkW3e44e8laK/IwpkxSod/94
	q0Pl6UuF4Py+GMMa+v6488lUWWaY85758HWqwsl6QxStwmqmDoZay0fKu7GY/mwi5np3RhXTa9L
	fLyYGRaQKPOS9Q9IFm3Wd6zIfJluhvgvSdcMiUiq9z2JCBP50IIbgoCnE1QIxWeUfFMx73MrIcR
	KnUwEtYAUDiqjkr5GNAb3N+CYiQ/6MUXMPnuQOiopGw==
X-Google-Smtp-Source: AGHT+IHDGwwW7vV9OjeTKcYO8fMtxK6OUhwxnDACT7Snh7gOrjwK+iCQOUA3HzoB6hu+zfULqCwkWQ==
X-Received: by 2002:a05:6000:2c11:b0:3ee:1296:d9e8 with SMTP id ffacd0b85a97d-4256714ca6cmr97372f8f.17.1759427185491;
        Thu, 02 Oct 2025 10:46:25 -0700 (PDT)
Received: from pc.. ([105.163.1.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e693bcc2csm43640665e9.12.2025.10.02.10.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 10:46:24 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	david.hunter.linux@gmail.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Erick Karanja <karanja99erick@gmail.com>
Subject: [PATCH] net: fsl_pq_mdio: Fix device node reference leak in fsl_pq_mdio_probe
Date: Thu,  2 Oct 2025 20:46:17 +0300
Message-ID: <20251002174617.960521-1-karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing of_node_put call to release device node tbi obtained
via for_each_child_of_node.

Fixes: afae5ad78b342 ("net/fsl_pq_mdio: streamline probing of MDIO nodes")

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/net/ethernet/freescale/fsl_pq_mdio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/freescale/fsl_pq_mdio.c b/drivers/net/ethernet/freescale/fsl_pq_mdio.c
index 577f9b1780ad..de88776dd2a2 100644
--- a/drivers/net/ethernet/freescale/fsl_pq_mdio.c
+++ b/drivers/net/ethernet/freescale/fsl_pq_mdio.c
@@ -479,10 +479,12 @@ static int fsl_pq_mdio_probe(struct platform_device *pdev)
 					"missing 'reg' property in node %pOF\n",
 					tbi);
 				err = -EBUSY;
+				of_node_put(tbi);
 				goto error;
 			}
 			set_tbipa(*prop, pdev,
 				  data->get_tbipa, priv->map, &res);
+			of_node_put(tbi);
 		}
 	}
 
-- 
2.43.0

