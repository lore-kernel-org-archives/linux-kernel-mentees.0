Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16822F99A3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Oct 2025 11:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761564895; cv=none; b=LRfqyqAe3O1Lu21LT0zwJnFsXPvFPQ27DksKOBiqSHCdWEbwh3K5dLsNhuxzgOQav59euXG75spx2rpMYmuHUBK7MFBz+U990BOdcsEqbYHc2FcXk5NpmJ1JOb0jMqH8rgvgNlQyEKSDTP8uuz6S6EE5Eo/fVAO+ZvkmUNhrYvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761564895; c=relaxed/simple;
	bh=5TBB1dS0xdm96UtguSy0r3N+8c94aYIZTQ5p5Qhj/p8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jz21lhNrjys5bKoJRQz4ED72hwOyxmIRn2zVMz/qXBZdXgqSO1s8dMBr8xoB8qBpXS7qDGAeKWoIbcJEMrzISgHpv4LWoxmXJH2AnaYPSUMqwwAbSCw8588mwsRFwLxpMRY2Xkv0FHCo2stMLM2iAx+pmDuznsxKNKheNHuac6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FITXp5UQ; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FITXp5UQ"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39F3783F00
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Oct 2025 11:34:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.236
X-Spam-Level: *
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yGRLgWzUQewV for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Oct 2025 11:34:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com; envelope-from=ankitkhushwaha.linux@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9EC9083EFD
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EC9083EFD
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FITXp5UQ
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9EC9083EFD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Oct 2025 11:34:53 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-27d4d6b7ab5so67071465ad.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Oct 2025 04:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761564893; x=1762169693; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+bbEtFgvtdD4nIW4Ki4K8L2rFFyWkm5SaPEHBXu2tU4=;
        b=FITXp5UQ90eR37KbM25oQlDgu7F5XKymPn1PHdUny2RwJR4sMWI0uO6rEenjnvnBwN
         WAvNhPLNTD4SQybALYNAM3sC0bw825no5ptbTaiqSWHm58QDAHh86UHu2I3lsGZOeOrp
         u1TInMpvCLUsdsGSKTeGAxcM7g/RtvywH/wc4jOxq/zEKpHFzvcSdHaECBxzLdx22BSx
         5IJxXFhBa5eD0q9E8KkikcgCUYjuutU4lOHAwz8WCA4ppUdUnKc0wKoPq4di5j+wA2p9
         PHgrpzxyHpTDoQhTS8J9ExCz1IujZvFQ7INXJgvPh2IstH7y3X5LYORD4UqY9w+PV4N5
         r1Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761564893; x=1762169693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+bbEtFgvtdD4nIW4Ki4K8L2rFFyWkm5SaPEHBXu2tU4=;
        b=r53+Y62+yWJuB0x2T9mGS5gv+tR7jct8evyo3/9q2FIOUHuhhyWUI/lseEia7+AIYI
         X0CvkT8f5c8k0KRxFeuXc70qzRzH6L6KTh8kSCMqDtJLbA9pC+S3RXq7Xbyqvsr/Cq+o
         V9drYhSBwCN3/Z7Zqnn8r4E5us9fxVa0QSxQyyuntcv/loHrUtdV+H+tc53a78sPa3Ns
         QkPfJ4BSKAVv6b2YTvBFPYDkwwEbYissNdlB5oj+nLq/y1tlBCF745t93ZTGVcU9SWSi
         eNPaR4r41l/m71t577OSrOoyL4iyFpyg8EPQbhpWHMSfiaA2kCmmQL7bzwahCJ1qitp9
         Jxyw==
X-Forwarded-Encrypted: i=1; AJvYcCVn0jjEfrJRjh2xlsR20OGpm3y1oRmAPJtA8JOOJeAidSOmbMHXCSY4qID1t+WowTe8o+wCm6fkRweWCpjvv+rR5GxtvQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yy4nG4s8XFQJHGquC+r103Y1domfupk80pQc82ceCTaB2fAaoFd
	Vjz0gosO/FHOAUWq6YYcQThSAMMEH2aGwA2Zl3gwtUDktUTxexqc7DeT
X-Gm-Gg: ASbGncuLVZQ6LrHIu8Gy6BvMpf/OrET6fp/+9aSjqvktyUYBI4Jm/TNMKp7JB2iJgGx
	Ok+3hMqH4RvBBOj4+juvxx1pmB6S8fZGTuuDLaYVt4RVZgINPIGwW1q+P8WZMJAzs6Zsa+0iQBr
	DbElcu7TiQz8IGluNcNujtPktcgBXS2kth1KPljgCALLqSJSiNUB9aiGlVjQrf9NTsDO3NQBPnX
	CLfWGCDZfx48+fEna5jC0+aY1kDyW9QxqpmVzwr372r+NOJE7ft+PSenNupgPLHuJrBSbfcHcYK
	jNIjNBoMdCpGJWTi1wC3mcGTUfz9xX/PKC09tJoeatSQk71O7VubMsRq/VV9PtR7zoCoqQqQlgJ
	TjiAGUqd35IQXBe32f9JmZ1NHc2tn1KniwqdCJ3kGolKKBKN7x0CWpH4nUK0t3I7QETAmedMmxg
	wKi6Lt3XIcAE7etvNBkozjuPBYtVdc55nrUxiJ+d/2
X-Google-Smtp-Source: AGHT+IEXotOiXJpTCp/puthxXvnmCrnF43T4sh9Ukdwx3XQqsIiiaQDtaOtYzH9OodVVaE5Vc6YsYQ==
X-Received: by 2002:a17:902:ec90:b0:293:a10:12ee with SMTP id d9443c01a7336-2930a1018a5mr217124005ad.15.1761564892811;
        Mon, 27 Oct 2025 04:34:52 -0700 (PDT)
Received: from fedora ([103.120.31.122])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf33f9sm78216485ad.22.2025.10.27.04.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 04:34:52 -0700 (PDT)
From: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
To: linux-kselftest@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>
Cc: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Wei Yang <richard.weiyang@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
Subject: [PATCH] selftests/user_events: Avoid taking address of packed member in perf_test
Date: Mon, 27 Oct 2025 17:04:39 +0530
Message-ID: <20251027113439.36059-1-ankitkhushwaha.linux@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Accessing 'reg.write_index' directly triggers a -Waddress-of-packed-member
warning due to potential unaligned pointer access:

perf_test.c:239:38: warning: taking address of packed member 'write_index'
of class or structure 'user_reg' may result in an unaligned pointer value 
[-Waddress-of-packed-member]
  239 |         ASSERT_NE(-1, write(self->data_fd, &reg.write_index,
      |                                             ^~~~~~~~~~~~~~~ 

Use memcpy() instead to safely copy the value and avoid unaligned pointer
access across architectures.

Signed-off-by: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
---
 tools/testing/selftests/user_events/perf_test.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/user_events/perf_test.c b/tools/testing/selftests/user_events/perf_test.c
index 201459d8094d..e4385f4aa231 100644
--- a/tools/testing/selftests/user_events/perf_test.c
+++ b/tools/testing/selftests/user_events/perf_test.c
@@ -201,6 +201,7 @@ TEST_F(user, perf_empty_events) {
 	struct perf_event_mmap_page *perf_page;
 	int page_size = sysconf(_SC_PAGESIZE);
 	int id, fd;
+	__u32 write_index;
 	__u32 *val;
 
 	reg.size = sizeof(reg);
@@ -236,7 +237,8 @@ TEST_F(user, perf_empty_events) {
 	ASSERT_EQ(1 << reg.enable_bit, self->check);
 
 	/* Ensure write shows up at correct offset */
-	ASSERT_NE(-1, write(self->data_fd, &reg.write_index,
+	memcpy(&write_index, &reg.write_index, sizeof(reg.write_index));
+	ASSERT_NE(-1, write(self->data_fd, &write_index,
 	                    sizeof(reg.write_index)));
 	val = (void *)(((char *)perf_page) + perf_page->data_offset);
 	ASSERT_EQ(PERF_RECORD_SAMPLE, *val);
-- 
2.51.0

