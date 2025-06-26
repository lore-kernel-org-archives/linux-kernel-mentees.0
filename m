Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1D42EAB75
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 26 Jun 2025 16:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750957185; cv=none; b=QQy4yyTsPPNjkGhmEaPcjfHicSaQHTaDrNUiDSs2t1m4sAJypT4ccWQ2eqfTRvvskKbpQRrt6ltqlh8HggmWPKF4nwZqBgOH2hBYyeqANDKShGCkzIgxaDR/BFlR00wTCOL7tgKkF9GHsSCbHBML+2dwEfRzlO2akbc5Bm5m9So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750957185; c=relaxed/simple;
	bh=OU6x6VbETaOVIzwd5uF6nknYiewnsXccFDvlJhynToQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J/amhEv1y3BimzCswLQq+rfQ9BA80mQrh3dDAAQoHwpQHdFjMIZwfb55KuCJR9JiLAt9psa6zuwrdl5fKy2Q4k+QBkcANo6/nHxyf7BRl4AEQbIIzRvoO+v6zvtM2wG4Q5qwokubQRDW/FTYvhmGxPz6Y2e7mohrf9PQcUTb9sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xc+vrMht; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xc+vrMht"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C7E740269
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 26 Jun 2025 16:59:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mPkJDDiR3i44 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Jun 2025 16:59:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DB27240261
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB27240261
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Xc+vrMht
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	by smtp2.osuosl.org (Postfix) with ESMTPS id DB27240261
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 26 Jun 2025 16:59:42 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-23694cec0feso14301645ad.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 26 Jun 2025 09:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750957182; x=1751561982; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XElJKsJMYyCt4pyabf2x9DrVn3d9y2TutbM81gC7OkU=;
        b=Xc+vrMhtJMwWvODnd99RrZE7AEEQ9E3I7aW8i7ypOtswUroqNdh1F03g2RKHxqNX1Y
         PJ9/NlRN0Ddd/SBZmuKZBI4/SCopxCBFej7lJgzAxu7k+svoaDUlBwfpSM8R5wVyUcAv
         2KIqofGmtUsoV+aDKa6H5n9Jn40tcEDwSP0aS68dUQyhKShsnWRQRcIRkx4vpvNpvD6F
         AbvJuQ052mbIOAInh2EcMupk2+LFJRypO9GgPZiHb9cjcaKJV46XAyaYMSgGSHSi2id1
         WmE4i0Lt6QDbgL3hXFzoVlDboAU7gbtBG8JGjjNmRjvJjlW4O1TeEiP8Yx/4MYjyxhJp
         jzqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750957182; x=1751561982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XElJKsJMYyCt4pyabf2x9DrVn3d9y2TutbM81gC7OkU=;
        b=aQ1Dbc8CFzcuamZ9AzCeDaOGJb7TgkOuy+ubrHgJt/Tad9aWALjN4A0BCNdP586Fms
         bl4xF5zDHVOyDiKA3pvRhoedqJ9YoQmkID1kGOcBs0/plHuamMF9xgSpizlEo/3zIck+
         L7a+V4USB2CmrhtyBBfgm83sE75wMl/cZ3FPXqerFYoCXQR7wbWpgvuL/Pq7TgDgjMTS
         XcP5FbO4r8QZ2BgrevLoRL+6Td2m7YJg8UFuckRlki07wzsYP/ec/tMsydisrYH3UYOt
         /N9hPqR8Cor2pIJlmCpLhMrN/Eqq5vMiGTqGnmWrt+U0Tr+SEo6eep5MTWQjrdtXJpfg
         3f2A==
X-Forwarded-Encrypted: i=1; AJvYcCUadPrYYvi2htyVkp7n8gRgaKnk1IHLY5leo9Wuyf5SjwBZMsoE3oi0OdK7d7+aY78N93ohuPfEbe2KUFK7+TLdJMRheA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyQLnbirVLzTG8wCfY1xa4jnISfzobDBx3dNl2CFCPqAxHlmDsS
	m4Px8SPO3rzCIfk7qOkTghJ2hRwGpUemMIciJoyz5BJso9lns8Ck9+J5
X-Gm-Gg: ASbGncu4aM/JKltlGLabq0UR1xheye/5UnUfl6vzBUlU2InAnGhMZIisqeD5QSH6aS6
	SPgEcPVGk+kGCQQ6Yd6oOXSd2BEXyjWp1Mbv9LvqS6MaxUGSqzi2s7Vl1iLxTPZYw2nUdTjAvFZ
	gHCdiovwrMmFOuI+YkKBR+Xmvr7Unhb/7mXxupk9Pkul/WVV3tWlBFYdXubzmqMBJwzLtbim8W7
	Indd39d5kgKff3EjjP2aEVJSwORjscXlk3cPW5koJAy1fKxpAcyiHwvp5F4cZcFKYctf2Z8pfFX
	P0SFeeBdC//4ErtulMpzHzs6LBpPYFGIuQDOUhRrOCRaA32t
X-Google-Smtp-Source: AGHT+IHOFzGeaZtBfYcp4KQ+qoTmWLdfgXS1rt/ESYHO7ndAeJaU6rwiu7EPC1M+9O2Tln1h3H5GYQ==
X-Received: by 2002:a17:903:4b0d:b0:234:a139:11fb with SMTP id d9443c01a7336-23ac4633b55mr706125ad.27.1750957182143;
        Thu, 26 Jun 2025 09:59:42 -0700 (PDT)
Received: from fedora ([2804:14c:64:af90::1001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23abe329b72sm2615195ad.80.2025.06.26.09.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 09:59:41 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v5 1/2] rust: revocable: Refactor revocation mechanism to remove generic revoke_internal
Date: Thu, 26 Jun 2025 13:59:26 -0300
Message-ID: <20250626165927.66498-2-marcelomoreira1905@gmail.com>
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

The revocation mechanism is refactored by removing the generic
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
 rust/kernel/revocable.rs | 48 ++++++++++++++++++----------------------
 1 file changed, 21 insertions(+), 27 deletions(-)

diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
index 06a3cdfce344..f10ce5c1ed77 100644
--- a/rust/kernel/revocable.rs
+++ b/rust/kernel/revocable.rs
@@ -151,26 +151,6 @@ pub unsafe fn access(&self) -> &T {
         unsafe { &*self.data.get() }
     }
 
-    /// # Safety
-    ///
-    /// Callers must ensure that there are no more concurrent users of the revocable object.
-    unsafe fn revoke_internal<const SYNC: bool>(&self) -> bool {
-        let revoke = self.is_available.swap(false, Ordering::Relaxed);
-
-        if revoke {
-            if SYNC {
-                // SAFETY: Just an FFI call, there are no further requirements.
-                unsafe { bindings::synchronize_rcu() };
-            }
-
-            // SAFETY: We know `self.data` is valid because only one CPU can succeed the
-            // `compare_exchange` above that takes `is_available` from `true` to `false`.
-            unsafe { drop_in_place(self.data.get()) };
-        }
-
-        revoke
-    }
-
     /// Revokes access to and drops the wrapped object.
     ///
     /// Access to the object is revoked immediately to new callers of [`Revocable::try_access`],
@@ -183,10 +163,15 @@ unsafe fn revoke_internal<const SYNC: bool>(&self) -> bool {
     ///
     /// Callers must ensure that there are no more concurrent users of the revocable object.
     pub unsafe fn revoke_nosync(&self) -> bool {
-        // SAFETY: By the safety requirement of this function, the caller ensures that nobody is
-        // accessing the data anymore and hence we don't have to wait for the grace period to
-        // finish.
-        unsafe { self.revoke_internal::<false>() }
+        let revoke = self.is_available.swap(false, Ordering::Relaxed);
+
+        if revoke {
+            // SAFETY: `self.data` is valid for writes because of `Self`'s type invariants,
+            // as `self.is_available` is false due to the atomic swap, and by the safety
+            // requirements of this function, no thread is accessing `data` anymore.
+            unsafe { drop_in_place(self.data.get()) };
+        }
+        revoke
     }
 
     /// Revokes access to and drops the wrapped object.
@@ -200,9 +185,18 @@ pub unsafe fn revoke_nosync(&self) -> bool {
     /// Returns `true` if `&self` has been revoked with this call, `false` if it was revoked
     /// already.
     pub fn revoke(&self) -> bool {
-        // SAFETY: By passing `true` we ask `revoke_internal` to wait for the grace period to
-        // finish.
-        unsafe { self.revoke_internal::<true>() }
+        let revoke = self.is_available.swap(false, Ordering::Relaxed);
+
+        if revoke {
+            // SAFETY: Just an FFI call, there are no further requirements.
+            unsafe { bindings::synchronize_rcu() };
+
+            // SAFETY: `self.data` is valid for writes because of `Self`'s type invariants,
+            // as `self.is_available` is false due to the atomic swap, and `synchronize_rcu`
+            // ensures all prior RCU read-side critical sections have completed.
+            unsafe { drop_in_place(self.data.get()) };
+        }
+        revoke
     }
 }
 
-- 
2.50.0

