Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78ADF78F4B
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 22 Sep 2025 00:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758501905; cv=none; b=OdXnM5tjqq/3sSeI3M+QXo12Vkl+hy7kcupgYTF3f0sazFNH2yDKonlo8giyLl9XpQoCXiv4e4d/CJZHd2LmBBUwMwucwhkLM8U2ggke5SMaae1d6oRos0QzSvszA3jxtQyBFHFl1G/xj+tVlTcp07Hm8ZMTsSSrVAJVOZunXmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758501905; c=relaxed/simple;
	bh=CMzTLzSuPzZSKmPCVID34LoXc6n8pN+Vcm6j0KSBe3M=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=pPZtXYcHko5kCVt13m8phqrT8K1TXQJoyGBuMS3QccqgiNQr7lSU2mxV3E1Yh94V+d0XvLE7/4CcYXrUU5NytohZxPwCvnRUMeEceoKi2+xLE2AwaVFmbQ3JZUP0PFuaNvFdpgUTPDl+gLmAb5nrsuFCm3NSMFhWvMVal8lPhP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J0eHu11o; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J0eHu11o"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2445824dc27so40046335ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 21 Sep 2025 17:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758501904; x=1759106704; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+4TpF34W3PHvsBrekGwm1rvuPQAafzFCgW5mxOcoS+s=;
        b=J0eHu11oe7uCUtb2+POEweG0KlOBaeC5hbhjLz3FZe6RqxnKdjRy2pT1EDec9YvBAj
         x4jnS3HKHOUTHXpTHAv186hTlAOhD5C+ePizfzUunhLRCWPmImi+p/fML9iq37xK5yn8
         KiYaRvAf9HQSofNWu8qJfK3HMzfFprUnK3Rym9c1zYL2pP0MIRecFfLXumdj9pFUhmjc
         M0+yML9Y/8Zxiy8A/iwOsqtJEIxMS8/kuNUyv/Y+O3MTQSPFGBLaMUTcEg6P4IEMqqVQ
         gCS9tDUCHxU7s8sFnupJ6FinTw21dlgymSUGSqs9d8WyI945JE/E9rNihIgxFFgzVf2h
         RLHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758501904; x=1759106704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+4TpF34W3PHvsBrekGwm1rvuPQAafzFCgW5mxOcoS+s=;
        b=krkuVN31iUDE8hDm+6F3VkSfbKz6kqer8RGYgL8sMfgLI6skvKYf68hWv+VxNBuT5j
         YpNzT9sKcKIwHDKqHcd3O7Kxg8hvP59EyS6d33bS4NL5oRzx/Nqt3YXNdFZbYwnR43kN
         cUBw6PZoxQ2KzMHIYJKCm0IociNXN1PbN7DBw3f13/8goUjmIKZzpbd5qzLJpggAxC1n
         hFiyAQidaxy0m5Pf69kGIlVlt3byGpyeLWdWBAXRj38T/QmWzETVa/XiQUJ6k4wYDUPA
         I7O4RQXsgH4LQLEjnjTZNhxNsL+KHgxuiFau6Fy0GQeO77TIzIU7kWuhuwV9IPxwIOq2
         5jOw==
X-Forwarded-Encrypted: i=1; AJvYcCXMDO4zmckVWdWU8tHhy7/PGCHZ8L/B3M3jUY3yopATVZmt8r5kMsdgC8nLug2iSzmQZMNf55tnO1amQYYMHcOa4HkeCQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyiW6vcoYdqrtKacQAEsJCxZLhN3MqBzXKjhOciJOPqnf9IieZ2
	JO+URt3QXD3z1GPl5WOq+B/t8hGen2LMrri6s2NRZUj3TlBhGO3JYgy1
X-Gm-Gg: ASbGnctbJq6IXnI3K38fdZD1YYaMPMdzCBcqeBNI2RGOFla965giR29XScmfSRoENgG
	muu5o8JxTSHxqs+Zi1hoMI4U5F51twEF3eLEyq9pYvKKNjOuGmrb8dDwCbOGRAvztINB3U/sBuo
	rXB6i2nXouqOjlA+lJ0M8MGWGOn7GN27JBKnc8i1C/ShSqJ1MDMDSPpIFTv8JxwI9UGFUVpq3Co
	1aaC6lCBT9mItjuAaEYwo3BzubqpwAAUIznURvq51eg58emLSo1XcfOTGQOgAeW8sZgdlc8AsNj
	Y4TmJBXCSupoEcF/mMGZ06M6rQ5gZATF7oOu8z1AMQbtoCdLUg8Nbho44oyju2Cu4bMNdle7wHL
	Yw+fKbij1+uQkPms96dauCfKa7BGtPw+paS1Bha9SJ0Tj5yshT0/9
X-Google-Smtp-Source: AGHT+IGeGCeJGDQO792G7blZZbjio2dz2UzvLzPbvR3uVFdQj+v9IaRb+EMqbWNhfxxc4quvxfrw7A==
X-Received: by 2002:a17:902:cf4c:b0:267:776b:a315 with SMTP id d9443c01a7336-269ba508205mr140392845ad.32.1758501903638;
        Sun, 21 Sep 2025 17:45:03 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f0da42fdesm6769810b3a.66.2025.09.21.17.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 17:45:03 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	shuah@kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	krishnagopi487@gmail.com
Subject: [PATCH RESEND] selftests/powerpc/pmu/: Add check_extended_reg_test to .gitignore
Date: Mon, 22 Sep 2025 06:11:23 +0530
Message-ID: <20250922004439.2395-1-krishnagopi487@gmail.com>
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

