Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9939129A9C3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  6 Aug 2025 18:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754505054; cv=none; b=E5SMiieYlJFK1xF313VQdbeXMJihFUeeHF3MxPSKHBIlhYW7JKRGnJNJExOi9ZMjLUSIfx1RvIk6mCgvMwhyWiVEBMTOzgfkFhW047WQxtxWApYx+7tK7z3z3UTc3QmRjEvBY71Mckxr0aKLza2XwASgNgPBjg1YTpXr0pBgIf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754505054; c=relaxed/simple;
	bh=T+1HlKw0s9c1tad81m//HxBviAT8h8of98i+3now1w4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SC4HpU6Idaa+P9w3RKLCsx+zk8TuIM8qfk+75HkaGKz8j7zQnT45EM19kLstoO52eWsNhnD6cW5At+5Oh7H/Q/buHbV2Yx1tlsAvShbGppwnW7iLFaghOcByr00szlPJOvXEFvidfSUWMF1dnh6XL8NnMWnVBy4XWxZH+FPz0s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RKWYVW/o; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RKWYVW/o"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27F5F41A22
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  6 Aug 2025 18:30:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3oL06qIXwRBT for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 Aug 2025 18:30:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=devaanshk840@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9EE7C4198A
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EE7C4198A
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RKWYVW/o
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 9EE7C4198A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  6 Aug 2025 18:30:52 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-24003ed822cso904825ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 06 Aug 2025 11:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754505052; x=1755109852; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CvgCpYV82+QLhrXKYTkJl5n29y4RTR43i8tWOdTaOvM=;
        b=RKWYVW/oDE/RZ1KfSvAqxX9W682oaw+0r9sdsLzTSiO9C77mRA1o+gGD/VRwuEYPBG
         5kwMpcrSEWwtJ9aqtH+gfVVJTHcPjHHpodNm3Q4CaAiM8KJFBEzyQwj6vNGvNATvyzGD
         sQNY07K2ktX86JIVYv3QYmFHoeHZhhDJaOjdleaHxic/f9f1tHWY2GRJ8Ovs2VpzOj/7
         wGV67I8jRZ989ZmnnNhiBSvyScXfsdqPZyIatwDf/S626Ju3JpqvlunFDbgYWAFJNbdn
         0NJHSkmqr/NqW1SBu0x7EyBQw4hCHE7JdM/2AwDkboopXEt3c34YBe+UU4HvU8q2CiyT
         LdvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754505052; x=1755109852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CvgCpYV82+QLhrXKYTkJl5n29y4RTR43i8tWOdTaOvM=;
        b=sZXL/RiOF3zknG+/4z4kBbWE9IxWp4KmMrkPf09jia33wH5hSV8U7urJe22JdrehEO
         1eZ2TRwuhevr7GLGbNiZGfYSBB0cUOKyL0GQxeM3HEp6S+J0W3dxUXB5c9+mRG8Qa6nW
         PhtT+zEHbghvpJCUJPjEIfraAr2i+OAYoq8nf9tCk7LBe/hoip5PuN/6HkcX3RfZLHKd
         fEVMMHTnYoymH6ciNHv+isw1H0e99S9wyQgtTWwQOI9fdfbqOsxynzIPfKuxpfvE4T6c
         6yl/fUwqeDjggkhANQE5UtqFtmrL7nWgrRVJNhe23RotTiHb8o7/oSX73OxtZ/lkO9ci
         89ww==
X-Forwarded-Encrypted: i=1; AJvYcCUkfpriHipQwmCN5psMoGMuOdC7sKkmDql4bn/jjConpgX5sMOzF1CXfr2Il8MuNFneu7W98jPaTegEUdYfkj/HQ+vyjw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxpGvZz1iz5fBKYSAV4NxpzWqSBvGA40xo4dIkD7pze+zJOsG9r
	GHPnTFagtoFinsaxAUp2CJQswPWOPJHvLm3OpFHuih+lqqF2ptBojI8r
X-Gm-Gg: ASbGnct2+VU0AZ9XfNFIh8Oevh7/wCYPMVGREca+K7Y3f965MYfQtmDAbErRnqOCMzM
	bWufl4wAMNkdZ6EnaKXXxP2x7Xb6s6w3WZG56hoddNCUmup/pg46FlKU7Qp28voUVNShbu4FtdP
	onAwIOwXWO+8F9Ftw4YGM3ZttilTkzMBPstAWorLRqLqcqHcMPPC8eK1pQSAA+tM1ij1BiLrGqk
	X83y7z/+BvJH0Ng9Ffz3L4920kFy6JbrCnQhluSBIjwELiykSkDZYPGn9LpxgQqtBMWJRy5TiMu
	v+lj+AMtLaRZ4bGL/EjMXLSfkUbNrWsFT/++bIDKz+p6NkIZzx62f4t2yvlyzUL9GfUCNKvb/LZ
	8qIT8I/n/0rdZVeJSAXos
X-Google-Smtp-Source: AGHT+IFoqMA+F/6iLOHC7KIXqVX88uaOv4pNyTT/6IjxRjJViB4zQn8WY68ChegYQ0ATdleDWMzGLQ==
X-Received: by 2002:a17:903:986:b0:240:3e7a:9060 with SMTP id d9443c01a7336-2429f51c6b8mr55588235ad.37.1754505051670;
        Wed, 06 Aug 2025 11:30:51 -0700 (PDT)
Received: from fedora.. ([27.63.252.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8aabdedsm165918815ad.167.2025.08.06.11.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 11:30:51 -0700 (PDT)
From: Devaansh Kumar <devaanshk840@gmail.com>
To: tglx@linutronix.de,
	mingo@redhat.com,
	peterz@infradead.org,
	dvhart@infradead.org,
	skhan@linuxfoundation.org,
	shuah@kernel.org
Cc: Devaansh Kumar <devaanshk840@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] futex: selftests: Add description for futex_wake_op()
Date: Thu,  7 Aug 2025 00:00:26 +0530
Message-ID: <20250806183030.542453-1-devaanshk840@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Devaansh Kumar <devaanshk840@gmail.com>
---
 tools/testing/selftests/futex/include/futextest.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/futex/include/futextest.h b/tools/testing/selftests/futex/include/futextest.h
index ddbcfc9b7..c77352b97 100644
--- a/tools/testing/selftests/futex/include/futextest.h
+++ b/tools/testing/selftests/futex/include/futextest.h
@@ -134,7 +134,9 @@ futex_unlock_pi(futex_t *uaddr, int opflags)
 }
 
 /**
- * futex_wake_op() - FIXME: COME UP WITH A GOOD ONE LINE DESCRIPTION
+ * futex_wake_op() - atomically modify uaddr2
+ * @nr_wake:	wake up to this many tasks on uaddr
+ * @nr_wake2:	wake up to this many tasks on uaddr2
  */
 static inline int
 futex_wake_op(futex_t *uaddr, futex_t *uaddr2, int nr_wake, int nr_wake2,
-- 
2.49.0

