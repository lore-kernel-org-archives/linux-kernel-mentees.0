Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CB319CCEA
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 15 Mar 2025 06:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742019924; cv=none; b=EFlT00oZjFM+Aj6uPFdcuze9L2H6sMoYyAl3xuX8kTp/P6gfyl7nHBr4ILpCauKAhYxwAm0PcGaA/iDL6vyg/1OBtlwakJoRuKxe+Hbz3YJLYngyyrWNhPXi2Tc3UH8o1BLFCfH5GHnau2AeczK8rF6Ka5Ce7mqeUmm1XqmmxS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742019924; c=relaxed/simple;
	bh=nWAkIYVQP75R8U7rNTUhYN7mb1xk4mK4d5YywW0AYpA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cjm2qM9ZneNMTF8I/nR5EN1NxNbV7406BFbaNZ05QhNKzCxw8qWtWihpoo9e6JNUd+CijrQwgBuIb+rKHLpgpVcL0EPjvloRao1dip6kLprOtgjMKjhjSXDRD1/ha76epa5yjwkDcySHk3hEcE3scQfuv+0Tnd3JV7i4Ul7KIlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=miRuQDkb; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="miRuQDkb"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-225477548e1so50425175ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 14 Mar 2025 23:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742019922; x=1742624722; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l8cTPPc6gqUNZEA7H8LPqEukzOiIdQFuKMBLubQ698k=;
        b=miRuQDkbx0aEmcsTrHx5oaFERO0y3ArFtwGhaAP9UfefEsvKuSnp9rRl6Ds/fXQwIU
         +4sHq+OFC4XiBswwAyt7FYRSOBoae+xHH/DcNnfoDVlH0A6/YOhRtGHCY+tBhx8h6R5f
         IjqxHc+weAhDi5UiX0RCMTI47ZVU7XC2KlXPmU47v/zDcCCpfm7hgNy/I1qKfBUKA4iO
         Q8Td77uSGg63kG/EgIOaxUOTzis02Ub2xyxLkkjw4LYGW2rIWsovxlcjUfFA4FjwO0RV
         AKtwbjRDckNnbUY8KvSwZn9sBbtTTPlrPD6TWKSOGZzFdPr/O6HkbPuuQMUmK29F6noS
         U2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742019922; x=1742624722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l8cTPPc6gqUNZEA7H8LPqEukzOiIdQFuKMBLubQ698k=;
        b=gvesaNzfl2DeBnQos+iUBQacD8+sO+jiokmX4tML1HAfmA6rwrLDMkPBpjiE1x83rC
         HjXFWz3xC2s2xX+KYSaGYphETRwvOycFxwOehcXvDYWbiN8GoXv9aG4Pcwn3Rv7bst/g
         cH3ckfGAOhQQJFEogR/wTPyQVb5mu6RZfbBcyS2HQLbZffx8IvA5837G5gbO9BaFjUsD
         LjbCvJvEHwUtIK4lG4CgusSL0Zto6nbS4+S+Yvpm9WG/YzsWGV4aMTOVkXPCCxGJeFMn
         BECenwLzyy3VZQdiTIXY7UX+3u+wdJg6lm9fhloot0d1EdpPIu69MGhAJgWTURLn71h1
         2wTg==
X-Forwarded-Encrypted: i=1; AJvYcCXA9MzMgP4VN/kYUirtUNP4mzfemIxy2FPZMTXQhq9vWPX9297yUfIe7zEAkdlMO3HSpuAIjDYthg5Ip3Y87gHJRvwQDA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyJgFGZBEUjefjBb9ClWrsgANjNZdgtOVG+j7I3wKfKd2hzXuRK
	OTu1rUTiFmK8teMTAEuUhiRVyvieXWY7FlqDKPCfqxNUvmEVgmL+
X-Gm-Gg: ASbGnctwbuyIr/0tMuDkqyvwRAo4TO69Y0kcMabH4ZsSLSxq8nFRkUy6NzOaS/g5F0U
	mwRHuPJP9zK6lMIHRHZKI0Fc2CKLlsVV5ZeyJMTvk/OOJyQu5wYIuffE1mpa2qIbn1g53efRLj0
	XBzpfAfK5bGAvABOJMhOAYUpRZF9hzvIq9tXRbL8e1GOkGuDqEtaeHywo/ZtBy7dKvR4HkLON+4
	kSIUZCBewGl0/IceMycHbojFokKF5pZLcYnN+Db4KGbqbB+h700LZJNTW/ZJyODx3pgTqrieabH
	n1+PzDlcphRP0LRfsV8xALXyUKTBPPjYIOamROfPU08Hid+jvMGTMSkA4pVBETZ3FdBAMUx7kEA
	0kPO4N096tA==
X-Google-Smtp-Source: AGHT+IHSnWrNpbJGdm2Ep8MCHFb4xCh1XOD4X4acsZBmcQb4pGwIZKWaITWJI6UfHE15+VY0Cnw11Q==
X-Received: by 2002:a17:902:dacc:b0:220:f140:f7be with SMTP id d9443c01a7336-225e0af5c2amr61112395ad.41.1742019922389;
        Fri, 14 Mar 2025 23:25:22 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:94e9:cb4b:5e68:9bff])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68884fcsm38525115ad.16.2025.03.14.23.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 23:25:21 -0700 (PDT)
From: I Hsin Cheng <richard120310@gmail.com>
To: alibuda@linux.alibaba.com
Cc: wenjia@linux.ibm.com,
	jaka@linux.ibm.com,
	tonylu@linux.alibaba.com,
	guwen@linux.alibaba.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-rdma@vger.kernel.org,
	linux-s390@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	jserv@ccns.ncku.edu.tw,
	linux-kernel-mentees@lists.linux.dev,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [PATCH] net/smc: Reduce size of smc_wr_tx_tasklet_fn
Date: Sat, 15 Mar 2025 14:25:16 +0800
Message-ID: <20250315062516.788528-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable "polled" in smc_wr_tx_tasklet_fn is a counter to determine
whether the loop has been executed for the first time. Refactor the type
of "polled" from "int" to "bool" can reduce the size of generated code
size by 12 bytes shown with the test below

$ ./scripts/bloat-o-meter vmlinux_old vmlinux_new
add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-12 (-12)
Function                                     old     new   delta
smc_wr_tx_tasklet_fn                        1076    1064     -12
Total: Before=24795091, After=24795079, chg -0.00%

In some configuration, the compiler will complain this function for
exceeding 1024 bytes for function stack, this change can at least reduce
the size by 12 bytes within manner.

Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
 net/smc/smc_wr.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/net/smc/smc_wr.c b/net/smc/smc_wr.c
index b04a21b8c511..3cc435ed7fde 100644
--- a/net/smc/smc_wr.c
+++ b/net/smc/smc_wr.c
@@ -138,14 +138,14 @@ static void smc_wr_tx_tasklet_fn(struct tasklet_struct *t)
 	struct smc_ib_device *dev = from_tasklet(dev, t, send_tasklet);
 	struct ib_wc wc[SMC_WR_MAX_POLL_CQE];
 	int i = 0, rc;
-	int polled = 0;
+	bool polled = false;
 
 again:
-	polled++;
+	polled = !polled;
 	do {
 		memset(&wc, 0, sizeof(wc));
 		rc = ib_poll_cq(dev->roce_cq_send, SMC_WR_MAX_POLL_CQE, wc);
-		if (polled == 1) {
+		if (polled) {
 			ib_req_notify_cq(dev->roce_cq_send,
 					 IB_CQ_NEXT_COMP |
 					 IB_CQ_REPORT_MISSED_EVENTS);
@@ -155,7 +155,7 @@ static void smc_wr_tx_tasklet_fn(struct tasklet_struct *t)
 		for (i = 0; i < rc; i++)
 			smc_wr_tx_process_cqe(&wc[i]);
 	} while (rc > 0);
-	if (polled == 1)
+	if (polled)
 		goto again;
 }
 
-- 
2.43.0

