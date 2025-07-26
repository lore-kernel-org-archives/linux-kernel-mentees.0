Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F03289342
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 26 Jul 2025 18:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753554972; cv=none; b=JLncOlmSnFGx2qv4v1EVqaOj+SOfPFRGQ9CIZMLnSeCsLuI6Ni7/DpOrFyNY5vqwy+jTVMKbo9+Fowzl+MF78QAK1vl/iOLDfo0Pg2nOvjA3/OhYe2k6tL4869eVG+V/zDPv4PdDBYwEQtixMEzU6bHE+OlHNX9MzRhfUkYg9aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753554972; c=relaxed/simple;
	bh=n7tGnkipya6k3NliLrJGG2/eg7BTBQDUoO66XHRLm08=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n4aV2cru/ZMeZaPT37TKKBiSVwseFMlksGIO7Sbs5ayBkdopmR7p1cdjHgtb8ekmTr7UxpTOApZ+SWTCFQcuh+MAQGH2d+OfsnS4ZziSNAhrcjI3z8WNMePUgM30LsAwzxmWeTI1+T5VHIgeqbTaPlt0d6TqgW4tLAHBm8aSQsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ilh9TKcX; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ilh9TKcX"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E82D983673
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 26 Jul 2025 18:36:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lHkPyntT6x6N for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Jul 2025 18:36:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 01879835FB
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01879835FB
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ilh9TKcX
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 01879835FB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 26 Jul 2025 18:36:08 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7494999de5cso2247252b3a.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 26 Jul 2025 11:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753554968; x=1754159768; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S76G8dgyFVKhTbuEhC/Ci71tjKyRi6JcAwTXIvAHdN8=;
        b=Ilh9TKcXmAZdHzIad+VswB7/7VEovjjROQUcSQgnl+V2YnwVbGe9NocD2DnG/rO8h8
         yUtavjzU9++gBrwmf27/xyMBTxBkR9fkvSCdZaytVOD8KvOAtRqmJE9n9l6sJSIM01de
         Iog+IgxrM0oPSGF2DXqZZkPgKc4pTRXwvq3IoNJUpyC75x4QIuyni0+nNcBzvz8qsRlI
         NwONKyaAUoalAQwjgGgKSXVXk+9ay76Y6t9tzBL5f9rmQrbELSipWZtifmtcv7YHSCfl
         eAVKqqEHUl8iPtQbZMR4kVxpXcO865EyJgodNnnqOEQXtJStHviZ0s60nr39HjMCc+rf
         DULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753554968; x=1754159768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S76G8dgyFVKhTbuEhC/Ci71tjKyRi6JcAwTXIvAHdN8=;
        b=vtJPYIiry34xHsDTo+eQwb9XZDCJZDi3bwJCagOTYZzAA91I13rxhgogrFD23B1mh2
         aw02i3psU2FaZA5Qt5rldhrZmHQncYl1ZLV2ETJWrzMRJLtSKkVe84T2AB7+wfXRrxF7
         Wx5SzbNGQLlmNfNlaRpIGIwjlrpUgLwYjwP3NTPKhrYcVK1RCnt+6mUbWb07Xa4n5w5P
         wZxcJbRWssgmJk2fJoq1oKCeK2nn6gAt44xGF/HzaK/DYWOwUMp9VQzBQ3da3jL6rBhm
         MR9u/FfxD0pvWSQYh+VMgQvCBJkRjKnGXmwLrOEbiGMWD7vZlWjLpviS+HKdjwIU5mXj
         z4vA==
X-Forwarded-Encrypted: i=1; AJvYcCWxi3VKB0BuFCSJqBTysbRXecBKXDAi8/ruv1e+z/bPl5TyOzzJuFfhlUoNuRdRuaR/XWDMq3q1mGnCNamuaayb/qhqPw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzfwsxdRRA9LGjXoBgQ+kSLB7X2qH1A4sPqy35W5NBX4eHPeSAY
	5UhUffzqYwJ833DzV2vGbGiB14dfcz4fBON/J/iwtrgkZafro7NsTVoA
X-Gm-Gg: ASbGncskncJ5Iv84yYKIMBI9eFtCWZczMEgAL94CjXYvo/7lAgzKDweHjrLFsrlslJ1
	UGJt2QeGbbQROR1NThbG1CWmkORrHbfrs+uDZsRFF4vSlWe2fHTMSsMu4RKpVj6qVBupt7Nihh9
	isayLfuTD/kF7rz2IRbb9CEbArOEG3kfFBCbv1kVBeFLRKWA2cBTdB4Nm4CNKoD6ljD1H4d0HVQ
	avsvABmz8VPHD/HXygTuPIDq1zQkvvs9SzKi7fxubV+YYK5Dm2x6FSPHrnXYZjM8ZszzPdYpHx8
	xMu+MedyE7Vv9ncR9TAwg5IOK9hjloJEnDCPh9eAIcThCySqba1x9jh4oCLzpAhBbiruUbMoiTb
	sIW+aQi9k
X-Google-Smtp-Source: AGHT+IEdnZhaD742thOMOTP2dul/XREH0xH+vZS1mJTRSN+edUVelaNKGOxLyPGgS40yoANrgzqVzg==
X-Received: by 2002:a05:6a20:2d2a:b0:23d:7b87:2c88 with SMTP id adf61e73a8af0-23d7b872d3emr5663097637.9.1753554968252;
        Sat, 26 Jul 2025 11:36:08 -0700 (PDT)
Received: from fedora ([2804:14c:64:af90::1001])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7640881ee75sm2169295b3a.2.2025.07.26.11.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 11:36:07 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: aliceryhl@google.com,
	lossin@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v8 1/3] rust: revocable: Clarify write invariant and update safety comments
Date: Sat, 26 Jul 2025 15:35:01 -0300
Message-ID: <20250726183552.23098-2-marcelomoreira1905@gmail.com>
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

Clarifies the write invariant of the `Revocabl` type and
updates associated `SAFETY` comments. The write invariant now precisely
states that `data` is valid for writes after `is_available` transitions
from true to false, provided no thread holding an RCU read-side lock
(acquired before the change) still has access to `data`.

The `SAFETY` comment in `try_access_with_guard` is updated to reflect
this invariant, and the `PinnedDrop` `drop` implementation's `SAFETY`
comment is refined to clearly state the guarantees provided by the `&mut Self`
context regarding exclusive access and `data`'s validity for dropping.

Reported-by: Benno Lossin <lossin@kernel.org>
Closes: https://github.com/Rust-for-Linux/linux/issues/1160
Suggested-by: Benno Lossin <lossin@kernel.org>
Suggested-by: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Reviewed-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
---
 rust/kernel/revocable.rs | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
index 1cd4511f0260..2dfee25240a0 100644
--- a/rust/kernel/revocable.rs
+++ b/rust/kernel/revocable.rs
@@ -61,6 +61,15 @@
 /// v.revoke();
 /// assert_eq!(add_two(&v), None);
 /// ```
+///
+/// # Invariants
+///
+/// - `data` is valid for reads in two cases:
+///   - while `is_available` is true, or
+///   - while the RCU read-side lock is taken and it was acquired while `is_available` was `true`.
+/// - `data` is valid for writes when `is_available` was atomically changed from `true` to `false`
+///   and no thread that has access to `data` is holding an RCU read-side lock that was acquired
+///   prior to the change in `is_available`.
 #[pin_data(PinnedDrop)]
 pub struct Revocable<T> {
     is_available: AtomicBool,
@@ -115,8 +124,8 @@ pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
     /// object.
     pub fn try_access_with_guard<'a>(&'a self, _guard: &'a rcu::Guard) -> Option<&'a T> {
         if self.is_available.load(Ordering::Relaxed) {
-            // SAFETY: Since `self.is_available` is true, data is initialised and has to remain
-            // valid because the RCU read side lock prevents it from being dropped.
+            // SAFETY: `self.data` is valid for reads because of `Self`'s type invariants,
+            // as `self.is_available` is true and `_guard` holds the RCU read-side lock.
             Some(unsafe { &*self.data.get() })
         } else {
             None
@@ -214,9 +223,10 @@ fn drop(self: Pin<&mut Self>) {
         // SAFETY: We are not moving out of `p`, only dropping in place
         let p = unsafe { self.get_unchecked_mut() };
         if *p.is_available.get_mut() {
-            // SAFETY: We know `self.data` is valid because no other CPU has changed
-            // `is_available` to `false` yet, and no other CPU can do it anymore because this CPU
-            // holds the only reference (mutable) to `self` now.
+            // SAFETY:
+            // - `self.data` is valid for writes because of `Self`'s type invariants:
+            //   `&mut Self` guarantees exclusive access, so no other thread can concurrently access `data`.
+            // - this function is a drop function, thus this code is at most executed once.
             unsafe { drop_in_place(p.data.get()) };
         }
     }
-- 
2.50.1

