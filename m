Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B65441A923
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 26 Sep 2026 10:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790419466; cv=none; b=JOX7NokdPFDztkZWE4YMbOWTs+zrcbGPeHJkTaWkMcZSdChThy56wfe0t1i87JNgxCvVelRPargXRTXmT5M1uW+YeT1K+6tnHUNj/bz5r1l3chXYQLSa7fsGl95tsIAaTF19NfSfMMa1PyEMfLWIDClmT/Ga5fT7fti2qy6hmP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790419466; c=relaxed/simple;
	bh=6fpG91MXXQbhpol2AXqdF9dFywJtNWGjaLWU4oYG/WM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B99+L/6Stl9KuedBuu6RF5qZ4ngwKA+1iD7Ev2CfzpnNYVbGwVXiYhMePA2YXfJjf1DLd0pHvyAF9cKFsb7ut66ZGIMUSUdgYnadHAXaRpZUVcnm9qVw0gxhBzYZtIr53s9hsS3zXyQNmie1B72SuwH7maQR7+XvYCGdM19WIqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rNolJV4q; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rNolJV4q"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a0bcdf41a3so747690a91.2
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 26 Sep 2026 03:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790419447; x=1791024247; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4odAGIPcyvnNWb4sPZdqKZBZfrGmbPznm9W/871R/J8=;
        b=rNolJV4qmOREvezdOZS1x1Qwwo7suwwqPD/adkRGT7yKOgzLF0Mnn8GvneBnR3Z9Z0
         V4cbSWh5fJFyl2L6Qx/ScOeaZ35qbFrPB/1FxSUV1TLR/eNAvzuwXlaONwnrFSHuuFgI
         13yFI8X98Qcm45keDyT2VkPkDK89wj5pKv8Oc899jGmcUlfLf7AeJstj7d5rbH0DCJgp
         IgSULfkbO2QF+rq/WD7+uxfUiK6LcCC4EkibgKOeleAYjLkzyAm3vmD7XFX/2QEJ3mM8
         rTiBuyObPh6GMKEoM3uFO/Nof15czSoZZC/pPmq8dUYEpwDm9b3ZWwj7X4am+7/r6/VX
         d3Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790419447; x=1791024247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4odAGIPcyvnNWb4sPZdqKZBZfrGmbPznm9W/871R/J8=;
        b=vjg5VIXvwIblXtxKtyOTKENiwMaWz6A2CTWhdHwAW2VGbYClNbphtlkeLA+sYSKJdL
         kDRjjVSIIBlrFJuCNFUfGjEPlo7HGjrLiClUp3KRVGQLBZ5Cfhh82MnFTcgaM7+rMvQy
         fvjnoZWS4PMQdN61Vn/t+HOHF7pGhvk8S36ks87wDD9kf5GjdEcQuea86xhdsWFafVRc
         U0WYiXDXuLIUI0WKJSE41LEggPvsAVsazY123TJYrlNaE29TWMG98w1tEyy5lU3mOov0
         0zKcHGwqHSr2rGsrMe0PFAADQgNCKfc1CyDbgb62U3hX2j6r1xPCH+wIc+FKtmsimkRP
         LqEA==
X-Forwarded-Encrypted: i=1; AKwUvBxpSd9MuRaWI2OpYesRkJP8V+g4HLyhZ3yrmokhCNxTjGffQHYMxOcY/w+GlbcpsuzY13Gub6CCtwFgJ8VOW5g00qB02Q==@lists.linux.dev
X-Gm-Message-State: AFq9FYJaIl5LnfTwGqB488h1PFKGSUtM7u+bM2nkoH+0KErqofcUfo9g
	jgtDf2LNSVw7rsL7ks62qTJmuyhZC6bMfUhkUBpPMGWWob0hgtClShuT
X-Gm-Gg: AYBFou272HJrGv8aeysTev3fb34zz/f5B3g2QAz1DBUIGvtKN4u572B+UUm0PFLqPH3
	Z3FWQ4lMZ1VYDimGk4BxFsGKGOEoTGjtZUWMpP3dzsH4rx0QdxTogq1HPx5UQPTy1o3Ly6cM0nf
	2mTcuKa5WpEewXHdWJ7A3dsKzBqT4earwJhrqSTWiAebau/6qaVMQIcwXWvBXVbwxlr8FB525Xn
	O2Oy6uYWa+MNRMtlJKQEuYdqH+K8jGCE7mTVlkz2r2H5UEbX/ZcZhwFhIguWhf6Mi5fybDKtReH
	ZzRigfPTbLykVTUA2gLGyKmdoRsNMYmPA0ntwkTLweVYubxIF8ncNhZf4aDOwUarc4Wj694wSkL
	SKUBjegXhlzS6cirNlxq9CDHzeSHMO43CylqbtFxsGjoiJU8Gt2j25z+E9ht1fbWAtPure+uzd3
	oOa/b55P3qiRvQyG2gw6hKZnw7+7WSX60okYSFsBBhAZwfpDirB1oBgj5/21fbdZIfegrCH8ik+
	lnXlmwlNpFnNe+zKnHJ67qhhvNngnLzhw==
X-Received: by 2002:a17:90b:1f90:b0:39e:6c69:f47b with SMTP id 98e67ed59e1d1-3a098d4085dmr7176558a91.58.1790419446869;
        Sat, 26 Sep 2026 03:44:06 -0700 (PDT)
Received: from x1c ([2405:9800:b670:b64b:819f:6ccc:5ca5:5f73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0974ec711sm15800578a91.6.2026.09.26.03.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 03:44:06 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH] KVM: selftests: Verify KVM_MSR_EXIT_REASON_INVAL on reserved EFER write
Date: Sat, 26 Sep 2026 17:43:55 +0700
Message-ID: <20260926104355.13697-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The msr_filter_deny test covers the FILTER and UNKNOWN MSR exit
reasons, but nothing exercises KVM_MSR_EXIT_REASON_INVAL.

Have the guest set a reserved bit (bit 63) in EFER while preserving
the other bits, and verify that the write exits to userspace with
KVM_MSR_EXIT_REASON_INVAL along with the attempted value.

Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
Tested on Intel Core i5-10210U (VMX). Not tested on AMD.
---
 .../selftests/kvm/x86/userspace_msr_exit_test.c      | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/x86/userspace_msr_exit_test.c b/tools/testing/selftests/kvm/x86/userspace_msr_exit_test.c
index 2808ce727e5f..7446e1404264 100644
--- a/tools/testing/selftests/kvm/x86/userspace_msr_exit_test.c
+++ b/tools/testing/selftests/kvm/x86/userspace_msr_exit_test.c
@@ -309,6 +309,9 @@ static void guest_msr_calls(bool trapped)
 	/* Invalid MSR, should always be handled by user space exit */
 	GUEST_ASSERT(rdmsr(0xdeadbeef) == 0xdeadbeef);
 	wrmsr(0xdeadbeef, 0x1234);
+
+	/* Setting a reserved EFER bit is rejected by KVM, exit with INVAL */
+	wrmsr(MSR_EFER, rdmsr(MSR_EFER) | BIT_ULL(63));
 }
 
 static void guest_code_filter_deny(void)
@@ -627,6 +630,13 @@ static void handle_wrmsr(struct kvm_run *run)
 		TEST_ASSERT(run->msr.reason == KVM_MSR_EXIT_REASON_UNKNOWN,
 			    "deadbeef trap w/o inval fault");
 	}
+
+	if (run->msr.index == MSR_EFER) {
+		TEST_ASSERT(run->msr.data & BIT_ULL(63),
+			    "MSR_EFER data missing reserved bit");
+		TEST_ASSERT(run->msr.reason == KVM_MSR_EXIT_REASON_INVAL,
+			    "MSR_EFER trap w/o inval fault");
+	}
 }
 
 KVM_ONE_VCPU_TEST(user_msr, msr_filter_deny, guest_code_filter_deny)
@@ -667,7 +677,7 @@ KVM_ONE_VCPU_TEST(user_msr, msr_filter_deny, guest_code_filter_deny)
 
 done:
 	TEST_ASSERT(msr_reads == 4, "Handled 4 rdmsr in user space");
-	TEST_ASSERT(msr_writes == 3, "Handled 3 wrmsr in user space");
+	TEST_ASSERT(msr_writes == 5, "Handled 5 wrmsr in user space");
 }
 
 KVM_ONE_VCPU_TEST(user_msr, msr_permission_bitmap, guest_code_permission_bitmap)
-- 
2.53.0

