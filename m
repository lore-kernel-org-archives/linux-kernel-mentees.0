Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B58B1C1F22
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 17 Oct 2026 11:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792234951; cv=none; b=hxTK4qBmKEFLCQT1aRUTQ+af6ou2dQwu/hRedev4KYPsfMxUbomTIBO3ueZCOsfylT3YnEZ7aX5Q5GCHLNJkeHCRgAR6+qCJG4wzGtM/Cg1DOmVu+AX1z5h1aEkWLwGNPT5cCBMX6BS8WTOBWU9GCKArCcn6+t6L4Vi0uaazY8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792234951; c=relaxed/simple;
	bh=FjGEp2k4FfSPM+tdsngqSEiml++4V5/mJNGAoCdd2oA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OqgEZb67hy1BI1K1g/Wnob8f59vPS6kX4TkgRahScwxEm5mNEUDJoOZE+L9+TUy1ZKBup4fnpr55V6futx4gr+e/dhEXPJXS4atfZpDNzDvjCPCpZtQHqQDkgrzjHvA7LBp1N0mfcpXKIs1UUDSqHjoytr7akY5xrTVlKXbD0Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bFCOO+ss; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bFCOO+ss"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e9ae391a05so3781865ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 17 Oct 2026 04:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792234949; x=1792839749; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EooerGosbt9uNoLNk2R3r8CmWtmPXhr2JTyWgkAeP44=;
        b=bFCOO+ssL8oDe6DYi0XEhQId3s5Wh6VgfuOOVCCi4s9+spfqtGUUm2pLyaJUQZEWny
         ji6LoDIVkXtfUKKo6C6P8/0alKjwKEFFFfS68aZiTgL+2aiVrLWkX8JjECxcc/y2pced
         /5N92eDyNRq9wPE2jMlhmxvF5/LO+v2vjqzn+umFSTJYGRBbXHbiaxMGYm60PWqoy7cY
         GzXyObCFFCyqozq1PLAcN7oHy/w3y2UsYGeAKl2U5PuUin7bqivae8pzOnUZa1pkrrbB
         hrv+lfbYUcvSCzNWwtR+OP2B0BkhSGwjf90k18mf5y61geqWoChLLvsjdJ0OhZB7C9rC
         d1oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792234949; x=1792839749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EooerGosbt9uNoLNk2R3r8CmWtmPXhr2JTyWgkAeP44=;
        b=GHqmUHYURBD4o7DMyIKiHrdOMce/77SJqR1plkTUuMt6WAIpg6wyfBDZY9erWCdDkI
         2MCLRnOLaNpNxzz5u8pRcvQvo7Owjpu0Tn2saNhRSBDyTy21EBO92w/727gwsmMVpzcE
         1AQVWcPA1IDgC8oeChuC6GUhw0+jtyxf+CzqW7rLJJLYX3Lr3UQP2gv/4vYip+DUFqF4
         c0vodgMaoiHaXfsp63LnhP0BGSZnMsk/o7RZZKK0b0AIOFaw6zV5MsBJ3Ct/s2nbFo1t
         qbOydCgpGUynRorqSwYhSbf1S71VARkrc+MFTMHoZ8B2bkDmOc2XqjybYGbVx2edXX8W
         N1oA==
X-Forwarded-Encrypted: i=1; AKwUvBwT7XSsjj0ERmIz97sinyrrADQG8jx9QLfPL/lOHxYHvvk/GUQdyVcU6He3YWkK3ySpE9t8iTBvyonKeY2S7v8Jz8Nyxg==@lists.linux.dev
X-Gm-Message-State: AFq9FYIrBkv4eRzKEemcpNCX5QEogReLJHRdqxzcV6WyqrcWzdKN3qUd
	EsYEtYvN/cfqrVCMKG86IBiNkxO2D9ZB2DHizO7klD4KgmFRgktFtvxD
X-Gm-Gg: AYBFou19+O8KZ51mIkkwXzicT2IWWluXxfcdv2osMBto9U/6nxlRCbL+IE/W7Je45dF
	cN2tOekMWKa+mSyk3Oksl8nIS14pTbzDnR91Jaethj0Iq6+WMv6eNU2hSpjqty/ZXGoBLGLldv4
	a5OWpVXOtMizIulSGreAcEzyLw6UNF+FMJUHwONsDwJ0YckwIzzbWjetmBLHI9pz8wzIiUcTuYQ
	mnTKFfsf3Gw/+7gn+0Splk2kMuqVEYhMGvhb4SuPWz8Wx23ShZaKhFkCL8TBczYXTnccCTdxXlL
	41BQYNBFik61ZSakCiDzJyfiAOo+jjN79LeJJTYipieC+5yhf3d95UNGWAtInt7QrU3JTeISKjO
	ifPkxyWhljH3nZyyQfa77giAWPI+X7HSOAwLUXA6DhVkTUftAx2bhgohxrDwIVskTU8vpj+MnbN
	zP0/Kkbp6PbgjW4uaYqcEV7XdMjddq3M3ixrgZjhMhHefWKiCFIjPhMRhqYbWDb7fS2QOUUv/qe
	XCBDVKJiDFHgCFcu/ZoSQ==
X-Received: by 2002:a17:903:1a10:b0:2df:a0d4:71de with SMTP id d9443c01a7336-2e9a66ebc71mr15900275ad.0.1792234948529;
        Sat, 17 Oct 2026 04:02:28 -0700 (PDT)
Received: from x1c ([2405:9800:b670:b64b:7c65:ff3e:80ba:b06])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e804dd9sm20559955ad.16.2026.10.17.04.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 04:02:28 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: Shuah Khan <shuah@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH 0/5] KVM: selftests: Reserve memslot 1 for ucall MMIO
Date: Sat, 17 Oct 2026 18:02:08 +0700
Message-ID: <20261017110213.46199-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series addresses the TODO in __vm_create() to reserve memslot 1
for the ucall MMIO region. It introduces a shared base for test
memslots, migrates existing test users, and adds a read-only region to
prevent overlapping allocations.

A regression test verifies overlap rejection and continued ucall
operation.

Testing:
- Intel Core i5-10210U and Rockchip RK3588 (arm64).

These tests are changed but not tested: 
- arm64/sea_to_user.c: not enough memory allocation.
- x86/nested_vmsave_vmload_test.c: requires X86_FEATURE_SVM.
- riscv/sbi_pmu_test.c: riscv hardware unavailability.

The following test failures reproduce on both the unmodified base
<8edffbc1f6272db167037e1a8c49b99e9cd04803> with host kernel 
7.3.0-rc1-gd4b7fb647204 on RK3588 and with this series applied:
- arm64/vgic_its_save.c
- arm64/hypercalls.c

These failures are unchanged by this series.

Tharit Tangkijwanichakul (5):
  KVM: selftests: Introduce a shared base for test memslots
  KVM: selftests: Use the shared memslot base in memslot_perf_test
  KVM: selftests: Use the shared memslot base in memstress
  KVM: selftests: Reserve memslot 1 for the ucall MMIO address
  KVM: selftests: Test protection of the ucall MMIO region

 tools/testing/selftests/kvm/Makefile.kvm      |  1 +
 .../testing/selftests/kvm/arm64/hypercalls.c  |  3 +-
 .../testing/selftests/kvm/arm64/sea_to_user.c |  2 +-
 .../kvm/arm64/stage2_block_transitions.c      |  2 +-
 .../selftests/kvm/arm64/vgic_its_save.c       |  2 +-
 .../selftests/kvm/arm64/vgic_lpi_stress.c     |  2 +-
 tools/testing/selftests/kvm/dirty_log_test.c  |  2 +-
 .../testing/selftests/kvm/guest_memfd_test.c  |  2 +-
 .../testing/selftests/kvm/include/kvm_util.h  |  1 +
 .../testing/selftests/kvm/include/memstress.h |  2 +-
 .../selftests/kvm/kvm_page_table_test.c       |  2 +-
 tools/testing/selftests/kvm/lib/kvm_util.c    | 19 ++++--
 .../testing/selftests/kvm/memslot_perf_test.c | 62 +++++++++++--------
 tools/testing/selftests/kvm/mmu_stress_test.c |  2 +-
 .../selftests/kvm/reserved_slot_test.c        | 61 ++++++++++++++++++
 .../selftests/kvm/riscv/sbi_pmu_test.c        |  3 +-
 tools/testing/selftests/kvm/steal_time.c      |  3 +-
 .../selftests/kvm/x86/nested_dirty_log_test.c |  2 +-
 .../kvm/x86/nested_vmsave_vmload_test.c       |  2 +-
 19 files changed, 128 insertions(+), 47 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/reserved_slot_test.c

-- 
2.53.0

