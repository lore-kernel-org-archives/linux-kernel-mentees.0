Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB10126C1E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  8 Jul 2025 00:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751934888; cv=none; b=GQXtl/S44BxQTkRFN+T5u+nCEF11zLqzUSwgLpq2PAZX+/qeXfGVTJyK0U9mpoKdnE9pkXisIkKuNBIQ3m7D7CA/eXHsbQyM/aQvTLl/p1ccM0629TCu8zqAhfeuwuAeHWl9h0EcKPAHyScJpJVST2gSpTcgs59VGx+23REUfDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751934888; c=relaxed/simple;
	bh=aXhDrncXzkz9GHMnyXCn2fmSGiV/F9Lu6qT6QWS8w98=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uck/DsLFhlM3nSMn0xZnLFAPedc67v6V6aRFpHuGFgz0od9LYhk5tbAYI2EPIc25UkYlVmBt6Qnk5P5n5sKP9NwaI69nOpkfwQdz4MSOQ6GeGMusHtZ0ALaQZwwJWT1ftRRwKwCvdsMrGds2ArKVC8RFYXV3WpY/eaBA9I5BvzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Un9cofg8; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Un9cofg8"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86F1160FC7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  8 Jul 2025 00:34:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ZxQuxj9UdrR for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Jul 2025 00:34:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::f2d; helo=mail-qv1-xf2d.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A5A4C60E08
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5A4C60E08
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Un9cofg8
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A5A4C60E08
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  8 Jul 2025 00:34:45 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6fad4e6d949so22992176d6.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 07 Jul 2025 17:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751934884; x=1752539684; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qd6P2w9fPpKBQyi2ji3yJRm3qP/22EH3YT6dc+sW6rw=;
        b=Un9cofg8pCqoz7XHDaeU5Ly4rvCYU9T+uwjbXR5lX0/lVLq9ZboTb35uzO817IAPMe
         tZavtbkOBBPtjBPW2P1poA+jzMNcWLAFOs8KAlYlXEQV+2lPTLa81yeeSC4jXQpI5+te
         NiytKonou1DeT+82dWjhWiQryrFcSDYd8BT6wIA10B7oFH7eCCdT24h0pmiinXdlLumW
         HGWBWTwywv20eCtxVObhYkx0bx7jZz4zqdsm3WRo5PB/l8fWjvI8Xp8IEjx9fd2djHZ6
         y0piofk/6ZbRRtXboiUTcHdEofCMKr+zf4xX2qYx5nYGmrk+v5+Tz9TWc6qqhv9pUIv7
         PAIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751934884; x=1752539684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qd6P2w9fPpKBQyi2ji3yJRm3qP/22EH3YT6dc+sW6rw=;
        b=IgRppVAXtOwYxWzOt7xgu8/C3dFgJw5rIdzO2D4HTiyPHoE3o05OOO6Ztg7A/6BlP9
         C0Pc+kLkD8lee+zVvgwMdEQKtJipmKxwjpP6Yngr914MyE5tfH8Fjxntvsl+4YFioRU9
         u5mQx5fyJ+XCiPqGKbL2Sg/N5e1QzWQO1yUtjWxk+9faVutdQ6oK4XB3OSG+GYqFFrLZ
         AHAdRCgPJCmX5tQq+6285rOSlYcF90fb1a2VQ9AxMSK/ZwtjnxXe/gekMzrudpCSKlgz
         QXxyO+0rBflwKFuG3ZCFJaGP018h5ChmK6uT6fEcdGyE6HAtTHF0BLePr9A9DnbSZ1QH
         RAkQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6wnt8Bj2SDnJfpm1ZGUJAAbGIEQg0PTxhIx8YDjRvroGbnj2nD36GJa+J/IYTuXAMstgSiQJ1uMVpqzPDSbRDXdZ6Hg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzBD6HjrxkrLG3GpYH9hN2DIDFyhqpY8nHn1qF5kbnFIYXkomfx
	AbyF06JkTdLfanphysiltYQzk0jB2Zsu+taRLNs6QreOen1GGfLKBM12ZNr7hKCd
X-Gm-Gg: ASbGncsls2ZBNMvvpQEHoZR2TUry3c6FBcIx7/SY/5AX97BhZfjooPkUsbw/AY/Ytc8
	b8e4He3PScW+aSoLtgbKhYhGCNRVoPN8K1uGjnTdKmRNC4tF8glfcknwHDm35VonZx5/QqeWBOQ
	AdJlOaVVw+iwU4zeHa48O4g8Tj95D47/in/6orOTzMeqEjPpSFBQoZBwLaMTVULKWOl6+JTXTIF
	Uvg9+/OW4vstbipJkPx6PxHFlNlJeBqOKGisWqGqeDiG0TD82bJR7r1t8TrX1P787/c41YJWhDL
	WXDV44++d5JaXPvqKZwQ9fM03xh184DOMdevB0MzdWgCFobEfMuQnmdyuC8=
X-Google-Smtp-Source: AGHT+IF1O0rpHx+j0LQN8YnOqKI77l+ZdzGqFr9r93O8DHqnNwpxFns/PzK2RM9QLI9ozKgIFI6Ymw==
X-Received: by 2002:a05:6214:5d90:b0:6fb:107:f618 with SMTP id 6a1803df08f44-702c8ce6e7emr168278526d6.40.1751934884312;
        Mon, 07 Jul 2025 17:34:44 -0700 (PDT)
Received: from fedora ([2804:14c:64:af90::1000])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4cc751esm68746076d6.23.2025.07.07.17.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 17:34:43 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: aliceryhl@google.com,
	lossin@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v6 1/3] rust: revocable: Clarify write invariant and update safety comments
Date: Mon,  7 Jul 2025 21:33:37 -0300
Message-ID: <20250708003428.76783-2-marcelomoreira1905@gmail.com>
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
2.50.0

