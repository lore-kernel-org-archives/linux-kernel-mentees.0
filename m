Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D0C2F39CC
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  4 Sep 2025 12:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756989864; cv=none; b=gX8oiHFAgybgzX6WEiFRLojWGRa58QjXxSL4FYUtDX6461GOajaY8XmhUOg0OliS20UU+nUnb+6zKHkX9KOyiOWkXGFMux1CxQTIHVeR3qaKQsorC5YXHnpj+9GJv/Ls/SU6oit5eOp3Ot/Mx1EjAL64TA6FnVoS1QlctjG75PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756989864; c=relaxed/simple;
	bh=CMzTLzSuPzZSKmPCVID34LoXc6n8pN+Vcm6j0KSBe3M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=naeKp+jT4QSGz5gIzpMiZGBtFlW00z0zQX1r/Z09IUwfEfL1i1Ndboq9ewKo1HNQVtmssb1ElUjK3PuEyheqg52l0UhzMKtduF/dV+FSOQI2dlP5f9EAymE3fO93Bf0Ku47FIzH/hxkyvbuaroRP3yp5IVWmI5rc87O2JAA4JFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cieCsaje; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cieCsaje"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-77264a94031so725907b3a.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 04 Sep 2025 05:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756989863; x=1757594663; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+4TpF34W3PHvsBrekGwm1rvuPQAafzFCgW5mxOcoS+s=;
        b=cieCsajeAZ1Mf0GodLgg5CmJ/c2nFGTruzkKs0MvL8Z+MH2fq4zNXfyLSmogYEEJF/
         tpz2rP37WKan8BeeZd9pE97T4yil2GCyPvBjZvVUMOR69H66C7y37Y6FEEDTBfyJ2mIY
         aylSO39jaW5AeqEXLXlxtCGho/ba6Eq8w5mYQbqyA8fscDbUCyz53DTROYMa3LG+LMPO
         nReSQ84WDPVUp6+SfxmC11lXdhqerLi08pXhTSUOrXGdSVqalc8n0EL43TXd3tnt/zIR
         sfzya50CmXefr1h2l+cHx9rUF7wkU8fJYr4L1Xq5Zd3nWOJH1B6ZOEThXlrfWYabPYU3
         O24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756989863; x=1757594663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+4TpF34W3PHvsBrekGwm1rvuPQAafzFCgW5mxOcoS+s=;
        b=In18uZzI2CzSl29DpQ4LMxcbibfVS7t5gZa1UL8wVnK0lnONulCIkxzTUTzZJSXXFr
         soDGPcXJw8xsq0cxVHc88F/0jIMHhru32m/lGhFjh/BVNBlSEYJTlVtKwDKglTB+hdox
         kqeruRcpjHobSNkpYvr6PYcYLYI7t4OploKPjtcHfgRBaAFFLaGhCyd13JGeAyFTlNhz
         giOUKv5ycFU86WapNtbUu5SadrSKRQdanyH9o+ugjkJTpsO7j4UoTXlDgdOB+5LrY2fr
         ogBec73mQj0JrUwnxug6KhgfEn//NK0dCC8C3uulsditDIlp6s8KrQSOL06KLPSgm7Nh
         sIoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqDEI1YEUAWAgMrAdfvxFAormQgcmFk0FDyFa0geTqq3Xfo/Y/pmyzAzPrHKPlia3Ww2yw97yxIS3EoLtC7fiMvnbAyQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzX1uRLLFgIIKZNMt0gJzLWPaVpK75ntuc1igYiQxAo7FFmYDP2
	7LMvqbdRCNnKhdNlkV7arxQznf5Wfcpo08QTThSYrKwi3xVgGWlhHUrQ
X-Gm-Gg: ASbGnct5v+jr+tP8wPXcLBcVrA6uNqXkmODbP/R3uJE7fp9MN9BbTnpNYeHM9cgZWN0
	kgblACs6k63fGxpBvLuKyPrgcQQ4KrVwIUSvZP1RiBhI4+tdnFrwmGVgsss4lNp+UOP54N2P2UK
	Ua1l0le0SQteAgGh/IF2vUS7mUxYVRLqIugP5JIMgmxwH8zYkdpdZN7aYR/lnwtHh/UgGMFAGY2
	FhSqXQu/kDjNeH3ku+CNLoPIk2vdnmvjjmrolNIu93P+t8aUX0ZGHS0gEWW2+Kfd7nQ9LTEL8TR
	qCERz3S4qfZKjR4os0wITKsqswpnEURVs+DDFfgskwo8TzjRzKzkyFuqiNLpJgv969Ctdhvo8j2
	7+N4j/as/Lkk4+p2/41JFw5EOx/G2eiX2esnUzoy1tXs=
X-Google-Smtp-Source: AGHT+IG6ptwhAi2WTl+f7P5ZxhCvDz0tuMXhkbgEzCii/VqANS73LGKBj4D0rLB4cKm9/rE75RrMQg==
X-Received: by 2002:a05:6a21:7988:b0:243:f86b:3856 with SMTP id adf61e73a8af0-243f87ac36bmr15437336637.38.1756989862589;
        Thu, 04 Sep 2025 05:44:22 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4f9c35f391sm5854642a12.25.2025.09.04.05.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 05:44:22 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: maddy@linux.ibm.com
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	shuah@kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org
Subject: [PATCH] selftests/powerpc/pmu/: Add check_extended_reg_test to .gitignore
Date: Thu,  4 Sep 2025 18:14:01 +0530
Message-ID: <20250904124404.4425-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the check_extended_reg_test binary to .gitignore to avoid accidentally
staging the build artifact.

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
 tools/testing/selftests/powerpc/pmu/sampling_tests/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/.gitignore b/tools/testing/selftests/powerpc/pmu/sampling_tests/.gitignore
index f93b4c7c3a8a..ea29228334e8 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/.gitignore
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/.gitignore
@@ -1,5 +1,6 @@
 bhrb_filter_map_test
 bhrb_no_crash_wo_pmu_test
+check_extended_reg_test
 intr_regs_no_crash_wo_pmu_test
 mmcr0_cc56run_test
 mmcr0_exceptionbits_test
-- 
2.43.0

