Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A4428A1E7
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  6 Aug 2025 15:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754494486; cv=none; b=fbSAJhynkyvKLnLom4sL2736Q+UIsgQIbch2xzqEH16rZX3jGIt1pP+pZvXXc3JzVbI/A4hYoz39sbx5sUFKMprKfCNnK1h2ptYdvcjMhtLLPSdEuliVB0wgNyyxnF/Y5SHRU7xVkeLnN8xhce2oZVYPKrjke2rObzjvtxVzYIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754494486; c=relaxed/simple;
	bh=l+BjPJugvSX1xnYBlRpydXaOEpnLR9ZZrGzevonqp/k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NauM6cUJJoQBbt0+Dj91vVIQPZHjEFv5nBiKSLtsj1WZ2MlAvnOtGTbkaNpS52/d0WJbiapv6fWnbyKRaK8Zh/pzK0F6c8+NgEl782gKYn5k2XvBSQCxGyjZUMObDlMcJrp/DC5bM7dfjJrII8RJ3AoUvCzSJMwTaV5ZGYvH4vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H5yTGwJ4; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H5yTGwJ4"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-76bdc73f363so91535b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 06 Aug 2025 08:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754494484; x=1755099284; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G8FWAmyygJI9ykU3sqCpkELXQA+zPUabO2nOc+Pr1Qc=;
        b=H5yTGwJ4CFMXkCoXmxKJdSDXPiqwGfWC+wMxoAzCWI4pg1pfT12xsksxGVOBpl/rhp
         inCoWpilgjhqRs7HrYtrf3jtFIwGvElb3PUkCfa+ee7VFtnyVfbecIzV3zXoeMTDfu0i
         AaPsuIxY9DjZahcVrpPXYAM6C4VHvQxQyHsC2+/DU+8M4VQ1qhbQTnIua0eStlqJMOF2
         A2y5yNbTTWAFWsOBOQjgLW5B9aEPLpNUMFL9z3aDErUoEkpuEHXjlB2p+a8LGZKlD+FD
         CkNlOVvGglJmIcuK8pkv4SG53BgaqqVoZOCWCcCJH+oDZkZM9/R8581eY3IIo6DCw9OR
         JOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754494484; x=1755099284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G8FWAmyygJI9ykU3sqCpkELXQA+zPUabO2nOc+Pr1Qc=;
        b=IrgUCDEGvxl6zzX40DpJaTUN+qb76O6wLdYUGd8fM1H43eODI2oj0FSPSGgm5vvXE2
         mosBEBGiEt0XEeSYoDvv3nwVA9WgKQYGQKgWp18IDVs4FZU4jc0/1/yyQPtIazq+yusd
         CO9RDOwUTxR98I7lhA5fsyf9gyvWQaX6bN9SPJE2EVRqs/7EA4DUyO7lp+6T0Y6UMEFc
         gbf2uFqRYwAtg5eVxFl1oL1r3lM+dM3WmBpKxf3dA2phE6N5lftKe7j49TYx4kjmc+am
         5a71/VkAm1edju6FeE0/98TxdJ3vpaMCsD6fEY/XotQS21D7w3hTvNKiqrpXrCZBI8l1
         G2dw==
X-Forwarded-Encrypted: i=1; AJvYcCX9AyVJUeiODBRSAdI84OnpVeJsCQXPLxwwwBkJo9bFpXApJaAPtnpUtqhBR9JDhX+3vXvJUo04VGIDRDNcbE+bQQeFlg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxo+ENOrbKMpaJjCT/HyHUIrJ7ZyB/AFjv/r+nKtHFhmuw3YmXf
	KRe9S+rs+YmIKFi3obPhhKtDeSUG7VHWrYkPyNZQc3A4zS5btaei+5ns
X-Gm-Gg: ASbGncu0MxR2RbIVZGfXwdF0z0KfDUfzAk3ipavmcV+yRrpzyB9W9t6cv2wWoSgIEQt
	xRIa+Tvi+ix3iNRi6N+tM4dTnbQa4z9fKGSXRUrAXGwTeeOiGoCy/Sti1iLlOPBLDuKq6y4hucO
	6omQoOewy9nDPOK/HBlItDxeaGCxt/Pi5tLBarbcOU/C30ofLtvw4Pe4y9jfks7ivWxXuuhKXQB
	8PamCkDEAhKS/fS7eimhyc8L+bjzxBUAuuHxiYrH5dSDDf1UzWrppYzJrRwTmutNJkwbFjD7aP+
	HJOcVuD3kHVDN3KRvCOz8hOhzS/UzqVVF/1i+USHqzdPMgxuDJNxyE8h5nGxeivt8fIwJ09W+xa
	enHNv0hEod3oT/3QiecnoJ0FUjuTZSHGNd57rCf8b
X-Google-Smtp-Source: AGHT+IE1mEFPS1/GYteQGs7cvs/+9c5s9KgpQScsfzp5Wld/S4EMQoGCuFw6NzbPwLhiL7WdxjTiFw==
X-Received: by 2002:a17:903:2445:b0:240:99e6:6bc3 with SMTP id d9443c01a7336-2429ee8b919mr47219875ad.20.1754494483441;
        Wed, 06 Aug 2025 08:34:43 -0700 (PDT)
Received: from archlinux ([205.254.163.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899d28asm161899175ad.142.2025.08.06.08.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 08:34:43 -0700 (PDT)
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
To: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	darwi@linutronix.de,
	sohil.mehta@intel.com,
	peterz@infradead.org,
	ravi.bangoria@amd.com
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v5] x86/cpu/intel: Fix the constant_tsc model check for Pentium 4
Date: Wed,  6 Aug 2025 21:04:33 +0530
Message-ID: <20250806153433.9070-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pentium 4's which are INTEL_P4_PRESCOTT (model 0x03) and later have
a constant TSC. This was correctly captured until commit fadb6f569b10
("x86/cpu/intel: Limit the non-architectural constant_tsc model checks").

In that commit, an error was introduced while selecting the last P4
model (0x06) as the upper bound. Model 0x06 was transposed to
INTEL_P4_WILLAMETTE, which is just plain wrong. That was presumably a
simple typo, probably just copying and pasting the wrong P4 model.

Fix the constant TSC logic to cover all later P4 models. End at
INTEL_P4_CEDARMILL which accurately corresponds to the last P4 model.

Fixes: fadb6f569b10 ("x86/cpu/intel: Limit the non-architectural constant_tsc model checks")
Cc: <stable@vger.kernel.org> # v6.15
Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
---
Changes since v4:
- Updated the patch based on review suggestions

Changes since v3:
- Refined changelog

Changes since v2:
- Improved commit message

Changes since v1:
- Fixed incorrect logic

 arch/x86/kernel/cpu/intel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/intel.c b/arch/x86/kernel/cpu/intel.c
index 076eaa41b8c8..98ae4c37c93e 100644
--- a/arch/x86/kernel/cpu/intel.c
+++ b/arch/x86/kernel/cpu/intel.c
@@ -262,7 +262,7 @@ static void early_init_intel(struct cpuinfo_x86 *c)
 	if (c->x86_power & (1 << 8)) {
 		set_cpu_cap(c, X86_FEATURE_CONSTANT_TSC);
 		set_cpu_cap(c, X86_FEATURE_NONSTOP_TSC);
-	} else if ((c->x86_vfm >= INTEL_P4_PRESCOTT && c->x86_vfm <= INTEL_P4_WILLAMETTE) ||
+	} else if ((c->x86_vfm >= INTEL_P4_PRESCOTT && c->x86_vfm <= INTEL_P4_CEDARMILL) ||
 		   (c->x86_vfm >= INTEL_CORE_YONAH  && c->x86_vfm <= INTEL_IVYBRIDGE)) {
 		set_cpu_cap(c, X86_FEATURE_CONSTANT_TSC);
 	}
-- 
2.50.1

