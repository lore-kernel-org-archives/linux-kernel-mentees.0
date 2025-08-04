Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BE2229B2E
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  4 Aug 2025 17:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754330354; cv=none; b=WumuDevKjsAhFL4SOuCcTAK+NZRJi4RWpWUv479iP/5DoyXxWVE2gh8Ja49lGmoxmVTS8Q+DDlD1adkjyWkGcvzbMfHP733ZUsbTaWH8FiJww1bHuM4bLhCLUjbWC2g/+xNVVZjmu6RISloUSfhnsUHO5jEeSPuyBpykviz/d7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754330354; c=relaxed/simple;
	bh=hRBqtBgChyarswMkyqYaXicaN4pphCyOw/27Y+y30EM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SgXUKRV7cawNYnjiDAJCUbvDc6Q1MSi0NxK2jIslzAo8ZRocO/zBhxlP6RQ3jIUrOQMnKCoLcmDSXo63ewKa3TEGHJ3wqC9pmtgerTeJMB64V0L8OXAOuffpEVjdY8wqcdZ4uuUM3pcjrDpaqqANZJvSG6Rs8ceBuK2CZltTw18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VFZnT4i2; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VFZnT4i2"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-23c8f179e1bso42267395ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 04 Aug 2025 10:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754330353; x=1754935153; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TML5SKZfJNHDTPDytEAgukzx0quH2eqGb0TO1OdDwgY=;
        b=VFZnT4i2bgCB4OcBP9m1rILpQmPpX2m6ZOkVaafVrMjuMUY2uh5LJS03CUSB0Nokyr
         91gMrkkfco6tg66EWDEyMhJ4T/k8sYnKkBFHrcr+E2skhfRjpYCLu1OAsxuczoO9Rn4K
         Aqp8IeNcq560SqptIJRJKq5vkkn/SvuOweQyQOeE2hWTxgCdKzPQAtVLbrHplQPPbbm+
         TPiitc3kcGiOOHrvAwN5V/QXOXmOCXFTlUY79FPOsI/o7jH5+lEpj9kk1kePKy65Jkfv
         ZXir8EsmZM3r4kKmME3dz3LF282TTixM4L3FBXVGrc9mO90c+gX61SAsm8YfpyRfSXvs
         qF6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754330353; x=1754935153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TML5SKZfJNHDTPDytEAgukzx0quH2eqGb0TO1OdDwgY=;
        b=hUnzgHQaCCVPnhDN83DXjjkPCywgBjfPVLE29o9i0cFBmB2KLwEIVh9tz5/ngksDbn
         M4iwXzZN52qUIqzjgTaxLdecRkCqxeIzRni8+UgQXmGWdDCwtPsQHE1/+H7liEmx8aZw
         SKAM1Q9leV/qNMzrzmgrrg8xkv+6qRFPMe31dVXFJmsZToK9ezD8hnuRqkQgW+zEajQC
         t+EOlV6fjTBrOABpQpSY5NgCMAI0YaP+4sjcCr1cJJB1fjwJ9qeEODrqXnDoL+BqRUH2
         lJd0vFArFsH6TDqDE6/eWbUHbx60rjDm86wnzE3kpexCtZh9aaD/SRRRP50SOihNfwRp
         3Kxg==
X-Forwarded-Encrypted: i=1; AJvYcCUS7lKAAWR1Q5tUi8e+wwcTmSCMSTZW24ECZspfDurbBrhagSXhCSI+teTbsbY1WVM077Ccf4aLHAsNMClV2p0jOB2ITg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw67PqXtGDGQojaybftmd6GTDNnSmqVZ0PkukR9emk3zunCUEKh
	BgCvikVFE0w16PJyPc4kRgvknANTLpY+WhDbfSoy3tleu6J5dOhetUau
X-Gm-Gg: ASbGncuYojrLeO8vHTT+FJ2v92jy3CDlWviQa3GyHoQCRPIAAxspT9ZJWB0U/6GxntJ
	VevaqsjWIl8VJLR1lZdsuJgVXe1wSkmRpkP/u8MZ/unGRaC6hmmBnbgbtzSSpGlZTQKBGoKr1cC
	gKa9m8VpgPURJuF986uVqKVcWv+xf99rSXGh5w1tGFQ7fVFRhdKsknjgNUNMOc4/upaiyNGnR+O
	SYkbAXoR+Kx0vrHh6MDFK+0GpJFGmbSDaQDOXtIaTSSvixXe8u7cSZoLtfhBVpCu4IjNNfr/NLz
	0eHzszcMuuAYFWdYHHTo76fGuGgezImw0kJAZwTOMOOOFXuK8gi+jHdLKXZHMJJ4jBWQCSGJPeP
	Uxq8bkO40NciNCE4dsKaE+eDYWb+E0uE=
X-Google-Smtp-Source: AGHT+IG3xbtJ7aB6w3otcsf12+CJy2T25OWBiy3cp3FPaOpHfRKzg+mfJFxHOfZ8gH7iNa/hMowAdw==
X-Received: by 2002:a17:902:ecc6:b0:240:b075:577f with SMTP id d9443c01a7336-24247025e7emr152480025ad.37.1754330352555;
        Mon, 04 Aug 2025 10:59:12 -0700 (PDT)
Received: from archlinux ([205.254.163.109])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899b6casm113511255ad.127.2025.08.04.10.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 10:59:12 -0700 (PDT)
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
Subject: [PATCH v4] x86/cpu/intel: Fix the constant_tsc model check for Pentium 4
Date: Mon,  4 Aug 2025 23:29:01 +0530
Message-ID: <20250804175901.13561-1-suchitkarunakaran@gmail.com>
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

Changes since v3:
- Refined changelog

Changes since v2:
- Improve commit message

Changes since v1:
- Fix incorrect logic

---
 arch/x86/kernel/cpu/intel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/intel.c b/arch/x86/kernel/cpu/intel.c
index 076eaa41b8c8..6f5bd5dbc249 100644
--- a/arch/x86/kernel/cpu/intel.c
+++ b/arch/x86/kernel/cpu/intel.c
@@ -262,7 +262,7 @@ static void early_init_intel(struct cpuinfo_x86 *c)
 	if (c->x86_power & (1 << 8)) {
 		set_cpu_cap(c, X86_FEATURE_CONSTANT_TSC);
 		set_cpu_cap(c, X86_FEATURE_NONSTOP_TSC);
-	} else if ((c->x86_vfm >= INTEL_P4_PRESCOTT && c->x86_vfm <= INTEL_P4_WILLAMETTE) ||
+	} else if ((c->x86_vfm >=  INTEL_P4_PRESCOTT && c->x86_vfm <= INTEL_P4_CEDARMILL) ||
 		   (c->x86_vfm >= INTEL_CORE_YONAH  && c->x86_vfm <= INTEL_IVYBRIDGE)) {
 		set_cpu_cap(c, X86_FEATURE_CONSTANT_TSC);
 	}
-- 
2.50.1

