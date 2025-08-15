Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5BF2F99BF
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 15 Aug 2025 09:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755250821; cv=none; b=dStV4Oa1lAJSSFUFtIL3IPgUMK90FY0SRjbv1IWz77ncNxtTJgk7XBdHUINGMfc8egji/5bhhskg9SVwcs4/jNrsu3Ra4QAcuJ7B4WBBuYd3CNn/gXL+eFacMXBOxyMMLV6rWM96+7+bhzft+I0R/6oiiIvsE4+UaosDB/geRbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755250821; c=relaxed/simple;
	bh=whpeQLd/ONXc5d3w4EWvao23vVy7bdwGUSUQMFmelyo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jkhi7u0deCoZpEKPCvF6LRVjrSNLCPO09bh9vLAwnCs/IP2/EQYfDm8lD9aoPYVAlhaEkQWnkwqwGzHyxej0RBjJIP/WExx4EEqpNKBTDXKwPkD7bFZP0pcFsvPN8ekY6nnj88473ZTEFNDRZfGd402YeUWQXVM/eQ/1/TDri6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y7+yc5Ue; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y7+yc5Ue"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b47052620a6so2226667a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 15 Aug 2025 02:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755250817; x=1755855617; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gb59vZc0r3SnxTBn3fpGLZ7jKF2s9oF0aj2fWUpQssE=;
        b=Y7+yc5Uet5tsw69QVUDjB8BhYZ+Kzoj0w+iGLXFBsJBnytBbyqKOim+0kZK1WdCOlK
         cP5wwwQPfgCDILjBoncer32YQ0GrUxe/agbPGKR89VMTJ8JB8xn4IFnvfB4FdcKvqqIW
         JHBb2vAwUlIeVjzyIjlIB6QYjY9lQ5rB1THMPXbzKqkELTZfnDvXzzyCfFT3md5Vhjdb
         /WKJpPfsRsrvl223l+t3DqdQbzsZxn5cHlU1YDUg8UgEHdZ5wtj0ChN6JvF8B/5DpPkC
         lAoBCIIaaYK/dalbiuRrneK6LNB/RwCltyd/ka1BqTEt+qtZRkgv7sR1JS3CU0Vvksa1
         VlvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755250817; x=1755855617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gb59vZc0r3SnxTBn3fpGLZ7jKF2s9oF0aj2fWUpQssE=;
        b=TKzVcASk02R6ergUdMcuR+2xM4q3M/DH7fOMLFLHaG1gjh2gfK+Xw9shOtEafkMqvF
         AVWspXYwmh5RyznNaPGNAWsi7j6bX9QyWbxP0IfEAN7I/sLamEjvtfxkPdCnUQW8Sr1m
         Ju7R8kR5qi2um58MsLhHTej7clTJ8e4h0P4v9obTQX6ePVRlgne4Kb6oXuFPYPjlZTNz
         8AKV13//qGAEWKdLSrTJx3DGyuMPp6J7iQpFGHLJ4Z1/NF/gvuNOkuvK2LreeEuDkFJF
         bj8a9iBXttJatD4xum/+O6YVXHPSqVOQql3T6KVPz+wGnotxmERpmFboqIh7n6l2M3Sp
         xWbw==
X-Forwarded-Encrypted: i=1; AJvYcCX87vcwfuaF4zFRxHMMZadbu6jqZA0Fmg7YaEWa78C2oJi2D2M5j3J3+jOKm1xBzbOgsR/R4n2gCKQJBTp4bZ8YLyqr2Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwVxMkFvW/t/+JP7IONJiqq23EjomuRYNYu56ByEYhHqPPGvJAW
	+GPRu9xB3Tg4EYURcu5tlaiDyRGxo/ZxSqB+/YgSFy1kZuFzTl46i5i0
X-Gm-Gg: ASbGncsUA0tQnJ3eODbcsdA5ihcTErHDw4kG3iC/LjJ6WZFwtkCRLWoDDnCtbiBEVOT
	GzGtUlyiBXJ0OEwD8iAEO337MNu/B8sIpJaIAeJut+up4wOS5/tlwBvzS+eO0QVTikWgOkmMnKW
	HcMuqlc9hRLq9IvdZrPPuGl25Bc25F5uULUUv4PDdJ8X+1zA0Iw8laBN30op8gNAdKAwIxs6Xsz
	jh4AJZsNifesQ+zUeIUYcxiNlDxlTXnr7aAuDxfzs6mFrvuxuZkOIvhCSYZE5cdlBtHbc95aAPG
	4rkoHQCnrtdnXrR6jkWUILdN/iE2zWP/ef112UrUpuoow20UR8fito9V7SmurA31x9goyeOY+bo
	p7qrwg97zIZtgJ47SIn5lELxolsYmGbTR7SalXv6ndVOVYmyeWQWDvA==
X-Google-Smtp-Source: AGHT+IF4s8vZ+UiJBxse2ETuu42pbherih7pTOd3GqJtWrEiYv5pQGik3DHXjIKSbfx73/CtvYgMvw==
X-Received: by 2002:a17:902:da82:b0:242:b138:8119 with SMTP id d9443c01a7336-2445988787emr87476215ad.26.1755250816863;
        Fri, 15 Aug 2025 02:40:16 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32343962af1sm856597a91.3.2025.08.15.02.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 02:40:16 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: tglx@linutronix.de
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	mingo@redhat.com,
	peterz@infradead.org,
	dvhart@infradead.org,
	dave@stgolabs.net,
	andrealmeid@igalia.com,
	shuah@kernel.org,
	bigeasy@linutronix.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] selftests/futex: fix typos and grammar in futex_priv_hash
Date: Fri, 15 Aug 2025 15:09:39 +0530
Message-ID: <20250815093942.8595-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix multiple typos and small grammar issues in help text,
comments and test messages in futex_priv_hash test.

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
 .../selftests/futex/functional/futex_priv_hash.c       | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/futex/functional/futex_priv_hash.c b/tools/testing/selftests/futex/functional/futex_priv_hash.c
index 2dca18fefedc..4a7dea008314 100644
--- a/tools/testing/selftests/futex/functional/futex_priv_hash.c
+++ b/tools/testing/selftests/futex/functional/futex_priv_hash.c
@@ -115,7 +115,7 @@ static void usage(char *prog)
 {
 	printf("Usage: %s\n", prog);
 	printf("  -c    Use color\n");
-	printf("  -g    Test global hash instead intead local immutable \n");
+	printf("  -g    Test global hash instead of local immutable hash\n");
 	printf("  -h    Display this help message\n");
 	printf("  -v L  Verbosity level: %d=QUIET %d=CRITICAL %d=INFO\n",
 	       VQUIET, VCRITICAL, VINFO);
@@ -180,7 +180,7 @@ int main(int argc, char *argv[])
 	if (ret != 0)
 		ksft_exit_fail_msg("pthread_join() failed: %d, %m\n", ret);
 
-	/* First thread, has to initialiaze private hash */
+	/* First thread, has to initialize private hash */
 	futex_slots1 = futex_hash_slots_get();
 	if (futex_slots1 <= 0) {
 		ksft_print_msg("Current hash buckets: %d\n", futex_slots1);
@@ -232,17 +232,17 @@ int main(int argc, char *argv[])
 
 	futex_hash_slots_set_verify(2);
 	join_max_threads();
-	ksft_test_result(counter == MAX_THREADS, "Created of waited for %d of %d threads\n",
+	ksft_test_result(counter == MAX_THREADS, "Created and waited for %d of %d threads\n",
 			 counter, MAX_THREADS);
 	counter = 0;
-	/* Once the user set something, auto reisze must be disabled */
+	/* Once the user set something, auto resize must be disabled */
 	ret = pthread_barrier_init(&barrier_main, NULL, MAX_THREADS);
 
 	create_max_threads(thread_lock_fn);
 	join_max_threads();
 
 	ret = futex_hash_slots_get();
-	ksft_test_result(ret == 2, "No more auto-resize after manaul setting, got %d\n",
+	ksft_test_result(ret == 2, "No more auto-resize after manual setting, got %d\n",
 			 ret);
 
 	futex_hash_slots_set_must_fail(1 << 29, 0);
-- 
2.43.0

