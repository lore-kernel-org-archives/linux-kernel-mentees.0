Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB542206BE
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Jul 2025 07:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753168521; cv=none; b=Ynbg/GXDdQQqRLWSn9f4oEvmryrwVitCWAtZM715qsG+Z0jxOIc6ie4UZF7ASXWFyrodMJRQ/tXU7woWtYZUw+gQ2Jxb07jW6MjILRvPAGA4VeVKT7Le/zp+aFe4nCPHcz79WriFEtSPRTIqpY9acJ+d275XnCUrgl16QnR7gOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753168521; c=relaxed/simple;
	bh=akOILnwcc9pmGNevA3WX5BCXInqcsvZXjaatCCQKodE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RpYE/yDcR4ELH+MrUdH0OxORFtNCRR3IIZP9tHar2ukaYb0f90hiAEfD+yodNIx2cEwmlpyQLMvnClJrlspXCMYOzE5n9cHMPCs5aDRzrxkn1wZc/TJhHFO1i8WNNhpka+mKQmFzsvYIjIWoKFt64BL6twMCKDaeOGb5w5c042Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YVgdKbr4; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YVgdKbr4"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-23636167b30so46845205ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Jul 2025 00:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753168519; x=1753773319; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C+VMjOAQQOuEXnxm/JTcqhzieaE2t0Z16ySCSWuJaF4=;
        b=YVgdKbr4wRqVfYmIGYf733ia1XH6rtVRK69vvJ3es4wp/70ntLBaHH06wRlqzRwiQj
         mTNIPmxf+3my5J/cKShvAThTvuZpFOmX4Xe1TWGq0DWdjhZoUksDAuBWOtxDHI7Pe/Bz
         S82etSX0isRGLRLeQGmr1FfLOfFLKSL2qXVahWc4TZB4AG6bT7c5zDc+z/h91vK09EVK
         V6yAEcO7D3sxKgG8Wj4/tRl0r8laP51NdLmzj8KTvhaoC0F3nccK1O+vT0qmfevp7g6y
         0fFQVupYy24Gy6eq5e0jPVUrC2+n7fzQ8pBjef1afAfUld1Rq8rOPhgLaMGvuLC9racd
         IbFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753168519; x=1753773319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C+VMjOAQQOuEXnxm/JTcqhzieaE2t0Z16ySCSWuJaF4=;
        b=m0f2nfaTq7aD/Vvw1ImQKvbZcq2W4ufsvmACGkQGc3nvOXgx7boGXcpfB4DuNg91oE
         nMzmTbUfceA12WlKu1bHcKJBZ84XGDwfJS0Fbmfz71rKLNXRM0SEPaiR495p81JVwoHH
         jo/O3VggttgkF6w/e/eelIGXUiU2C83e73a+/VvVWREnwyjJENq7AGJdzMFvXPeGQORw
         U/CB3239Zs+1x0nXCGpgGtih4pJBg0f4raHZQ1eZDvom830zDaPm/EhFVh1PZOb5ToPK
         Zh+ZtWoeyknlhUzvfF1tMMQEfHjJEBSgrD1vOtb67U72iWvFOZTA/6XnqdwLZfhn/uTM
         D72g==
X-Forwarded-Encrypted: i=1; AJvYcCXoAVDl61H54Cy6DYQ5vUF3696sbDu3jpjy8Su/4pJsLCYkuUuaZVlnbiGMuoYXEekqze+zmZN8ysVL9qVCmqBVy1I4PQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwQvTgqThjp4cbcjsUEbdDDEiXxrDot5xVk5T5Zl8LUDBK+0T9U
	jOd6liXVcNrTMppk6cyjfju+j1CBhhgwubH3K4/KamKHiObFz7mz6nEm
X-Gm-Gg: ASbGnctt6JFFNioI+POn5vCgdooXcx3ACu5so7j+822jIA7dc+1jNhpwg5vxa8B98C1
	R+5Kjj90efCUe5+dL8G1z14+CrXvBxq+a2GJfIDIe4hgFj88x1+ykezypEPVTSGvemzKyC6NvuL
	ILJkLv72d1bARG3eZI++VG7d9AjZY0T63NhchMqj58J7sVTLpSlyowotJe3nZXiVzKwpFHItpor
	dmgnuDSjfGeWT+c9MqfIfZzWz0UmMRXYzzi7BKu8DrsfwxU1PiYTbDNV3u4aEr2aqK+A8nwx2v2
	xZBWm3UQt0TzHDgLMVJWYDVz2E3yLjTm4cbBFUT9A761fm5FHaz7ySL3kF3p9UmN90JMLyNuP1H
	ab59CBNpmoGHSEUeUYIBKGL0588+4gQ==
X-Google-Smtp-Source: AGHT+IFFtyJvM2a2AEb7k9Jrp9kmCsiJqx3vXKdoGAMsFsONk/ZGr1SJZlzNLSxI6ryLGWuWN2M70w==
X-Received: by 2002:a17:902:ea01:b0:235:2403:77c7 with SMTP id d9443c01a7336-23e2576e462mr261559035ad.37.1753168518460;
        Tue, 22 Jul 2025 00:15:18 -0700 (PDT)
Received: from archlinux ([38.188.108.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3c3a5d15sm69056005ad.62.2025.07.22.00.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 00:15:18 -0700 (PDT)
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	jhs@mojatatu.com,
	xiyou.wangcong@gmail.com,
	jiri@resnulli.us,
	sdf@fomichev.me,
	kuniyu@google.com,
	aleksander.lobakin@intel.com,
	netdev@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: [PATCH] net: Revert tx queue length on partial failure in dev_qdisc_change_tx_queue_len()
Date: Tue, 22 Jul 2025 12:45:08 +0530
Message-ID: <20250722071508.12497-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When changing the tx queue length via dev_qdisc_change_tx_queue_len(),
if one of the updates fails, the function currently exits
without rolling back previously modified queues. This can leave the
device and its qdiscs in an inconsistent state. This patch adds rollback logic
that restores the original dev->tx_queue_len and re-applies it to each previously
updated queue's qdisc by invoking qdisc_change_tx_queue_len() again.
To support this, dev_qdisc_change_tx_queue_len() now takes an additional
parameter old_len to remember the original tx_queue_len value.

Note: I have built the kernel with these changes to ensure it compiles, but I
have not tested the runtime behavior, as I am currently unsure how to test this
change.

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
---
 include/net/sch_generic.h |  2 +-
 net/core/dev.c            |  2 +-
 net/sched/sch_generic.c   | 12 +++++++++---
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/include/net/sch_generic.h b/include/net/sch_generic.h
index 638948be4c50..a4f59df2982f 100644
--- a/include/net/sch_generic.h
+++ b/include/net/sch_generic.h
@@ -681,7 +681,7 @@ void qdisc_class_hash_remove(struct Qdisc_class_hash *,
 void qdisc_class_hash_grow(struct Qdisc *, struct Qdisc_class_hash *);
 void qdisc_class_hash_destroy(struct Qdisc_class_hash *);
 
-int dev_qdisc_change_tx_queue_len(struct net_device *dev);
+int dev_qdisc_change_tx_queue_len(struct net_device *dev, unsigned int old_len);
 void dev_qdisc_change_real_num_tx(struct net_device *dev,
 				  unsigned int new_real_tx);
 void dev_init_scheduler(struct net_device *dev);
diff --git a/net/core/dev.c b/net/core/dev.c
index be97c440ecd5..afa3c5a9bba1 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -9630,7 +9630,7 @@ int netif_change_tx_queue_len(struct net_device *dev, unsigned long new_len)
 		res = notifier_to_errno(res);
 		if (res)
 			goto err_rollback;
-		res = dev_qdisc_change_tx_queue_len(dev);
+		res = dev_qdisc_change_tx_queue_len(dev, orig_len);
 		if (res)
 			goto err_rollback;
 	}
diff --git a/net/sched/sch_generic.c b/net/sched/sch_generic.c
index 16afb834fe4a..701dfbe722ed 100644
--- a/net/sched/sch_generic.c
+++ b/net/sched/sch_generic.c
@@ -1445,7 +1445,7 @@ void mq_change_real_num_tx(struct Qdisc *sch, unsigned int new_real_tx)
 }
 EXPORT_SYMBOL(mq_change_real_num_tx);
 
-int dev_qdisc_change_tx_queue_len(struct net_device *dev)
+int dev_qdisc_change_tx_queue_len(struct net_device *dev, unsigned int old_len)
 {
 	bool up = dev->flags & IFF_UP;
 	unsigned int i;
@@ -1456,12 +1456,18 @@ int dev_qdisc_change_tx_queue_len(struct net_device *dev)
 
 	for (i = 0; i < dev->num_tx_queues; i++) {
 		ret = qdisc_change_tx_queue_len(dev, &dev->_tx[i]);
-
-		/* TODO: revert changes on a partial failure */
 		if (ret)
 			break;
 	}
 
+	if (ret) {
+		dev->tx_queue_len = old_len;
+		while (i >= 0) {
+			qdisc_change_tx_queue_len(dev, &dev->_tx[i]);
+			i--;
+		}
+	}
+
 	if (up)
 		dev_activate(dev);
 	return ret;
-- 
2.50.1

