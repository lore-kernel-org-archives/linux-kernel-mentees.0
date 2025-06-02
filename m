Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9E9347C7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  2 Jun 2025 01:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748826430; cv=none; b=ucLCVIvmP1cgXzeHWgZOjfO2aSsQZmUxnCvRzPFq9f74nKVrQaUOrlLDlLVqVpbWJevhT85ivqjAngnKPk0iN5l9UehFIx6S4NlHaE/7r2RDvYptxU5OoRWYiSSvNJ6W5mwsEB+jd69TncWuLW+0mvpOXFbzEKwAJ7X6+fLrC5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748826430; c=relaxed/simple;
	bh=8YiH47mBvhM8T4eHsYNmGvtYodf/ij/ko3pn8BGv74A=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=nU3SS9YMy1CvDPAnxyew/J6NpcCYoNHSsRvLs3xjy6ltE461F8/B9UsDUu78rb59YbQeJyrU63Gve+DVBmW8BQxTsL7pVSQY0qMRzU6F/buOIJWGZ9w/fDuRyWWi57Kh+ndMjYNQlsHwslX5MldWyFR66D8DWPx152YLkQ43Zhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SXP1pjq4; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SXP1pjq4"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77EDC40778
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  2 Jun 2025 01:07:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kd6cwGWSWOsY for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Jun 2025 01:07:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::92f; helo=mail-ua1-x92f.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 765DD40744
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 765DD40744
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SXP1pjq4
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com [IPv6:2607:f8b0:4864:20::92f])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 765DD40744
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  2 Jun 2025 01:07:07 +0000 (UTC)
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-87be2373596so990244241.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 01 Jun 2025 18:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748826426; x=1749431226; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uAI6wAKJyNcvB0GBjNCKRrM/BiS1UgH7rkbsuv1BwJs=;
        b=SXP1pjq45eZFzDbcWC4dQs7e62aazG/3wtppz3/k+35tC0tq1hVU9kVbZft6idhz1Q
         I2TA07Z5x8pjjEw460uMGznfJKqUdI7ngS3DN3A0G+eVaN8VC69PQk3wfXp7AqX/RPnk
         8lpOxnLnaDpTI+eaB/2cccHVSlbfeW+SB9uQC4xDJOYXGm91Z4MWdJL9DdlLjn28+T27
         kjyhphTl8QiDX/rbvOlHHS1+bkQqkCVLJVbdDdA+BxuEZCDZKal9HgqGGyVWCYkSFXrE
         9qpp/lmSWj2BoIrg8sbo5TPp8LTVLtMsEgMpLyah4C9IwF0/fCaPGYVNE/FLu29ZRymb
         66pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748826426; x=1749431226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uAI6wAKJyNcvB0GBjNCKRrM/BiS1UgH7rkbsuv1BwJs=;
        b=IkHmAJEYqQ39b9JEOpphMRQ5eMoD/97J+xX3IpVijx9mSZ95pPip/I+gKsSUFCV+cf
         RM2k+K8VVM/Z5dUD0NK5wDbOGy9yAsj/w7TNcGNVzLDEeKj+xtewq8ai9od0PnmI/cW5
         nVdMY8ch34xRYZs56OpirjYFtCflxPlcYVLaHUhVEBcvBliwnnKf5ZqcKJVhEK0+IGH5
         aSLvRx15R4bF0859wQvBIBnI+1SEtVZDvRAQUiYwZw4QAU+EchCW1zpHf74bGNzfAMDk
         QMFYV3s4eyJJslZJRVkKzbYZhfYsT4hovu3NcKDIgFUanHlopd9C3J9JGgnHtegUkb/y
         uk2g==
X-Forwarded-Encrypted: i=1; AJvYcCX1ZHkCJG5MAadNlmqBWt5+jIDg4pFYbDqkoE1U00V7tyF+SWjxyOcY6U4W7WH3dUP/m5Uv56rWUvoOrCtHwoHFxLp6lA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwSE8Hq7HbJeyPh7UsX681M9I5cQwr1kX6/Q/uDcf6tAmrHpKbM
	t7Kzh2zSD+NylWQwEaohkOkMkpvLqKYRuXZyuaPrY8J//+ItUxL+73pR
X-Gm-Gg: ASbGncvwJdojl0DZQYQ+WqKWOdibjntsUU7z11j1PCmJ+C56sCrN9DtKnFqi1Wtl3xZ
	3YrqIAYCkBPvg1ocKKN/Dbe0qDVL+Sj0mldn0SFDD5RgP0GltK2KBaLleogV5pLI97eIypV8cfQ
	vkKgPmrOAkrjdg6mrivjg+32smxQ8FDLL9zMzv7k6PZTTGaoO8mSV8u7CNlJmImbsFyw7a8b2Du
	UexDTEyId0QSAC74cl9jbDiwGkk0jXGwQw58MGQH/mqT4suXdf0tFGxmgYBQQPbBCM0SXLJ6trb
	LDtf13LZUlwc1avms4hJd9d7dg8QShRMAKkGFwQCVi+komnxcjU=
X-Google-Smtp-Source: AGHT+IEAnoC55EcwecdD9hTAHbo90RKJ6s2AbEJwmo3Ptzhr2plxvTA2uzfK90Cvl0CyvujGTA9+aA==
X-Received: by 2002:a05:6122:3bc1:b0:520:6773:e5ea with SMTP id 71dfb90a1353d-53084c639abmr7696022e0c.7.1748826425905;
        Sun, 01 Jun 2025 18:07:05 -0700 (PDT)
Received: from fedora.. ([2804:14c:64:af90::1001])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53074ad8b51sm6787844e0c.14.2025.06.01.18.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 18:07:05 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: lossin@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH 1/3] rust: revocable: update write invariant and fix safety comments
Date: Sun,  1 Jun 2025 22:06:59 -0300
Message-ID: <20250602010701.116503-1-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.49.0
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

