Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D691DF25E
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 19 Feb 2025 15:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739977823; cv=none; b=dUnxczLJLAn6Hz9uA+PIbNvgwKQwVzEmp+LfWmCXuAljRguGBr/EH3b2JEEuW2wxWd2snvxUZHE30f74MJQ9esU6Lixuql9+eoTnayZf/pltJf9gAnbKB/jgcb0vL7bu/1wQ9CDQX1WiyCglK+BilGL6N7qj2eIbS2PjG5auWCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739977823; c=relaxed/simple;
	bh=Ku/iOh1I+JqIUUJzjGlO83eI66BgPyPPrV2ZatQegEg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QRcxNzMW2fgqyxrotCvnQ5jAjEPSoN1zjU0iCZP7UKvzmiPV1GXgGRJMf+IiMKaskrhkQJmeDLY2Z5LGpM5ilIFy/yFwGD3o8tyr/vFUFxuXSjrjL/Prsqb37KxMPdpNWy6m4DE37jfpvo4p5PRKT6YlzrrYkH6P6MQPy/36nE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FL/hVxUn; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FL/hVxUn"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c0b9f35dc7so87549185a.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 19 Feb 2025 07:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739977820; x=1740582620; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HgXm744upb0XmzQ9hD81TZHuxXyYA2m+MVyAuNGPvsQ=;
        b=FL/hVxUnHtcP1lzYkKAEpNud6UR5F1zDmU4DLZV/xseJr3sHQ45jdJooCU6v1pNyBe
         /kP2kx2RzqTwANeR5o45LwFkaSDcoCbktJzAZt90WxubSYJUixB+nCFj77N4uwWlY5f7
         nCqVDh3v7onjnrauG0Pb/FDG1OQkDmnG3NYND+TzpDE73w9O0OXBnVnWAGJunf6qhh8I
         xXAzXSxBnUC7a3GrFNIMS/bHji/5wlm3JjTMDNfb7tOViOfnZBQUPXDGJeaw1NLzFJjJ
         MvBDkBHzAlOtBM1Rm4LZOMrqaKIP4+3bfOJfE+prQGhUZwt3a1X4jOzVpxLpVy+7X7wW
         XhTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739977820; x=1740582620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HgXm744upb0XmzQ9hD81TZHuxXyYA2m+MVyAuNGPvsQ=;
        b=B+vc4KUMwvQ8qGJ0z8GALCMvjdgcsVVCm3isti+1CAusAdKc0eaXv3X+Ot1aqiJa9M
         2KOoobjWnPBXqEfJMwsT2DbVDszlSJ0T+xf6/vIzDXsFTNHxC7aEd88WqFWJ4cA3bRxL
         1Fo3UhqE0JnBDd8p215tPjLcaZzHaLHz3tCFzGeyN8zNFQc5zoiKNkS8QppWy+ODdPmx
         TjAJauxwifdMj0eHAkandf6QmVmIlAoZgtUJCHRrU/FIQrgCiUHf6QxjcfJ6EMMlvOyC
         BitI/gFiH9AEXZuqYbQjxxABT9ZfhZgK8PKeQoiLrXjIiLsOItK8zHXTBtkxfAekOWaw
         UF1w==
X-Forwarded-Encrypted: i=1; AJvYcCVyb+2y/qJwXwR9tYKZTmmfUhF8gLFLLWApdRLberwZ0OVsNJn9ouGhZe8SW6Yoa1ZDMeVIV7RGUaA4OuT6tsySzYyCyg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwEY8GXivhgkFi9SnvEfue2BuyRFm8eu1/IwUhHF1gwQo92QtOK
	wGq2NUXmfh4sucoPnPx0sKjk4kWgjHIe2eu7/Outd3NcRDLUUnqm
X-Gm-Gg: ASbGnctwVDBjoJQbfFrLhfrjqDALrGZBVqkMIDiQAyiifa1IOUOsOSxoPYsc+07LY7R
	u8aohltd3QcpEx4+ESdMcMGQo/rxglDh7vXClv8I5uoool3PjPutJOrt+YZkLvKzCMjsl55LA6I
	vxKulpoqmtO25DaGHA1Eq831wph6jJ5UtT2OhzHpnEfbVYbATMIqDbjriSIGgqZMjYXjzh7+GCq
	PlivqK6GpVz+DibMxF2OF2Q9pH7/YO5+sAhbbBpb7S7yvcFh787+brv94pGpWYrg2Vsn0zjGl3f
	1aAUhkCb1YRnK0CKsKLz7l36Mt7+U9OPfWKHdv8nTSFtZhrfbsFo8RW2+DRi2TQ1blbIHZKvckE
	ihIefo6kMvbgnMVh2FHYvspZEU1JGTUt8SyA=
X-Google-Smtp-Source: AGHT+IHEV1pVpKuhM+GFSWTF+zPnmfVbsqQvuz95PcOyRuSEElPJ2CFcOfM4zOh9HqcXIy3nsuYPqA==
X-Received: by 2002:a05:620a:454d:b0:7c0:7a0b:3727 with SMTP id af79cd13be357-7c0b521e597mr563994685a.16.1739977820342;
        Wed, 19 Feb 2025 07:10:20 -0800 (PST)
Received: from SystemsProgramming.mynetworksettings.com (pool-100-1-71-214.nwrknj.fios.verizon.net. [100.1.71.214])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c0ac61574bsm223982585a.112.2025.02.19.07.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 07:10:19 -0800 (PST)
From: Brian Ochoa <brianeochoa@gmail.com>
To: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	corbet@lwn.net,
	x86@kernel.org
Cc: Brian Ochoa <brianeochoa@gmail.com>,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] docs: arch/x86/sva: Fix two grammar errors under Background and FAQ
Date: Wed, 19 Feb 2025 10:09:20 -0500
Message-Id: <20250219150920.445802-1-brianeochoa@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Correct "in order" to "in order to"
- Append missing quantifier

Signed-off-by: Brian Ochoa <brianeochoa@gmail.com>
---
Changes since v1:
Reworded commit message

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

