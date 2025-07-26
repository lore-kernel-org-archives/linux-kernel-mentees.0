Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548A1288C9F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 26 Jul 2025 18:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753554976; cv=none; b=UzHASbeJ2K79Hvy/sqbA1YkFF1ra+xQ8jKkzJiHmmOrbDxipmiDru2Dn92ypY8gChQvr6b/KYjtv+OcZapsVIJV2d3Qn2D9J4YKgl4CeLl3XF44oPpX9qJJP/hG65xtCwewyL+7S2FQh6oy8WbbWcbjVCmDEsvXYV3JHZ3RTnD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753554976; c=relaxed/simple;
	bh=eZme1SzjOeul0jhnShnKJQvP3nlnQk+EbC6sx7saJtQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T2T3ASTg1Y6dKWFM8QjEe96YdMMtCd2mJWpxHvplS9YnQgoBWp1VkFnaktDo0tce+AsuvnM/jAqPGPI8thoYjlGvpeIfDBQ9vTCuXL9NT//+ZxBONMcCfdtBMKlot3TNfTWt/WxNw+VqLGOe801aQjNrLSq8wjxU1nmp6bRvn2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SwBbuZsE; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SwBbuZsE"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CE2140C55
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 26 Jul 2025 18:36:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 65yT1fz6QQ7g for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Jul 2025 18:36:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6C02940A70
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C02940A70
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SwBbuZsE
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 6C02940A70
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 26 Jul 2025 18:36:14 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7490cb9a892so2078552b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 26 Jul 2025 11:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753554974; x=1754159774; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LVcdA331YjXfGGKaZvRHRPgJ6JXnIrSJxWaUWSwuxzw=;
        b=SwBbuZsETnQNG/xaCMRoT4DtDxVn7SJxvdU8gJ7LbiL6aY2/GqY6x2dXmVBz3ubXaw
         3g2sgbHU0WKDBsbDH7bVVS7A75bE2/7jCWmBBXcLNrB5PM9O771bcLqWzS/45mrs1VWc
         nVc+7OU4ZaI2mLojU5AERPfLEuOKbs0Yy8w0Zxh99sj/yesY37nCQosEQOIeYO65dNtm
         qdyn++61rOJM8lg57rgeDpe4tWWlaPHujGBs6E47poyfP4jwVqB2HdyiHSlhfgo066Cm
         uyFXWUUAoW41valuLbo9EtKO3DLNgZFh6pxT1ZmbabuiHDSBunbU3jClvCpedQWJ32bl
         uCJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753554974; x=1754159774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LVcdA331YjXfGGKaZvRHRPgJ6JXnIrSJxWaUWSwuxzw=;
        b=s4I9aJosyk4rrPiH68QZWzF8/95qqQ+TU3GbuA30wx7UdK6bYOpuzifA2WyKXn6QRZ
         GflLkeeqP4tXEPpkCIGIJguy/kpEflo37U/mS+US9nId2jWOaZQfvpUYTopQoMzUuEFc
         4qDdul6E48CAHncoetyUZuxu4rBOXLaWZz6yCOKBkmrrY+Y03SHcX/KCCm3xvqyJaiMh
         55428rombykinpZukrXeRNrjfODN3XVB+dkACUY+I2RXS/30giBQopBEwRoWv/6QLBkd
         RGvx5ap/Qq9S4jDOlEy6twTuRIqANUIW5GcF4uGVWajgMP0LJV0WjNuAGTVbw7n2IAW/
         gpyg==
X-Forwarded-Encrypted: i=1; AJvYcCUk+RAUFHMBXlbyUK80W7hHsJv0otmAiyrsmrN/AHSQZufjqt7J5kWRxPhEgaLKsSJUtr4/HWxeb9KbZNM1VGhKAUqXTw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzuewRTtj7v8+eXhO2wBvIcmnj8eikVvZrlCaNvOVlAto3IXf6c
	tcaHuZMD6erGty0VafenhiFDl1QWCIg6TZO077efas5Mppvxi0bWowIO
X-Gm-Gg: ASbGncsYa7FmAJTULInK0hpjIr+w8+LNuT7iO6SyErgvDUuQGfnmjf1TTYviNBQZxkI
	Znc023fs0hhKbLT4aqvKx7dFUHa7ToN7/14A4Dc9uhiJJc8nUvocbt+vPFmVvKD3ARIPElB6any
	tTkLY9dh6Pvk+bAqaTkbON9AshmPp/4ON8DWxYpjxlSYo6JyLZc7B4ZwuSj6IXrNlxoSBsWHEyK
	30457Vja7VoUFzo8AT3cdSB98Wj5dsoR75TlhoufR+lFtVwqY6wT4hvTCEIfsSrSlSS9+euLITM
	R2PzDe/utGyHcEBE1ym841wv61JQblLUJge3NqsEXkqoiji7FNuyjMRHF0jo765Y8yBqvwBnKR3
	CG9KhxBQV
X-Google-Smtp-Source: AGHT+IFLw4HLiiTXvPLS6068oeR3S2hY3q8vy8XQQ14JoOkIWZYR1pdBxcunS1rfz+fmVo9gikmjdA==
X-Received: by 2002:a05:6a00:2383:b0:74d:247f:fae4 with SMTP id d2e1a72fcca58-7633636aef3mr9798682b3a.4.1753554973660;
        Sat, 26 Jul 2025 11:36:13 -0700 (PDT)
Received: from fedora ([2804:14c:64:af90::1001])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7640881ee75sm2169295b3a.2.2025.07.26.11.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 11:36:13 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: aliceryhl@google.com,
	lossin@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v8 3/3] rust: revocable: Documents RevocableGuard invariants/safety and refine Deref safety
Date: Sat, 26 Jul 2025 15:35:03 -0300
Message-ID: <20250726183552.23098-4-marcelomoreira1905@gmail.com>
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

Refinements include:
- `RevocableGuard`'s invariants are updated to precisely state that
  `data_ref` is valid as long as the RCU read-side lock is held.
- The `RevocableGuard::new` constructor is made `unsafe`, explicitly
  requiring callers to guarantee the validity of the raw pointer and
  RCU read-side lock lifetime.
- The `SAFETY` comment in `Revocable::try_access` is refined for
  clarity, now explicitly stating how `Self`'s type invariants
  and the RCU read-side lock together ensure data validity for reads.
- The `Deref` implementation's `SAFETY` comment for `RevocableGuard`
  is refined.

Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
---
 rust/kernel/revocable.rs | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
index 6d8e9237dbdf..a2aa7989231a 100644
--- a/rust/kernel/revocable.rs
+++ b/rust/kernel/revocable.rs
@@ -106,9 +106,9 @@ pub fn new(data: impl PinInit<T>) -> impl PinInit<Self> {
     pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
         let guard = rcu::read_lock();
         if self.is_available.load(Ordering::Relaxed) {
-            // Since `self.is_available` is true, data is initialised and has to remain valid
-            // because the RCU read side lock prevents it from being dropped.
-            Some(RevocableGuard::new(self.data.get(), guard))
+            // SAFETY: `self.data` is valid for reads because of `Self`'s type invariants:
+            // `self.is_available` is true and the RCU read-side lock is held by `guard`.
+            Some(unsafe { RevocableGuard::new(self.data.get(), guard) })
         } else {
             None
         }
@@ -233,7 +233,7 @@ fn drop(self: Pin<&mut Self>) {
 ///
 /// # Invariants
 ///
-/// The RCU read-side lock is held while the guard is alive.
+/// - `data_ref` is a valid pointer for as long as the RCU read-side lock is held.
 pub struct RevocableGuard<'a, T> {
     // This can't use the `&'a T` type because references that appear in function arguments must
     // not become dangling during the execution of the function, which can happen if the
@@ -245,7 +245,13 @@ pub struct RevocableGuard<'a, T> {
 }
 
 impl<T> RevocableGuard<'_, T> {
-    fn new(data_ref: *const T, rcu_guard: rcu::Guard) -> Self {
+    /// Creates a new `RevocableGuard`.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that `data_ref` is a valid pointer to a `T` object,
+    /// and that it remains valid for as long as the returned `RevocableGuard` is alive.
+    unsafe fn new(data_ref: *const T, rcu_guard: rcu::Guard) -> Self {
         Self {
             data_ref,
             _rcu_guard: rcu_guard,
@@ -258,8 +264,8 @@ impl<T> Deref for RevocableGuard<'_, T> {
     type Target = T;
 
     fn deref(&self) -> &Self::Target {
-        // SAFETY: By the type invariants, we hold the rcu read-side lock, so the object is
-        // guaranteed to remain valid.
+        // SAFETY: `self.data_ref` is valid because of `Self`'s type invariants,
+        // and the active RCU read-side lock held via `_rcu_guard`, ensuring the data's accessibility.
         unsafe { &*self.data_ref }
     }
 }
-- 
2.50.1

