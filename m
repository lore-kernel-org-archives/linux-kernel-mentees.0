Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45901F26E2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  8 Nov 2024 20:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731097557; cv=none; b=XtQhqlhlQgHvOzIxdmxgGyEOFgdITv3IR1uK3LgOjuxoxV4t3Ed2DG2c+v85NeY7uPCbq6+SByFEinJKBstan9LpRn5hH7WfwcyaZlvIiNtxc9XiRuLs4pTrfRJ9ARHHS3f8xwHiH8ezjgMd/f+32BVAkfUqZSlzeMgNCRfN3MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731097557; c=relaxed/simple;
	bh=SW9sqs7q/nfSn6SZFdJrxHOxVhgt7idMNp23czW+ZzU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=QnDRUArPIDAbc7dZdQpfA2sJ4vJPtIAQjEjL8CJ06WyARqoFaQFOjUcvXXQ1Lgq25DYjZiEqTyI1C9ANt8ohupvQXGHGsrCFoFxL8uR11rdChcoxc83YMmdf1EXXuH3mePe4Ems7avWf0cgW9uuPGakX9FU5o2V9mu67AVRn+dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nk4HjbSD; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nk4HjbSD"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 633EE613B0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  8 Nov 2024 20:25:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MzmzM7tp1DCg for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 Nov 2024 20:25:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=xandfury@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B7E61613A6
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7E61613A6
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Nk4HjbSD
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B7E61613A6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  8 Nov 2024 20:25:54 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-71e70c32cd7so2136785b3a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 08 Nov 2024 12:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731097553; x=1731702353; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HjsnjJkvFk70FIP+kt5SypebIuFSVyDViD7ncvBNOtM=;
        b=Nk4HjbSDqfCd31kfAFFzQSRtOdhDOkNJ30pS9JJ9YboIHK+GwHjx/ZTtAPF89k6XYo
         qOIT6olIWeRV2lZZMHBOvhSVe5KViiKUMKde5hDd+RZL2ziUziJcH1Nu3F/3tjDPtr0W
         1rGj6UW6xPRAgFTjwjzfmSxFRx/Ut+5dnvi8fZnG5u/FZCacZSJHygw6Xg9vQs/Lt+VX
         ZnEm14UKxFxgXfk2hddaDzPS601PRNYcP22ir6DI176LnG8hgCJk9F9Qgg++4+4ZBlRM
         v9ouyMcn02BJt78gmF5p9OwNJ8qAyy6InuM7p5Fi3re6/jF8Ypa5OPQp2CU9YUgSp9rh
         fWew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731097553; x=1731702353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HjsnjJkvFk70FIP+kt5SypebIuFSVyDViD7ncvBNOtM=;
        b=ZPsUMnjNYnjRaIQGtK5hIPgrTtGSQ3ULPccNWBMmIywjgKQ3R+eyH3bNNwmIsMzrp0
         hM+6qio5yb+o5ei+QCAHyWg0EXqG72Ez3JrzQl9hty00TKnhC3xRf6Ld6ntDrcCC6ARq
         2qiCQr+KcFOp4B9HZg5D686/3Bayk8ClN9Jor1Fcb7LrugGllHee+/43Obpfqh7tLZ6l
         ZlUHi6xMwCHVtAgTP1VqJNcLUTyTXyy6a+wqi6Ti25j3T3NyclkgW0TgbbektrsknbJg
         Sd5NO1dX51kRwmv0XOD59HIYhs1M7ACduEXCnIScaa3cF7FPKum0vWf2K0JvzIz6h/vc
         QdYw==
X-Gm-Message-State: AOJu0YxpcY6Mfu+cvRC4ZERCtA+Atwlu0gQq8LPFtQEuy+7rC7DZBwwH
	ltYk7jsnmDbVvQuNNG5mKBor/EPP8opvXtVjZkSwwcQTS5uv94AE+5uYYwji
X-Google-Smtp-Source: AGHT+IEqu6hYITG3CTRQf4ojcYGFShTgO4TAJ9wD/3E0BVbXGMBR2cq9fgn6Jmxx9FvlAPL57EqxTg==
X-Received: by 2002:a05:6a00:2388:b0:714:2069:d90e with SMTP id d2e1a72fcca58-724133966b8mr4742841b3a.26.1731097553013;
        Fri, 08 Nov 2024 12:25:53 -0800 (PST)
Received: from 1337.tail8aa098.ts.net (ms-studentunix-nat0.cs.ucalgary.ca. [136.159.16.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724078a7ef5sm4342095b3a.63.2024.11.08.12.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 12:25:52 -0800 (PST)
From: Abhinav Saxena <xandfury@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org,
	intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	rds-devel@oss.oracle.com
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	Tariq Toukan <tariqt@nvidia.com>,
	Allison Henderson <allison.henderson@oracle.com>,
	Russell King <linux@armlinux.org.uk>,
	Dragos Tatulea <dtatulea@nvidia.com>,
	Rahul Rameshbabu <rrameshbabu@nvidia.com>,
	Abhinav Saxena <xandfury@gmail.com>
Subject: [PATCH 1/2] docs: net: Fix text in eth/intel, mlx5 and switchdev docs
Date: Fri,  8 Nov 2024 13:25:47 -0700
Message-Id: <20241108202548.140511-1-xandfury@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix various issues across networking documentation: remove duplicate word
in drivers/ethernet/intel/iavf, fix quote formatting in mlx5/counters,
correct typo in rds.rst and improve wording in switchdev topology doc.
These changes are purely documentation cleanup.

Signed-off-by: Abhinav Saxena <xandfury@gmail.com>
---
 Documentation/networking/device_drivers/ethernet/intel/iavf.rst | 2 +-
 .../device_drivers/ethernet/mellanox/mlx5/counters.rst          | 2 +-
 Documentation/networking/rds.rst                                | 2 +-
 Documentation/networking/switchdev.rst                          | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/networking/device_drivers/ethernet/intel/iavf.rst b/Documentation/networking/device_drivers/ethernet/intel/iavf.rst
index eb926c3bd4cd..73ce04c05071 100644
--- a/Documentation/networking/device_drivers/ethernet/intel/iavf.rst
+++ b/Documentation/networking/device_drivers/ethernet/intel/iavf.rst
@@ -171,7 +171,7 @@ queues: for each tc, <num queues>@<offset> (e.g. queues 16@0 16@16 assigns
 16 queues to tc0 at offset 0 and 16 queues to tc1 at offset 16. Max total
 number of queues for all tcs is 64 or number of cores, whichever is lower.)
 
-hw 1 mode channel: ‘channel’ with ‘hw’ set to 1 is a new new hardware
+hw 1 mode channel: 'channel' with 'hw' set to 1 is a new hardware
 offload mode in mqprio that makes full use of the mqprio options, the
 TCs, the queue configurations, and the QoS parameters.
 
diff --git a/Documentation/networking/device_drivers/ethernet/mellanox/mlx5/counters.rst b/Documentation/networking/device_drivers/ethernet/mellanox/mlx5/counters.rst
index 99d95be4d159..b23f36a2d28c 100644
--- a/Documentation/networking/device_drivers/ethernet/mellanox/mlx5/counters.rst
+++ b/Documentation/networking/device_drivers/ethernet/mellanox/mlx5/counters.rst
@@ -1135,7 +1135,7 @@ like flow control, FEC and more.
      - Informative
 
    * - `rx_pcs_symbol_err_phy`
-     - This counter counts the number of symbol errors that wasn’t corrected by
+     - This counter counts the number of symbol errors that wasn't corrected by
        FEC correction algorithm or that FEC algorithm was not active on this
        interface. If this counter is increasing, it implies that the link
        between the NIC and the network is suffering from high BER, and that
diff --git a/Documentation/networking/rds.rst b/Documentation/networking/rds.rst
index 498395f5fbcb..955afe0567aa 100644
--- a/Documentation/networking/rds.rst
+++ b/Documentation/networking/rds.rst
@@ -339,7 +339,7 @@ The send path
   rds_sendmsg()
     - struct rds_message built from incoming data
     - CMSGs parsed (e.g. RDMA ops)
-    - transport connection alloced and connected if not already
+    - transport connection allocated and connected if not already
     - rds_message placed on send queue
     - send worker awoken
 
diff --git a/Documentation/networking/switchdev.rst b/Documentation/networking/switchdev.rst
index f355f0166f1b..df4b4c4a15d5 100644
--- a/Documentation/networking/switchdev.rst
+++ b/Documentation/networking/switchdev.rst
@@ -162,7 +162,7 @@ The switchdev driver can know a particular port's position in the topology by
 monitoring NETDEV_CHANGEUPPER notifications.  For example, a port moved into a
 bond will see its upper master change.  If that bond is moved into a bridge,
 the bond's upper master will change.  And so on.  The driver will track such
-movements to know what position a port is in in the overall topology by
+movements to know what position a port is in the overall topology by
 registering for netdevice events and acting on NETDEV_CHANGEUPPER.
 
 L2 Forwarding Offload
-- 
2.34.1

