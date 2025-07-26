Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEEC1B4248
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 26 Jul 2025 18:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753554975; cv=none; b=Mvwut2qLJkVBda6rNROCCiolSQoYjm7E8apth/fk7mDvrpUuYdLhV4W8ZK+XImfHGPB35ccInVjiFGLDNWfu4qye2s66kJiW7ZdSfbjx5bscbWS5V7SchB9KT0PBXM0L1/85IK/gyIHqyq4uOmMxHddhxOkP6KzbcTo1OfDdZGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753554975; c=relaxed/simple;
	bh=1JLaltb09ETI01fMju65A7uQX9JQAkcTCKyIvzLpeKE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NW0K1dDaRtInhXNM7I8Aazsf09xaIV/Uom0T3NZQnCRExQZX52+UwcM0dgNsCNNtUx4d18txeamzOSnsrOof2olfCRLojS9HcYY5dkNWsrbO2PCtjba2pn+iCjclf4dsvxAVe+BPlxQ0r9f7gCCRDsL3SBCm8feyzUnNWkQ3I3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iWDxKAvY; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iWDxKAvY"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68D8C40128
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 26 Jul 2025 18:36:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 18Br-64eoWrR for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Jul 2025 18:36:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C94F0400D5
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C94F0400D5
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iWDxKAvY
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C94F0400D5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 26 Jul 2025 18:36:11 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-75bd436d970so2014351b3a.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 26 Jul 2025 11:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753554971; x=1754159771; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=clkCERaiIbD8OK3WKxEVZxh1uP4F7c7KKvTuaOqAtJI=;
        b=iWDxKAvYP+FpDOrhxzY8HCKklVcEheLY80YVyMH5h8yhjmAi7WtrHu0CDTocCWxn7b
         qFMOmG4oddfF0aVwjOSAUol5GQ2hrCEeSp9jKEnBvbKkG01g2ePJ+PPgL/DCOFAyRd/L
         22NRpnbG4Ll98SnuMix+y4qd41oZtjDBjPZZrZS34PTV0EKamW3cz7+Sks623ajh+kpr
         Uhz8XAzCFqMCtBtiQkt39LypMtxqrhVng/M3ANMaycEWzgA+MmizajeZ1eSCY2Nv5mHR
         Rgwns0S5JQESizTtz1097eLgAa92m6TfsxAEc7d/eYVQ5LCtamW4drQBl2abJDwkgImq
         BPSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753554971; x=1754159771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=clkCERaiIbD8OK3WKxEVZxh1uP4F7c7KKvTuaOqAtJI=;
        b=QwTReJX0vqMawlM0+V1FXH8CaYuKp4q7gcciA169K+5MuLR+j89iCu8X6f5hDR6hiu
         eG0zzNZkd3VBwJfCgMTjDvKPcm+SbovwQywYO/XSW2mG7YNiREErIRfxayeh74uHvj4g
         7YkyyUqoZ/cj9WBbX38vY2v3EeRT81wORSvYa7tKA1iteotGUVuI4eiSenNmIQoJgqkP
         Jn7avK+vGPHjWj2CxQiCQb09DI/g+zEkYH24Pk515RkFQwBw/iiYwMgWkLzcv+P67eKk
         DBomG1RfoPKrVLbRe9MkZQsHkXZWQCm7dHG93uI3/qCQXWSDHgztyCNZAZtbo4ZahNij
         PgQA==
X-Forwarded-Encrypted: i=1; AJvYcCUiTWRVluSa5xoQlZtmRrU1qFDLmA8H0nDpbAOEs3jDRhOpZjROeViv8WJPDADl1d9Jbt1kijKifeNIOy4ZHeJziuZI0Q==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yx5KpWjMmiKXiPMX2v1Qhdz9iaAW3qu5BcmMB2PSSeZHVynar3y
	WJvazN8gU+ivjTtP6P9lbsBwlmrEaDol0SJUIY4nIKwL8u00ESaCnqhI
X-Gm-Gg: ASbGnctMc4XuQuxm/gt9j4mAa1omwMeI6/dD1VubYztx418mVfarT6k9953x7dmS7+Z
	yKhHJkz6/UPUyHKmnhcGVYDwC7QxjeHkurSXczL6pKT0TlpqKeDtLFCTfWW4023DHCT2raUeqXH
	7TqOzCMC55S3JeXgTW5ht4kh6g3heFtoS/F9bf6SgU1NytUFylxIXMaWsNOLSlG8qBpDaZM2Egj
	3KF1CewY+GfroUBkxMBD9wrAPOKB53D1uyhgsxRVnKs76SAkqiWAguARqVCdKVVtGyVg0ReyTMb
	O0Udeatze6EZ50gOEo+A2bgsCzcItx8h8UUKJY4f24FORzCnzqoF60gUjG+/6EwHUYZt5sX8V4a
	9M/75pYoc
X-Google-Smtp-Source: AGHT+IHnUwiVBTY531wTS6csNGdOFaWhCRrmz69NpjFumA8teKJ40dj1RU0WHM2XYrtdTtUXYaIlWw==
X-Received: by 2002:a05:6a00:2e1c:b0:739:50c0:b3fe with SMTP id d2e1a72fcca58-763328614ebmr11483351b3a.8.1753554970936;
        Sat, 26 Jul 2025 11:36:10 -0700 (PDT)
Received: from fedora ([2804:14c:64:af90::1001])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7640881ee75sm2169295b3a.2.2025.07.26.11.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 11:36:10 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: aliceryhl@google.com,
	lossin@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v8 2/3] rust: revocable: Refactor revocation mechanism to remove generic revoke_internal
Date: Sat, 26 Jul 2025 15:35:02 -0300
Message-ID: <20250726183552.23098-3-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250726183552.23098-1-marcelomoreira1905@gmail.com>
References: <20250726183552.23098-1-marcelomoreira1905@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The revocation mechanism is refactored by removing the generic
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
Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
---
 rust/kernel/revocable.rs | 48 ++++++++++++++++++----------------------
 1 file changed, 21 insertions(+), 27 deletions(-)

diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
index 2dfee25240a0..6d8e9237dbdf 100644
--- a/rust/kernel/revocable.rs
+++ b/rust/kernel/revocable.rs
@@ -160,26 +160,6 @@ pub unsafe fn access(&self) -> &T {
         unsafe { &*self.data.get() }
     }
 
-    /// # Safety
-    ///
-    /// Callers must ensure that there are no more concurrent users of the revocable object.
-    unsafe fn revoke_internal<const SYNC: bool>(&self) -> bool {
-        let revoke = self.is_available.swap(false, Ordering::Relaxed);
-
-        if revoke {
-            if SYNC {
-                // SAFETY: Just an FFI call, there are no further requirements.
-                unsafe { bindings::synchronize_rcu() };
-            }
-
-            // SAFETY: We know `self.data` is valid because only one CPU can succeed the
-            // `compare_exchange` above that takes `is_available` from `true` to `false`.
-            unsafe { drop_in_place(self.data.get()) };
-        }
-
-        revoke
-    }
-
     /// Revokes access to and drops the wrapped object.
     ///
     /// Access to the object is revoked immediately to new callers of [`Revocable::try_access`],
@@ -192,10 +172,15 @@ unsafe fn revoke_internal<const SYNC: bool>(&self) -> bool {
     ///
     /// Callers must ensure that there are no more concurrent users of the revocable object.
     pub unsafe fn revoke_nosync(&self) -> bool {
-        // SAFETY: By the safety requirement of this function, the caller ensures that nobody is
-        // accessing the data anymore and hence we don't have to wait for the grace period to
-        // finish.
-        unsafe { self.revoke_internal::<false>() }
+        let revoke = self.is_available.swap(false, Ordering::Relaxed);
+
+        if revoke {
+            // SAFETY: `self.data` is valid for writes because of `Self`'s type invariants,
+            // as `self.is_available` is false due to the atomic swap, and by the safety
+            // requirements of this function, no thread is accessing `data` anymore.
+            unsafe { drop_in_place(self.data.get()) };
+        }
+        revoke
     }
 
     /// Revokes access to and drops the wrapped object.
@@ -209,9 +194,18 @@ pub unsafe fn revoke_nosync(&self) -> bool {
     /// Returns `true` if `&self` has been revoked with this call, `false` if it was revoked
     /// already.
     pub fn revoke(&self) -> bool {
-        // SAFETY: By passing `true` we ask `revoke_internal` to wait for the grace period to
-        // finish.
-        unsafe { self.revoke_internal::<true>() }
+        let revoke = self.is_available.swap(false, Ordering::Relaxed);
+
+        if revoke {
+            // SAFETY: Just an FFI call, there are no further requirements.
+            unsafe { bindings::synchronize_rcu() };
+
+            // SAFETY: `self.data` is valid for writes because of `Self`'s type invariants,
+            // as `self.is_available` is false due to the atomic swap, and `synchronize_rcu`
+            // ensures all prior RCU read-side critical sections have completed.
+            unsafe { drop_in_place(self.data.get()) };
+        }
+        revoke
     }
 }
 
-- 
2.50.1

