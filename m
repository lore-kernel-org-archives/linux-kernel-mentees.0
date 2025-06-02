Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3784A253935
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  2 Jun 2025 23:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748906939; cv=none; b=hwBF7lwWIMoHiDKAdbChygtEDOI/0sd6yDsAT0spcPtl+hLP0Kj9B9XbO50JzWlZB0MNlnAsbcHY6rGqHYjuOGFVaNFcrXWD0wlKFGpeXIFui/aOo6eEiJ8rzd29MNw3YlejPCN5OLlpsKCDVxDOr1qDJVmOjgxneBeeiWOoSPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748906939; c=relaxed/simple;
	bh=cUH/AggEuguei7YgUl376puy8XlQF0imPcYcuFixUO8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F9LdDrblJMhujrtaVYErxnIgFTi6Gq84K8xuze0Jowt0Y3Na2nnUyPZplBOBU+Arr9449TqrKzyhHaUoUITmYkMPxu9EJ1OskKgKf3Faoar0QKId+RC6gWBEK8riCPyQNTIzrDdbZj2SLwq8/N8Yi3nXeo8gfkE/tQ9QsscL3jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JSSn3QEi; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JSSn3QEi"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AED8E80EBC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  2 Jun 2025 23:28:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fxy3EtHz0gAD for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Jun 2025 23:28:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::92f; helo=mail-ua1-x92f.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0174480EBA
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0174480EBA
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JSSn3QEi
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com [IPv6:2607:f8b0:4864:20::92f])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0174480EBA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  2 Jun 2025 23:28:55 +0000 (UTC)
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-87e37ab3c70so2508777241.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 02 Jun 2025 16:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748906935; x=1749511735; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HpTW2A6QYa5jp5Fjr59g12q6ycrS0TTsu5uhRgEbA0U=;
        b=JSSn3QEicwHd5LPTyAiE2HgXlGajo750E2v/UjVg5maFrYXk6NB1NAf/bHqGRCZ9tU
         cp8Eo/HJe4+17Pvb0KiYg/RUkDE6/jPds3emaNVTknf0bD4yKkZUdsSuxbuwFWvVmzQF
         1ImTyuGdUdRQxmuOu2gArkVpJM0eIQP1iJbZEXapzVBJ5KaIHWMCYtBHtiN86eRdiR2V
         9XsOlaT5d2NWfjKxolO1FX0unfRNPZKdomXp0SLDpKDHiPH1xfVx+xgRrqLX5BOPp3jK
         yr6ICWJ3JD1pl7Llin4bij6KyJ1uyoGajvIeNLTQzKv53Pq8+H4Sf3AIhynfbelDibAt
         7fCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748906935; x=1749511735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HpTW2A6QYa5jp5Fjr59g12q6ycrS0TTsu5uhRgEbA0U=;
        b=U5UmiQt/dHMsyLHeyznR7Z6eyxMK+EqekloJ5PJ94I60Bhxt3tc3ScXBUpmADhHdk0
         at1WLipAdktqxPbAZF8G4iO4UBTlUrfXbe3vkdCmrTF3ub3Wd3bhwGiLpCzqYKR784mu
         beu6yjKC262RYs6pT2+3Uy+5e58q2rFJSaRB07pyYcRxVITbwqpTE1A2CvDFqy2avVye
         bsR0K6UzoMMlVaumsrhSXqWdUMYGYOizyFFPTTKPR5fkkB7LoRy57PqtPuh/RMxyZo24
         dfRrp6HmJ5LICCiO+KjD3XDwpE1GhwxrcCvUJQrSjIejyrGf9QoDZ+TBp3zWYopMrSwj
         hhDg==
X-Forwarded-Encrypted: i=1; AJvYcCWKzz+67ZHcBmVbFIkxc060As8RsWZCG3UaDmYoU9o2EZlSc/SHhxuGeZi/LO4p5SnJNn8tvroU+KbCPsSK6vnn4nJLtQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwX/VCkxWIVmaK8h0UsRgm/NnTxpxD1MI9bmXqoNEA/pMwpkEf/
	Rwy0F/+SV3HP69C2WOSAQ5d6AuoYwJ2CKBPVukxXqYL06dlTFSovmlDZ
X-Gm-Gg: ASbGncvVF3Ngj4SBEdombTuiqHhbrlm4PsHMPi1+mRl0tlvVbexLrpmZoCsRpmv7uiX
	2Ezp7Zz4vXgKaVobxXjJPkQP1L5kAmvuTCgkPiLdRJX66sEMXq88aemLKveMhBWWzWgcBeVpAN1
	NIqR0BxAAPv3HQxC3XL+OcVOtNQxMDnBdH/+QY/fIEBhB9Cy+LxroBatVSDG8w6dH8VOP+WP6n7
	HVsPIQjwkuqj5TtfQM5AAMKsYX/Yz8h5KRjPdnuOjmVblh428evH8fmbNKzkPdrLwtgLPUNeglm
	ov5+k3auENe+aWMJQ88ALypdrYjfEUW2TawpuFfw+50mEkl5QZ0=
X-Google-Smtp-Source: AGHT+IEt6eR98+k2gQETrOsrJM7L9HuU47B8V402rBSRz8MEaVtG/eiWx/hj9sNtGn0grnNQFvBRkA==
X-Received: by 2002:a05:6122:3389:b0:530:5cf0:8187 with SMTP id 71dfb90a1353d-530ba081aecmr527816e0c.0.1748906934694;
        Mon, 02 Jun 2025 16:28:54 -0700 (PDT)
Received: from fedora.. ([2804:14c:64:af90::1001])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87e2a39014csm6891262241.24.2025.06.02.16.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 16:28:54 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: lossin@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v4 3/3] rust: revocable: split revoke_internal into revoke and revoke_nosync
Date: Mon,  2 Jun 2025 20:26:24 -0300
Message-ID: <20250602232842.144304-4-marcelomoreira1905@gmail.com>
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

This commit refactors the revocation mechanism by removing the generic
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
Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
---
 rust/kernel/revocable.rs | 38 +++++++++++++++-----------------------
 1 file changed, 15 insertions(+), 23 deletions(-)

diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
index 43cc9bdc94f4..daf22e3a7d20 100644
--- a/rust/kernel/revocable.rs
+++ b/rust/kernel/revocable.rs
@@ -126,22 +126,6 @@ pub fn try_access_with_guard<'a>(&'a self, _guard: &'a rcu::Guard) -> Option<&'a
         }
     }
 
-    /// # Safety
-    ///
-    /// Callers must ensure that there are no more concurrent users of the revocable object.
-    unsafe fn revoke_internal<const SYNC: bool>(&self) {
-        if self.is_available.swap(false, Ordering::Relaxed) {
-            if SYNC {
-                // SAFETY: Just an FFI call, there are no further requirements.
-                unsafe { bindings::synchronize_rcu() };
-            }
-
-            // SAFETY: We know `self.data` is valid because only one CPU can succeed the
-            // `compare_exchange` above that takes `is_available` from `true` to `false`.
-            unsafe { drop_in_place(self.data.get()) };
-        }
-    }
-
     /// Revokes access to and drops the wrapped object.
     ///
     /// Access to the object is revoked immediately to new callers of [`Revocable::try_access`],
@@ -151,10 +135,12 @@ unsafe fn revoke_internal<const SYNC: bool>(&self) {
     ///
     /// Callers must ensure that there are no more concurrent users of the revocable object.
     pub unsafe fn revoke_nosync(&self) {
-        // SAFETY: By the safety requirement of this function, the caller ensures that nobody is
-        // accessing the data anymore and hence we don't have to wait for the grace period to
-        // finish.
-        unsafe { self.revoke_internal::<false>() }
+        if self.is_available.swap(false, Ordering::Relaxed) {
+            // SAFETY: `Self::data` is valid for writes because of `Self`'s type invariants,
+            // as `Self::is_available` is false due to the atomic swap, and by the safety
+            // requirements of this function, no thread is accessing `data` anymore.
+            unsafe { drop_in_place(self.data.get()) };
+        }
     }
 
     /// Revokes access to and drops the wrapped object.
@@ -165,9 +151,15 @@ pub unsafe fn revoke_nosync(&self) {
     /// [`Revocable::try_access`] beforehand and still haven't dropped the returned guard), this
     /// function waits for the concurrent access to complete before dropping the wrapped object.
     pub fn revoke(&self) {
-        // SAFETY: By passing `true` we ask `revoke_internal` to wait for the grace period to
-        // finish.
-        unsafe { self.revoke_internal::<true>() }
+        if self.is_available.swap(false, Ordering::Relaxed) {
+            // SAFETY: Just an FFI call, there are no further requirements.
+            unsafe { bindings::synchronize_rcu() };
+
+            // SAFETY: `Self::data` is valid for writes because of `Self`'s type invariants,
+            // as `Self::is_available` is false due to the atomic swap, and `synchronize_rcu`
+            // ensures all prior RCU read-side critical sections have completed.
+            unsafe { drop_in_place(self.data.get()) };
+        }
     }
 }
 
-- 
2.49.0

