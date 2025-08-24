Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C77F235044
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 24 Aug 2025 06:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756016079; cv=none; b=nnZm5kcdsw0mW2maDMdSJv9ISnR7GJAHgeM2/3/ZV3fgtU/kC8kG76CfnHb7/AeLPeklARVbom3OFjBDXYFt6bLCQ3htW8jk7UrutF7Kf/cuVL7cr1S6NMwVInOPoMmNQRK2LYzgsJoJV94mBbtb7AUPPWV9Y1PLUOP2E7ZqrgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756016079; c=relaxed/simple;
	bh=mA13B3Ao60GIm73vIFzbEUkWO3GTHwpdVETD4PRXrZk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ht7PT5HxFUsmfety0wiKGKA7/O/hG+NZHY1Fet1fVHETslzk8/NPuKca+dfFB1bS+eUaW+VYrou7dsy6bP97bRJzhXV/rcYlsbubizRIZt7rPht8WKFabGZV470BGH+W2EBLGK2y45lSz1R5yAGxZxu6Va+nd+DS+J5ZB9SyUvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=laFz4mBp; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="laFz4mBp"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 109D86147D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 24 Aug 2025 06:14:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3NuGQaHd3Snc for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Aug 2025 06:14:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=vivekyadav1207731111@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 28994616E8
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28994616E8
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=laFz4mBp
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 28994616E8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 24 Aug 2025 06:14:36 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7704f3c4708so634551b3a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Aug 2025 23:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756016076; x=1756620876; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5sa13zN0S1ZZT60WrBhxIALrAJrIW54PMQ9SbvE2ncM=;
        b=laFz4mBp2U4u6+YOTUS7H+x1TfSs4ljOkBHXMskaiGpxXbFzBqZozZEzROS5ppK+ZA
         AAp2qZS4RfnDjsmBy9MnZx47wOXGGrmsMKKWj/Zs1dRHkoFroibhVeZR5nsGV+RUzoh5
         qg7FX12Icsdz+axZUvfQWx4FqkniZbxVLtAfEF/nhQObH/zO2GW9+gADMsEAP2zhI5OW
         niIpYVzd1ZUasUpdcGikNkct3jAxHclgbIdrSHJLQz8DbdA6MbogzA6ScWiApQp4bYq7
         BDv+KieBznWZF5eMRNGRrVIiL7eUMblCnT10O3brZLGgH//AG7iBZhXwKb/3M6xxQXka
         cNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756016076; x=1756620876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5sa13zN0S1ZZT60WrBhxIALrAJrIW54PMQ9SbvE2ncM=;
        b=XIbnEWNHyuPhVcluspzVDjTbbB0yLbkfH8Q44oBqZK3Q0wSYIdWXEr5GebyOkX+pQJ
         5RX4TtSVJBwDXXWJWFMiZw1zPmJ+kDqgC06gONYqimBFSikE9f4Pbrf9ag+KodnHYEqg
         0MKOmkojjd6KjTAEJk4OIIgnKDheXIFBPe6S9GTqX9rESqVZlQbCq2jk0ShFeaIIMZOx
         69H5ccetUl6Bvg8ig88qoqpKi12poTo9eux44ln1PxGuLWDdWJKaGekQkIVb2VL0uyj9
         CsTbU0ZzPyc0bQX1t2S4cEO9UdydAEbu2jRGUHgsgFNJqxqqU08unQFYnH7vN9PnucNc
         vNpg==
X-Forwarded-Encrypted: i=1; AJvYcCVeLmrd+WtCCIhEkx1/YPeTa0ycIIGLEjf3fy6HUtd6h8fmPqozqnncOgV84rI6f0MsKv7BLBZvXQ/68y8aVUJ3qaT7Pw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yx6/obRQGwPc3KI9zpJi1Y5kwxTRRhWthlt56bioXSBdSdydx1c
	iht7VBmfhsywpbp/ad57KS7GXt9vdR7ZVg20a7RpugK197UuuE2FdA0E
X-Gm-Gg: ASbGncupkT1TajdM1mX2uvStaQoFrKnE/bvzpVIuFXzkFtnLM5lBv8Jw2lcxIV+ftOj
	IBEBnsLUVz8M5OmbFBX1lPlaDsvJpVbHEjzP5Wd4/D01hUzKp6IbgRiFPuV9sfd/87pgJszSu65
	IetA+awcXEniqymhKvHKAjmcmX7kWrg8rtLQZNJ34IAlJlugtNbWQ6c6L1N5IsbaVORu8N51Lod
	mxerXtJmIHjfGVtfkULCde92b/TC9P9IqsXghBVRuS7DBb6qn2OdsFyTchuR6lFsiRhFzcn9Qpd
	uVUCh90BBotcnsnmsY7wIVkPhOBikP4Poxkdj06ywVrFLeH6O+a8qte+DEeRDsBdtnIvN5Ri4sU
	mQqVF3o3Ztv5En0teYlQGMhHo6Xu1OTGIjf5z1HJ6/8ewaArFrxNP
X-Google-Smtp-Source: AGHT+IGf7w3aejcMRspW0BPyWAdmCLwYhnOhUhtrCW6ul7LU9ibd0rIlZWCizAKLWAF8pA93qJtU7Q==
X-Received: by 2002:a05:6a00:138c:b0:770:2c2f:6435 with SMTP id d2e1a72fcca58-7702faafbcemr9453653b3a.20.1756016076256;
        Sat, 23 Aug 2025 23:14:36 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d003:7033:ad1b:5a79:43f0:e247])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770529149bdsm1654943b3a.98.2025.08.23.23.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 23:14:35 -0700 (PDT)
From: vivekyadav1207731111@gmail.com
To: catalin.marinas@arm.com,
	will@kernel.org,
	shuah@kernel.org,
	corbet@lwn.net
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-doc@vger.kernel.org,
	Vivek Yadav <vivekyadav1207731111@gmail.com>
Subject: [PATCH 1/3] kselftest/arm64: Remove extra blank line
Date: Sat, 23 Aug 2025 23:14:00 -0700
Message-Id: <20250824061402.13432-2-vivekyadav1207731111@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250824061402.13432-1-vivekyadav1207731111@gmail.com>
References: <20250824061402.13432-1-vivekyadav1207731111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vivek Yadav <vivekyadav1207731111@gmail.com>

Remove an unnecessary blank line to improve code style consistency.

```
[command]
        ./scripts/checkpatch.pl --strict -f <path/to/file>

[output]
        CHECK: Please don't use multiple blank lines
	CHECK: Blank lines aren't necessary before a close brace '}'
```

Signed-off-by: Vivek Yadav <vivekyadav1207731111@gmail.com>
---
 tools/testing/selftests/arm64/abi/hwcap.c       | 1 -
 tools/testing/selftests/arm64/bti/assembler.h   | 1 -
 tools/testing/selftests/arm64/fp/fp-ptrace.c    | 1 -
 tools/testing/selftests/arm64/fp/vec-syscfg.c   | 1 -
 tools/testing/selftests/arm64/fp/zt-ptrace.c    | 1 -
 tools/testing/selftests/arm64/gcs/gcs-locking.c | 1 -
 6 files changed, 6 deletions(-)

diff --git a/tools/testing/selftests/arm64/abi/hwcap.c b/tools/testing/selftests/arm64/abi/hwcap.c
index 002ec38a8bbb..27d4790c2f0c 100644
--- a/tools/testing/selftests/arm64/abi/hwcap.c
+++ b/tools/testing/selftests/arm64/abi/hwcap.c
@@ -55,7 +55,6 @@ static void cmpbr_sigill(void)
 	/* Not implemented, too complicated and unreliable anyway */
 }
 
-
 static void crc32_sigill(void)
 {
 	/* CRC32W W0, W0, W1 */
diff --git a/tools/testing/selftests/arm64/bti/assembler.h b/tools/testing/selftests/arm64/bti/assembler.h
index 04e7b72880ef..141cdcbf0b8f 100644
--- a/tools/testing/selftests/arm64/bti/assembler.h
+++ b/tools/testing/selftests/arm64/bti/assembler.h
@@ -14,7 +14,6 @@
 #define GNU_PROPERTY_AARCH64_FEATURE_1_BTI	(1U << 0)
 #define GNU_PROPERTY_AARCH64_FEATURE_1_PAC	(1U << 1)
 
-
 .macro startfn name:req
 	.globl \name
 \name:
diff --git a/tools/testing/selftests/arm64/fp/fp-ptrace.c b/tools/testing/selftests/arm64/fp/fp-ptrace.c
index 124bc883365e..3dc195f977ba 100644
--- a/tools/testing/selftests/arm64/fp/fp-ptrace.c
+++ b/tools/testing/selftests/arm64/fp/fp-ptrace.c
@@ -1569,7 +1569,6 @@ static void run_sve_tests(void)
 					  &test_config);
 		}
 	}
-
 }
 
 static void run_sme_tests(void)
diff --git a/tools/testing/selftests/arm64/fp/vec-syscfg.c b/tools/testing/selftests/arm64/fp/vec-syscfg.c
index ea9c7d47790f..2d75d342eeb9 100644
--- a/tools/testing/selftests/arm64/fp/vec-syscfg.c
+++ b/tools/testing/selftests/arm64/fp/vec-syscfg.c
@@ -690,7 +690,6 @@ static inline void smstop(void)
 	asm volatile("msr S0_3_C4_C6_3, xzr");
 }
 
-
 /*
  * Verify we can change the SVE vector length while SME is active and
  * continue to use SME afterwards.
diff --git a/tools/testing/selftests/arm64/fp/zt-ptrace.c b/tools/testing/selftests/arm64/fp/zt-ptrace.c
index 584b8d59b7ea..a7f34040fbf1 100644
--- a/tools/testing/selftests/arm64/fp/zt-ptrace.c
+++ b/tools/testing/selftests/arm64/fp/zt-ptrace.c
@@ -108,7 +108,6 @@ static int get_zt(pid_t pid, char zt[ZT_SIG_REG_BYTES])
 	return ptrace(PTRACE_GETREGSET, pid, NT_ARM_ZT, &iov);
 }
 
-
 static int set_zt(pid_t pid, const char zt[ZT_SIG_REG_BYTES])
 {
 	struct iovec iov;
diff --git a/tools/testing/selftests/arm64/gcs/gcs-locking.c b/tools/testing/selftests/arm64/gcs/gcs-locking.c
index 989f75a491b7..1e6abb136ffd 100644
--- a/tools/testing/selftests/arm64/gcs/gcs-locking.c
+++ b/tools/testing/selftests/arm64/gcs/gcs-locking.c
@@ -165,7 +165,6 @@ TEST_F(valid_modes, lock_enable_disable_others)
 	ASSERT_EQ(ret, 0);
 	ASSERT_EQ(mode, PR_SHADOW_STACK_ALL_MODES);
 
-
 	ret = my_syscall2(__NR_prctl, PR_SET_SHADOW_STACK_STATUS,
 			  variant->mode);
 	ASSERT_EQ(ret, 0);
-- 
2.25.1

