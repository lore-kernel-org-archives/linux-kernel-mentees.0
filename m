Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD0C13A86E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 09:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716803245; cv=none; b=stf4urWrsFnuh5xg23IPWgLq852M6v3q3OXDrLniphDYsdwInelDnvrHbY7Don7+xadv+eodNAEmXeWWmbX1t0t1y15fzyWK65txqvjNxyd4q5F/9sFqK6nUWkdwRFlmpSrXINdYVEuo6EWYeFsdDCFtLVUxZoaI6QytLplaUGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716803245; c=relaxed/simple;
	bh=mogT9CSK+Vk/ExDHgD2Bj+5ISdL3rSJDhZAR+YNxGEg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IuOD22XGFINLn9R2mPZ/i9fB9doI/+ggg0nwDAxgMEBf/UoeswaqUIsFc/Q0gew/nrp7bL8LSLTimFgEwP1z84JDUstzSqCDlv6amE5rTLSfMDpBav0tPgpftJrzBh01phO92zPPCl6MHyTSMXD2mQlmy+6DQ6+avHw5Na6tCmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l6nqg6ab; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l6nqg6ab"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A75A781E5E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 09:47:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vg9tBnlmhzus for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 May 2024 09:47:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=yskelg@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 822A781E55
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 822A781E55
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=l6nqg6ab
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 822A781E55
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 09:47:23 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6f693306b7cso5935895b3a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 02:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716803243; x=1717408043; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=50caWXAQ+sC+cT9R3qngK0AJe0BNtDYXixsKN4qP8Dc=;
        b=l6nqg6abY+oRl/RP5bUp6GS1Fybp4fK4Ab9h0bxfKLiA/Z1MwmNW0TxtX6B+bEd0yY
         8ceLHich5yvSLhlKq75i2NKvNp32YdXL9dFC6GSY8C1A1zEBNNtYO9SPgNW5cBJGeH2j
         ep3bJ7TXg6T4bCpz69oX06mKEFEMiqQhvyg9tyWlCz5V3xzmO5BRnigTbeTMt5KwYdRe
         is5wQT8AGwZoARaiYcVx7zxfnLcgSW+mN6qcMhHi1m2KlmlbjhcjVDRuSYVjk+oh4TCq
         nElyk3yAn0bMBwPcXbxwxHXO8gPX21yrY2OlGs+Rl9QgUQC5QGyNhMYyq0AFEyV24H0g
         zUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716803243; x=1717408043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=50caWXAQ+sC+cT9R3qngK0AJe0BNtDYXixsKN4qP8Dc=;
        b=tHBYcy7qdvwu3+OmQCrHtSiDdQQaKBJcArBGE4bCdY65ENwxgO7wjvzCRIlzjYTsTW
         UrD0/vBGAD+V5efXPbnAYkv0VNmcYGI7hMHbWe0tCMvneKOaHvq92Xl7M9MZdNqjDlBq
         bAhnn5NNnsMQpF6+tkpnkz/G3wLqOWyRR8YmuAz5RxDAITnzEaZMmTGKDdPKPraKQxcm
         ci0bzorGtr8E3w15MOKcW3ULAC17OZ8u8lruvQeyDVjgNihFALKM5n2a3qrT9gHgXEXt
         wewjzzycLsLg+GsnyLQezNbRMa9hiSv8fHLN2lrpQQcXXYPLZ3pzhOZIikrUxe+7TWmg
         jvqw==
X-Forwarded-Encrypted: i=1; AJvYcCVh5IcgGfjdh5tbE76MKvWHVACUDXGbw7oELrOuODvNosedJeGfhstQrQrlLsyGuEN3lalVkCd/yTyOJvbjTZvfWooQHuFG9NpF6QHBhWS2ewp6IbYrIcU9SOIDquG8
X-Gm-Message-State: AOJu0YzB1QvHKqkxu2qIlvgH8bfHvDtLrus+ctUKSx1VeuQBs+LJjmy6
	SE5h1VSBcCxgJZ9PM307/HAmQfnCpzPR9VafdY7CFZZWCXROr0Q9
X-Google-Smtp-Source: AGHT+IEDc4LAFSKqNq5l9LzfWWsnC59oJ3ZllKmfg3ST/QQZBYyxM+DacHLuQWZE3lQ4rKv/W1CerQ==
X-Received: by 2002:a05:6a20:72a8:b0:1b1:c745:5c66 with SMTP id adf61e73a8af0-1b212e64d95mr11249287637.54.1716803242578;
        Mon, 27 May 2024 02:47:22 -0700 (PDT)
Received: from paran-QEMU-Virtual-Machine.. ([118.32.98.101])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c7d1b39sm56788195ad.116.2024.05.27.02.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 02:47:22 -0700 (PDT)
From: yskelg@gmail.com
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
Cc: skhan@linuxfoundation.org,
	Austin Kim <austindh.kim@gmail.com>,
	shjy180909@gmail.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Yunseong Kim <yskelg@gmail.com>
Subject: [PATCH v2] tools/virtio: creating pipe assertion in vringh_test
Date: Mon, 27 May 2024 18:46:05 +0900
Message-Id: <20240527094603.23481-1-yskelg@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yunseong Kim <yskelg@gmail.com>

The parallel_test() function in vringh_test needs to verify
the creation of the guest/host pipe.

Signed-off-by: Yunseong Kim <yskelg@gmail.com>
---
 tools/virtio/vringh_test.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tools/virtio/vringh_test.c b/tools/virtio/vringh_test.c
index 98ff808d6f0c..43d3a6aa1dcf 100644
--- a/tools/virtio/vringh_test.c
+++ b/tools/virtio/vringh_test.c
@@ -139,7 +139,7 @@ static int parallel_test(u64 features,
 			 bool fast_vringh)
 {
 	void *host_map, *guest_map;
-	int fd, mapsize, to_guest[2], to_host[2];
+	int pipe_ret, fd, mapsize, to_guest[2], to_host[2];
 	unsigned long xfers = 0, notifies = 0, receives = 0;
 	unsigned int first_cpu, last_cpu;
 	cpu_set_t cpu_set;
@@ -161,8 +161,11 @@ static int parallel_test(u64 features,
 	host_map = mmap(NULL, mapsize, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
 	guest_map = mmap(NULL, mapsize, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
 
-	pipe(to_guest);
-	pipe(to_host);
+	pipe_ret = pipe(to_guest);
+	assert(!pipe_ret);
+
+	pipe_ret = pipe(to_host);
+	assert(!pipe_ret);
 
 	CPU_ZERO(&cpu_set);
 	find_cpus(&first_cpu, &last_cpu);
-- 
2.34.1

