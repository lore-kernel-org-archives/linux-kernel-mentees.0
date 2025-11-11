Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F112C0276
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 11 Nov 2025 19:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762891093; cv=none; b=muLWrrIYygP8t+zwmGekWBqlsr9+qOKY1v8Qvb0vHVawsd9VEwrGdqwHjrOxN71QA8Vc3BMDYlV1mXkDERsoHPjjET/hxVX3TMk1YxHGI/1hptF//v7mNOYTuhvcNrR9O+6wiiPnvsJRuZemVOoueuG2wLkW6oBHMv5eS0sSEeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762891093; c=relaxed/simple;
	bh=62sKlTrI0pxAC8MsCjHaTOLDapsx/YJT2jYwGk/YKdM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FJ5TV0DUX7aav9I9MGrnyR6cVhopJYPVxwNQU1NJa2lHO0lX5XEp1menLYEQLc90SlTfBmCP4d/DFdrysAj5OaYFL5OljbTtE3AgJY3FLpI3vwqYK0dYhWV84ls0vHmFGGcuXDvzgurUbTs9qC3lpSWcRqRxh2AF5v/AlHoW20g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Saq8duMY; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Saq8duMY"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F2F060B12
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 11 Nov 2025 19:58:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xu3R3OvvxkAD for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Nov 2025 19:58:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 64EAB608B0
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64EAB608B0
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Saq8duMY
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 64EAB608B0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 11 Nov 2025 19:58:05 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-42b2cff817aso11029f8f.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 11 Nov 2025 11:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762891083; x=1763495883; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GgqlcdicdOlvJS4d4lOKT+0mM+91PtUwo1QhcetW41s=;
        b=Saq8duMYKfV9o4ywaHfHcmX9dwpcFTkv5WsVjVNkgYPVsABsTUwYOouJRaf1Pw0Iv3
         mF0LRp4EgzguaJ+oTu/pNPU/UU6QoTqQFIyUbxXsNL+jGcWBQu73lYuZLkvYQLDzEaU8
         deoyyVCOImCMaWnc/YGLfF9nKrvP2rsue6kSxMKAP5KuJRIt/dJCGYaG4+pIN8LQhwUX
         3Je8A5PPqFLjkMS9OLcvbTCY/A0s1ODYIdPd2mPSHI+nZck0q68ZQN29DoCZUAKgP931
         +qFMGh/J31krd3IrxeUyzyJzsLzbvHb0zI8PF0tPyHqWQ7XWLKTQTaDM7IoG+r7zDONB
         SIxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762891083; x=1763495883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GgqlcdicdOlvJS4d4lOKT+0mM+91PtUwo1QhcetW41s=;
        b=Y74TqUgnfJFAkrtR8mTQ+V6npQa0Us1PquPp1WHwt/ROVEbAqaNDCtPCOVF/eTrEVs
         iiB44NkS7nZ1aG/r2s8VU+JrdNfo4CyjybDB/yivmtlqHAnoXM+fAJnEqMdvduPQo7lt
         LssYMKCI0iVZaLJFb0w/oU49FCCLhcWYqxvawHzYRHhAEeEEKK2nJ/opLEbDDqhLMjFv
         JZnW+HnvQj6V0vg1BjfHf/KkDX0sA6/ZXfYGDmIjXD9WjTo+IeAOWXCVYuz5J632AUJP
         HPt/Tv6IKuoR4CjoKqVVmiiHUaFsxv4ic7hyM+GYY4xq/gTlShuF0vspa6qk/IObWA3u
         M8UA==
X-Forwarded-Encrypted: i=1; AJvYcCUkklpLli6qi1hPZkuFkMeA6WokAhgBng3dTQZNasv6z/B/U3Ama9mpyV5UCgrzsCpZG4+1qYuGpcjAp8WTn2KKW5TOHQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yxc8Kb7vG9fEYJDNxKrkpd04ianKmIBgUG/uTSpn+ipbFUXL6Uo
	zXIWF4DxhuB5s048rEACOM4hZmDrrvn3SWA9aj4OUxOTR+0aeIEESIjW
X-Gm-Gg: ASbGncvMFQLfEWFk8D22uzUKTAInIryKXqSsLsSmu2K2nMndIDsvIT8/+jMyUJgtxZt
	NGdyWhug/zLYMkii9hJ1wKVcd6ofPCCY71OSj41N4L9HXeOE5DKV4ooEu26ETtAmJwwcg/XP5fP
	v1YJRektgrTvwITQcDAoilmZx/uXDB9vWFxUVnf+RRXLWcDTm+mc6ZUvZGcKk9lEuxYrcOh70iW
	Dq/kXM7WhZ9EwX8kApkSnBvhgJT5vzdwzx6Y28PDct+aBaA/ONo0BditUQkh5gZrdjBwwyWy8tS
	UY7Bu4Reb63lUXg8DxMmUidirTY2nbs1JkfziNbYoIkbIrZhWoxHzf6V9wAabLTBWPveJXf8rBh
	71e0adzI9Qzs+3Pnra61PRucO2DOos9dDOswWdxHSZeDaZCP30dtlEK67b5PZakyP7c9ucM2wcr
	ktzPgjmjaVIxGCSksFXDf2b/Fbo0Q=
X-Google-Smtp-Source: AGHT+IE21rOv3E/xf61ATIbFY5zukw0tfOg7SCkZGn4ZrAkN7p8psKMVSUEEhKXeXEJZn8Yww8oxyA==
X-Received: by 2002:a05:600c:4f54:b0:477:5b01:7d49 with SMTP id 5b1f17b1804b1-477870c9a70mr2783175e9.4.1762891083060;
        Tue, 11 Nov 2025 11:58:03 -0800 (PST)
Received: from bhk ([196.239.144.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775ce211d8sm405969865e9.11.2025.11.11.11.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 11:58:02 -0800 (PST)
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
Subject: [PATCH] selftests/mm/uffd: remove static address usage in shmem_allocate_area()
Date: Tue, 11 Nov 2025 21:54:27 +0100
Message-ID: <20251111205739.420009-1-mehdi.benhadjkhelifa@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current shmem_allocate_area() implementation uses a hardcoded virtual
base address(BASE_PMD_ADDR) as a hint for mmap() when creating shmem-backed
test areas. This approach is fragile and may fail on systems with ASLR or
different virtual memory layouts, where the chosen address is unavailable.

Replace the static base address with a dynamically reserved address range
obtained via mmap(NULL, ..., PROT_NONE). The memfd-backed areas and their
alias are then mapped into that reserved region using MAP_FIXED, preserving
the original layout and aliasing semantics while avoiding collisions with
unrelated mappings.

This change improves robustness and portability of the test suite without
altering its behavior or coverage.

Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
---
Testing:
A diff between running the mm selftests on 6.18-rc5 from before and after
the change show no regression on x86_64 architecture with 32GB DDR5 RAM.
 tools/testing/selftests/mm/uffd-common.c | 25 +++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/mm/uffd-common.c b/tools/testing/selftests/mm/uffd-common.c
index 994fe8c03923..492b21c960bb 100644
--- a/tools/testing/selftests/mm/uffd-common.c
+++ b/tools/testing/selftests/mm/uffd-common.c
@@ -6,11 +6,11 @@
  */
 
 #include "uffd-common.h"
+#include "asm-generic/mman-common.h"
 
 uffd_test_ops_t *uffd_test_ops;
 uffd_test_case_ops_t *uffd_test_case_ops;
 
-#define BASE_PMD_ADDR ((void *)(1UL << 30))
 
 /* pthread_mutex_t starts at page offset 0 */
 pthread_mutex_t *area_mutex(char *area, unsigned long nr, uffd_global_test_opts_t *gopts)
@@ -142,30 +142,37 @@ static int shmem_allocate_area(uffd_global_test_opts_t *gopts, void **alloc_area
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
+	p = (char *)reserve;
 	p_alias = p;
 	p_alias += bytes;
 	p_alias += hpage_size;  /* Prevent src/dst VMA merge */
 
-	*alloc_area = mmap(p, bytes, PROT_READ | PROT_WRITE, MAP_SHARED,
+	*alloc_area = mmap(p, bytes, PROT_READ | PROT_WRITE, MAP_FIXED | MAP_SHARED,
 			   mem_fd, offset);
 	if (*alloc_area == MAP_FAILED) {
+		munmap(reserve, region_size);
 		*alloc_area = NULL;
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
+		munmap(reserve, region_size);
 		*alloc_area = NULL;
+		close(mem_fd);
 		return -errno;
 	}
 	if (area_alias != p_alias)
-- 
2.51.2

