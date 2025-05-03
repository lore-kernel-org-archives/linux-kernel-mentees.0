Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969A37081C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  3 May 2025 14:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746283994; cv=none; b=as5PhOTIPID1IgEMQo9E5s8uiPosLc3tUZ5PbG56YUnJtvDRs4v5P2gi3nTJzr+lZ2dd7gpuammIBaSMJfYgdj0KdywrJxBVcAFBxHadWUhFLKC+JP9ieS8ETekFId0bhUrMYf6CUZA9vrDBmUgPuoz0HG5T1r72nPuS3qMAdKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746283994; c=relaxed/simple;
	bh=j3Ud/OYibTVSOiEsYG8LwGXRbxDePGGcZqGoPPGYliE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=az2vS/qjZwJldGIbwYpO517VwSFy43ZyU7gerBMxH+isAyhXmgg4KCEyi/i/nwxVyskL606otShgdJhrlAPcCnXbhfaikqyz6qN78WIUTKPMIT60JC5GCGd1wg5CwK2stPh8Esl+ruzBslljgxrFnEBGi257iemSdyf6kqVbvpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f5wD4Wi6; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f5wD4Wi6"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 110C440B30
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  3 May 2025 14:53:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T8FZcqKqf4p5 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 May 2025 14:53:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 33AD540027
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33AD540027
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=f5wD4Wi6
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 33AD540027
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  3 May 2025 14:53:12 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-22438c356c8so30149575ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 03 May 2025 07:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746283991; x=1746888791; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rkcV4FXqVYw5sHKdG12V8QpgsgJTWs8KJsxOjdw9VFo=;
        b=f5wD4Wi6tdYHJQV2yxVeQZw4qV+lXrQJSdzhpI9x9VEBSI46L88lh8lrTdEjsqB4RL
         ZAnkTEyT1AG19g8Sh/mEyYXp74Fy1aeERe76Hm10tpSzIx/F/1lsVWj7o4bVow/JIDAz
         vAaW04N6RIlurr6GGh0ALZ0xY/FhxBwJtQ7mWitqCicmHcP87z0TGDt7NVFE3i37dVDo
         i2xYw6Xd3evhXJ4EHO0XbpklPbZOofBnTEnUp57RLPVOMHDZHUbtb45uVAo7kYasgLm7
         p32n31Ogu5X+N6ioJNgB28KnyWEr9XWmJBHx1v7cAhTVBStVXw2DOxoqhSLwfuf+zYRD
         B55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746283991; x=1746888791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rkcV4FXqVYw5sHKdG12V8QpgsgJTWs8KJsxOjdw9VFo=;
        b=iKuLBlq32vjwCzmip0SpP5bthOyG/BpuPX0oyQSDuks5A4GjEYxft+vw1RpjqGKVco
         dct66SqF7xJyJ2lOOV50IRTmhkY+MLHFGnnPfSFMHEQgZnfWX9SbXccxhKTG60TCkeeu
         mfhtFPY/3hn5Ew+l6Q8ZHyMGzL2l8+Sm7RpQnB2XqRO//0t4S3279idOviSpEWcvqwXG
         OUuTGIlzQRbOep632dvvwJz1U4TlLw6Q+3cTxnvbCSMzkqVzGOIex1M979H9sZrmhMIc
         OATS/3kP6qiFvJnoG8l5UwXP2G+9KKxktQpfldqnxb2eqY7KCqNegWeUOrDoXTmxoWQw
         TCKA==
X-Forwarded-Encrypted: i=1; AJvYcCUN9hM5gMdCjXpm7OrHVsw5Pt+OzugnJRNZeuXrzw1L2cUY6094G1nGO3mCP50OC/ZKwAzqL5F9Y9EZ3yJsjTFgSeaFCw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwHGbeacYxB25d9hgARhcZWFQdtLsGTWbBSNi15cADB6pzEG+4w
	KkEwyW4PanRSITfpKrxGwEjhLYfgmUw4/kXrOJRqbM8k2xAylUz2
X-Gm-Gg: ASbGncv2Nn0ug5gbLMWaxNhC4naMSQ/awanRxmSDAWgf9oRT6APds7JwWFAxq6IeHWO
	cXhKotRqGhnJsOV+b69iv/fRbV1W1MaPy+Vqj2lNhAow3Rhwt3I3KktWEblfoKwvQWplV74fWC1
	ke4/bK/bDKCkkJYvtc0pN6o9O3Xpo9ND71XxSuLuUIKrIhk0X674iN2WdcYLb/mX/0dpTCOsU5w
	qIemC7I1FnK+NTNVkbx/FRTNzwRajOJsiHGMvYm4J4kFGbAe9xhYXd1EJ2g6EFKgJMKxo6Qsd++
	5DiSf9PtAMOFWZQTM+vqE2ZeRKauQg==
X-Google-Smtp-Source: AGHT+IFJTnRAgVFbelIKA9hrnKaBnDNBkYYLt2bGra0Z3uL+Z0O6ZpLND/Va0fkQMrGemqaZQVKseQ==
X-Received: by 2002:a17:903:2446:b0:21f:507b:9ad7 with SMTP id d9443c01a7336-22e1e91463fmr16344825ad.25.1746283991297;
        Sat, 03 May 2025 07:53:11 -0700 (PDT)
Received: from fedora.. ([2804:14c:64:af90::1000])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522fa16sm24815715ad.239.2025.05.03.07.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 07:53:10 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: benno.lossin@proton.me,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v2] rust: doc: Clarify safety invariants for Revocable type
Date: Sat,  3 May 2025 11:53:07 -0300
Message-ID: <20250503145307.68063-1-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Revocable type in rust/kernel/revocable.rs lacked a comprehensive
documentation of its safety invariants, specifically regarding the
validity of the wrapped data and the necessity of holding the RCU
read-side lock for access. This patch addresses this by:

- Adding an '# Invariants' section to the documentation of `Revocable<T>`
  clarifying that `data` is valid if and only if `is_available` is true,
  and that access to `data` requires holding the RCU read-side lock.
- Adding '// INVARIANT:' comments in `try_access` and `try_access_with_guard`
  to explicitly refer to these invariants before accessing the underlying data.
- Adding an '# Invariants' section to the documentation of `RevocableGuard<'_, T>`
  documenting that the RCU read-side lock is held for the lifetime of the guard
  and that `data_ref` points to valid data during this time.
- Updating the safety comment in the `Deref` implementation of `RevocableGuard`
  to explicitly mention the relevant invariants.

Changes in v2:

- Refined the wording of the invariants in `Revocable<T>` to be more direct
  and address feedback regarding the phrase 'must occur'.
- Added '// INVARIANT:' comments in `try_access` and `try_access_with_guard`
  as suggested by reviewers.
- Added the missing invariant for `RevocableGuard<'_, T>` regarding the
  validity of `data_ref`.
- Updated the safety comment in the `Deref` implementation of `RevocableGuard`
  to refer to the new invariant.

Reported-by: Benno Lossin <benno.lossin@proton.me>
Closes: https://github.com/Rust-for-Linux/linux/issues/1160
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
---
 rust/kernel/revocable.rs | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
index 2da3e9460c07..7ef2f34782b4 100644
--- a/rust/kernel/revocable.rs
+++ b/rust/kernel/revocable.rs
@@ -64,12 +64,11 @@
 ///
 /// # Invariants
 ///
-/// - The wrapped object `data` is valid if and only if `is_available` is `true`.
-/// - Access to `data` must occur only while holding the RCU read-side lock (e.g., via
-///   [`Revocable::try_access`] or [`Revocable::try_access_with_guard`]).
-/// - Once `is_available` is set to `false`, further access to `data` is disallowed,
-///   and the object is dropped either after an RCU grace period (in [`revoke`]),
-///   or immediately (in [`revoke_nosync`]).
+/// - `data` is valid if and only if `is_available` is true.
+/// - Access to `data` requires holding the RCU read-side lock.
+/// - Once is_available is set to false, further access to data is disallowed,
+///   and the object is dropped either after an RCU grace period (in [revoke]),
+///   or immediately (in [revoke_nosync]).
 #[pin_data(PinnedDrop)]
 pub struct Revocable<T> {
     is_available: AtomicBool,
@@ -106,8 +105,9 @@ pub fn new(data: impl PinInit<T>) -> impl PinInit<Self> {
     pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
         let guard = rcu::read_lock();
         if self.is_available.load(Ordering::Relaxed) {
-            // Since `self.is_available` is true, data is initialised and has to remain valid
-            // because the RCU read side lock prevents it from being dropped.
+            // INVARIANT: Since `self.is_available` is true, `self.data` is valid. The
+            // RCU read-side lock held by `guard` ensures that `self.data` remains valid for
+            // the lifetime of the guard.
             Some(RevocableGuard::new(self.data.get(), guard))
         } else {
             None
@@ -124,8 +124,10 @@ pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
     /// object.
     pub fn try_access_with_guard<'a>(&'a self, _guard: &'a rcu::Guard) -> Option<&'a T> {
         if self.is_available.load(Ordering::Relaxed) {
-            // SAFETY: Since `self.is_available` is true, data is initialised and has to remain
-            // valid because the RCU read side lock prevents it from being dropped.
+            // SAFETY:
+            // INVARIANT: Since `self.is_available` is true, `self.data` is valid. The
+            // RCU read-side lock held by `_guard` ensures that `self.data` remains valid for
+            // the lifetime of the returned reference.
             Some(unsafe { &*self.data.get() })
         } else {
             None
@@ -200,7 +202,8 @@ fn drop(self: Pin<&mut Self>) {
 ///
 /// # Invariants
 ///
-/// The RCU read-side lock is held while the guard is alive.
+/// The RCU read-side lock is held for the lifetime of this guard.
+/// `data_ref` points to valid data for the lifetime of this guard.
 pub struct RevocableGuard<'a, T> {
     data_ref: *const T,
     _rcu_guard: rcu::Guard,
@@ -221,8 +224,8 @@ impl<T> Deref for RevocableGuard<'_, T> {
     type Target = T;
 
     fn deref(&self) -> &Self::Target {
-        // SAFETY: By the type invariants, we hold the rcu read-side lock, so the object is
-        // guaranteed to remain valid.
+        // SAFETY: By the invariant of `Revocable`, `self.data_ref` is valid because the
+        // RCU read-side lock is held for the lifetime of this guard.
         unsafe { &*self.data_ref }
     }
 }
-- 
2.49.0

