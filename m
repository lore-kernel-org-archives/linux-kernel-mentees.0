Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450014FECD9
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 18 Sep 2026 14:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789741282; cv=none; b=dftEo8ug1NIfki4QUEvFopUFPvsBXp+GdhzVd84gP5+d6ZmEv1NSocQGcQIQHi1S7pTQXYTO4Ii2UkS8cCM122Lh7gyMRqfLFaA79ZUQZ1s5n8n+/DXfVk1DNyufbF1C6MbgdykNcCJLHj/LkbHsM0iySPkNBBO/dVFeYts8Nmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789741282; c=relaxed/simple;
	bh=rdkuxtYhkkz5bw7bkfe0Y9gpgI/oRos0ZP5NsumQ488=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jXKYQowxhpeGdd61DGIZpxOK3xxL+TkAXW3kBnxpTCkIFIPVn+eU9wMTUYs7PVVP8NGUiv4yQ04Ds/E4kUqVMMNDhQWq3tgln/6ZDXtKK6synIYmysXt0Aq8wrQOy84bxYQkgDEDajKcnmCn2NJwMvj+Eeq4mRC57tiWLJI65Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aSmBT1GU; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aSmBT1GU"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cebcb8d7so202805a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 18 Sep 2026 07:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789741279; x=1790346079; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t6++YPkG1Ju+PwnB1ApEm7KTa+NYDmrm6+vHdir/OXs=;
        b=aSmBT1GULp4KEUn1WoRoqRCouH1s30Ueezun+fv2lkOfbewURwfEtEiQe+1qa2Jrbp
         DIrjGmlzyszWeCNAfJSfMIjXNb0HvNME50a2wL74O3jZV1VqWFo4Q/uti1CdVo6mXLf+
         PhfneZ4T47sl41KMTtRpz7HHf+s9IIm44XZJhc2e4g1llsVXTRYE4jWW1MusTeslTUc9
         n1I5dag2ilJE7CrlCj06gbfrPwItFkydocwahNreeFj++PtkHauiIHdiy+O/4NxmeZzt
         atBgOCjgcAKTtMaBkrwVIlNqH7uZc0WZU14hdWQAp48GlqK9mSTfBdQ690KrNsSu2iL9
         kW5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789741279; x=1790346079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t6++YPkG1Ju+PwnB1ApEm7KTa+NYDmrm6+vHdir/OXs=;
        b=CtMOBA91YPBJoTb0Hr5W0r6XrqkSciRCJhn5HpDZ50PqYjqwn+JKgobPy5crU5sfk7
         A6fmpYhcGjtdZ5vej2YZdwbm2kLorcGNEH6ToIk8eglIF1PSMZXBHWep7GRBOilpq8JO
         aewb4woLTmvRecztiyBbPbrmQET4hfH7kikJQvqEpTVldk0hn+y5tpMT8lXhAMH0uYrQ
         DyR84+RIyeknytNP4NvG/4kyKaVGwBkbKd80Whkd4KDrW+cTtYH1BzYL2+A8ZGSNzioB
         93X7awzP6h6i0eqhOQ76v+9tLskKCJQzmihCeJUzAxItTTcf4dnPQBoHcLDwnEChX37J
         VVYw==
X-Forwarded-Encrypted: i=1; AKwUvByWnFsara6pNXZcxc9ZO7AdnyGXiRGQv/xn+3f5y4jQR6RfwvtkqPVT5nS6Y09Dl0lnrBCDuiv44CoHlubyj3GE9y9XOQ==@lists.linux.dev
X-Gm-Message-State: AFuF++kVH694Ufk9j8HdWzsL/b6z4Rs7Y6Oy12eljeRSIeLWaw/P1JiC
	9Ha9r/xAHnkmx6/cpA2hZ3B1FMW2j9FyKfjoQV67TbW4qD/y1dGoaDR1
X-Gm-Gg: AYBFou02wVagZmYraaXRK96me6TRse1UI7cPKzx2RUgEaorMYfrkW+uz2GvfXUWfdaw
	Qp5mdoZW8qBITqOgsU0O/JB/Kfxjm7Wb4vATM9Zfvks27B3DNwIYkKizIPCYvuDsRTHOWm3s9Ew
	iII46nU08FrE4chmiv9VhUO7OnF35OzDtMxxKNcXHqJIUbORanrvtwei4xruvbSEJUzsPftLHuu
	2IEA2vU5LeOYdVBkrBKVSQ+xRN4K0qFzFdPQpIsHa2QkZjOYHLBwqnYdLEk36MM0ft9cANtNmkK
	VuhjomnL/I3eJ2GRIv9oUVPMgJHlsMnRnEUw32HarqApwUREK+Vr0zvfLgfl8ja8OO+CgBXCgul
	SAnXX7Hg125eWf1/ieEVl9Jg1VkXD9btudfHfpHmdjmnVmpr80th7XiXE2U6qicI5nKMClu/DVe
	x3etrnwH3atmLPlFDI/Kghe4UVCRmAO1LkV14oi44cg1ATbJelU+g0lrCaU2Hyv6zL0avrOVw0N
	VkExIskjYbpfxW0yyjDDLU=
X-Received: by 2002:a17:90b:4c87:b0:39e:4c7e:bc6 with SMTP id 98e67ed59e1d1-39e5573521amr3158853a91.20.1789741279214;
        Fri, 18 Sep 2026 07:21:19 -0700 (PDT)
Received: from x1c ([2405:9800:b670:b64b:f2cd:1bf9:a704:c687])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13420739a91.9.2026.09.18.07.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 07:21:18 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH v2] KVM: selftests: Test partial KVM_CLEAR_DIRTY_LOG requests
Date: Fri, 18 Sep 2026 21:20:52 +0700
Message-ID: <20260918142053.10127-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clear-log mode invokes KVM_CLEAR_DIRTY_LOG with first_page set to
zero and num_pages covering the entire memory slot. But the clear-log
allows targeted clearing. So, the test does not verify that KVM
correctly applies a bitmap relative to a nonzero first_page,
or that pages not selected by a partial request remain dirty.

Add a focused test that creates a memory slot with
KVM_DIRTY_LOG_INITIALLY_SET, then submits a 64-page clear request
starting at page 64 with only bitmap bit 1 set. Verify that memslot page
65 becomes clean while every other host-page bit remains dirty.

Write to page 65 from the guest and verify that dirty tracking was
re-enabled and the page becomes dirty again.

Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
Changes in v2:
Address two issues from Sashiko's review
 - Address Out-of-bound guest access when host page size
exceeds the guest page size by sizing the test memslot from 192 host
pages, converting to guest pages before applying the allocation
adjustment. 
 - Skip the partial-clear test if KVM_DIRTY_LOG_INITIALLY_SET is not
supported, since the test requires the bitmap to start with all
pages marked dirty.

Test Results:
- on x86_64 with 4K host and guest pages:
	./dirty_log_test -M clear-log
	PASS
- on arm64 Rock 5B with 4K host pages, including 4K, 16K and
64K guest page modes:
	./dirty_log_test -M clear-log
	PASS
---
 tools/testing/selftests/kvm/dirty_log_test.c | 112 +++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/tools/testing/selftests/kvm/dirty_log_test.c b/tools/testing/selftests/kvm/dirty_log_test.c
index af5eb0334a74..3976748f3940 100644
--- a/tools/testing/selftests/kvm/dirty_log_test.c
+++ b/tools/testing/selftests/kvm/dirty_log_test.c
@@ -815,6 +815,114 @@ static void run_test(enum vm_guest_mode mode, void *arg)
 	kvm_vm_free(vm);
 }
 
+/* Use the 2nd 64-page range to exercise a non-zero offset. */
+#define TEST_CLEAR_LOG_FIRST_PAGE	64
+#define TEST_CLEAR_LOG_NUM_PAGES	64
+#define TEST_CLEAR_LOG_BIT		1
+#define TEST_CLEAR_LOG_PAGE		(TEST_CLEAR_LOG_FIRST_PAGE + \
+					 TEST_CLEAR_LOG_BIT)
+static void guest_code_clear_log(void)
+{
+	u64 addr = guest_test_virt_mem + TEST_CLEAR_LOG_PAGE * host_page_size;
+
+	while (true) {
+		vcpu_arch_put_guest(*(u64 *)addr, 1);
+		GUEST_SYNC(1);
+	}
+}
+
+/*
+ * Verify KVM_CLEAR_DIRTY_LOG only clears (and re-arms) the requested range:
+ * with KVM_DIRTY_LOG_INITIALLY_SET every page starts dirty; clearing a single
+ * page must leave its neighbours dirty and must write-protect the page so the
+ * next guest write re-dirties it.
+ */
+static void run_clear_log_partial_test(enum vm_guest_mode mode, void *arg)
+{
+	unsigned long *bmap, *clear_bmap;
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+	u64 page;
+
+	/* Allocate enough memory for three 64-host-page range */
+	guest_num_pages = vm_adjust_num_guest_pages(mode,
+			vm_num_guest_pages(mode, 3 * 64));
+
+	vm = create_vm(mode, &vcpu, 2 * guest_num_pages, guest_code_clear_log);
+
+	guest_page_size = vm->page_size;
+	host_num_pages = vm_num_host_pages(mode, guest_num_pages);
+	host_page_size = getpagesize();
+
+	guest_test_virt_mem = DEFAULT_GUEST_TEST_MEM;
+	guest_test_phys_mem = (vm->max_gfn - guest_num_pages) * guest_page_size;
+	guest_test_phys_mem = align_down(guest_test_phys_mem, host_page_size);
+
+	bmap = bitmap_zalloc(host_num_pages);
+	clear_bmap = bitmap_zalloc(BITS_PER_LONG);
+
+	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
+				    guest_test_phys_mem, TEST_MEM_SLOT_INDEX,
+				    guest_num_pages, KVM_MEM_LOG_DIRTY_PAGES);
+	virt_map(vm, guest_test_virt_mem, guest_test_phys_mem, guest_num_pages);
+
+	sync_global_to_guest(vm, host_page_size);
+	sync_global_to_guest(vm, guest_test_virt_mem);
+
+	kvm_vm_get_dirty_log(vm, TEST_MEM_SLOT_INDEX, bmap);
+	for (page = 0; page < host_num_pages; page++)
+		TEST_ASSERT(test_bit_le(page, bmap),
+			    "Page %lu should be dirty after INITIALLY_SET", page);
+
+	__set_bit_le(TEST_CLEAR_LOG_BIT, clear_bmap);
+	kvm_vm_clear_dirty_log(vm, TEST_MEM_SLOT_INDEX, clear_bmap,
+			       TEST_CLEAR_LOG_FIRST_PAGE,
+			       TEST_CLEAR_LOG_NUM_PAGES);
+
+	kvm_vm_get_dirty_log(vm, TEST_MEM_SLOT_INDEX, bmap);
+	for (page = 0; page < host_num_pages; page++) {
+		if (page == TEST_CLEAR_LOG_PAGE)
+			TEST_ASSERT(!test_bit_le(page, bmap),
+				    "Cleared page %lu should be clean", page);
+		else
+			TEST_ASSERT(test_bit_le(page, bmap),
+				    "Page %lu should still be dirty", page);
+	}
+
+	/* The cleared page is now write-protected; a guest write must re-arm it */
+	vcpu_run(vcpu);
+	TEST_ASSERT(get_ucall(vcpu, NULL) == UCALL_SYNC,
+		    "Unexpected guest exit: %s",
+		    exit_reason_str(vcpu->run->exit_reason));
+
+	kvm_vm_get_dirty_log(vm, TEST_MEM_SLOT_INDEX, bmap);
+	TEST_ASSERT(test_bit_le(TEST_CLEAR_LOG_PAGE, bmap),
+		    "Page %lu should be dirty again after re-arming",
+		    (u64)TEST_CLEAR_LOG_PAGE);
+
+	free(bmap);
+	free(clear_bmap);
+	kvm_vm_free(vm);
+}
+
+static void test_clear_log_partial(void)
+{
+	host_log_mode = LOG_MODE_CLEAR_LOG;
+	if (!log_mode_supported()) {
+		print_skip("Log mode '%s' not supported",
+			   log_modes[host_log_mode].name);
+		return;
+	}
+
+	if (!(kvm_check_cap(KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2) &
+		KVM_DIRTY_LOG_INITIALLY_SET)) {
+		print_skip("KVM_DIRTY_LOG_INITIALLY_SET not supported");
+		return;
+	}
+
+	for_each_guest_mode(run_clear_log_partial_test, NULL);
+}
+
 static void help(char *name)
 {
 	puts("");
@@ -913,5 +1021,9 @@ int main(int argc, char *argv[])
 		for_each_guest_mode(run_test, &p);
 	}
 
+	if (host_log_mode_option == LOG_MODE_ALL ||
+	    host_log_mode_option == LOG_MODE_CLEAR_LOG)
+		test_clear_log_partial();
+
 	return 0;
 }
-- 
2.53.0

