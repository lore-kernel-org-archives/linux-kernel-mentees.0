Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0122D7DDC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  1 Oct 2025 04:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759294323; cv=none; b=SGZ5HcCtWXq0kPZdY201XhQym4tgkjrTpE9x1Q7rAxSHXTHRYDSkVAXZPxi2Kj3fNPjnugdcnSmf7M4dC03aoZ3m8YYZEeQFBZsmgFx47+M93Mqo5GCt2nNb+nqFLgBbfyW5kxF9rxUMON7Mdf3zYJFEEd/fbJINpNM3TtnLYGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759294323; c=relaxed/simple;
	bh=Xi3sngh/ESvc/OjSXlVhjejbTfpEsJErTXCfIyPX8vE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=g81HyAeZ42GUO3qUP9gnBMISsZ5tLCAaZqAuY9dbcf9ZpgRorxfQgCg5Uhv/4Hv8vNwCpgIuv6R2Uu52E2NOi7bkkpFJx0VuoPzFfsKTob1CwwIpcoGiz93lwEjl2b2wpR2iK3jthgKn+08Oxw7mRon0F8UJbwzbiMFhoVvrMMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VvlMssKx; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VvlMssKx"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6062E40F38
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  1 Oct 2025 04:52:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vlo30F9EpxxU for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Oct 2025 04:52:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=bhanuseshukumar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4AF3B40F32
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4AF3B40F32
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VvlMssKx
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4AF3B40F32
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  1 Oct 2025 04:52:00 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-78118e163e5so574438b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Sep 2025 21:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759294319; x=1759899119; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3YxxylV2QdTKzsnwpKABHPsiuZJtTvT85irex76OJUc=;
        b=VvlMssKxqw3uc25FvxedKVjzYz5vDdXVOdbkVn8Er/B7JG8H5eqAx/pi+1OYC/qjWX
         4YMnXev/tdPkEK+LGQTiT+mA+8/ouqrNTTQ5wyqHj0cZEJHSV1oE8FiJFkonfjgCFWfv
         6o59OurF0Ok12eZnRBsbKKIWlo2IYBUcMJ5u5cfcrqsVvjjyXGt6O1Rqy6ZTPVBc7gjF
         4PuOffWaww/rDTeEmWpSuKFZXprVBJb5HQDvBA5p6eqxSQwRlH4oeekz/02BLIUEw5qv
         pfmgZZaBvrO24OU+9+iUKo3hYBf6gF220oemHvFrNUHIQkIisIIDCFVStK0pTC1T86Fq
         yHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759294319; x=1759899119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3YxxylV2QdTKzsnwpKABHPsiuZJtTvT85irex76OJUc=;
        b=APydviPoeBd90aByXbCXj4CgjFKWfQ+ClDHOcaMf7kJITOHBlt8TDREpKKMta+/5c0
         HsTNla+/ubpUW8nOy0a/hb3S3SVeg1tV8zdKHDfOnzIegDjJF0yPNVg7biU7HCDBBgqE
         u6L/Zl5El15Xr1M30RqpxKnNcpyVuQT7hHslXKpnjGpKhWLz4Tb7nZNufUelUHM4J/Qt
         Q3gBQBNOszMghH2PB1ZcHNhOoZDkSq8y/iTwML5EXk9DPzATDENuv/mPaQkIpkdv3mRq
         egyesioD77nvfUQCEYRZWqCWgNSiHzT3M2iSAIfuTCC49pNTPlGAEM1KLitCsmrQGT0V
         Xx+Q==
X-Gm-Message-State: AOJu0Yx60VXDiLvCDoQOjBguK/HhL47CfH/dqTUMmtrbwgc6urWy1Umu
	HRJIP2E0nOrEEcPeSTinGQfomFXza8NQB3KhmR50qMd3KtGv8+ce1euH
X-Gm-Gg: ASbGncsLuD2d5xedjzfLIkgIVujC6kDkjufjxOUpLu+MwMxeWjE6StCSirXPNz9ZFQR
	kuHBKX+ilNS/c+nlx0KnC9BVLDqh7gbxg0nqHOzP6K7qDmWLsHjRqkTw24/oQoqgyibBQOYCSit
	22/Q962DBJCL5p8H1NIEVBMoks4REcSx0AMNRT4CVCUzKEvUDLNKDgZqMPZWuH6wcR4n5yC/iL8
	BPRjvDmEfelrQ669wRRDXgGgr8vHD+DoGcNPNxK2giNEn7tY76cV4yOESW4y9YQjIsSTrQHBgSV
	f431pgoDeMzYUUijr/dWqgfyH6YRxuhPxJtT0ZL6GfYKT1Su/3FuSLwqvc8WDO3Tf0Fq3ZvF0w/
	5/OKjI/siLdggCG7yzb44FymQ597EX6QLwUGLnnKlqn8Q1yNiI3nrepIWwBJ8DigrIAtRppMhbA
	==
X-Google-Smtp-Source: AGHT+IEXQ3Op/9SH+Fhecn/Owy5mVU4g1feXLP5wCv6r+OnKqJrWMPLneISTKEa7/cfBfujnpvtAwg==
X-Received: by 2002:a05:6a21:3510:b0:2ce:67b2:3c41 with SMTP id adf61e73a8af0-3218b74ba56mr3301300637.5.1759294319458;
        Tue, 30 Sep 2025 21:51:59 -0700 (PDT)
Received: from ti-am64x-sdk.. ([157.50.97.83])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102b23092sm15347225b3a.60.2025.09.30.21.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 21:51:59 -0700 (PDT)
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
To: Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	NeilBrown <neil@brown.name>,
	Jeff Layton <jlayton@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Kaixiong Yu <yukaixiong@huawei.com>,
	Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>,
	Omar Sandoval <osandov@fb.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fs: dcache: Fixed typo in doc comments
Date: Wed,  1 Oct 2025 10:21:45 +0530
Message-Id: <20251001045145.38769-1-bhanuseshukumar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

resonsibility => responsibility

Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
---
 Note: No functionality change is intended.
 include/linux/dcache.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/dcache.h b/include/linux/dcache.h
index cc3e1c1a3454..17640d7a45aa 100644
--- a/include/linux/dcache.h
+++ b/include/linux/dcache.h
@@ -312,7 +312,7 @@ extern char *dentry_path(const struct dentry *, char *, int);
  *
  * Given a live dentry, increment the reference count and return the dentry.
  * Caller must hold @dentry->d_lock.  Making sure that dentry is alive is
- * caller's resonsibility.  There are many conditions sufficient to guarantee
+ * caller's responsibility.  There are many conditions sufficient to guarantee
  * that; e.g. anything with non-negative refcount is alive, so's anything
  * hashed, anything positive, anyone's parent, etc.
  */
-- 
2.34.1

