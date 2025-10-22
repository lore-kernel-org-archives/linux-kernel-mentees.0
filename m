Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03F62ECE8C
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 22 Oct 2025 06:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761114601; cv=none; b=UQSqhtwK2m4N02S0d3MsfmC7opc5XHxA4TOdErzAR6awS3Q/C8nC+uGev1VEu2JB3UwG8/xVIwPpB1U3FkSr2MUmtxlAcJ8ioHBytAdY4pKf/aQr3EenBDAUL0eKivot+VHg1UvFJtwSf97CKJMlq94JwFldTeRNBvgZwiNPS5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761114601; c=relaxed/simple;
	bh=pxi12w+zJvC4kZodhK0Ij6Jx0cFF+FxyL/tgy3imtgY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q9E8yRp9JnBmdDbWhbI/99LuDZotD7upZsBP2TnJHV7MttHSjewttufyjCLrfiMd/2By6v1rmbp8IqX4aa7wZpQJuEH9wRsJX6F28OaL1eGHQptVZYODNt1Ub31dYGUo7JMEYZjfQm6aB6vBTdKxItgV4Y75WXlGtstgVB5pF9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FEEV7HNQ; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FEEV7HNQ"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-77f67ba775aso8415985b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 21 Oct 2025 23:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761114599; x=1761719399; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yRyE8t6dhAXyClNR4lT1jQASjbYPHXa83JC4TjDmfbk=;
        b=FEEV7HNQBFQHufoYgReYZZPmsTZwfBBOHcV84hJhQYEdSnR1ZnDuQ2ady5AERIn8a9
         GNtuPvz2VTfPyLMXHPNPvnhcnHt5R8fSQoy+LdsbMXPFR2FBGJlbASpmCmixAseGeXwr
         4d0JIdbP6wpgq+fzXBzkJtsLQOa/ocxVdAhq9T+1MmBQb0PMJWa05SHGFm58Jh9ey6B5
         eKzUaI6BISDRts491Unt57HpAVuO5mRWX40i4+NK5OwcRIbKEMVHsLKyNVtWJUWQ/CIS
         yM4dbCAdXIaoeMF9yHPBiwWUyGDc96g7CnFC4sHNBToktK5VcwHHx3UKptkA498kljfk
         hsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761114599; x=1761719399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yRyE8t6dhAXyClNR4lT1jQASjbYPHXa83JC4TjDmfbk=;
        b=R0ea3GvebALYnlHSTaHTluZ06P9GCL3dYEViXu7X1V8xoyWWBgO7zoAj2jiuQA7hqi
         sZBe24m7GSdb9LxbexYten4EU0t4fXLf75i6JBE3+fOqDjuVTPFMathXJTr0YK/Qj3zC
         rQp3IBIS4v7SJ1dbpO5nSSVyHQ+IWlUqSAOLP6evXyWcDLAmNjAZfKMinxdQKC/XmWLI
         cVQjIzujqxB8z3AMBTiOqgfZhswWytQQE/3RP4bkcL2WqMBkcLhTPOsS8IKoLyo2g4zs
         E4+YyfMLj1+/RjH+UNZxBcONKZH0RRKGOzOgvSd5UX0UblEQip0l4Q+VHHyWOWr4sTU8
         /wUg==
X-Forwarded-Encrypted: i=1; AJvYcCUMmzt2gni9wnKcggAqAlQ64pZ6wdWGbZADFc8wQaKD/Vz5+l3uhSpbQS/hW3VCAeKw20Yn55E9/3gTdmaNGQjj2Ez5+A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyvC+G3CK9LCMB/sldCXTzLT6dNoZBksWVPEJ+e9X1i7e/3M2yJ
	aQIWM7hsGqsWeJto7qQzA1Nw38IvVFH5Wdj08Jis4TqhVaN78x5AVbVG
X-Gm-Gg: ASbGncszF5/jT1X6neXEMvPh4LxbX4mTu3xl5vK9UsnVWrWRJ1Fh73OywpPeFbRZXaC
	Zh5zve2nQoiNnv3pOIOwMHtN3tWqUb0oj1bJfW8JbPxKh0U1nGN2MwpfLwVgrRzcglcyUtog9hG
	1ithA2lE7izxUhgErhZco8soHrn9qfz40xSbWoyUNWHVAKlGW2HfGo3Nfeu86qGQkW03VAFjqj+
	zVPd/dnt1zaCdsvNByYTrz9YPx14YualzB0iamrH9qAeIVkDRnRe6F0hd+qCGLyv+lwJ+nCOL4v
	ofTTui2Ip0aGsXxIIe54ZpM5ddgYgLZu/AO6kUUh0HDqCFAHOxau1zDfftdFhq8XZfgbhSQt50C
	L7n7jOuLTF2BWLLfoXbFjJmUrJv0WueJFHG6GNcMCUGw2bEpPjr4MRBbcOlEMofvcbm7tNHwMRF
	5ycSC3F9eyvcp+OgbIJ7WtzooBZmWp64o=
X-Google-Smtp-Source: AGHT+IHCdWM1S/FVwbPmHY3O4OmTAtweU3JQt3Ila1Kmd/ZSXIEyZnlKVzKCFjwGH+txrzbmUlsmmA==
X-Received: by 2002:a05:6a00:84a:b0:78c:985b:8d3b with SMTP id d2e1a72fcca58-7a220b29d75mr20156837b3a.23.1761114599073;
        Tue, 21 Oct 2025 23:29:59 -0700 (PDT)
Received: from server.. ([103.251.57.247])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a23011ec97sm13408435b3a.67.2025.10.21.23.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 23:29:58 -0700 (PDT)
From: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>
To: naresh.kamboju@linaro.org,
	broonie@kernel.org
Cc: anders.roxell@linaro.org,
	arnd@arndb.de,
	benjamin.copeland@linaro.org,
	bp@alien8.de,
	dan.carpenter@linaro.org,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	lkft-triage@lists.linaro.org,
	mingo@redhat.com,
	reddybalavignesh9979@gmail.com,
	regressions@lists.linux.dev,
	richard.weiyang@gmail.com,
	shuah@kernel.org,
	surenb@google.com,
	tglx@linutronix.de,
	x86@kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Linux Kernel Functional Testing <lkft@linaro.org>
Subject: [PATCH] selftests/x86: Add selftests include path for kselftest.h after centralization
Date: Wed, 22 Oct 2025 11:59:48 +0530
Message-ID: <20251022062948.162852-1-reddybalavignesh9979@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CA+G9fYvKjQcCBMfXA-z2YuL2L+3Qd-pJjEUDX8PDdz2-EEQd=Q@mail.gmail.com>
References: <CA+G9fYvKjQcCBMfXA-z2YuL2L+3Qd-pJjEUDX8PDdz2-EEQd=Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The previous change centralizing kselftest.h include path in lib.mk
caused x86 selftests to fail, as x86 Makefile overwrites CFLAGS using
":=", dropping the include path added in lib.mk. Therefore, helpers.h
could not find kselftest.h during compilation.

Fix this by adding the tools/testing/sefltest to CFLAGS in x86 Makefile.

Fixes: 4d89827dfb27 ("selftests: complete kselftest include centralization")
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Closes: https://lore.kernel.org/lkml/CA+G9fYvKjQcCBMfXA-z2YuL2L+3Qd-pJjEUDX8PDdz2-EEQd=Q@mail.gmail.com/T/#m83fd330231287fc9d6c921155bee16c591db7360

Signed-off-by: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>
---
 tools/testing/selftests/x86/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/x86/Makefile b/tools/testing/selftests/x86/Makefile
index 83148875a12c..434065215d12 100644
--- a/tools/testing/selftests/x86/Makefile
+++ b/tools/testing/selftests/x86/Makefile
@@ -36,6 +36,7 @@ BINARIES_32 := $(patsubst %,$(OUTPUT)/%,$(BINARIES_32))
 BINARIES_64 := $(patsubst %,$(OUTPUT)/%,$(BINARIES_64))
 
 CFLAGS := -O2 -g -std=gnu99 -pthread -Wall $(KHDR_INCLUDES)
+CFLAGS += -I $(top_srcdir)/tools/testing/selftests/
 
 # call32_from_64 in thunks.S uses absolute addresses.
 ifeq ($(CAN_BUILD_WITH_NOPIE),1)
-- 
2.43.0

