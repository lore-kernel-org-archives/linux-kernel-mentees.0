Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5495A1552E0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 21 Jul 2025 01:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753059798; cv=none; b=uVZB05NVIAG2Ny70FBV8KUJcatF1ziHEgb1halVpaP35EshibVSi/ft2/YyEkXV2+2Xz2ZUFORC+vWb7Fz+PuHhkBg1sWv6n56eh0TNWfTT/1g8UWOyiTvCbk4mmlB1v9zuXVWy8wb5TSSVMjy1A4C1sgFpZI0P4RbT3ztrhgc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753059798; c=relaxed/simple;
	bh=n7tGnkipya6k3NliLrJGG2/eg7BTBQDUoO66XHRLm08=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kui37AZ7lA+9rwIjZtryE3oGhOfNfmfVkezouSaR4gnruevNZhjZuaS3oVx9/XWs1kqIdxbe/0HMbIGeJVbOqPU6kf46yNRAevcrK1ZsOk8lNB7RpToW+bUmmIkQcONtt9pRqX5iyrTESWd5CHHvNxF2LPLaOMw4RROPWJ4QLqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d4bHMYoh; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d4bHMYoh"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0185D40ADA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 21 Jul 2025 01:03:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aXIUNmGGy72b for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Jul 2025 01:03:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::c29; helo=mail-oo1-xc29.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 327E640052
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 327E640052
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=d4bHMYoh
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 327E640052
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 21 Jul 2025 01:03:15 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-6120049f09fso2121326eaf.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 20 Jul 2025 18:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753059794; x=1753664594; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S76G8dgyFVKhTbuEhC/Ci71tjKyRi6JcAwTXIvAHdN8=;
        b=d4bHMYoh+SyWxmWO0RG5rr6AJHPbwykRzCN0GTZDaKDvP7Kk303TMtiwo1qqHFH+Y1
         kfugbjqDOCaDiee0Rh6hNatUkzMdv/9+wUDDexbSRZhbqfWPW5kxhqLulfq8uD9kaehO
         Zi0TtpdcgWEGGXRhhNs7+JNgAU/Ir0ftkV0BbRJoIG9u0Yoe4m5Gqmw4an96mSLObJjS
         Q/Bw66IWho7i34ujUADhdjZV/y25Ch0ii1bj1eyIy10lwZ3YjBLMaJq1XLm2gsacPSFI
         rycZfJRlDmi/Z5/KSNPuBCmDqmqPXTOz3KvxFf8OtIPLU0ewJbXAdt6R4Mk8mjBS3wNz
         /zwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753059794; x=1753664594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S76G8dgyFVKhTbuEhC/Ci71tjKyRi6JcAwTXIvAHdN8=;
        b=n2no6UiPPGoP3kY+a642Bhy01l6qgjccoLIAUtYJgHUBVU/8S42hQKuPp8unP1t6qX
         yxVXmT+eGiOb3Y3fMCzwh+4veqJ59i4KVQJuvFlTE0LrsvXjCNxy8LBXg+iOJEmT7oj8
         X3bBY19Po84Sevhkug89XRR3W/9Spie+L/NKNKwuyr+B9WIWPdY77rNZ6r+BOUZpIA54
         JIrOg7N+Q4Otlk26S/Ti4EBCi/Mfbx0yIGQkOjUcUTGfcP83A/q6reKCsYRfiEN32FSG
         dywJrStQumDUVruB+iF4V78t/M7oslFo9GpuHSo8QESNQvALuu7+0x/GDhWaPXk2yD70
         DbLg==
X-Forwarded-Encrypted: i=1; AJvYcCXFcyj5bYgLzEiAU3GsafRBV9Hz8I4gJbi/BX49cSEO1hr001tas6cEi8HxIhNps1+zLqTYmpgIQFgyKo5nB2h+k61bVg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxWwEOyBfJ8PpEyYZcPoFwKVbHtD7YfRWJP0XJUoY9LNT/tEt8I
	cKMn3q78+UQIxS4tT+5foOLL9BSQLdx2lgevDB7HCEjHsaMnY0gBiQZw
X-Gm-Gg: ASbGncs67OHEA0IKHf3fvC5k864hVX9/HygXdwLTLclWuzFRoosB8FUGqsvnm/K4QRM
	i1VHQtIvlR9QbzATeKkj3SDcMN+0Xv3MffQSFEYScfHHwY94Ffu7wRWnpaVxgpNsJBTltCXGjBy
	nIOIvgkb4agG/gXebs9mo+ShAn6qSrxzWaKQ3hAkP7t+B0dAEBnMnKhX0gwpbmnIlhcBXHd375I
	7qF3F8eE4wHuI4vp+bSwZaFBE6L061XEBsQhEwk0oq0NQM3DMC6T2+Vr/MuyKXorLGoxuZfL961
	8ujOgIxiIuwZlfpNrbr7qYzg8dH+ger3as8oXA/eYPDov4POjG4qa+gbvKhwR7V1xPyKWLC/eGp
	miGqyeIl9
X-Google-Smtp-Source: AGHT+IF7M+MA5HwwJG0gBrxSdc03hhzBgY4QsAlmnLc3zt46guiPqEd8bmGZiyfAqPmQraDWWKdp9g==
X-Received: by 2002:a05:6820:201a:b0:615:c2af:de7 with SMTP id 006d021491bc7-615c2af11b9mr6510991eaf.4.1753059793976;
        Sun, 20 Jul 2025 18:03:13 -0700 (PDT)
Received: from fedora ([2804:14c:64:af90::1000])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-615bcc8c2dbsm1436959eaf.20.2025.07.20.18.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 18:03:13 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: aliceryhl@google.com,
	lossin@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v7 1/3] rust: revocable: Clarify write invariant and update safety comments
Date: Sun, 20 Jul 2025 22:01:53 -0300
Message-ID: <20250721010258.70567-2-marcelomoreira1905@gmail.com>
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

