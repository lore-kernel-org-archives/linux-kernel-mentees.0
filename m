Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234CA1D5CC6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  2 Jun 2025 01:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748826433; cv=none; b=NTM83Y42lC/C6hQupMssw7N78OQde/GuLRtI5mBq0Mk+t3HerAw53uyfPWM+qgsnW9RUtaxIazUHwiQXygPgb7fAcSFhfaCb8SVB69AuC5ulQ9LqfdDsfzHL4mp7xutaDpEXU2AiYDHGrUOlHB1lzpLIzc7A3GZH+AILVRujXx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748826433; c=relaxed/simple;
	bh=zKUbplKeRnCJvLOKyAOsoB0IHwghWb9gG0zIcb25BGc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NSqOrSPVsrFWlmwmVqR7si1XU250wcM9zgKVauGb8EMc4Y/BTsyyWUUkFPLc1CN4fiXmtzGlHWjA4dsRPCiklMiSoyv5Z/jEEDW8qGPnwoZk/nBRIjlvSex5gxtFqzlgL6x3f0WUTtWGC1umdM9rE+5gOl12LvpuOc7PxF0J6Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CRVfxLGE; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CRVfxLGE"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B888405C3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  2 Jun 2025 01:07:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4bz1zP1vfpkw for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Jun 2025 01:07:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::a2a; helo=mail-vk1-xa2a.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D75E740271
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D75E740271
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CRVfxLGE
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com [IPv6:2607:f8b0:4864:20::a2a])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D75E740271
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  2 Jun 2025 01:07:09 +0000 (UTC)
Received: by mail-vk1-xa2a.google.com with SMTP id 71dfb90a1353d-525b44b7720so1188998e0c.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 01 Jun 2025 18:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748826428; x=1749431228; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8VXK8wZ6Oa5fM3Lot1qqbDFw7vuhDTeQNUDrQ3pNTxQ=;
        b=CRVfxLGEl1O5C0w6eCJL8lOtQhrn8maYDFezxXRyl0giCx33TVRB+gKlWFByCEUioz
         AIIaO4fjXAJoqyweaiFI5mDsAt4TxfTVLrHw8gTB8MqHbnGj7hYJTWQhmxPDMnUMubDP
         j36LUXg21IrVmwfnLqARVjM069SDuaEIyh20qpOAdgWV6LuRSlIvnxfvasnJKcPkvJNx
         IT525pOD990glXzbVZUP3excHTK52OT3WdllFnpqV0jVsg6/iKLae6EdZCl+U8w7P1wT
         ACYLufNyQ3Z2MpF8XRTy8OxBF4RU5uTvh4ZOec8+ObBo24tMTQfp8HlPh8Q9gXfnfZsk
         uxTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748826428; x=1749431228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8VXK8wZ6Oa5fM3Lot1qqbDFw7vuhDTeQNUDrQ3pNTxQ=;
        b=NFVedCgSJ2gkaejI3yb4gIIXKWgVrCp8dsFtaknJdvic/5vacZkjWTFZZRm9Qr4jTG
         jFSxbAcUmkVoZtDfWIsYm4nG9Y2eCSJVLilSfETyyhOTd+q8WoIwBMy3A914pabH8SUB
         XegXHldyiNgUwcHJ1nlp23q6tsuX3KEHfRilDPfx0HKs1Sqd9zLoVbbKJl7r/8XdIB8q
         61kOkNDHxpAAtG+QIMpv6eBUPMiG3vNMdF6VGDxJT2B9P9FhSnplW5AMKDRaq4aTH30F
         FzrlKaYmlv2O+3aPLnHt5Q/000fwmyTBix1Fl+LHcMaG+iymHJ4kfbhcrWne/aNRgevd
         z7zg==
X-Forwarded-Encrypted: i=1; AJvYcCWBaFnak28fVUYQzPFYuCDWBrukzZMxrFMZAVIYjpxhxVvCTVkVH7F+/gdZSFvrAW6DTNvDszXKVUSCOV6PFmeQyWk9Fw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzxzIxQnZycziWtv/1sobd+3CDd+4FH3fE3lgMNgE3Ekdn8mgnN
	cSHLdMoQ/vglOV57NxxiU2BXpRckqh99CnJpqGiLykgXXtsIrHdx1YuygFOCIA==
X-Gm-Gg: ASbGncsqo2A2VDmVBJxvZ337VMWmDWPzl4FzuZ15MQxqliKWfN5yWXhZQ+hhp/KuVTK
	s8RI2ZO2c2QPoN2LaqtflMJGgIWB2gL3pJgh/VINdfgX5qgGrHIDolae93IkeCC5BQjaPh1a5dM
	lww/HxPHFPZTvkPJGbozUb3DjXxQZrLgfdy06dH1t4j9/4tmEI6FDA+b5HkFqIyv06QY1l602TQ
	IwLWsvU/BG6BW5ZCQ9ibIf75afQPqspXvSVmoOArsGaRQJAHrRX/6vsksl8BK7AQfkeUs7V//Ff
	x4Ak9drtDTuotdJ8gcDEtnZXQ1jsQ+n+URU3kLpbvbdPqXIZIig=
X-Google-Smtp-Source: AGHT+IH9Sq+xNPQtlDmy56p9U1etf2eBWfeT5mYxmCUV6v6jEvXPbbM94yE47q0w50Mx+8KX7QHm3g==
X-Received: by 2002:a05:6122:1812:b0:528:f40f:347f with SMTP id 71dfb90a1353d-53084ba7b49mr8372477e0c.2.1748826428501;
        Sun, 01 Jun 2025 18:07:08 -0700 (PDT)
Received: from fedora.. ([2804:14c:64:af90::1001])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53074ad8b51sm6787844e0c.14.2025.06.01.18.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 18:07:08 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: lossin@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH 2/3] rust: revocable: simplify RevocableGuard for internal safety
Date: Sun,  1 Jun 2025 22:07:00 -0300
Message-ID: <20250602010701.116503-2-marcelomoreira1905@gmail.com>
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

This commit refactors `RevocableGuard` to hold a direct reference
(`&'a T`) instead of a raw pointer (`*const T`). This makes the guard
internally safe, reducing the need for `unsafe` blocks in its usage
and simplifying its implementation.

The `try_access` function is updated to leverage `try_access_with_guard`
and `map` to construct the `RevocableGuard` in a more idiomatic and safe
Rust way, avoiding manual pointer operations. The associated invariants
and `SAFETY` comments for `RevocableGuard` itself are removed as its
safety is now guaranteed by its type definition.

Suggested-by: Benno Lossin <lossin@kernel.org>
Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
---
 rust/kernel/revocable.rs | 26 ++++++--------------------
 1 file changed, 6 insertions(+), 20 deletions(-)

diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
index d14f9052f1ac..43cc9bdc94f4 100644
--- a/rust/kernel/revocable.rs
+++ b/rust/kernel/revocable.rs
@@ -105,13 +105,7 @@ pub fn new(data: impl PinInit<T>) -> impl PinInit<Self> {
     /// because another CPU may be waiting to complete the revocation of this object.
     pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
         let guard = rcu::read_lock();
-        if self.is_available.load(Ordering::Relaxed) {
-            // Since `self.is_available` is true, data is initialised and has to remain valid
-            // because the RCU read side lock prevents it from being dropped.
-            Some(RevocableGuard::new(self.data.get(), guard))
-        } else {
-            None
-        }
+        self.try_access_with_guard(&guard).map(|data| RevocableGuard::new(data, guard))
     }
 
     /// Tries to access the revocable wrapped object.
@@ -198,22 +192,16 @@ fn drop(self: Pin<&mut Self>) {
 ///
 /// CPUs may not sleep while holding on to [`RevocableGuard`] because it's in atomic context
 /// holding the RCU read-side lock.
-///
-/// # Invariants
-///
-/// The RCU read-side lock is held while the guard is alive.
 pub struct RevocableGuard<'a, T> {
-    data_ref: *const T,
+    data: &'a T,
     _rcu_guard: rcu::Guard,
-    _p: PhantomData<&'a ()>,
 }
 
-impl<T> RevocableGuard<'_, T> {
-    fn new(data_ref: *const T, rcu_guard: rcu::Guard) -> Self {
+impl<'a, T> RevocableGuard<'a, T> {
+    fn new(data: &'a T, rcu_guard: rcu::Guard) -> Self {
         Self {
-            data_ref,
+            data,
             _rcu_guard: rcu_guard,
-            _p: PhantomData,
         }
     }
 }
@@ -222,8 +210,6 @@ impl<T> Deref for RevocableGuard<'_, T> {
     type Target = T;
 
     fn deref(&self) -> &Self::Target {
-        // SAFETY: By the type invariants, we hold the rcu read-side lock, so the object is
-        // guaranteed to remain valid.
-        unsafe { &*self.data_ref }
+        self.data
     }
 }
-- 
2.49.0

