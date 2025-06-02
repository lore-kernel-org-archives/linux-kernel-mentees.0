Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1041F5435
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  2 Jun 2025 23:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748906935; cv=none; b=VOxnUr2kUmt/lg781TFdIeCwRXYfCzfeYPp4VSW7nu8v4+tOlunT/jZ+Xouf6hp/MT5Kc8JKlM0whBa2vxidOehRcath64zznrOvxJF8+GMb6UEeHviUhQEdvUmVgERZiDqXWCBv1S/A2MingqduaTD8npI1dRH6cVVt0e2fOQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748906935; c=relaxed/simple;
	bh=zKUbplKeRnCJvLOKyAOsoB0IHwghWb9gG0zIcb25BGc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=baQ484G8ZSUEvBH5aoMY8JheOSxK63u+vYnz2/u1CHFsstH/9UXDUGg7kOgvVQLfhpw+ipcpWtaExHhbQ+ZifNKm1Im5+bU1Co53317Q0b9evcbH69lnruj0bcFq6NMuuXpIgcKtuGSvKP2xO/nSw0TM1f+aHi+TMD6CTrb+K5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ewXoKkJP; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ewXoKkJP"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B42780EBC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  2 Jun 2025 23:28:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UNkykD_0E_Nr for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Jun 2025 23:28:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::92c; helo=mail-ua1-x92c.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 82B4380EBA
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82B4380EBA
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ewXoKkJP
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 82B4380EBA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  2 Jun 2025 23:28:53 +0000 (UTC)
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-87df4fd380bso847943241.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 02 Jun 2025 16:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748906932; x=1749511732; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8VXK8wZ6Oa5fM3Lot1qqbDFw7vuhDTeQNUDrQ3pNTxQ=;
        b=ewXoKkJPAsgpq/KFahjO2PSmNzkkF6ftYmoU8IFPZP5njYNnwksGQ95VLz3YKsM/9D
         dhjxB5HfyvGnWNPQzc10+exOjApkaSRrBSQYZD7IdQvFYMJGnBm6vNhucRK/0k8fanYQ
         l6IAmWiEy2Pg9mDs0O+LXD3ClxkMTopypsqyh676I+aWndNNOMfp2fY8xox/nw5aN/DW
         0DGNtNV0Rj00kbMOQO9XWKnvLZkDnQFvgPhCwFiQvYJ5gSuwizWGDlGmiab1MaQ70izh
         FsqNvo8PdpvlkyiD8xh/SaCUOYvmpOCPk0waRAFeqagL5sk58YPhnHQc98fOhMyGiVZB
         e0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748906932; x=1749511732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8VXK8wZ6Oa5fM3Lot1qqbDFw7vuhDTeQNUDrQ3pNTxQ=;
        b=GKAnUdfedFAmhP6zotMRQ1qaeZHkwb2W/GxjdBVNcY5JnGYzrg5tIWQW0kqqxxBYjd
         NaWdpcbljfKUwI3cct0mlffj6IwcdzPZCXxymuFEe8nQQpugGzTproY/YGM3onEJQlI9
         dRKVlWhkgs/pC9jVweQ52RJ8bi7PMlGYTs4by7WqsepnMz4hWciNleV2nQHvG11ntuBx
         uuZMbZiAmn232Q87Yhk4a9GvX8r+c4KITQiIsyDY2lJy3sfJlmV7fPIP7ez2N1tsGzkZ
         CV0Neb+juD/+uV3r/0AXuqVkgNWjLaPMb3xen2i8hNUJZ9UbG90NPODD1VYitskeb4NH
         GKOA==
X-Forwarded-Encrypted: i=1; AJvYcCXXGWqv1WYHYQxBMmsDs+VzogfQUPmHqiMuDLe4RExwQWSCtO6X1rpOz2coBPUE3wGEZgnudZKMBUHhRA/Ls5u4lMWxGg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwVj35oX8TCE59Ti1ElrxsUmBD2WGinNJt1R4SYD0tuwk/allZM
	+U+hiRm5YfDedorBqtCjsAAKi1zCexxwWAyD1/jrm/l0tdWCp/x0YbuV
X-Gm-Gg: ASbGncuQUPumQnEF8wDCIOXxONot0k+wfpQJvQmN+/Uf4/2xT1j6m/0UvNyXueUJH1i
	TFl5vpCwMI9jiafBEs/tTttnHA2Iai39hpwYmhUanr3ZcsBkwzH5HPXsZhtZO39PJEGBOdmGXjh
	g9ZbDw858EIetJwVBI/bzFpBJdjy7YuJasbbzMpTkCDgd/S3w9EZX5w6LGAsK4ho+thBQXVcd/9
	Uk6Octu1jMLxyk80Fv63SezaRb+NJQk/l8jrossWtrBZyxX7eKfIBJYSI+gnZtboTgaFORvgFki
	WhHnkBe3UzIYPRjBs/o5zvGmOlLZgD5/4vuJjSW6
X-Google-Smtp-Source: AGHT+IEsjDcgou43Z7W+OGELytTSngNXlueMC8Nvfm3jxxkpsIk4e7KD1MlQ7Wy/v2dX3JJSceYbPw==
X-Received: by 2002:a05:6102:41ab:b0:4e6:1a8c:13dd with SMTP id ada2fe7eead31-4e701bcd515mr7030749137.7.1748906932191;
        Mon, 02 Jun 2025 16:28:52 -0700 (PDT)
Received: from fedora.. ([2804:14c:64:af90::1001])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87e2a39014csm6891262241.24.2025.06.02.16.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 16:28:51 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: lossin@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v4 2/3] rust: revocable: simplify RevocableGuard for internal safety
Date: Mon,  2 Jun 2025 20:26:23 -0300
Message-ID: <20250602232842.144304-3-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602232842.144304-1-marcelomoreira1905@gmail.com>
References: <20250602232842.144304-1-marcelomoreira1905@gmail.com>
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

