Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3641E5B6F
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 24 Jul 2025 17:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753377978; cv=none; b=fjFs2vpvXiWVxq0TYgPx2LpSrGREi/r5640u3wQZ2OWJdfutRl98Idvz9eFKREHjPjq7qvpaoeCjM4wL8How7gMLLoww0WGVkR76qvfLWnS/UYlSFVeuKams7VPOHoauA4Tu38B1+iSZ/i5sG0ET2ioa/mg6stwrAqQub8Zhk3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753377978; c=relaxed/simple;
	bh=KAeYHbxC1lS7s7cwnmvwfKOqD25berE2Ks0kTgjzGQU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X+VghVdb429c44Tcd7sbyht0oV5ZWyBg4zCHOzHNfGOj0Ed1OQX+VPOprzXA0HIju0QDHlnFNoEsXVw7Vy9CkxXC3qEgsKlHwmVu1VIJ05DteTAiVOTKtUE1RGdjr+b7SxtzUXYuSTtdXkfCpko9U3prFIsqbd0o67rxuI9cuh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZUbmwWYl; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZUbmwWYl"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7fd35b301bdso1676968a12.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 24 Jul 2025 10:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753377975; x=1753982775; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sUe9u1KCQnirtd227P6w1BmHNBfUepiJPaRAQLnBBF8=;
        b=ZUbmwWYl8hE1udWEcsLc8NVkdTfmJ2WtzzIqaKDNYKWrOTkiEhenO85FRQRPvX1Flk
         864Sdjxla++w//s5D8CydGz75LorRlXw8nr4IK9XqZM4frQqLAeIYieSD6rhdLSfvSt3
         CCsTEwdu7+ndGHNO6BM/Yo4vnqa1uHFk9yJu1h0om8nqZpXfUD1J/9pTAZswg3f+rmo1
         Jh12q+hjiKLHGn3Jwl+jK1JgZqhx2lGMUJ5NNIjszhzZHJsTPJVxhTYujMu4Cxjom0am
         47htVTWInxVdJeoplOUnj3Of/NOLBRFxnI5+iPHuzF+sEo/1HdVL35Nyz3DsH396EhMf
         FhZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753377975; x=1753982775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sUe9u1KCQnirtd227P6w1BmHNBfUepiJPaRAQLnBBF8=;
        b=h5I6LC7YSeDfRTnHR5OBPh2w04FN9CR2JrSoRCPI1kebj7gYS5QqM+nq110BRD4k9f
         d8q3zxXV2h+aA7jigG6eNvr/HLxGCK3PNcIiLQuc7qOkxCulcaIsCu0akaVihPQsDg7h
         qxMTlIgQkYSrnJOBu4mL2B28stEJdOKA/kkDIMl4KYhB3MG5wmL6BidyHnE+ZWGvyTvy
         0/sXW0ta60K82hsF81+trOdU95TaoXhSzxat4/lV+GiAzFK13yYgl7eC5vq7W9I3L885
         hQfVtzkthWGEqrU8Cd/2y840UUSbRe88vDAOJ1bgQquGs/uLTH2pkT3QulA9+rIABvLd
         cgCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHQsjWj3C1BSUhm5Z71Cqh+GvEXPqNbNjSVlzPhyLNHp8OCO/zaj61VVwv7/RG6VTB29f9Y/jAKoyse2RrpjzwPObkhg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzZKEIltZHU8F/aeu0cnCvEgugh+tVPg95ReXoBFXUlRocSc8+n
	3P/Nkyvqns97l8C3LYjLcsnOmounQBiSwTXXL8HuMUYtpuJmpPMe5860
X-Gm-Gg: ASbGncvTldycn9xR6bW06MlYWjRoZeCnrEKDx4Vu3dcwU3CQWd4w2KDqqCRkH8N2asD
	FulONyqYMNludBR23i4AUzo09qNb6lBYhY5SL+LsQ0Id+0rmNTePUDYBXRCaFfH+QAmXqn2DScK
	jJFOQfPG10sWULXOTRYblPnO3Sr12Q+ZpJlR2kr/l7DIsCPEk93nY4ctml9fLAMRZ2Ayth+BglT
	aieUMNn6X8bosOgkEzz3MxSXGjxk7SZEdK19D+v8cKCITh7JbN60q1VkeqPdlM6l+l39+MFH4nV
	U091uBz7zaCnBiG+HoGOUKeajN5yA6HLXDlldvC+3rX7jAfuY1CnX1gSbHTzDI/e0BbAU2RgCjE
	5d7LqaT2/uq/hjdCyVPyYNbz+KGCrsTpL/CHrQz1sBQ==
X-Google-Smtp-Source: AGHT+IFcNSsyYwzraEG8EbrCJ0la1lFa1eFwIPy+bqFr6TTzxI3z6TYAGO2SmResKfllx+bfdd26bA==
X-Received: by 2002:a05:6a20:a11d:b0:23d:40b6:3f9 with SMTP id adf61e73a8af0-23d4903ffa4mr13812559637.13.1753377975343;
        Thu, 24 Jul 2025 10:26:15 -0700 (PDT)
Received: from archlinux ([205.254.163.122])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-761ae1584bfsm1999495b3a.38.2025.07.24.10.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 10:26:14 -0700 (PDT)
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
To: linux@armlinux.org.uk,
	rmk+kernel@armlinux.org.uk,
	ardb@kernel.org,
	linus.walleij@linaro.org,
	ebiggers@google.com,
	nathan@kernel.org,
	lumag@kernel.org,
	dave@vasilevsky.ca,
	ruanjinjie@huawei.com,
	kees@kernel.org,
	liuyuntao12@huawei.com,
	linux-arm-kernel@lists.infradead.org
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: [PATCH] arm: allow single CPU configuration by adjusting NR_CPUS range and defaults
Date: Thu, 24 Jul 2025 22:56:03 +0530
Message-ID: <20250724172603.18701-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously, the NR_CPUS config for ARM required a minimum of 2 CPUs.
This patch changes the minimum NR_CPUS to 1 when SMP is not enabled,
sets range to exactly 1 if !SMP, allowing only a single CPU setting and
adds conditional defaults:
    - default to 1 if SMP is disabled (uniprocessor)
    - default to 4 if SMP is enabled (multiprocessor)

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
---
 arch/arm/Kconfig | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 3072731fe09c..23acee38721e 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1063,11 +1063,13 @@ config KASAN_SHADOW_OFFSET
 	default 0xffffffff
 
 config NR_CPUS
-	int "Maximum number of CPUs (2-32)"
+	int "Maximum number of CPUs (1-32)"
+	range 1 1 if !SMP
 	range 2 16 if DEBUG_KMAP_LOCAL
 	range 2 32 if !DEBUG_KMAP_LOCAL
 	depends on SMP
-	default "4"
+	default "1" if !SMP
+	default "4" if SMP
 	help
 	  The maximum number of CPUs that the kernel can support.
 	  Up to 32 CPUs can be supported, or up to 16 if kmap_local()
-- 
2.50.1

