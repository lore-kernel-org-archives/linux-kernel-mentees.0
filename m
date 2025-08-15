Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A944D28F1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 Aug 2025 00:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755217223; cv=none; b=Daovef5RhlbNfUqZGfu/U45BP5DnPCPzOEnartDspzYRVR29dKmEkNhY2pljSdLyCWlfllxBRoSXu12dmnIcoExV/gPjMuQ8JSuwOv/MheDeL6Th2/VNxETDYRwQeqQFpb6l797sQcJjx0ZbcI9lRo9p1RBxJYR+7O8eMmHjMos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755217223; c=relaxed/simple;
	bh=Hlpf2kTVXQNQmFdUgxQvYfOl1mZBxeqXkGFm+CUVm/s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c+DFZo7eqSRKHeK70mdOZ02+Mqx0Nu3ROmNCyHXQFIBE98ESEfZDoaazYuvaclBAREd7NbrvTRoj3Uj7mBz6ppShBl6TOt5ow4sc27K8Jle8jhdwy2vC/O319aLJ3tE3InyPxvTxUez9DwssKAzV7wI21Hu3fV/Y6XwUP/lcjSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OxW5NzUA; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OxW5NzUA"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A9B140075
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 Aug 2025 00:20:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cxjt5kb1n9RN for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Aug 2025 00:20:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=sohammetha01@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CD0AA40644
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD0AA40644
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OxW5NzUA
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	by smtp2.osuosl.org (Postfix) with ESMTPS id CD0AA40644
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 Aug 2025 00:20:21 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-b4717330f9eso1056006a12.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 14 Aug 2025 17:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755217221; x=1755822021; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TnAqP/Eao4gbLB1mbZYWMwk5AegHaMBnl9yzD4tj3Pc=;
        b=OxW5NzUABsSq7MWSnyCfinYYeueJuVNOQCeBip5mkVSKRFWeiXA0pwjOOMYcd0LZEc
         9qfX+xeueUPNm/7UG8+tIz4UvzVSmpEbUh9HTNX9O6LHaxcGJgR/Z+XVh47+Ibj62vTs
         GBA2e8RtBiNqmkYhR2/41hzK4ISk49ERl3oMTrbWstZh+Lj1bsGoQCo6AKEGgbxu/FHb
         27GZRFtzqvxxa5SarzP0To/TL2oV6RwtMnJIU13mqxy+lWwBVTX8AOaqye44mCQdiqBI
         qWwgD7H+5EAXYgAMrf7kcVuMbz6yKQx0Poh2fYTAZF2bEA2MVE/cDGgUBI57VDoJSujo
         mTZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755217221; x=1755822021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TnAqP/Eao4gbLB1mbZYWMwk5AegHaMBnl9yzD4tj3Pc=;
        b=vQcRT6KSIB/0uVzwm3JXE75P3rQpvCSVpE3fPPRzF4vQAKrPKHaIFlkW4mgVxMACG3
         OVgoX4d0upLkeYQZdsBrF3oSOuxx8Mm4RBFXPUXeaYLsplLW/5oVnREHLeeQ1UHtnRVb
         8er9KUAUg7BZIIF4LE9KbiVzQ1KBPBou3DuuCN81cJhqz4vuKF9dTCmdrJntsmhRBGLK
         LrpmtmclmXuPgXzdmgp6c5sNxyZ6yrFo8uYpFk/gMJ7meiSFGu/xQwgVwQFytYiGHNVg
         gRRSG9l8aUUw0MF8l5iiNtO4+ylQ87zyjqBMTfdNnpbhbq1DFIFZB2qeKfIgucE0pW69
         CUbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWefwAJ707gC6oysYUOy0oYlhMvLJLpDCUnal4WWMVjd9shW20atnQnKGPx0N1zWV30ejpksQEKPxk4yydTSISqD0M1CQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwG+pU89i7VewlSYXYGS8HfNFdNpQSi1+Z3uYf6U6DrpOTvRy9e
	6H9+b8887KBL4s8+vDSGAa0AeuegwRM9VlHJDXXGNS/HM2dIMgBArypD
X-Gm-Gg: ASbGnct6w9qooc72YxpvllCzVnef733Okfxz7EmdG+x9wIYuH9MFG+OAblbs8ulJTZV
	G+iopSGu0RGwIc11sDvjGHHIfyR4e9RwrAkvBFpj3e3MSKJhuzPoI3N4OuJedg8ncNXJIgd2wPR
	+RNkUCWP/jzR5m6hfKsforHW6q4fD2paHdtCEkGBGGmyVfnCj0oKpSUSXBdRvTE6nl7/vqSbTA5
	jGvy3gsa6Mp5DldJ73HsvToYSagoo4RTZ67C5uZfIsY1ErNr+hEAxFUAmINaURxOI3bB6CukYUl
	xy/vVL6E33ST5kTGA96Qp+Lxj8FIBw2vLAKBQixWUE/41dYRv/5b7qIUOELM70KiwgSHMTeN3vX
	xCD2cOCtDXl4ZwDYX/DRSFHWsnU/o2P1T/E8aYtty/A==
X-Google-Smtp-Source: AGHT+IFCAtu5B5yxPJm9Jf0dqxrJjQRchll+v2TqA1NF0cIniaNtFVRw/nJJfo96v0jQVWxXrvFqKw==
X-Received: by 2002:a17:903:46c4:b0:243:6d9:aa2e with SMTP id d9443c01a7336-2446d9b0973mr1513905ad.53.1755217221031;
        Thu, 14 Aug 2025 17:20:21 -0700 (PDT)
Received: from soham-laptop.. ([103.182.158.111])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d5a451esm700745ad.165.2025.08.14.17.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 17:20:20 -0700 (PDT)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-kselftest@vger.kernel.org
Cc: shuah@kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Soham Metha <sohammetha01@gmail.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 4/6] selftests: kvm: riscv: fix spelling mistakes in comments
Date: Fri, 15 Aug 2025 05:48:01 +0530
Message-Id: <20250815001803.112924-3-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250815001803.112924-1-sohammetha01@gmail.com>
References: <20250815000859.112169-1-sohammetha01@gmail.com>
 <20250815001803.112924-1-sohammetha01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

found/fixed the following typos

- indicies -> indices
- requrired -> required
- guranteed -> guaranteed

in `tools/testing/selftests/kvm/riscv/sbi_pmu_test.c`

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
 tools/testing/selftests/kvm/riscv/sbi_pmu_test.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
index 924a335d2262..6a8818ac036c 100644
--- a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
+++ b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
@@ -212,7 +212,7 @@ static void update_counter_info(int num_counters)
 	for (i = 0; i < num_counters; i++) {
 		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_GET_INFO, i, 0, 0, 0, 0, 0);
 
-		/* There can be gaps in logical counter indicies*/
+		/* There can be gaps in logical counter indices*/
 		if (ret.error)
 			continue;
 		GUEST_ASSERT_NE(ret.value, 0);
@@ -446,7 +446,7 @@ static void test_pmu_basic_sanity(void)
 		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_GET_INFO, i,
 				0, 0, 0, 0, 0);
 
-		/* There can be gaps in logical counter indicies*/
+		/* There can be gaps in logical counter indices*/
 		if (ret.error)
 			continue;
 		GUEST_ASSERT_NE(ret.value, 0);
@@ -474,7 +474,7 @@ static void test_pmu_events_snaphost(void)
 	struct riscv_pmu_snapshot_data *snapshot_data = snapshot_gva;
 	int i;
 
-	/* Verify presence of SBI PMU and minimum requrired SBI version */
+	/* Verify presence of SBI PMU and minimum required SBI version */
 	verify_sbi_requirement_assert();
 
 	snapshot_set_shmem(snapshot_gpa, 0);
@@ -489,7 +489,7 @@ static void test_pmu_events_snaphost(void)
 		if (counter_mask_available & (BIT(i)))
 			GUEST_ASSERT_EQ(READ_ONCE(snapshot_data->ctr_values[i]), 0);
 	}
-	/* Only these two events are guranteed to be present */
+	/* Only these two events are guaranteed to be present */
 	test_pmu_event_snapshot(SBI_PMU_HW_CPU_CYCLES);
 	test_pmu_event_snapshot(SBI_PMU_HW_INSTRUCTIONS);
 
@@ -500,7 +500,7 @@ static void test_pmu_events_overflow(void)
 {
 	int num_counters = 0, i = 0;
 
-	/* Verify presence of SBI PMU and minimum requrired SBI version */
+	/* Verify presence of SBI PMU and minimum required SBI version */
 	verify_sbi_requirement_assert();
 
 	snapshot_set_shmem(snapshot_gpa, 0);
-- 
2.34.1

