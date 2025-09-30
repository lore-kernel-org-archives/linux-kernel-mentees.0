Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52A2268688
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Sep 2025 11:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759231186; cv=none; b=k2qizLT9q0V29k/mbxSOPlvSk/sPr5lnAKzChHW1dr6q6+FUidEPK5Sj6jyR5NEHictDxJensAHdC4gAJICd/GQIQCQ76tykjf+05jD9SKoP6rVOdZW1R2xtudO/CwIhCpYEZU0uV1F4am5PMZr9eVuCkVnWeAMYWZPMQukvItU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759231186; c=relaxed/simple;
	bh=tfTjaGYqjdjpPAtwV+H/jwYT35pncLldOWRjpX+Dc7Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZiaGi3QqwatZ0jAD0SMv94r5TURI0jKm20CV7TKE/5DBCzKBCA/NZsEfCKpk5B4sPnH7rJAEbzeg5X9GBufJudZ1RY4xDVqp94Q1ssimmyjTbH+0aWUz+Fg9DRKiNO+UaUdLeQyUOctZ1o7FTX60RusKKU52GOlXOuToBGFkh8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NkSIfj2D; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NkSIfj2D"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F83760E53
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Sep 2025 11:19:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vKz1ubhZryk2 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Sep 2025 11:19:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=bhanuseshukumar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9F4F660E47
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F4F660E47
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NkSIfj2D
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9F4F660E47
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Sep 2025 11:19:44 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-27eceb38eb1so70345735ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Sep 2025 04:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759231184; x=1759835984; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r12TEyuy46mulJME+ScvLbvGF8Ah7qN+ouFwMO9VQZw=;
        b=NkSIfj2DZgYky6NN3bCMr/FW2BM9Tmdm+oNscowEbjwzwGZrzctL86+zhGi5Q43HBe
         9sRPUwH52b1bJHY9giYEzg2JuzJaH4nvsEdQFINFftpFr3pYR0pMAv3ioqMStNEDxlPO
         Gl8iceW31wNCg1UYulI9gib6P/R4AF4zHx/QbPy9VZkuLqu7Hf7B83OcGiQXA8wr1oQd
         6Ez63pIwaOHsLkHssxNEQPneyg5n/vqss/YOTjiuVQy2clJuUXJhyebHnw4i2KuQeOXz
         zQGiuvH0Ze6xraSIn+FDfDyzAR4jmJDi7gejV8cmikLb604G1W9aeTF5prfmUYFMdw1I
         p+RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759231184; x=1759835984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r12TEyuy46mulJME+ScvLbvGF8Ah7qN+ouFwMO9VQZw=;
        b=vz5k5+j1gUauxsXVIKaO94ouhSfPtY0i211+n18DUag2n+5+eB7j4kSp0/uptn83uQ
         IyNNt+LiXruRE4PJCuknemowDKEx/iiGOy+gD4KkSMg9qm0o/8g5ujNC8MWFS1fNSE3J
         OSqoDgE4aeXGL00yh6rOjPqYCpy4/gtlsQ1lYDChug1chJ+D1ebuXljkqUTc7Bau/6YU
         XwhTI0Sn+W9Ms33tBq3hjrdZQB0rcZ9FnBEdm8f+0bVntKmvcG5UTli1YssgJZtPZMNH
         LCMWz7opKZ1EPEC/zzxvnaoepB3J63F0+5ezQJ5FsOKCWQZzcvvDfcDfFa4/62CigWvH
         CT7A==
X-Gm-Message-State: AOJu0YxrBaYIRhMDjtCN1K6PU3rg0GRWHUL02MHFlSlSMejZZ3USErwv
	oGFpE1ZVtifzsnPBZqCHEDoeEfR2nnLuuwIKigAUhkdG7VHNk4EsSKzt
X-Gm-Gg: ASbGnctfEIpCNXu+Oo6X5fBU5c42x+iVj+vTvbtPBK/CKraQJyGbE3RasQT8tywvgpf
	4cgpN2wWu+ExAlsv4gVpdlzrMI+uLlPg5iF6b88kXABbWd5Hywkm4bar2qcnbHIt//MwDpFcoo9
	qbX5X5mT210S1JskNKxYQBwWy4Es0O+L1YzUZYvYHh3hI2JIj3YBCKbw1DTPeLniPt+mxeNQVFC
	1rDaYtLKR1TnbfWBTQ/9cp+p7o/6OT+e/FEdJyL/AHeJszZs7fRL1il9implBheMC5hEq1Eqhtx
	FsPD320B4WqXcn4HsWSersAEAX8toBofeJc/FvedH0706WNp2t/kgjNUvEHs0MLgMbPbPN3lLvH
	UtJnwknAMg1W5wtRU+AolMgksrsIPs3LThho6isIkxWbQi5jIYjlJJ7RopqRw6SMF1yibYXvQWy
	M5
X-Google-Smtp-Source: AGHT+IFdH4GvUZJ4L5QLKiP68Vlp8QHFG3H4a7QWzbUzVsqoaNtEOXfKQtGSWyu6/pL0kqrTkn9icA==
X-Received: by 2002:a17:903:13c8:b0:283:c950:a76f with SMTP id d9443c01a7336-283c96f311cmr106118705ad.43.1759231183747;
        Tue, 30 Sep 2025 04:19:43 -0700 (PDT)
Received: from ti-am64x-sdk.. ([157.50.102.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66d37casm157846715ad.8.2025.09.30.04.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 04:19:43 -0700 (PDT)
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
To: epomozov@marvell.com,
	irusskikh@marvell.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	bhanuseshukumar@gmail.com
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com
Subject: [PATCH] net: atlantic: Use kmalloc_array to prevent overflow of dynamic size calculation
Date: Tue, 30 Sep 2025 16:49:33 +0530
Message-Id: <20250930111933.28730-1-bhanuseshukumar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use kmalloc_array to avoid potential overflow during dynamic size calculation
inside kmalloc.

Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
---
 Note: Patch is tested for compilation.
 drivers/net/ethernet/aquantia/atlantic/aq_ptp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/aquantia/atlantic/aq_ptp.c b/drivers/net/ethernet/aquantia/atlantic/aq_ptp.c
index 5acb3e16b567..f445d449f80f 100644
--- a/drivers/net/ethernet/aquantia/atlantic/aq_ptp.c
+++ b/drivers/net/ethernet/aquantia/atlantic/aq_ptp.c
@@ -182,7 +182,7 @@ static unsigned int aq_ptp_skb_buf_len(struct ptp_skb_ring *ring)
 
 static int aq_ptp_skb_ring_init(struct ptp_skb_ring *ring, unsigned int size)
 {
-	struct sk_buff **buff = kmalloc(sizeof(*buff) * size, GFP_KERNEL);
+	struct sk_buff **buff = kmalloc_array(sizeof(*buff), size, GFP_KERNEL);
 
 	if (!buff)
 		return -ENOMEM;
-- 
2.34.1

