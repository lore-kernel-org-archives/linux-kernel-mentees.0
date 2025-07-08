Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B21D126C1E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  8 Jul 2025 00:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751934890; cv=none; b=qZmAFhNluFzmyEUujkjhl8keuaMeD4MYApFO8K/3YoapLNnKy1FNzhEkLCJ2CyGUi0TCaVGibkTQy0Di9oSJ2ywNytahqJdcS5M8bKztiBTla18pK1AWwFTfBLCVS8aB3umrqr3ma193FN827z6bKdM1+aDR8yH9B4o38aaxkxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751934890; c=relaxed/simple;
	bh=yOrwPYVsLOHj8yiCOLLopOM8SnEGDOE2HTp01A2TD5E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gTRKRHw+xSTYe4CErFQysCUDkR9uZkU8U8I7/tnHPjwXqa88GvYH9mEvums/JhMvOKzIVMQi5hPptD7i1/PGkLiV5gckQatAMKqVh1fcJ9uqP71w6iehsirl9A53NWk/BGM4oVFRelocvwCBikh9F2v648xasN9ik+FktCeHwXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fUXiatoa; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fUXiatoa"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B19681E37
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  8 Jul 2025 00:34:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k7N5WD40qbX5 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Jul 2025 00:34:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::f30; helo=mail-qv1-xf30.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7011181858
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7011181858
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fUXiatoa
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7011181858
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  8 Jul 2025 00:34:48 +0000 (UTC)
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-70109af5f70so38196976d6.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 07 Jul 2025 17:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751934887; x=1752539687; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gzAwsuW1+0LZAS28lU0/GaU1LO8J8uSYjkSQLSp4PDI=;
        b=fUXiatoaWtX1eQCh2NxyPUh+8hpFDPDZIH8+BXkLLpKQtn0XBpHHlTVeYqHA0GdYJC
         KamiCUTMPTJnDWLy1xaV06IxiFurV/D9farOCikSm3Y6kHYLzhAvJgShguNk0Sh2sXmh
         45vuhK5ErmfzBUHtOvvLzpDn3t5ZiC61xKE142bK+3bWlXevASkwsJkIPolfRwy28ldT
         xbpYIT+01Rzsa+othLm3GlFEe0NzqetT1SeUiBEcdfdLwOFe/tpmmDPVly7OzfIfNNkW
         0PKS5f2IfWq/mqAfUytQLhmCPj+N3/uKKAlETXv3nqGdcJgIo6jZh7OrkPcq7YnAyEYD
         z+nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751934887; x=1752539687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gzAwsuW1+0LZAS28lU0/GaU1LO8J8uSYjkSQLSp4PDI=;
        b=g0Mjgax7cjK4Qv5p68IczcjG4Q3GkqfR4fQJjvQvvK3u/g9frciE7gfzq0jShgUcZi
         5SpIJT8mKKCo5uNfSAMm6wAhK1GadJKx2QiJ4voKy2IRrVRZGJARIzzCjrBBqPac1SCB
         gBaL+97WoJH+0Cu0OvaWvgxY0gcNMrLfFrECQJI+Q+YOhSDEvR/mu0Xn658N0x3IjObb
         PjLEGLQdsLCOYTbHPIhzwpC/bjfgpdusoQddv6ZZBb4335zTft5enuPpFokKiJagAdKr
         dF6vHlUse6415RMjfSgHs+ZIEIBX1KXxtpqsRBZuwM3Gep1zS7HNpF8eqlBqbXJGiijL
         bZOg==
X-Forwarded-Encrypted: i=1; AJvYcCWpze7mbOg2ngYiduNW3fCf2pVpHcxRQte+fijo2/4uq8ndyup04ypMjP44MmJqSOlGZCCvq0P09U6CIeIJ3rZGhu0kcw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxH2Sz8Ut3UHH+bH7KYKGkO7TA4UZ7dTq7fR8MKilpUqy269Yhp
	KiVl8VwyPM3weN6b4Tf9QCU/QuPqJhm1zAsiEPL58p2ZhWkrG83lWcsz
X-Gm-Gg: ASbGncsYXX5GKDWWBrmNH1prP10zC3e4tBVt2wXq579bDj8SDDElB/Ymxdy5o4F0+Vt
	O5WC3XkfqxewsHf7kb5hVwt9hC3KzYFaqWVoyxO+f3mEyVQGNH0BYXtxI+Qthnpm2Mt137YAM3i
	XmIkuB8Bldk3ZEQn9sYzJawDVQIsXHF9cUdZmrrDbTzVEyXVkKi44pCzG2jRmRRiEZPCiAcitdu
	pP5RMQ15WgS7iwJZnAaWDXQL1I/NxfQgBBqbkECToVDuJGDWwSCjxnlaEnmZauxykB32fHWidxY
	VNuM4/Y5NNG/rWo2wi0vvqbW5RYjeyM0hDDE8ifq5LP3j9w1
X-Google-Smtp-Source: AGHT+IFGsXRF7Mh+PHb+NS29/pBUgxmYxiIdI05h/rgb7mY3cQRMWHgRY7Ad5DlsP1zU9ujTd/GL0g==
X-Received: by 2002:a05:6214:2283:b0:704:7f0e:ca9d with SMTP id 6a1803df08f44-7047f0ecabbmr2605516d6.24.1751934887129;
        Mon, 07 Jul 2025 17:34:47 -0700 (PDT)
Received: from fedora ([2804:14c:64:af90::1000])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4cc751esm68746076d6.23.2025.07.07.17.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 17:34:46 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: aliceryhl@google.com,
	lossin@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v6 2/3] rust: revocable: Refactor revocation mechanism to remove generic revoke_internal
Date: Mon,  7 Jul 2025 21:33:38 -0300
Message-ID: <20250708003428.76783-3-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708003428.76783-1-marcelomoreira1905@gmail.com>
References: <20250708003428.76783-1-marcelomoreira1905@gmail.com>
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
2.50.0

