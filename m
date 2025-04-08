Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABFF241CB5
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  8 Apr 2025 19:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744141327; cv=none; b=i+XrIWxv35F6sW3cu1gXoJ4T8gUn+yPw+OWA3cMN/wxBtHh52QFYx6VQABQs1bJ0CcgkxG6+tBiYB5MiAU6ycjMeFDsszEtnYl974ThlbaFSmEtGEvY1icyWdBWpMRrQOD311Ked2JZktKOLvc7xKn8e8XH7cIVlb/9J+X2DJYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744141327; c=relaxed/simple;
	bh=ML5jTR/jlM3ju4JbP3B3GFhZX+5zbRJpfOEkQaeoad4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F6Ww82NLNCRlE6iCNufl7unfkn0xJ8m5EbXnent2MITFuZs9OHZnpBVnP6ZGHowP3CE4P21BqIe41mlD9iMQmNA0ymXBV1MVZDvys3x3gGNIYDgrp1wPP3n0HOY2D00IxfaFcEr8P05aYTaRkyqC0lXW52ZjfrUb5vOT4QA6lyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JuuuIdFF; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JuuuIdFF"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-225df540edcso349495ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 08 Apr 2025 12:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744141325; x=1744746125; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CoerfLnXPhCno+Wn+g+z/uR+iR+JqTaweh5qhXG3rP0=;
        b=JuuuIdFFzclQZtHb5Pq4YWDqUl9NCgvJr0saVKediE+dCc/UAT5kV2CPax44+TNAms
         Prqb21YvmV86rPu/YtdC0e6TGErdr3SAPWx1nwIx86vWzsmqjxbMqXjSL76D2eP06LAB
         nZGa7YsTYix23IxGwkimZ0GmXvQWaqg+Dx0vxxozmmpXhDlP2I/vnh5C2W3AvqbvB3GW
         os0sOw8eVohNhDR0eP6KlZizokucEynq2Iyv9Jdz53JWVoZzHgutox5FnqfZTBNw31I/
         OhJRhfiegFW9fpsfHTi6okCmOeSLDlPqLzGeIusEgMDqf4gEWJe3bu05k7ldkKlCOKVO
         oBhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744141325; x=1744746125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CoerfLnXPhCno+Wn+g+z/uR+iR+JqTaweh5qhXG3rP0=;
        b=cwkhMMTRYyiq8kyeUhIXAoTZFpyYwSnn6p4dobfYOZd1PRv0jfYldN0I158K7UUWjo
         +6SNec3dtLipcvnXLVrbKEIiv8n69JG5fdmWW5qhdKCKVRFFsUZ/jquE2e3YuqXVSe0I
         VinqOW0APxpNVTVwoWGvhSfvHRA4xURuSuyi01K3kuwYxuaQEYp+9Gwm6ldR+ApAeJtJ
         XFRU1bfSuPKGRP/e1yQ/6kjHxIuVd8oLiKG+mPYErDZQ4jDQRj6KR9LJi7V1AWsA5GUE
         I7HVLB3CEHW9iX9hd7sKvZZRjwyOMsSa8Q8ZF1zVJ7FsUAcvnksCSNsYC7avFVpV4ZYO
         45XQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9luJxErburmzXlHCTGSOZEn4bMkjidLH/0NIyklqP+7+L5tsY8BeHvaG+TM7J5abquhnUx10nQOtk0WZir0a65o3NmA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxncMTNrWT9gaZ6i6Xxok0Jm1bDDaEeWZUqWph2H9hlUMDuAUPZ
	82Oob+DlniWrAmo/qgiqJyUpEKukNn5EJEAHpp06tRQzbWFk9aiW
X-Gm-Gg: ASbGncsI3rXJjwVVG/PiCFE6DhOj2vA2mXJilXB0vAyffp6/GzlgHZWN5ThMzVaUgW1
	XxVwwNBguzkIfsjAWMOzifoTFHUYziNRd6f2GXkSncoz7Q7YVBHWMHpB+vRDRt8PpNtKIAGnl4a
	bJ1dpiRF4/4F/bel9o6m1Mqa8D8noxy3jMetAAJdTDLrzk4apCiV+sJHbwQgyGX7jpTnEPnURsd
	ZkTr3z/ojfe19o0iQ6ApkY+UaMbe1Uv7E5YUq2FFMrn1DWvkE6lqUquOJH4BTRP4xq1cHoO2jIY
	uglDqGm22Q254jAcEyCxOXDJjyYDjPJm9ZZxAAiBMLsa1goQXRM7B/XtoJ674YQdnzE=
X-Google-Smtp-Source: AGHT+IGD4qjnb5n6rpbIvJUo7pSYRQIkDOxI0kExKtXGHcmuxeefdh6D5u4OcO5X1n4R15pQkmZSCg==
X-Received: by 2002:a17:902:e809:b0:21f:98fc:8414 with SMTP id d9443c01a7336-22ab5ebee9amr54755945ad.26.1744141324758;
        Tue, 08 Apr 2025 12:42:04 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:5c08:585d:6eb6:f5fb:b572:c7c7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297865e093sm104796895ad.132.2025.04.08.12.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 12:42:04 -0700 (PDT)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: davem@davemloft.net,
	dsahern@kernel.org,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	skhan@linuxfoundation.org,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	rds-devel@oss.oracle.com,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Cc: Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH] net: rds: replace strncpy with memcpy
Date: Wed,  9 Apr 2025 01:11:53 +0530
Message-ID: <20250408194153.6570-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace deprecated strncpy() function with memcpy()
as the destination buffer is length bounded 
and not required to be NUL-terminated 

Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
---
 net/rds/connection.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/net/rds/connection.c b/net/rds/connection.c
index c749c5525b40..3718c3edb32e 100644
--- a/net/rds/connection.c
+++ b/net/rds/connection.c
@@ -749,8 +749,7 @@ static int rds_conn_info_visitor(struct rds_conn_path *cp, void *buffer)
 	cinfo->laddr = conn->c_laddr.s6_addr32[3];
 	cinfo->faddr = conn->c_faddr.s6_addr32[3];
 	cinfo->tos = conn->c_tos;
-	strncpy(cinfo->transport, conn->c_trans->t_name,
-		sizeof(cinfo->transport));
+	memcpy(cinfo->transport, conn->c_trans->t_name, min(sizeof(cinfo->transport), strnlen(conn->c_trans->t_name, sizeof(cinfo->transport))));
 	cinfo->flags = 0;
 
 	rds_conn_info_set(cinfo->flags, test_bit(RDS_IN_XMIT, &cp->cp_flags),
@@ -775,8 +774,7 @@ static int rds6_conn_info_visitor(struct rds_conn_path *cp, void *buffer)
 	cinfo6->next_rx_seq = cp->cp_next_rx_seq;
 	cinfo6->laddr = conn->c_laddr;
 	cinfo6->faddr = conn->c_faddr;
-	strncpy(cinfo6->transport, conn->c_trans->t_name,
-		sizeof(cinfo6->transport));
+	memcpy(cinfo6->transport, conn->c_trans->t_name, min(sizeof(cinfo6->transport), strnlen(conn->c_trans->t_name, sizeof(cinfo6->transport))));
 	cinfo6->flags = 0;
 
 	rds_conn_info_set(cinfo6->flags, test_bit(RDS_IN_XMIT, &cp->cp_flags),
-- 
2.49.0

