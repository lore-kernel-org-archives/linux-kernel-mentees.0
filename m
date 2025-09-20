Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146CF1D9663
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 20 Sep 2025 04:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758341983; cv=none; b=P4zd4PGloK9XeVBfCxDLIUhHdemPfwcjsP4VRc42l3nfnM5bf4P225z7JRqacnq2SrWve+fXOPp63+GS4trqDc/AfLkpR7bZA6uqJcIFPtI5rrpvWtZW4VqIda9ugMBrxShfhy/m/R+zdTf6yH0SL2m6ydj3zMpSrlI3k8M8k+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758341983; c=relaxed/simple;
	bh=tPb8ZwTKiJD+qGUqRVTvDMnB6kbRjplfxr68r6FEXt4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P2Wp0dXdadOsoRZtwW8cYOCS+iOVVMi022Lm+qKNVDq824xetbE9Kkd9y/WCe2fVze+wi1nFftHhkp/QXt9M2ohYTRpXG8DWsSXK1pP7slvoA/hgJOaZGThuluWj366nF3d48P2mGGyGTIKQRmAm0mPz8856qN38vGd/ZgGkZeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RdPBYxIm; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RdPBYxIm"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-77e69f69281so1355402b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 19 Sep 2025 21:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758341981; x=1758946781; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TtQtR1uGPAfF6Ic5yrjJTv73t4pCjLo/Eqk0WSj/PCU=;
        b=RdPBYxImgLGqp+xzZcvBNu5aOVGmXhxY5/TI2J19tOYiTn2bHYX2vbO+Y1IwcHv5Su
         fztTaLswYoqgEmN+CK0R2mSWyNA/A/tAqH7lyuzVYeW0j/630FtbWAVXKvo0kzLvOkFu
         L6RQtzGxShTEYzKfDAvm7ou9ILiRt5WMbssfSyMHYk22Dw/2WaMLjv6pRnU23A2gSNJI
         fTaaku0gF7JeWzIO3ghdm+lAb/12fjr/Pg0m2NIo+uzT/OpkZ0W5ummkQtfzNPII76lV
         zPISe1II2u54ryAE9ZFUf4tmjhWyT+ydKCw1CQZaXEoyKWnAF1OYXD3132PpOJUL/r7O
         +L4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758341981; x=1758946781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TtQtR1uGPAfF6Ic5yrjJTv73t4pCjLo/Eqk0WSj/PCU=;
        b=mkP6Pg4d8Dsxss4vKHoajSeXpZA/i+ujMdOFo53iZcZFvdPGRRxJmqL4EGXLSGaYrm
         Isujkyi1X1j5i0IkOsOhrJrB0qPKNACPT9qSX43HxMY2gTJJkIXAj3JkgiM3ftz3k4Vc
         TXmoTu2wAlK1xAN5Yt37kqJJqpnLYc0D2lAUjmUj8EtyyZ8rcUyz8kFUn0Q/8Xgbx81H
         LNNmfiKsgW6fYyPJUm2SRrUM9AXI+gNDNycfjkYNZEiqeZSwuTHyxBM1Bp6BNjP3q4GC
         ingzjuub3i5uQoxofl39hpw7J2Ho5WqMde1cUQ1cdrO6TVddv4iViwZK6jagwZhogt8G
         2AEg==
X-Forwarded-Encrypted: i=1; AJvYcCULRGfF+VQB0a3COoZcv0uAwILmqjzEu6G8w7UD7VOu1/KdN63w72Z9+kqzvSmevC6rXaVbvqXuMPaMhkyfLocGhXdnog==@lists.linux.dev
X-Gm-Message-State: AOJu0YzcefeVKqzMxK/2BPsERkZC9vYZjHvc5H/H9MtBK3sqSmVvRmnG
	ee6A507gufEyLvkZoBxZ5EtEPf2gsUwBcw6BWHLfZpp0OjnGDNVxWbYp
X-Gm-Gg: ASbGncuZ1hQhCoXhen0zp1bPffX6mEM+5t405VDyLSKte2gqcvh9Ni1DTEsPA3tZbI4
	CGXZS7kES1DCwDW7Fmg5AB6qFnV1EJ/pUCYN/xF0h2AaPHB4gWjwCnjgs3KWKCc3HExMDmEX2Bp
	QWHiY3xPj0FkyNY42z/rCNAGWX1PS9zusHwcO5sPh0gP8sc9Bu3Hc5g26Wr/qz2us6sJj7oJtYd
	OKyk4dtRaAzkQXLJiv8uB8bxfB3shEkwruOlc6o80VzRkhZdspumBg3UD/zlVQ+uUbEdUc7qmzz
	IQkGftcnlmJB33zCmS3mCCx3hweNzplUX+W//f/CHA/sxtaSJBShLPYG/gSm4NG3dyNU6Bgm32+
	fsVpXXHd72H9Jyo+UBXOrEfX1N0LdJQbp5PpcohUMYVVwW4OIurr2ptB2SJ3d7fGI5mpD8lhis/
	r6Xz7FngRcy4bV+w==
X-Google-Smtp-Source: AGHT+IGUEiDuSiuGJOo8KQHJULEexVcAUHHiZasqs4cUJt9M2KVq4dwuHSlb5BHYKooThmDf3+ENQQ==
X-Received: by 2002:a05:6a20:b917:b0:247:55a7:695a with SMTP id adf61e73a8af0-292148b82e5mr5949092637.15.1758341981154;
        Fri, 19 Sep 2025 21:19:41 -0700 (PDT)
Received: from debian.domain.name ([223.185.130.103])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ed2771d43sm9750093a91.26.2025.09.19.21.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 21:19:40 -0700 (PDT)
From: I Viswanath <viswanathiyyappan@gmail.com>
To: shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	david.hunter.linux@gmail.com,
	I Viswanath <viswanathiyyappan@gmail.com>
Subject: [PATCH] selftests: Fix Makefile to run targets even the ones in SKIP_TARGETS
Date: Sat, 20 Sep 2025 09:49:14 +0530
Message-ID: <20250920041914.7253-1-viswanathiyyappan@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the current Makefile, if the user tries something like

make TARGETS="bpf mm"

only mm is run and bpf is skipped, which is not intentional.

`bpf` and `sched_ext` are always filtered out even when TARGETS is set
explicitly due to how SKIP_TARGETS is implemented.

This default skip exists because these tests require newer LLVM/Clang
versions that may not be available on all systems.

Fix the SKIP_TARGETS logic so that bpf and sched_ext remain
skipped when TARGETS is taken from the Makefile but are included when
the user specifies them explicitly.

Signed-off-by: I Viswanath <viswanathiyyappan@gmail.com>
---
make --silent summary=1 TARGETS="bpf size" kselftest

make[3]: Entering directory '/home/user/kernel-dev/linux-next/tools/testing/selftests/bpf'

Auto-detecting system features:
...                                    llvm: [ OFF ]

Makefile:127: tools/build/Makefile.feature: No such file or directory
make[4]: *** No rule to make target 'tools/build/Makefile.feature'.  Stop.
make[3]: *** [Makefile:344: /home/user/kernel-dev/linux-next/tools/testing/selftests/bpf/tools/sbin/bpftool] Error 2
make[3]: Leaving directory '/home/user/kernel-dev/linux-next/tools/testing/selftests/bpf'
make[3]: Nothing to be done for 'all'.
make[3]: Entering directory '/home/user/kernel-dev/linux-next/tools/testing/selftests/bpf'

Auto-detecting system features:
...                                    llvm: [ OFF ]

Makefile:127: tools/build/Makefile.feature: No such file or directory
make[4]: *** No rule to make target 'tools/build/Makefile.feature'.  Stop.
make[3]: *** [Makefile:344: /home/user/kernel-dev/linux-next/tools/testing/selftests/bpf/tools/sbin/bpftool] Error 2
make[3]: Leaving directory '/home/user/kernel-dev/linux-next/tools/testing/selftests/bpf'
TAP version 13
1..1
# selftests: size: get_size
ok 1 selftests: size: get_size

make --silent summary=1 kselftest (bpf is between arm64 and breakpoints in TARGETS)

make[3]: Nothing to be done for 'all'.
make[3]: Entering directory '/home/user/kernel-dev/linux-next/tools/testing/selftests/alsa'
make[3]: Nothing to be done for 'all'.
make[3]: Leaving directory '/home/user/kernel-dev/linux-next/tools/testing/selftests/alsa'
make[3]: Entering directory '/home/user/kernel-dev/linux-next/tools/testing/selftests/amd-pstate'
make[3]: Nothing to be done for 'all'.
make[3]: Leaving directory '/home/user/kernel-dev/linux-next/tools/testing/selftests/amd-pstate'
make[3]: Entering directory '/home/user/kernel-dev/linux-next/tools/testing/selftests/arm64'
make[3]: Leaving directory '/home/user/kernel-dev/linux-next/tools/testing/selftests/arm64'
make[3]: Entering directory '/home/user/kernel-dev/linux-next/tools/testing/selftests/breakpoints'
make[3]: Nothing to be done for 'all'.
make[3]: Leaving directory '/home/user/kernel-dev/linux-next/tools/testing/selftests/breakpoints'
make[3]: Nothing to be done for 'all'.

 tools/testing/selftests/Makefile | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index babed7b1c2d1..c6cedb09c372 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -145,7 +145,10 @@ endif
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
2.47.3

