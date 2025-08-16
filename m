Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E4C1F1518
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 16 Aug 2025 06:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755327103; cv=none; b=okHqb3Tmfidt9pK9IRCWI1qu23Coa/5n0oAHzXXmIvvYXZQEPS1HN6g3a/J8o4T/UZyBhuJAP90w119kVF6fQNA9JQTsc95CWhCnFw9FEGt2viqplF9RWDE0mmrdVq/r9T3uFX/VDAXM08hH864z0P2S29kYt/0i+9G47F9PYOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755327103; c=relaxed/simple;
	bh=I1I/6P6R/jJHDP7d/EmBJ02o3OhrJmNh1erLpSB768s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z1Y7hdWWAe8taSYuTnjUbusYqfReO777Et/PyolP56LINWxc2VfWZT2GaiTkeiQLgyoobO7BVryn2+vHQJJtefCNvJKhfW+jSi1tm0DOmevRbV4webvefQ+e71+OTMubIh97bxYDh6PlRFGSQRgsiOxsrfNkeN5rqP7bPLcVutk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mpfm7Yfs; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mpfm7Yfs"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-76e434a0118so1249291b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 15 Aug 2025 23:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755327101; x=1755931901; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=39WcNe2AXItXXp9jrDQpd1B8VQX1N+yULMm80zOpn5Q=;
        b=mpfm7YfsOiW8elTW+XcMQYoxc+gJA3LMoXjQYrEX7zGyGgtUwSPIBungEpu/sykdlq
         PYODsVFsbWkygfWb5BGDuxLVyypqRZMOjHBnOqesWOdDNor+gdWKkOxZAVsxRkKQxTAA
         CYFwND/MHe7IBHBzYivem82xZ+r9tPYzSWWUOopJxsYnpHt2/Qu8YoyXfROylvRxflDO
         N/8DEeWMLDW9pTKDXc2tuYxdL4g8i4wCmrh086rOUmOZ+KdulSssBG2/jeAQi66DgZX3
         3SQVRgIUpuz32rz7dOZUcn6/OsT2xVoebsEmbEzc3b36Zoj72u9m2+ZHByhm/K36kFQg
         aXKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755327101; x=1755931901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=39WcNe2AXItXXp9jrDQpd1B8VQX1N+yULMm80zOpn5Q=;
        b=YRmk08tDLGpQZTPfMk1rRCRpredqH3iwvD7CcshbU6Kbi/8ChLjEss2a1H1G1PBpiB
         wVX+BHaC+9plVmPtEnoRjRr5ZYCmTe0Qh9Tk1ejaqK4fFYeOJwBxK/ExOfW+ahs+MVyP
         yz9uvOBUxhfmQwnICfOyeM4cs4AF+uVM+e3AoytAnHLAgmub6iISJT+lJQMefas9Ja/3
         b3ubdqMM1SjZeHlgxJ27Iqzf/y1xupW+HoUmIvBYaCuhTw6zywnwTmpDw/vocLcyS81v
         IgZgUxAKI0lXsd9h5mpttYWQ9I8g1k1Avnxpl4CHmiR0s9mlaolnD4eSVlP7zazvyTs0
         9XYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVXn3TUhJt+FSLjIq63iQLVe1T7mc6qIRzRe/pN19RDDHEpfPQr5MPClNwh08GcvBjd3c4i8tPyY4p2oD23IYLWMyl7A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyu6lbV+kOCTAQCvvXJsgPbabF/NPQFMGz/KXRnfoDUMMp0H8z6
	ZQ6pUnicB4ZJVvvKVg6EJK70hiiY0cmSM/BsYl7+hbwIRHX1+GOrscb5
X-Gm-Gg: ASbGncvi+xhuRjJfXHMTFztFpSk2VfxZ679ISvqi17zzRFXVXDij7DwjT21BaAABWS2
	wWUbLDKY0GL/vIRlK9qvdSgzOGm7PLsqr/ZOoMw0pt+XHTfVH66WI1/FuUhQk1sWvrB0bSodAKc
	s4Zh115H5m6rcdmVyJPh8vDGBzLvqMSm0y4BjcWYTHc85wjPPbBT8i3exfWenp3Ot1rjgw77thw
	bHrDb+EBwqPHvaS472ufVzm2eNFWLp+P5/d4VmKEPOrix6jyXRGUEVH7WhfooA8LY3x55peuBXo
	mPpq/CrcCfLEZy04FQIAop8Nk0msJFmFRz2WAecYzNGKD5aSia+R5ZM528rYQOS14T9UKclR+ZA
	7ynlCQldqE1yboKgpT7y6tw/V5StlnUg=
X-Google-Smtp-Source: AGHT+IGUsLmuiPcI2giCI2IF6qVd6KgQXhFiqbI/NN3EugFt3xJ2EVq0iMIu3K9bJKvvdzrEtNpDKw==
X-Received: by 2002:a05:6a00:3493:b0:76b:fd9d:8524 with SMTP id d2e1a72fcca58-76e446d626cmr6485065b3a.2.1755327100857;
        Fri, 15 Aug 2025 23:51:40 -0700 (PDT)
Received: from archlinux ([2401:4900:67c2:7988:186:bdc:a8e7:4149])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e455b5f9asm2512433b3a.107.2025.08.15.23.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 23:51:40 -0700 (PDT)
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
Subject: [PATCH v5 RESEND] x86/cpu/intel: Fix the constant_tsc model check for Pentium 4
Date: Sat, 16 Aug 2025 12:21:26 +0530
Message-ID: <20250816065126.5000-1-suchitkarunakaran@gmail.com>
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
Reviewed-by: Sohil Mehta <sohil.mehta@intel.com>
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

