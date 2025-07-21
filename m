Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079A213B590
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 21 Jul 2025 01:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753059802; cv=none; b=vAo6yB8x+DKDODQga/M2c1WHkTJ5W+SZrZBwukJh7i5v/jvGEtVYI4cPxHJwBDfiwI4in40+amjctY6pz1uzqElgAp9KOyoCYGNkSxP6CCBlHXk+1YDGhF9nUOw0M7UmLAjBAE1Q1O1CjL1Qh7rWXCrzaAgFFFBiJdWNlRMKPS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753059802; c=relaxed/simple;
	bh=1JLaltb09ETI01fMju65A7uQX9JQAkcTCKyIvzLpeKE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X77dpmxojhsSVOEvlJqKix4SGuZoeB0jRQQG59KvKVdZv/M2gNLFW1KJ/4myNKl5fn5/NEYifMw35eJet67lzTtf4NNIaf6g5tBnCG7MWK7EsDQGXD3gZhakpiMwPv+T6W47mGNhQNKRo8c9QbDTELaSIarSLSgFDMvOX/48Gzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hdmylaHl; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hdmylaHl"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9ECDB61C63
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 21 Jul 2025 01:03:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6pnFF6cT2onN for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Jul 2025 01:03:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::c33; helo=mail-oo1-xc33.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EAB0C61C56
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAB0C61C56
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hdmylaHl
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
	by smtp3.osuosl.org (Postfix) with ESMTPS id EAB0C61C56
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 21 Jul 2025 01:03:17 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-615950642d9so2147774eaf.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 20 Jul 2025 18:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753059797; x=1753664597; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=clkCERaiIbD8OK3WKxEVZxh1uP4F7c7KKvTuaOqAtJI=;
        b=hdmylaHlVlM6F7T3sj7+L8Ae4kQTDVi8C/PItK57kSGtbjtMu6cukavGawmOQ5wztd
         U1yeDXOr+lw017D1/0Sfhf6Iipit1gqv4TmZsRWTfTdwup2cYUAngyUeXxh8AE0cVati
         MtI/3YWDFx72CauAxCo6XdweoytZMGuGUyLqeyr18jrPOjikVhTAlWPcr6wc0Baq1qib
         XsxcoPMq82qNS9tvcSUYOwnqELPZUPAT+JyTb72qWu9nydu9AUC0eCNrQSheiVrTYrf5
         Fg+R44qEkqv2zoaBCIV9T5fEKaIobfW5UyFGLb/zurEdocz6bXYIFpbOeGQnQ/1G50Jy
         evJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753059797; x=1753664597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=clkCERaiIbD8OK3WKxEVZxh1uP4F7c7KKvTuaOqAtJI=;
        b=hStDtX6R7HVYJl3UfGXcgwVsgpCweruKu5z8FPQAEjHspvIgxWO2B7E2NUCWVKq7I2
         iFvcXbAoK2v9T2W1nSLgAeA3CqpIPWyPKTP53MfWPtkcM7iaFT62CWPDWP61GhsteGIH
         X4pbr0gdp2czS7e+19SMvZKBXz0FU3HtcNbEINxCycdVIhBMiOE4hAblt18bnCwD0U6B
         E5n7Er90kblX5aMxREbp5EOfSMYDcz1gPuHNcWzhExZXrBv76tFjaR2Pc5/JIL6lBtNM
         i1P5pDZG7Pmu6h+f4Tb4UxrnCp6gPTeWgk5CBW+VnyxvTkvIQtrGA8z/h/mlDN8Lfw1C
         dnww==
X-Forwarded-Encrypted: i=1; AJvYcCWD94HrMmDtCGfLgLQ3Dh19MDWRWwIsUR9744PotNlKNn0K3E27NZDc3xu1MlLrqdxAIrOHWIrIhhFCQ6WgLwc8t5DrJw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxNjUw31J+N9kRbORyEYKsLTW74a51qm4cNhI0KOLHx63z0hQvf
	L44ckGUORnPU6qeLMvNrRIJ04zp7vOBYyP2vkz6aQSJfh2pqGp71bTwh
X-Gm-Gg: ASbGncsvR7MckxRRQGihClp3Lt84Z01U05+48+42MaoxrANzwPrA3TLL2lp+GU03VA0
	HFUjRQrzFQAxM2HOeuIFFx2oxcf2PLI+bW2Wozb0p6ohFNqociohxxLtnIEIm3DhwObaJmhnlDD
	9OE0W+Ww7RHxYTl9g/HJIszURQeUV55ldZbD2+YEuZj9rybDPdMJPpL2SFxXSViIOubow7wNjnp
	yXJSeaO7souVSrzYqMMRseiqagGMkKejt2z9x4ohFBhuVGyhHgYKM5FI1OT/WERgI+SDl1SC3EA
	1r4TmqKDXhSJovFGvdMFW22o0mOa0iqufcggp2haG8kalC+IQH/ai3cYOPV1JN//mT2r1DEIQFb
	tcMs3OX9D
X-Google-Smtp-Source: AGHT+IHHaBjV0MrDnOSgRcDQYhvt3oaN/IiwUh/HCgcTWpXCkLnAjEZt94pL6oB5xBGzB0Xk6HM7QA==
X-Received: by 2002:a4a:edcc:0:b0:615:9673:ab6c with SMTP id 006d021491bc7-615a1ee0386mr14457028eaf.1.1753059796831;
        Sun, 20 Jul 2025 18:03:16 -0700 (PDT)
Received: from fedora ([2804:14c:64:af90::1000])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-615bcc8c2dbsm1436959eaf.20.2025.07.20.18.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 18:03:16 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: aliceryhl@google.com,
	lossin@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v7 2/3] rust: revocable: Refactor revocation mechanism to remove generic revoke_internal
Date: Sun, 20 Jul 2025 22:01:54 -0300
Message-ID: <20250721010258.70567-3-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250721010258.70567-1-marcelomoreira1905@gmail.com>
References: <20250721010258.70567-1-marcelomoreira1905@gmail.com>
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

