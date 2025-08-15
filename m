Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DA720E31B
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 15 Aug 2025 18:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755282483; cv=none; b=caF1K2jyrRf5ZKaX6UNtmCxzSxqQKaQ9BgoDWNYIccnaRTd0TqyPWK39kkI1qjYNXgioiZs4pjbnufmffncK57FQr53q90ca4YQz/ghFs0VUqj/NIeqy44DL8r60/fp78bWDq6qwcY6cwnBWoYoqu9ZJ+gwH7M7yzeuRXzwDLHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755282483; c=relaxed/simple;
	bh=WcIeLS4ZXXoXdwDG9ZrZOy7xFIgwGO4Az7+RoIiV7CU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gq9n3Y67qiKegRpX+GjRxH92wsoGQwQ3iuQUf4Cq8VPhipFauXFpVAsrZIyx0+NnNJPSUbAaMkt55oojAlXVO8N7+vkHmGTWuVBsBt9p6eV1sCDHa7oQG/R2TT7t9iAz+N0Ce8w3UrxffarwoGjNYyY6NUEBDoFE1s2Cy3+TotE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Grdqjtl0; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Grdqjtl0"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-323267bc2eeso1716567a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 15 Aug 2025 11:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755282482; x=1755887282; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PRc1fd64O4J1Onrw7dVFQU3zu1pxcaQiGTVN2LS+H5M=;
        b=Grdqjtl0cKzGeU8JKrbxwWZOmtuVMDkvskhMBCsKKPY9lsPixLeXCnbzapvQUePRwv
         xmfHbxwKb0jaq0MsA1nAoYRcdly1Jux9N4X0IcDlBtKSA+2LjZJGqQtXWbVzW3NBWWqI
         an1WFpF9cyhj3S8+/VAqbDwUqqxnRS+4StgMiOJZVjQJOGx2W+17p4tV6ddCrsjNThMs
         3sQVVkE6NtXR/jOZIlAnfCJNS5OQvN48lO9++K2XtosiPyRd921cp/Ywsif0EJX67A1n
         90TwAHDtPwxvqYctdZOe0zngmge8uLhtXKugmyouCuxUpcYp07Xi2j+yFZ2dE+cVl7iZ
         fbow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755282482; x=1755887282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PRc1fd64O4J1Onrw7dVFQU3zu1pxcaQiGTVN2LS+H5M=;
        b=eBmLI7VDW43USQ75Z6zt6D42m3E4YeyEfxg9wNSYDoYt4MY/Nqg+mwYl3/KETbUeP3
         KlnmjH4X+DKLDrphtweMd0WaU9/1K8hbrFbopl+Z9yUVkbBXCta/wEW64Yi9Y3I8Mm/j
         NuT3/cQ5W0ic1t4p1+DUc3zLOVmt6e0PZnuir2j1wEiNFiucKSaoGBI6iwx7/MxvAizE
         d2mlMEGYn9m2cgEhYdghdSYHQEbBwU8vGhw21HflwoApMj2t6ZNoOYAWm4OqvOc5svlA
         sP6ChOcPeBwIU6mIIA8eSZCMLWMGwmY1v/Ka3EMp0QrBfxBUagoDsmt7h9hobGtDBF3I
         oq6w==
X-Forwarded-Encrypted: i=1; AJvYcCXZNGsYla6A+Dy2pS6y8HEk4kvlF/Mu8y/O3GRNsu09VOz/sDepnIWd4zcKOTOcfxkozw+EXAvbSkknrfl4Kys873uCTg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8XVqDrtRXwKhIpdY4JqvLNtSVoFHg9CDodkEh3svKGb0GXugT
	94A2yEB5OBX/EphV/UllBHtINL20LjAjhZ0TRHg6KPBH+qOqELUxQUob
X-Gm-Gg: ASbGnctZPaTOcne0dJVDdsx9ZGkA7F1+h8x3T0nxQjACE66haPrsbmFHZXudre/rjU7
	xUA48+MGFFgbKy8NJ8vPuXXHjhTcIfDsEOxLUQBQ4oLwv2DE8ZFScHtGHuufPIZkO2lWu47th9h
	jsWJaJ+17RmIxkU3cP3TigKwxssVWySGWTNM7XegSQ01EbEb4Y4ziNdPEJ6TFi6SBHM2PPNuTPm
	sWjN2TLLvwsH9i1BaHt6npE4EtIXd9rqU+MbVApYlzLAevGGTcBPpBC6SzDg6bPz85cahYjJ0BQ
	33+S28ydGfllRONOQ8nZTUFPtao3baQdoaovVfRRFZ7uydJTX5UURyi6dVDGg77RmisMq3YOkgj
	nUbDR+LoMgrjQ8E4gHAUthUs/yXIpaXKG
X-Google-Smtp-Source: AGHT+IEHD1GjcrbAdBd7la+otQhbrqDF5HpTciQ3G09/nn/3VnQgMLKqhY0XaiQcIXJt9SZb1N/YZQ==
X-Received: by 2002:a17:90b:3fc3:b0:321:4765:a423 with SMTP id 98e67ed59e1d1-32341ea7860mr4878289a91.6.1755282481580;
        Fri, 15 Aug 2025 11:28:01 -0700 (PDT)
Received: from archlinux ([2401:4900:93f2:6a91:9b6f:8f9d:11b:d64a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32343994891sm1791582a91.8.2025.08.15.11.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 11:28:01 -0700 (PDT)
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
To: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	kan.liang@linux.intel.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	guoren@kernel.org,
	linux-perf-users@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-csky@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: [PATCH RESEND] perf/util: make TYPE_STATE_MAX_REGS architecture-dependent
Date: Fri, 15 Aug 2025 23:57:42 +0530
Message-ID: <20250815182742.45541-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the fixed definition of TYPE_STATE_MAX_REGS with architecture-
specific values for better accuracy across multiple CPU architectures
including PowerPC, ARM, x86, RISC-V, MIPS, and others. This change ensures
the type state registers array size matches the actual register count of
the target platform.

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
---
 tools/perf/util/annotate-data.h | 45 ++++++++++++++++++++++++++++++---
 1 file changed, 41 insertions(+), 4 deletions(-)

diff --git a/tools/perf/util/annotate-data.h b/tools/perf/util/annotate-data.h
index 541fee1a5f0a..0dfb12a8f1cc 100644
--- a/tools/perf/util/annotate-data.h
+++ b/tools/perf/util/annotate-data.h
@@ -189,11 +189,48 @@ struct type_state_stack {
 	u8 kind;
 };
 
-/* FIXME: This should be arch-dependent */
-#ifdef __powerpc__
-#define TYPE_STATE_MAX_REGS  32
+#if defined(__powerpc__) || defined(__powerpc64__)
+#define TYPE_STATE_MAX_REGS 32
+#elif defined(__aarch64__)
+#define TYPE_STATE_MAX_REGS 31
+#elif defined(__arm__)
+#define TYPE_STATE_MAX_REGS 16
+#elif defined(__x86_64__)
+#define TYPE_STATE_MAX_REGS 16
+#elif defined(__i386__)
+#define TYPE_STATE_MAX_REGS 8
+#elif defined(__riscv)
+#define TYPE_STATE_MAX_REGS 32
+#elif defined(__mips__)
+#define TYPE_STATE_MAX_REGS 32
+#elif defined(__sparc__) || defined(__sparc64__)
+#define TYPE_STATE_MAX_REGS 32
+#elif defined(__alpha__)
+#define TYPE_STATE_MAX_REGS 32
+#elif defined(__s390__) || defined(__s390x__)
+#define TYPE_STATE_MAX_REGS 16
+#elif defined(__sh__)
+#define TYPE_STATE_MAX_REGS 16
+#elif defined(__nios2__)
+#define TYPE_STATE_MAX_REGS 32
+#elif defined(__hexagon__)
+#define TYPE_STATE_MAX_REGS 32
+#elif defined(__openrisc__)
+#define TYPE_STATE_MAX_REGS 32
+#elif defined(__csky__)
+#define TYPE_STATE_MAX_REGS 32
+#elif defined(__loongarch__)
+#define TYPE_STATE_MAX_REGS 32
+#elif defined(__arc__)
+#define TYPE_STATE_MAX_REGS 32
+#elif defined(__microblaze__)
+#define TYPE_STATE_MAX_REGS 32
+#elif defined(__xtensa__)
+#define TYPE_STATE_MAX_REGS 16
+#elif defined(__m68k__)
+#define TYPE_STATE_MAX_REGS 16
 #else
-#define TYPE_STATE_MAX_REGS  16
+#define TYPE_STATE_MAX_REGS 16
 #endif
 
 /*
-- 
2.50.1

