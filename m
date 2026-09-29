Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155E352ED31
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Sep 2026 16:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790699392; cv=none; b=acwdILRgz5PUHcIr0pnxo6srFQ2hgQoDMOkGd9bZ+TrjnhwuW5qIYAnfqkwpbnTwQyztdig7Q4ZNwXfujb5IO4k4Pg4A5XkZ86F35glJmI5ZfwBQJFbYrfH+DfQI35rORwZIBWoLoPn/6OJ+xw5weAvdyCOK0WO0R3FZ/D/bF60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790699392; c=relaxed/simple;
	bh=at9caQSNlDirzi19HDDan4Y2L3uJCRt9I9RlxktvPA0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HVNpwdPCyHktqkMTeoLl4xTy4EskV0s/FO59N/8CvrdwLaKWE/twFK1BrOUgTGhcOycnGQd2pxswTgyE5KUrAtSmePHztNDoaXTjEZHEfsY5BsC3kGWxXMsZCSp0BOaIOVyf11QxfcdyhW0BTTiYVaHO1nVFbMMgHoM7KlfAbdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kr2Rl82R; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kr2Rl82R"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a494638445so929603a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Sep 2026 09:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790699389; x=1791304189; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tH7cezq+gJXVplHNKlxZez1fJO97a08MzeloZBiVfiI=;
        b=kr2Rl82RmHkxh7v90loCzT7+xxvpnpGTC7DV1KiIWmYom93xDWCQ2vu/f4D3s5tqNC
         WralywN5yDEWIqscQ3ii0JufsF/pm4zl6ceWBbonQ6jG6XQyicjj5gxgNmp0X1UV3vqm
         wvO4Ym5iLHxXfK97Z7GdDTZfyIc7qU1yh/UaMcncgI9fOILi4yMI9xdQDpRZzsvMifZ2
         4Nv3khuDB9oBmwiS4GIqN9lj1YbuZtZkvbFGx7YARptMRsNSYeFIWcQW3bhOu6pPdZs4
         dwtR/3alV2HyMAOdaFaT+yiBU8EKPExNUVt8Eo+nVeu7P0u1crRvOFJcoYh3LBrpVmou
         iYpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790699389; x=1791304189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tH7cezq+gJXVplHNKlxZez1fJO97a08MzeloZBiVfiI=;
        b=v4hJboUwDkIUaKctuMszhht3+CzWFJ9zqfDTULYzHBr0q9mk9KmOBfFMcqoDB1HsvV
         6nS4lY9jQQ6+9TCBIjHv5sOTjE0jD4MubY/O8YMEXf+SeRsgZn28g/VSUZCHdJ7mh8tl
         q+bxN/1o5nbKvYpUfXz/6Js7iqRbBdRkX/ZJsietZahAFVdG0hAD8Nt+pwCqv7b3wg2b
         BslBLndjaAl46XE7vd6tYaPGUE6zyB67OirfqAOv5AkcK7NNmC0bLRUTGwvLnIfIcGqx
         TGlohd3hebUWOV9b5YaBXZ60fGYcq15irLy5IUZpMbEmhGt4TnQ856kr1ugPPZETBVnY
         Vsng==
X-Forwarded-Encrypted: i=1; AKwUvBw+ri6DDLyOtvkkKUXx7vksHbASzWiI7s8ypGu3HWCyhozWRDac+LKif45Ovxe6V+uj3ipy7bVuhaJCuYehrB9ph92Srw==@lists.linux.dev
X-Gm-Message-State: AFq9FYJUqIPrqgLvx2m7irWhSrPwlvZE0VvU7hCCPeJ7tGg7k7D01FiU
	nGCvnGLjrqHoYWPi6xouz1RC3sVOrkzsON56cuzsE5SrinrE3Qk599Uv
X-Gm-Gg: AYBFou3YyhZok3MAIMYFSVWtmW3g2jkz9EA4B1fsiFVdB9ckm2gI0rRjY8vUlgKX/l9
	E5k10RbFAy1BlbxXHK1gkMEzJhpEfLqgQS8lihbOSWKWFUcpt1qumjzAM9p01uYIwRdTpNHu8Wi
	Nh5Q8QNpeWrDuMP1fBBDE8lPkIfqHXp9o4mdKgQ2ugfyJ933Og1SAKX7kp12gCaKrI+/yCGqBE2
	2bmrrOz+uMCEbzaSjtxbWRYbsWCbjoI0ZWxXYD0uIO8INeh7FTXJ57Sx2D18rDJ2HH/Tahkr6Wu
	kB3NMmTz1R7v3URwMnUsiLrnPshfjhKyv5lC0AhlWp1b8yT0i0Yid3OVg+FMdUu/l8MN7vS0ehR
	giLojqTn+J405s5c5iiyJPrmCmR5bp9tEunREe8O3bc0icpd4lRVuuP0m+2ljIcAmJebdDM0VpF
	dMlQTU3XzgNjKtF+LICgsnPMOp5NfYzvp/YcvBEScx3VrrErbMZNWO5mlaA5DxIRsrrlhpK+oD6
	Ffjm8Z2fXDNOOrdqzaTgw==
X-Received: by 2002:a17:90b:2882:b0:3a4:b8fd:5d67 with SMTP id 98e67ed59e1d1-3a4b8fd5e29mr379785a91.50.1790699389050;
        Tue, 29 Sep 2026 09:29:49 -0700 (PDT)
Received: from x1c ([2405:9800:b670:b64b:8c3c:36b:3374:1c96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a497ecef67sm6481678a91.6.2026.09.29.09.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:29:48 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: seanjc@google.com,
	pbonzini@redhat.com,
	shuah@kernel.org
Cc: kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH v2] KVM: selftests: Verify KVM_MSR_EXIT_REASON_INVAL on non-canonical FS_BASE write
Date: Tue, 29 Sep 2026 23:29:40 +0700
Message-ID: <20260929162940.14610-1-tharitt97@gmail.com>
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

Have the guest write a non-canonical value to FS_BASE and verify
that the write exits to userspace with KVM_MSR_EXIT_REASON_INVAL along
with the attempted value.

FS_BASE writes are passed through to hardware, i.e. a plain WRMSR
takes #GP directly without exiting, so use forced emulation to route
the write through KVM.

Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
v2:
 - Use a write of non-canonical to FS_BASE value instead of 
   reserved EFER bit 63 because writing non-canonical can't 
   become valid without massive architectural changes unlike EFER reserved bit
   (suggested by Sean).
Tested on Intel Core i5-10210U (VMX). Not tested on AMD.
---
 .../kvm/x86/userspace_msr_exit_test.c         | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/x86/userspace_msr_exit_test.c b/tools/testing/selftests/kvm/x86/userspace_msr_exit_test.c
index 2808ce727e5f..40b084cba2c0 100644
--- a/tools/testing/selftests/kvm/x86/userspace_msr_exit_test.c
+++ b/tools/testing/selftests/kvm/x86/userspace_msr_exit_test.c
@@ -309,6 +309,14 @@ static void guest_msr_calls(bool trapped)
 	/* Invalid MSR, should always be handled by user space exit */
 	GUEST_ASSERT(rdmsr(0xdeadbeef) == 0xdeadbeef);
 	wrmsr(0xdeadbeef, 0x1234);
+
+	/*
+	 * Writing a non-canonical value to FS_BASE is rejected by KVM, but
+	 * FS_BASE writes are passed through to hardware, so force emulation
+	 * to route the write through KVM and get an INVAL exit.
+	 */
+	if (is_forced_emulation_enabled)
+		test_em_wrmsr(MSR_FS_BASE, NONCANONICAL);
 }
 
 static void guest_code_filter_deny(void)
@@ -627,6 +635,13 @@ static void handle_wrmsr(struct kvm_run *run)
 		TEST_ASSERT(run->msr.reason == KVM_MSR_EXIT_REASON_UNKNOWN,
 			    "deadbeef trap w/o inval fault");
 	}
+
+	if (run->msr.index == MSR_FS_BASE) {
+		TEST_ASSERT(run->msr.data == NONCANONICAL,
+			    "MSR_FS_BASE data is not NONCANONICAL");
+		TEST_ASSERT(run->msr.reason == KVM_MSR_EXIT_REASON_INVAL,
+			    "MSR_FS_BASE trap w/o inval fault");
+	}
 }
 
 KVM_ONE_VCPU_TEST(user_msr, msr_filter_deny, guest_code_filter_deny)
@@ -667,7 +682,9 @@ KVM_ONE_VCPU_TEST(user_msr, msr_filter_deny, guest_code_filter_deny)
 
 done:
 	TEST_ASSERT(msr_reads == 4, "Handled 4 rdmsr in user space");
-	TEST_ASSERT(msr_writes == 3, "Handled 3 wrmsr in user space");
+	TEST_ASSERT(msr_writes == (is_forced_emulation_enabled ? 5 : 3),
+		    "Handled %u wrmsr in user space, expected %u",
+		    msr_writes, is_forced_emulation_enabled ? 5 : 3);
 }
 
 KVM_ONE_VCPU_TEST(user_msr, msr_permission_bitmap, guest_code_permission_bitmap)
-- 
2.53.0

