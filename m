Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE9A351FDF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 13 Nov 2025 13:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763040076; cv=none; b=MsxjpFNzmLp3q0R40OjCARxMOkvK50b6ApJRqQcdKeN5YxGFjizYzLe+rnpUoh0HtIYuTRExdu2DZ3Xihmfr/4XZ1W/dQtluRW09jOnD3JwC7zpdo0AmAb/oZsRECCfk16JoPEJd4M5DpA/J+RXBvzsgMyM2dg6QcmB5Pw9dqDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763040076; c=relaxed/simple;
	bh=ad7GeFeZXAyLHvG5YscINIYo8bPB2uMyzmi9KQWWdsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lV3+01EBfy9GtwSeULP2SgqFjzMGY5ch92idNFBFx99L/JVZkggyBrWFL+2Sh68zknfv/PsYanBP3d+IGjJ+EKa3GvmeXtNBTNKa5g8Xv7u1KapTFa/pDjyb4FUGjxTazMCTVAXW0Zntvuj2LijHehOp+0XXwpDP7fRAwV3VBb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QWLFLr4t; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QWLFLr4t"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EBE680C20
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 13 Nov 2025 13:21:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iNHjiaHZCG-l for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Nov 2025 13:21:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3E9FC80C05
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E9FC80C05
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QWLFLr4t
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3E9FC80C05
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 13 Nov 2025 13:21:12 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4775dbde730so432505e9.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 13 Nov 2025 05:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763040070; x=1763644870; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nGN2ZFcnSRaiVO+YExpr2QgITSsJwYh/DPnXCfgL80o=;
        b=QWLFLr4tC9hm4sdGQesgYU6fCWF96j4EeKrNzxxkQ1AFsPHFUZjU6dQXTbwMoiOI6e
         qPcRIquoBGeDDhlYPTGvJoL6D7PTBMNL/GNP/GDm7PdEMln0AmprXRyU4hQl4Br7jiET
         1w4/5K79zc8C7lYYd6hNurAh7vA2wEQ5wQzvbQ83rw4Kcp7e/Z/fiNEsvTtVxrf3OHwx
         s9MQeJZ2w+kLIXpRW0HpIqPBzq84G2Wko8Plqp/Xqe8/xhKHXalMH38wK1yHmiKLgMU3
         JGnHP9ymzI74Xrdrq4lvQMLcETcPnDVmA3hjeAUfSBUSXNvK3Boj+flYi/WaBwL8K/tl
         vMTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763040070; x=1763644870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nGN2ZFcnSRaiVO+YExpr2QgITSsJwYh/DPnXCfgL80o=;
        b=rDa3ecfftEVfRzPMAL0OoNbtaeb+BmkyPoZ+oMcPU4MLvpkSIqehcr+OLhlblGDNv3
         pmHnqxyU6nTlEcM+klv/Y/qXmwymKJeuslT0QuP1Y8/DszdaDv8FNjbcmeKqCgm0+xWU
         TilVA/gvHPb/D4PNNTGxJw3Fwe0ZuDLYDy3EoP+9dVBVyZb4sL4s7eSclJHjzfeyDMyf
         IyT6uDbDGXFWEoRA+G92z42KnqmGTDD2O8oye4glDnuEmb2gxGOVSokUz6JwlT8Ryevz
         9ZMCKywlEj84Mz9NYH040X4+Zhf8T0njLuy5bjtXJkufuo3IDrVr/V/5o0MjZQTHQn5v
         f8lw==
X-Forwarded-Encrypted: i=1; AJvYcCVyd8ju8CYnP6O+bPoMhqSu9Cp7JKXrvI/aoeF/L9TW0p1lf3wxRqLOxTcDjSZuMYf1h2y3IE4t6+gDYOlkXfH3JtE3Ug==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyRe/VMGDr2l6CN9un2b/Y7spkFuVDPbhkKLowQgxXZhxeizy3C
	U4nmLeQyNk/XTqb0xmoWqDXD/hxqi++BXFpBvwShsesMmTjxbVT3DxdY
X-Gm-Gg: ASbGncs/NaCV3fH1WcdFoe3tsv4j6EBQBiExNuLS3JiwOT8bTy350OUiN3pBLFgTSL/
	dLGjZ4Zf8NFNpEnMjgzvBKqRBu+P1Qw9KjWqpxG9XNC3uUs1JeLZgl6eU07I7vMGvieXJoBE7Kg
	PEiXgPtWPGtB33wKEG25iPedgj8fHnOMMqX7T2CM99XjEz/tGut7HMtUYme1+k5XVrI0cBqtq15
	WwGCUZFFgIy8FSV6LuGxos8HH1EGEFexUg1bxDIAzBtSYN21UCr7Th2go18LZgcON8EVJUZ6im8
	fuAlQjDiKxcQ2T8tXi2ZgvJP0lwoKQ/t5btsauOY1nyKtvNx9twtHZtnOturg+n/obwQLOTuH6O
	WGSValRfcfZplkuYVEAY/9Yk/GbZSRAcPVqMY6wZ6xMhSPNtGqZ3Fnf5/gmm8MVMV30foqipf9R
	TsQ0t9zw==
X-Google-Smtp-Source: AGHT+IHlXVk7YngFwj47tCWravVebZ/U0ARUveuTel5lnc94KY28fXvMntNp7EdpGNvXfNWhmY9jAg==
X-Received: by 2002:a05:600c:3105:b0:477:7a78:3000 with SMTP id 5b1f17b1804b1-477871f4030mr35118405e9.6.1763040069752;
        Thu, 13 Nov 2025 05:21:09 -0800 (PST)
Received: from bhk ([196.239.132.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778bcfc687sm19745305e9.10.2025.11.13.05.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 05:21:09 -0800 (PST)
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
To: akpm@linux-foundation.org,
	peterx@redhat.com,
	david@redhat.com,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org
Cc: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
Subject: [PATCH v2] selftests/mm/uffd: remove static address usage in shmem_allocate_area()
Date: Thu, 13 Nov 2025 15:20:33 +0100
Message-ID: <20251113142050.108638-1-mehdi.benhadjkhelifa@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current shmem_allocate_area() implementation uses a hardcoded virtual
base address (BASE_PMD_ADDR) as a hint for mmap() when creating shmem-backed
test areas. This approach is fragile and may fail on systems with ASLR or
different virtual memory layouts, where the chosen address is unavailable.

Replace the static base address with a dynamically reserved address range
obtained via mmap(NULL, ..., PROT_NONE). The memfd-backed areas and their
alias are then mapped into that reserved region using MAP_FIXED, preserving
the original layout and aliasing semantics while avoiding collisions with
unrelated mappings.

This change improves robustness and portability of the test suite without
altering its behavior or coverage.

Suggested-by: Mike Rapoport <rppt@kernel.org>
Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
---
Testing(Retested):
A diff between running the mm selftests on 6.18-rc5 from before and after
the change show no regression on x86_64 architecture with 32GB DDR5 RAM.

ChangeLog:

Changes from v1:

-Implemented Mike's suggestions to make cleanup code more clear.

Link:https://lore.kernel.org/all/20251111205739.420009-1-mehdi.benhadjkhelifa@gmail.com/

 tools/testing/selftests/mm/uffd-common.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/mm/uffd-common.c b/tools/testing/selftests/mm/uffd-common.c
index 994fe8c03923..edd02328f77b 100644
--- a/tools/testing/selftests/mm/uffd-common.c
+++ b/tools/testing/selftests/mm/uffd-common.c
@@ -10,7 +10,6 @@
 uffd_test_ops_t *uffd_test_ops;
 uffd_test_case_ops_t *uffd_test_case_ops;
 
-#define BASE_PMD_ADDR ((void *)(1UL << 30))
 
 /* pthread_mutex_t starts at page offset 0 */
 pthread_mutex_t *area_mutex(char *area, unsigned long nr, uffd_global_test_opts_t *gopts)
@@ -142,30 +141,37 @@ static int shmem_allocate_area(uffd_global_test_opts_t *gopts, void **alloc_area
 	unsigned long offset = is_src ? 0 : bytes;
 	char *p = NULL, *p_alias = NULL;
 	int mem_fd = uffd_mem_fd_create(bytes * 2, false);
+	size_t region_size = bytes * 2 + hpage_size;
 
-	/* TODO: clean this up.  Use a static addr is ugly */
-	p = BASE_PMD_ADDR;
-	if (!is_src)
-		/* src map + alias + interleaved hpages */
-		p += 2 * (bytes + hpage_size);
+	void *reserve = mmap(NULL, region_size, PROT_NONE, MAP_PRIVATE | MAP_ANONYMOUS,
+			-1, 0);
+	if (reserve == MAP_FAILED) {
+		close(mem_fd);
+		return -errno;
+	}
+
+	p = reserve;
 	p_alias = p;
 	p_alias += bytes;
 	p_alias += hpage_size;  /* Prevent src/dst VMA merge */
 
-	*alloc_area = mmap(p, bytes, PROT_READ | PROT_WRITE, MAP_SHARED,
+	*alloc_area = mmap(p, bytes, PROT_READ | PROT_WRITE, MAP_FIXED | MAP_SHARED,
 			   mem_fd, offset);
 	if (*alloc_area == MAP_FAILED) {
 		*alloc_area = NULL;
+		munmap(reserve, region_size);
+		close(mem_fd);
 		return -errno;
 	}
 	if (*alloc_area != p)
 		err("mmap of memfd failed at %p", p);
 
-	area_alias = mmap(p_alias, bytes, PROT_READ | PROT_WRITE, MAP_SHARED,
+	area_alias = mmap(p_alias, bytes, PROT_READ | PROT_WRITE, MAP_FIXED | MAP_SHARED,
 			  mem_fd, offset);
 	if (area_alias == MAP_FAILED) {
-		munmap(*alloc_area, bytes);
 		*alloc_area = NULL;
+		munmap(reserve, region_size);
+		close(mem_fd);
 		return -errno;
 	}
 	if (area_alias != p_alias)
-- 
2.51.2

