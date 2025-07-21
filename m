Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BB35383
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 21 Jul 2025 01:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753059795; cv=none; b=a4qzZqkM988PWYupkiWOndHmjW6rWZW7HDfYz+20mthCicf6X8A5RzWes2fKCAyIuz1lG5yIapY0dFansbwmXM+Ohn49999iXy67j/nERLC9aOcU562vhpqrkjDtZ4WLHZTHgE2QgtkcgHWTX97DdYCiwNJLVLZ68cu7GQ77q0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753059795; c=relaxed/simple;
	bh=RfFmtPtHUGNIb/ukSiLLorfqqYkuQjtsj9Tm69NKtR8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=SSeXWSzxZukhZ7ITPT+piY128G6gTfcdHJnMYwtUwVJ0Rg5Vg6pbp1iBtOn9jVNjhTcSHgrC80J58tGKkYxwI6MCiq5ZTgCcCqBTeNZdM1qSuh2RrvRRLekQuC301FjA8ei0MD57ein+hLMo23cUH5Ef8/5ftB+K4QoPZNWdyf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G931NPYG; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G931NPYG"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8873D41099
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 21 Jul 2025 01:03:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F51ns7-tydJo for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Jul 2025 01:03:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::22a; helo=mail-oi1-x22a.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 995D041972
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 995D041972
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=G931NPYG
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 995D041972
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 21 Jul 2025 01:03:12 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-41b7d1240d8so847124b6e.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 20 Jul 2025 18:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753059791; x=1753664591; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1rea/To6fXDQVYU/8MJe/96jxwLUdCJPSV8UceNn4yQ=;
        b=G931NPYGtPDhHaizlbVNuXCeyPbyqJOZ7fTOXtu3e5Hc3ADw2aVlziKmv1Irfna9Ip
         In0V/Fz2q4HYczQ8T2c3j4JQysvw6duu5NQOvzVf+fggR1PeGiMADgeUaa3Dn1grJeLZ
         SfV8lV3utMm2TvNc1pFnAmx3ThLhqbxp6AtXqogc+nSi6Kgtq4C8thH/YHPzIdzdUR6Q
         j+tDyal712VTIj9hs83VD8j7Nleg+7j+9Qz5tyOA6iujMUJ59MMidNQzhOtHSxj/zX8c
         R2E0CK8HCfFWJO2AVFKKQ2RFbU/8xVZzmMR0YLv8yx4jKMMHSlwjuW1O+VorcAGAKlm5
         /XlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753059791; x=1753664591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1rea/To6fXDQVYU/8MJe/96jxwLUdCJPSV8UceNn4yQ=;
        b=nBG6C5L04b5TmSE4BPIuW+j/sH1Y7WQmQMnx0wL9e+1GbQFrkRj4M6lmpaGFjyFOLu
         P6zBFcREkCbDHBrqjaWgHDLBU83d5JWTQhYMU8gsmWKEnSmTbUD1Q8WH2Uezrle5iAtv
         rda45w/UPQsUxuNOvDdDzb8wcATTJedC4x8EH4tlI56CRVi3MOhEKirCi4QJ3dr+mdsd
         IxVKF/3vi2trQJWs5rI/gjQ0F+xQgAoMCSB6xFwZxjbLWwrOLVbKRazmMAWyP2QPjIsI
         LCk7ztO5hJRluGTSAzM6EFMUfUZiFWq7ZkAjqsi2XFRXvS9KIDGqHPLFaQum2+dh8/oU
         3HJg==
X-Forwarded-Encrypted: i=1; AJvYcCV142IMtZV+bH1rPzwwV0+d0p5hiTqaJ6SxBq0L6bOySkaCQkGZTo2rLOfgEACVg/gBbAm1fJ0hGiLuNso39h2Ycbrf1Q==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzjoqkgrK1Y59tTMd3/8IwO1GxPapWMehHiJhG6PRSo2L3Z0bjv
	Wxwy7AnGgsjae/zCBFI+mGMs0nhhhztIKUekfi4PJb0eTDKvXB0MF1s4
X-Gm-Gg: ASbGncsgTa1ejNuBl46C10X70Zx8RPSUOi723RsZ0DjsnsJvZgI6kEZs7CbEJxuY3Er
	uHCJhSIj2ZZd/5/1NM3eM3/udgnqGUxz+y1JXcAPgYFwzQTWxxeH5jAxhMFqUNkCV5N4TQW/Zkd
	TpuMkl1AZ7PHr8MK5oTDt9t/k5my/p0Jqe+o8G99nk0bsCzSrK1ovm61/93UtXSGskKGVgmHOrd
	I7K24nRB6qod47tQuSClptzWbNG9/4FYSIcstKPIERsD5SlYLuZ5xmCEkYnsCOoDEheCrZpgYR0
	CEElTT+QDr/7UZQ6vy7zbBoHmiT1v+X7FEfVLqiER/dJ6Ec6EewCXWasHuYub3V1FZqD5XGp7fj
	I2pIe7B2e
X-Google-Smtp-Source: AGHT+IHpSZNNCup2Vf6Hfpq6TLEOnKfKE4SHREM0lZxmTPFr17sNnUMv51ZnN+/b16fW+a31c9XYCQ==
X-Received: by 2002:a05:6808:1807:b0:40b:9948:f2a9 with SMTP id 5614622812f47-41cee084e3cmr10196894b6e.11.1753059791249;
        Sun, 20 Jul 2025 18:03:11 -0700 (PDT)
Received: from fedora ([2804:14c:64:af90::1000])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-615bcc8c2dbsm1436959eaf.20.2025.07.20.18.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 18:03:10 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: aliceryhl@google.com,
	lossin@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v7 0/3] rust: revocable: Documentation and safety refinements
Date: Sun, 20 Jul 2025 22:01:52 -0300
Message-ID: <20250721010258.70567-1-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series brings documentation and safety refinements to the
`Revocable` type, addressing recent feedback and improving clarity of
`unsafe` operations.

Changes include:
- Clarifying the write invariant and updating associated safety comments for `Revocable<T>`.
- Splitting the internal `revoke_internal` function into two distinct,
  explicit functions: `revoke()` (safe, synchronizing with RCU) and
  `revoke_nosync()` (unsafe, without RCU synchronization), now returning
  `bool` to indicate revocation status.
- Documenting `RevocableGuard`'s pointer validity invariants, making its
  constructor `unsafe`, and refining its `Deref` and `try_access` safety comments.

---
Changelog:

Changes since v6:
- Patch 3 (`rust: revocable: Document RevocableGuard invariants/safety and refine Deref safety`) was significantly refined:
  - `RevocableGuard`'s invariants were updated to precisely state that `data_ref` is valid as long as the RCU read-side lock is held,
    and the redundant RCU invariant was removed.
  - The `RevocableGuard::new` constructor was made `unsafe`, and a detailed `# Safety` comment was added specifying caller responsibilities.
  - The comment in `Revocable::try_access` was changed to a `SAFETY` block, justifying the `unsafe` call to `RevocableGuard::new`
    by detailing `Self`'s type invariants (`is_available` being true) and the active RCU read-side lock.
  - The `Deref` implementation's `SAFETY` comment was refined.

Link to v6: https://lore.kernel.org/rust-for-linux/20250708003428.76783-1-marcelomoreira1905@gmail.com/T/#t

Changes since v5:
- Reordered the patch series to apply documentation fixes before the
  refactoring, as suggested by Benno. The new order is:
  1. `rust: revocable: Clarify write invariant and update safety comments`
  2. `rust: revocable: Refactor revocation mechanism to remove generic revoke_internal`
  3. `rust: revocable: Document RevocableGuard invariants and refine Deref safety`
- Added a new patch, "rust: revocable: Document RevocableGuard invariants
  and refine Deref safety", which explicitly documents the validity
  invariant for `RevocableGuard`'s `data_ref` member and refines the
  associated `Deref` `SAFETY` comment, addressing specific maintainer feedback.
- Updated the `SAFETY` comment in `Deref` implementation of `RevocableGuard`
  to match common kernel patterns.

Link to v5: https://lore.kernel.org/rust-for-linux/DB3XFMG7M4SO.J6A2LVOAOJDX@kernel.org/T/#t

Changes since v4:
- Rebased the series onto the latest `rfl/rust-next` to integrate recent
  changes, specifically the `bool` return for `revoke()` and
  `revoke_nosync()`.
- Dropped the "rust: revocable: simplify RevocableGuard for internal
  safety" patch, as the approach of using a direct reference (`&'a T`)
  for `RevocableGuard` was found to be unsound due to Rust's aliasing
  rules and LLVM's `dereferencable` attribute guarantees, which require
  references to remain valid for the entire function call duration, even
  if the internal RCU guard is dropped earlier.
- Refined the `PinnedDrop::drop` `SAFETY` comment based on Benno's and
  Miguel's feedback, adopting a more concise and standard Kernel-style
  bullet point format.

Link to v4: https://lore.kernel.org/rust-for-linux/DAOMIWBZXFO9.U353H8NWTLC5@kernel.org/T/#u

Changes since v3:
- Refined the wording of the `Revocable<T>` invariants to be more
  precise about read and write validity conditions, specifically including
  RCU read-side lock acquisition timing for reads and RCU grace period
  for writes.
- Simplified the `try_access_with_guard` safety comment for better conciseness.
- Refactored `RevocableGuard` to use `&'a T` instead of `*const T`, removing its internal invariants and `unsafe` blocks.
- Simplified `Revocable::try_access` to leverage `try_access_with_guard` and `map`.
- Split `revoke_internal` into `revoke()` and `revoke_nosync()` functions, making synchronization behavior explicit.

Link to v3: https://lore.kernel.org/rust-for-linux/CAPZ3m_hTr7BN=zy10m8kWchYiJ04MXKuJAp9wt67Krqw6wH-JQ@mail.gmail.com/

Changes in v2:
- Refined the wording of the `Revocable<T>` invariants to be
  more direct and address feedback regarding the phrase 'must occur'.
- Added '// INVARIANT:' comments in `try_access` and `try_access_with_guard` as suggested by reviewers.
- Added the missing invariant for `RevocableGuard<'_, T>` regarding the validity of `data_ref`.
- Updated the safety comment in the `Deref` implementation of `RevocableGuard` to refer to the new invariant.

Link to v2: https://lore.kernel.org/rust-for-linux/CAPZ3m_jw0LxK1MmseaamNYhj9VY8AXtJ0AOcYd9qcn=5wPE4eA@mail.gmail.com/T/#t

Marcelo Moreira (3):
  rust: revocable: Clarify write invariant and update safety comments
  rust: revocable: Refactor revocation mechanism to remove generic
    revoke_internal
  rust: revocable: Document RevocableGuard invariants/safety and refine Deref
    safety

rust/kernel/revocable.rs | 93 ++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------------------------------
1 file changed, 54 insertions(+), 39 deletions(-)
