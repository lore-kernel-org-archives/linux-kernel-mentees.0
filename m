Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CA8253950
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  2 Jun 2025 23:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748906933; cv=none; b=KUbg9fkU8/DSZMDdc8AuaTUBlHmy8b/9SeChqzUhk1eyPOqOJJ/xK8DhparHDZIqzWxBJHnyIa53FU9IGPMrTbhnd1SQGcfPefRHhjv+cdt/YgSLESV6Ymd3gz/x0E2XM/2YXnWtPSZW4BIkaJVfEpQHJhNr1by0FVQ5QxkuuMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748906933; c=relaxed/simple;
	bh=8YiH47mBvhM8T4eHsYNmGvtYodf/ij/ko3pn8BGv74A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DqKmVXl+oT5CfVDNMZPc99rAzszrTYatEdZ41AwHMq12sBK1cpVzrxsv5VQLUGqptTrjUya7AxNqTZG/mS1jO51+DhQ5RlRv93ayz+fr8fFSZ4T3mHGaqjpDxipfWCWE9JzY4cVtWIKhErGS7P9RkoGTt7fYku0ZyI2KTUwTo+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FVC81KJv; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FVC81KJv"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8F7340FFA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  2 Jun 2025 23:28:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DaoiUJMqWYlv for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Jun 2025 23:28:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::935; helo=mail-ua1-x935.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DA3D140ECC
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA3D140ECC
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FVC81KJv
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com [IPv6:2607:f8b0:4864:20::935])
	by smtp2.osuosl.org (Postfix) with ESMTPS id DA3D140ECC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  2 Jun 2025 23:28:50 +0000 (UTC)
Received: by mail-ua1-x935.google.com with SMTP id a1e0cc1a2514c-87df839c6d3so1163210241.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 02 Jun 2025 16:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748906929; x=1749511729; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uAI6wAKJyNcvB0GBjNCKRrM/BiS1UgH7rkbsuv1BwJs=;
        b=FVC81KJvbYoCY5z/tzVUlEF+t9BauHyFK9uSo+9yVz7S/1D1IzMrOmvS9JKj436Odm
         QNKguMf+HJtl6w7hC/G9kOf1PYrf5Bp/K2JqjaalFjtgNWpLR+iXjfL/nIM/0qTW43+x
         kzl+z2bTbr+Cb7u/JrvTfdZhFRFvVsgXMDO80LJpSXejnD+/pVi8HjzoDTqHcX1ViL3r
         +DWmj5jrkZ2ewueh31v/RDfLTY1YLljX0jOkoEqEQn3/WvT8gUN4BiDr8/sCo4OwFGV+
         exSzBSUuWc8zcsjNcFAErXy4bfEk94Re5IiYtx54eZLoTu092vQYnnr3x54VQIPkZKhH
         lZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748906929; x=1749511729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uAI6wAKJyNcvB0GBjNCKRrM/BiS1UgH7rkbsuv1BwJs=;
        b=GhAfXfhshONSyG6V+zYFHHXllrBSCNX4tY8syvni6w+qoxnvHBgo6F0hfAMtz2CGRC
         bP3UVT6oddonFI50XguXPFV7pSPkYEOMzmV0oYr9eoDjH9XgtQ0/EMPNl1qVxr0aziiK
         0YLaGYvXQ74cRxE9hTvTBGSVuqQ12Grem1OUtzpWx6UNztjpFIDnzL0fM9wWiKmgDVYK
         IOv91NHdVDcVTSJm4QgNn94x0kmFxHuVxNKMz9pZob25BWLy9BJzZdkkI+YCi4NA9u2X
         Irffp0CQfuTHLmaC0CgkLEVBG5Lx7Y8HczEdaob7ugWkWekI2E/KUTKkVZmFMYQxbAu+
         6PeQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6l1w9nJa/xdNNqbNIP6eEwvwH3Lk1wVusmQvQAh7ct0DZzqCTt0Tx2KYdcyqiiXDadLsayPmyEN5MRBmpeuiPdRSgqg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwKf/wiDnvdjil+BD4RUG2inYGdpkzbf9MKmXpdlIfZdumYkk46
	Z1wWCMfKnopb6mKuNiIwl7h1TP2WBGniKOQUGds+Wt7MouSlJsWGmUy8
X-Gm-Gg: ASbGncsvLreuffAwgj7ZaqW0xeawBRxza8i38cX2+JYz0YNAoF066JoeJO5VGr2L47i
	GgHd7xPEunCB55LUgU2X7tIpm963V5iVj8Zgy9BpPlTrU641udE1y7XA0o8RRSn9t6fFL5oIqQW
	kxcddSTA/AMSddoB2ffZrwtrsC7ykss+/mt6fEYhGHKRKGS3ArnyS3hj/iqnyjuLKlU7JDzUURY
	/OQSu98EZKNJvwRJ+hYgfZ9lIlts7ELMkbv2+AloZf03+PlDbmQpXxMD4+n4NHb2kwSEJTepqWt
	Tijsny4oWQFcJS/rvbOzmbcjWAvZ/Jr9zIwCqrrG
X-Google-Smtp-Source: AGHT+IEWwJ2WbYGAyqBj4AaTJGg/EJNmB0wKssJ+QWVd0Pry4sfKxxAyeKHGrTphg2UdPkQ3n9JRAA==
X-Received: by 2002:a05:6102:2925:b0:4e5:9ede:c834 with SMTP id ada2fe7eead31-4e6e41dc78bmr13116739137.25.1748906929591;
        Mon, 02 Jun 2025 16:28:49 -0700 (PDT)
Received: from fedora.. ([2804:14c:64:af90::1001])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87e2a39014csm6891262241.24.2025.06.02.16.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 16:28:49 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: lossin@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v4 1/3] rust: revocable: update write invariant and fix safety comments
Date: Mon,  2 Jun 2025 20:26:22 -0300
Message-ID: <20250602232842.144304-2-marcelomoreira1905@gmail.com>
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

This commit clarifies the write invariant of the `Revocable` type and
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
Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
---
 rust/kernel/revocable.rs | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
index 1e5a9d25c21b..d14f9052f1ac 100644
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
+///   and no thread that has access to `data` is holding an RCU read-side lock that was acquired prior to
+///   the change in `is_available`.
 #[pin_data(PinnedDrop)]
 pub struct Revocable<T> {
     is_available: AtomicBool,
@@ -115,8 +124,8 @@ pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
     /// object.
     pub fn try_access_with_guard<'a>(&'a self, _guard: &'a rcu::Guard) -> Option<&'a T> {
         if self.is_available.load(Ordering::Relaxed) {
-            // SAFETY: Since `self.is_available` is true, data is initialised and has to remain
-            // valid because the RCU read side lock prevents it from being dropped.
+            // SAFETY: `Self::data` is valid for reads because of `Self`'s type invariants,
+            // as `Self::is_available` is true and `_guard` holds the RCU read-side lock
             Some(unsafe { &*self.data.get() })
         } else {
             None
@@ -176,9 +185,10 @@ fn drop(self: Pin<&mut Self>) {
         // SAFETY: We are not moving out of `p`, only dropping in place
         let p = unsafe { self.get_unchecked_mut() };
         if *p.is_available.get_mut() {
-            // SAFETY: We know `self.data` is valid because no other CPU has changed
-            // `is_available` to `false` yet, and no other CPU can do it anymore because this CPU
-            // holds the only reference (mutable) to `self` now.
+            // SAFETY: `Self::data` is valid for writes because of `Self`'s type invariants,
+            // and because this `PinnedDrop` context (having `&mut Self`) guarantees exclusive access,
+            // ensuring no other thread can concurrently access or revoke `data`.
+            // This ensures `data` is valid for `drop_in_place`.
             unsafe { drop_in_place(p.data.get()) };
         }
     }
-- 
2.49.0

