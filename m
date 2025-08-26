Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B4F274FD0
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 26 Aug 2025 19:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756235839; cv=none; b=m9sV2b/K+L6xArIrhzbSwjRfHpEKswrgECyhCqcoJuRk+pMoAyhs9pEicbdWGXm9wlYjheUMkwPKxaUdRz2HEuzLbqaSCG467xeVlVnfw2JPhC+zApmxt9Mv640MQV2Q9XLKtr1DjEME01ePQY2cbTbacKGfrs4z+Ur3LafwB5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756235839; c=relaxed/simple;
	bh=gNMm1ipkA7fYFXUs808DPedAVS4Dx81omm25zB7pYic=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tjN7YKf/j4AzGQf/ryo7zb0jq8Fvxk35jhfWtlFNa/sOoT3GxBAGhsUSaMYf1YOgXfw6OoDSe3paHXCVLRaE5UGhKaiAK76itr2/4iogOj8V3p1+g6PJmPx8CNkQkxJzmL7kd6etQ7F5rP8ImQjJFu+e8hHnhCJnOjAxE/MvidE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gINKK5ko; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gINKK5ko"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-770530175b2so2443985b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 26 Aug 2025 12:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756235838; x=1756840638; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PDBFaIWBg/DMxV3REtEPNJhHpj1jRSoIbPqwKvfDfdA=;
        b=gINKK5koK9cFFccW65OFDkmQ+TZ/ywIvB8MafGoWh1loDiyIrEeCBYJzkpRNs4kqm5
         dPI0PdVeXSJwYnJNT/5o+VA/7QZwN1uGOY9ISkPI2mMcIJd8y1T3lzAGj8yjkyUjhZxx
         knPFgVprDYWiI0zaC1BZCBUIGt4bhP3w/c9rZ5641OyxRIAMJD5xjfOPpAmGqHPJLnYA
         oLFmSrIMvabc7ux9ilGD1PimbrCCIwmzYQJIH8+joJpFb4wVnPslvsMldvVDOvASOW0B
         FJ/imROm2fNxtoIhhzNpbEvHYXwBHypznUkFIpAAHuNmv0bseQyrs2Vviqfb//d98W7h
         /gCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756235838; x=1756840638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PDBFaIWBg/DMxV3REtEPNJhHpj1jRSoIbPqwKvfDfdA=;
        b=BhSCToEPr3vm6dDhDDJtBIga3uhTNNxVI+poXUmo+JiqhQFG7CPqMOBdioOStVfcwB
         au+VyKsa0uEg7D/FNNq5NTUhSPfC3AaLSkIx2V9LU4Re5HmUEJUC2MIIWbIgKQm02qIN
         gAmGHGF/v86Or9Bn0OVWiV+qJHHdxFLLkiT+qtxLnsnxYx85SV6IuuwwzBEQg6QdUElW
         0ZQKxZBq8JuL31OjnIi30nahs3JPIxhhtBYYmeAD0ZOjFKRHR34+ygG1FHK+TxVvzWpg
         HBa0iP3gOSAKni+gZbtZUgmCcEpLVXPiIEAFKrMx8KxD96s+9vMTuPD4NeoEE5MoQ9ON
         ScMw==
X-Forwarded-Encrypted: i=1; AJvYcCW/pnLQomS7UGpf6qBlINa1NPijHX/Lu7U/bUFFFNZ4PHQRu4FplwPUiVxqWJVu+P+SVmGd18J6Hfs+fAJusq3vnhgByg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxjMtSBCh7pOzWSi4CaaBMMAJc1Hs75HHBGdcaQTlj26Sp/Iclr
	5VLLWuSYQDVoMNxI/33Bokx8nJfOJ/HaYKoP5hkPEDy2PIYVJplmB+L1
X-Gm-Gg: ASbGncs1krUGp0Pax9j2WTt7cesWtynl/vv7OsVyFholWJzV4VCPCkw3DTi3rZ2U2Fm
	/zFXGNnLOHtu0X2qG9MkwMRQZIoYXmjFR4LxX47vvxjLMLzg/gFrieYp16wtrLa7fppQt3TQ7IP
	/lPmPVOjpZe933u52eROFdIS4YBCSNh/U0JN+ZNog70VpOUoCxk7MJdOjrmiUBzlMpOtNwmW6o0
	x3udG6V5h+jvFi6MyEd7AwoM+K8vunxiZyZIoLHYgn+Lxuv/yGznKCy+vR0xcTAh5DF5PvyH3WA
	zsucxdoCso8hEwSOBN0BjVeTiRj8AEoHtO9ADH5rWFEe9+pEx5F5+5oJe8Ano5HEKpJECK3mzYf
	kufvQzEFXpD3TZK6jat+GzLwo2HyRsMFGmE/9YTqpjOBEzoYrIdswW7VrQyqR/Wgp9loq7/U8
X-Google-Smtp-Source: AGHT+IEOTMNZIavUM5Iy5LIhtD1rVyHR5OcbyDpea0cdJbuixhaLMio9pOUj0ms7qn7MPHtCu/uxQg==
X-Received: by 2002:a05:6a21:329f:b0:23f:f934:19d1 with SMTP id adf61e73a8af0-24340b7ab44mr24060127637.6.1756235837661;
        Tue, 26 Aug 2025 12:17:17 -0700 (PDT)
Received: from linux ([223.181.113.247])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b49cbbbbf5asm9754443a12.50.2025.08.26.12.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 12:17:16 -0700 (PDT)
From: I Viswanath <viswanathiyyappan@gmail.com>
To: shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	I Viswanath <viswanathiyyappan@gmail.com>
Subject: [PATCH] selftests: update SKIP_TARGETS logic in Makefile to allow running bpf and sched_ext targets
Date: Wed, 27 Aug 2025 00:46:59 +0530
Message-ID: <20250826191659.157458-1-viswanathiyyappan@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

update SKIP_TARGETS logic so that these targets are skipped when
TARGETS is taken from the Makefile but not when TARGETS is specified
via the command line

Signed-off-by: I Viswanath <viswanathiyyappan@gmail.com>
---
Currenly you can't run these targets by overriding the TARGETS variable in command line due to
how the SKIP_TARGETS logic is implemented, i.e. bpf and sched_ext are always filtered out.

 tools/testing/selftests/Makefile | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 030da61dbff3..42ff6bb4ea87 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -144,7 +144,10 @@ endif
 # User can optionally provide a TARGETS skiplist. By default we skip
 # targets using BPF since it has cutting edge build time dependencies
 # which require more effort to install.
-SKIP_TARGETS ?= bpf sched_ext
+ifeq ($(origin TARGETS), file)
+        SKIP_TARGETS ?= bpf sched_ext
+endif
+
 ifneq ($(SKIP_TARGETS),)
 	TMP := $(filter-out $(SKIP_TARGETS), $(TARGETS))
 	override TARGETS := $(TMP)
-- 
2.50.1

