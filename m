Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FDC1925BC
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 24 Jun 2026 13:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782306183; cv=none; b=N3Slcd8KO/InVh5JoUdSRjh62P7miIhVve1piF9zoKvCGZEjRb0phxvWJipDkGJLZtM3n84VATzMJEq/cpNHY/Uk2kj+PRVjW8TSD5u3SX4w8ovdFv3B3hDBnHY/nibMtLnZMC0s4Wks/So9KTrPgNYlQASw6vGT5dftX6wVrlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782306183; c=relaxed/simple;
	bh=QDHxV7W+oqGlbIXZMJ7I++MZaMSnKMppWqlbLCG4DYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ia94oJrFUZEmxazpeodp9aMronfRPlWBlIxvV4W/5y5PbvWJ347UJcbsb2b+Kck6g3iuUzotHnjZY26G6eqZUJyUKMN40V4Qxk4X5p8++63oSSti+515b6H5PwLoLOEQ22AK6PnuFZSRLnARaxsEu50jnQOU+PkmgUf0cZvQqCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=elFy8CFj; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="elFy8CFj"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c68190ade4so14167805ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 24 Jun 2026 06:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782306181; x=1782910981; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JQUuPMmuv/cgtI0GhaDa2PT2gy6UgZhnkw9/EmvR3IU=;
        b=elFy8CFjYOBKoAw2Wtgl7ViNSbPXDNwaKVmzkWL5HUQ5gKIDur8Acfy3yiFQUwe2sv
         Z44ER9Aj+mDsFA2XVb72Y8hJQ4Fzz+h5wOEIQMVZ+soc0eocpo3B56lwR4ATwqNXJssB
         qY2/idqANbscmETNFKaOlzku8nzFFX2kUxpE9pFQJPjt7DWgViOt7V3dwV7DYTHVdAcb
         IyWDF0CvIDwPlSPfCwXneaiinrlyUU1iIj9x8o+VgXt9rCE9giLsl3LcQAbOv39SHJeW
         g8QKbsaOZhI2/rm46Uztj/InPM2Uvv6cj02lY8VFApQoV+dxjLJLsE4ElzHE9KsSMUbL
         d22A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782306181; x=1782910981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQUuPMmuv/cgtI0GhaDa2PT2gy6UgZhnkw9/EmvR3IU=;
        b=PBkwh+ESdciBi6lmy4WCCHUwq6ChcPGrWD08VQwLCIht8H76b1Cyy0uYCQihI/VFkC
         OpPx/JpuBxJo5WvxphmA8QsxX0y/L+8te26sQ8H/HBcpPm1Sstg8oP4OXH1V1wDfiSyb
         L0Unlnp1ixae+ybH7VmtPBBB8taEIZS8fOwE5q4XDDSvOxQubfmN76szzLGaYw5qscpB
         A9sTU0/ZGA7X49FU844UbZZh+pob7IzQ8Kb6kkDyZyMGo/vsWQlMswQC7s6qUuvFwHzi
         q0oI82B9QOZu6LhkKG8x7IFvf+aKiXobMJ07VRFnddpPNQqISveBwtLJqvndnab4FlVW
         eBtg==
X-Forwarded-Encrypted: i=1; AHgh+RoTwOFNWz1pkTESDN53vTtiv1zNB0PLgtxcFfwvac1S9+N88nASXU/Um8sApPsXl++nzA8ZrD+0EuauYtoG93wcpNtLZQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwaCec7rWMdJ9utBcIIyy0D5gbu2w/ISOZtGixI1y4uDwzRMDtF
	HKcM5WDDv+Oq2bs/kRUYS0cyyP/WSyL6H56VQn+CiJ32h84/HqPZNY7l
X-Gm-Gg: AfdE7ckbyfHWbzgdBizCUeSbmr1HS0DCiuHtZ6NAtrFdkFFWsb/9AjYLk1cXZEQyzg/
	Kk6ZEOxWJK3am5hZg0XH5/zvPN720WvfvRhT/UGMMi3UTDJnsVtmD4iRdhNEioHyr2h9djcF9WV
	R/2DNHWvD6zHe1DVLd0Wl2Q0W6Ng9m3NhJR3fPLn+C4FgCBd5p1y48RrSJes7l6KCLq0+dI6vEs
	6u1W135ZhfVVr07iK6Qaajnmv3igTne8eFK9wRsmjkjR9JX1/BOXcsYnBqRV9NzwdhweCYFWUZE
	ielJG/cxB7h8mou+7liPaKD5BAoFJUSDkB7MWEDNwOp5rt0nXpPU8PR/yhPxyCzTaMTRv7ej/r6
	54vesu8yAUH+J5ZiXVwFcowGW/yb6L0VnYxCVk+ufTtInK5nVoW6K7pdAv6brBJ2AgOzbjA41Kg
	HB1Y+pE/RlRP2LM9f035JLWAKPKm2KMlQrJKuxo9CA+z80fQ8=
X-Received: by 2002:a17:902:e5cd:b0:2c6:a4ed:efec with SMTP id d9443c01a7336-2c7c40168b9mr61894555ad.27.1782306177091;
        Wed, 24 Jun 2026 06:02:57 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7444aad8esm134704505ad.76.2026.06.24.06.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 06:02:56 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: anup@brainfault.org
Cc: atish.patra@linux.dev,
	cleger@rivosinc.com,
	ajones@ventanamicro.com,
	skhan@linuxfoundation.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel-mentees@lists.linux.dev,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH] KVM: riscv: SBI FWFT: Apply LOCK flag only on successful set
Date: Wed, 24 Jun 2026 22:02:38 +0900
Message-ID: <20260624130238.524706-1-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kvm_sbi_fwft_set() applies the caller's flags to conf->flags before
invoking the set() callback. If the callback returns an error, the LOCK
bit persists and the feature becomes permanently locked without its value
ever being changed.

Move the flags assignment after the callback so LOCK takes effect only
on success.

Fixes: 6b72fd170592 ("RISC-V: KVM: add support for FWFT SBI extension")
Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
---
 arch/riscv/kvm/vcpu_sbi_fwft.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
index ab39ac464ffd..1342adb3180c 100644
--- a/arch/riscv/kvm/vcpu_sbi_fwft.c
+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
@@ -327,9 +327,11 @@ static int kvm_sbi_fwft_set(struct kvm_vcpu *vcpu, u32 feature,
 	if (conf->flags & SBI_FWFT_SET_FLAG_LOCK)
 		return SBI_ERR_DENIED_LOCKED;
 
-	conf->flags = flags;
+	ret = conf->feature->set(vcpu, conf, false, value);
+	if (ret == SBI_SUCCESS)
+		conf->flags = flags;
 
-	return conf->feature->set(vcpu, conf, false, value);
+	return ret;
 }
 
 static int kvm_sbi_fwft_get(struct kvm_vcpu *vcpu, unsigned long feature,
-- 
2.52.0

