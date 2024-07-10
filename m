Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6B4A59
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 10 Jul 2024 00:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720570386; cv=none; b=aw5QLPiJ3hqyMRGTI/TZuW0CtxnWQ7N6gdbrH7GuDpuEJknULNdLP7q6dYYNXHraI9JFNAR1haTQN7NdtikdaWkNpUxPQzo9AJcCSQuVDq8JzS65KNrlSoV73cjpZ2ieSrZbDMmvQQw+1PQM07hQPW+g2iO5WYCukKZG/Qp60oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720570386; c=relaxed/simple;
	bh=Lxs17QnPWqide1kuu3+MFXHOtxROAxydfMblGjRRX3A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dt1+V4rdD5bRM38q28rDBF+P6vzfFkbktwpbrlsaLZ1PJNDGWzyvybc4dIZf1g/wUumqGdY2pRJvF8YR8ZvX9mNDx2uno4yZnRq1idq+veVM78J9a6tcDDC+O9QSIWFv5gIb5Wz5DXEIh21tTYNvINX/m/IwmMHNavLxChLq7Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b=WgJOV5ks; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b="WgJOV5ks"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DFDE81E90
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 10 Jul 2024 00:13:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vdg-IjXKrxvZ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 Jul 2024 00:13:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=rbrasga@uci.edu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3D93581E60
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=uci.edu
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D93581E60
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=uci.edu header.i=@uci.edu header.a=rsa-sha256 header.s=google header.b=WgJOV5ks
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3D93581E60
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 10 Jul 2024 00:13:03 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1faad2f1967so1947095ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 09 Jul 2024 17:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1720570383; x=1721175183; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tSpW7AqjpwQU1YZlBwSC0jTPvLt58lOmnA2ZeLiWhSk=;
        b=WgJOV5ks0e8G5Dt4MsiZ/9lMfbyc3FvuuWdAhNqoRPrbrPEEp1FA6HgOTc5QILYwNg
         nERwzlrsr6SD/g1CX+Z3XJL03NQlsBSw7dT2LIPHf1WXkCbe4o4rOfIRdbWgCsLc+VwO
         CQXrwYNpe70/YX4pZODKOH5aNcB9QiZ2GtkQGyTxjwS7m6YKMcM8cwoOmd3BQjB2UQSc
         XxNIXrDe2u448ojdnBaBefRH4W9AkbDJuavcDfzVU73tKLxkb9qvL3pbwF5h/SB/ASPq
         Ha+94iYOo1f4rcbAppc1mIj2GeeFzulTyOmGIJhJOhn4Ij3b0Z5BokhOOizGSvzWvJva
         gJjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720570383; x=1721175183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tSpW7AqjpwQU1YZlBwSC0jTPvLt58lOmnA2ZeLiWhSk=;
        b=Bu9UbVnkwD96uwl1cxlCPSAEvHH7YLX5v4Dh7YI0yUZDN1zLPABhKeSFXhKceYmVsC
         GNkrdC50Iy5d4ruWQU2IqxW8p8jQ8dSg7H/dqQhuAViFP6PWAKaf9MB9t9OxPkq6Dj0v
         ruLy445FhCIqEMXDr9ISNo+yAahzOR/59Oiox+sBm2ZuTCAa/KLFazOAcE4Q9n1KV8yz
         XRZdvFA9yIo9f+XyIrzw2OZTEp+A/KhkUM6OQf5+NOZoXvxL8cPVIoHdUXxBDA7EaQSE
         1+bVrtsA6oTutrGqH/Lt/U82UBB4nleKEc/bI1uQAYlZNT6Oj7ZL1mkgXX8t+4PilmNw
         Ec3g==
X-Forwarded-Encrypted: i=1; AJvYcCXP45CKppLav9qfZ7z3tF5Aoj4xq074Ludj2kk/gqLzmWK1/6FoSTQPxM80WkVMySo0LAN1go1LBNJM7xMCHsDlvPSEldqGVoozoDjLH1pNbhwn3SlTH83gsx75biGj
X-Gm-Message-State: AOJu0YwmbN6aL3WHC+n2mJsMIyYIuvtHB+wXemEKg0LRkVBxwOkodT+4
	9MT4o3O/EjHQzMKqDHqwR7yA0bb4v0LFMaIGcOLIU8CBtvqUl0WZBhiq/hJ3xdw=
X-Google-Smtp-Source: AGHT+IFZ+U0vwKEkq0hOtvZ5jJDsUtmCIT4kTMkBa1V9TXiL/6L8Y3rUPlhGyo845hlJfZURvkiEMA==
X-Received: by 2002:a17:902:f7d1:b0:1f8:62a1:b6af with SMTP id d9443c01a7336-1fbb8019531mr41100765ad.21.1720570383350;
        Tue, 09 Jul 2024 17:13:03 -0700 (PDT)
Received: from alpha.mshome.net (ip68-4-168-191.oc.oc.cox.net. [68.4.168.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6a34f9esm21740765ad.114.2024.07.09.17.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 17:13:02 -0700 (PDT)
From: Remington Brasga <rbrasga@uci.edu>
To: Dave Kleikamp <shaggy@kernel.org>,
	Manas Ghandat <ghandatmanas@gmail.com>,
	Juntong Deng <juntong.deng@outlook.com>,
	Andrew Kanner <andrew.kanner@gmail.com>,
	Osama Muhammad <osmtendev@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: jfs-discussion@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	syzbot+e38d703eeb410b17b473@syzkaller.appspotmail.com,
	Remington Brasga <rbrasga@uci.edu>
Subject: [PATCH] jfs: UBSAN: shift-out-of-bounds in dbFindBits
Date: Wed, 10 Jul 2024 00:12:44 +0000
Message-Id: <20240710001244.2707-1-rbrasga@uci.edu>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix issue with UBSAN throwing shift-out-of-bounds warning.

Reported-by: syzbot+e38d703eeb410b17b473@syzkaller.appspotmail.com
Signed-off-by: Remington Brasga <rbrasga@uci.edu>
---
When nb = 32, `mask = mask >> nb` or shorthand `mask >>= nb` throws
shift-out-of-bounds warning.
`mask = (mask >> nb)` removes that warning. 

Link to the syzbot bug report: https://lore.kernel.org/all/0000000000006fc563061cbc7f9c@google.com/T/

 fs/jfs/jfs_dmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jfs/jfs_dmap.c b/fs/jfs/jfs_dmap.c
index cb3cda1390ad..636aae946e84 100644
--- a/fs/jfs/jfs_dmap.c
+++ b/fs/jfs/jfs_dmap.c
@@ -3020,7 +3020,7 @@ static int dbFindBits(u32 word, int l2nb)
 
 	/* scan the word for nb free bits at nb alignments.
 	 */
-	for (bitno = 0; mask != 0; bitno += nb, mask >>= nb) {
+	for (bitno = 0; mask != 0; bitno += nb, mask = (mask >> nb)) {
 		if ((mask & word) == mask)
 			break;
 	}
-- 
2.34.1

