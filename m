Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E2831A7ED
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 17 Oct 2025 18:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760724706; cv=none; b=UO6UmtcXoI93hmVBritDu/eyZqKnwjDdZDdPCKGXLt7HqDT9jUjE7J27cFhW//vqtPfvC/H8ixVu8ww/tfsAlH8l4EDSUIQG7PK3Hr39x9ojKvrDxVpEIiL34IXS1o4bt3oT5Vq/snUlhFLN1LTAbsGL/0UP3ZgGm2LWN0O/5eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760724706; c=relaxed/simple;
	bh=r3dihmDf7EmTwHyOQk7Zkgw4snf1eF5k1wp6/pUMG+A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PoAaB7/jQs6z/YTETlkWG+CuRAVlqGh+woZHkrSa3i6id+GZXCXKOwQ8toieBvUPq741uaRzCmjuIPnF8lxtLMSkDJTMVAlrYK17wo/TUORRH0vdc3EUtXuRazxpfFR6R0AgnLo2rqlAngPTyotgGrFJuROnqeQGdHkgcxwQz+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GapdiZR6; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GapdiZR6"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-77f67ba775aso3101364b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 17 Oct 2025 11:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760724704; x=1761329504; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VFIEDJTAopNEIqPSdh3Jplcei1xeOHRhpzrjHf2iOMc=;
        b=GapdiZR6HTetkI0/4LGT1DHzPxp0v4sy20qMbsC2uDIWKFCe06uz2Amx7j5meGXrXd
         SKxgtt+QCfdlO/RBhRnWIYwFKYma0lVGrAwfGKJvbCQruMLjmZwoYNuhxZn9N9CqjKEU
         DbD3H/PXHvwbc9wHRROCtX/goz5hB8n0+2mGpj8wmeiX+P8wSq8vVtUdkcUk+pW+T0g4
         +M2xhKsY3DT8wPBrBz40D4fMnQ/gtHOQf0xxdfUMxUDY8sV8zl/cs3nGXpuf3lHi9jev
         Xw9U0C+LWUTqlYfpego1Id+jQV49XHUkjiyRVM6/lGFLYVIArw0eci0B34y/iB4aoPKQ
         dMCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760724704; x=1761329504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VFIEDJTAopNEIqPSdh3Jplcei1xeOHRhpzrjHf2iOMc=;
        b=IqK9kEJ4iSdt7JowiCfRRRsSKaCbLUun4akHzrZmPBeCG8dIT17pvDxY+iTjSsTx2H
         /+UTcMbQDpqfuH/OPRxDBhoiWm2GNckeD11UBH3MwBiBxr70CvfkJtDSvEEau5efNmJA
         GCVAGz/IsH9I+vw3JG/JGPHW5JbzAiyUz3zEN2WovcXlZuSpMPsfrGXxvZz/AkgH+OZC
         lSYZuvEgtk3IHfphWaD3YBmbBPYGeZt9LeF8Xdtont0akTNs5EKPIwrZ0yTlpw0Alpni
         +ufip6nHUoecybbYNOo/mDj+zzDeOhohpS1AfVszRQlhQlG/uvpLDBo5szUMlzsjcMrz
         keAw==
X-Forwarded-Encrypted: i=1; AJvYcCWPiO8LgZCJFXk/GO8JOf5NyU0615y/6b8gHADqbN3ITHCrLpJRVMUsa4keEuJZDgXDWjjNdFddWhFKCuW0j5u6bkIyzQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwCssbfmvFJEusi5W52pgWEHvmC8lROohERT+q5H/I9tKCLo5Ss
	coWNdwtKwqb54wp94ytL3g+k2d1HAoq3EMg5hqU/sPpDQ1pva9/vESdt
X-Gm-Gg: ASbGncty6nRVghuhnWvzUN59l12ZZh3JQATc9m4SkHtPitDfTu+7Hfy2mqS+37mcZr4
	H4Vq1TCNqAd1nxFPF8hxaocrxOJjBBYbu3fXdWBcRoUmTKSWk5kkXXWnrZE24hmj4QHXPP1As15
	7PyOT7VwjyLTd3qru0Ol1w/px2cRV9lXMmG6DwzhjoRKzrCTd7agRDUxyb6GJotPjlsAzzs9pks
	oTqjWaRr0ADX8Y6iry6EL5vOWo9woNC34ny1KymeRQCy4j8V9+1nyKGS0waGGOOLnOEIpcY0pGQ
	ow/uXXz3xUniGPeBhf2Ey3jT9fP1tq1kJiIeV/pUYNQX1NCEt+RmTZTkEjnIFZvAKXIcrYldfs/
	18K3DIY01E8YIQ/dGSiSLIR7vxIxmmODwZLeVvhmqx/X//LEy0FbhHySJd+LFgQgZVTwhJNd5GY
	xZsbMOLwO52yjkLRPmgws=
X-Google-Smtp-Source: AGHT+IE1h8o5AFVacUuJYOfSDEzDV+0FD/VCXQsxR8OMX32EA6L/ZDfNJDJ4BWWf59gxnTA0758alA==
X-Received: by 2002:a05:6a00:182a:b0:781:556:f41 with SMTP id d2e1a72fcca58-7a220b07183mr5214886b3a.19.1760724704302;
        Fri, 17 Oct 2025 11:11:44 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f24desm200093b3a.48.2025.10.17.11.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 11:11:43 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: zohar@linux.ibm.com,
	James.Bottomley@HansenPartnership.com,
	jarkko@kernel.org,
	corbet@lwn.net
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-integrity@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev,
	khalid@kernel.org
Subject: [PATCH] docs: trusted-encrypted: fix htmldocs build error
Date: Fri, 17 Oct 2025 23:41:15 +0530
Message-ID: <20251017181135.354411-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Running "make htmldocs" generates the following build error and
warning in trusted-encrypted.rst:

Documentation/security/keys/trusted-encrypted.rst:18: ERROR: Unexpected indentation.
Documentation/security/keys/trusted-encrypted.rst:19: WARNING: Block quote ends without a blank line; unexpected unindent.

Add a blank line before bullet list and fix the indentation of text to
fix the build error and resolve the warning.

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---

Tested by running "make htmldocs" before and after the change,
ensuring that output renders correctly in browsers.

 Documentation/security/keys/trusted-encrypted.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/security/keys/trusted-encrypted.rst b/Documentation/security/keys/trusted-encrypted.rst
index 2bcaaa7d119b..eae6a36b1c9a 100644
--- a/Documentation/security/keys/trusted-encrypted.rst
+++ b/Documentation/security/keys/trusted-encrypted.rst
@@ -14,10 +14,11 @@ Trusted Keys as Protected key
 =============================
 It is the secure way of keeping the keys in the kernel key-ring as Trusted-Key,
 such that:
+
 - Key-blob, an encrypted key-data, created to be stored, loaded and seen by
-            userspace.
+  userspace.
 - Key-data, the plain-key text in the system memory, to be used by
-            kernel space only.
+  kernel space only.
 
 Though key-data is not accessible to the user-space in plain-text, but it is in
 plain-text in system memory, when used in kernel space. Even though kernel-space
-- 
2.43.0

