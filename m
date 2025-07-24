Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6482EAB73
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 24 Jul 2025 16:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753376212; cv=none; b=p5GhWAp58xwRsxM36uLK1gY4TmdctIGeTLU7CgIp4Xpfifd/pcuR56/xwyqmhVm5G2uDshWoAdw6zNVLaPmrrrU9xSAMdfXpv/MXBA60nAHDXr0Tdfl+zLOXNFlIhJsNvxmy5e6UdPM0ZGwpscch8SdwUPmiWmPlaZhtriWUbYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753376212; c=relaxed/simple;
	bh=uJGbBLnOIx9G9aFmKA88U7Wt6IlhqHCuGklS/cfxJaI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j16f0zKKvfihYlJyZYhKRPaEL/X2/hsBbofYoLjo9BBixqxmyFmzGrV/OLF4ha5iuCrVmUCuRI5pyx+gzKq+IXhv0WKBCPm3R7FlV+L2vgtF35+XvwFtCjUHO221OCZxu3N97PgSFQk9MYIf5JlwvTdzLi4uLxud0lmK18zsNug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d0RBEecd; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d0RBEecd"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-748d982e97cso1208687b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 24 Jul 2025 09:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753376210; x=1753981010; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tYcAbkjc4Tkr2KyQs05DD+oyBfj2e0/3qety5W33Bjk=;
        b=d0RBEecd+qBHxWC9AzMj5bkTz57jSpP6xMAUlb99u7tpKTqde30VWc6HBpbECubII9
         cDiYG8G8/rqqIPW653vm8gzAlfest7SiaE74Wx3D7NGDiqz7oSiVfnvSZbaCa7MlgrtZ
         TUFApqABciIUFUq+xEjVM8/GyInJ9qG1gH2rUYolWOI4u0tO0l9CFPftU1lEgbAshOuI
         vLQab1iHRcvxGFgnsnHSycItdmTe3FP50clEJEf3eAZrhNgu5DpqibxXx86RXQL95MCs
         VTxX/gwi1+VX1GwtaLNHWjiWPFEWXvfZudeIFEsv55mTTPrA+FWmZGLquOzgCGeN+NRh
         KK9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753376210; x=1753981010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tYcAbkjc4Tkr2KyQs05DD+oyBfj2e0/3qety5W33Bjk=;
        b=YbxbKDtkbjNvg3eCeq5KTxYNeihhMvo6inhLDPc8gWD5VcyTkroB/WkqwjprMTZXAy
         oLmAzMhhB/O24yjLGYtSJrCprBqSdvvBAKTyF9tNO2e7yheFhojdLY7Ln028VC9DkYrJ
         0CqnkmoqtWLYSAbzITJbx2NBFtuy98WQkPMvnFuWvmO6bPMitfO5f/bOfJ6tpx0UkE2x
         /bzwDU/3rXVltIqII9tDv8B3ZRQJSyK7dHQRMDbB6a1GW1icIdOrvZb5brKnKGSWrz8m
         WKUTzGJtPPWwfgWjgF6dtVvYLLVRnIFMKPlBOiBDnPh9qUPCE3lv0AMxBMaKg5xNFGWQ
         zy+w==
X-Forwarded-Encrypted: i=1; AJvYcCXqAJ4BU+/UAmDyIXx2WunnziGJhA6oIIaweteUtny2qwePLkma3K7MgcOZTwrqegw/QKU+/I8nvj1E+XkTESJZtTai1w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1w1jeMWdbehHXDCzo5ykSdqMJ5LjKeddDSazQUPVQjmp8YcUe
	/OsrYKpAXTe+x7bLogiyGYt9xoBdvTk6Hur1kmQdkVCvKC9SLL1ZRF2Q
X-Gm-Gg: ASbGncuTa6IRMZ5S/Yxd670B1ob36Qk/mfOXAsJaKzqs1TqCCj1uCGT6vjFfQdXAKkf
	BKJll43LG/2GLLaPcMXypa7tV1/t2GgnY/tsdiQJUVe2RIf8+dwom5+5k9tsGDt0/23JbzI+jB8
	4YEdDxuKvCi8+nZn7ltPDledniX8xZIsMe+43yXpOgXwsMPZNotwn/6RFPWe+Yx2jFspjPFKd0m
	bkKWFxGT5L0bMqaYYlso7xnyK0qJEhOtDsOdhWdLaIfh7mwuv1HjOIy4mSLUpYFznWyyU2oKiYl
	sfjiG4Hrg/ZjH5LjFHyskcS03d0cLmYMzTcETZMIB0I0G4+KWU+qHP9cU+xuFqYhcr5cpAwOmg2
	s3JhdVla4E68kpQHk1G8AIdpyG92UZVd8VQ==
X-Google-Smtp-Source: AGHT+IEx1SRGfdVyHhlPutv9dzQMR/t+xKkZ8lw/2GL680PVA3DqTsdXoJDkH0z2PXFFMimZ5OowSA==
X-Received: by 2002:a05:6a20:9c8b:b0:23d:4777:49c3 with SMTP id adf61e73a8af0-23d491bf059mr10760796637.32.1753376209985;
        Thu, 24 Jul 2025 09:56:49 -0700 (PDT)
Received: from archlinux ([2401:4900:6318:9e23:f078:c919:e302:8d2b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f6c1261e2sm1786314a12.66.2025.07.24.09.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 09:56:49 -0700 (PDT)
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: [PATCH] arm64: allow NR_CPUS=1 for non-SMP and adjust default accordingly
Date: Thu, 24 Jul 2025 22:26:39 +0530
Message-ID: <20250724165639.13926-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The arm64 Kconfig for NR_CPUS previously required a minimum of 2 CPUs.
This patch changes the minimum allowed CPUs to 1, enabling single-core
non-SMP configurations.

Additionally, the default value for NR_CPUS is now conditional:
- Defaults to 1 if SMP is not selected (non-SMP systems)
- Defaults to 512 if SMP is enabled

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
---
 arch/arm64/Kconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 393d71124f5d..9b2970f7c5ec 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1528,9 +1528,10 @@ config SCHED_SMT
 	  places. If unsure say N here.
 
 config NR_CPUS
-	int "Maximum number of CPUs (2-4096)"
-	range 2 4096
-	default "512"
+	int "Maximum number of CPUs (1-4096)"
+	range 1 4096
+	default "1" if !SMP
+	default "512" if SMP
 
 config HOTPLUG_CPU
 	bool "Support for hot-pluggable CPUs"
-- 
2.50.1

