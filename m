Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9246725F7A4
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 28 Jul 2025 11:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753703868; cv=none; b=LIi9DXTZsZnO3PmhwKsLpQOmC1jQvlB4Nq28GSMtliJEEMikqZE/WkbVvWpjkGzei8WwpUTv+pdSC89LIBlRvxXQcQEmecIt0Wejbhg+5OJGpHZUb9IVfx3/11vKMiX6czUUPocLH9Zx6+gt2nDfo6ErfHiLND63vqb1Rd1dDDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753703868; c=relaxed/simple;
	bh=ZtT1le3P289gYN9XnvFtj8YV9WSOW1LkgpFqykFEcqI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GFHCBh27LaJhdvDBXilJEaHbQX7ddF82laac9L/CmHxDd/EwpPt+5akkQhMLerpoRS7j7r58NmQHUHubuj/yFbvRlGUcPQPW0toNMo3cpWMEGtcgBPH5HN+ae4QyEkTRNfxWLzm8la/rS2Ir1gUdWXr34FgEX8yD5o3Hf+dAWcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eWaA8Msb; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eWaA8Msb"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-234f17910d8so36953885ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 28 Jul 2025 04:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753703866; x=1754308666; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7QH1fCvQmnSC89vnVLs/2ja8LbLIAQjyBUi34DkOfb0=;
        b=eWaA8Msb5IMGLO9ZkL9foR5Wf/yueeHJxuqUM/dfa+zYC4h3AUF/YNxT23YbsjleSx
         36LSBdj8rxgly2YdvImT32HuPG+Hjayj3qBFpXmWP4rKIEIAtCISmz23f7041FlFcrFw
         D6FkIcmTLNxWuhN3GiSvOYgTCzWOSxxvqLaLt387CNRi1qj3pSkF0eZpQwzWTD1cfqVr
         DwkTgT8WoUkd+t2yOREDqfb0CtK9iHvBs5CXVPwhNtturz1cyql/banI00YiSZrkHDZ8
         ZmgJAGGfutAqfeCssD2bVGZ/PGYCl2qoc8bvNZzmgNaxKUxK5yaNDQTpDqW0UuUh8FuE
         8jUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753703866; x=1754308666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7QH1fCvQmnSC89vnVLs/2ja8LbLIAQjyBUi34DkOfb0=;
        b=TMrE6/u97goIPOsyEWdRFlE5lF2oO2zrYuweUcIt96KMeoPs53w0NQMEjnDp+Mub9l
         OL5ISLElWB3iqzrZNlSK62OUVfH1W3UUOw1ybnugsVNvEHC/8JkZytS5vqGjJOFykFxT
         8hOa6Bg/rD1zNklvuPmtQhewZuKkurYKBmjKGohQQgvthAwJvp+O1PQG6eY+zJxiWssA
         grVlVM9ypsCzYVXKXaS1DVcPtEC9/dh4c1A4DkLJOhfE4P+lJ4ZO1X3z64gi3cBAjgp1
         WF8VEvAdnHDr9nqkGJHrYz6qN8mu5Yro7RavlJSKrcw5FVrGWXptdUmdR/iYVBNI0Qzd
         r09Q==
X-Forwarded-Encrypted: i=1; AJvYcCXEG0NlQ9CUXTQMmO3KoqeuBWTlVn/KBQCBuF3g6CEsO1XZI0fVPA/KELMfDBfbWgYws/7K2zYY+qww9tGs6Bgm1m/Dhw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwsmZOd2xeI5Shzn5bhbbPbhzXEfoOekZkPCBouYbiX3ZcMLc0O
	lZq9dANjdRXkFcQAVwgwm/sEv6H8BVQ30Fo4qoxfm8Zxf3VLOnIpcAKF
X-Gm-Gg: ASbGncsBP2eO7ijblDR6sa+UpRLcyIulSlFrOHS/X3LqTx0VYSgUy2oj5PWxFt6oby4
	roGI7D6wMAgAYrJ94e9Dn+2jhP3B+rL4i1AHeS7vil/xdVvDpshv0D+YolTSSD1gC5IsJPCa8V0
	gDEAzjpQlWSd/KoXH3/RO+m0X/JVmLoR7cINH2chOjObO8cxr6zi0OLzWKnkFZ/QiAw31sSMPVu
	2DcZdiGrxJKQ9OWJZ+eEep3+hhl32y8XmJU3TvgfqJyVH2MVjXJcWmrvzQ70Qi7vocxU0gRnD7c
	0p6rQ1IRHcYtlIphJJ1ErwfpVOTW7/J3cGhWCmWXB3+0NNsa1KGiy/fMyXV8oj/hSQo7uqTU5Lo
	xU3HFFW25UBDymn9RE+WtR4xDinrtrBSuT0rHosIkFSCpONjsJdcm3ccL
X-Google-Smtp-Source: AGHT+IGVkxhzM4QAYwzySEvOd+NXUqVS/Jgx0EE1xymZXd3jvGCDUW6EzJ9xB7Zw08erZmtjmgDO+w==
X-Received: by 2002:a17:902:f546:b0:240:44a6:5027 with SMTP id d9443c01a7336-24044a65233mr19422635ad.15.1753703865413;
        Mon, 28 Jul 2025 04:57:45 -0700 (PDT)
Received: from localhost.localdomain ([38.188.108.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24007d98b25sm30933685ad.97.2025.07.28.04.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 04:57:44 -0700 (PDT)
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
	atrajeev@linux.vnet.ibm.com,
	kjain@linux.ibm.com,
	linux-perf-users@vger.kernel.org
Cc: linux-riscv@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: [PATCH] perf/util: make TYPE_STATE_MAX_REGS architecture-dependent
Date: Mon, 28 Jul 2025 17:27:19 +0530
Message-Id: <20250728115719.143372-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.39.5
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
2.39.5

