Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A955C33A9E1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  8 Jun 2026 16:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780935420; cv=none; b=aioljPJKD4ybwZIr9LFTXxbZH186N7YZ7XU7qkAIBKBsokWX1OIQukdPLpK5KeFwMZT9BgQ52LygwVjYErNx+lpzy3D1RJpekhYvdF3FP4i7+Bjz7vyga8lDZixQspm5R5ERJe2M9UODPP2O74SaQAMAcPBz5RQt2Co0RO1p80E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780935420; c=relaxed/simple;
	bh=GjnxSIK5kHbXZkFSdIOjFKbkG3ybbVnTBJgyhPQS6oI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C3sGO5Hy8NACdgF41TrVm7mVacuAqmhdooE4ck7cHk8HqTmbK1NddVq58Znod9d8QM89fLAcB3Xx07AMHJ1yJLaLbNLBG4ym7zrvK6RQmLgQlHQ8MxGClYgfmbHUXeqF/CFvQBXjLfWbrMd+cVN7/k7qRrMoSHCexUxy1SdudSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VS2EvXGY; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VS2EvXGY"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63F70400A5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  8 Jun 2026 16:16:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.089
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0_Cl3OPkUBlx for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Jun 2026 16:16:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com; envelope-from=mahad.ibrahim.dev@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 85F6840094
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85F6840094
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VS2EvXGY
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 85F6840094
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  8 Jun 2026 16:16:58 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-45ef29c5561so2376964f8f.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 08 Jun 2026 09:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780935416; x=1781540216; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6YE0wLOGFZAKPEFKgBeEWhuYFLe1SIgPdFJQeGpKFdo=;
        b=VS2EvXGYyRFWdUxZEolaSs8XezkRsYL0rkLl5U03+KTDN48m2/bxvrDkHAR56ULOJm
         eOYLKkuJ59dZ+3y4i5M8aSc5pkRLUHTdtfaN5PwqXD0IZK45VUbPG38vV94ya9fEKd5l
         4s1ENOQCG/VtEmocuJ8lCgm127ufhQsaaq9RoXemTrkK4+9ULzyBgqgLNHuSlOoh4Vxm
         q1r7oA0VbMdTB0AJH+dWK5wmMB74Mdp5+CbvosLM/56REieLLDvcuGhyKY1aOX9iSvtV
         gj45JV9lvytv2M+WH5NSI5tOcXa2VUyMS0Pgu0yjeg9BGKXoLM4VfIJTW4yZmY0RXp5T
         clhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780935416; x=1781540216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6YE0wLOGFZAKPEFKgBeEWhuYFLe1SIgPdFJQeGpKFdo=;
        b=amLCEhFFNwjutJoLvkkVlU2UdlF02QobkDcb/7ilF4BhOJX2W22WXuBNP05tRypy4J
         Vf5ABpacJlN7KOG7wTJPoSNRfHuywnHGFsg9dL2lTJLWnTwPitqOL/dxCNZS3jr5bYNM
         fc7PZq8OdszwhkJ/ZHcnJUlqvGlUfcYnN37RbzLYOO4aTbIFp3XYzVYlCeBqIhn/lBfI
         rwxTXXNMJkceAyjXlFHlrwSC+yzjn6OG4QhzWbkzY6TvO0Cf2f2LijLvbLiKzTwu2lzy
         1BegkW4oggPiXwi/HELj40jmqIfURHktQEAHV+M8JcMFpoXw2q3voMoWfJpuO1goLOOp
         jDeg==
X-Forwarded-Encrypted: i=1; AFNElJ8R6oJMwi4GdU0nQ7mCh3aBlXH/uTD28zVcqfqXhXmKcGpKnbkcMmn/VYbV/HNR4WdiwNbM0GqzGgbwoqbEkaZzcivIlg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yye6RbRlzQsS97fFzsgXCMdu6JllUxwOvwUJYLfJtsuoJZUe903
	ywZbvz54TUku1rW/nvCnrogdaip3/YJZbp4Hv+cg/TlqGieRjYd6wpE+RyrZ4w==
X-Gm-Gg: Acq92OGtkceCTmO0cNZXoCg4X9mBhgOUTddtsdBRjWKhdoxmNFSaz3ATl5DE4Y5OMPH
	OMu+W1syimChRG2hpbWLA4hy8kbNZUjixbTl6E7jskQUAzL7fN/mCCbHC2JYjay8hPdoT9q1Z+H
	+Qeb+DuS5ks6N1JWCHAlouqwzIgiXPccy6Ep/fCeZiDOptodvB8KSJx6hriHnfdJC4oxyeckI4X
	HQz6IDJdZbu6XU3VZSyyJQ4sypk86daFePdvbKooboGOiGWbtENgh+Hz9NZPbkaz3ZQwDSJvVn3
	dE0VMyuWIDMX6nWu1/48OZTJBi8oTzRvOJNtjWG7etAy4DRWHqo0mfN4r1MzjbZk7/7b0rtdpIM
	j8BYmHuKF0pSPfVegesviwno4cizqvp18v7OsW/7P6eTtbBLWPpatnp6VFkCmNZZiCn0ANUzo07
	WgWiRC6bn/x3motUogO5R0u2b1mj1F8jCR1vRNtwYq6EFAt/EL9yhi98SOgQ==
X-Received: by 2002:a5d:660c:0:b0:460:1695:89be with SMTP id ffacd0b85a97d-460302f1a80mr19228316f8f.17.1780935415931;
        Mon, 08 Jun 2026 09:16:55 -0700 (PDT)
Received: from localhost.localdomain ([2400:adc1:447:6d00:1c1a:7818:23f6:aae1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f368e9fsm52426049f8f.37.2026.06.08.09.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 09:16:55 -0700 (PDT)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>
Cc: linux-afs@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Subject: [PATCH] afs: use %pe to print error pointers in security.c
Date: Mon,  8 Jun 2026 21:16:48 +0500
Message-ID: <20260608161648.14954-1-mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The error pointer returned by afs_request_key() and friends was printed via
%ld. This printed a raw negative errno, %pe prints the raw error
pointer directly so the symbolic error name is printed instead.

Replace %ld and PTR_ERR with %pe to improve readability of debug output.

Compile tested only.

Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
---
 fs/afs/security.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/afs/security.c b/fs/afs/security.c
index 6d00d62a65ed..ec39c49f01b9 100644
--- a/fs/afs/security.c
+++ b/fs/afs/security.c
@@ -57,7 +57,7 @@ struct key *afs_request_key(struct afs_cell *cell)
 			      cell->net->net, NULL);
 	if (IS_ERR(key)) {
 		if (PTR_ERR(key) != -ENOKEY) {
-			_leave(" = %ld", PTR_ERR(key));
+			_leave(" = %pe", key);
 			return key;
 		}
 
@@ -91,7 +91,7 @@ struct key *afs_request_key_rcu(struct afs_cell *cell)
 				  cell->net->net);
 	if (IS_ERR(key)) {
 		if (PTR_ERR(key) != -ENOKEY) {
-			_leave(" = %ld", PTR_ERR(key));
+			_leave(" = %pe", key);
 			return key;
 		}
 
@@ -451,7 +451,7 @@ int afs_permission(struct mnt_idmap *idmap, struct inode *inode,
 	} else {
 		key = afs_request_key(vnode->volume->cell);
 		if (IS_ERR(key)) {
-			_leave(" = %ld [key]", PTR_ERR(key));
+			_leave(" = %pe [key]", key);
 			return PTR_ERR(key);
 		}
 
-- 
2.47.3

