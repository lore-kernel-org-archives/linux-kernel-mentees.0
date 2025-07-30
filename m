Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822C31624F7
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 30 Jul 2025 04:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753849589; cv=none; b=JPUsEJXZvn5N44DanCqkPzFV/28A23Xu3YikMTSLFyA4ApTVPQwh822F2BQWt/nFjwHcEdfNNa8d1a4xge9ggKL/M4PWFZEbYPeb5BBPsETEa9wvexqS0a+o5VXAA8iSfdaMUWSD4qK0bARVbLqdLcblqwtj4yp4HpfCQDi7e4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753849589; c=relaxed/simple;
	bh=//VizQTrkMZKkTiVcA5DAPQBw4oGz3v0bgb0dgqHP/g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jLYUExNA0HvFiDzDATMV82sMyezfbfPxuj6V8eWWRuyEtTBHZdN4gCWRM7lgdQrsNXXzeNwuxEaVck1hd1l8OWT8YiPr5Kl2kF/1850h+f0lbVCR8SDYFsdinucelUBHNce6MvwzswV+dsrNCXRTWSlUUvsWEwXUX4MjMNVvUnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CaaPigul; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CaaPigul"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b3bad2f99f5so496097a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 21:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753849587; x=1754454387; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q2V9USrBXsSBMCZmUVcYrTmHrRQnQ4b5hPFo+KGIp4o=;
        b=CaaPigulOsw4F8ujeRU36nLV4zT/CK3HuNoHP6LJ6b50ZIZPBukQMvs2X3HYZINk6b
         c5Um8S7qstbDPD4zASchNUJARM4Ven2DV5Tgs4xHra5POAV1HSPImlicTp+zwEh03yWd
         StwKocFvu29qxSVvvuodsuEqDKltT4ee5Epd0LkfbE0wEcDdsLoiew+PK/7hm5+wIowZ
         xoAprRXSEpsO/qeJpMTly8fBdzzTiANNAeGfsJ91wyfsP97FPi4sq1ymHFLkfZ+aVPMl
         kinUQPNKxipxmj2LXdSEYEcjhz8QoN5A9PreIfFcCZU6/tuI11xXvIjNSyaFJUUDAYv/
         OWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753849587; x=1754454387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q2V9USrBXsSBMCZmUVcYrTmHrRQnQ4b5hPFo+KGIp4o=;
        b=sFWMhU/uvCoKWAbWf7TMHQMvxVpEOGXdF7C1nzl1LX9G11IMPW/OV4D3mV9gqSL2wq
         IMS3WFgOTx+qO61goCWlZVP2lEocgbil5Kdtz+fkAbsDXa+oTG7wcxTJj1Z+8n6BwwRr
         NKPjQj6ZAt6aqb8bulzRtU/TU3zI++Plw5YZ8ukpQ0vJ2c/1mJX/I7X84t4fBGfcvMq7
         Bj9/Hsrv/WvqbUPzNfQQ53iouBY2y2cV1YT1HPHa2pDA7GAyVHeb3aXyGsWR/YJHeqRJ
         wklXRiCJ6/J5aP/A0DuqiQcznENjBI6reS0my1LScA3BADalnoIC4no1fqgiGO6gGTIU
         T/Gg==
X-Forwarded-Encrypted: i=1; AJvYcCVKZ8TarQqh+JhRz1+TE0JuAR5SSBYzi6REZazeqgD81dWzrUfUDgjJgBJV7yRyJt1feeE8g8ZfEGb9hRkzydBS2JTqfQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxnTjkmxZ3VFXIRp9n3XWbCjT7rm8yN5MjwUJg2mfbH1SeZZFD5
	SH2E9sro1NQzEITj2J6aGEhW7B9xNKlKn6q/HM3gbw1s9/di5bXaYJq2xXlnrLwXtdyUww==
X-Gm-Gg: ASbGncvgS9+jJvF+CR0V7cCNnXJQKOcvNN+WzCXK2QLLpEJe7S+iKJGjJdVGY3ZtoSy
	V5JQEcghGIyttu8PIpl725jVyKm2hiiF3IU81HCao59A18hGebK0L486uAh6D1yB+vXzfKW1/6c
	QEaGIqjD6JryBV4U2FUWDyw/usg3smkKp1HsERq1r8lN1CRQ09cGhq2SDNvlwzJ+ZU39lGH+aA7
	rbaDBTaVdES8TFlLummdohLPCB8xcINdtDjYcVRyOPf89fOoCmiuU7JXc5EWrJy2lxd+OfsSTT7
	KVe5YHyvO5pXAQGV106E8b2QLLk9LIME5hdFazy3G+psqwcatmmx5E8mPLJI0QV3fBlwacQx4A+
	umo/hyBfAW07qK4fTssfA0ylWOr1A9A==
X-Google-Smtp-Source: AGHT+IGuv6wRtmjN8iZHw6frGooIYv84EAacrIywVuTREWybq2JpFF/vHKdmzkeZcnWiVJkvvOmwEA==
X-Received: by 2002:a17:902:f544:b0:234:986c:66cf with SMTP id d9443c01a7336-24096884323mr31485585ad.16.1753849587064;
        Tue, 29 Jul 2025 21:26:27 -0700 (PDT)
Received: from archlinux ([38.188.108.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24058bbb554sm38795635ad.50.2025.07.29.21.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 21:26:26 -0700 (PDT)
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
Subject: [PATCH v3] x86/cpu/intel: Fix the constant_tsc model check for Pentium 4s
Date: Wed, 30 Jul 2025 09:56:17 +0530
Message-ID: <20250730042617.5620-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The logic to synthesize constant_tsc for Pentium 4s (Family 15) is
wrong. Since INTEL_P4_PRESCOTT is numerically greater than
INTEL_P4_WILLAMETTE, the logic always results in false and never sets
X86_FEATURE_CONSTANT_TSC for any Pentium 4 model.
The error was introduced while replacing the x86_model check with a VFM
one. The original check was as follows:
        if ((c->x86 == 0xf && c->x86_model >= 0x03) ||
                (c->x86 == 0x6 && c->x86_model >= 0x0e))
                set_cpu_cap(c, X86_FEATURE_CONSTANT_TSC);

Fix the logic to cover all Pentium 4 models from Prescott (model 3) to
Cedarmill (model 6) which is the last model released in Family 15.

Fixes: fadb6f569b10 ("x86/cpu/intel: Limit the non-architectural constant_tsc model checks")

Cc: <stable@vger.kernel.org> # v6.15

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>

---

Changes since v2:
- Improve commit message

Changes since v1:
- Fix incorrect logic

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

