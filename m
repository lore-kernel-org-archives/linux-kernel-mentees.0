Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0700B288CBD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 26 Jul 2025 18:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753554972; cv=none; b=JxEHUPZn9SIjcFiWQxubfPcHIJTuZkjAnZ+VpShRzP5TbVXdXFKcO5wKBsSNyZp8gOaFe/TZgNp38CssBqKMzNQ4nqKDLKNVAfNqsnjyEj00yu3+tc4rsqdWgUPnaQUCRUKwfrp20MGgLy5zu9BBdhfcpi7TLPDIbG6/j8/Rf70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753554972; c=relaxed/simple;
	bh=1c6GV9bjG3BWxqcKocpW6fz62cs0Ni+OBYMNP4pw59w=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=td709mZYfxL5ojGyWZjDFXnCk3tE8BDhV2cLHv3xgo13WTmtmYK8gS3guqKLbLkkGheXk9aj5hxpNqx/2wRMqeCP5sYMAi1fZe3Q3eDW51jr2pEDnTWjitWEIOsW+1c/EeVIbyuWuoMty+1rsYfZXRP13QL4nZCBEya3vWbzH68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dThkLkyG; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dThkLkyG"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C7F440128
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 26 Jul 2025 18:36:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hZOSeKyzmeVs for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Jul 2025 18:36:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5ABB8400D5
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5ABB8400D5
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dThkLkyG
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5ABB8400D5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 26 Jul 2025 18:36:06 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-748e378ba4fso4020086b3a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 26 Jul 2025 11:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753554965; x=1754159765; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gazh6tcQ9w90L/jQB1ckIBFFEKclZCFtRbHi0RY4a+k=;
        b=dThkLkyGLkRRJbzgExN68POA2KPV1wLEJSKfppgmF8J8tk920JH58bl7w9IaY3PD/F
         khkQxkAHaUbH8RdR4OBaVO9C3Z1tT4jopcCOUmrLfXaMFtZPc98KrVdK1zpTZR3sPI0D
         FLV3QScC0482tZPVXX7TMOrBAp8j2GofWuJZFdGezYF06DgyLTYaNb2rF2HlcX7byhF3
         /GUa0OrWDsuFdeDdw0dBzCdCnQ9xW4eyF93tlX2v6ZkMUh9pDJvnjFoRfdJ/7TJZuaHG
         OZYuyU5LyvJJ9cR9R8+CYVbhbWEZZnltGdeHi28XAI3mhRbaOAFF0C7MuqpUntQlf4e3
         Qm/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753554965; x=1754159765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gazh6tcQ9w90L/jQB1ckIBFFEKclZCFtRbHi0RY4a+k=;
        b=HMrIf+WzvNAKTksPfrrCdll1O1avX2m9qyQQD3Ow2Y6XAXDJqwesWkKP9O+r0DpcLS
         Y7Ih9CqxLtFdZfRp7OiTLq9JML3XugHLKa8Tj3xesXOv6+E63OMKVYMgyasl//zZdOH+
         P7XSst/hANv6adMlyTR7qCCnPpl9PvDXkEpz9Dn4KYFKsPXWXavv7HCmNPJiwJzGB1ZT
         unub63k22hHZyi/z8Fqx4OhnGV6By1cxsfj8oJmeJuVm6jT98XZqhwaOX5Ui9O/r1CKB
         +GLzJvrRy+CVZmhzDaDDZTeo0Yi8hQ6qqj6O6S7w1z4+red5AvGegMKkyO1R/au/3TDk
         afOQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9lhmr+yo4dxWRVLAsAtY0+jrMwmF5TFkGOLmoJeEq08JFMvdrzohWw/x01mfQyaLJj0uxE8m37SXE6o9UlYPj+5Xjpw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzojaoFcQff8xI765VooGBFd9kjQe6rbyyvk6fs4maRQBiej6MR
	JW1IpaybNz5xH0T8qtHK3JqOWCd3FiyzimfToFJEGtahdvU5+MYmCvOx
X-Gm-Gg: ASbGncuyHaHacvoP8geFm50fCA3SDPxJe0b8BjiEMjLt1STotaroeFLVJ8mEYS9vaNr
	dVcVtjOCdu8D00YlkZDSjNa+FeHezGYbLgFhJAVrZ6jjbrvdzZ8eq9LscrhZ2XoSE3NTA1Uwjjo
	lPuwIQ091slZyx56U1wP6+Z/59hLrsox3QRB5NneiD9W4iMlBu7SBQMfr0l7pHFKN6F+/QSWUJb
	Tt9pB3XnirXeEA1o768YOFQafObcq4bIoY9/aDUspVtb3elUSGMtjn/82xRPooOgPzBGW5ekXdC
	DMNW+acxx1puqe4jZYAUWjxWpEsvjksa6lxCkiCL1qy6WTT6sZc014nAkIMvD5uT/Bqyb4FG2vv
	Q5CHbo98r
X-Google-Smtp-Source: AGHT+IG55CtyoAN9IFP4Oh/GdSiUwpHaPhrmoJ/1jaN/QB2uy6jUnnNNscYit5Sn3+ZKhvXbkbEFQg==
X-Received: by 2002:a05:6a00:92a3:b0:758:72b9:e5da with SMTP id d2e1a72fcca58-763349b9fa3mr7523184b3a.17.1753554965548;
        Sat, 26 Jul 2025 11:36:05 -0700 (PDT)
Received: from fedora ([2804:14c:64:af90::1001])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7640881ee75sm2169295b3a.2.2025.07.26.11.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 11:36:04 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: aliceryhl@google.com,
	lossin@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v8 0/3] rust: revocable: Documentation, refactoring and safety refinements
Date: Sat, 26 Jul 2025 15:35:00 -0300
Message-ID: <20250726183552.23098-1-marcelomoreira1905@gmail.com>
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
- Splitting the internal `revoke_internal` function into two distinct functions:
  `revoke()` (safe, synchronizing with RCU) and `revoke_nosync()` (unsafe, without RCU synchronization),
  now returning bool to indicate revocation status.
- Documenting `RevocableGuard`'s pointer validity invariants, making its constructor `unsafe`,
  and refining its `Deref` and `try_access` safety comments.

---
Changelog:

Changes since v7:
- Patch 3 (`rust: revocable: Documents RevocableGuard invariants/safety and refine Deref safety`) was refined:
  - The SAFETY comment in `Revocable::try_access` was updated, now clearly stating how `Self`'s type invariants
    and the RCU read-side lock together ensure `self.data`'s validity for reads.
  - The redundant line about the RCU read-side lock in `RevocableGuard::new`'s `# Safety` doc comment was removed.

Link to v7: https://lore.kernel.org/rust-for-linux/20250721010258.70567-1-marcelomoreira1905@gmail.com/T/#t

Changes since v6:
- Patch 3 (`rust: revocable: Document RevocableGuard invariants/safety and refine Deref safety`) was refined:
  - `RevocableGuard`'s invariants were updated to state that `data_ref` is valid as long as the RCU read-side lock is held,
    and the redundant RCU invariant was removed.
  - The `RevocableGuard::new` constructor was made `unsafe`, and a `# Safety` comment was added specifying caller responsibilities.
  - The comment in `Revocable::try_access` was changed to a `SAFETY` block, justifying the `unsafe` call to `RevocableGuard::new`
    by `Self`'s type invariants (`is_available` being true) and the active RCU read-side lock.
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

rust/kernel/revocable.rs | 88 +++++++++++++++++++++++++++++++++++++++++++++++++---------------------------------------
 1 file changed, 49 insertions(+), 39 deletions(-)
