Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A7014E2E2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  8 Jul 2025 00:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751934894; cv=none; b=dYbVXAzSrqslISrer7jqoH2/DoCCo/r4SEaR3Veqb9qcfVDcay5tfjtnrVs37mu5R8UVOyCj/cYCPPOSaxs9UFSKgwTfrBlvbg8cBFnnBU1E9yXem5ai8ZvoeX2LHO8ncRcfqs8ZPIHu6lxGLzHZy7l6X3U9yh9qtz+OVDaisEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751934894; c=relaxed/simple;
	bh=QiFIm59lLnxGJ6ccCD8dA6LHaxqwe2y+FKdZd6XIlEY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xjou6J6sbLUogGrCrgXqSbhDK0zLVUkXwxeJn4aj5PRSHwib3bhIIOw2cubppR9V03ArcKwOZN20T17AaU+Ou9sTx6ARruEfcd/AVZd4z/TeK0fQw3e234sdsNpUJ8STrHvV0gFUHhLEUdaybQ89RbbJmXQChpFvBbpWgJOAdyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GK/mFni8; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GK/mFni8"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF2DB417BF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  8 Jul 2025 00:34:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ytdt4cfh42dk for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Jul 2025 00:34:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::72e; helo=mail-qk1-x72e.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 50235417AB
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50235417AB
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GK/mFni8
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 50235417AB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  8 Jul 2025 00:34:51 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7d467a1d9e4so465760985a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 07 Jul 2025 17:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751934890; x=1752539690; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tSjMqbk17dPmnR6ku1sCl8XotAAIdcPvUToFf7TNFE0=;
        b=GK/mFni82LTdtQYjQMayDEje8gJ2rn3D46tCh+BRtblosUwY6XHXEUK3WEd0qsyDUv
         sI1uDXiZbVQcxuXSiYwjBbq5YdUojpXBKXshMlS/+f81QpQO/jAPE4Pe0XPYzGZFL8JD
         2mEVClcavak2TnrCdIOlzna2Q6NyeH7ZFKE4hdpUO8VzJFEGdgQchMa1L1N8SP+NUO0u
         BhHtHWZKdUw3Nzg9ECxXjeUcxcrJjuL2cVWbaXY4Bb9I39ogsVazywj8FrVPDyk9Zd0C
         Dw8zU70vPB2MjKxgcUEoCdYXS4xWvSZTqOIJgZstGN/pVhtWnqu79m3SxeBaslhxIg9s
         ZvUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751934890; x=1752539690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tSjMqbk17dPmnR6ku1sCl8XotAAIdcPvUToFf7TNFE0=;
        b=Xiu9hnmc+tJyfaMb12pZAW8o3mJpvWDiSowbsKl7rQpMc59wyvcaNa8nXmAS8K0MTW
         KsAx2QZbOgWubM/M9+HAiftCJBOV4Nt5ecq98OyH8ub9LUaCNyDbIejFsF+PlCpxNAQR
         oqErvODjfRyZ8nVK7KmzaRKqbtSpu+4FA0Gt4J1tjuXiTtTURGXWZKqYczQCY1RYE0dt
         PomYz0VzDif06oUU48FwYCVLarp/LIRYH5JCf6Yy+U5Lv7sNHdwlk6K6XcZs9wWMpLjO
         pzchpOA7+UuUfPrbKs+56e4B2ah22514FHiiqNaI1lXXnb1yIgBYV/+UYUx2NsDhcm8/
         S5uQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWjOK3tW/FyBZTtl6Q4aQ0TjalLuvsWZtrZZBdXhrJ46YKbeqmnJDtV4B9lhAA/GVOdcPLsdgwBvUGXaR0Ux3s01moYQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyUHW11raENIz+z2V6Ngme2fLzB0owuHmVKzcXo/1g+XQefQiVV
	f7LOGSwhMjQgx8sz2ENrttrnc2zD5BVERGblbtQW6enxwlYT9mlm8lc8koMa1hP9
X-Gm-Gg: ASbGnctpY8oO39vsfseFEGq11mLoK0pAAWTaboaDMuavyKlNTNkKJPLs6YZGouqZaB5
	yRhCHm+HnImPFC5kvRrRV5vWV0IV66fBMCEgt5jdA85YWsSWmwg+8Ei4/pjIucUlZ61dlRnZ8Fh
	gZhH0Z+A09FP3AIhI6MxokYtMJrKabot7/VYDYqOQqFK77ldVFXXfbB2lsUjWRBIEBm+3bCp8to
	z4MknTkZR5FOMGNNVwMh1ftdCr5P75VZ/QlKCv99/y2RUQPeHc8JOmKC7ToeAg3Eo9y5W0+EELT
	XYVdG0nZTP0jy4htc1adJFPAMBja1BaWH1d9Ckk3cMMISVWQC/6m25mqgAM=
X-Google-Smtp-Source: AGHT+IFfw5A/YtgsO1ZUEab6KMeNU7XYbVm06sMlTeugsLT3E2LwXpiPcozbfiBCeKct5KSvrRA40w==
X-Received: by 2002:ad4:5766:0:b0:704:78e1:5938 with SMTP id 6a1803df08f44-7047dd20b01mr11948836d6.13.1751934889846;
        Mon, 07 Jul 2025 17:34:49 -0700 (PDT)
Received: from fedora ([2804:14c:64:af90::1000])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4cc751esm68746076d6.23.2025.07.07.17.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 17:34:49 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: aliceryhl@google.com,
	lossin@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v6 3/3] rust: revocable: Document RevocableGuard invariants and refine Deref safety
Date: Mon,  7 Jul 2025 21:33:39 -0300
Message-ID: <20250708003428.76783-4-marcelomoreira1905@gmail.com>
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

Improves the `RevocableGuard` documentation by explicitly stating that
its `data_ref` member is a valid pointer as an invariant. Additionally,
the `Deref` implementation's `SAFETY` comment is refined to justify
the `unsafe` dereference based on this new invariant and the
`_rcu_guard` ensuring data accessibility.

These changes address feedback regarding the clarity and completeness
of `RevocableGuard`'s safety guarantees.

Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
---
 rust/kernel/revocable.rs | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
index 6d8e9237dbdf..64fe44b4f5a3 100644
--- a/rust/kernel/revocable.rs
+++ b/rust/kernel/revocable.rs
@@ -233,7 +233,8 @@ fn drop(self: Pin<&mut Self>) {
 ///
 /// # Invariants
 ///
-/// The RCU read-side lock is held while the guard is alive.
+/// - `data_ref` is a valid pointer to a `T` object for the entire lifetime of this guard.
+/// - The RCU read-side lock is held while the guard is alive.
 pub struct RevocableGuard<'a, T> {
     // This can't use the `&'a T` type because references that appear in function arguments must
     // not become dangling during the execution of the function, which can happen if the
@@ -258,8 +259,8 @@ impl<T> Deref for RevocableGuard<'_, T> {
     type Target = T;
 
     fn deref(&self) -> &Self::Target {
-        // SAFETY: By the type invariants, we hold the rcu read-side lock, so the object is
-        // guaranteed to remain valid.
+        // SAFETY: `self.data_ref` is valid for writes because of `Self`'s type invariants,
+        // and `_rcu_guard` ensures the data's accessibility for the lifetime of this guard.
         unsafe { &*self.data_ref }
     }
 }
-- 
2.50.0

