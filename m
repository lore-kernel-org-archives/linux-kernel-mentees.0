Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30B330DD07
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  6 Nov 2025 09:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762422951; cv=none; b=EMftIm9slafHA8Zn1NVHvYaFcLGLW0v/fhxKR8MfGJ8vbA301I4gr/nVkd/eFw9PCG+PEgLMusB/zNxmtooEHW8t9333N0WMpB+MiQT7jrnvnEP/RJugrv9ViJlMvyOrMX9aIv1OQNIICve49RnDScin66Al0HiE5JGE82YnXDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762422951; c=relaxed/simple;
	bh=lGb+rCNSnJ/Re9I074l78vjpp6/yu6/7U6mL2e+8rjE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NIJNddSxkTkCdymx9HvdLWpMrth5oukf3z/RhFM2ezSU9f7xnBeWo506jAE/YylRFN2BozPD/dv9uPdsCOR4XIjkzR6UR5dPWbyoz/ztbV5TW9XuO+cyVk9rSPTO7slLovKttj2hQFLDQIuB0LU9pJk613hhrHLVA6y3+Hpz5Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OhZ6Gv+M; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OhZ6Gv+M"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 413C3840F7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  6 Nov 2025 09:55:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ja2yzbDgQRHl for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Nov 2025 09:55:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com; envelope-from=ankitkhushwaha.linux@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 56CA3840F3
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56CA3840F3
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OhZ6Gv+M
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 56CA3840F3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  6 Nov 2025 09:55:48 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id d9443c01a7336-290aaff555eso7881825ad.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 06 Nov 2025 01:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762422948; x=1763027748; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sx3MpVj7PiHTaRtB2+AQXnkYRvNzs0/kE3anQ6IOaeM=;
        b=OhZ6Gv+MeARsL6ohQO3OPsZqL71w69K329SaFFtWLZgAeNC21XyaUHRdeVzy6emnbS
         2dHjAYtFlpGWDt8EdqH/wzg+Sr27PSQsgUrcO148EAoNct1drMQli9pMn6/fmiwu7hfl
         gIOcUDMF1APFRDq5RYVqE8OXdVhDIqF2BCB/Mc046sE1RSJwPLbUs0xW1tBBLNXvH7tu
         tW8IQu4s4z7jaQBSeq9ee1/KElkjdxIPFR0NWIvbjWH+PGXkqIOmxXlzAULYzlUNFSmp
         +Yu1b7PZCLNgTL13KrqRHLJs/Dv694jEHMFZVxYGd3NgR1tGRAi1zNB+YklAogKOMrMx
         DNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762422948; x=1763027748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sx3MpVj7PiHTaRtB2+AQXnkYRvNzs0/kE3anQ6IOaeM=;
        b=S5YRI38C0JLnewhx6G+78TsFx/FvrG+degamk8v95yWmz+cVOE8LKl17VYLoq3sqCg
         IbdX3IOoejfmivpqKUGAszFx6lYXYCAhC+5L8xkQctC8Y1Z2UfryO1MuWI/oLN1tTX3C
         OqEcYbxUAbOZVv10gUFNtaEa8XuMz3L+LmVBMMtHOpKDybxfenebKNA2UTmIfTdY9eS+
         UPlH2ItGWIzIDM9y+oWIIWArGiDMBc8SP7GnPVIBTrseshdLjH6GcQOXUtr5WmjuDDij
         GTYHRUZBOWgJCjzprG0KFH7Pm/1pSedteqvESk5qFoSu8y4kxPjdwt3OHIS1OfB0W26M
         D0qA==
X-Forwarded-Encrypted: i=1; AJvYcCWJMT71rdC/CDPqXjR0ACAoaCSa9xeE+8/kyLdg21+gWa3Vd8j8pE9laou6vnjiFUfX634w+zNhWj7Ma+hn4BKl4frUsg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzS8a0Kn2bqYV5NORPMyaLehOEVs1FGm+ddq3OSyWZ+QVKppx8i
	GZzEQ9ib2TkLQoIJFIYaGHTNSD0ehTCZvffy9fs3lOZ03+CzbAo8b3WY
X-Gm-Gg: ASbGnctjMHV6ZPHFysH2fSoqqciOKZ1IVzwsrRQ88CW4TeF6qBIpRDhLcyzZEA9OTCH
	nDJtSOWr2ocVKG6Fu6SaZ3q1ALalBuX625xvNDg/BIdVgflKY0mPtil+DjGNa2loHMMU1Njf5tW
	Df9FxjPtIJir3H2diz/ZDfDMxQcsL7o/0drwQxk4jZxUezTh/O6fEUetctJVaNRVK4eHvhvZ8or
	v42hzZGik/Lm3Sk5EqnYjoOTzUVvJCjJENA/whC8xYYHziya5t3wST4Fi3hLgaEJ+ojpMMqTgvb
	JBXGj+mNCmlc4z9fTKkUIlqSGiWT5B9/czGTAzHvuj3fvF5CNskro5B81ag4PoWjrQn7BE9t2o/
	xkc0wCsPDH0u8xvF4y7WSoP+u2X/2YjldqDROaVsy39DwvTFCrGoCoGFhLjnYzHf+E+e/AD/QCK
	nQ7RgjfAESe2sgDbp5sgU=
X-Google-Smtp-Source: AGHT+IGLWpaeqUyOqwgdTGI+r36lnGa7tydw0O2a7A+GFy9ENF5YsdFbKzmv4BnmJ82XJw5jO5gf6w==
X-Received: by 2002:a17:902:d48c:b0:294:ccc6:ccfd with SMTP id d9443c01a7336-2962ad1bdffmr91436475ad.24.1762422947738;
        Thu, 06 Nov 2025 01:55:47 -0800 (PST)
Received: from fedora ([103.120.31.122])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651ca1eb7sm23046285ad.89.2025.11.06.01.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 01:55:46 -0800 (PST)
From: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
To: linux-kselftest@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>,
	Wei Yang <richard.weiyang@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
Subject: [PATCH v2] selftests/user_events: Fix type cast for write_index packed member in perf_test
Date: Thu,  6 Nov 2025 15:25:32 +0530
Message-ID: <20251106095532.15185-1-ankitkhushwaha.linux@gmail.com>
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

Since write(2) works with any alignment. Casting '&reg.write_index'
explicitly to 'void *' to suppress this warning.

Signed-off-by: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
---
Changelog:
v2:
- typecast '&reg.write_index' to 'void *' & remove use of memcpy as
 suggested by Andrew.

v1: https://lore.kernel.org/linux-kselftest/20251027113439.36059-1-ankitkhushwaha.linux@gmail.com/

---
 tools/testing/selftests/user_events/perf_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/user_events/perf_test.c b/tools/testing/selftests/user_events/perf_test.c
index 201459d8094d..cafec0e52eb3 100644
--- a/tools/testing/selftests/user_events/perf_test.c
+++ b/tools/testing/selftests/user_events/perf_test.c
@@ -236,7 +236,7 @@ TEST_F(user, perf_empty_events) {
 	ASSERT_EQ(1 << reg.enable_bit, self->check);

 	/* Ensure write shows up at correct offset */
-	ASSERT_NE(-1, write(self->data_fd, &reg.write_index,
+	ASSERT_NE(-1, write(self->data_fd, (void *)&reg.write_index,
 						sizeof(reg.write_index)));
 	val = (void *)(((char *)perf_page) + perf_page->data_offset);
 	ASSERT_EQ(PERF_RECORD_SAMPLE, *val);
--
2.51.0

