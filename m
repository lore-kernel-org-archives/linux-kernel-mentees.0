Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1B0136351
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 27 Jul 2025 17:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753635764; cv=none; b=RwdEy8xycZkr7BqkOf4Q8KSqxN5kpRoo5Ibv44zDS9cdpsAjMry760V6dGiiyrC3Tfh8iJnC+CHc6PDhg8xxviSQFjKzUzwoyuY5VSC2tjauOAU95l8laVE4d7vGtg0g5jYOLFsyeWymLBFhnTnpP0H3rLD8cZ+F0vbTcs9UqyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753635764; c=relaxed/simple;
	bh=MGwnuNgMnpCB3HFgNR9y1CpU+sPZS9r4J955g8FJYbI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GV3s7mh6aUB5QS1FSRe9oFf/qfyykZ0JUipeJ10whU2b8uZNxrayQ7F+nG0I4RyBEvumaDYTTEIfHGygA2Sv0OVQFKk7+WyYxT9xennflgsHGRbQJ2unlJrW8707Qg/MsAKOjJ76GezZgZBDLMthpVW2biVOuFnNxIAmh+lCh/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L4J9Qcyx; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L4J9Qcyx"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-23fe2be6061so5923135ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 27 Jul 2025 10:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753635761; x=1754240561; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FdX52KrqVBqheUlpk3q0tshHfWjwkzxFRFnw+JbO75w=;
        b=L4J9QcyxXmbC1Q8SybgYU6NMr9HLkwlodvpvctXnLf1lYbJ0JJM472INvWkyphEMJu
         XydJHAQqPSleXAIaPRcP/WHjmhKaUF4IVEUC4xUnhKl9QwmZyTfkzJ0AphlK9+88ROp7
         2xJM2xF6t/SW7X/7jRkkoCvLs6Zq5vzRry+8+sIuNGivg9MPi0uoS9SIsWtNahNpYCqf
         MNNwthq3P9HNvAHKCEQriNU7VHwVx8qehmQtpYgebIu3Td7wPg9O/H0AWBxlTn541PKf
         HY9MC+ChgEv7qnw+q3dN1rCqE6/6U00RARSJVu6v5HzVKtmDMcxXcLFpCoI816cyDHhk
         rU3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753635761; x=1754240561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FdX52KrqVBqheUlpk3q0tshHfWjwkzxFRFnw+JbO75w=;
        b=OW6j5maGKwWdUiODGb+hYUoFDrmg5mcE4lbd7CYxhq1y0Dbi1IOMSqZM0rJVrYme1A
         F1StNRIW3GtBzrFK7RQtBINFHuY+rkZwNLG9YUfu3iRKAM0DyqDA89XVmq+jXtoAsFeD
         lUNhLyxIqwe1hMW9UWYQxuSEUFq3wbvx4YB9Y2rexCkO968kGAgbZfnP6yTlSAkI9/KZ
         QzI9EuQCaz+Rggp1D9q6aUxoEOX5Svpu4Uu1caZnaVBEgNBCSvYCz4emEzSoDFcwpJ+Z
         lV8+2gVOEJYfbu+RGtACAlRgeSwSKqnQHAzZy+v5s/kSMRxTsx0dg8M+etbDZF/tu16Q
         YiCA==
X-Forwarded-Encrypted: i=1; AJvYcCV9bzmcVzDCy3JMnz65YXG7hqak2kKWdzy5qD8hoiH7U/mce6+CWxkZ1NPetrpLj/a7zXTU7rVSs320fka+waigS9llvw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzMwYq5ICFrblq626YC3cxOz1jprspzrgKsd37mn6EVJcXiJkRP
	+mgvf+FajlYNUmCmzH4pzRCV88jt+cTqnhceMdtO7U4LGdydd3DAnN9l
X-Gm-Gg: ASbGncu9gd3OoN621h8riLnhYuxjIxcZ1gbwaKVMu8MNAxcqDZDqJPOg9WQG6YHoCXc
	wjRfo4Tty7Le3ffldEIvV5Ydq8+tPT20cWMxcSD3+4Uw6GJ8jQhKxN1f0dMdbwcwmw00tRewBWU
	tJncCOJTxvCYCkpgbf8IWxIvP07agU1Jin6c3MbwgsPTwe3v3srPqzJ+ok8sSfcvWwhvJJrSYfh
	mRGejhpfL1GhZ7Mdc4rfguzZv6TBBCBCwkaNopZJodhg62OTOjuuO8/ecMms3wQuCOyMLVu6kQf
	TiPCdrWP4K9xC25+awuKKOlQM6Vqzkj7EyT0+YTfWjylt3kL7SXgJh/x7oUAKYgcOgwdXVxYbwe
	wpaTPklDPG+0CsMW2ZE6wJT8JS6cgg/w=
X-Google-Smtp-Source: AGHT+IHqm/J2SvIlgvt1S3np+aih5SP3n/FU/4D4MXeaiLrPLXXJeqOksquY8u12MW43rJxFyGb2cw==
X-Received: by 2002:a17:902:c950:b0:234:8a4a:ad89 with SMTP id d9443c01a7336-23fb2a7b959mr122833325ad.1.1753635760923;
        Sun, 27 Jul 2025 10:02:40 -0700 (PDT)
Received: from archlinux ([205.254.163.108])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23ff1dbec8esm21709945ad.194.2025.07.27.10.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 10:02:40 -0700 (PDT)
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
To: lossin@kernel.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	me@kloenk.dev,
	chrisi.schrefl@gmail.com,
	rust-for-linux@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: [PATCH] rust/pin-init: remove workaround for type inference cycle
Date: Sun, 27 Jul 2025 22:32:17 +0530
Message-ID: <20250727170217.206794-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `cast_pin_init` and `cast_init` functions previously used an
intermediate `let` binding before returning the result expression to work
around a Rust compiler issue causing type inference cycles. With the
minimum Rust compiler version for the kernel now at 1.78.0, where this
issue is fixed, the workaround is no longer needed. This patch removes the
unnecessary `let` variables and returns the expressions directly.

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
---
 rust/pin-init/src/lib.rs | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index 62e013a5cc20..cc244eeb19cd 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -1278,10 +1278,7 @@ unsafe fn __pinned_init(self, slot: *mut T) -> Result<(), E> {
 pub const unsafe fn cast_pin_init<T, U, E>(init: impl PinInit<T, E>) -> impl PinInit<U, E> {
     // SAFETY: initialization delegated to a valid initializer. Cast is valid by function safety
     // requirements.
-    let res = unsafe { pin_init_from_closure(|ptr: *mut U| init.__pinned_init(ptr.cast::<T>())) };
-    // FIXME: remove the let statement once the nightly-MSRV allows it (1.78 otherwise encounters a
-    // cycle when computing the type returned by this function)
-    res
+    unsafe { pin_init_from_closure(|ptr: *mut U| init.__pinned_init(ptr.cast::<T>())) }
 }
 
 /// Changes the to be initialized type.
@@ -1294,10 +1291,7 @@ unsafe fn __pinned_init(self, slot: *mut T) -> Result<(), E> {
 pub const unsafe fn cast_init<T, U, E>(init: impl Init<T, E>) -> impl Init<U, E> {
     // SAFETY: initialization delegated to a valid initializer. Cast is valid by function safety
     // requirements.
-    let res = unsafe { init_from_closure(|ptr: *mut U| init.__init(ptr.cast::<T>())) };
-    // FIXME: remove the let statement once the nightly-MSRV allows it (1.78 otherwise encounters a
-    // cycle when computing the type returned by this function)
-    res
+    unsafe { init_from_closure(|ptr: *mut U| init.__init(ptr.cast::<T>())) }
 }
 
 /// An initializer that leaves the memory uninitialized.
-- 
2.50.1

