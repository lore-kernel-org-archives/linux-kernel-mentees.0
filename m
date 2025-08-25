Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E39B26A0F8
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 25 Aug 2025 17:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756141627; cv=none; b=XYqp+AZE2U9uITWya2Ju0HsBto2lAtG7dhUUzn8DMZ99A0NCr+Pc7FpxMHQSm38M97paBbEkEoyVLThph8oIv1X3rfo1wDHElM2QqV8F26FXOSjKePk37P2pY4LN/AcMtpGNBk/rkU1K+tLG0fOs317Q/5jAPh0Rzrz77aiOnMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756141627; c=relaxed/simple;
	bh=5PUlfoVWVRg6I2FFtXNFbJ4L0V8P8GIIUsk8ZG7Fglk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jjnv3nZ0ZNxptH5Y69X4FEwqgCK2OrjUSMPSxEBdzxAIicc9PMw1/GXFbEMQJEi7l95PCnonT3DUAfsOZkmkijycAHsi5+sMN5dIXXlcLke/Z985gGWPfN5W8mt0pn73uAR3jW1fFK57uRoVIyIkASZgJyNG2WhxygLNLGgI098=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a34Y5mRk; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a34Y5mRk"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-244580523a0so45084105ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 25 Aug 2025 10:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756141625; x=1756746425; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o5RmAfR4rYsxlFJUhIr+eW2wt0BUW3DWgzYQ+evh+1Q=;
        b=a34Y5mRkYk88uQTGeBRe2KERFfgWSQd9KXAyPpcowkxJT8feAndwqsCyPW8PjyWdsG
         oRD7I0l8zSOLizgiMERSrwjxJfHez9Qt1YoM97w+Uc6Ti9+7c1R0oQeHKV3GJl+bBIg3
         UvrNfE0aCd3zUUkBgQrlox34ioqH9u7KJPDpwy+Ave1dkX3tadFzJCBgllvV8jWiP3J4
         8JuzcWx0XQoaeXSVHhUvLL0bY38S0D37a2e//vB5sO1CKHM1JrfPNHGtDgoSNL0Z+lug
         1kiHjdXKZT08gVoLOVqpvVpIDJvj+lO3D5vhZ5KjcI0olLWzquZjJ2MKFXnZf6yU/UFw
         WnTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756141625; x=1756746425;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o5RmAfR4rYsxlFJUhIr+eW2wt0BUW3DWgzYQ+evh+1Q=;
        b=JjYP6J7Vr7dcnNNWs8Wf9STL/zPLRFGvwxbmD/gZKS2nkxo99CPlSCaK60chhRkqel
         BRfFUYPKHjH6nYHbwxpC23omLEXke2/mBpaCkyuT6Tw45+hOGGz9OO+4BGYlpFFX6H9J
         avmTCSVj0+oaJYvqlXYylcBgcTfdI1PN1cN5imEuLG3jZW1ahY5MsDPQ3x5XPMtefudv
         7ejIxs8uLxUk6WttMccZY1Gyk8HWmsDZEklvwbR/JV3unL4zdEQVGM7IwuuALeGfG1GA
         voJ7KZzVcCbCYu6C1Sn82Lr/KvyFMM+w9NJNij0HqnIVHL4pKRqoeS9dPsa2ZlyB0pPv
         dzfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXnNNAnlK1h+QmTc+VMKYdfjDTRDTKejJDVrzIcrxJ6DISECopsW84GA8gc4iT9A8yclBDxoG/SQjH0Qq/fhOlidxOLw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8Do5CW4Bdn3iqzS+0U+aGOYB09UiJnr0vls6tmDM6CFm/GB7C
	TL9vgDYwhA/+15rt/wMZvMo01zFrBa4AekOXuRvz+Tw/jhDyTuvKroQv
X-Gm-Gg: ASbGncsfJ9xdlABPhoiwLQBR/2xvRzJ92EYgWuwXB/w+5z2dJBlN/DkHJsljJppdUJr
	do7ynb1eYR8OPUrfZFxonOWxsth3/ifYN0eltkWM0hF0OVO+GRn2bkfnqDPrNKStf9RWSxiU7PK
	dcWt/pxOBVu85RhbN6CQ7Lew2MvVJPUQ1HndeTC6Ak8xQVEo856IwY4FOGEUsmZu3CNgskyJzw4
	KFfHavcrPqeYL33KeFjMsgQFx9WP0o4QJ+WBzcCj9ejqIMBeLH65xmMbW/v+9t61WWvxFjoQYLL
	K+9Ha/Jt7PgvegIwD5OCsXKUO1EtTGHNVbaRuutbMpCE+5P+FGPUgkIG31JZ8XaYtcsDK4J1k5P
	xyT6BAEFAvoaNk+OV4WK9+JPfwgk09FwiKyQ=
X-Google-Smtp-Source: AGHT+IEkhsxEhLSZfQy3k7sFLEhX/tDwtC0J4MzkXu5Dz/C+lrHURinY952j7BmG/n6fx8oK3A6/fg==
X-Received: by 2002:a17:903:1a08:b0:246:a8ad:3f24 with SMTP id d9443c01a7336-246a8ad4130mr81739215ad.7.1756141624869;
        Mon, 25 Aug 2025 10:07:04 -0700 (PDT)
Received: from linux ([223.181.114.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3254b8ff608sm7486025a91.29.2025.08.25.10.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 10:07:04 -0700 (PDT)
From: I Viswanath <viswanathiyyappan@gmail.com>
To: shuah@kernel.org
Cc: akpm@linux-foundation.org,
	david@redhat.com,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	I Viswanath <viswanathiyyappan@gmail.com>
Subject: [PATCH] selftests/mm: use calloc instead of malloc in pagemap_ioctl.c
Date: Mon, 25 Aug 2025 22:36:43 +0530
Message-ID: <20250825170643.63174-1-viswanathiyyappan@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per Documentation/process/deprecated.rst, dynamic size calculations
should not be performed in memory allocator arguments due to possible
overflows.

Replaced malloc with calloc to avoid open-ended arithmetic
and prevent possible overflows.

Signed-off-by: I Viswanath <viswanathiyyappan@gmail.com>
---
Even though the arguments are small enough an overflow cannot happen,
I think it's still better to follow kernel standard practices.

 tools/testing/selftests/mm/pagemap_ioctl.c | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/mm/pagemap_ioctl.c b/tools/testing/selftests/mm/pagemap_ioctl.c
index 0d4209eef0c3..4e6b815e96b2 100644
--- a/tools/testing/selftests/mm/pagemap_ioctl.c
+++ b/tools/testing/selftests/mm/pagemap_ioctl.c
@@ -209,7 +209,7 @@ int userfaultfd_tests(void)
 	wp_addr_range(mem, mem_size);
 
 	vec_size = mem_size/page_size;
-	vec = malloc(sizeof(struct page_region) * vec_size);
+	vec = calloc(vec_size, sizeof(struct page_region));
 
 	written = pagemap_ioctl(mem, mem_size, vec, 1, PM_SCAN_WP_MATCHING | PM_SCAN_CHECK_WPASYNC,
 				vec_size - 2, PAGE_IS_WRITTEN, 0, 0, PAGE_IS_WRITTEN);
@@ -247,11 +247,11 @@ int sanity_tests_sd(void)
 	vec_size = num_pages/2;
 	mem_size = num_pages * page_size;
 
-	vec = malloc(sizeof(struct page_region) * vec_size);
+	vec = calloc(vec_size, sizeof(struct page_region));
 	if (!vec)
 		ksft_exit_fail_msg("error nomem\n");
 
-	vec2 = malloc(sizeof(struct page_region) * vec_size);
+	vec2 = calloc(vec_size, sizeof(struct page_region));
 	if (!vec2)
 		ksft_exit_fail_msg("error nomem\n");
 
@@ -436,7 +436,7 @@ int sanity_tests_sd(void)
 	mem_size = 1050 * page_size;
 	vec_size = mem_size/(page_size*2);
 
-	vec = malloc(sizeof(struct page_region) * vec_size);
+	vec = calloc(vec_size, sizeof(struct page_region));
 	if (!vec)
 		ksft_exit_fail_msg("error nomem\n");
 
@@ -491,7 +491,7 @@ int sanity_tests_sd(void)
 	mem_size = 10000 * page_size;
 	vec_size = 50;
 
-	vec = malloc(sizeof(struct page_region) * vec_size);
+	vec = calloc(vec_size, sizeof(struct page_region));
 	if (!vec)
 		ksft_exit_fail_msg("error nomem\n");
 
@@ -541,7 +541,7 @@ int sanity_tests_sd(void)
 	vec_size = 1000;
 	mem_size = vec_size * page_size;
 
-	vec = malloc(sizeof(struct page_region) * vec_size);
+	vec = calloc(vec_size, sizeof(struct page_region));
 	if (!vec)
 		ksft_exit_fail_msg("error nomem\n");
 
@@ -695,8 +695,8 @@ int base_tests(char *prefix, char *mem, unsigned long long mem_size, int skip)
 	}
 
 	vec_size = mem_size/page_size;
-	vec = malloc(sizeof(struct page_region) * vec_size);
-	vec2 = malloc(sizeof(struct page_region) * vec_size);
+	vec = calloc(vec_size, sizeof(struct page_region));
+	vec2 = calloc(vec_size, sizeof(struct page_region));
 
 	/* 1. all new pages must be not be written (dirty) */
 	written = pagemap_ioctl(mem, mem_size, vec, 1, PM_SCAN_WP_MATCHING | PM_SCAN_CHECK_WPASYNC,
@@ -807,8 +807,8 @@ int hpage_unit_tests(void)
 	unsigned long long vec_size = map_size/page_size;
 	struct page_region *vec, *vec2;
 
-	vec = malloc(sizeof(struct page_region) * vec_size);
-	vec2 = malloc(sizeof(struct page_region) * vec_size);
+	vec = calloc(vec_size, sizeof(struct page_region));
+	vec2 = calloc(vec_size, sizeof(struct page_region));
 	if (!vec || !vec2)
 		ksft_exit_fail_msg("malloc failed\n");
 
@@ -997,7 +997,7 @@ int unmapped_region_tests(void)
 	void *start = (void *)0x10000000;
 	int written, len = 0x00040000;
 	long vec_size = len / page_size;
-	struct page_region *vec = malloc(sizeof(struct page_region) * vec_size);
+	struct page_region *vec = calloc(vec_size, sizeof(struct page_region));
 
 	/* 1. Get written pages */
 	written = pagemap_ioctl(start, len, vec, vec_size, 0, 0,
@@ -1062,7 +1062,7 @@ int sanity_tests(void)
 	mem_size = 10 * page_size;
 	vec_size = mem_size / page_size;
 
-	vec = malloc(sizeof(struct page_region) * vec_size);
+	vec = calloc(vec_size, sizeof(struct page_region));
 	mem = mmap(NULL, mem_size, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANON, -1, 0);
 	if (mem == MAP_FAILED || vec == MAP_FAILED)
 		ksft_exit_fail_msg("error nomem\n");
-- 
2.50.1

