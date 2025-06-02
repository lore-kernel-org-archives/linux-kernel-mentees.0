Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB58E1DDC2C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  2 Jun 2025 01:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748826435; cv=none; b=tekQUPv24pviVtixpNkVks/UL2y5x8vE/NRVHjorVwzVIgwg58ZE3ujEn5XrboOnIiGR9u6rn9W+U0ImrKDauGeqAeLvXDvo66lVjZPq3Wz+LmDGXf7/ItD+UGSWuMoKRnFk1ciJyKr8AaoywJN+gumC+Ux8zngIVlXvAsHcPKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748826435; c=relaxed/simple;
	bh=cUH/AggEuguei7YgUl376puy8XlQF0imPcYcuFixUO8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tl4Ld3Q9GnJlJGRverB9uGZjC4bRcn+GOfTa5nKcIbwgdKnP/O+uTeBoEkE7UE9HTnDNhn2AZrvfAiIqmWQeDlELYeyOkfUH2n3uV8jU3vZhbxyfpqKEUBsuuS++aL9l3Yyhnwt/mruoB0gOAozNQW2dYuyU8qSbjLNMw16P/Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DZ9vAtSb; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DZ9vAtSb"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7885F80D1C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  2 Jun 2025 01:07:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 101fIq-L1YvB for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Jun 2025 01:07:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::a2f; helo=mail-vk1-xa2f.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A45BE80D19
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A45BE80D19
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DZ9vAtSb
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com [IPv6:2607:f8b0:4864:20::a2f])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A45BE80D19
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  2 Jun 2025 01:07:12 +0000 (UTC)
Received: by mail-vk1-xa2f.google.com with SMTP id 71dfb90a1353d-52f22008b6aso1258004e0c.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 01 Jun 2025 18:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748826431; x=1749431231; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HpTW2A6QYa5jp5Fjr59g12q6ycrS0TTsu5uhRgEbA0U=;
        b=DZ9vAtSbDCOKvYxNy/pbT4mK3AL4uRfWZZ8PsB9I9b7sKarcWu8riTMVO1KSqTu5+p
         JoOTPvL5zoxa/t20VR1SgluhrZxriNS3U+1biayDlr71VtJKzQAas6KrRHkIfflFflSo
         XrT8SVNAnJqQTYJKzz6VOEbTGMvNKTqLk+DpsREtu3LV5f5FUGNRrcDBCu32dUW8MDUi
         YYFDXcWhrfkjDdXe5rTuImzge5zlR+OpTg6Irk+pDa1KXTXuORTQWGbvAIPcaIql3Ko2
         kzAyzfyJUIf7KnsT4vyldwcyTobWTAo80gy4CgNte6Qpt5GeFW1/eeyPzN9+RGHJ14rQ
         setw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748826431; x=1749431231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HpTW2A6QYa5jp5Fjr59g12q6ycrS0TTsu5uhRgEbA0U=;
        b=cCYWJjQsd876S6M8TdPI297FFP4Q9HwN4rSmI50E8ZOd56Bj3+9uUU94gPD7R9IIRB
         N9rAo++Es3g4zC6NzXUJo4Yzm3p41jT5dddGe3x2NbuawwrwPHXmvSCqFfXVUCc2tcSd
         d+lqw8KV4YjS10Ivzi0FLgV4kxqH24ZA6yNKgVJrWg1EFVoJdYTN5OaUShjgeVjyAULV
         ldQiaMVcPW27hpj4xsNc+IoWKleLz7yTYS0qJNqVzP4uvEXEnm+aH46VzOPTPdrU2ZOF
         A8B5XpAVbPD6t8eEkuP6DG09WMwusuJ7cXWPGkEpUSJ/CEKilsbuHcof6WFV5o97aW13
         gxzA==
X-Forwarded-Encrypted: i=1; AJvYcCWlq5e0D2bwZPy/IJQ2IqxNLt9jzL0wmOFCKTpQL0fnSiWVHv9eMmeNvtGcJHrLmI6RtnklT7Rn+vuWOeo1sty1pZKH5g==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Ywyk+HKNE3X52fDHBCOBGw9d/A8rLgPaXBGVjTL4SFAvALN88Ru
	msW3l2ZT4ipIcwAezTbEwagK4PuqDrWPQk7X9d4m9N1ZX3gFHLzCsMi9
X-Gm-Gg: ASbGncvI+Jp/k8Cphh4Q//6CbfS3QwhNuviA08rr7Ry9kfXqGJoobPCq154bZzIRtak
	z90avnkm3deacLwPm13QsbsQVkv01cj3lXr7Ei0FFxJmhhd5+josKsIrhWF+8SYBamoFn60bw+e
	lPDSb5WLg3YExNiVqvZC2beHI0+P1uZSzK9suZ9pVnN30OLEfwSY9awY59uryVqUMl5/hkTMgXd
	MTk/iAfM0XwPm+M2YxRzT9k8F0uLJBiLrUUM2Gen4UFtQaekJIXXmegr6nJ8LaJ+BW5mxd8EvrV
	JzFSQpIFF+W2yJuW6TBYSACdkYOWPONoYw3hWA6n
X-Google-Smtp-Source: AGHT+IGC/aUcIt7oP/v53IzgBpXqZLznqR8QP8Q2BBdSoMfGOioOF4NLnrElEkqLM5R7PxWuyT6MRw==
X-Received: by 2002:a05:6122:2009:b0:525:bf40:e628 with SMTP id 71dfb90a1353d-5309377d018mr4135149e0c.6.1748826431100;
        Sun, 01 Jun 2025 18:07:11 -0700 (PDT)
Received: from fedora.. ([2804:14c:64:af90::1001])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53074ad8b51sm6787844e0c.14.2025.06.01.18.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 18:07:10 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: lossin@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH 3/3] rust: revocable: split revoke_internal into revoke and revoke_nosync
Date: Sun,  1 Jun 2025 22:07:01 -0300
Message-ID: <20250602010701.116503-3-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602010701.116503-1-marcelomoreira1905@gmail.com>
References: <20250602010701.116503-1-marcelomoreira1905@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit refactors the revocation mechanism by removing the generic
`revoke_internal` function. Its logic is now directly integrated into
two distinct public functions: `revoke()` and `revoke_nosync()`.

`revoke_nosync()` is an `unsafe` function that requires the caller to
guarantee no concurrent users, thus avoiding an RCU grace period.
`revoke()` is a safe function that internally waits for the RCU grace
period to ensure all concurrent accesses have completed before dropping
the wrapped object.

This change improves API clarity and simplifies associated `SAFETY`
comments by making the synchronization behavior explicit in the function
signatures.

Suggested-by: Benno Lossin <lossin@kernel.org>
Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
---
 rust/kernel/revocable.rs | 38 +++++++++++++++-----------------------
 1 file changed, 15 insertions(+), 23 deletions(-)

diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
index 43cc9bdc94f4..daf22e3a7d20 100644
--- a/rust/kernel/revocable.rs
+++ b/rust/kernel/revocable.rs
@@ -126,22 +126,6 @@ pub fn try_access_with_guard<'a>(&'a self, _guard: &'a rcu::Guard) -> Option<&'a
         }
     }
 
-    /// # Safety
-    ///
-    /// Callers must ensure that there are no more concurrent users of the revocable object.
-    unsafe fn revoke_internal<const SYNC: bool>(&self) {
-        if self.is_available.swap(false, Ordering::Relaxed) {
-            if SYNC {
-                // SAFETY: Just an FFI call, there are no further requirements.
-                unsafe { bindings::synchronize_rcu() };
-            }
-
-            // SAFETY: We know `self.data` is valid because only one CPU can succeed the
-            // `compare_exchange` above that takes `is_available` from `true` to `false`.
-            unsafe { drop_in_place(self.data.get()) };
-        }
-    }
-
     /// Revokes access to and drops the wrapped object.
     ///
     /// Access to the object is revoked immediately to new callers of [`Revocable::try_access`],
@@ -151,10 +135,12 @@ unsafe fn revoke_internal<const SYNC: bool>(&self) {
     ///
     /// Callers must ensure that there are no more concurrent users of the revocable object.
     pub unsafe fn revoke_nosync(&self) {
-        // SAFETY: By the safety requirement of this function, the caller ensures that nobody is
-        // accessing the data anymore and hence we don't have to wait for the grace period to
-        // finish.
-        unsafe { self.revoke_internal::<false>() }
+        if self.is_available.swap(false, Ordering::Relaxed) {
+            // SAFETY: `Self::data` is valid for writes because of `Self`'s type invariants,
+            // as `Self::is_available` is false due to the atomic swap, and by the safety
+            // requirements of this function, no thread is accessing `data` anymore.
+            unsafe { drop_in_place(self.data.get()) };
+        }
     }
 
     /// Revokes access to and drops the wrapped object.
@@ -165,9 +151,15 @@ pub unsafe fn revoke_nosync(&self) {
     /// [`Revocable::try_access`] beforehand and still haven't dropped the returned guard), this
     /// function waits for the concurrent access to complete before dropping the wrapped object.
     pub fn revoke(&self) {
-        // SAFETY: By passing `true` we ask `revoke_internal` to wait for the grace period to
-        // finish.
-        unsafe { self.revoke_internal::<true>() }
+        if self.is_available.swap(false, Ordering::Relaxed) {
+            // SAFETY: Just an FFI call, there are no further requirements.
+            unsafe { bindings::synchronize_rcu() };
+
+            // SAFETY: `Self::data` is valid for writes because of `Self`'s type invariants,
+            // as `Self::is_available` is false due to the atomic swap, and `synchronize_rcu`
+            // ensures all prior RCU read-side critical sections have completed.
+            unsafe { drop_in_place(self.data.get()) };
+        }
     }
 }
 
-- 
2.49.0

