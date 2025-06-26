Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977A02ECE8E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 26 Jun 2025 16:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750957187; cv=none; b=R/52YQXS5kD6ngCgqFCtUMRuQA4vwvrB6PgaJfZZZxf2N/n3ETMsgrxThBhj3PiHwT9QHtGK+0tR1k3aiKjoFOYEen69js/COWoXNlD0Ii5dc/bHLuyDHFKxb1yGH8qh1A+0DmhCUt9X8trHSRS38a6pxUUfPOR8NBa6muNG870=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750957187; c=relaxed/simple;
	bh=woQ7Ps6zyvRtD+WlXLhl9749tSlqBMx5iIjummqWtGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IYinjoGZlu+Qb9tY2wvf/wHlkQvk7e8Ldo0bIYhgrxREBVy3juQOx4u0AZpvHiyiU4MQw1qp6yFAeXoqUUnOZ4aW4f3aIfR2dEf8b/6rqxAnFQHW+uXeblS1TILfWnVDP66Yfrl+i3jyeYRW0dGg2+99EZJjTYKxVnG72l/VsKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MF2W6bkp; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MF2W6bkp"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31A348175A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 26 Jun 2025 16:59:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jn5ZUrFycnqW for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Jun 2025 16:59:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 75ACD81514
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75ACD81514
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MF2W6bkp
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 75ACD81514
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 26 Jun 2025 16:59:45 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-235d6de331fso18116715ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 26 Jun 2025 09:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750957185; x=1751561985; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+MqwhnBeaC4XpPLUvW23OFmerSzldciI6gEbfm50iZM=;
        b=MF2W6bkpYY5QEdsVFFM73jnznDHfpvXfofSWR9ToMpOVPaD9k/fDrKdrT7ny6FtU3R
         AihrjPsYUNCcJMu9AJmpFVgqnsqHWLwY096fObXu2XKmCZzi8IuhgViyYTZfDEmfcnCj
         GfxPLTXhR6afAWm26RZC/3vGc7MHVxeSgbuliI3fnvHf4YIoio2Bb+lhnuAkV2rCLAfh
         uxPf28DQd7EtpplKpIjvo4jVvRsG9gLLCLTgMfPTlTmSFQr81KjLnUPLXDS9xcMvuB0D
         /N6D95tGjZTI+9YbhPG2RPIPYe38qMox1Z+QTXMs0LOyrqWcMIo5VbyZ0guBR8JFZwWV
         s9Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750957185; x=1751561985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+MqwhnBeaC4XpPLUvW23OFmerSzldciI6gEbfm50iZM=;
        b=V8t9vGnbWUhP1fU2Dvc8Z6xH4hoEmDfGewFt0kGYPBScogoXIZ+tyXoNeJlwlmOYMe
         n+itMGz84/Rka1oC65y2NLic25qQDKPuXhEtQYwTkf8lEoAVEBwo7zYJiHmiOWmhFCTX
         QgFZZi4p/5Y5zg6TC/4XOcF5uY0fa/m/K4oRR/DlQ0ASlkzgpHNQg1tjsB7kkklRzTZi
         eBCQHAL99QfVfVec2yjF3qDXzcBd3ndjaTROT5+4uP/6sm07GN8zgMbJfyUUYwJVj9WQ
         /LRbSoPcEOGigznuZekjWtz/BHt/MrkTGf9a4VGLA6P2DEL8FpF17hrFSI7ABQjzIxLz
         JARA==
X-Forwarded-Encrypted: i=1; AJvYcCWurR2LqP/glQQp4aEMuat4+6j9FI0uL/Ve7Ia9nOKjXLIlMY9njYVWm4Z+PzoPtncGYsP0SDs086GvgUTvyOqPpqMkQg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzN8xCl/i4KCY05J0RDEJngA1OZgkzOvle6iWzTrAruVDgx63gW
	aUTE37LxVCwrPzHgXkLWTBVwdH/GeCWQj3n18YKvPx4UncLduRg7hPZR
X-Gm-Gg: ASbGncsIVJWUQktRLRysdbJ15ZHus2OW1q+IhEsMZVweBNH/6UfkQFHgGaM8TqbQ/Ls
	ojpS/5Pnxoucp6hc89z8Z+Rk7Eefb974UHN2KzoKjSE1/Xi0bcbrCYQsqy9jbAHBkrYmdMiJmRI
	3BvzmOVpIIFTBmJ8Kop4b3nTs375Bc2yyiDRzEZZVKwIal7aZIm1L7Jj3nEAL7R+C7PsaG+5Hqm
	3P/5NwEIdmX/MMhPo0mx4niep2EV1x2RIdEfsfhRnCDsywU+XrFTBNRV3jiwQ7GbGRP7iQq5RRY
	GYuHlla8c8RBt3FZCTUHZ3+/8xMtzPm2y2+pHfkNbVCanClp
X-Google-Smtp-Source: AGHT+IHx8R2JoJQnCwEUerphA5k8Y45YgrDDxrho1BCyWHdxn0mxwmrAutPMVaNzv7a2UBc5e1GwIQ==
X-Received: by 2002:a17:903:18c:b0:235:ca87:37ae with SMTP id d9443c01a7336-23ac4637152mr742295ad.41.1750957184779;
        Thu, 26 Jun 2025 09:59:44 -0700 (PDT)
Received: from fedora ([2804:14c:64:af90::1001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23abe329b72sm2615195ad.80.2025.06.26.09.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 09:59:44 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v5 2/2] rust: revocable: Clarify write invariant and update safety comments
Date: Thu, 26 Jun 2025 13:59:27 -0300
Message-ID: <20250626165927.66498-3-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250626165927.66498-1-marcelomoreira1905@gmail.com>
References: <20250626165927.66498-1-marcelomoreira1905@gmail.com>
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
index f10ce5c1ed77..88976c62e1ef 100644
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
+            // SAFETY: `self.data` is valid for reads because of `Self`'s type invariants,
+            // as `self.is_available` is true and `_guard` holds the RCU read-side lock.
             Some(unsafe { &*self.data.get() })
         } else {
             None
@@ -208,9 +217,10 @@ fn drop(self: Pin<&mut Self>) {
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

