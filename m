Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6968B2D781E
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  2 Jul 2025 17:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751476638; cv=none; b=keFcUpXz9QLrFllnCEu0tsAxKbbxVhPJ+Q4VXF3rRcA4RPJ2zUNa8ZH0lQU6i13qDjxpzTr0RxemJL844KGE6pa/CB8Jn0/zDhGT4UEZiY/oaO5YfTUNP6z7G71RjerjapNVA/4BL2FFt57apqyqA3s0sC9V3E952XdIAlmxzXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751476638; c=relaxed/simple;
	bh=eysMrIQ62IHEN1IrnTH/RbeWmSOOIErti0LPAnDPqpU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nxwzu7E9rZCmjzBZgff2+oRsmH+hEPG9iaPkeqiWSMmpX7p5rjPwnCUtsUXNOVnUJzLdKfQFGE4aCzXl/Er2SYLYyyFwSEifDOH2jMUnd44NScVa41LfhQb1p1uxkwx5VQZU3xvCK+WA8mxmC3EFfM0jstze+Sm0sH7bRZFW8g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NxMDxdJn; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NxMDxdJn"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-23aeac7d77aso43619185ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 02 Jul 2025 10:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751476636; x=1752081436; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wcCtm9f7p6jwuZ0do6mGaH16Y08BotVqwa8c/wAtMks=;
        b=NxMDxdJn/JBxQ6OEh4UsTGBXPJSeDne3KKHjcAQX7bkMMaXGFqyS4mBzRnjjBPHPsf
         GnjB3XzdoC24H2UKbxwdaJXyfpyUWBSaRXH2r7BLQmVUvrc7YlzKobKSzacrKDnfd4wN
         rWtBlKbkswXbBJVRIPXyEvRrFAsqyZ7DeF39vPrDq9VgQFYttTYzgLvEk2c1WRDZ81Ij
         RonVx6RtNLeavX9M80Lye7YjnOOpOzWzqBNI4WyE3sIhzCVGUXwdI3LQt1m4ry1mj6tP
         7Q5Igl3So0Ofnjl8csJQpXbhFJNWv7oz2JaodI/mmZrCmAirjgXQOHAVcX/Em7Eq3GrX
         Ewgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751476636; x=1752081436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wcCtm9f7p6jwuZ0do6mGaH16Y08BotVqwa8c/wAtMks=;
        b=plHgKdYvXxUdvVbNd4uz/MKGBQFnaJ8/XnHgUSLTxHpCA/iCiv/jUC+4a9mZOdDp02
         /a1yKa/3E7Juycz7gIp+T6F9l1KePGcuzItmUIhB68lWB4cWWgauDxcyOtRhVNfWWVJ/
         TBfhFPulUuOHoL52Iu3vHmR/umU9IVXqaykOAbX86JreuuMnc3veEl67XYMWfi6du4Qr
         8fFi32qgS1wON0Wz54n8l1eVTRUmR9Cf4r9GoYp1D9GHruxJjvtzizveCJ6HmCNja3u0
         JhKoqBoAy/7z0D5QJuou7xfCmOo5KmXctheFc8bUrs1YxLocZtdfYcS20RvAVNztD+x4
         7Uow==
X-Forwarded-Encrypted: i=1; AJvYcCX5/jd6KFffVECsREI8GsZtTnXAlXF/mDHulMxvZGo5w5GP2kBELDA5dGtXy0kCYp7xJ3bjNY0fSmmUUuM4Z0oz4rtHSQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxk02qnMpgfyQ6l4hNaTGKYQKhH+1mlw/4KlkT+bLAT3irovTCp
	FsgFpHh/eaOfgDfGtCQZ+9JSLZvzaqwfXuhaAMIYeSrRauXKkLOVnGPn
X-Gm-Gg: ASbGnct9E3g5nIRQniRx5f+2S5F1ZrcK1fbmHtphCtjxiGzbOWJhdM+OHeqG5nq5yUc
	AaXkvD565e2oYmBOzIcAXAQwNKJliXGcbnAb0hy3hy8Z23t9EcsDkX07uRh9iTruQ3Ui7f32bAM
	wyd7BEMlC67JFai5H1mIeCF7Z87NmllQaVolcE/COL18BH/QuRKHHTC5coPpODgSdkr0Lka9oX4
	yTBXjdXY/qiUd/8IlrzsHx5JmI70dS5xB3hq+hUtU6fVk/3Z8KJpnGaeHiKFffeE/vTIGw03+TF
	eT9gmJq0qw3j04R2q8tAZd8BmYQDbb2j5PsfKo6ahU0WIIRvApwpJxFPNV1LEq3r
X-Google-Smtp-Source: AGHT+IGoqFyrVCn6Y1nY8V1kqw3Ktn3Uz+x2Fn28RGNMIDJoOM2Rf1r7mTP7AxkaWXBBJ0Gt2fEGnw==
X-Received: by 2002:a17:903:1b67:b0:236:15b7:62e4 with SMTP id d9443c01a7336-23c6e511dc5mr70706755ad.38.1751476635539;
        Wed, 02 Jul 2025 10:17:15 -0700 (PDT)
Received: from p920.. ([2001:569:799a:1600:a36d:9d50:6dc7:23e0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3b7a47sm138699745ad.166.2025.07.02.10.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 10:17:15 -0700 (PDT)
From: Moon Hee Lee <moonhee.lee.ca@gmail.com>
To: khan@linuxfoundation.org
Cc: kexec@lists.infradead.org,
	dwmw@amazon.co.uk,
	mingo@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	shuah@kernel.org,
	Moon Hee Lee <moonhee.lee.ca@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2] selftests/kexec: fix test_kexec_jump build
Date: Wed,  2 Jul 2025 10:17:05 -0700
Message-ID: <20250702171704.22559-2-moonhee.lee.ca@gmail.com>
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

Acked-by: Shuah Khan <skhan@linuxfoundation.org>
Signed-off-by: Moon Hee Lee <moonhee.lee.ca@gmail.com>
---
Changes in v2:
- Dropped the .gitignore addition, as it is already handled in [1]

[1] https://lore.kernel.org/r/20250623232549.3263273-1-dyudaken@gmail.com


 tools/testing/selftests/kexec/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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

