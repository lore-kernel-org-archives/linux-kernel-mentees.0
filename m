Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8106D2AE77
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 May 2025 02:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748224894; cv=none; b=BCg6u+ThQSXiidm4fhPikTXQ1Z1vYSdNcxMQ9m3aPqP95e/ii6O18CYfBdtO/SZ7fXpZ+7bQn6bmHzh6nZi7oszWPuTveh4IB9u4TQTLi9M1cmVwSzOs4bKf08CdEKp04Mq6nViC0b4GCjNNp3xq2dYri+nI1qGDcuFHj9kmrn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748224894; c=relaxed/simple;
	bh=a2nuGC0rCuZOzA0MZt1pK4Z3n1GP/kvD9YGK9n5cfuc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=SgjhwRSJU9BZ+0pytfPcP1aR15r2tcgJnYjvtiC5bbYmCx8LBkkD31xUQUf97zwxkUkUaDH8zHwisBKqzFDcV/UJdG6tjKBlLdNXZVUYf+fqOKS9Z+oIIow4Wg/CLD2uIiO52ru2NPdP24O9rFNNTBBEALnT9pSKhXL48a5VKQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MP079Ruw; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MP079Ruw"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDF564043E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 May 2025 02:01:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sr-Zpz5YsJ5h for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 May 2025 02:01:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::a33; helo=mail-vk1-xa33.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E1552403C7
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1552403C7
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MP079Ruw
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com [IPv6:2607:f8b0:4864:20::a33])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E1552403C7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 May 2025 02:01:31 +0000 (UTC)
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-52f404ddf3eso267176e0c.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 25 May 2025 19:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748224890; x=1748829690; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=W2idn+Je11xe0LAzHjMSYfTJffcLHWxrXV/l94n57A8=;
        b=MP079Ruwv4J3NQ89cSTe0TYrySWhmq8pFSbmdb4BoRD1FIKW/DpYgLy3FuNGD4jDmN
         T7sQ5AIZhn/AGK7s9CRrEhX2SvBnJ/eNMx91aJ7gvfumC0K00iMk9dshfZ8VA1+1+URZ
         r3WIpU/LDmTB6aWgdp+4ANVZQjGa5U7upVNHNdPPXHaLyCQYKIObYgosJ83y7n1LwevQ
         L8dKfb//pkoEvcJghQXwNVM7fzqZ8GrsAn2yvxkV05RlThAbhmY/UQiNF25uu0XKJntL
         ayFlywBqvV37VYwJvGHnto4DO24wn2+4ZQez1BVzpEp3aOjM3k8wOaIkKqIq8HgYl1dJ
         lUXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748224890; x=1748829690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W2idn+Je11xe0LAzHjMSYfTJffcLHWxrXV/l94n57A8=;
        b=ohk4UTlGFtmonPL0pN47d4TCPIlFCA3M+GBLR7DLWqlk7m8GC3MYXt3ij4DH8qr658
         rgRW8zgNXOkrPgodPEBpHMGgXtZPpVaNF9jajNPmmJka16ysR8O5qLrZEUKCg9jufNud
         NmI6GLYXfaoxeuTbP1lV/IYV4JUi/S1+kGa220UV2VLOpf+q4lFOQRH32B8f+fx3B4s/
         kRBYKOPw1kR0tbDD5yUHULgPp+Pu0nxrt2bTsAkg4+mK8YKVYusZmdTnNrzjJJFjlQ6D
         wytrjJiTVB7q/n/IoZBQO2MalnzBYrTTjzl6gNwlbIw+aJG0O1rCs9lxoB3iXrEpqYa5
         WFkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjvh6M6lul6BD+5y4+are+JAdBRQh4aQPPNF8y+zYiRJXkNKRUwNpYqWrMNAf2GoABX+riURRQXuG/+5lbzjZnqw+PVQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwB8HH8u6Ns8i+KwZuU/ha9arrQ6Zt1tyuSLWG1bdJXGw9zGBbM
	5qnSty+xH8OlReAE/jjSxK1/Y/WhxcFUxCbF46a+lPULLe0SE6ZL2mVT
X-Gm-Gg: ASbGncuoSSjfvnd0vcogOBE12eBPcxPThHB9CqrxE94Zu4V/bGcZLufIFu0qtUGz3NR
	B6DxgYNracEtH6HQNdllr2+1hrtFz5JvXIkN9trU6gh0yTqduigKFHHOPz95R1RjwrsTXcdiYry
	rHGXvX+Vsy0hzWG7PUsohOz3M0Zpo7w+RhN6/NT9kpq8/Yg9gBF+qYvJwKuDcrp6MzAB+rundVu
	iuyjo1nLNQLpC9wyErd3q9gcQwJqWnx99jxnGtuZaHmxAs6p/dKJJIDxvQlivb8/oBW185Wz/lD
	oMvc2nreMxgqBRbEvRhQnT7j5tsau1Y6g6YdxKyN
X-Google-Smtp-Source: AGHT+IFg5mnXaQM1st8Ie193wgHG+/Bvq/zbelNHV+I0KxxjJ4sgXrzyHYoDd9iKl+C2UPERS0uJrw==
X-Received: by 2002:a05:6122:1d48:b0:520:4996:7cf2 with SMTP id 71dfb90a1353d-52f2c5c84cfmr5638910e0c.10.1748224890357;
        Sun, 25 May 2025 19:01:30 -0700 (PDT)
Received: from fedora.. ([2804:14c:64:af90::1000])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87bec027524sm15720329241.0.2025.05.25.19.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 19:01:29 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: lossin@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v3] rust: revocable: Correct safety comments and add invariants
Date: Sun, 25 May 2025 23:01:25 -0300
Message-ID: <20250526020125.382976-1-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introducing a comprehensive `# Invariants` section for the `Revocable<T>`
type. This new documentation details the validity conditions of the `data`
field concerning `is_available` and RCU read-side locks.

The safety comments in `Revocable::try_access`,
`Revocable::try_access_with_guard`, and the `PinnedDrop` implementation
for `Revocable<T>` have been updated to explicitly reference these newly
defined invariants, ensuring that the justification for unsafe operations
is clear and directly tied to the type's guaranteed properties.

Reported-by: Benno Lossin <lossin@kernel.org>
Closes: https://github.com/Rust-for-Linux/linux/issues/1160
Suggested-by: Benno Lossin <lossin@kernel.org>
Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
---
Changes in v3:
- Refined the wording of the `Revocable<T>` invariants to be more precise
  about read and write validity conditions, specifically including RCU
  read-side lock acquisition timing for reads and RCU grace period for writes.
- Simplified the `try_access_with_guard` safety comment for better conciseness.
- Removed changes related to `RevocableGuard` invariants and its `Deref`
  implementation, as these are planned for a separate, future patch.
- Reverted `revoke_internal` changes (like `else` block for `revoke_nosync`
  and `swap` correction) to be part of a separate refactoring patch.
---
 rust/kernel/revocable.rs | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
index 1e5a9d25c21b..fed860ad2e60 100644
--- a/rust/kernel/revocable.rs
+++ b/rust/kernel/revocable.rs
@@ -61,6 +61,14 @@
 /// v.revoke();
 /// assert_eq!(add_two(&v), None);
 /// ```
+/// # Invariants
+///
+/// - `data` is valid for reads in two cases:
+///   - while `is_available` is true, or
+///   - while the RCU read-side lock is taken and it was acquired while `is_available` was `true`.
+/// - `data` is valid for writes when `is_available` was atomically changed from `true` to `false`
+///   and no thread is holding an RCU read-side lock that was acquired prior to the change in
+///   `is_available`.
 #[pin_data(PinnedDrop)]
 pub struct Revocable<T> {
     is_available: AtomicBool,
@@ -97,8 +105,9 @@ pub fn new(data: impl PinInit<T>) -> impl PinInit<Self> {
     pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
         let guard = rcu::read_lock();
         if self.is_available.load(Ordering::Relaxed) {
-            // Since `self.is_available` is true, data is initialised and has to remain valid
-            // because the RCU read side lock prevents it from being dropped.
+            // INVARIANT: `self.data` is valid for reads because `self.is_available` is true,
+            // and the RCU read-side lock held by `guard` ensures this condition is maintained
+            // during access.
             Some(RevocableGuard::new(self.data.get(), guard))
         } else {
             None
@@ -115,8 +124,8 @@ pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
     /// object.
     pub fn try_access_with_guard<'a>(&'a self, _guard: &'a rcu::Guard) -> Option<&'a T> {
         if self.is_available.load(Ordering::Relaxed) {
-            // SAFETY: Since `self.is_available` is true, data is initialised and has to remain
-            // valid because the RCU read side lock prevents it from being dropped.
+            // SAFETY: `self.data` is valid for reads as `is_available` is true and `_guard`
+            // holds the RCU read-side lock, adhering to `Revocable<T>`'s invariants.
             Some(unsafe { &*self.data.get() })
         } else {
             None
@@ -176,9 +185,11 @@ fn drop(self: Pin<&mut Self>) {
         // SAFETY: We are not moving out of `p`, only dropping in place
         let p = unsafe { self.get_unchecked_mut() };
         if *p.is_available.get_mut() {
-            // SAFETY: We know `self.data` is valid because no other CPU has changed
-            // `is_available` to `false` yet, and no other CPU can do it anymore because this CPU
-            // holds the only reference (mutable) to `self` now.
+            // INVARIANT: `is_available` is true, so `data` is valid for reads.
+            // SAFETY: `self.data` is valid for writes because `is_available` is true, and
+            // this `PinnedDrop` context (having `&mut self`) guarantees exclusive access,
+            // ensuring no other thread can concurrently access or revoke `data`.
+            // This ensures `data` is valid for `drop_in_place`.
             unsafe { drop_in_place(p.data.get()) };
         }
     }
-- 
2.49.0

