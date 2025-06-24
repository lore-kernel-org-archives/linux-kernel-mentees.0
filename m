Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706352E92A7
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 24 Jun 2025 20:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750796083; cv=none; b=MTqslbvzzX7ofSfo+DZr36t2u//1UuQK9c6zd+4zjJL7ud0yUDZcWR7bAwgCHNCzL/BQs1Ry94dom6XIHSos2QtoJ55/dzWoEkZqStUlqxOrx+6M1hmE33Fv+ZC0PwlBEO1eLCL1iaghhcV7J/Ab69cnTvilSlnQxCX64K5mW4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750796083; c=relaxed/simple;
	bh=uhIaBtu5nDYQZF29WnuRATZzvZFbAKVMn+fqJ5S0vyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eXW2JJkdVyWiG7uRo9H+3yDjuRUMlVOGoe+0GQOpnxjLbfUaTcrysniEpSIk3Jgd0u0eyLh2pMQzodVxrNHC8xJNnSVPoQ0TYx/u6tDUfIvO91aEj7L/lB4eFt/XmK3v4fsOThUxJJFsiaelfxzR4Ck1UP6XGPgKHYTrpOcwLNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=caLegeeb; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="caLegeeb"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-235ea292956so63012795ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 24 Jun 2025 13:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750796082; x=1751400882; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oKwNZGxUka13BV0lgvKYQ+62h1vPzm83K1NHrGIKb+E=;
        b=caLegeebQ02NxUQ44GB20grVm0deDjgqW4gtarP+Lb7jhxo6ojjrLsLOgasP3iIw+u
         ROME1sPNJqJIdHy86IEauCVglGj09Jf3b+X/yd+wjboNRAlbZHW6uxMLe63SqKk/mkyR
         821svSgGb72/401k4kH96gtY1i8/c6CGLHteJg14sRlHSHVeEghjRvm+6T/6Nc2+2n8W
         OJ4frOlxXJb5FlTyLV36gBhCMXWtrDD9iGQExpjiK0ttAoxYzlZC7RP4iJspSpgcr0WN
         Cnqx3J/7ZAQLUGH78XAWSteK5Xs+DMY4z7E5HCIogt0lWQUKQTbGErVvjhCdLoSTApCi
         RuMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750796082; x=1751400882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oKwNZGxUka13BV0lgvKYQ+62h1vPzm83K1NHrGIKb+E=;
        b=nSwIz+yNXmYR0bpN+KlHAgl0fTtHVT46iWoodRzHODYFFQsaRTk1Czh412mJu2sda1
         Mi+oY8SWzdOC5rqorH9FR/kXl4FIsALp/nN0a5vGX2qQcldRMxQhqtaiQzXo6f00SLB9
         sBhNvEO5V7Wj4Xu8l5qstf6HnqFL5gyRr2ovO3xEURqJqhp4QL/4JaYY33MhvdMHqGvF
         6JUz8XG1Q/Q0MZ/qZYlkwduIYc+pLOHbe2mitrJN3e2kMe6oVAv9kfUkRM6jmn16+mbs
         PbpC9XGlYOIFragDIFZkUkW+qki1eDb57ralv5frXicP0r3XUrjrkuDrVs//kEmjlDYU
         NpQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUv4TU8rStpulg538B/522wG3TGs4fMDq5O/pXEp082eMlXqsvFSpEzTvsj9sMeNp6Rc2pf3/UHyyO/x3KjtQNpmKepJA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7rRdGjLEtPDKWo7j8Aq24YjiDwqhzcJPnkz2+jsMcL0XoPSsn
	B2+Pqcbpbaaguc5P0NrTUOXorQIRdlUVhB9G+xLE++CVe7ueKyFrQnNI
X-Gm-Gg: ASbGncu/7iKn7x0F5/M5/UqOxDitWZYn1aSg2vzZ8fccWMLnB2NQ0azXe3p3x/Z1Xar
	hJNKoGDebqdo3hhCF7I2DQxAaRgvfZhqtoIy1afgTtgsAq7/jlXvWgNYhed8fpohehhiJc8qYlP
	EYP2z29RVnKyhJAmQJ2dVDDED4iDIBa+42DS9c7XAVAl0kp23nfrS+iNnlpvgY7oajWnte+aBMb
	9AI1aTI5fP3HD3pxDmXAkTuImuSaKKcuWfhmo5EeAPeUToEDkta7jPj1qItFcf2UDwyT0/IxLF6
	ce3fEUsmp1VFTuknIgB9ldzj5f5X+Ylq4Q+ci51xi5sInxdymRvvEAJbGZNL7Pa/
X-Google-Smtp-Source: AGHT+IEfzhn/g0z0I1uRydSMgKrQHJta/n3L63zk3PQzFdLue29xSPwQp4px+2tL4bP+pg3xXUTRzw==
X-Received: by 2002:a17:902:da86:b0:234:b131:15a with SMTP id d9443c01a7336-23823f94e3fmr11884165ad.4.1750796081719;
        Tue, 24 Jun 2025 13:14:41 -0700 (PDT)
Received: from p920.. ([2001:569:799a:1600:9f1f:4826:a6d0:7822])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a12c9b9sm15094476a91.0.2025.06.24.13.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 13:14:41 -0700 (PDT)
From: Moon Hee Lee <moonhee.lee.ca@gmail.com>
To: shuah@kernel.org
Cc: dwmw@amazon.co.uk,
	mingo@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Moon Hee Lee <moonhee.lee.ca@gmail.com>
Subject: [PATCH] selftests/kexec: fix test_kexec_jump build and ignore generated binary
Date: Tue, 24 Jun 2025 13:14:38 -0700
Message-ID: <20250624201438.89391-1-moonhee.lee.ca@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The test_kexec_jump program builds correctly when invoked from the top-level
selftests/Makefile, which explicitly sets the OUTPUT variable. However,
building directly in tools/testing/selftests/kexec fails with:

  make: *** No rule to make target '/test_kexec_jump', needed by 'test_kexec_jump.sh'.  Stop.

This failure occurs because the Makefile rule relies on $(OUTPUT), which is
undefined in direct builds.

Fix this by listing test_kexec_jump in TEST_GEN_PROGS, the standard way to
declare generated test binaries in the kselftest framework. This ensures the
binary is built regardless of invocation context and properly removed by
make clean.

Also add the binary to .gitignore to avoid tracking it in version control.

Signed-off-by: Moon Hee Lee <moonhee.lee.ca@gmail.com>
---
 tools/testing/selftests/kexec/.gitignore | 2 ++
 tools/testing/selftests/kexec/Makefile   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/kexec/.gitignore

diff --git a/tools/testing/selftests/kexec/.gitignore b/tools/testing/selftests/kexec/.gitignore
new file mode 100644
index 000000000000..5f3d9e089ae8
--- /dev/null
+++ b/tools/testing/selftests/kexec/.gitignore
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+test_kexec_jump
diff --git a/tools/testing/selftests/kexec/Makefile b/tools/testing/selftests/kexec/Makefile
index e3000ccb9a5d..874cfdd3b75b 100644
--- a/tools/testing/selftests/kexec/Makefile
+++ b/tools/testing/selftests/kexec/Makefile
@@ -12,7 +12,7 @@ include ../../../scripts/Makefile.arch
 
 ifeq ($(IS_64_BIT)$(ARCH_PROCESSED),1x86)
 TEST_PROGS += test_kexec_jump.sh
-test_kexec_jump.sh: $(OUTPUT)/test_kexec_jump
+TEST_GEN_PROGS := test_kexec_jump
 endif
 
 include ../lib.mk
-- 
2.43.0

