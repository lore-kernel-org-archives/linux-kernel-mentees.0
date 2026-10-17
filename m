Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99275399003
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 17 Oct 2026 11:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792234963; cv=none; b=R7f9J/m/jb1IGQjkQfqaj6dweD6LBPfRaqZ43yFf/p2KnoYeP4OAW/ON7I4S2MLi1WVkaK18Q2NMmJfzFrJ4EIO2I8RAZZG97UrfzJIf/v/kxW8luRYTrzeCkkoy9zl0q/26oyC+nJ3tb89Bi34ulzltyC4hafFmUtPDh4WAuqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792234963; c=relaxed/simple;
	bh=8ywuulccP1F+xp8m0G/rdMRl+HXUX9U2tjWY4yPqxJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BO81gkpcXyV63/ACINakLG90WDQTPPlWa7TP6Incou1ICaNEY9F9OxrORa/diflR9SOJBCrtyJW8qJ9rGV1hIHeV8Rez6+QnrMIrxKeYcHzvxojY6xYtlLlgUjA1brS3dLn1oYyFjTxLd0SmDyQy5clGNA26tNKKz53Ww21yNM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ifQsXdtw; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ifQsXdtw"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e95bd1c14cso5450215ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 17 Oct 2026 04:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792234961; x=1792839761; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Khy5mpRZBeQDtqVcHeSI4CoZNFAypt9Icm1BgzV+FWo=;
        b=ifQsXdtwgBzl7/jRtv/6jgzQ9LBQT7Qc5w4pEqlHVjUYOBJ/I4xTn+4rcTZonHNuQk
         Pov7HIrZr02Zefve2S0ICVQehbCxQKHSqENTQK75vAHYiX/cqo7OePq54xyKVPKM03AW
         jLNm5UMlPNfdHuNLlxsUDTcffSeifLdwIT8m0hVpxVZr7Wx8LWaMxuRGm5HnPbMmeoN9
         0tfZEPWWA+3McSjfwJNaXgsR4fz7jz4K8GRVjmRVi/UNyV8fp5JSReQOSJEzkD9dP3t7
         ZRUwJGTziop7SRAPJOA/muvhBEqIhEjfOp5nKlIOKBmJjNMdZfoY4XxetgUI2hcpHe7X
         9nVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792234961; x=1792839761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Khy5mpRZBeQDtqVcHeSI4CoZNFAypt9Icm1BgzV+FWo=;
        b=Ist2OLoQ0l1oxZYb2kdRa7VkoNGaJZItdsqWpxgTJn3O90M9KELQFkUHYxnZkZRR4w
         cbkfo45xd2yT3VUi5k5ADpaug5T7sl8IOoJUmD+sZVUvv9EqeKsRkMt4vOXbZGJ7lYhh
         bG0kkbFRVAV/YP6pXohyUjVzhihQ9uIm/4w2UREzd3I/CnGLIoKjnf8n51XLexohV5aK
         9fMKO2gGJ4nbXdE69pawnvz1H/hA5/ZKMclqYbhbbYKbVslWk76BzynZkgFUfVyh22nn
         NlSD2YKRU13hl90GifCg41OJJx6TmvmeVb/X6MkSnGhrsWupqQhlLhbgdNkjx/fcK6Ju
         3bOw==
X-Forwarded-Encrypted: i=1; AKwUvBwE425AuMhD2x4my41GQqCkdl4BUo3YbleosQW/oH1ZTfQC6LmfpwwtZb1xdf6nTGgj+GnW8tauJUPn4kJcGLl61F9I9w==@lists.linux.dev
X-Gm-Message-State: AFq9FYLdQd++VqIHzcE0vL4oc2fPBi70ahX7s/22L3cQi7uo4KMhNW2T
	8Iy6Nner5wNfVzdtXsZsk7Ho8Jry2Rtzekw59mAIEYR12JTvjqmNvwo9
X-Gm-Gg: AYBFou1/execqflAsuK55/NXaVY+expobqrXDuFOt1RDguKfxd7XTO1je5Lu4Vq4izB
	rPv7Roqc1/JcP1DAezp66ynKQFkqElgZTdB9tJHaMdzm849jthFazESaKR3xvJy8U17yLolbHHo
	a63OF1/x4/pAPvl4x/0A2b5FPl1E+KKkMbICWwkUmdAVLkn+yK4ikWWJMPLluhXuY6Iq75RlnfN
	89XtsuCWF2jL0Y7Zod9uAJ3Y2PwCxZOFY1dXlUmXDFWoQWenEW3xLYCgkaGS3O3qHJi3BBRnDK2
	bOljMWoCx4X04do5YFjYF0NcjllHTn8+1kMGASrgynZFP9U4FX/NlOs+zT7krK2B79ZjsUF5iEb
	CmejxEcktNdpqIzxCIYKWXl77iPrMkzRtoJME1qxZkbpY67OHaezLrpVmM8UjlUfE6f8iSG/7H9
	gxKxOYLwuyfvFhV/JNy1It4tz6aHvWik3UYLbGqbLF+29IrfkEt0SDvIxHwbmgunRdAF+GfAMr0
	OXS2JJzrqgd2FI48cUdGk1vXdtB8A72
X-Received: by 2002:a17:903:283:b0:2e7:4a2f:68e6 with SMTP id d9443c01a7336-2e9a6c0de31mr22453835ad.39.1792234960910;
        Sat, 17 Oct 2026 04:02:40 -0700 (PDT)
Received: from x1c ([2405:9800:b670:b64b:7c65:ff3e:80ba:b06])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e804dd9sm20559955ad.16.2026.10.17.04.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 04:02:40 -0700 (PDT)
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
Subject: [PATCH 1/5] KVM: selftests: Introduce a shared base for test memslots
Date: Sat, 17 Oct 2026 18:02:09 +0700
Message-ID: <20261017110213.46199-2-tharitt97@gmail.com>
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

Replace hardcoded slot 1 assignments with TEST_MEM_SLOT_BASE
This prepares tests for reserving slot 1 for library use.

Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
 tools/testing/selftests/kvm/arm64/hypercalls.c               | 3 ++-
 tools/testing/selftests/kvm/arm64/sea_to_user.c              | 2 +-
 tools/testing/selftests/kvm/arm64/stage2_block_transitions.c | 2 +-
 tools/testing/selftests/kvm/arm64/vgic_its_save.c            | 2 +-
 tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c          | 2 +-
 tools/testing/selftests/kvm/dirty_log_test.c                 | 2 +-
 tools/testing/selftests/kvm/guest_memfd_test.c               | 2 +-
 tools/testing/selftests/kvm/include/kvm_util.h               | 1 +
 tools/testing/selftests/kvm/kvm_page_table_test.c            | 2 +-
 tools/testing/selftests/kvm/mmu_stress_test.c                | 2 +-
 tools/testing/selftests/kvm/riscv/sbi_pmu_test.c             | 3 ++-
 tools/testing/selftests/kvm/steal_time.c                     | 3 ++-
 tools/testing/selftests/kvm/x86/nested_dirty_log_test.c      | 2 +-
 tools/testing/selftests/kvm/x86/nested_vmsave_vmload_test.c  | 2 +-
 14 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/hypercalls.c b/tools/testing/selftests/kvm/arm64/hypercalls.c
index 391e2ba58b0b..ff7c21738a96 100644
--- a/tools/testing/selftests/kvm/arm64/hypercalls.c
+++ b/tools/testing/selftests/kvm/arm64/hypercalls.c
@@ -191,7 +191,8 @@ static void steal_time_init(struct kvm_vcpu *vcpu)
 	unsigned int gpages;
 
 	gpages = vm_calc_num_guest_pages(VM_MODE_DEFAULT, STEAL_TIME_SIZE);
-	vm_userspace_mem_region_add(vcpu->vm, VM_MEM_SRC_ANONYMOUS, ST_GPA_BASE, 1, gpages, 0);
+	vm_userspace_mem_region_add(vcpu->vm, VM_MEM_SRC_ANONYMOUS, ST_GPA_BASE,
+				    TEST_MEM_SLOT_BASE, gpages, 0);
 
 	vcpu_device_attr_set(vcpu, KVM_ARM_VCPU_PVTIME_CTRL,
 			     KVM_ARM_VCPU_PVTIME_IPA, &st_ipa);
diff --git a/tools/testing/selftests/kvm/arm64/sea_to_user.c b/tools/testing/selftests/kvm/arm64/sea_to_user.c
index d4af6e0eed28..bb552debc61c 100644
--- a/tools/testing/selftests/kvm/arm64/sea_to_user.c
+++ b/tools/testing/selftests/kvm/arm64/sea_to_user.c
@@ -323,7 +323,7 @@ static struct kvm_vm *vm_create_with_sea_handler(struct kvm_vcpu **vcpu)
 		/*vm=*/vm,
 		/*src_type=*/src_type,
 		/*gpa=*/start_gpa,
-		/*slot=*/1,
+		/*slot=*/TEST_MEM_SLOT_BASE,
 		/*npages=*/num_guest_pages,
 		/*flags=*/0);
 
diff --git a/tools/testing/selftests/kvm/arm64/stage2_block_transitions.c b/tools/testing/selftests/kvm/arm64/stage2_block_transitions.c
index 5fd47f4ada1f..0e23d7b55782 100644
--- a/tools/testing/selftests/kvm/arm64/stage2_block_transitions.c
+++ b/tools/testing/selftests/kvm/arm64/stage2_block_transitions.c
@@ -41,7 +41,7 @@
 #include "test_util.h"
 #include "ucall.h"
 
-#define DATA_SLOT		1
+#define DATA_SLOT		TEST_MEM_SLOT_BASE
 #define TEST_GVA		0xc0000000UL
 #define BLOCK_SIZE		SZ_2M
 
diff --git a/tools/testing/selftests/kvm/arm64/vgic_its_save.c b/tools/testing/selftests/kvm/arm64/vgic_its_save.c
index 864da01539f3..e858a4aa741d 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_its_save.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_its_save.c
@@ -29,7 +29,7 @@
 #include "ucall.h"
 #include "vgic.h"
 
-#define TEST_MEMSLOT_INDEX	1
+#define TEST_MEMSLOT_INDEX	TEST_MEM_SLOT_BASE
 
 /* All three ITS table entry sizes are 8 bytes in ABI 0. */
 #define ESZ			8
diff --git a/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c b/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
index 9a69c439a0f8..1d5c56481053 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
@@ -18,7 +18,7 @@
 #include "ucall.h"
 #include "vgic.h"
 
-#define TEST_MEMSLOT_INDEX	1
+#define TEST_MEMSLOT_INDEX	TEST_MEM_SLOT_BASE
 
 #define GIC_LPI_OFFSET	8192
 
diff --git a/tools/testing/selftests/kvm/dirty_log_test.c b/tools/testing/selftests/kvm/dirty_log_test.c
index af5eb0334a74..75084fe3bec6 100644
--- a/tools/testing/selftests/kvm/dirty_log_test.c
+++ b/tools/testing/selftests/kvm/dirty_log_test.c
@@ -26,7 +26,7 @@
 #define PAGE_SHIFT_4K  12
 
 /* The memory slot index to track dirty pages */
-#define TEST_MEM_SLOT_INDEX		1
+#define TEST_MEM_SLOT_INDEX		TEST_MEM_SLOT_BASE
 
 /* Default guest test virtual memory offset */
 #define DEFAULT_GUEST_TEST_MEM		0xc0000000
diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
index 2233d871a38f..231bfe238e31 100644
--- a/tools/testing/selftests/kvm/guest_memfd_test.c
+++ b/tools/testing/selftests/kvm/guest_memfd_test.c
@@ -510,7 +510,7 @@ static void test_guest_memfd_guest(void)
 	 * the PCI hole and other MMIO regions that need to be avoided.
 	 */
 	const gpa_t gpa = SZ_4G;
-	const int slot = 1;
+	const int slot = TEST_MEM_SLOT_BASE;
 
 	struct kvm_vcpu *vcpu;
 	struct kvm_vm *vm;
diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 5a7a455b5387..759d604d44ce 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -30,6 +30,7 @@
 
 #define KVM_DEV_PATH "/dev/kvm"
 #define KVM_MAX_VCPUS 512
+#define TEST_MEM_SLOT_BASE 1
 
 #define NSEC_PER_SEC 1000000000L
 
diff --git a/tools/testing/selftests/kvm/kvm_page_table_test.c b/tools/testing/selftests/kvm/kvm_page_table_test.c
index 974813ea8953..f18720109319 100644
--- a/tools/testing/selftests/kvm/kvm_page_table_test.c
+++ b/tools/testing/selftests/kvm/kvm_page_table_test.c
@@ -20,7 +20,7 @@
 #include "guest_modes.h"
 #include "ucall_common.h"
 
-#define TEST_MEM_SLOT_INDEX             1
+#define TEST_MEM_SLOT_INDEX             TEST_MEM_SLOT_BASE
 
 /* Default size(1GB) of the memory for testing */
 #define DEFAULT_TEST_MEM_SIZE		(1 << 30)
diff --git a/tools/testing/selftests/kvm/mmu_stress_test.c b/tools/testing/selftests/kvm/mmu_stress_test.c
index 741e343962ed..b965a8b9d214 100644
--- a/tools/testing/selftests/kvm/mmu_stress_test.c
+++ b/tools/testing/selftests/kvm/mmu_stress_test.c
@@ -273,7 +273,7 @@ int main(int argc, char *argv[])
 	 * 1gb-3gb,but it's simpler to skip straight to 4gb.
 	 */
 	const u64 start_gpa = SZ_4G;
-	const int first_slot = 1;
+	const int first_slot = TEST_MEM_SLOT_BASE;
 
 	struct timespec time_start, time_run1, time_reset, time_run2, time_ro, time_rw;
 	u64 max_gpa, gpa, slot_size, max_mem, i;
diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
index 20388f0b959d..6abd74870e01 100644
--- a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
+++ b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
@@ -605,7 +605,8 @@ static void test_vm_events_test(void *guest_code)
 static void test_vm_setup_snapshot_mem(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
 {
 	/* PMU Snapshot requires single page only */
-	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, PMU_SNAPSHOT_GPA_BASE, 1, 1, 0);
+	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, PMU_SNAPSHOT_GPA_BASE,
+				    TEST_MEM_SLOT_BASE, 1, 0);
 	/* PMU_SNAPSHOT_GPA_BASE is identity mapped */
 	virt_map(vm, PMU_SNAPSHOT_GPA_BASE, PMU_SNAPSHOT_GPA_BASE, 1);
 
diff --git a/tools/testing/selftests/kvm/steal_time.c b/tools/testing/selftests/kvm/steal_time.c
index 785d19f9ee8f..e386580ef540 100644
--- a/tools/testing/selftests/kvm/steal_time.c
+++ b/tools/testing/selftests/kvm/steal_time.c
@@ -509,7 +509,8 @@ static struct kvm_vm *vm_create_steal_time(u32 nr_vcpus, void *guest_code,
 	/* Create a VM and an identity mapped memslot for the steal time structure */
 	vm = vm_create_with_vcpus(nr_vcpus, guest_code, vcpus);
 	gpages = vm_calc_num_guest_pages(VM_MODE_DEFAULT, STEAL_TIME_SIZE * nr_vcpus);
-	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, ST_GPA_BASE, 1, gpages, 0);
+	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, ST_GPA_BASE,
+				    TEST_MEM_SLOT_BASE, gpages, 0);
 	virt_map(vm, ST_GPA_BASE, ST_GPA_BASE, gpages);
 
 	return vm;
diff --git a/tools/testing/selftests/kvm/x86/nested_dirty_log_test.c b/tools/testing/selftests/kvm/x86/nested_dirty_log_test.c
index 26b474bf1353..e86d625b3e89 100644
--- a/tools/testing/selftests/kvm/x86/nested_dirty_log_test.c
+++ b/tools/testing/selftests/kvm/x86/nested_dirty_log_test.c
@@ -16,7 +16,7 @@
 #include "vmx.h"
 
 /* The memory slot index to track dirty pages */
-#define TEST_MEM_SLOT_INDEX		1
+#define TEST_MEM_SLOT_INDEX		TEST_MEM_SLOT_BASE
 
 /*
  * Allocate four pages total.  Two pages are used to verify that the KVM marks
diff --git a/tools/testing/selftests/kvm/x86/nested_vmsave_vmload_test.c b/tools/testing/selftests/kvm/x86/nested_vmsave_vmload_test.c
index a130759f39a1..4bc57e5e40e3 100644
--- a/tools/testing/selftests/kvm/x86/nested_vmsave_vmload_test.c
+++ b/tools/testing/selftests/kvm/x86/nested_vmsave_vmload_test.c
@@ -17,7 +17,7 @@
  * interpreted as a direct L1 GPA or translated using NPT as an L2 GPA, depends
  * on which VMCB is accessed.
  */
-#define TEST_MEM_SLOT_INDEX		1
+#define TEST_MEM_SLOT_INDEX		TEST_MEM_SLOT_BASE
 #define TEST_MEM_PAGES			2
 #define TEST_MEM_BASE			0xc0000000
 
-- 
2.53.0

