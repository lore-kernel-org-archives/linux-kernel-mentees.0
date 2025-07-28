Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4A3BA45
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 28 Jul 2025 18:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753726179; cv=none; b=HVbQR5KrqssdcEEfpC0F3YsNKQIsimgUT3u87STBATFX4OoNwXXODtt2sGvnw+u9RIwGYKY97o5oXXGnU+nZM4I5Vs89rcZLxM11mYoX9s2Ob3nt2OpSw1X8WVRCryEeiIVe2EsHaA/oq4REvDVbJjkpGY/YkvsZYGGamtnRlAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753726179; c=relaxed/simple;
	bh=+FlY3E0ZjRA607mo18/5+bEouVj75CIuQzKLKbjAlSw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GPgmcAbMuwHgq2+pzFX/bZGaJO0Lh5gio7CDm42LveFyVwwX4HuPv8YQZLx+A2n8WueE7FMOLujWjTYrm0HysjYPGVB59g2Yrf/5IPx3VfSLQ8IeL/d4VbFy7Mab7wxV4V7WKNSXBnlCLXb0dtlrHumhr7PCqOxZdCQ6kFcUrXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FHMlVZ+z; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FHMlVZ+z"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b390d09e957so5094327a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 28 Jul 2025 11:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753726175; x=1754330975; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NFyuFpUhZphoYk4DGQ6VvTOXkhHNbgDR8X4Cux/T2KE=;
        b=FHMlVZ+zcXw6nC/nZ/+NMvjh+jJW08/2F1kcCtmcd7F9YQrjQasUay743pZSWBnhQE
         fdsOHagMzTAbWWldJuhOuKX9uV2iLgAxp95A98Raq+bV6z+580gcymOSP4KEenPkSDYJ
         /DOONWQpRiW2dqD2r26fzPQAB+/KNIkIrOSBjQrZ3srVOYpye72U4m2JzLqzBJvRX6Rm
         0Mt9Hqus1+fOiXMfez0wuCIpGm80vUuuXvdlJolTIkst/hDFeU0xAnpTAqMidZxL5JWP
         5NkJr82kw9+ltkoq/kFpU9USqGrM7F/gvyvcZlwUTgZv3YSz2h+DtiBwjmlTwbAn6+zJ
         nBzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753726175; x=1754330975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NFyuFpUhZphoYk4DGQ6VvTOXkhHNbgDR8X4Cux/T2KE=;
        b=bO9cGcjnYzrv5u3HpymiN5jVzc5f0rmzJuRQ+al/hTsGBGbMwHyDlh+dcZGMtxLcoN
         4wXGDDNWk/PU4il04EAKV4gkTxg2H9bH5TRo1LjOh40nu45AzP9J2nhFBO3511NwjD3y
         1if1l1oGZXpuWbmbIa08KlrF1ou07Hk4LC5JZ6ep+MfZVHjCKiONwDHeEBVx9xEwwzo9
         w5+xegw/l2nWaBiulJF86O0TzoHScTH16Rrv0pW6E2L1e/fmh1kjwSnfD1JzttnAqdbj
         iTWEO1T4bN2K8zJc89PEDuvkcBFPmRzpgXBExKgnhh9iZYeY0i8Ux0gcd1j/fLRpfcSL
         RsSA==
X-Forwarded-Encrypted: i=1; AJvYcCVUFBawTBNSg5IvB8Yvx0j4sqRrtD05EvhicVeX8MEBmbqMSCJR4T3JoS2mSYhOZgMKkr3oqiVoqx3mN/KVwzuIlVfYkw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6e7zaBaVvQJ+gosERZs8QZ4rarfkN7BVRt/3kc2UwrpUGNqDa
	yWdfUYaVikfvQBB6a8pIU1foM9ZgrYIbI0pO/NkIa6sOoVGQp8rWX1fe
X-Gm-Gg: ASbGncvPkjHequh8+kuC8y2c0iSQ9D3rMVg69G3LgFlw/VbXCz/ahrwr7piJ/JrjeuE
	6wxI4gAftpJbBBWdabaw2Q8qmQyEamWBa57RQW0X2G46XUU6Y+tfmHVPOPM7uxCaS8urwlfsbV9
	gImr4Yr7xvhZROvt6AOPIgGiwbq7liGnxcd5bZ8ZEc09OaETmJQD0SMiMFxGLzRJJ4VjhSBfNot
	dkXNiVBqcWYv+jj97Z9hfO9MBjs7NdVXO2CXGBiIkQwVY9jDxgCsoetxriZ0heCINO5ULzZj7d/
	V12RM5mBhNORo9X0oGn2R6dTykMF7LJpE1RnE6iXVVOeD61mKt7HXM6KveekbfWrf2CnS7dqcgY
	0aDFQkd67N31XPiesLoIeka6EeZbiNRvRAYg9ZJUk
X-Google-Smtp-Source: AGHT+IGU7DOXRU8+ySmDoc7SCFB9gwHZdwrk+S0WvxATJHUO1RxUFbJHDn6CEY6bIFAzN6xoZL+r7Q==
X-Received: by 2002:a17:90b:5623:b0:311:c1ec:7d12 with SMTP id 98e67ed59e1d1-31e77afe58fmr17207421a91.23.1753726174719;
        Mon, 28 Jul 2025 11:09:34 -0700 (PDT)
Received: from archlinux ([205.254.163.16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31ef172abe3sm2821498a91.39.2025.07.28.11.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 11:09:34 -0700 (PDT)
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
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: [PATCH] x86/intel: Fix always false range check in x86_vfm model matching
Date: Mon, 28 Jul 2025 23:39:23 +0530
Message-ID: <20250728180923.160966-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix a logic bug in early_init_intel() where a conditional range check:
    (c->x86_vfm >= INTEL_P4_PRESCOTT && c->x86_vfm <= INTEL_P4_WILLAMETTE)
was always false due to (PRESCOTT) being numerically greater than the
upper bound (WILLAMETTE). This triggers: -Werror=logical-op: 
logical ‘and’ of mutually exclusive tests is always false
The fix corrects the constant ordering to ensure the range is valid:
    (c->x86_vfm >= INTEL_P4_WILLAMETTE && c->x86_vfm <= INTEL_P4_PRESCOTT)

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
---
 arch/x86/kernel/cpu/intel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/intel.c b/arch/x86/kernel/cpu/intel.c
index 076eaa41b8c8..3ec1555cbdc3 100644
--- a/arch/x86/kernel/cpu/intel.c
+++ b/arch/x86/kernel/cpu/intel.c
@@ -262,7 +262,7 @@ static void early_init_intel(struct cpuinfo_x86 *c)
 	if (c->x86_power & (1 << 8)) {
 		set_cpu_cap(c, X86_FEATURE_CONSTANT_TSC);
 		set_cpu_cap(c, X86_FEATURE_NONSTOP_TSC);
-	} else if ((c->x86_vfm >= INTEL_P4_PRESCOTT && c->x86_vfm <= INTEL_P4_WILLAMETTE) ||
+	} else if ((c->x86_vfm >= INTEL_P4_WILLAMETTE && c->x86_vfm <= INTEL_P4_PRESCOTT) ||
 		   (c->x86_vfm >= INTEL_CORE_YONAH  && c->x86_vfm <= INTEL_IVYBRIDGE)) {
 		set_cpu_cap(c, X86_FEATURE_CONSTANT_TSC);
 	}
-- 
2.50.1

