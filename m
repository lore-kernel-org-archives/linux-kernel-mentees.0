Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750C71C5489
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 24 Aug 2025 06:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756016075; cv=none; b=DX1O2yQ5fTy8axyCnxNDGMryftwU088lEKvgBWrzP443jkVb46WqAeWhFtRUzXF6PdIFV+M25vDCkzdXMCwH3mzWtyfqEBhxJe8YY+4FIqNQvM/yN1IVNyM+PX8UJlWYgzn48qlLtSExnoyoXpJrrKHFhFgZyC60TY/lYLZRim8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756016075; c=relaxed/simple;
	bh=2Krz1q4dLXwXDvNiRnwBsAnhUvKZtc4rAuQ9af6bRPo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bhAoO9MmZ99P5slJciS6hnbJfqoBOUwvmfCAQs/HOi/t222A0ubH/rVlwCCLkhADIjG0K1SRh7MVT1Ae6VHH1uXC61WiXBZL/tQoNEb+6BTpwUpQnx7ASauqxLfNhyx3fGZmBeTMk62w9YUgQIz7S1sHn+pViBRZ1cb+e2I8uPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bC4qbN4i; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bC4qbN4i"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 104FD6147D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 24 Aug 2025 06:14:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id drHaY7BXfzDP for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Aug 2025 06:14:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=vivekyadav1207731111@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6C8AD60821
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C8AD60821
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bC4qbN4i
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6C8AD60821
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 24 Aug 2025 06:14:33 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-770d7dafacdso53392b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Aug 2025 23:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756016073; x=1756620873; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kp6ZpPi7OjGlmUly9kUQqc77MGv9H1CyM6s09oVZLEQ=;
        b=bC4qbN4iG3zvrK0mFvJZxNzmbkX9xeY2ib7slfJ8XrObP5Fsd4O3tkLlLGMjgJAPrz
         kbFOdP8ylRAIUoP1GBNWP9el/LCYdEdrOeaMBuWRlSe8atmxV2BNrnt0zZ7YrjpzUjfY
         4MpOl1TXEa0E73EM+XKOqvHufLatZc8aJscOLglfBWO8rczqn8MZUmLyj008JJ4ztmVt
         +xg2487PWO5qi+PuxSthRkgggKbcrBT9bDwpgGzeWfecz3rkONd0rAcUnbe3+AdhDL+x
         fokRWDcIlHNmX1xLYSpmDibMt8FBF/u7sdM3kIO/pjgXM9nvA9KZkNhKMXEnI3zxbcog
         fmzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756016073; x=1756620873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kp6ZpPi7OjGlmUly9kUQqc77MGv9H1CyM6s09oVZLEQ=;
        b=ULIwPiztUVJiJJqGysOZXHG3pdClAhq4ga2PF10aZNFPF0oML4/QdcMt5hdaUiOaXi
         W93+DL40xs0WIgxraWgElsvhdpDoETmlN8RwB7407KKgeRZjwCKcUgStkm70WJ+ZxFy/
         R8biK/YoX0fYH1PYiHjf25mdSuyN4edaBPTmc9xjEDwQlKpqUt/5YaG+4RJ/KbdiDwA4
         wrST0Fc6jz+UzRLHgnkaPFhTUSYLDfrffslBCD8PDN9VJeExl7+n52oPKUXJo6iAQXzD
         kufsVm8D3Jw1T+hHX6ZaLeeEw2OKgJOhUxonHkejBwdTDS9sG25YnUexJ7cVoVn2MQIH
         ffuA==
X-Forwarded-Encrypted: i=1; AJvYcCWJ4fF020hOT5myYjIDUq43T1S1npbyhNO+hCIZrCLCyNPfGmhtGjrECUaruQbf1PuOy6OYsyhJUh8c+BIpDIhaoQa3uw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzbOwEVgd6HzJcK0mHkV+g18W7OaAc/w6niWbU/d5hlo35sWkXi
	ozVmIUjqMpUKgpSDK2lM75jREMUKfKVIRFRt6jxgjVtmdJE+7sdDzEy1
X-Gm-Gg: ASbGnctKfqvyeFvR06wfemw+SNDWxoVVgs8NBaRplAesZCiAIMy/kS/+9FD1/ZvN3FC
	ajkR3MdvMmH7r9fbuXhP3dyKC46IrfmyV0MezcWmy6DY24L+ILRczILhdnhv+2VFcdwlU+Jx3db
	nLB0le89Z+YUSCva8OcSNEttgC0rGUM8WZJtadngklx/TDWv81B0sv+yS0ge7HZSlAzQLsREAR2
	iOVv0LIroeCI4pbzLSPK4yZF7w53yuQj4LoKPncZH7x0NaJc9Cgf5skogqmJ01vTUhGmhdVeEAa
	FcoBNyCBO0jD75NqbKKKVHZmzXEXeMbzbuLGw0kPSWj2GZYHkx0Gmggfwdy1YCdwXX+RFIKLJ0l
	3mfi4UisQnaYMW8KB38BFUTz41y8iWf9Uvuoo2XYkqnGIRe7B1LnL
X-Google-Smtp-Source: AGHT+IHTB0sh55lPsQjkIFNymMCMskciLiGeZrY5LBODEDl6ZzyrY2seKOgvSBVSBIbrFshQ1YI7Zw==
X-Received: by 2002:a05:6a20:6a10:b0:243:78a:82aa with SMTP id adf61e73a8af0-24340d5e73dmr12948421637.50.1756016072582;
        Sat, 23 Aug 2025 23:14:32 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d003:7033:ad1b:5a79:43f0:e247])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770529149bdsm1654943b3a.98.2025.08.23.23.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 23:14:32 -0700 (PDT)
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
Subject: [PATCH 0/3] kselftest/arm64: Cleanups and readability fixes
Date: Sat, 23 Aug 2025 23:13:59 -0700
Message-Id: <20250824061402.13432-1-vivekyadav1207731111@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vivek Yadav <vivekyadav1207731111@gmail.com>

Hi all,

This small series makes cosmetic style cleanups in the arm64 kselftests
to improve readability and suppress checkpatch warnings. These changes
are purely cosmetic and do not affect functionality.

Changes in this series:
  * Suppress unnecessary checkpatch warning in a comment
  * Add parentheses around sizeof for clarity
  * Remove redundant blank line

---

Vivek Yadav (3):
  kselftest/arm64: Remove extra blank line
  kselftest/arm64: Supress warning and improve readability
  kselftest/arm64: Add parentheses around sizeof for clarity

 tools/testing/selftests/arm64/abi/hwcap.c       | 1 -
 tools/testing/selftests/arm64/bti/assembler.h   | 1 -
 tools/testing/selftests/arm64/fp/fp-ptrace.c    | 1 -
 tools/testing/selftests/arm64/fp/fp-stress.c    | 4 ++--
 tools/testing/selftests/arm64/fp/sve-ptrace.c   | 2 +-
 tools/testing/selftests/arm64/fp/vec-syscfg.c   | 1 -
 tools/testing/selftests/arm64/fp/zt-ptrace.c    | 1 -
 tools/testing/selftests/arm64/gcs/gcs-locking.c | 1 -
 8 files changed, 3 insertions(+), 9 deletions(-)

-- 
2.25.1

