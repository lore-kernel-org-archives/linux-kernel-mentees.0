Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1C9411F99
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 17 Oct 2026 11:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792235000; cv=none; b=DwL8+A3ChTX31jIzePA44x9KCQEov38Ax/lwkJ6ZslLMq7nd1wxLU8LfjDD9nGKef+51fRTYcLpuRAXelzxGusOC+TANzRrMzAeotfxpzz1tmOR6/XL0JqW+kQYk/Po/a5hNLOE5Q7wusfE2Q6lLfWcdImiTh3VbNyCQJOiMfRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792235000; c=relaxed/simple;
	bh=luspfJ1xZI4NzBO23wK7yIzNkEv+cTp75VYBXkmFvWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oob7noasCwabaJWZMP5MAwh+qX1YW3qPWCf/bYlF2Z0IVq+j+d8LF4gD8VhrJVam6VLiBiHYdaLQRiiCuZBQAhITqOATHZOvPmT/fi0CaaNPpJWqNKtarKnc0WpqC7cr9VR8Sxlou06jY74jDOd3m5VuQkVFp3Gz059EOg4CSuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lZ5jkzJD; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lZ5jkzJD"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e60f9af6e6so4545495ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 17 Oct 2026 04:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792234999; x=1792839799; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ny7KTMx+qld96qza0vCY0Dx/Bp+/LmW5iI7Izuhy18k=;
        b=lZ5jkzJDlGqunRj4o/mLo1g/VYzREaXdDFgpyYNBxCBoKV6g2AZCa5gfFuFY991chJ
         GNtoDaq7NN7hvxFtgrUv8dgMsFgOQ1Xxb4ZVErSgiBKE8ypv/TF5VaKRLe8PEIUQTDyI
         IEdXQGofriCZ73YS3XEINSZ/ghjng8CSgsQ/hlixhlX9nkuJaeDujwgzH6nf0xzoxM6u
         GyVQNI2lomcZOcinArUHSyAEKzCrgh1r94aacOCcAXrugRTxJmvkIgBlSgZYhS6ilA67
         7slj5wOMwlvdIgT5wtZghpUShRxZLEZLRyPcuby0pwX6s3VNhJNznq3JNloBWHQWRvds
         0yFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792234999; x=1792839799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ny7KTMx+qld96qza0vCY0Dx/Bp+/LmW5iI7Izuhy18k=;
        b=l4QuUcmk9/NCB1XF5vB9z2dyv9/8No9X7wNxpT+rt5yAroB2+4mOtBgwf4K7n5e30r
         YHSDyr/GuaA8W3jEDtuE2TuGLo5d8DosDSbAOR0vt5l3Y44VXEskf5lJl/C9XQi3wBUJ
         jFaveJIJWFeL8OfMaMYnEnjuZrkY85HlutxJJXg06ZHD7IG/gTOpWk+6SMoYeCuxFbm7
         +oo2H4BeoXfBOrzjAUu3J5nxrFGgXDlhwyxT7YxDKXYELN8CtDxs7vWjyvhjH92/dbWU
         O1EBIf0gnAJ4BRi1w5MqG55DeHIMm6dZmZ5tc+EbKAjSuIeb6WPxr6EP23VbR87aNHwe
         RGbg==
X-Forwarded-Encrypted: i=1; AKwUvBzHSI+5XbREFvg/LfIc2tNsHXIh4HQCEpHeQZMsgNerw4I2dmT6NIff1g1AE19p95gffntPzOiA6/Ao0HWcZNL7KpYlxw==@lists.linux.dev
X-Gm-Message-State: AFq9FYLRezACn7UU77RQgffaO/6CvhuFVhkNd9X9fXgj96RvgIw82/tV
	/QmzAc6tPw7xWebD66WPNqpwvOg6YWkNMWZs4me2uAFpb6aidAk6Iomz
X-Gm-Gg: AYBFou3n0net3uk+tVui0Ck8M2WHglRhynAiPQgaK1kuS5bL1cllJV8CAVLCRQ/x2j4
	rpHH4/t8lSMkSvqzcVau8Xq72Wxi6A75tgTFVZujb7yFLP7jdnPvMxicoIRb4YYZJE7GC/XaBol
	9+HBgBx9TvpLrLtmWaaPvA6a6gdhGUpeLBn80HMM261qeuQKbUtkGdQUzlENnrMh5IiDSWcx7iX
	29qKyD5udmnGCXmoIW0052hUtbyy9m5H4nWxvjHwU86WCD7bkatIASwuYQUAopsCj5Wms9N6Lvn
	g3tS6C1RVOc6EUzNra5TjYay/ZuYPfvuJT9qQCTXaotXAenqU8m4/pTtBYjhdpuRbZQa4Ssh4Sp
	W1TO0Fyi9aH/jk/mvqyG7N+IZmsc6riPKyHFE2s/uIglJnCZKvnnAGyi99YB/RW4PTz2KFYHr4J
	iimmMZKzFu8r2f2KgTHgipTydBakj9HYMsEI1tetSO+uTFsRUlkLhvcKyUdVGyGEXtdajTM63BB
	N/wZuMr6iCw/AMMh7oO8A==
X-Received: by 2002:a17:902:d512:b0:2e9:3c24:999 with SMTP id d9443c01a7336-2e9a6c0de51mr23081545ad.40.1792234999087;
        Sat, 17 Oct 2026 04:03:19 -0700 (PDT)
Received: from x1c ([2405:9800:b670:b64b:7c65:ff3e:80ba:b06])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e804dd9sm20559955ad.16.2026.10.17.04.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 04:03:18 -0700 (PDT)
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
Subject: [PATCH 4/5] KVM: selftests: Reserve memslot 1 for the ucall MMIO address
Date: Sat, 17 Oct 2026 18:02:12 +0700
Message-ID: <20261017110213.46199-5-tharitt97@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261017110213.46199-1-tharitt97@gmail.com>
References: <20261017110213.46199-1-tharitt97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Back the ucall MMIO address with a read-only region in slot 1
when KVM_CAP_READONLY_MEM is available. Writes still exit as
MMIO, while overlapping memslot creation is rejected.

Start test memslots at slot 2, leaving slot 1 reserved by
convention even when read-only memory is unsupported.

Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
 .../testing/selftests/kvm/include/kvm_util.h  |  2 +-
 tools/testing/selftests/kvm/lib/kvm_util.c    | 19 +++++++++++++------
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 759d604d44ce..4dbb2ef332fc 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -30,7 +30,7 @@
 
 #define KVM_DEV_PATH "/dev/kvm"
 #define KVM_MAX_VCPUS 512
-#define TEST_MEM_SLOT_BASE 1
+#define TEST_MEM_SLOT_BASE 2
 
 #define NSEC_PER_SEC 1000000000L
 
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 9ddc047d5c27..73e28814a226 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -20,6 +20,7 @@
 #include <linux/kernel.h>
 
 #define KVM_UTIL_MIN_PFN	2
+#define KVM_UCALL_MEMSLOT	1
 
 u32 kvm_random_seed;
 struct kvm_random_state kvm_rng;
@@ -492,6 +493,7 @@ struct kvm_vm *__vm_create(struct vm_shape shape, u32 nr_runnable_vcpus,
 	struct userspace_mem_region *slot0;
 	struct kvm_vm *vm;
 	int i, flags;
+	gpa_t mmio_gpa;
 
 	kvm_set_files_rlimit(nr_runnable_vcpus);
 
@@ -514,14 +516,19 @@ struct kvm_vm *__vm_create(struct vm_shape shape, u32 nr_runnable_vcpus,
 
 	kvm_vm_elf_load(vm, program_invocation_name);
 
-	/*
-	 * TODO: Add proper defines to protect the library's memslots, and then
-	 * carve out memslot1 for the ucall MMIO address.  KVM treats writes to
-	 * read-only memslots as MMIO, and creating a read-only memslot for the
-	 * MMIO region would prevent silently clobbering the MMIO region.
+	/* KVM treats writes to read-only memslots as MMIO, and creating
+	 * a read-only memslot for the MMIO region would prevent silently
+	 * clobbering the MMIO region.
 	 */
 	slot0 = memslot2region(vm, 0);
-	ucall_init(vm, slot0->region.guest_phys_addr + slot0->region.memory_size);
+	mmio_gpa = slot0->region.guest_phys_addr + slot0->region.memory_size;
+	ucall_init(vm, mmio_gpa);
+
+	if (vm_check_cap(vm, KVM_CAP_READONLY_MEM))
+		vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
+					    mmio_gpa, KVM_UCALL_MEMSLOT,
+					    vm_adjust_num_guest_pages(vm->mode, 1),
+					    KVM_MEM_READONLY);
 
 	if (kvm_random_seed != last_kvm_seed)
 		kvm_seed_rng(kvm_random_seed);
-- 
2.53.0

