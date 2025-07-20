Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20A01E1E1F
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 20 Jul 2025 08:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753001960; cv=none; b=nC/yrqm4twmGdpbJCZT/tqq3uEj7zMkcDO7iVcgsGsex8+NzwqmEhjR8z5Sl8aH0bj3sT6W7wcBlwzoh6YI1Aym+TtJnoHBZ1tFbb3h1TA/Lwv58vA6vd8yAXdo4QLd5SuqFBGSMdyEQeraYrsGetBT45gcKe/HV+w5RRi3kSL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753001960; c=relaxed/simple;
	bh=M0bOc/j6BpQq1mxDARi3426daG4a2ThIlUeEdFrkC8A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X2UQznusMSk8WLSGZFfou6PG4tvGGr60A/Gk5ZteDBf1s6Ls9pvU6bBD9Nzxq8MJy+YuOUHgHICSSbdSeKR5rhEC/79mJ2IrWj0rgL3cw8o5dddtIBuqVotoNXPQP/qBJg0pnrYQc9H9Powzose6DLGAtFdLhZ/5bg0/+qCFdPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lybq5Ity; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lybq5Ity"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2353a2bc210so30132925ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 20 Jul 2025 01:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753001957; x=1753606757; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sA2xO3FkcLO8DaNf6KbVUYpnZ2ST2OFsE3flTGRsM5U=;
        b=Lybq5ItyC2UYKmValgz842rP15HiN7h67ApGLkpa9aO5DYyMMbU026BDKpYHU3sPpw
         YD7/O2436CMWXFNkUZTZiLliVSqOiGZ3yB3AXccZd2bftr3VHSIF04XHFBJ0wYiR6NZ/
         S3JmolU4Le6a91eDsMBGf7mQ79FbcU2kVMBdwx8IaDtLED4ALSHTllPWIGGVn1/obU3s
         Y82MElIG03SOmc+UTlK0t9TEZ98xqsyWSnNv1S4uggIeLoTi9GVuX8wgyiW2er2XoO5g
         ffakgL/iiNIQstjRFpmyvhyLcifBG8WXP8u+DCa2ROGUBL4PGd8pCLZb9YqHaoMSQtGu
         N7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753001957; x=1753606757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sA2xO3FkcLO8DaNf6KbVUYpnZ2ST2OFsE3flTGRsM5U=;
        b=viPPcdcuSSF7A40K7c8wPh1Zin2Kk/R0N1zHwRRQ6+2ezFViZERs9MH83FsmcmNpzs
         /kWE7q6O2XSaIS5EOD6NDnJDgQqGNQZrztUySJ0myB8Q/K+51lp+S7n+EQ4xysRPqipv
         qQt89Y5i/WKsjk3SB95w801VMLrOJTh/SAdT03j0wygJhM+0OIjeoqN/FU+9P/fDktHl
         IBNDLh1jklle3a2/8dmlDMXGoSxYAJXhe+U2Jx0iQ7pny/EU4VUFecaf7idKQS1SmHx6
         2sDvrMHYpwpJtotfQ2hbNPljrXaq73fRDTw1HFZ/6XRkC4hpCO0Gt5LJ5cBP6tJUF4zy
         5Jwg==
X-Forwarded-Encrypted: i=1; AJvYcCU6ZQPjsmu9QVTuKxmGmcxRRFW2rl0Xwv1Rd/LI/sIpQzFcV4AkH8JGWozjJTEfgCOwcGiEYcDYrnQh03PmRizMpaoAyg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzlJJac0RKFhjUtPMx+LMdopdnGwlw3VsImdVD6Dfu2Wj2kCA1h
	rnvwwr5lwkLU3Vx3aaNNKQVuKoJORR6cpeAa05B93DGIhfDOORzLd7BA
X-Gm-Gg: ASbGncvZG/A8lrHs70rRU8GjU1Mp7oIwDCRpxq2PJmZuqoiInadK7qorlCnB22zPznC
	u1cOKmicR+55zh+XBQokxEdftvX91+kH6DA8ik3MtxY3I92KA4iJzsMMQWcHRIv3jSoe/KuW2j1
	fH27kaKoR5wygiFCNQa1FC0UQ8umfIgaSp/B27uJ0u4etTvVx1S8MEi2iULeXofiC0iHFKVfIa4
	9/G8vzXHPFyd6TSLP3wPdfikWg2As3w4XIIYnkmE6mlXMMNdG9HAtYcZMTYTW8wmyCfpazZhNPn
	JktNs19QEASMfgqFHfGYMNITT2uyOu0fWEq7aVudmsGcl1sDeZRsJ+yJ5sBXcLkicGnE/K31kru
	TRahSiWezA4q9wucvwuvhJ5FEWFdt
X-Google-Smtp-Source: AGHT+IGQHzsV8pz3bryJ251pP0Aj07yt9omnf6sYGxLQAsHu/WuzEoDKSfTb4TUE2i34Lg2ek1yOHg==
X-Received: by 2002:a17:902:d490:b0:234:c2e7:a0e4 with SMTP id d9443c01a7336-23e25684a67mr227746295ad.3.1753001956941;
        Sun, 20 Jul 2025 01:59:16 -0700 (PDT)
Received: from archlinux ([205.254.163.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6f003esm39063405ad.221.2025.07.20.01.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 01:59:16 -0700 (PDT)
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
	linux-perf-users@vger.kernel.org
Cc: sesse@google.com,
	charlie@rivosinc.com,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: [PATCH] perf tests: Fix lib path detection for non-x86 architectures
Date: Sun, 20 Jul 2025 14:29:05 +0530
Message-ID: <20250720085905.192652-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing Makefile logic for determining library paths was
hardcoded for x86 architectures, causing incorrect behavior
on other platforms. This patch implements a portable solution
using system bit detection.

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
---
 tools/perf/tests/make | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tools/perf/tests/make b/tools/perf/tests/make
index 0ee94caf9ec1..565522408f99 100644
--- a/tools/perf/tests/make
+++ b/tools/perf/tests/make
@@ -53,9 +53,12 @@ endif
 
 include $(srctree)/tools/scripts/Makefile.arch
 
-# FIXME looks like x86 is the only arch running tests ;-)
-# we need some IS_(32/64) flag to make this generic
-ifeq ($(ARCH)$(IS_64_BIT), x861)
+BITS := $(shell getconf LONG_BIT)
+IS_64_BIT ?= 1
+ifeq ($(BITS), 32)
+IS_64_BIT = 0
+endif
+ifeq ($(IS_64_BIT), 1)
 lib = lib64
 else
 lib = lib
-- 
2.50.1

