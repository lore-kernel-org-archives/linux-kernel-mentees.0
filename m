Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E101194141
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Feb 2025 02:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739242262; cv=none; b=MgM4ANimEFRSWPWvaOhNGpUA/WNb4TdIDnZxoXEeOjRIcmNCJg/zZ0+Iy6unnfs3IK90u7a2EfXMXMUUT2Z4Tqd/eAcHIZoy9AIBOfytK6D6ETvewz1cqU3CMNOJNtL9LsAsTXf2FZUZPihyftytB1vuFCKWZDVma++Qtvmy5y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739242262; c=relaxed/simple;
	bh=363o9y6nIpiTcHxka7eoHXT++KoCdpZHBIaS99QobQ8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Nkcfn3MCSmgugGZM9LT+kUIlQEZjqeAXh6NZuuh5W75vnwrQZYnr6uiiRwyS6nxRLbAlG14kBHRnpw5TiRfN6+pRg2UOIiqj4aBBMDGKcBs4D7u/oUSAHwzE1LWI8IKmKl/s9R9tSgOD+zuckhs7ll4fmMhB0itNU6fS9uGYc6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J6o/rk4v; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J6o/rk4v"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-46c7855df10so95860401cf.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 10 Feb 2025 18:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739242259; x=1739847059; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y7W7UIaefMaBKc66QNK3ykd+EZmLgH4o0pIICgtsY1U=;
        b=J6o/rk4vwjuJS45tQS57OdBS1++mKfwmNdJ/jT//qy18HdXNideQ8SHgaVxujaorg1
         DFca0MJOhCXOOwpHdB09U8rlwDPa+hvP3I5klDOG/fbqUt4Vja+i9vUIMmHWOUUwrqsb
         cdBF2lKqPDf4hlNsBTC2UnsnhUK3U5EtAHFLhwZFrHmojm2pGnUbc71ntEsWjqJeLgTm
         oEmEiYu4P9lK1WsZ5RVNeehKt8mDjxO8diChtNficl8ukp4hiEoxoDqVVKB06sD0meKb
         IYmDrx7HLCFI8g1DvLSYb5z/eZNrlZ7C3JA8kw+dTLVxzEUSsdnzDmR7RQeP5G4y9R9J
         hNRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739242259; x=1739847059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y7W7UIaefMaBKc66QNK3ykd+EZmLgH4o0pIICgtsY1U=;
        b=AmNl2yr1plmTCziELT4jShvBYvNQZvnz60wEoeDkqt+5/tp89Y9EYtf0hZQrKrPwzP
         U/s08FySg7hcB0tlUjg/qGhNBHMqkIqcjrj23WPt/htqo24jZ5+eqraiS0D41mCSJ01X
         jsTpKz+bw9iHP+llp0KlhbdmE3hRFdHpLy+y4V2Ik62AzatxbabAblpRcfV9e4Bzs0mv
         4h8AfB5mO9AgG2Yqu8AO9OSLO8bBSY12Z8yWRILy3zNbzGP+5ZXBDm32kVH9Q117WQPI
         RPGWxG2BdxCckM5LeeNqmi2cho/VoXW+EYb33jnFXGXCztkatz7T1usbTNVETZQGP+sK
         HQUg==
X-Forwarded-Encrypted: i=1; AJvYcCW6YzV8lfLIjtbyR9T4xy+/UD1qzse16o6Z/mQrpEh+xsa2pof929K4TTQWihKQRrmPEqKUTq1NZJcpOw81QxIxTdAyBw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyQJ2yCeadYEZ76luEEJtoE4YRXG6W89LPrcZpQDBMshtwZQl67
	pgxl60NxxXAm7l9gNtB9GFOQXu4BNvP2LMtM3b7zaBnKKVX7uiPf
X-Gm-Gg: ASbGnctrNwLJuvzzpu/EenA0/HOJH9SZSWfgH+ew1EZE4jaKkFzruQpmm2WIpamPID4
	i90qFv5jVRO7ltdvhrw0AOUO/0Aj9uIsS4bA5lQMmApdPAAUO/zR8kEVlksKdCv5Tumonlnq6kk
	zWaoD92uwu0KMHJiTLIbWq34em6twlN5FXaTeBiPRTpD62W57b/0GXGtXYIDgrKcRl6rlJuSbui
	4AAID3GlN9wmtjL5/nh6V2+kKisieljLwmO3xxFywggSkosCBY7RrsmhY1sJetIa5l+iAZx/Jni
	3Ko3wzKz/1S31lWNmfeABk2dkjvs26xBNyrWEgoETL07UGpWEVmghom778S/v2sX89+cHAZPAZm
	xVwVfSTjdTfJmxwDk90FbhcIbkoqfj9TU1J8=
X-Google-Smtp-Source: AGHT+IGuUfMIhb5DuQUpTinkcfu/mJq0eKFdgYhp/7lwkzu/vFBxjpk51/uOsYm7BksfGGQUP0bayA==
X-Received: by 2002:a05:622a:8e02:b0:471:8c1b:7e33 with SMTP id d75a77b69052e-4718c1b81cbmr65116951cf.33.1739242259377;
        Mon, 10 Feb 2025 18:50:59 -0800 (PST)
Received: from SystemsProgramming.mynetworksettings.com (pool-100-1-71-214.nwrknj.fios.verizon.net. [100.1.71.214])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4719b182ac7sm11794231cf.5.2025.02.10.18.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 18:50:59 -0800 (PST)
From: Brian Ochoa <brianeochoa@gmail.com>
To: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	corbet@lwn.net,
	x86@kernel.org
Cc: Brian Ochoa <brianeochoa@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] docs: arch/x86/sva: Fix two grammar errors under Background and FAQ
Date: Mon, 10 Feb 2025 21:50:54 -0500
Message-Id: <20250211025054.4062-1-brianeochoa@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Insert missing "to" to a sentence under Background
- Insert missing "an" to a sentence under FAQ

Signed-off-by: Brian Ochoa <brianeochoa@gmail.com>
---
 Documentation/arch/x86/sva.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/arch/x86/sva.rst b/Documentation/arch/x86/sva.rst
index 33cb05005982..6a759984d471 100644
--- a/Documentation/arch/x86/sva.rst
+++ b/Documentation/arch/x86/sva.rst
@@ -25,7 +25,7 @@ to cache translations for virtual addresses. The IOMMU driver uses the
 mmu_notifier() support to keep the device TLB cache and the CPU cache in
 sync. When an ATS lookup fails for a virtual address, the device should
 use the PRI in order to request the virtual address to be paged into the
-CPU page tables. The device must use ATS again in order the fetch the
+CPU page tables. The device must use ATS again in order to fetch the
 translation before use.
 
 Shared Hardware Workqueues
@@ -216,7 +216,7 @@ submitting work and processing completions.
 
 Single Root I/O Virtualization (SR-IOV) focuses on providing independent
 hardware interfaces for virtualizing hardware. Hence, it's required to be
-almost fully functional interface to software supporting the traditional
+an almost fully functional interface to software supporting the traditional
 BARs, space for interrupts via MSI-X, its own register layout.
 Virtual Functions (VFs) are assisted by the Physical Function (PF)
 driver.
-- 
2.34.1

