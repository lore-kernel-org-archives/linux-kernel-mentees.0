Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB88F224898
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 19 Mar 2025 02:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742351211; cv=none; b=jhvkOmFj4iKjoPjM6ZSCyBxRLXQpc5ArW2M2qh6lAAMbdUuEDdnGBU+QcYrTrpAU4bhVjMechy+gSWMQsLvhpVQIxG0lfNTvWEU5xVHHSh47axdqMEIwFWxs728B42t5ZsnGWk3VofJxGp8/HslamjD1PfFPdfNuK5w78nXJaKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742351211; c=relaxed/simple;
	bh=7ndRtF44IDuR/Iw9NUnpMKfPJB5kK3QTMCwjXmKrW38=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XU+u37BrKQCbcQH3jMs7hQGJ4IzlWWTNRU2vth8pRkQfzVf7WMwiKsJTd3CoJd0comILdpYWepjKuZ9zS4zvQlxJGXkzbo1R3+MzZqjzkeSiCpy6G29aMKmiyoBKTadksTQKFLt4yE0tp+6ThBqQVd1PudGh1X2WocnuzrHLvrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Psc9lWJw; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Psc9lWJw"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-223a7065ff8so31171345ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Mar 2025 19:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742351209; x=1742956009; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AbIHvmmG5js1PLHp8uTT6TGLBU5cpAS+qD/HRwri4Ls=;
        b=Psc9lWJwOzy0f7kDb74Oxwp7E7dyFkKw/QF/OMHnR9GlXTWpCUWzQ3SFBQFukPiMpt
         9HzgVwJ7pFQhsUPaGs3GFGwiM7OetVBXWjHsiHRvtM2uMZd1r/r+uFnkDfJ43PDDIFBF
         sx6T3UZ/F+7OdI8I3DNiWUNmN5oiMLyBI9PRSUclxyqAYNEtes73KI0OcBvvbcJLnz7j
         VTGKNHlcSixdnE2hGBrMibK+V6KXriUOysg2ddAISZl5onaUyL8N3P5NqchcrDLIjLhx
         BvQpoJeiQ6Y+oMXvjlg7c+jSaYcsaMGYfrXBRvdrPj8R+LZpWzx0rEFpYlaUPbxqM2wl
         hBeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742351209; x=1742956009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AbIHvmmG5js1PLHp8uTT6TGLBU5cpAS+qD/HRwri4Ls=;
        b=FCYTrmwi9Qkl1pN41n7T9WBctHYT0hBzK+fn9ne934bJCW7eIV6Osk372ltQrgJKJA
         llqZJvHfUpletTFP/N/aF8u6rgX3A2EozQ4RkvOcuUOyqv+16O9palTqlrrGe4+/DeTd
         nNBxqV/WQQ96kyonAbAERw1+pAemCjrRFPUYZQrlwTZyl9T/gtpnx3wRJXg7C2+7sQ2a
         /3hv6e2Iz8WKESITMYF7uGDsaU7WNTF6H5bdYV3w2cVKhiy0faIaRI930dqkct2fM2js
         mojI3/M+fUvAQFW6IzZZsygYYW6cF5XwHP5Bgh5mKUoRv88/Z+PWPx1DhkSSS1pI9rJr
         Tkow==
X-Forwarded-Encrypted: i=1; AJvYcCUae1jU8WmhOsy6nv1Ea7aH031E++xPlKQO6LxYsCmQ/JV1yLoEZHTOsIUqvfpFxkw5AOA+gmBLci7bGpBv0EaDQUkNZg==@lists.linux.dev
X-Gm-Message-State: AOJu0YziaiCHYIuBw5NPe1yHTG071frl51Z5H/+KNM171w5UB8w0g9z3
	Z15dQTzdDzi36aOmjIOJ5mPELDEHbmcqgqyCYJ9tMjuv9k/ozwRm
X-Gm-Gg: ASbGncv2um9F/iiHbmkRXQpQjQwHJc7iAhDqKIICLbwEYrT7RLre/qUYr7GDwTVO5I7
	mqEGeGeih/FulvUErsWm6a4U6z9km111RdU3JiUBUTh9LSzqQRTI84LQ+0pIedLVO2yCYTIKCzj
	aUkrSo9cljU9MmD/1j8DLdM1c2OV6UlsJ1fd/HeP2yrWWe9AE4y+xE1IrCfo2Y1lHltct5oR8Wp
	kkg3V4UeeZd7IOs8Z4oqCBJJi6JmTGtQmK3uPoyuvW5kGAPY2ZdgXXUr3B/WRcGrYISop34ygHL
	4f/ouzf7jqaPCG6EKfLf44xWTX7QdSIBthEckxxPxpiRX1PNRwd+gFSD4yApSL6UedXOuDjlzy0
	=
X-Google-Smtp-Source: AGHT+IHZ9BD8ZaOCOCQgXrEkiiKdJlyV+ramk5NngA/ynv6mcMiXCm7l3udoK9awSQXYb3itTUtvKQ==
X-Received: by 2002:a17:903:292:b0:224:1001:677c with SMTP id d9443c01a7336-2264981eb43mr15517845ad.9.1742351209081;
        Tue, 18 Mar 2025 19:26:49 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:35d0:8dad:cfe4:6cb9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a406fsm102788585ad.64.2025.03.18.19.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 19:26:48 -0700 (PDT)
From: I Hsin Cheng <richard120310@gmail.com>
To: rostedt@goodmis.org
Cc: paulmck@kernel.org,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	joel@joelfernandes.org,
	josh@joshtriplett.org,
	boqun.feng@gmail.com,
	urezki@gmail.com,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang1211@gmail.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	rcu@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	jserv@ccns.ncku.edu.tw,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [PATCH v2] rust: sync: rcu: Mark Guard methods as inline
Date: Wed, 19 Mar 2025 10:26:40 +0800
Message-ID: <20250319022640.970207-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the implementation of "Guard" methods are basically wrappers
around rcu's function within kernel. Building the kernel with llvm
18.1.8 on x86_64 machine will generate the following symbols:

$ nm vmlinux | grep ' _R'.*Guard | rustfilt
ffffffff817b6c90 T <kernel::sync::rcu::Guard>::new
ffffffff817b6cb0 T <kernel::sync::rcu::Guard>::unlock
ffffffff817b6cd0 T <kernel::sync::rcu::Guard as core::ops::drop::Drop>::drop
ffffffff817b6c90 T <kernel::sync::rcu::Guard as core::default::Default>::default

These Rust symbols are basically wrappers around functions
"rcu_read_lock" and "rcu_read_unlock". Marking them as inline can
reduce the generation of these symbols, and saves the size of code
generation for 132 bytes.

$ ./scripts/bloat-o-meter vmlinux_old vmlinux_new
add/remove: 0/10 grow/shrink: 0/1 up/down: 0/-132 (-132)
Function                                     old     new   delta
_RNvXs1_Cs4gouIKNZ4iT_15rust_driver_pciNtB5_12SampleDriverNtNtCsaYBeKL739Xz_6kernel3pci6Driver5probe    1041    1034      -7
_RNvXs_NtNtCsaYBeKL739Xz_6kernel4sync3rcuNtB4_5GuardNtNtCsdaXADs8PRFB_4core7default7Default7default       9       -      -9
_RNvXs0_NtNtCsaYBeKL739Xz_6kernel4sync3rcuNtB5_5GuardNtNtNtCsdaXADs8PRFB_4core3ops4drop4Drop4drop       9       -      -9
_RNvNtNtCsaYBeKL739Xz_6kernel4sync3rcu9read_lock       9       -      -9
_RNvMNtNtCsaYBeKL739Xz_6kernel4sync3rcuNtB2_5Guard6unlock       9       -      -9
_RNvMNtNtCsaYBeKL739Xz_6kernel4sync3rcuNtB2_5Guard3new       9       -      -9
__pfx__RNvXs_NtNtCsaYBeKL739Xz_6kernel4sync3rcuNtB4_5GuardNtNtCsdaXADs8PRFB_4core7default7Default7default      16       -     -16
__pfx__RNvXs0_NtNtCsaYBeKL739Xz_6kernel4sync3rcuNtB5_5GuardNtNtNtCsdaXADs8PRFB_4core3ops4drop4Drop4drop      16       -     -16
__pfx__RNvNtNtCsaYBeKL739Xz_6kernel4sync3rcu9read_lock      16       -     -16
__pfx__RNvMNtNtCsaYBeKL739Xz_6kernel4sync3rcuNtB2_5Guard6unlock      16       -     -16
__pfx__RNvMNtNtCsaYBeKL739Xz_6kernel4sync3rcuNtB2_5Guard3new      16       -     -16
Total: Before=23365955, After=23365823, chg -0.00%

Link: https://github.com/Rust-for-Linux/linux/issues/1145
Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
Changelog:

v1 -> v2:
    - Mark read_lock() as inline as well
    - Fix typos
---
 rust/kernel/sync/rcu.rs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/rust/kernel/sync/rcu.rs b/rust/kernel/sync/rcu.rs
index b51d9150ffe2..a32bef6e490b 100644
--- a/rust/kernel/sync/rcu.rs
+++ b/rust/kernel/sync/rcu.rs
@@ -17,6 +17,7 @@
 
 impl Guard {
     /// Acquires the RCU read side lock and returns a guard.
+    #[inline]
     pub fn new() -> Self {
         // SAFETY: An FFI call with no additional requirements.
         unsafe { bindings::rcu_read_lock() };
@@ -25,16 +26,19 @@ pub fn new() -> Self {
     }
 
     /// Explicitly releases the RCU read side lock.
+    #[inline]
     pub fn unlock(self) {}
 }
 
 impl Default for Guard {
+    #[inline]
     fn default() -> Self {
         Self::new()
     }
 }
 
 impl Drop for Guard {
+    #[inline]
     fn drop(&mut self) {
         // SAFETY: By the type invariants, the RCU read side is locked, so it is ok to unlock it.
         unsafe { bindings::rcu_read_unlock() };
@@ -42,6 +46,7 @@ fn drop(&mut self) {
 }
 
 /// Acquires the RCU read side lock.
+#[inline]
 pub fn read_lock() -> Guard {
     Guard::new()
 }
-- 
2.43.0

