Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB3431158A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  8 Sep 2025 18:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757354980; cv=none; b=fH2lvwjeLR9s4iHYbFT6ULJMp3X7WlYfWUqcBUBsfxLdMRng/bT5EAdGZzBkC1CR6lntbQi1kxKI6dXY48DppNSFGSGl98vvYObfrDMQxmzKXVRgG8c5amW6NN7PfQBvXXJhdxjnUf0NaMh0ABYumJI5xGm8HmdyBQTvlJYv2jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757354980; c=relaxed/simple;
	bh=NuQI4nMA0g0N9BbTVEQpy+JxTD3mg9+9KzSwGSix7cU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QfDpDLwABR1111bbNdKQJCrK/CZPSXmR7IVjby5udWyyHnF61ccZsYsMxJrh37ogHn+4ch5NsHaG7sduTEJYlsONUls8VbCfr4h+PMqiiu5uzVZOzW+dlOAkXzXCYr1F22fKcWnbh2DjkDsd6nybuXEiWht+CJyR0tmHRiNJa0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jllvRbGn; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jllvRbGn"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21693408CE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  8 Sep 2025 18:09:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R6gNX6pkAuXl for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Sep 2025 18:09:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=kriish.sharma2006@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 781A0408D9
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 781A0408D9
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jllvRbGn
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 781A0408D9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  8 Sep 2025 18:09:38 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-24c89867a17so45635585ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 08 Sep 2025 11:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757354978; x=1757959778; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RTgXOKpTqqoYfQsbZozKU3x3sBsg6MhNCEyIXZl9xW4=;
        b=jllvRbGnK4U7eDZmt/NCUhR/d9MOb1GlL/xsaSGGKh0s1UFCk2it0G4tDxkxTWHd8K
         MdDufUhyc2iyDdg/QsUPORCaDaCofDqlsT7k8V83QiYt+vmDB6qUeLa8ReE43wkwnUAK
         Z9uQPFcTNlOe6l+XOjyAZsW4o4YUZVvDrI9hWpyIFu+y2CiasC2xuhYa0R4P81ZoID21
         2n4N67z52TpeoK7mY4hPr1tOGHG8EP4KS9m1ZriVZTXuxIZYfEuSP6wboN+aS1unB5PH
         Oi5peleBBBBwWiQa58mbtLqbJvsAdZOi7gUp2UI163AbboS6W0PbRjANX/7DV7PzTzgI
         pjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757354978; x=1757959778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RTgXOKpTqqoYfQsbZozKU3x3sBsg6MhNCEyIXZl9xW4=;
        b=GcfmISf3po7HOOhrdngmvr77WZXgxd3GePLRuEz5uGXnT9uaE439125w4zHXGkn98z
         G1fN930Y2ZEczXcQ/8M4+o9vCDpmRS0KSJ1L4s5EzLt7uM9xOoFpesUbPeZNNAW0uM/S
         wBQnud0wEpLPb2qmh80Z0FTrHk1NB8im30XQgMNmi8KNcjeaIgpvwWUXh2zJ5f8hQDBM
         41PRL4y08mVktrK4r0JnTinGr4wEMoQqbZ0ZbeQJC2XkIh3w+qYhwP3izn6NFC+BDRsY
         IP+ClCO0FLwe23JZyMRxhtT+zAyQeWyKeYDQ6iK8QtRuR7/Y4j0BxYP2ndXbIrWk6QNm
         fQZQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/QXgI1M5euO6q/SalV64ozk/dvwa8T9SK4VxLuAJMeQmJSg+D52jb53C/xHnEedZdXRBexEX4VX0jG9aNdRlUYyQyoQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yx0RS5CnpcVBX0dVn9laurNJYabCxZpkZcovNdykQaUdY5In96a
	tLZETB/RvRXXcVOa3m93Azmk/QKQ+iKV09jm2FEYDheC40W99M4qZIbY
X-Gm-Gg: ASbGncs1DJFlEcuzqHfkW5i3d5dUEqavLirm6MRIedqNdf5DD6WR8qsegMwW3nLGQQ6
	6BVcZKXjwj2ZEeTWCYPwYbsWy0qJfYKk17zgvSFxWS1zG5YGg4kzpGtsjTEtlxbcVpz04wzDNV4
	hqsB/U5uAlGeOwk30K4iuUGSk3va7vCj0m0/2a6WvTQliBoUq085oIWBnzJIZh19wJIDlq7RD3F
	F7st1w2ouzMmFxKzAWondnhJTRdB5YCmod0xY722VGZTpRU8IsYDNTGSGUFPAA36ktSRAWDrYmR
	rwce/JNprrw2xM+GLh/f/sBMcUgrsTZ3gqcYhbyvPiQxxXBpNPFESk0zC2g1WZ2RmHIRPtwca8J
	fLx5b6fEXf0gBPKu5nxGVh0GAFby4JGluA/LxGcK8DhKOJwk/agvviw3PTNTtQHfXRpaLN02xaS
	LYHLLd/CYeqHKGKed6AcUjcAYhOG1Nqq323Nok61VEac4ZS8E=
X-Google-Smtp-Source: AGHT+IHUvGdkTF6ftj5zF8+ukk3mhEagKf7AXIJW2UU34v0dDiyGOkNx8+ez0Gtfkca6XYJRXXePLg==
X-Received: by 2002:a17:903:3d06:b0:258:2476:77db with SMTP id d9443c01a7336-25824767953mr24731155ad.42.1757354977526;
        Mon, 08 Sep 2025 11:09:37 -0700 (PDT)
Received: from crl-3.node2.local ([125.63.65.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b273e4ad5sm172768845ad.25.2025.09.08.11.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 11:09:37 -0700 (PDT)
From: Kriish Sharma <kriish.sharma2006@gmail.com>
To: alibuda@linux.alibaba.com,
	dust.li@linux.alibaba.com,
	sidraya@linux.ibm.com,
	wenjia@linux.ibm.com
Cc: mjambigi@linux.ibm.com,
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
	linux-kernel-mentees@lists.linuxfoundation.org,
	kriish.sharma2006@gmail.com
Subject: [PATCH] net/smc: replace strncpy with strscpy for ib_name
Date: Mon,  8 Sep 2025 18:09:13 +0000
Message-Id: <20250908180913.356632-1-kriish.sharma2006@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the deprecated strncpy() with strscpy() for ib_name in
smc_pnet_add_ib(). The destination buffer should be NUL-terminated and
does not require any trailing NUL-padding. Since ib_name is a fixed-size
array, the two-argument form of strscpy() is sufficient and preferred.

Signed-off-by: Kriish Sharma <kriish.sharma2006@gmail.com>
---
 net/smc/smc_pnet.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/smc/smc_pnet.c b/net/smc/smc_pnet.c
index 76ad29e31d60..b90337f86e83 100644
--- a/net/smc/smc_pnet.c
+++ b/net/smc/smc_pnet.c
@@ -450,7 +450,7 @@ static int smc_pnet_add_ib(struct smc_pnettable *pnettable, char *ib_name,
 		return -ENOMEM;
 	new_pe->type = SMC_PNET_IB;
 	memcpy(new_pe->pnet_name, pnet_name, SMC_MAX_PNETID_LEN);
-	strncpy(new_pe->ib_name, ib_name, IB_DEVICE_NAME_MAX);
+	strscpy(new_pe->ib_name, ib_name);
 	new_pe->ib_port = ib_port;
 
 	new_ibdev = true;
-- 
2.34.1

